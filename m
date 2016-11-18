Return-Path: <koen.kooi@linaro.org>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id A08F771AA7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 11:51:31 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id t79so32493428wmt.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 03:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kKkVAzZFsIOx4vJgQioiw9YASc5nfi6EGd+AQThwAMQ=;
	b=RVNV7qcftZ7gbUKaw0OTEI3wrajJrxJNQtgShFtFuSoP47RJqoPRJzc0Yq9JfplttL
	NxOSsGKFeXCpFkqS95SH50nmsLaHzNcsbkPNJdipa5lkY829N4wbG2UUJ/itmm9Bhx8q
	zHYvMEh/G9zF9OrmW13SCO4rYvF3mlPLDHV6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kKkVAzZFsIOx4vJgQioiw9YASc5nfi6EGd+AQThwAMQ=;
	b=P/baaveJQXPcXuD7aTYYn5GXs6lnlZKVkIvg2cKrWpUTLBMsn231HJy/4r5gfYgk4I
	S3bB8oB8+Tu1QlMKpvNbPqVpLEhVDN1GvdqW2hBvUcOci+zTHtt/CfJCOs8rLEeCYYTy
	YzZUfx7+67qGID01zJrPFUv6UUqcku0t+ku7mLaEmRUzGrqshLBSTen2EIWsSFY4j4xd
	ab5Iot8yT+hJR89WvyfIJE+2Mqfo/i6p1nGKMmgdgqUiFoGajxOcreDcwZquSplZdNNs
	iLr7g3f2ievytMjdqTwNeSRkhnQmo2m+hIoZZJJNdbCHntFq8TXA7rC6t58hxH6r9ct/
	g/yQ==
X-Gm-Message-State: AKaTC00xL9oI0EiPskBtwlKS8E9WbhHPE8PSffxBFdv3U9NLM7gX+moa7RjR6+l6sZANx5dc
X-Received: by 10.194.201.133 with SMTP id ka5mr6065251wjc.151.1479469892315; 
	Fri, 18 Nov 2016 03:51:32 -0800 (PST)
Received: from thinkpad.localdomain (ip4da29576.direct-adsl.nl.
	[77.162.149.118]) by smtp.gmail.com with ESMTPSA id
	c202sm4050054wme.1.2016.11.18.03.51.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Nov 2016 03:51:31 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Nov 2016 12:50:40 +0100
Message-Id: <1479469840-9275-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.4.11
MIME-Version: 1.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCHv2] android-tools: fix do_install
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
X-List-Received-Date: Fri, 18 Nov 2016 11:51:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The previous patch introduced 2 bugs that made packaging fail:

1) Always failing grep
2) Conditionally install systemd files

Systemd.bbclass doesn't handle conditional installation and will throw an error.

Tested with -native and regular cross builds.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---

Changes since v1:

	* don't use an intermediate file for grep (ndec)
        * Always create $bindir (André)
        * remove stray 'i' (André)

 .../android-tools/android-tools_5.1.1.r37.bb       | 24 ++++++++++++++--------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index 1769b6a..a9e7d5d 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -108,7 +108,7 @@ do_compile() {
 }
 
 do_install() {
-    if [ grep -q "ext4_utils" "${TOOLS}" ] ; then
+    if echo ${TOOLS} | grep -q "ext4_utils" ; then
         install -D -p -m0755 ${S}/system/core/libsparse/simg_dump.py ${D}${bindir}/simg_dump
         install -D -p -m0755 ${S}/system/extras/ext4_utils/mkuserimg.sh ${D}${bindir}/mkuserimg
 
@@ -120,22 +120,28 @@ do_install() {
         install -m0755 ${B}/ext4_utils/simg2simg ${D}${bindir}
     fi
 
-    if [ grep -q "adb " "${TOOLS}" ] ; then
-        install -m0755 ${B}/adb/adb ${D}${bindir}i
+    if echo ${TOOLS} | grep -q "adb " ; then
+        install -d ${D}${bindir}
+        install -m0755 ${B}/adb/adb ${D}${bindir}
     fi
 
-    if [ grep -q "adbd" "${TOOLS}" ] ; then
+    if echo ${TOOLS} | grep -q "adbd" ; then
+        install -d ${D}${bindir}
         install -m0755 ${B}/adbd/adbd ${D}${bindir}
-        install -D -p -m0644 ${WORKDIR}/android-tools-adbd.service \
-          ${D}${systemd_unitdir}/system/android-tools-adbd.service
     fi
 
-    if [ grep -q "fastboot" "${TOOLS}" ] ; then
+    # Outside the if statement to avoid errors during do_package
+    install -D -p -m0644 ${WORKDIR}/android-tools-adbd.service \
+      ${D}${systemd_unitdir}/system/android-tools-adbd.service
+
+    if echo ${TOOLS} | grep -q "fastboot" ; then
+        install -d ${D}${bindir}
         install -m0755 ${B}/fastboot/fastboot ${D}${bindir}
     fi
 
-    if [ grep -q "mkbootimg" "${TOOLS}" ] ; then
-         install -m0755 ${B}/mkbootimg/mkbootimg ${D}${bindir}
+    if echo ${TOOLS} | grep -q "mkbootimg" ; then
+        install -d ${D}${bindir}
+        install -m0755 ${B}/mkbootimg/mkbootimg ${D}${bindir}
     fi
 }
 
-- 
2.4.11


