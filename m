Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7ADE67730D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jun 2016 12:33:46 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id h68so1827682lfh.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jun 2016 05:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SsgTSqtaytzMG1KjJresWO7MsDD80aRiJSLm6fjlMBg=;
	b=H0pP1efZf82HO9sSjCdIPM5d73/PuE+fbxpqkENpdiPfE3CRysEWyvEGfHlUUfY3Al
	dBKtGunAVw/WNguIQlf6jRzMYccciTUc+wg0ihxJrcvWw53S5C+ZvMTBhgmgkPOgZkHz
	ri7J476XVznVOVTb0ulUA2I4VWYSgsmF3cQw9HQl0cfEEli+Uqqf8gyTOQL1MVob+NTx
	PvvdPsgzLK0winQOKc3WheTjctX/dAeFYg+pN4PQPQU/Opypbez0lyoixpKH0ASJe7Ud
	nC7RzLhoLIOoQ8JDL2qgln/TEdERqlYtpR0SLcNxcZYo64yzYS4yQiODFYiq/GUEJD+9
	7Fig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SsgTSqtaytzMG1KjJresWO7MsDD80aRiJSLm6fjlMBg=;
	b=g53sn/0YLy3tGOGWnvBar4xbyMo9sO/QlINHifIZHCsMvC2EO8eJ8UNq6sSvUoymJG
	6Nw2/130gV9QOUGByNW+C9shBtsREIQ9hZq2OB0eOSzZdVrlmAYCN5BRVLd/8ru5Y4vK
	X7PhpXSpJKzEKt2OG9OvSpR092FP/dOE/UqCetwX9moPL2lNOTq1Tn8B+sNXrUm1U/9q
	Gr8BjxJZoRYBmwxvMWhJNquOVKSbRS6XsZaoqbsN6dQI/1Ga6I5LDDO+GjUU+Rh2Q6MF
	9mGyZbybUVedRl7lFdq6Y4SJLPU33JPm2Giy8+3mXzRGnxyCE2/1wdB+CgJHdk7pIPE6
	4Oig==
X-Gm-Message-State: ALyK8tKFTNEVVzHB2fLgC1Rbo6fC+X4c4eQDr1BG1OR+VbRhhqVYxNSZB4horETtA5WkrQ==
X-Received: by 10.25.43.85 with SMTP id r82mr1687967lfr.63.1464784426198;
	Wed, 01 Jun 2016 05:33:46 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	h72sm3522329ljh.38.2016.06.01.05.33.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jun 2016 05:33:44 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, Martin.Jansa@gmail.com,
	otavio@ossystems.com.br
Date: Wed,  1 Jun 2016 14:33:42 +0200
Message-Id: <1464784422-7127-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.1
Subject: [meta-oe][PATCH] opencv: Make gphoto2 dep optional via PACKAGECONFIG
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
X-List-Received-Date: Wed, 01 Jun 2016 12:33:49 -0000

Opencv can build without support for gphoto2 if needed.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 789512f9e0ac..512f1b3dea9b 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -10,7 +10,7 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEFAULT_PREFERENCE = "-1"
 
-DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0 libwebp libgphoto2 protobuf protobuf-native"
+DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0 libwebp protobuf protobuf-native"
 
 SRCREV_opencv = "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
 SRCREV_contrib = "5409d5ad560523c85c6796cc5a009347072d883c"
@@ -54,6 +54,7 @@ PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l gstreamer samples tbb \
 PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
 PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
 PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen,"
+PACKAGECONFIG[gphoto2] = "-DWITH_GPHOTO2=ON,-DWITH_GPHOTO2=OFF,libgphoto2,"
 PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER=ON,-DWITH_GSTREAMER=OFF,gstreamer1.0 gstreamer1.0-plugins-base,"
 PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+3,"
 PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
-- 
2.8.1


