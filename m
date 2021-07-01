Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web10.3642.1625121445306300535
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jun 2021 23:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OwhFQY7Z;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625121442; i=@fujitsu.com;
	bh=3Q5R72kK4Nnn3qUknx8/uNmTQ1ejhHKWR++iUvFWVo0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=OwhFQY7ZgtA+zCTEWSmt4lsJglBCPgK3ug/LsbLOcUabfZRqMzmcg4BnDSoIqrwtP
	 0OCQF7RYs0xuQzn6l30GL0M4Z4sGZJLZcmS8/fNSmuaQrNb9EaQCQP2i6RQpHtiPpP
	 2bBEkk2wM/JZ8JvwaGf30wqJrkMHp7yONioTkHNbk74h9jr60O3jY9VLXuvLkelx08
	 zqXlIVJSqNVPg6IY3s2KCfVqjB0Yp3JC9MxjjjW9oYFcCaRgGGM7YuiWevN7qNs02b
	 Xr0MEzIUn2jDIED1E3QRh9sb2JdJMyzkpo0/LzGjlLDqleR6n/VueSGU8JIznLBH65
	 s+rx59Jzpt+jw==
Received: from [100.113.7.10] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 0F/63-27273-2A26DD06; Thu, 01 Jul 2021 06:37:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYorsw6W6
  CwYpWI4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNL7xTmgincFY0P5zE2MHZwdTFycQgJzGKS
  2HVlOxuEs5tR4v6j3axdjJwcbAK6Eucer2UHsUUE9CWWzt7DDGILC/hITGi8zQZiswioSBx4t
  ZQFxOYV8JA4tOkbWL2EgILElIfvmSHighInZz4Bq2EWkJA4+OIFUJwDqEZRYvZ0eYjyCokZM7
  axTWDkmYWkYxaSjgWMTKsYLZKKMtMzSnITM3N0DQ0MdA0NjXXNdC3M9RKrdJP0Ukt1k1PzSoo
  SgZJ6ieXFesWVuck5KXp5qSWbGIFhlFLIFr6D8czrD3qHGCU5mJREed9F3U0Q4kvKT6nMSCzO
  iC8qzUktPsQow8GhJMHbngCUEyxKTU+tSMvMAYY0TFqCg0dJhPdRBFCat7ggMbc4Mx0idYpRU
  Uqcty0RKCEAksgozYNrg8XRJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvLYgU3gy80rgpr
  8CWswEtHjRk5sgi0sSEVJSDUwCtxMuLzo5b8/hO94dAW1aTOqCb/ve+ni9vbSA12iuoLr30fa
  1xzaJnilQf/XQReQvT81jjtBv9oeuzzlrmqXDuiNBoX7R3XC/Ga+vPFMpb5lZo7Yh9HwYT/KJ
  SR+6py9aM396FsuhY+yPnxyWqloa+ib93w832+kT2lfaHGlRTAleHX33SM7NSInajT8iJ+2NC
  JRbcyv1jN3Vab/1VVWOzL9yy2Dp4tcctfXfjN4bvjua8/9d35657oW/OaQUGX48ZPlSNLPzwG
  Vxlhfye52j6phNxIPXtTU9un1r9SbZeKPHdluZExkrWOek1WzY0/X15wbWMxukT6cJaR92eNH
  XsVq4Mclbpk2y+MF07UJVJZbijERDLeai4kQA+mJbwx4DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-248.messagelabs.com!1625121441!57966!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3614 invoked from network); 1 Jul 2021 06:37:21 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-17.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Jul 2021 06:37:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1616bCcU011961
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Jul 2021 07:37:21 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 1 Jul 2021 07:37:10 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-scrypt: upgrade 0.8.17 -> 0.8.18
Date: Thu, 1 Jul 2021 14:37:01 +0800
Message-ID: <1625121421-86777-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

0.8.18
add wheel for python 3.9 and

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-scrypt_0.8.17.bb => python3-scrypt_0.8.18.bb}  | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-scrypt_0.8.17.bb => python3-scrypt_0.8.18.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-scrypt_0.8.17.bb b/meta-python/recipes-devtools/python/python3-scrypt_0.8.18.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-scrypt_0.8.17.bb
rename to meta-python/recipes-devtools/python/python3-scrypt_0.8.18.bb
index bcd58914a3..da3130016a 100644
--- a/meta-python/recipes-devtools/python/python3-scrypt_0.8.17.bb
+++ b/meta-python/recipes-devtools/python/python3-scrypt_0.8.18.bb
@@ -5,7 +5,7 @@ HOMEPAGE="https://github.com/holgern/py-scrypt"
 
 SRC_URI += "file://0001-py-scrypt-remove-the-hard-coded-include-paths.patch"
 
-SRC_URI[sha256sum] = "25b5075f2238be93af1cd574540a5ea01b8547f9b678aa72d22fce22577475ec"
+SRC_URI[sha256sum] = "bcf04257af12e6d52974d177a7b08e314b66f350a73f9b6f7b232d69a6a1e041"
 
 inherit pypi ptest setuptools3 dos2unix
 
@@ -17,6 +17,10 @@ RDEPENDS_${PN}-ptest += " \
     ${PYTHON_PN}-pytest \
 "
 
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-ctypes \
+"
+
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/scrypt/tests/* ${D}${PTEST_PATH}/tests/
-- 
2.25.1

