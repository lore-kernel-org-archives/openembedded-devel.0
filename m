Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id B467E75C61
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 23:46:23 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id 96so221915lfs.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 15:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kSM25SFLp0S4es9E6Lm9A8ovRro/d2RzINGOV0Vx/N0=;
	b=FvePQg+el+ZYlBzfkXZKyQgXVitRYENS1SxtOcvxDYr+2I27oC6Br4QopkjySfQjG3
	RAkFETY2WNfVaC5Hv+ImVk3SxwY7GVJEsIozDnCo7f0Vrx/muxGbJciPzKH2cN8bc371
	BWPDx8m/3glgAVtpEgkPU1JI8hsjo0XokqOFidqLbOUCq+HZK0BDPR7zXT/zPBxPHxDC
	o4sNOMUz3gdduv3AHZXmcdIvlvrGVHWfQRUeVP4EchugZwDSTFqGaqIieDPOHWWpmFFL
	RTfnQPvKvh2jQn8ccGcO/95gMA0MW5/DkAa4kruVXVPmbHmymokHkS4DHTL35UzMFmwT
	sYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kSM25SFLp0S4es9E6Lm9A8ovRro/d2RzINGOV0Vx/N0=;
	b=BhUHzJpUcdAqc87vfXZ426MLHAEzmroPbpsLjHCSEmT4w7NNRg7xUjX3+4SqdZsCjI
	02kvFyWtxwoBjSHHyBAoeD9N5aJ1e3x+/+OFCq2Qg4GE4OTrEwI9J8hqGkO6O+625JzC
	9Oo0xABlLFnGR9Co107qLK/ePeiV8K71cJd8gDLqrkRZUn7B1d98fluemCfI3moFgR5a
	e94kTaF6LOwPcakeA8rfBUOdISe/nqwf9muZKcQXpAP5ZkYKYwjMYuz+IjjeKYem7YKk
	zF4Se6vN7gjPdcXejTfTtSJn74jy0l/YPG2SQE/i2qXMeOKTQiI18JDoBS/4VULiMwXo
	5m9g==
X-Gm-Message-State: AKaTC01JVzuGz8A+ADGyUGS/IhqB5fkC1M946ulytLGcJnheM0QNwKEVPqAAuNQzyxKcpw==
X-Received: by 10.25.192.1 with SMTP id q1mr34844438lff.143.1481672784767;
	Tue, 13 Dec 2016 15:46:24 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	z26sm10269595lja.49.2016.12.13.15.46.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Dec 2016 15:46:24 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, Martin.Jansa@gmail.com,
	ross.burton@intel.com, raj.khem@gmail.com
Date: Wed, 14 Dec 2016 00:46:14 +0100
Message-Id: <20161213234618.31312-4-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161213234618.31312-1-ricardo.ribalda@gmail.com>
References: <20161213234618.31312-1-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v2 4/8] opencv: Add support for OpenJDK
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
X-List-Received-Date: Tue, 13 Dec 2016 23:46:24 -0000

Add support for OpenJDK8 and Oracle-java

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index a5d681e79ca2..5cce2c9eaa16 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -58,11 +58,12 @@ PACKAGECONFIG[gphoto2] = "-DWITH_GPHOTO2=ON,-DWITH_GPHOTO2=OFF,libgphoto2,"
 PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER=ON,-DWITH_GSTREAMER=OFF,gstreamer1.0 gstreamer1.0-plugins-base,"
 PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+3,"
 PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
+PACKAGECONFIG[java] = "-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native fastjar-native openjdk-8-native,"
 PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
 PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
 PACKAGECONFIG[libv4l] = "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
 PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers,"
-PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
+PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${ORACLE_JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
 PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
 PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF,,"
 PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
@@ -73,12 +74,14 @@ inherit distutils-base pkgconfig cmake
 
 export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
 export PYTHON="${STAGING_BINDIR_NATIVE}/python"
-export JAVA_HOME="${STAGING_DIR_NATIVE}/usr/bin/java"
+export ORACLE_JAVA_HOME="${STAGING_DIR_NATIVE}/usr/bin/java"
+export JAVA_HOME="${STAGING_DIR_NATIVE}/usr/lib/jvm/openjdk-8-native"
 export ANT_DIR="${STAGING_DIR_NATIVE}/usr/share/ant/"
 
 TARGET_CC_ARCH += "-I${S}/include "
 
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'oracle-java', '${PN}-java-dbg ${PN}-java', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'java', '${PN}-java-dbg ${PN}-java', '', d)} \
     ${PN}-samples-dbg ${PN}-samples ${PN}-apps python-opencv"
 
 python populate_packages_prepend () {
-- 
2.10.2


