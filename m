Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4562070179
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 10:32:30 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id x1so232583507lbj.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 03:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=072Kx16nyFajsJtRpCe05JcfMFCbU3P2KVjhrVnAoxA=;
	b=T2Phv9FH1GWGSwE2H7hIid5LSsnsp+WlEAXV9iaL5nsxZcSj+dHK6XXlfcBO6wWjHN
	v56oboAEwUk/xzVh3VpLHHDxwkMMBn3iRUcVw2W+qwvDb4Yb/NOakZe37djz9g2Q7sQw
	tnXLfj9AR2hgjwe/hHG3+SZceP0gYRZJg4ObNetIWwprzHiOFiTZ6lZJY9Dn1/spTFYt
	9sp26qd2tZmMc9pttsFRyymxuVCq66rtsjp0iMYvhzModzmsaTww/zvRpF24LkzOBUHx
	CtPR6EaTVK2IqEFofkBl0kE3FMGYMKQxd8NBjjl9LOq69sY5HDjek8UbnNCG/7w2DYhQ
	Un8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=072Kx16nyFajsJtRpCe05JcfMFCbU3P2KVjhrVnAoxA=;
	b=BGgbiZCYn0s1bGV2ZbbjSwhrjOqDoIo3J6gzB12HqlCqsBBySpOH9Sf8r+v+tKPRVN
	wBGk1xxi1+0GO2IXTlgA/6gAzYZWsPC9jymkFRkYy8shns0ssf5F3Vzjk8NEQdIWs+K8
	Wln4Vgmyv0oZmss2/kG9ubhHDGyfZ4VZ+b1fU+QUnBrfaLvNcKz5ninpGz2WURVDXDPp
	cJlPau4I6NoiCL64cq30kUxz/B+iT4dCIW7sf3cEfHw1oKppOGU9TboLyBoP+61vHL9K
	IbFH0nGshz6Dsup2jZRKOdUCtqsmCPoPVfDbvtx7PgHgnZ8cUP4sZlz+uYsTs8jOGRfJ
	PVzQ==
X-Gm-Message-State: AD7BkJIfjtu3ho32fpIVv4o1bQyU+pohWmMPj4h4KZ0juvxWmXln4eAwo2RcB0kmm9Ff5A==
X-Received: by 10.112.50.80 with SMTP id a16mr7696054lbo.82.1457951550559;
	Mon, 14 Mar 2016 03:32:30 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	h134sm3561944lfh.3.2016.03.14.03.32.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Mar 2016 03:32:29 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Mon, 14 Mar 2016 11:32:24 +0100
Message-Id: <1457951544-23279-4-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1457951544-23279-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1457951544-23279-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH 4/4] opencv: Fix pkg-config file.
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
X-List-Received-Date: Mon, 14 Mar 2016 10:32:33 -0000

It was pointing to the wrong location

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv/fixpkgconfig.patch | 12 ++++++++++++
 meta-oe/recipes-support/opencv/opencv_3.1.bb             |  3 ++-
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/fixpkgconfig.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/fixpkgconfig.patch b/meta-oe/recipes-support/opencv/opencv/fixpkgconfig.patch
new file mode 100644
index 000000000000..4ac3e888e1f0
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/fixpkgconfig.patch
@@ -0,0 +1,12 @@
+diff --git a/cmake/OpenCVGenPkgconfig.cmake b/cmake/OpenCVGenPkgconfig.cmake
+index b8cb8777c06b..081c62dafd77 100644
+--- a/cmake/OpenCVGenPkgconfig.cmake
++++ b/cmake/OpenCVGenPkgconfig.cmake
+@@ -66,6 +66,7 @@ ocv_list_unique(_3rdparty)
+ 
+ set(OPENCV_PC_LIBS
+   "-L\${exec_prefix}/${OPENCV_LIB_INSTALL_PATH}"
++  "-L\${exec_prefix}/${OPENCV_3P_LIB_INSTALL_PATH}"
+   "${_modules}"
+ )
+ if (BUILD_SHARED_LIBS)
diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 9fd3b12e3631..c403852cf405 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -16,7 +16,8 @@ SRCREV_opencv = "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
 SRCREV_contrib = "5409d5ad560523c85c6796cc5a009347072d883c"
 SRCREV_FORMAT = "opencv"
 SRC_URI = "git://github.com/Itseez/opencv.git;name=opencv \
-	   git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib"
+	   git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib \
+	   file://fixpkgconfig.patch"
 
 PV = "3.1+git${SRCPV}"
 
-- 
2.7.0


