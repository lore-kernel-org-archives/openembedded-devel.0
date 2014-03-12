Return-Path: <net147@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id B50F86F6FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 22:47:58 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id kl14so191035pab.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 15:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0yd7I/SHDa9LM5UxCkLGa+s8RDm1qNl52J8WLQoqYcw=;
	b=lMkj1GKJe8CUxI6rJLar/+KwwS7kMvY6Pth/qiOJZcak5UN9vvrhTgOtpH3pjCfxTz
	EJ4jICDaRfyfF2MWvvUG9jMZlDfKcpCEc4uphDbQHPLufhjonJ7lRWqsFVSOEkFxQiZJ
	sC5fBXQEM6UhYweQ+EUEXWh8omhbBfNMZxltpAJo0AbsOcQH35qEIaMZHfKYWwmQb7bR
	ceUS2e2tkPSEAfLCPZqgTxKAHqrI6ucFHLFYa0sqUYjt+TcNcjuijHTGMfm4AYEaB4DR
	LH6RvTDvSmooqXHjv5je0Gb7uSqHg72laBELZxt3hRgUitXBn6/Ffkk0TgvAq7i7+ZO0
	7oFQ==
X-Received: by 10.66.141.165 with SMTP id rp5mr170438pab.90.1394664479144;
	Wed, 12 Mar 2014 15:47:59 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id x5sm586118pbw.26.2014.03.12.15.47.56
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Mar 2014 15:47:57 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Mar 2014 09:52:39 +1100
Message-Id: <1394664760-8615-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-qt5][PATCH v5 1/2] qtimageformats: allow empty qtimageformats package
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
X-List-Received-Date: Wed, 12 Mar 2014 22:47:58 -0000

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


