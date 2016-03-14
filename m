Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3166073163
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 12:13:45 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id bc4so235695649lbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 05:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=072Kx16nyFajsJtRpCe05JcfMFCbU3P2KVjhrVnAoxA=;
	b=rTsexpXkG3c9XNqx7JK+wcslVTk3/fGNeOu6yQ117NZQ7CNplnBFdP5dToU6WJ48bh
	D1YOb6OeDJ7KgA/c/Z+BaSFg8CiEoXAV5/BdqhwP/iZCpmcAnXXzLJIkWl9uz3AM9bVk
	A9fi2jRz+CCZXSHjczX7KZac4pe1kgw4ybIWstZIv+PjybY4VQ5EOxWkIwU17SvP1lP7
	I+g3CnXkfLBo4AgA5r0hWgBcVrAZwMtkmFpX0y2Fgtgum/p2wbcgk2IUSrwBWsgZBWJh
	+2zXVVngPqrwRMabZqUF6IphnkMlackIhl1g1HVD/EetbGwlfZgxNNYCuXakrpf5CgCs
	aAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=072Kx16nyFajsJtRpCe05JcfMFCbU3P2KVjhrVnAoxA=;
	b=FiwhejrkxL5ezsNR+RPASaUvYAsFPvldRNyyBAbd57xB/nnVkr3tnSX1I7xle48kQL
	G+jqJofSQ59e7HpOwdroOJl4T8JoZdz83FjrjXlwPekX5lNNY0QqS7mpTTnLrjkoUqLp
	5s+k61qzDEKQo9H7FOJLWzRo3P8A1J/qFSffcbTC7r6XsMW/FdV8Lfa3PYry7KAokBGH
	msoxNBw37W8bv+RkvS2yRQdIa+dJCJcxh9LNWGdP+88JiIKRCmG3NCP0NjHrPepmQlpF
	s6nr57lXGMHXfoslhXUB3hsSsjhB/HGVteYo7iTJlZBEY/8VNxe6HdV/qY26Etv3EH1Y
	oxWw==
X-Gm-Message-State: AD7BkJIGZfa9/49qe7WEWrJjr5VBvKWEDxY8AgWhu0LsZuBNmOVz3mBUfb1ckmGKnVgX3g==
X-Received: by 10.25.137.67 with SMTP id l64mr6500821lfd.158.1457957625962;
	Mon, 14 Mar 2016 05:13:45 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	un6sm3516634lbb.18.2016.03.14.05.13.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Mar 2016 05:13:44 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Mon, 14 Mar 2016 13:13:38 +0100
Message-Id: <1457957618-32168-4-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1457957618-32168-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1457957618-32168-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v2 4/4] opencv: Fix pkg-config file.
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
X-List-Received-Date: Mon, 14 Mar 2016 12:13:46 -0000

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


