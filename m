Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBBBC98338
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 20:51:44 +0000 (UTC)
Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43685.1790542295504901467
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 13:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Q7hUmnBV;
 spf=pass (domain: gmail.com, ip: 74.125.229.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-34215285aa1so599371eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 13:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790542295; x=1791147095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KH2F0b1sTtrU6VoE4Fdnkb6nB4AekGiwnZYQwIeTyo0=;
        b=Q7hUmnBVSCkh6X6aZmcNtMnol2ocTq/+vh/xikoy0mpBXKAngkjfAsaRD32fcjkjiz
         e6ulbg2+ooov8eafPnqBf9U+pBeEAjCAEfLm29zMMgT0Ye60hHDrIgybSltRkyrC/4HF
         GJ/L+RJwfL14NxpiqV/2PxqIHeJ2l4LFGvcJXJuRo+MrQPTkY3S9sbNM9SN4dudWri/p
         uHUJHnjmrmaa2oudSAdVeInFoCrOBa1r6HKTECPaNlSmXQhka1kCg8qVECB8cgYpZ7pX
         brvQ99MlXx2oC5VmiiZF90/BGGpuYnDqUyP9BJCqL2U3k8SmoJFCnnXES4KETepkjuib
         3MYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790542295; x=1791147095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KH2F0b1sTtrU6VoE4Fdnkb6nB4AekGiwnZYQwIeTyo0=;
        b=VT3hYwLXLNdz7JJuMIZlhmUOkPsB9mGQ+lHWmufHs35vMZLSmiBKpTBHFTdZSEujEE
         HhQpMDbQLav1MDs02VvcbmjwH0IfpBm71WQB0Gd9IQ8nrT3DhTxeMSJhiKbdKhQmdaS7
         zm+Yuuzfgukuw8YM6Ksf6n9bPoc+ck66lHu7JTD9aOJq0+FjsjJZAAY9/0SQeaJ6i9O2
         dxEwZ85+2uURu7iKpYzJukBqVa1Qycqp3hy7E1nDar/1o6Bxx7rbzSKjsh0ZRJ0+n4IN
         iNcf+vGUb+qJMe6cHs0GOQhhFA8uBTpB4niQO0DC2I5ydF8SfxIvj7iFXIXhtHHfYloV
         xOPg==
X-Gm-Message-State: AFuF++kTXc7LEAP0SFWbFHLeJw11NTv/8yam9y5FB40QqRlWYhsW7/di
	8k4sS+4+5Rv1eLrfGQ/zCGWQDJdDY9kV8QkwymSI/ccTNUqNPfeqfLQzXXenGqD/
X-Gm-Gg: AYBFou1gS3w9vJfxwXwLHNW5J1vRu+6/JfYRs/vHeC+IWFQm+4rxmztUmAyi8wSgMpO
	GiP1L64n9AHZ235j86JeNVE6WbdqdzSJwBhYHsWP8ABFicz8Iq8lB0YpBMc9n3alzNSfS9BSlmd
	ZhyVwPbSlz0+7UMsTmHsRuTYKU9PSaOyukx/BD1Ow8cYjBpSV995O+kwIHRppgzcVS5yN7lCLc7
	XvK65FA+ZRJrIfx+LJyvA9PFBuiFVkN5OWNMOzNxgD+in9K9+2ngyBIShxn4zc83SjAQ7YZVPA2
	JVxBxCcjkQBIXRh7VfBsLCT5i04ndlDQJIxxoZ/IqAm7oSvWPFW+J/GbKWE/tPKVWXshquXClLT
	7iBsITJ573zgU9kTmhaN3jClYquckUc/vnzOKTUt1wN+7GkshuAwS+/Sm/vzLBSxzuGg3PX5BCI
	AjaBPgowfCG4OTEWfzbFqzjNaUEjSwU89NADJbHH6T4tBwpNixDbf8GvdREFezua+W5hBX2iGGI
	L12ZwA0LlyCqIYvJJ6NM4fzqCsgTwMezDbk2BQCUVN9AvC/vKeI3Mr061TsASgSMmt05tfdOj77
	lBI+L0AMxeG5qGTxPQyKLNZuhYpMOUY48zFp+s1UnlV/ss9eXoDolNz3RE1Wku44iBnYTXULGtz
	s4umOEc+hy3Z5cyQlIzYafQmkW+dcp8OgW48JJmfimdCyIOo5REou2DXKLrEpFpo6/QBOgfIqFV
	v0b2+5iv0SrD1cXM/MNJ+tXZPS+3A3nuhYVUSnytg=
X-Received: by 2002:a05:7301:2727:b0:332:94e9:a72e with SMTP id 5a478bee46e88-34272754c58mr7860924eec.9.1790542294834;
        Sun, 27 Sep 2026 13:51:34 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3444fd04d93sm5674189eec.12.2026.09.27.13.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:51:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/2] hunspell: upgrade 1.7.3 -> 1.7.4
