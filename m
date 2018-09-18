Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 608E179496
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 09:01:53 +0000 (UTC)
Received: from heron.blarg.de (p3EE2FF12.dip0.t-ipconnect.de [62.226.255.18])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id 21BA5220510;
	Tue, 18 Sep 2018 11:01:54 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2018 11:01:52 +0200
Message-Id: <20180918090152.2621-1-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.18.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH] [meta-oe] mpd: drop LICENSE_FLAGS="commercial"
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
X-List-Received-Date: Tue, 18 Sep 2018 09:01:53 -0000

From: Max Kellermann <max.kellermann@gmail.com>

The mpg123 LICENSE_FLAGS have been removed in oe-core commit
b0bc82a5f238db82425b3b146e269bc6605cbdce, so we can remove it from MPD
as well.

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
index b9c6d62d6..eb10b3fa3 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
@@ -17,9 +17,6 @@ DEPENDS += " \
     expat \
 "
 
-# While this item does not require it, it depends on mpg123 which does
-LICENSE_FLAGS = "commercial"
-
 SRC_URI = " \
     http://www.musicpd.org/download/${BPN}/0.20/${BP}.tar.xz \
     file://mpd.conf.in \
-- 
2.18.0


