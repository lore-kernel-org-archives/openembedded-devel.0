Return-Path: <net147@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 472A76E99E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Mar 2014 04:18:01 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id hz1so2422786pad.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Mar 2014 20:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0yd7I/SHDa9LM5UxCkLGa+s8RDm1qNl52J8WLQoqYcw=;
	b=ZsZEyM0B9l4f350gX6Nx7eTQhoqmvTgXaPryMoAbL1SXH51yvIIZCi19FI6DRsz/D9
	5zQALaS7GBGnyfBnkNvJZlYr8HKWJ95Bs+RSSPbHfR8nfSFl9w4hoL7Q2ZTWSfdhhndv
	Of1SnGH5bwOAeeX+mcZqLLWNzeIwuh/jRRmdYHdOfZRSeX+iuwuCdC2gdMewICb1ulXc
	5ZoG2/LNO0xAZJ1IGt5FxOKDiKOnl2SDX9xzi+vqklCvZrTj1K6winR0+3lQf9hcwAMh
	OmqE9dH97OKSJOspKWJJkc9QDdVNsC/osuVFfaqsMUY9yorLYJj5qh171qrZwsSE7Q8y
	+OYQ==
X-Received: by 10.68.76.68 with SMTP id i4mr12213665pbw.73.1393733883007;
	Sat, 01 Mar 2014 20:18:03 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	nv7sm21505571pbc.31.2014.03.01.20.18.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Mar 2014 20:18:02 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Mar 2014 15:22:44 +1100
Message-Id: <1393734165-15082-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-qt5][PATCH v4 1/2] qtimageformats: allow empty qtimageformats package
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
X-List-Received-Date: Sun, 02 Mar 2014 04:18:03 -0000

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


