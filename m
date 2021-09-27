Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3833C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 09:19:48 +0000 (UTC)
Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com
 [195.245.230.83])
 by mx.groups.io with SMTP id smtpd.web11.28679.1632734387209003403
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 02:19:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vTMCnu/y;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.83,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632734385; i=@fujitsu.com;
	bh=+J32FLUBXGnvgCUqabyYpDyt+AIAEaiOzt1zTmuksx0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vTMCnu/y7mem6lbmtDzVsgxr0m+azHJo0zl8sQFd6p6OD2aL0bipXj9chFYknlZY0
	 /UIBBhH/sEpNGe8f2PR6L+ibnOS+f1KP6O3Xc5yJ5fAOMoNsx3SIGBdib4Ss/qOpa4
	 OIM6pI4EaUAC3bjC05mbW0vA/a6yf3vvti+kpFkMPZQ+lkAyiRaYXg/JwTIuo7x2xn
	 e0r/DoBHTrY6o7H6xbwmEoXRooax8BxN0z10G0jv4wTIRfvWvqiD6NttMpZL25UXzS
	 m+gn8eiXg5q7d9EgZp6nz6L/2y8m/cfWSX2/kRGTFTkayl0OpvS7FnXZFlIn4w+Agn
	 egC01bV6hvBag==
Received: from [100.112.199.201] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 99/7B-25352-0BC81516;
 Mon, 27 Sep 2021 09:19:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MRqruhJzD
  RYGa3psXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnF1wRa2gkPcFW/W9zM2MG7n6mLk4hASmM0k
  8enLUSYIZw+jxJm5p1m7GDk52AR0Jc49XssOYosI6Essnb2HuYuRg0NYwEPiwCxVkDCLgKrE2
  g/LmUFsXqDw2V1XwcolBBQkpjx8DxUXlDg58wkLiM0sICFx8MULsDESAooSs6fLQ5RXSLw+fI
  l5AiPPLCQds5B0LGBkWsVokVSUmZ5RkpuYmaNraGCga2hopGtoaaFraGygl1ilm6SXWqpbnlp
  comuol1herFdcmZuck6KXl1qyiREYRCkFx5p2MJ58/UHvEKMkB5OSKK9gUmCiEF9SfkplRmJx
  RnxRaU5q8SFGGQ4OJQlevS6gnGBRanpqRVpmDjCgYdISHDxKIrz17UBp3uKCxNzizHSI1ClGX
  Y53PxcvYhZiycvPS5US59XpBioSACnKKM2DGwGLrkuMslLCvIwMDAxCPAWpRbmZJajyrxjFOR
  iVhHmNQC7hycwrgdv0CugIJqAjaicFgBxRkoiQkmpgmvbM8nXIqk/Hnnf8fMt+4dWfOac0PQJ
  +RdV8+mRw7sPrNUv+sofZR2ScKN8s9Sf+1p1tTjfef74lIl4y9de1B60hSiUyhimCd1dPOBoq
  E3p456Z9BqZLPmSYfbcWnnwxOW+mZpGNmLpD1ZOvJ3b+qF+qlmsV+GNeY0rWjdprHGrq9/iz5
  /zeuP75Idf4yILM1VGPt3THFGq3PFzL8a88qdf474fd7hwTusQv7RX7fVnk1g95Jz29TPm7bT
  Hdc4+as4rfEUk9cdjDdalL4Z2pj/9+cCuYeN/VlunOmuSCp6b5F57mPvQtONS2tG2DsueqVWm
  81R971x7kalaRXHdz5S/OK077hYJ8brJHXsydma7EUpyRaKjFXFScCAAAxlShKQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-285.messagelabs.com!1632734384!310166!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7998 invoked from network); 27 Sep 2021 09:19:44 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-6.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2021 09:19:44 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18R9Ji8P028937
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 10:19:44 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 27 Sep 2021 10:19:42 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-huey: upgrade 2.4.0 -> 2.4.1
Date: Tue, 28 Sep 2021 02:19:36 +0800
Message-ID: <1632766776-92433-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Sep 2021 09:19:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93141

* Attempt to reconnect to database if connection becomes unusable (e.g. due to
  a server restart). See: `huey.contrib.sql_huey.SqlHuey`.
* Do not use a soft file-lock for `FileStorage` - use `fcntl.flock()` instead.

[View commits](https://github.com/coleifer/huey/compare/2.4.0...2.4.1)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-huey_2.4.0.bb => python3-huey_2.4.1.bb}     | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_2.4.0.bb => python3-huey_2.4.1.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.4.0.bb b/meta-python/recipes-devtools/python/python3-huey_2.4.1.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python3-huey_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-huey_2.4.1.bb
index afdc65b246..64bd8880ec 100644
--- a/meta-python/recipes-devtools/python/python3-huey_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_2.4.1.bb
@@ -5,7 +5,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "82981fb8f1964e8c9ee8f4ebcd5a2ebad561dd93ce8b454bf4f4ecfb54bd1411"
+SRC_URI[sha256sum] = "bd55e90746cec16e7a61d6dc60d4591c74cba59000dca96c387a4d4eee1395f6"
+
+RDEPENDS:${PN} += " \
+	python3-datetime \
+	python3-logging \
+	python3-multiprocessing \
+	python3-json \
+"
 
 inherit pypi setuptools3
 
-- 
2.25.1


