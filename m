Return-Path: <koen.kooi@linaro.org>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id D32EF606BF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 10:26:34 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id a197so28506160wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 02:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=doUGPxVzH8dmRo2HzK00w8Z3Y5SmN37LrVAXV80XXgg=;
	b=BIT43+wn2T61KsoA8u7SbWUeZmlUCA9cLVIe8NrUbNEGskuhG7PF6SsyODGLb4l40A
	P/exlgRyR8VGP8duMWTJQZw6rcml2k0aPpcUrBdfNk4zYfaqlLnpySSzffLwSvWp8HP/
	NkMM4pvIB1dMKfl2NANYixiaFOHOaixKHyYwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=doUGPxVzH8dmRo2HzK00w8Z3Y5SmN37LrVAXV80XXgg=;
	b=fYOCcFQEA934P5JJXHEsPcQjbUKhShxBaDsBM44Q8jCItNTFpGpCD+Vx1uiNZ/PBcY
	j5supTj0U8oPoGOr4TLNijmEqEMQ/9rYsGwMMxmPMc/NMzFxs1JgtvVOz8vY6b25447b
	+Z6E4WO/Tz+4sBKTaMn+mmpzngaEDhMBqVtfbxLz/hxyzFTKIqOm1y3IeriLAU5draxt
	RZ4xSSMyrj0SO+UQsdHfirt3bRvcKg1OJBKow8BE1p8bkHdxT0uAYL2VfqVczaWZ06G7
	5FLTkIgQrNbUO/W3AOOWVrfoPZOLUND3l/OwICSc282bGubrgAO/52WzHKXjXJA+OrOP
	Pqmg==
X-Gm-Message-State: ABUngvcNv88DXbTPLW9tbYQhr+9pozmjfVJXoUoBkdsJkWd0WqYMsp28FhQ7LiGgmHaDLliB
X-Received: by 10.28.170.202 with SMTP id t193mr8964211wme.10.1479464795359;
	Fri, 18 Nov 2016 02:26:35 -0800 (PST)
Received: from thinkpad.localdomain (ip4da29576.direct-adsl.nl.
	[77.162.149.118]) by smtp.gmail.com with ESMTPSA id
	d10sm8050296wja.20.2016.11.18.02.26.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Nov 2016 02:26:34 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Nov 2016 11:26:31 +0100
Message-Id: <1479464791-28098-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.4.11
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] android-tools: fix do_install
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Nov 2016 10:26:35 -0000

The previous patch introduced 2 bugs that made packaging fail:

1) Always failing grep
2) Conditionally install systemd files

Systemd.bbclass doesn't handle conditional installation and will throw an error.

Tested with -native and regular cross builds.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 .../android-tools/android-tools_5.1.1.r37.bb          | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index 1769b6a..5041465 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -108,7 +108,10 @@ do_compile() {
 }
 
 do_install() {
-    if [ grep -q "ext4_utils" "${TOOLS}" ] ; then
+    export TOOLSFILE="${WORKDIR}/tools.txt"
+    echo ${TOOLS} > ${TOOLSFILE}
+
+    if grep -q "ext4_utils" ${TOOLSFILE} ; then
         install -D -p -m0755 ${S}/system/core/libsparse/simg_dump.py ${D}${bindir}/simg_dump
         install -D -p -m0755 ${S}/system/extras/ext4_utils/mkuserimg.sh ${D}${bindir}/mkuserimg
 
@@ -120,21 +123,23 @@ do_install() {
         install -m0755 ${B}/ext4_utils/simg2simg ${D}${bindir}
     fi
 
-    if [ grep -q "adb " "${TOOLS}" ] ; then
+    if grep -q "adb " ${TOOLSFILE} ; then
         install -m0755 ${B}/adb/adb ${D}${bindir}i
     fi
 
-    if [ grep -q "adbd" "${TOOLS}" ] ; then
+    if grep -q "adbd" ${TOOLSFILE} ; then
         install -m0755 ${B}/adbd/adbd ${D}${bindir}
-        install -D -p -m0644 ${WORKDIR}/android-tools-adbd.service \
-          ${D}${systemd_unitdir}/system/android-tools-adbd.service
     fi
 
-    if [ grep -q "fastboot" "${TOOLS}" ] ; then
+    # Outside the if statement to avoid errors during do_package
+    install -D -p -m0644 ${WORKDIR}/android-tools-adbd.service \
+      ${D}${systemd_unitdir}/system/android-tools-adbd.service
+
+    if grep -q "fastboot" ${TOOLSFILE} ; then
         install -m0755 ${B}/fastboot/fastboot ${D}${bindir}
     fi
 
-    if [ grep -q "mkbootimg" "${TOOLS}" ] ; then
+    if grep -q "mkbootimg" ${TOOLSFILE} ; then
          install -m0755 ${B}/mkbootimg/mkbootimg ${D}${bindir}
     fi
 }
-- 
2.4.11


