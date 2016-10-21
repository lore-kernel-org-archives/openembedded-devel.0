Return-Path: <koen.kooi@linaro.org>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0964F71CF1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 07:10:23 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id x79so135711966lff.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 00:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=g8lOWxR6nuY+pt/deiEZ5mjBUGyCehzfbz+wf+QLmwU=;
	b=e4ElfGmazRONrqIQAwR0ZaB9Z1tZr95KQQv1LKLeCZCbD/A9e/ZiJrMayAd1y+sBeH
	SM59HlqCw/DEaORofdzDEqn4eaCefagStuuAEpkO2LJuyT0cGmsK5gSgwS08WNU0AME1
	g9ov5byQoBKPe0RhM4OJuFLQuZRobhTcMSQxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=g8lOWxR6nuY+pt/deiEZ5mjBUGyCehzfbz+wf+QLmwU=;
	b=TQjJlmWMtzWxi0LlZlICX9H8Lot2WgXnAckuMNXK67EM1LbXNJKXE1ikMohS+pHLrw
	VnwPUVDYgwr3KczRwiO62COg0tFYEZxsw6OVRU9qKSpmTr3bM+nmd7SeuANqkqdpGtFs
	CwyBkb5f4CdRpteA7KH9Ijj1uLS4+x/F0BHQvLAhHvfFQpTOJ/IMjPa05Ii7nVIu28uY
	Jzxmjk6NrSFv21lJlHAIPJjcN0wcim3BGrVOJf0BA8J4WJ+c6DkSyn9Q1DTWSNYiHp7P
	xGziyg4XNYhzHAe2GnmgO8UKQcz04v8jwwtR3OhTC80cKMUHXbd9rbZ0GxGE9KYLpQKf
	Q90A==
X-Gm-Message-State: AA6/9Rl7n+SidIE5NrAfS13/mZmh6c/NNz/rq190BxBaYH6ycygZa7M9QT8sVIK+1dqiR3So
X-Received: by 10.28.2.214 with SMTP id 205mr6286465wmc.46.1477033824091;
	Fri, 21 Oct 2016 00:10:24 -0700 (PDT)
Received: from thinkpad.localdomain (ip4da29576.direct-adsl.nl.
	[77.162.149.118]) by smtp.gmail.com with ESMTPSA id
	x127sm2600297wmd.21.2016.10.21.00.10.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Oct 2016 00:10:23 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Oct 2016 09:10:19 +0200
Message-Id: <1477033819-18461-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.4.11
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] android-tools: fix native build
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
X-List-Received-Date: Fri, 21 Oct 2016 07:10:26 -0000

* Find libbsd headers when building natively
* Disable tools that needs sys/capability.h when building natively
* Enhance do_install to work when some tools are disabled

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 .../android-tools/android-tools_5.1.1.r37.bb       | 59 +++++++++++++++-------
 1 file changed, 40 insertions(+), 19 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index 2dbddf1..1769b6a 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -65,6 +65,16 @@ do_unpack_extra() {
 
 addtask unpack_extra after do_unpack before do_patch
 
+# Find libbsd headers during native builds
+CC_append_class-native = " -I${STAGING_INCDIR}"
+CC_append_class-nativesdk = " -I${STAGING_INCDIR}"
+
+TOOLS = "adb fastboot ext4_utils mkbootimg adbd"
+
+# Adb needs sys/capability.h, which is not available for native*
+TOOLS_class-native = "fastboot ext4_utils mkbootimg"
+TOOLS_class-nativesdk = "fastboot ext4_utils mkbootimg"
+
 do_compile() {
     # Setting both variables below causing our makefiles to not work with
     # implicit make rules
@@ -91,31 +101,42 @@ do_compile() {
       ;;
     esac
 
-    tools="adb fastboot ext4_utils mkbootimg adbd"
-    for tool in ${tools}; do
+    for tool in ${TOOLS}; do
       mkdir -p ${B}/${tool}
       oe_runmake -f ${B}/${tool}.mk -C ${B}/${tool}
     done
 }
 
 do_install() {
-    install -D -p -m0755 ${S}/system/core/libsparse/simg_dump.py ${D}${bindir}/simg_dump
-    install -D -p -m0755 ${S}/system/extras/ext4_utils/mkuserimg.sh ${D}${bindir}/mkuserimg
-
-    install -m0755 ${B}/ext4_utils/ext2simg ${D}${bindir}
-    install -m0755 ${B}/ext4_utils/ext4fixup ${D}${bindir}
-    install -m0755 ${B}/ext4_utils/img2simg ${D}${bindir}
-    install -m0755 ${B}/ext4_utils/make_ext4fs ${D}${bindir}
-    install -m0755 ${B}/ext4_utils/simg2img ${D}${bindir}
-    install -m0755 ${B}/ext4_utils/simg2simg ${D}${bindir}
-
-    install -m0755 ${B}/adb/adb ${D}${bindir}
-    install -m0755 ${B}/adbd/adbd ${D}${bindir}
-    install -m0755 ${B}/fastboot/fastboot ${D}${bindir}
-    install -m0755 ${B}/mkbootimg/mkbootimg ${D}${bindir}
-
-    install -D -p -m0644 ${WORKDIR}/android-tools-adbd.service \
-      ${D}${systemd_unitdir}/system/android-tools-adbd.service
+    if [ grep -q "ext4_utils" "${TOOLS}" ] ; then
+        install -D -p -m0755 ${S}/system/core/libsparse/simg_dump.py ${D}${bindir}/simg_dump
+        install -D -p -m0755 ${S}/system/extras/ext4_utils/mkuserimg.sh ${D}${bindir}/mkuserimg
+
+        install -m0755 ${B}/ext4_utils/ext2simg ${D}${bindir}
+        install -m0755 ${B}/ext4_utils/ext4fixup ${D}${bindir}
+        install -m0755 ${B}/ext4_utils/img2simg ${D}${bindir}
+        install -m0755 ${B}/ext4_utils/make_ext4fs ${D}${bindir}
+        install -m0755 ${B}/ext4_utils/simg2img ${D}${bindir}
+        install -m0755 ${B}/ext4_utils/simg2simg ${D}${bindir}
+    fi
+
+    if [ grep -q "adb " "${TOOLS}" ] ; then
+        install -m0755 ${B}/adb/adb ${D}${bindir}i
+    fi
+
+    if [ grep -q "adbd" "${TOOLS}" ] ; then
+        install -m0755 ${B}/adbd/adbd ${D}${bindir}
+        install -D -p -m0644 ${WORKDIR}/android-tools-adbd.service \
+          ${D}${systemd_unitdir}/system/android-tools-adbd.service
+    fi
+
+    if [ grep -q "fastboot" "${TOOLS}" ] ; then
+        install -m0755 ${B}/fastboot/fastboot ${D}${bindir}
+    fi
+
+    if [ grep -q "mkbootimg" "${TOOLS}" ] ; then
+         install -m0755 ${B}/mkbootimg/mkbootimg ${D}${bindir}
+    fi
 }
 
 PACKAGES += "${PN}-fstools"
-- 
2.4.11


