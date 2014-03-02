Return-Path: <net147@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 531266E85E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Mar 2014 03:51:13 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id p10so2374728pdj.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Mar 2014 19:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0yd7I/SHDa9LM5UxCkLGa+s8RDm1qNl52J8WLQoqYcw=;
	b=HS6i5wuXXgNHj3V1X6WgeVlwWzbqB+2hdaG94g/h5fMrodwVt8bDUa9hviu9uHRcNn
	TEb2+G1Xj3eFMlt0nfry/3OwpNoxnFoakkff3YvQLEqDTPl2Z73prLA/zDJeFndL+R+3
	J3wY1hObksppJBGHw4RffQ5DTiZFgsE9xrSm8vQ1KUDl5V5ARgMHUTYa6Ce4+QfFU84Q
	2GzcWhn7N7etPJulSRGIxWoVar//hTmiMIDA7xX0EhEH0hx2n/F9+EJeMdhGdaZQ17n/
	y662dQ6snJ1qAwgrfAGyzH+Bx2Nwh5ztZxWf+rLAR+JQoTFDZlUx0ppFd+In5kTkvIMB
	OI2A==
X-Received: by 10.66.190.161 with SMTP id gr1mr12071208pac.79.1393732275018;
	Sat, 01 Mar 2014 19:51:15 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id cz3sm21372320pbc.9.2014.03.01.19.51.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Mar 2014 19:51:14 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Mar 2014 14:55:59 +1100
Message-Id: <1393732560-14368-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-qt5][PATCH v3 1/2] qtimageformats: allow empty qtimageformats package
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
X-List-Received-Date: Sun, 02 Mar 2014 03:51:16 -0000

This fixes installing qtimageformats-dev with opkg as it depends on the
qtimageformats package which wasn't created.

The qtimageformats package was not created as it is empty and BitBake
avoids producing empty packages by default. The installed files consist
of source files split into qtimageformats-dbg, CMake files split into
qtimageformats-dev, plugins split into qtimageformats-plugins and
debug build of plugins split into qtimageformats-plugins-dbg.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtimageformats.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtimageformats.inc b/recipes-qt/qt5/qtimageformats.inc
index 1b4bb4f..f90e58a 100644
--- a/recipes-qt/qt5/qtimageformats.inc
+++ b/recipes-qt/qt5/qtimageformats.inc
@@ -1,3 +1,4 @@
 require qt5.inc
 
 DEPENDS += "qtbase tiff"
+ALLOW_EMPTY_${PN} = "1"
-- 
1.9.0


