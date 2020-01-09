Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 407447FE07
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 16:21:48 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y11so8034768wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2020 08:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Z8j3pEzUjWAIMG4BjPYjuVC247I05KtSNrA8sltuMDQ=;
	b=PDx7vWMztCKUvooD3/mj5Btlp5qVVsJ0pZho+jdwk9H8Ypj9qyDR1P2UBWhhEhcChs
	n5Ve2dif3c6xRm1qj5Xl+uMnkceKOnBcosuesNCz9SZlNc1qoBVmbVAi2JtSuqw64TJr
	2jBwFUKpMvXrL9x+AZz8k1efeaATQaknSbUO3A/AJSieAjH4SbiOeyAxQN94f09OqtX6
	JSScGVkdH9xqSau+iFN7ci0neQUTBYzBkB3b06oyqENRZy3sOcyEE+BC2J34Ff4G0JPD
	vU5zPHNnn+5Q4HckAaOXCC27VOL34/HCFd7ee/qxNBPo2jycHDHVjvfMzGd+GUl3ErHP
	N6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Z8j3pEzUjWAIMG4BjPYjuVC247I05KtSNrA8sltuMDQ=;
	b=tLybvga1F4cOqWMAL733WosEQq2OhFvUQwSAjU+2O+DQX7cktNjEQbBJRlbxdIV0Kv
	EZ9A0zFlVzBkClyLS+f3RycQHxUFJMCPjpXrHMsdllf6jWVtj/9ozJsJ3Srvys7GXkTY
	f8y8jyhTVwYexoZaV+vNYUn8mkIUMWeQDUGaMn4OR+twlGYO54gq5NAXMaTaWvXY5FIZ
	PKMB5dxtWXOl5M41SedJezQclRNrVs2rH31HUuE9mVqReGHOWzZY+NOMH2gEp18YSmu6
	zLjC4/hsJXsdP0wdoLwPFIel2qfeTvyFRFjd2oOksl3TfB5rhu9EUq6EMj2zr1z8olVf
	P15w==
X-Gm-Message-State: APjAAAXZbXTA8DEbbvy+PYWREtyk7+gOUT9kAGkrbH1hwOl3BHUgFBNA
	zGUgaa38QUu7sALdJTUv0yNaK70cCKw=
X-Google-Smtp-Source: APXvYqwMZ4IzJfHtlKBGn1Vm8Ax1rd52UzAO6SyQv3YOgHEvo9fwTcAIpAkZLdZfsvWbWAv7nBOoZg==
X-Received: by 2002:a5d:410e:: with SMTP id l14mr11411406wrp.238.1578586908467;
	Thu, 09 Jan 2020 08:21:48 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d14sm8655010wru.9.2020.01.09.08.21.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 08:21:47 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jan 2020 16:21:38 +0000
Message-Id: <20200109162141.20579-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/4] opencv: don't download during configure
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
X-List-Received-Date: Thu, 09 Jan 2020 16:21:48 -0000
Content-Transfer-Encoding: 8bit

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
2.20.1


