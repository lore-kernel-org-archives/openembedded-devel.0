Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E97C433F5
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 09:08:51 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web11.6823.1634807329627540561
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 02:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SPAZBRH/;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634807327; i=@fujitsu.com;
	bh=koPBnIWepfT3qFHSq79dcpPKH5yTEFx88Ak2S3BfDzg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SPAZBRH/wfsYhq0jWScFwzYTK2QXPpK5+4vHqvgtm7jSvOQIaI6Re7FUnHCoBQPSf
	 rUCutjFxjhXLixWG7ELUFzHstebykoa/R/LcyLtf7TH73FyOgyq6M/BwFZ6kiPO+b4
	 eUyUsx1C/Tqin9xzhmbIk0NyCo85zg1aQWYUDNu5YuNejRZwI0NskC93DOk5flwETf
	 Qx5+LPQ4dkGgHGHP0uvZ76M9shcjlIoqVHgo0emeaJPjeozrlTpw+Rv9Bx9lwR1eZn
	 l7DdWKEhqdRdaYEF45PCAA7GZnFe7NJbod4eJPZkKtRgrC/tiVAkREqN902fVYrp9/
	 i6podaBWMv/og==
Received: from [100.113.7.241] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 88/6A-09058-F1E21716;
 Thu, 21 Oct 2021 09:08:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI0ZXRK0w
  0uHfEwuLi4aXMDowe5zauYAxgjGLNzEvKr0hgzVj60rbgJlfF++Z/TA2Mjzm7GLk4hARmM0ns
  PXabHcI5wSjx7l8HUxcjJwebgI5Ex4tuFhBbREBfYunsPcwgtrCAn8SZjWcZQWwWAVWJG7eOs
  YLYvAJuEk0tO8DqJQQUJKY8fM8MEReUODnzCVicWUBC4uCLF8wQNYoS23eegaqvkHh9+BLzBE
  aeWUhaZiFpWcDItIrRMqkoMz2jJDcxM0fX0MBA19DQWNdM19DCTC+xSjdJL7VUNzk1r6QoESi
  rl1herFdcmZuck6KXl1qyiREYSCmFbLt2MH5+/UHvEKMkB5OSKK/Or4JEIb6k/JTKjMTijPii
  0pzU4kOMMhwcShK8O9ULE4UEi1LTUyvSMnOAQQ2TluDgURLh9VcGSvMWFyTmFmemQ6ROMSpKi
  fO+kwdKCIAkMkrz4NpgkXSJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvbB2gKTyZeSVw01
  8BLWYCWlxgUQCyuCQRISXVwFRyae+9ZttsqWJRW5/irqMCrdebTdaKmWT/+tcUm/aA91vyhcz
  jZ5M5frXUb7z/Y+rPdzM7Fl2wOReeE+pRP5VTbH3M9d9Z24+vNlQRnVicOcVeZI6hxB653i7l
  BG7veBYdrqXHdf+J7JgWGH9hnf7uD6sXmU1Zz/bmg1fjV4cdoZO/6n+eITlDyi7oT7oy964JH
  MWz3U4d1lr069QtduG/tSECbEUbi/7Uv20TLpOqTpvrsjnZpcnX4ZzuQc2NgpEJjI8f1nR7v7
  uzfH/iPdaK1KNxb9cufhG54+m6ZVfa9wryPS+Ryy6xdDP30zm7/+UFj8B0hf7pevZJBff/1y0
  wuOvEIpD9hTF1vch5fSWW4oxEQy3mouJEADWgXlAfAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-238.messagelabs.com!1634807320!664113!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20934 invoked from network); 21 Oct 2021 09:08:43 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-7.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Oct 2021 09:08:43 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19L98ZWF026506
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 10:08:40 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Thu, 21 Oct 2021 10:08:33 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-cachetools: upgrade 4.2.2 -> 4.2.4
Date: Fri, 22 Oct 2021 05:08:26 +0800
Message-ID: <1634850506-4426-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Oct 2021 09:08:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93510

v4.2.4 (2021-09-30)
===================
- Add submodule shims for backward compatibility.

v4.2.3 (2021-09-29)
===================
- Add documentation and tests for using ``TTLCache`` with
  ``datetime``.
- Link to typeshed typing stubs.
- Flatten package file hierarchy.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...{python3-cachetools_4.2.2.bb => python3-cachetools_4.2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_4.2.2.bb => python3-cachetools_4.2.4.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_4.2.2.bb b/meta-python/recipes-devtools/python/python3-cachetools_4.2.4.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-cachetools_4.2.2.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_4.2.4.bb
index 58994d709..1040dc7e5 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_4.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_4.2.4.bb
@@ -27,6 +27,6 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
-SRC_URI[sha256sum] = "61b5ed1e22a0924aed1d23b478f37e8d52549ff8a961de2909c69bf950020cff"
+SRC_URI[sha256sum] = "89ea6f1b638d5a73a4f9226be57ac5e4f399d22770b92355f92dcb0f7f001693"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


