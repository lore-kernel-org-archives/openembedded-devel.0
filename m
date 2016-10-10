Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 812486FFED
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Oct 2016 16:31:09 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id 74so121577wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Oct 2016 09:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=cEElIR6FWcfLuR/5pqZuuCrOiV/xxxARZrvo212iK4I=;
	b=o/8VBK+acv5G070gTItufPcPfoYXu+gzNiDGXufczdQqBZzFdVqLGgd+8dCHemG6Ud
	a8AuyykSKc3FH41KTVyJfmy7nTxmh5kFpwoFRSdiKAtyDausrt1kI4XjWqkjK/orYdNo
	qyLjskgsUqcsNcG4zDeMI2E0rnLWx2KzAtgu2L2btJQbmn5zGomnwC2uhHaI+qcPfXXj
	Xo7uI1/SewFTw+/nRUn7N6O62Y/y3ch6zd3Kx7D7PQBsB8sXckf9H+S9sGXFwZDMArdv
	Dl1wN6lwIKKLY2/cJgI62hV1gRWDh3Dzw6GLsM40fFpRz5BukO4ThmLOg8dJDEkw2JYm
	4LVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=cEElIR6FWcfLuR/5pqZuuCrOiV/xxxARZrvo212iK4I=;
	b=j/asWtbRowRc/Db2ucIk5BupbK2RwNTCkzrCZ0biBZSqOyjeetLyzmhmaYoyPeo+su
	BWhRNGWryhwoaJjKouGiCRHI/sZLk9eQt9HmbaPNEdow9edlYY5mP7ianUIiKx1qDxLi
	4ZprMW6K4OCq8re/Fp/xtLCk3l9JsQnhyDSXGpGpey2afm49s/T4zTGC1F0UPGqnV2in
	c+jZ8YzH18o9U3oAdh3hWtFugbCtMyVu+Tyosw94RZgC0LESXYB5pFVm2zzZlGtqhRRQ
	tuWY1/+TB+wjK5279VZ/PoJifrQEbN7K1owNjw7iFC2s5y5M33NhHXMgX4+wE7h6CEzj
	Zu9Q==
X-Gm-Message-State: AA6/9RmMTYMGpyWyu3sV88XDiFnRcGRAXh9q39BRz5xtfOMpDCdNrfWfSq7943CTiYRt7SZS
X-Received: by 10.194.116.225 with SMTP id jz1mr21489511wjb.224.1476117070733; 
	Mon, 10 Oct 2016 09:31:10 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id v3sm7346017wjm.4.2016.10.10.09.31.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 10 Oct 2016 09:31:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Oct 2016 17:31:05 +0100
Message-Id: <1476117065-12316-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH][meta-oe] opencv: fix packaging and install
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
X-List-Received-Date: Mon, 10 Oct 2016 16:31:10 -0000

The OpenCV*.cmake files and the static library should be in the opencv-dev
package, not opencv-apps.

There is no need to specify files for PN-dbg as they're automatically found, so
remove the FILES_PN-dbg assignment.

Conditionalise the installation of the example and tutorial binaries so it
doesn't abort if samples are disabled.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index da11316..2136b07 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -116,15 +116,14 @@ PACKAGES_DYNAMIC += "^libopencv-.*"
 
 FILES_${PN} = ""
 FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
-FILES_${PN}-dbg += "${libdir}/.debug"
-FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
+FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig ${datadir}/OpenCV/*.cmake ${datadir}/OpenCV/3rdparty/lib/*.a"
 FILES_${PN}-doc = "${datadir}/OpenCV/doc"
 FILES_${PN}-java = "${datadir}/OpenCV/java"
 FILES_${PN}-java-dbg = "${datadir}/OpenCV/java/.debug/"
 FILES_${PN}-samples = "${datadir}/OpenCV/samples/"
 FILES_${PN}-samples-dbg = "${datadir}/OpenCV/samples/bin/.debug"
 
-INSANE_SKIP_${PN}-apps = "staticdev"
+INSANE_SKIP_${PN}-dev = "staticdev"
 INSANE_SKIP_${PN}-java = "libdir"
 INSANE_SKIP_${PN}-java-dbg = "libdir"
 
@@ -144,6 +143,8 @@ do_install_append() {
         rm -rf ${D}/usr/lib
     fi
 
-    install -d ${D}${datadir}/OpenCV/samples/bin/
-    cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples/bin/
+    if ${@bb.utils.contains("PACKAGECONFIG", "samples", "true", "false", d)}; then
+        install -d ${D}${datadir}/OpenCV/samples/bin/
+        cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples/bin/
+    fi
 }
-- 
2.8.1


