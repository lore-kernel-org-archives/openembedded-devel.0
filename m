Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id E70BF734B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 23:46:22 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id 96so221862lfs.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 15:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6WjBFJwAoo+bZJqtxXz9LZmU/3eiLDlDlzSJDDSV/xM=;
	b=KkvTvJ3U30bgYT8792bJV7PcwAJY7QC3OglUWnNEVCJZHqOnbYZlqy+bG8UR1l7ACc
	u27rW4ob/OX4VfYcyJZ4MDihQX2gr063IeGsuSitoaCFsBleSTWxDQe/FF3aEsaiRjGF
	p9b70aozs7Sz8DoSeyOWkSjppwaYliVX15zhlIKjp6mu2EoOL1eb09k37FdDKgBNW2mC
	qg41Ww2TfhvDagzKfHX2ZhG01Zrg6IqA30U5DJwsWGUjlvLzRs9VFNKMQI06EqwIcgQr
	79wfq8Zywo4t/tmHHw8uxs9BO6F/vakj8K5cAzf064pyHxooqrkALcf1SmNK9qx70RHG
	SNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6WjBFJwAoo+bZJqtxXz9LZmU/3eiLDlDlzSJDDSV/xM=;
	b=gAl0TgVeRlrq+XTdTes343NEw1RjBYxFd5L/dmcB3HPdZLu30NE7m7CW6xGeXw5L+k
	7T0Ko0RiDqU+nBhqbEqOxapdWiMQEWlEJt7FoozH6We3HufmDH3W9QHhcnQyODLdrovW
	jgjxQSy2bG++IA7cBWaX7IAq05ogYCqfLE5yeoDHLuiqjVS4Khm40D6Eufm+trvXCUAT
	YYoAByls1S0FgFzy7h1mMJnECCBcKxVI9O1hpXr7Jjo63eUeQqgM7NDDPYbMp0dAJwT+
	/fWhg/d9RBe/QjQhRxFWzMZ1cxKLHaBlULsNUdqoxzp+i/3QX7RlTp8cMunQs34r0RNJ
	tCiA==
X-Gm-Message-State: AKaTC02EWgpQr85yiPcKjv3QcEiPgdi+1Q86KSEJZMoil3RvZzv9OvMUNultKfR1iS6ifw==
X-Received: by 10.25.202.6 with SMTP id a6mr33623094lfg.30.1481672783667;
	Tue, 13 Dec 2016 15:46:23 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	z26sm10269595lja.49.2016.12.13.15.46.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Dec 2016 15:46:22 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, Martin.Jansa@gmail.com,
	ross.burton@intel.com, raj.khem@gmail.com
Date: Wed, 14 Dec 2016 00:46:13 +0100
Message-Id: <20161213234618.31312-3-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161213234618.31312-1-ricardo.ribalda@gmail.com>
References: <20161213234618.31312-1-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v2 3/8] opencv: Add missing depends
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
X-List-Received-Date: Tue, 13 Dec 2016 23:46:23 -0000

contrib/modules/sfm depends on glog, gflags and libeigen. The CmakeList
does not seem to provide a way to disable/enable its build.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index cf41d894cf7f..a5d681e79ca2 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -53,7 +53,7 @@ PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l gstreamer samples tbb  gphoto2
 
 PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
 PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
-PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen,"
+PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen gflags glog,"
 PACKAGECONFIG[gphoto2] = "-DWITH_GPHOTO2=ON,-DWITH_GPHOTO2=OFF,libgphoto2,"
 PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER=ON,-DWITH_GSTREAMER=OFF,gstreamer1.0 gstreamer1.0-plugins-base,"
 PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+3,"
-- 
2.10.2


