Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id C1007760A3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 23:46:25 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id 96so221953lfs.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 15:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ip/lknQS0yT4b0mWwZtytWVmKujvU53Ht6FqWmNqr64=;
	b=024YBDn1RBmTyuKb8+STeax8c0Fja97gh4lwPTMZ6nDZ18OcsRt6iMcuRtPo+YtcOB
	fWHVRH0ApKsCJF0fl8mPi5Ll3Z/BqBfmTCAk1RNCwu+spuYDDX5L3pxAikguEB8P6yzT
	c47l0xLkQnFIemrUAOlPP0bGcxCzuYMxZPD7iJa25AZCYafXenDBlmUPik2hiXqZekWq
	Gr6PLGCbsGxAUcBrd+yu2nDP/uGNWQl5uCevpwMjweKv1u+D733m95mJjUNKYeD1EnPt
	LGG18w6JyLLieQJk/4v9HdMnrJHMBm4KhFSCuo/+fBcg7gcHRg6f5qG0snD7FPZb7Y2Y
	YzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ip/lknQS0yT4b0mWwZtytWVmKujvU53Ht6FqWmNqr64=;
	b=HBwTjDCU4zbo4Q+AV2YTJFv1IAdEvj+8A28HXi3J9nzc8eQkjObFtWFSYlOJ1Ztw3z
	3VwBzzfsfk+WBADZcYq9Xm6GxPNFOzWpkjx0Q5Nb9z+lpUuzG5rVHuQgSC69SZ+tbZ6c
	GdbBp+QDpLemraTq33P5V9+rOUPrdDfmxt9xkezaMgEEiFsKPa7nGiSbC6e4D1+6ig0+
	uadAamsayFAc8817Zoz7hisKq1pYdFOPpXEIkvEQam5FaYv4tOz/9pYi0zrUEpErgXqI
	FZ96voZ6x7OU9MR79SxZvZ1YsUTI+B+lpgX8IgJrZFzUkHYaa8Ls+t3bKvAZEc+Dmz+W
	wdNw==
X-Gm-Message-State: AKaTC03tiOOilnUk7KrUdtkraTzZGY1isvRHLd2JVpce+fjSgiWPFKkYNCyWeaxTWYonJw==
X-Received: by 10.25.215.212 with SMTP id q81mr28422348lfi.126.1481672786871; 
	Tue, 13 Dec 2016 15:46:26 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	z26sm10269595lja.49.2016.12.13.15.46.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Dec 2016 15:46:26 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, Martin.Jansa@gmail.com,
	ross.burton@intel.com, raj.khem@gmail.com
Date: Wed, 14 Dec 2016 00:46:16 +0100
Message-Id: <20161213234618.31312-6-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161213234618.31312-1-ricardo.ribalda@gmail.com>
References: <20161213234618.31312-1-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v2 6/8] opencv: Add missing DEPEND for opencl PKGCFG
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
X-List-Received-Date: Tue, 13 Dec 2016 23:46:26 -0000

OpenCL headers are not enough, we also require a valid icd (.so)

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 674604018098..df75e63f2748 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -61,7 +61,7 @@ PACKAGECONFIG[java] = "-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_INCLUDE_P
 PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
 PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
 PACKAGECONFIG[libv4l] = "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
-PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers,"
+PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers virtual/opencl-icd,"
 PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${ORACLE_JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
 PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
 PACKAGECONFIG[python2] = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include,,python-numpy,"
-- 
2.10.2


