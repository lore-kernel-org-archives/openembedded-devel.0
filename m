Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DEAFA3740
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 02:07:27 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.1626.1667268441025560142
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 19:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=p6v1w4dU;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667268439; i=@fujitsu.com;
	bh=UbL8NSfuXIXhf9HqEulOcoA13cCOEruBXQ01O4zL4MU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=p6v1w4dUl4DlFCp+0WhXNSHQH9cG9vVy0ZtRIThXOgXZcLNjLKf4kVR9tN9GqsvpE
	 XK0JtLTdITKFb4aXepj4Xb0Qhf0+QJK9fXB7HtulPxMi8p8yEGUQpeRuxsB7fzl4B1
	 a90SyxqHFwWx9WdMXBViST9jkAP2TXsTjM37sBK/nCrUw6N0xErgtKFBBUnnT+3rez
	 urM6LiZxYMh1KmSRhvU9HWGUV+Kuevgnl6JYiSpEHfI1Vu2Dj3rV1L7++9AXM5baaL
	 loubU0AZIjFK3Id8mtzphkSdNzrawUjKUNAqMiSLog/g0PwpT6nTg5gq8s2FoVJCvM
	 FgchQRRWBv/Fw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8ORpBtWn5B
  scOOiqMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrH560+mgtOcFZ+uTWNrYHzP0cXIxSEk8JBR
  4m3nHEYI5wqTRMfxrSwQzm5GiWmv1jF1MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  3sXIweHsIC3RNNcF5AwC1B415kfrCA2r4CjxNZ93WC2hICCxJSH75lByjkFnCSWPsgHCQsBlX
  Td3sYMUS4ocXLmExaI6RISB1+8YIZoVZSYfbmZBcKukJg1q40JwlaTuHpuE/MERsFZSNpnIWl
  fwMi0itG8OLWoLLVI18hAL6koMz2jJDcxM0cvsUo3US+1VDcvv6gkQ9dQL7G8WC+1uFivuDI3
  OSdFLy+1ZBMjMHhTipMSdzD2Lfujd4hRkoNJSZT3v0RCshBfUn5KZUZicUZ8UWlOavEhRhkOD
  iUJ3sgaoJxgUWp6akVaZg4wkmDSEhw8SiK8v6qB0rzFBYm5xZnpEKlTjJYcU2f/28/MsRxMzv
  zadoBZiCUvPy9VSpzXqRaoQQCkIaM0D24cLNovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBL
  mbQC5iiczrwRu6yugg5iADmJrjwM5qCQRISXVwNTyU+nz+cUX3Ixy/Q5uatte+dF898yAFRO+
  6d2Vv6fbtZuFp8HmbpZ9Y8p6W6V25yvFSkvqloSkzr3zoYdjL+95/5y/n541LGS2m31+z4v1J
  ivmyxieXcl0Y4fRb734Sb5Pb54P1nx5syBw+gGreS1iep++pdQ+/THP88rZs0HeEn/EJ07+U5
  shlHNI4gv7bbkJVuxxTuxNidrrY6TPpsyesEPxxOELHecXfNIoTo8+uK9GWlbfZ/brDAaND5I
  81msrVoj84ja+I6/zZlobn93NSRtOLnz0opPz9Zyb/bteBIv/T4pRmPBj1xO52StZL06/bbNl
  7b3e68VSfG8neFXMkpytma/w0Fw2zUJ7z4EyJZbijERDLeai4kQAqntfCHEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-745.messagelabs.com!1667268438!191519!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29388 invoked from network); 1 Nov 2022 02:07:18 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Nov 2022 02:07:18 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id CFDE51AF
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:07:17 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id C4AC51AB
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:07:17 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 1 Nov 2022 02:07:16 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-jsonref: upgrade 0.3.0 -> 1.0.0
Date: Tue, 1 Nov 2022 10:06:48 +0800
Message-ID: <1667268408-9931-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667268408-9931-1-git-send-email-wangmy@fujitsu.com>
References: <1667268408-9931-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 02:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99386

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-jsonref_0.3.0.bb => python3-jsonref_1.0.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python-jsonref/{python3-jsonref_0.3.0.bb => python3-jsonref_1.0.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.3.0.bb b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.0.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.3.0.bb
rename to meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.0.0.bb
index 4daaf521fc..caa8b60250 100644
--- a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.3.0.bb
+++ b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gazpachoking/jsonref"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a34264f25338d41744dca1abfe4eb18f"
 
-SRC_URI[sha256sum] = "68b330c6815dc0d490dbb3d65ccda265ddde9f7856fd2f3322f971d456ea7549"
+SRC_URI[sha256sum] = "db1ab1faa75a5ffaa2693104a7deb23471c716fb2edc4db27b7408bf90dff157"
 
 inherit pypi setuptools3
 
-- 
2.25.1


