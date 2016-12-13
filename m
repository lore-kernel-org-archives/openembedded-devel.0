Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 776BB71E47
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 21:04:13 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id y21so4873019lfa.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 13:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PdV51Ox8ZOcgfneVHpt/DHIidG8P1lStuVs/Ra1JHtM=;
	b=wVLHBPNqwG9z1MT697oH0+S0SJsNp9qDhI/jaHbGilzN0xB4DQPVhvGxtYzc67Xg61
	F4cQ32y3b46NpaBqy6p7a9wOCi3P1TGOpuO489bH3w/QoOC++hrRNCM2VmHts3foS3R4
	m5HtGyHQpJGp8dKnqv7dRBHEwBNdf+JsQdDJtV9LjK0ufyixQ9xsw2+UaZH1nWSlaRSU
	MqH1Ii7l3FQQwA6RlJPKKmk/wJAxcqh0kdZTrUD5HIkrrEg+0CJnSMY02im1oO2XqxAK
	S+s5o5dyZHZYfXoyfEfPnnm6uozQBQQvjuu1zd0g8Rqs5TSp40TUMZw6I4A2ZsypKgzJ
	2F2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PdV51Ox8ZOcgfneVHpt/DHIidG8P1lStuVs/Ra1JHtM=;
	b=c0xJuvLRqNmTR8oqD24M7Ka7SiKCQg0ASgXNuj2idPDJD24ReM/onWz/8rf7ISHt75
	t7qiTg4Gzvld4trYgYTZKqocxT+8465RrXBkxFFdai2otQ3Ov8PDhJxzZ5WwqaLaexDA
	CY0BIMmqTvG0GieXPQ9FVYe04phvSRJTOalgRopQOAM3nMdGXa1I/zfWV/TJWm5/K0bE
	YdCvKFVyi1BqJT3maHtRcNZudJvHbpw/737DyX8KyJfv7R5CVeoTR7iH3BqPtY6Co1zt
	0olmwcHRN99cOcJ2U1US6tXr8JLr/qc9D3HXkz5cNAJxqGqpMI+QIOI37on7XTa6CuIi
	iugw==
X-Gm-Message-State: AKaTC01tND0VaTSm9bcaj8W+CLg3GtEj2Ngtkd+scTLqJcWSf0kYtCLo4n9hC5jUvd+5GQ==
X-Received: by 10.46.77.92 with SMTP id a89mr39689415ljb.28.1481663054554;
	Tue, 13 Dec 2016 13:04:14 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id 26sm6678921lji.37.2016.12.13.13.04.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Dec 2016 13:04:13 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, Martin.Jansa@gmail.com,
	ross.burton@intel.com
Date: Tue, 13 Dec 2016 22:04:00 +0100
Message-Id: <20161213210404.6940-4-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161213210404.6940-1-ricardo.ribalda@gmail.com>
References: <20161213210404.6940-1-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH 4/8] opencv: Add support for OpenJDK
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
X-List-Received-Date: Tue, 13 Dec 2016 21:04:14 -0000

Add support for OpenJDK8 and Oracle-java

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index a5d681e79ca2..6e877f17749f 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -62,7 +62,8 @@ PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
 PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
 PACKAGECONFIG[libv4l] = "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
 PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers,"
-PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
+PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${ORACLE_JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
+PACKAGECONFIG[java] = "-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native fastjar-native openjdk-8-native,"
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


