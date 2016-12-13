Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5535771E14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 23:46:27 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id 96so221992lfs.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 15:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4V+DIHF73aYeIMQc1tm5QCWZN1uq17+WT5NUxiFbLaI=;
	b=FOHXj5PBgLByRvorLxZydjFJLhYgoN6q83Wgf0v2J5ehXGIJkp0CRcxgfgg+jIfAhy
	ciqrrvEgIDOBseEcgSGFZZTOWsjQtJrs8oRMh+fUrsWNQfx/BWdbNCmDhdMWbXZqT081
	o25tzEcKSPNnl1/oZ3/7E6EvJ6yX/VJChbK/RQKuUE9m5s4PpIGG7uvYrxXGFQOAtJPQ
	GbX2ex+cB5E6ixgcWViTwlI654dLZMpnXaufZZwp7+udOnbCEMkA4uCMVcFBoc4puTmn
	cr4K4JVrALnqtwo/pwxmIfzC+MARWeGcTKUAdzXcvfvPnQfQw5QDSy57RhhGhLJfjMop
	l8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4V+DIHF73aYeIMQc1tm5QCWZN1uq17+WT5NUxiFbLaI=;
	b=cPhfa1v36waBpy3ABiG25O1qSpvRojOPVMi8G8We5gl19w2MIpFQydtBGDBPCRIbpg
	VbOfg0f//WoL586fI3KyG/yDA4pS4J1dktKBG5tg4F5Vy2ouWvmoDx1iGn7jJqpujvBS
	JvVuXPmAkGegbPwRyy78u+cU7hk01jmhFKFGR56atwYwxxNlxUzaBpcz7dbmpDp9l7cN
	/NbMRzsMqOVrz36ot6DQxz+lVgztjS1uMUx8trQOXix9ldfExqzVN+kjknbNUZ3Fd1Wc
	dXwBn0Va12nin3QnJXbyQt0/seSbO7SdBHUOR/rjveLZ/YETPxq6HY5iBBplOhpsiODJ
	68ww==
X-Gm-Message-State: AKaTC00WrEuqO46+Zm+nrNG50/BJ3p08Z/kz4eiKxd5FQA3jZTlKHrHMCnJ78kCyrkMduQ==
X-Received: by 10.46.78.9 with SMTP id c9mr3708895ljb.15.1481672787935;
	Tue, 13 Dec 2016 15:46:27 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	z26sm10269595lja.49.2016.12.13.15.46.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Dec 2016 15:46:27 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, Martin.Jansa@gmail.com,
	ross.burton@intel.com, raj.khem@gmail.com
Date: Wed, 14 Dec 2016 00:46:17 +0100
Message-Id: <20161213234618.31312-7-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161213234618.31312-1-ricardo.ribalda@gmail.com>
References: <20161213234618.31312-1-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v2 7/8] opencv: Add new PACKAGECONFIG dnn
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
X-List-Received-Date: Tue, 13 Dec 2016 23:46:27 -0000

The dnn module depends on a linear algebra libray such as lapack.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index df75e63f2748..26749ee3a143 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -52,6 +52,7 @@ PACKAGECONFIG ??= "python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb
 
 PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
 PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
+PACKAGECONFIG[dnn] = "-DBUILD_opencv_dnn=ON,-DBUILD_opencv_dnn=OFF,lapack,"
 PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen gflags glog,"
 PACKAGECONFIG[gphoto2] = "-DWITH_GPHOTO2=ON,-DWITH_GPHOTO2=OFF,libgphoto2,"
 PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER=ON,-DWITH_GSTREAMER=OFF,gstreamer1.0 gstreamer1.0-plugins-base,"
-- 
2.10.2


