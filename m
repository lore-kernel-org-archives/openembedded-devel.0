Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0C78771E48
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 21:04:11 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id y21so4872917lfa.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 13:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6WjBFJwAoo+bZJqtxXz9LZmU/3eiLDlDlzSJDDSV/xM=;
	b=P0OO23ySFldc4RVArieHm96yDS8qrf5IFBe10882xjFsnrRCy79wZ/aZoRzwDR47iH
	Od2OO1BHnDCF/wfzCWSWjxkP9fEa19CRBL1qckhb36Z4ZFP8kVIDVTpitfm5wLUVn3y0
	/Hk58wwqTIZmPr/8ZfLW2S0yDJF1l5cgHfjxKoqS/Q9NQowxA2+cjJMABBLspHxLSiGY
	U6+1QGnQ+izBx8B2+XZSQeJD7+tpWRI4YnRqvuXcQJU3mS59uMAMYxNXUgWzGIPLaBtB
	V3lik55SRij3fCyaGlQXjs2IyLStaPD5/N456qxxm7WD4j4CfPxNZOfjfXnqzOhp+tr/
	WxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6WjBFJwAoo+bZJqtxXz9LZmU/3eiLDlDlzSJDDSV/xM=;
	b=F4/9exaJkzv4P8248IimfJkFy+dt0WYhpu26DX7vYmTfKnwAL+zyZFivPy0Bak2ia0
	SiBPSkJBqljPypqZIk1nQE7kNHNqdc/SRaNEcCncEsaOpYKulZkAD6vmOox09NzUjC7e
	0t21dx68iYdvnsNSg9MWjdfKfU2l5z0CXNWmVR2Z4B5i3IlHuP3vKcmh0gxXZnjh2DgR
	WZ/Eg7my3+S1BWNtDdTGCRC4EXdDbEs9nNYjiaS3b226K6C/crSpTMW/I1vKsH9TNwvV
	JdyiFCjtXl/Sq7+6z/gE8SgJ3VoV2AdvBYTyi+QMvsP2JPOQH1qX9Dbo4Z90qjb1rZEe
	aDyw==
X-Gm-Message-State: AKaTC039YJKYqh+YUDf2nGdFvk/cx75aYyyw9xWgZ9F+9p4SEo1j15hdudgqdt0SBWTlEg==
X-Received: by 10.46.72.1 with SMTP id v1mr34751850lja.49.1481663052986;
	Tue, 13 Dec 2016 13:04:12 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id 26sm6678921lji.37.2016.12.13.13.04.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Dec 2016 13:04:11 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, Martin.Jansa@gmail.com,
	ross.burton@intel.com
Date: Tue, 13 Dec 2016 22:03:59 +0100
Message-Id: <20161213210404.6940-3-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161213210404.6940-1-ricardo.ribalda@gmail.com>
References: <20161213210404.6940-1-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH 3/8] opencv: Add missing depends
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
X-List-Received-Date: Tue, 13 Dec 2016 21:04:12 -0000

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