Date: Sun, 27 Sep 2026 13:51:30 -0700
Message-ID: <20260927205131.233612-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 20:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130383

- C++14 is now required (was optional C++11).
- test.sh gained a trace check driven by new tests/*.trace files; install
  them with the ptest data so it runs.
- Only pull in glibc-gconv-iso8859-* for glibc. They do not exist on
  musl, whose iconv has the ISO-8859 conversions built in, so the ptest
  package could not be installed there.

Changelog: https://github.com/hunspell/hunspell/compare/v1.7.3...v1.7.4

Tested with meta-oe-image-ptest-hunspell on qemux86-64 with
yoe-musl-systemd-wayland: 170 PASS, 0 FAIL. hunspell-native builds.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{hunspell_1.7.3.bb => hunspell_1.7.4.bb}        | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-support/hunspell/{hunspell_1.7.3.bb => hunspell_1.7.4.bb} (88%)

diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.7.3.bb b/meta-oe/recipes-support/hunspell/hunspell_1.7.4.bb
similarity index 88%
rename from meta-oe/recipes-support/hunspell/hunspell_1.7.3.bb
rename to meta-oe/recipes-support/hunspell/hunspell_1.7.4.bb
index 7d0921c25f..bdfe1bd4b1 100644
--- a/meta-oe/recipes-support/hunspell/hunspell_1.7.3.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell_1.7.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LESSER;md5=c96ca6c1de8adc025adfada81d06fba5 \
 "
 
-SRCREV = "c5f98152a274e25b5107101104bef632b83a0cc9"
+SRCREV = "92aa34b3f378ec115562fb06bd1728d566a339ec"
 SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https;tag=v${PV} \
            file://run-ptest \
 "
@@ -21,12 +21,12 @@ RDEPENDS:${PN}-ispell = "perl"
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     install -m 0755 ${S}/tests/test.sh ${D}${PTEST_PATH}/tests/
-    
+
     # Install test data files
-    for ext in dic aff good wrong sug morph root; do
+    for ext in dic aff good wrong sug morph root trace; do
         find ${S}/tests -maxdepth 1 -name "*.$ext" -exec cp {} ${D}${PTEST_PATH}/tests/ \;
     done
-    
+
     # Patch test.sh to use installed binaries
     sed -i 's|HUNSPELL="$(dirname $0)"/../src/tools/hunspell|HUNSPELL="${bindir}/hunspell"|' ${D}${PTEST_PATH}/tests/test.sh
     sed -i 's|ANALYZE="$(dirname $0)"/../src/tools/analyze|ANALYZE="${bindir}/analyze"|' ${D}${PTEST_PATH}/tests/test.sh
@@ -34,8 +34,9 @@ do_install_ptest() {
     sed -i 's|alias analyze=.*ANALYZE.*|alias analyze="$ANALYZE"|' ${D}${PTEST_PATH}/tests/test.sh
 }
 
-RDEPENDS:${PN}-ptest += " \
-    bash \
+RDEPENDS:${PN}-ptest += "bash"
+
+RDEPENDS:${PN}-ptest:append:libc-glibc = " \
     glibc-gconv-iso8859-1 \
     glibc-gconv-iso8859-2 \
     glibc-gconv-iso8859-15 \

