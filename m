Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2008FCED606
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 10:58:20 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9746.1763463498200131023
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 02:58:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mua4Sxbu;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so2735307f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 02:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763463496; x=1764068296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LdFE4634r3ZsuDidE3mBFnud+HDNqDZGOX64T7U5GqM=;
        b=Mua4Sxbuti/3gJfm9BUEf75goMZEIoPEaB0QaHuKg8hZplktpp2SoEc0KbqBLBpcm6
         r1qlbh1dVbBzqGnWg5v6oxpbTdbbgUn6I9wK47N09QkYQitXM2QAdsSFjRa2Lg//UAIc
         s6LfdY1gd/bGJoJq949+oPsJ8lyBfVN6LI7vyFPLO5cWR1ABsY0JkzeoqP4OC3+SBmTg
         YeehhKe2LuKJIvz+2nE+xJ1oXThASd+2rjihVObla61K3VRsLrAAwxgWjGCs1B3w9A0B
         vLw4MCqK5CK8ia/dQTIVZ7E5JC/Os0oFKVyRwgP5thrHYY+FuUyNXWOb3l39LkSMS23g
         7Cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463496; x=1764068296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LdFE4634r3ZsuDidE3mBFnud+HDNqDZGOX64T7U5GqM=;
        b=nFAupn8Ta6YLGYl66Ilb6Snvb+0pv3tVkD+48vC7jzhP8uksTMdtvFn71NJA57YSZf
         HVIG9/x59QHzoVwNOZysLgx8x4s9O6qaOGu6Qpsccz1rgW37bWZyntKbFoMaK5MEu/qB
         ddpJAdWfyHISGru4kspFLjf91nc4oePsJsxOwKKvaWM0hTbsTYFEvHeoPadu4T91765L
         PyYnFH/99xQ3zA+vlM98ZOF87dGm9zBYvnSq+QT6dnXvT8BfdFL0KpgI/0yHrjV4ipQL
         tQEkwZXQ8xHF3mlcACJfx46jsy0LGY2T1ABW+ojzE94FKW5FhoyuqNgXxJWkD/FfL5sj
         XbCg==
X-Gm-Message-State: AOJu0Yz6gxi5UEv++q6XEG4aKK4KVzWg3/9jA7eoDs8b4p7j18Qbci9A
	dyYsroVTJAuruJ9uOMizRF0ybBatYYtQow4JUj8+6RtDhV3ma83auUjRi5zecqbs
X-Gm-Gg: ASbGncvVr2hewPig+V1Tkw+pCsgkHion9ImLmXYIGxgmvSMJtHTvfPiMnJgSzJeTKwE
	MHLX0VPUZvkgKYWLpZ9bPXwLeMKGYEOfepd7AGZr27RHwGDVh31HjIX1mY1kdaM1nV0d5axeM7b
	gk3WuFdGkwMusWeT3rziUVW+n2kWqStJ5Ik7XuJNEjWuS8qRKDkLmLv8gi+JLlEP0UjOZwfKy9q
	mAEQ5A2OvWCAr0vLMZBSD6iG/2nnLmmbOkckPZrjZG4XLCNlQQa4EIqhJ6FtHjgA8Ol8xEjDtpu
	kq1X35OG8Gj0O0zGvPW5j5rRxPvgrdw+vOQ+OH/S+Qw7/QqNgIxov02TOD4CObaYPbTuGk7yuGc
	jVrjk3Ig/haw48G35k4t9pf6Ap+87E2VAxLfKTswCJi3r4NXGyUFJvdkQBokYuE6x5pYbdPgfHO
	0XMVTrYxB9
X-Google-Smtp-Source: AGHT+IH6ByzK8Anv9crvnRjjhoKoGM8RUHmppEIELT5IUGLbO/ur7lttw4OLJ/ElY7WwLa/4kcywTg==
X-Received: by 2002:a05:6000:1844:b0:429:c719:e0aa with SMTP id ffacd0b85a97d-42ca8678a90mr2398391f8f.6.1763463496328;
        Tue, 18 Nov 2025 02:58:16 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e85627sm33077124f8f.16.2025.11.18.02.58.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:58:15 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] imagemagick: adds ptest for imagemagick recipe
Date: Tue, 18 Nov 2025 11:58:14 +0100
Message-ID: <20251118105815.1554000-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 10:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121851

From: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>

Backport of the commit 96b97c0c6490b713b559a4e82bd699a2ebe357d3 from master

