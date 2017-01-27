Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5433A773EE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 15:22:03 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id u68so24335099ywg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 07:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NxCvcl78U+uE0Eg1xmuc29qZksD1a378My7bXii915A=;
	b=FYNe65vhmVwafe+CT+eLmrj+HTt2GJ/If0iJ0mPE1FUX+d9WjgzrFpq+KwwVp/rrMp
	ne3BbZfj+eErLJJOl7aG2TctnRjhJOe7aQFQyr2wnsSDj0FaxUVlP6RjtCKD2X48Kwr8
	aq6Nzvf5BM2FuydaNSL90EfVUEyaz5eYimLfVzprgu2KEPJR/qj5Pkhm3ZC+Kc9M53G6
	NuE6tLXOEGGTWjLCdGBlfa8EtjdSh891OWVsfcmMimFQsaHRgVAEuBbQFifnkhWr53+o
	Ewp4TAzgbwpp2S4nXDyEeEzikmjcB073bPinxpZ2Lvr/Ne1P184xze4zjBUXDWNuM0Q1
	ic8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NxCvcl78U+uE0Eg1xmuc29qZksD1a378My7bXii915A=;
	b=sO5P7B7j3Tp/4+zfe5w+K4J4wIAf6SE8PeF7KVE5QpFbWy8FbUUNT3uZarHAdWhzAZ
	KVEm7KOn3M/ZNKf+xQwITn5gZpgsxxVXZU/Qrtz65aBR/RC09FeX42Jrm7iuU8QoI2tR
	8JcaXHWgy4EKwhtEVk+sxajs2HfEtV31UhXoBAnmZa2eWQSH2TaXFNPZaQhtaFE7aKZD
	KzGKiuROwqkVBDWPjHPUJfN2t8SoG+rWzaKW8JkDwX24IvlLhsNkPeNymToCYarqgubA
	0x0w5tQM21kL5D3+rvJYeDTizwb8STW1lAbyun0OYYqLUfRTFNXNe+rdzn62HyTFm3Vn
	+uhQ==
X-Gm-Message-State: AIkVDXLD8dCNPhJl+wnr/SLYRN0oIF4V3PvPaACBq9iBncLkCBhc3dpAIlWjLo1K2xMWRg==
X-Received: by 10.55.113.193 with SMTP id m184mr8472696qkc.57.1485530523618;
	Fri, 27 Jan 2017 07:22:03 -0800 (PST)
Received: from localhost.localdomain (pc-37-24-239-201.cm.vtr.net.
	[201.239.24.37]) by smtp.gmail.com with ESMTPSA id
	q145sm4355726qke.37.2017.01.27.07.22.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jan 2017 07:22:02 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <martin.jansa@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Jan 2017 16:21:57 +0100
Message-Id: <20170127152157.15342-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] opencv: Configure freetype via PACKAGECONFIG
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
X-List-Received-Date: Fri, 27 Jan 2017 15:22:05 -0000

Since: http://errors.yoctoproject.org/Errors/Details/117456/ opencv
freetype module fails to build.

This patch disables that module by default via PACKAGECONFIG until we
find out a better way to do it.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.2.bb b/meta-oe/recipes-support/opencv/opencv_3.2.bb
index f18aa796f9aa..f47347ab4455 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.2.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.2.bb
@@ -61,6 +61,7 @@ PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libcl
 PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
 PACKAGECONFIG[dnn] = "-DBUILD_opencv_dnn=ON -DUPDATE_PROTO_FILES=ON -DBUILD_PROTOBUF=OFF,-DBUILD_opencv_dnn=OFF,lapack protobuf protobuf-native,"
 PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen gflags glog,"
+PACKAGECONFIG[freetype] = "-DBUILD_opencv_freetype=ON,-DBUILD_opencv_freetype=OFF,freetype,"
 PACKAGECONFIG[gphoto2] = "-DWITH_GPHOTO2=ON,-DWITH_GPHOTO2=OFF,libgphoto2,"
 PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER=ON,-DWITH_GSTREAMER=OFF,gstreamer1.0 gstreamer1.0-plugins-base,"
 PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+3,"
-- 
2.11.0


