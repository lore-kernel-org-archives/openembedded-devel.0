Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6439D61C24
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Mar 2020 02:57:48 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id bo3so571973pjb.5
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Mar 2020 19:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Eod//AqXoY0nQE+m0zD67LRAv+qp11Rlrti5or1G2dQ=;
	b=utjtmkiQzA9rH1BShnrH/YY+GSFrcbzr4vtwFQieE99tOx5GKYy9DsDL0VwjTpy1xY
	kkbBA6AoJj8XemhxL8iR3A/uLTC+9WHi65pM7iz0rRe+YGiDZxpjE2Zbu0f+9dXxjbZv
	RticTW9Jjo6VSe5aU5xopotqVU/SfGc/zAB4zE5FzzNHtAjr5dsKgKWTGl4ohqAtdYxt
	qvdw2naiAnFh/nZQ3yL9UxeTPu9Mq0J+oaadCQ9x7sWLnxQ+6W8JzngdY+bc18CnI/1N
	NTvy2OrLJsCJAhfyKBJCH23YH2c2dSrlTs0suqfKgd7IwcoCP1X/NZmOaRZYCJ0VK41h
	0FFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Eod//AqXoY0nQE+m0zD67LRAv+qp11Rlrti5or1G2dQ=;
	b=LTHG0LBrD/ZZh52Wob1xk2G0NnuywVBthtULzc9BHg3IKTtY8Zv9R0PuG38ykYSgqh
	mMI4VKS2WstIEym24obktk8PDQJVrrdkg+2TOSpHnGItSFJ81QnQzyapxFiyctqr3MpW
	v7LXEKAW+EnmYSXEYgxe9d1bFeW1SRrDWB/uKPsXEcLU1nOrSE+rL2J+ookuHuf5tqhJ
	dRbB12qvASs4dcly9e90wq234kjJmxiV0eqMcNxwNuIsTNPJ7Sf9iYr92yzsQbBZlzzU
	Kj3PxigANOESAG3srYUjCy0zWclP+OI/aOsOpcv4e3gMjJ12Ik6IGXvf1c2E1Zsz/2Ez
	0u7w==
X-Gm-Message-State: ANhLgQ3ZxkZzC+scy6M34K7mzlyU3HEYOB7OAxVS4KEsTdWxSEPhMswX
	FxRX0jpUk7H6SLVvtO7/OQJFbp8q
X-Google-Smtp-Source: ADFU+vsmVIQ2Nfu65ZJ4RloLMtC9AtA20/MYYBjFvPNv74S6WqMi8Xr/WUaakIuFyhUygYQDseiT1A==
X-Received: by 2002:a17:90a:c687:: with SMTP id
	n7mr1787675pjt.159.1583981868987; 
	Wed, 11 Mar 2020 19:57:48 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:60a5:8a88:a7f9:d809])
	by smtp.gmail.com with ESMTPSA id
	e2sm18328236pgv.81.2020.03.11.19.57.47
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 19:57:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Wed, 11 Mar 2020 19:57:29 -0700
Message-Id: <7748b8700cfae176e209faf8052585485a070910.1583981708.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583981708.git.akuster808@gmail.com>
References: <cover.1583981708.git.akuster808@gmail.com>
Subject: [zeus 10/13] opencv: PACKAGECONFIG for G-API, use system ADE
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
X-List-Received-Date: Thu, 12 Mar 2020 02:57:48 -0000

From: Ross Burton <ross.burton@intel.com>

The Graph API is enabled by default, and if ADE isn't present it will
download a copy of the source during do_configure.

Add a PACKAGECONFIG for the Graph API, and depend on the ADE that we
package.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.1.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
index 487393f388..03e4f58dca 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
@@ -93,10 +93,11 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
 "
 EXTRA_OECMAKE_append_x86 = " -DX86=ON"
 
-PACKAGECONFIG ??= "python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb gphoto2 \
+PACKAGECONFIG ??= "gapi python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb gphoto2 \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
 
+PACKAGECONFIG[gapi] = "-DWITH_ADE=ON -Dade_DIR=${STAGING_LIBDIR},-DWITH_ADE=OFF,ade"
 PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
 PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
 PACKAGECONFIG[dnn] = "-DBUILD_opencv_dnn=ON -DPROTOBUF_UPDATE_FILES=ON -DBUILD_PROTOBUF=OFF,-DBUILD_opencv_dnn=OFF,protobuf protobuf-native,"
-- 
2.17.1


