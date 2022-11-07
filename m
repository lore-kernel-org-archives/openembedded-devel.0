Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C09EC43219
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:36:50 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.1192.1667810203076875794
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:36:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iBorQYED;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667810201; i=@fujitsu.com;
	bh=vbnRdSdKbs0GQAfaiLz5ZRZxCeTxOGy+I82T1RVmRvY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=iBorQYED8MzwpGxN+5VHqaYm/dapEwLbU4vzM6QD/iagzq4hDDnIX/WMhuXhovCwk
	 eavPQjx7bx0Vn0QuQD8BCBX0Bpb7R8WkeXdCOu08HSy4BERJjlKsxoaVqbxUJXbXnF
	 etCT0I2gX93TYfSA9fpoG/oTvgaHAWGJr9/0qCWcFBd6+Zyss/t+l7qGVyadtEbnaF
	 wpln5xpqizChRyh32sIrks7JS0mTtOh8ZF/KkOAdxsm+JECXw8PxCQIcB82Wh6k13M
	 Wawj420cAotVQJZaD5CAAr2yEj3Nd6VvsBnjoMz3YGzdcTl7ZbiYfBBNwvMvKFUegr
	 7QILeGZ984xww==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpDvjcEa
  ywdzjJhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8afSRNZCw5yV5zt+s7WwLibq4uRi0NI4CGj
  xN+DH1i6GDmBnCtMEjN/uUIkdjNKfP7azAiSYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1ggUGLGpQ1gNSxA8TP988BqeAWcJNZt2g1mSwgoSEx5+B7M5hRwlji3dQ8bxGIniZvPp7
  ND1AtKnJz5hAVivoTEwRcvoHoVJWZfbmaBsCskZs1qY4Kw1SSuntvEPIFRcBaS9llI2hcwMq1
  iNCtOLSpLLdI11ksqykzPKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J0ctL
  LdnECAzelOL09TsY3y39o3eIUZKDSUmU9/fyjGQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErw3N
  gLlBItS01Mr0jJzgJEEk5bg4FES4WUHRpMQb3FBYm5xZjpE6hSjLsfMr20HmIVY8vLzUqXEea
  /tBioSACnKKM2DGwGL6kuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHkjDwFN4cnMK4Hb9Ar
  oCCagI6oL0kCOKElESEk1MDnNn3h9pkt3Py9H4KvZHW3vJMpDr6cuXmsV/4ih+PPEGTF3n18s
  ufrojNHxhpMnDm4XcwrovP3Uaq2p0rbMPb1SibME0xje/+FUchZh+Gojtrfjxd09Jh/n1HlEJ
  C/fGGM7s7q0at7sKN6S8iOv+lhWJKucNznQd39Os9dRVvtj+1NcZ88KbJ8Wci+F60WO+Hmuys
  nT7eZac3sWLvdxOpArtuZ7XFBDY/z1xJ09e29EV3rv/Ptu/4odixim8jyY13HiyC3dJXu9HEW
  2SN58tL7i3sGNqQnsJhwTXZfM+3Az2br8b9n/5crn4n4+ajedp5At/NGr+ZT4s8Nnnb8ti7cr
  Wv/Tyerr5hSPXROf5oopsRRnJBpqMRcVJwIASOhxDGUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-728.messagelabs.com!1667810200!220467!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12229 invoked from network); 7 Nov 2022 08:36:40 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:36:40 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 33B291AD
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:36:40 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 28B121AC
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:36:40 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:36:38 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.13.0 -> 2.14.0
Date: Mon, 7 Nov 2022 16:36:16 +0800
Message-ID: <1667810179-31041-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667810179-31041-1-git-send-email-wangmy@fujitsu.com>
References: <1667810179-31041-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99463

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Features
----------
    Add token_info_url to external account credentials (#1168) (9adee75)
    Read Quota Project from Environment Variable (#1163) (57b3e42)

Bug Fixes
---------
    Adding more properties to external_account_authorized_user (#1169) (a12b96d)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.13.0.bb => python3-google-auth_2.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.13.0.bb => python3-google-auth_2.14.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.13.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.14.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.13.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.14.0.bb
index 9e4129b6b..a32a78e69 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.14.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9352dd6394093169157e6971526bab9a2799244d68a94a4a609f0dd751ef6f5e"
+SRC_URI[sha256sum] = "cf24817855d874ede2efd071aa22125445f555de1685b739a9782fcf408c2a3d"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


