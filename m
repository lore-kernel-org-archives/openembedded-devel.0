Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 357716BDC1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:37 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so342279ead.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=FjRSajxluEwwVUKnvSmNQWI2u6mQQOSLTYAMvvAFlHA=;
	b=tmuuYQVJ0zbEjT+4/0Osl/h2qFVgbqUaqeWOayBkmVUmhEXnnpYB/bTw2BL6eRO3jJ
	IYnXaH1T/KldpoDdO1gdooLFkLqGtXR85cgz2mXcU+5/sgVIMlM2a5s8YbzW+9LrUbIw
	jjTVNpWSjjMDFjNriQfNq4Mo8sC6UyZT8+DI80nX3QDI5/vticefCX+JFVJHWSp0G3UZ
	ebTleh4QJG5QryAZrMKkRrKLs+UkBcex6gfRIFJq/g9WBLS45/x1g5d7UDowiDs2hByc
	kUt7eD/yp5P3EpKFicO8jA1AumXnJZTSudpOaLZ6+DuY/8w4S9kv9jB++1ojZVjaDzHZ
	MLRw==
X-Received: by 10.15.94.201 with SMTP id bb49mr5420582eeb.23.1377791497606;
	Thu, 29 Aug 2013 08:51:37 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm47162727eex.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:29 +0200
Message-Id: <17cb788d0b34e6ad45da05158e8fc348528bc008.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 36/66] opencv: Add PACKAGECONFIG for jasper
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Aug 2013 15:51:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_2.4.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb b/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
index 39b608a..161e7fd 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
@@ -24,6 +24,9 @@ S = "${WORKDIR}/OpenCV-${PV}"
 OECMAKE_SOURCEPATH = "${S}"
 OECMAKE_BUILDPATH = "${WORKDIR}/build-${TARGET_ARCH}"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[jasper] = "-DBUILD_JASPER=ON,-DBUILD_JASPER=OFF,jasper"
+
 EXTRA_OECMAKE = "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include \
                  -DBUILD_PYTHON_SUPPORT=ON \
                  -DWITH_FFMPEG=ON \
-- 
1.8.3.2


