Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9E371771FA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jun 2016 13:13:28 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id h68so1949006lfh.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jun 2016 06:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xPzUzv6QeAaguLzN0gLjI9SMwglf9oeJfuRyYRX7aX8=;
	b=jQM1/koJ0Y/Z9e+LMlUNNMJdf5gIkPnR6JKtypg/4ogNeq8e/57O60a9ci59uk4Y0l
	v8eU05Y57sefFBE0vqbYF2wDnQvrGMTAIKiMBKACH0CYc4CnjCE6varwFQ/C8SSsRPT3
	lXFDI9VQWivpxzLdrZedNHbB6zovg6/zyYqTmBOUdr1gV7/gz6C5C8IV6DTcfX5OoY8W
	u4VslL+t47MfGvAyJBkmWGJwcBrxUvu5Oz09EgB+5tZFyOgdRacYMb61ugg5LWNFIF+K
	tagtxkzntv3KMwjoigLX+bhC7Qpq3zMfyXj25vYA5muvdDp3JiG5KjNETLoSsnni1mjQ
	9N2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xPzUzv6QeAaguLzN0gLjI9SMwglf9oeJfuRyYRX7aX8=;
	b=lonaH59Tf9GgecC85GwpolE0YSlEw9aUiVcGiU8i49r3t77a8c66aXarArwK+AOUwl
	IrkDPtw9mk6DTnF8DxobWP/aynYtzszOl6J/qPrtuiCENBJcAq79q39RAVCMHZxpullz
	W/UAuqCOSIFvGa7i+XQds2Hpyz/FChEzWwIIcebyI8cdZznjV0BDZCJNJ6rltfMt1RG2
	SKZUcXZxBQBLCyOuFMWhO0amtb0whctmU/9xVTmcl/Mv1/VSXV/oZPLtGjYEYcX7hfmT
	tnnz153VzekJWumbmRO6y3Ng5Sw3kyu5q5EWqHrFoQK3Ul+nlm5GUTLrqnsRgEs5Pb0N
	pgBw==
X-Gm-Message-State: ALyK8tIB9YD9/U01cEW7C/ncpwfT721uX/1z3oo5EK7Ve5F9txtXEmrkJCCYsTgYm40u9g==
X-Received: by 10.25.154.70 with SMTP id c67mr1728329lfe.87.1464786808512;
	Wed, 01 Jun 2016 06:13:28 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	d202sm2438223lfe.36.2016.06.01.06.13.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jun 2016 06:13:27 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, otavio@ossystems.com.br,
	Martin.Jansa@gmail.com
Date: Wed,  1 Jun 2016 15:13:22 +0200
Message-Id: <1464786802-11176-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.1
Subject: [meta-oe][PATCH] opencv: Reorder PACKAGES variable
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
X-List-Received-Date: Wed, 01 Jun 2016 13:13:32 -0000

PACKAGES content order is important, because it determines the
destination of the files, when the folders overlaps.

Without this patch:

NOTE: Executing RunQueue Tasks
ERROR: QA Issue: non debug package contains .debug directory:
opencv-apps path
packages-split/opencv-apps/usr/share/OpenCV/java/.debug/libopencv_java310.so
[debug-files]
WARNING: QA Issue: opencv-apps: found library in wrong location:
/usr/share/OpenCV/java/libopencv_java310.so
opencv-apps: found library in wrong location:
/usr/share/OpenCV/java/.debug/libopencv_java310.so [libdir]
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa

Fixes: 3132af1d1d15 ("opencv: Fix metapkg dependencies for opencv-java ... ")
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 512f1b3dea9b..83a300e44801 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -80,8 +80,8 @@ export ANT_DIR="${STAGING_DIR_NATIVE}/usr/share/ant/"
 
 TARGET_CC_ARCH += "-I${S}/include "
 
-PACKAGES += "${PN}-samples-dbg ${PN}-samples ${PN}-apps python-opencv \
-             ${@bb.utils.contains('PACKAGECONFIG', 'oracle-java', '${PN}-java-dbg ${PN}-java', '', d)}"
+PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'oracle-java', '${PN}-java-dbg ${PN}-java', '', d)} \
+             ${PN}-samples-dbg ${PN}-samples ${PN}-apps python-opencv"
 
 python populate_packages_prepend () {
     cv_libdir = d.expand('${libdir}')
-- 
2.8.1


