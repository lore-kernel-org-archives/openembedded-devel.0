Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3A7C6379F
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:22:52 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.191333.1673940171508445112
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:22:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=s//YwTID;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673940169; i=@fujitsu.com;
	bh=fbsWb0TxATdfbl59Ww9gJPZJmukhV/zIPHKz4r+QGfQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=s//YwTIDxUmtwj9iMf5L7kxm7aDrqh3L0q2Pynd+wV46g0QFhRt9LgjbxZ/dDn4eJ
	 Ipl70jwAakJ+NF2PxJXVX3YvJrIyJfspk065cLnMhYQ6GBWG5G1b6lDoJK5t+3VGKL
	 FbJXG1XLhEK4wc1GbHPdo9v4VG8Vc+TYWI+QNTY6Jkc4eXzj0FQ1jedbqNzbFew5tu
	 May1UwuSqcOQlsECuQoXJlm/0HiZFU1XzB7ggnvvM20RZVzWlaNrOjnhym6x/IflV1
	 Zl671LX7h0/agc3ui6wnJZfATjG+EXOSANFwaW5nKEGZw5eNI4CQMJZvV3/UZkw0ha
	 30L+57NLhpKzg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORpHvC51i
  ywbpZVhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aZzfuYC/7wVOzc+oelgfEadxcjF4eQwENG
  iU+XDzBDOFeZJK4ca2KFcPYySrQ828bexcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  WA1wgKBEl+e/QKrYRFQlZh76SRYDa+Ak8TLe0vAbAkBBYkpD9+D2ZwCzhIzDj9nBbGFgGr+HX
  /JAlEvKHFy5hMWiPkSEgdfvIDqVZSYfbmZBcKulGj98AvKVpO4em4T8wRGwVlI2mchaV/AyLS
  K0bw4tagstUjX0FAvqSgzPaMkNzEzRy+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4Mjc5J0Uv
  L7VkEyMwgFOKU813MH5f9kfvEKMkB5OSKO9J02PJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4T
  3kB5QSLUtNTK9Iyc4DRBJOW4OBREuENtwRK8xYXJOYWZ6ZDpE4xKkqJ8x72BkoIgCQySvPg2m
  ARfIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK8jyBSezLwSuOmvgBYzAS32KDkKsrgkESE
  l1cAk57uVvf7irp/m3/fuf7/tVeti5QdnVn4V8999cIl+ucZt5is/uRYza8+88W3nZh6T8xPy
  xKOr9FZUd89SEXn8RWRWNPf+bpeTNuwJtf2JbRYPZMKaLF13S/nP8vh+rFuEb+OTHYsyXqoYH
  cuxep+zVXbOvs/hYu91O1ilzHf6Ga9tm/Pg7JSj30/ZmrbZ7r7IsviJj9jPBd2zt85Md/qQsv
  Za/PWJN7L3L/o9uevvM0mPy5cPPH3bt3SLQ5Ijy4l81w8KG81P9jzOWvVynrIku+xWwZSfvxL
  ENbtvp3IGJRwqiNzedG1X79vllzueaJ9Y/uhO1Bc+KeWTGn5+iqcz01/Eldxq4JaUXRRQ4FOc
  qcRSnJFoqMVcVJwIAGpawFhbAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-732.messagelabs.com!1673940168!161897!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15707 invoked from network); 17 Jan 2023 07:22:48 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:22:48 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 6AD461AF
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:22:48 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 5F0211AC
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:22:48 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:22:46 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.15.0 -> 2.16.0
Date: Tue, 17 Jan 2023 15:22:04 +0800
Message-ID: <1673940124-20377-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673940124-20377-1-git-send-email-wangmy@fujitsu.com>
References: <1673940124-20377-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100618

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Features
--------
    AwsCredentials should not call metadata server if security creds and region are retrievable through the environment variables (#1195) (5e27c8f)
    Wrap all python built-in exceptions into library excpetions (#1191) (a83af39)

Bug Fixes
---------
    Allow get_project_id to take a request (#1203) (9a4d23a)
    Make OAUTH2.0 client resistant to string type 'expires_in' responses from non-compliant services (#1208) (9fc7b1c)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.15.0.bb => python3-google-auth_2.16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.15.0.bb => python3-google-auth_2.16.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.15.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.16.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.15.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.16.0.bb
index 315d0aa8a..07dc8d045 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.16.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "72f12a6cfc968d754d7bdab369c5c5c16032106e52d32c6dfd8484e4c01a6d1f"
+SRC_URI[sha256sum] = "ed7057a101af1146f0554a769930ac9de506aeca4fd5af6543ebe791851a9fbd"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