This patch enables ptest for imagemagick, improving test coverage for
continuous integration and runtime validation.
No functional changes are introduced to the core package.

The logic used is :
- We check if the required tools are present or not
- We used convert to create an raw RGB file
- The created RGB is then converted to PNG using convert
- We re-gerenate RGB from PNG and compare the original and re-generated RGB
- Enabled the ptest in ptest-packagelists-meta-oe.inc as
  suggested by Gyorgy Sarvari and incorporated logging suggestion
- This was done as standard imagemagick test like drawtest requires manual
  internetion to verify the file.

Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>

Adapted to Kirkstone.
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/files/imagemagick-ptest.sh    | 128 ++++++++++++++++++
 .../imagemagick/files/run-ptest               |  43 ++++++
 .../imagemagick/imagemagick_7.0.10.bb         |   8 +-
 3 files changed, 178 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/imagemagick-ptest.sh
 create mode 100644 meta-oe/recipes-support/imagemagick/files/run-ptest

diff --git a/meta-oe/recipes-support/imagemagick/files/imagemagick-ptest.sh b/meta-oe/recipes-support/imagemagick/files/imagemagick-ptest.sh
new file mode 100644
index 0000000000..f6f7286007
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/imagemagick-ptest.sh
@@ -0,0 +1,128 @@
+#!/bin/sh
+#
+# ImageMagick ptest:
+# We ceate an BASERGB file for our usage using "convert"
+# We convert this RGB file to BASEPNG
+# Using BASEPNG we recreate RGB named REGENERATEDRGB
+#
+# BASERGB to BASEPNG to REGENERATEDRGB
+# - Then compare  BASERGB with REGENERATEDRGB
+#
+# 1) We are checking if the binaries are present in RFS or not
+# 2) We Created an RBG of size : WIDTH x HEIGHT pixels
+# 3) Return value is captured after every major actio to capture the status
+# 4) cmp -s is used to compare binary byte by byte data and
+#    capture only exit status
+# 5) Important parametsrs used are :
+#    -depth                     : How many bits for each colour pixel
+#    -alpha off  		: Don't consider transparency
+#    -define png:color-type=2   : Make PNG work with truecolour RGB
+#    -strip 			: Remove all non-pixel metadata og PNG
+#                                 so file is reproducible
+#    -set gamma 1.0             : No PNG brightness correction
+#     gradient:red-blue         : Data moves liberly from RED to Blue vertically
+
+
+WIDTH=16
+HEIGHT=16
+BASERGB=base.rgb
+BASEPNG=base.png
+REGENERATEDRGB=roundtrip.rgb
+
+echo "[DEBUG] Starting ImageMagick Ptest with ${WIDTH}x${HEIGHT} pixels "
+
+# Verify required binaries
+for bin in convert cmp wc rm; do
+    if [ -z "$(command -v "$bin" 2>/dev/null)" ]; then
+        echo "[ERROR] Required binary '$bin' not found $PATH"
+        exit 127
+    fi
+done
+
+# Generate raw RGB
+convert -size ${WIDTH}x${HEIGHT} -depth 8 -type TrueColor \
+    -alpha off -define png:color-type=2 \
+    -strip -set gamma 1.0 \
+    gradient:red-blue rgb:${BASERGB}
+
+returnvalue=$?
+if [ "$returnvalue" -ne 0 ]; then
+    echo "[FAIL] Failed to generate RGB pattern "
+    exit 1
+else
+    echo "[DEBUG] Generated raw RGB ${BASERGB} for test case"
+fi
+
+
+
+# Convert raw RGB to PNG
+convert -size ${WIDTH}x${HEIGHT} -depth 8 -type TrueColor \
+    -alpha off -define png:color-type=2 \
+    -strip -set gamma 1.0 \
+    rgb:${BASERGB} ${BASEPNG}
+
+returnvalue=$?
+if [ $returnvalue -ne 0 ]; then
+    echo "[FAIL] Failed to convert RGB to PNG"
+    rm -f ${BASERGB}
+    exit 1
+else
+    echo "[DEBUG] ${BASEPNG}  generated from ${BASERGB}"
+fi
+
+
+
+# Regenerate raw RGB from PNG
+convert -size ${WIDTH}x${HEIGHT} -depth 8 -type TrueColor \
+    -alpha off -define png:color-type=2 \
+    -strip -set gamma 1.0 \
+    ${BASEPNG} rgb:${REGENERATEDRGB}
+
+returnvalue=$?
+if [ $returnvalue -ne 0 ]; then
+    echo "[FAIL] Failed to re generate RGB from PNG "
+    rm -f ${BASERGB} ${BASEPNG}
+    exit 1
+else
+    echo "[DEBUG] ${REGENERATEDRGB} generated from ${BASEPNG}"
+fi
+
+
+
+# Compare original and recreated RGB
+if cmp -s ${BASERGB} ${REGENERATEDRGB}; then
+    echo "[PASS] RGB data identical after PNG round-trip"
+    RESULT=0
+else
+    echo "[FAIL] RGB mismatch detected, printing their size "
+    echo "[INFO] Base RGB size: $(wc -c < ${BASERGB}) bytes"
+    echo "[INFO] Round-trip RGB size: $(wc -c < ${REGENERATEDRGB}) bytes"
+    RESULT=1
+fi
+
+
+
+# Checking the identify tool from imagemagick to get the PNG metadata
+# True is added in end to ensure that test script doesnt fail even if
+# identify fails for any reason
+echo "[DEBUG] PNG file info:"
+identify -verbose ${BASEPNG} | grep -E "Depth|Type|Colorspace" || true
+
+
+
+# Cleanup of files create by test code
+echo "[DEBUG] Cleaning up temporary files"
+rm -f ${BASERGB} ${BASEPNG} ${REGENERATEDRGB}
+returnvalue=$?
+echo "[DEBUG] Cleanup exit=$returnvalue"
+
+
+# Logging the final result
+if [ ${RESULT} -eq 0 ]; then
+    echo "[DEBUG]: imagemagick-ptest.sh sucessfull "
+else
+    echo "[DEBUG]: imagemagick-ptest.sh failed "
+fi
+
+
+exit ${RESULT}
diff --git a/meta-oe/recipes-support/imagemagick/files/run-ptest b/meta-oe/recipes-support/imagemagick/files/run-ptest
new file mode 100644
index 0000000000..75251a803f
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/run-ptest
@@ -0,0 +1,43 @@
+#!/bin/sh
+#
+# run-ptest — ImageMagick ptest harness
+# POSIX-safe and BusyBox compatible
+
+PTDIR=$(dirname "$0")
+TESTDIR="$PTDIR"
+PASSCOUNT=0
+FAILCOUNT=0
+TOTAL=0
+
+echo "======================================="
+echo "ImageMagick ptest: Runtime Validation"
+echo "======================================="
+
+for t in "$TESTDIR"/*.sh; do
+    [ -x "$t" ] || chmod +x "$t"
+    TOTAL=$((TOTAL + 1))
+    echo
+    echo "[DEBUG] Launching test script $t"
+
+    if sh "$t" 2>&1; then
+        echo "PASS: $(basename "$t")"
+        PASSCOUNT=$((PASSCOUNT + 1))
+    else
+        rc=$?
+        if [ "$rc" -eq 77 ]; then
+            echo "SKIP: $(basename "$t")"
+        else
+            echo "FAIL: $(basename "$t")"
+            FAILCOUNT=$((FAILCOUNT + 1))
+        fi
+    fi
+
+done
+
+echo
+echo "======================================="
+echo "[SUMMARY] Total: $TOTAL | PASS: $PASSCOUNT | FAIL: $FAILCOUNT"
+echo "======================================="
+echo
+[ "$FAILCOUNT" -eq 0 ]
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index fcbbd6fca2..f567158693 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -12,6 +12,8 @@ DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 BASE_PV := "${PV}"
 PV .= "-62"
 SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https \
+    file://run-ptest \
+    file://imagemagick-ptest.sh \
     file://CVE-2021-20309.patch \
     file://CVE-2021-20310.patch \
     file://CVE-2021-3610.patch \
@@ -39,7 +41,11 @@ CVE_CHECK_IGNORE += "CVE-2016-7538"
 # current version is not affected by the CVE which affects versions at least earlier than 7.0.4-4
 CVE_CHECK_IGNORE += "CVE-2017-5506"
 
-inherit autotools pkgconfig update-alternatives
+inherit autotools pkgconfig update-alternatives ptest
+
+do_install_ptest() {
+    install -m 0755 ${WORKDIR}/imagemagick-ptest.sh ${D}${PTEST_PATH}/
+}
 
 # xml disabled because it's using xml2-config --prefix to determine prefix which returns just /usr with our libxml2
 # if someone needs xml support then fix it first

