Return-Path: <net147@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9A90060D9D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Mar 2014 02:55:19 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id g10so2362911pdj.27
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Mar 2014 18:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0yd7I/SHDa9LM5UxCkLGa+s8RDm1qNl52J8WLQoqYcw=;
	b=doYTzVMTbIeC4BQoGiJEm0yc0vIE859wRNgsC7fGMbZTh82HgsEEz89qV5wH3QXW4c
	EoIBYujD214g/QCpWq7waXBLUhbDVxGShbn5kkcvlP6eHDh82ftU6es8ffqzhX3HXHpp
	qGve3DmOnjH2h0OP5b+WCVgDXL6baK9U/5sPALF2HdZyABddAoO/a2uoRp4hL2WIXi8y
	A+jMfpbRXwyGsX0B9KystkzxnvWSPUokjLIjfXIA90nw960j9y1H/a5oxrfjW97sBf1h
	UoVDCYA5Z71kp87Rym12TbdFkd211dWGudeeGfANAtuZSkMq/OpYzGHWLvHiSvY9rlaS
	Etyw==
X-Received: by 10.66.142.170 with SMTP id rx10mr393669pab.117.1393728920997;
	Sat, 01 Mar 2014 18:55:20 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	yo9sm50897989pab.16.2014.03.01.18.55.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Mar 2014 18:55:20 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Mar 2014 13:59:47 +1100
Message-Id: <1393729188-12904-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-qt5][PATCH v2 1/2] qtimageformats: allow empty qtimageformats package
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
X-List-Received-Date: Sun, 02 Mar 2014 02:55:19 -0000

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


