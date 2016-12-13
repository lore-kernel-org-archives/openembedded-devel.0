Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id E886D71D9F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 21:04:17 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id o20so4878632lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 13:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=k1nODblyonta0C0QNRTo2EjA7fYu1DnnxmDj7Wq7eXw=;
	b=OKx2hIo6wXQUHodytbkOzzXU1yovd1OTWSIW0hgq5THIDaV9+ieiC52E1GdwlFgzwH
	VEUrCv8/mThbZfAnU+3pPd9uXSlIuifZid0jk1yfPZlvzR3ElLvqUNxj+SajV+IUSjKm
	sNBXYyrO9dv7QDImV14GYhvJzf7H2cuUiI5Kov+6EPLSspszo+EFEjMqyadinlsz4m7T
	lMW91o4wEmb+/c0ZX5sJS6+a+eIThGyW4nnXa+UrwhHU+SkVNAMdxNX8VcHDAiK1UnI5
	vAJQHk7eurilBDffmfdT1RRVr/i3Y14elIB5erG8LCqFEwNVgvxYX+UGUQ5R1lztuUG/
	K5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=k1nODblyonta0C0QNRTo2EjA7fYu1DnnxmDj7Wq7eXw=;
	b=G9FvNkRXQXNbS7Dl8t8JbGGjZvnqGKonpoFhsH7jm61nxet+HN0TVS4IRAKWIPTndW
	dJdRlUKYGkcAlrXrYjp02s2Q1/6u6eXrLh0HWgcAGcDfgA2GjwbSZNKLP0kCihM7RH9o
	RLUzJ/YPP/kJ9ZVDW/BoK5OIYO8fJSolh535rfmz1HxRF1wi4WuOzJ9LqggowWcWVl6R
	uiDfiuPzHpKtnABe7advfHySWamcxfWZbTPfPkIFMqte9D41KX0pcMOD7vDfZKCEvejk
	XH0Cb1msZF3Hcou3d3NEeRf285F6OpXVSFKd9rHLoZFEAkSJbPz0uavV7eInTfpdsT5V
	gSRA==
X-Gm-Message-State: AKaTC01baWHKCVHOxBWXQTv4Etm9QyinIUkNYXC4rh5aRwryL5dSGNjXJ3BHxs0Klv4qPw==
X-Received: by 10.25.0.196 with SMTP id 187mr9421005lfa.156.1481663058025;
	Tue, 13 Dec 2016 13:04:18 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id 26sm6678921lji.37.2016.12.13.13.04.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Dec 2016 13:04:16 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, Martin.Jansa@gmail.com,
	ross.burton@intel.com
Date: Tue, 13 Dec 2016 22:04:02 +0100
Message-Id: <20161213210404.6940-6-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161213210404.6940-1-ricardo.ribalda@gmail.com>
References: <20161213210404.6940-1-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH 6/8] opencv: Add missing DEPEND for opencl PKGCFG
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
X-List-Received-Date: Tue, 13 Dec 2016 21:04:18 -0000

OpenCL headers are not enough, we also require a valid icd (.so)

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 5a334fdd16d6..8cab3b87ea95 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -62,7 +62,7 @@ PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
 PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
 PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
 PACKAGECONFIG[libv4l] = "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
-PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers,"
+PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers virtual/opencl-icd,"
 PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${ORACLE_JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
 PACKAGECONFIG[java] = "-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native fastjar-native openjdk-8-native,"
 PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
-- 
2.10.2


