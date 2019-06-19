Return-Path: <andrey.z@gmail.com>
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
	[209.85.208.47])
	by mail.openembedded.org (Postfix) with ESMTP id 915D37E635
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 10:08:38 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id a14so26305551edv.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 03:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/iV1tO3mxH5UHSGys4crT7x91jo30CoMIbmn66HwcsU=;
	b=XpR8MB7yheyPMmqghTiGyUVQDLJoX88OeBr36Gg0v7Wj+YhZ/Admoqc42bTAzhujJQ
	KGQG1QPUg7zcdMjrOZ7qQdqpkwJ97T6fYehkHDMjPSOhvqutO8SqBr5yIf6xfjQMzTK1
	kD4y6/DfeuYU09sq7MFATC+CGtXh6gEUqEhw4Cp9jiseNUMh9uV28nPtSif/kB2gG562
	46+1/JJBsOy+8gyP4GEP5IGg3hnj6e8/FiBUJqRMb/4kknJybWUDKgPxqJQihARr8AK1
	ArKHOEjArKpDBx6uXwR+QGQDJIYLeIcEdOgZBuC5CMFKqIsnOwqlVtA8F7yPowNBOClM
	GmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/iV1tO3mxH5UHSGys4crT7x91jo30CoMIbmn66HwcsU=;
	b=dkOZuIVBIRkCWxerqdg6bf253PSuY5at4s4oo4mLcGksuWRBDR+nep9Jj7sPtPJ3m3
	vSbvAmrhGMuZ/PZI4GG4jwyFVo0uaKerVnBTeUN1TlpTfbH/N6jcxFjoT8RCiqDzynJZ
	GFuWBRzK5J93iWkPvJaQWYt64ZAlcPRS5chw/EKmQHzZum4uhiBLU6wFgYIhOC+YwdJW
	K0z2alWA6M0vbRqLd7UMPjVoZARDtY0jNHtz2W1m0ktCVb7a+pYCVBDRWZINrBUgRALq
	cfRGNhI/+DHh21aWcfb2VMYHFXfZSabL531qhfGMlG965IgqU6+dTZw/v+uQw6RQYzOJ
	g4ZQ==
X-Gm-Message-State: APjAAAV+Kks3hWDomIt1AJTgxjNtWaR84WjGc3858y6xNlNmKsjzH3bF
	oCUefqSSJoPrV968j76AIeoLXMAdg1//Sw==
X-Google-Smtp-Source: APXvYqwSirj5kD/6/TICkCTkRnlrrP9SigAccPJ837I+rgjeeCbdYhzN028ne0kFuS8STLTCN4PrIw==
X-Received: by 2002:a50:aa7c:: with SMTP id p57mr82884278edc.179.1560938919071;
	Wed, 19 Jun 2019 03:08:39 -0700 (PDT)
Received: from ahersrvbspbld01.lgs-net.com ([193.8.40.126])
	by smtp.gmail.com with ESMTPSA id
	v32sm5520352edm.92.2019.06.19.03.08.38
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 03:08:38 -0700 (PDT)
From: Andrey Zhizhikin <andrey.z@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2019 10:08:28 +0000
Message-Id: <20190619100828.17965-2-andrey.z@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] cpuburn-arm: add aarch64 machine and build configuration
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
X-List-Received-Date: Wed, 19 Jun 2019 10:08:38 -0000

Add aarch64 as a valid machine to cpuburn recipe and split compilation
task.

The only source file which supports the aarch64 build is cpuburn-a53.S,
and in case if TUNE is set to aarch64 - this should be the only file to
be assembled to the application.

In case of 32-bit build - all sources are compiled as they are, since
cpuburn-a53.S supports both 32- and 64-bit tunes.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 .../cpuburn/cpuburn-arm_git.bb                | 32 +++++++++++++------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
index 6189da39f..b21212a43 100644
--- a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
+++ b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
@@ -18,21 +18,35 @@ SRC_URI = "git://github.com/ssvb/cpuburn-arm.git \
 S = "${WORKDIR}/git"
 
 do_compile() {
-    ${CC} ${CFLAGS} ${LDFLAGS} burn.S -o burn
-    ${CC} ${CFLAGS} ${LDFLAGS} cpuburn-a7.S -o burn-a7
-    ${CC} ${CFLAGS} ${LDFLAGS} cpuburn-a8.S -o burn-a8
-    ${CC} ${CFLAGS} ${LDFLAGS} cpuburn-a9.S -o burn-a9
-    ${CC} ${CFLAGS} ${LDFLAGS} cpuburn-a53.S -o burn-a53
-    ${CC} ${CFLAGS} ${LDFLAGS} cpuburn-krait.S -o burn-krait
+
+    # If the arch is set to ARM 64-bit -  we only produce and ship burn-a53 version.
+    # In case of ARM 32-bit - we would build all variants, since burn-a53 supports both
+    # 32 and 64-bit builds
+    if ${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'true', 'false', d)}; then
+        ${CC} ${CFLAGS} ${LDFLAGS} cpuburn-a53.S -o burn-a53
+    else
+        ${CC} ${CFLAGS} ${LDFLAGS} burn.S -o burn
+        ${CC} ${CFLAGS} ${LDFLAGS} cpuburn-a7.S -o burn-a7
+        ${CC} ${CFLAGS} ${LDFLAGS} cpuburn-a8.S -o burn-a8
+        ${CC} ${CFLAGS} ${LDFLAGS} cpuburn-a9.S -o burn-a9
+        ${CC} ${CFLAGS} ${LDFLAGS} cpuburn-a53.S -o burn-a53
+        ${CC} ${CFLAGS} ${LDFLAGS} cpuburn-krait.S -o burn-krait
+    fi
 }
 
 do_install() {
     install -d ${D}${bindir}
-    for f in burn burn-a7 burn-a8 burn-a9 burn-a53 burn-krait; do
-        install -m 0755 $f ${D}${bindir}/$f
-    done
+
+    if ${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'true', 'false', d)}; then
+        install -m 0755 burn-a53 ${D}${bindir}
+    else
+        for f in burn burn-a7 burn-a8 burn-a9 burn-a53 burn-krait; do
+            install -m 0755 $f ${D}${bindir}/$f
+        done
+    fi
 }
 
 COMPATIBLE_MACHINE ?= "(^$)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
 COMPATIBLE_MACHINE_armv7ve = "(.*)"
+COMPATIBLE_MACHINE_aarch64 = "(.*)"
-- 
2.17.1


