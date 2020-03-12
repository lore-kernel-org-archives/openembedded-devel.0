Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0459561C2A
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Mar 2020 02:57:44 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id l41so2003359pjb.1
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Mar 2020 19:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=cDlfld8qE9/PSawNnNq2exL1uzBBako7ooqNuvUpJZs=;
	b=fCZVU9cKIS6Bn8VFJGxBALknVfVLOLc3eJGyWwyM+CBnVM548eHnhMtaBgrxhYo+ZR
	udMTBOAxd2eiuJaDvTYcVsvgAlJmUpV+kVNjiLqviQMsqgGe9HSD0qGTmcnd+LjgBPko
	WE/lJeJpVqcXWL9ZDn0ebGo79rxMSPX6K8Hddb7OjaPcuHBL+rYFSQ8a/vfxDeRJAqiG
	dB7r9z0Dvl+JzLkfjCg4dXy412tuK9tW2/Iy4NPLn2OvbLA8vDzOixKpzwgrT6IPGGn7
	5aLve6/UxC/Br8h69LCtmLcLC6k2pEQ1CH8qe6UBGZwoqJ6V2iSJwn+ijVfBERu/x84O
	dLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=cDlfld8qE9/PSawNnNq2exL1uzBBako7ooqNuvUpJZs=;
	b=G/kFQikazMtxvOTQJlOHj+aaBTTu6xKbzFMtrpPKXbad7ilMTkR+8gKhjSrHjIW4vO
	Ci3LmK1ypah4RIPNTxj+J5BhVAGMz9D+LkRT3JIJKIN9L3OPX6BrJazzdmWXqjoUl3d5
	9YoXaE+WYDDOEAc08mhWmuLjxL889/WpWbTIs4PthOYk4zasPq3pdwz4gFKAn4MiFmj2
	LAKkl+BSuHm5Ded5BW516dZcomHMRbthftXRQiOcbmwxWrwUyQj1quZ/yD72aAHvmFAt
	Uo6kfffSGC0G9qrbYvBA29IdZJyIYZtr6mRy3AVSUB5xO0ykUnFrZNHireSqlxpTXUVe
	/xiw==
X-Gm-Message-State: ANhLgQ0fnaj51kwsoXKwQjtRX2jFjzKQqGAL5pJVPQGePchLDIDFM30S
	yFlepdYWdZze/x2X4s82lQLCGrTC
X-Google-Smtp-Source: ADFU+vsd8jX5jvejLPb85j0pKzJofA4seym37T5D+EmpPmpV0x6q5jSlp4S9N+lk7amrz/Ifb/p8kw==
X-Received: by 2002:a17:90a:2663:: with SMTP id
	l90mr1695645pje.188.1583981865798; 
	Wed, 11 Mar 2020 19:57:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:60a5:8a88:a7f9:d809])
	by smtp.gmail.com with ESMTPSA id
	e2sm18328236pgv.81.2020.03.11.19.57.44
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 19:57:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Wed, 11 Mar 2020 19:57:27 -0700
Message-Id: <289c3f9fb5a395fa660f21d3768b7d70f04af040.1583981708.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583981708.git.akuster808@gmail.com>
References: <cover.1583981708.git.akuster808@gmail.com>
Subject: [zeus 08/13] opencv: don't download during configure
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
X-List-Received-Date: Thu, 12 Mar 2020 02:57:45 -0000

From: Ross Burton <ross.burton@intel.com>

OpenCV downloads data files during the CMake configure phase, which
is bad because fetching should only happen in do_fetch (and if proxies
are needed, won't be set in do_configure).

The recipe attempts to solve this already by having the repositories in
SRC_URI and moving the files to the correct place before do_configure().
However they are written to ${B} which is then wiped in do_configure so
they're not used.

The OpenCV download logic has a download cache with specially formatted
filenames, so take the downloaded files and populate the cache.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/opencv/opencv_4.1.0.bb    | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
index 5e89db0977..cfc7854e1d 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
@@ -51,10 +51,28 @@ PV = "4.1.0"
 
 S = "${WORKDIR}/git"
 
+# OpenCV wants to download more files during configure.  We download these in
+# do_fetch and construct a source cache in the format it expects
+OPENCV_DLDIR = "${WORKDIR}/downloads"
+
 do_unpack_extra() {
     tar xzf ${WORKDIR}/ipp/ippicv/${IPP_FILENAME} -C ${WORKDIR}
-    cp ${WORKDIR}/vgg/*.i ${WORKDIR}/contrib/modules/xfeatures2d/src
-    cp ${WORKDIR}/boostdesc/*.i ${WORKDIR}/contrib/modules/xfeatures2d/src
+
+    md5() {
+        # Return the MD5 of $1
+        echo $(md5sum $1 | cut -d' ' -f1)
+    }
+    cache() {
+        TAG=$1
+        shift
+        mkdir --parents ${OPENCV_DLDIR}/$TAG
+        for F in $*; do
+            DEST=${OPENCV_DLDIR}/$TAG/$(md5 $F)-$(basename $F)
+            test -e $DEST || ln -s $F $DEST
+        done
+    }
+    cache xfeatures2d/boostdesc ${WORKDIR}/boostdesc/*.i
+    cache xfeatures2d/vgg ${WORKDIR}/vgg/*.i
 }
 addtask unpack_extra after do_unpack before do_patch
 
@@ -65,6 +83,7 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
     -DOPENCV_ICV_HASH=${IPP_MD5} \
     -DIPPROOT=${WORKDIR}/ippicv_lnx \
     -DOPENCV_GENERATE_PKGCONFIG=ON \
+    -DOPENCV_DOWNLOAD_PATH=${OPENCV_DLDIR} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
-- 
2.17.1


