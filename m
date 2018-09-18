Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 700DC795D9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 08:35:57 +0000 (UTC)
Received: from heron.blarg.de (p3EE2FF12.dip0.t-ipconnect.de [62.226.255.18])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id 3297A220524;
	Tue, 18 Sep 2018 10:26:14 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2018 10:26:01 +0200
Message-Id: <20180918082608.1088-2-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180918082608.1088-1-max+openembedded@blarg.de>
References: <20180918082608.1088-1-max+openembedded@blarg.de>
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 2/8] [meta-oe] vorbis-tools: add PACKAGECONFIG[ogg123]
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
X-List-Received-Date: Tue, 18 Sep 2018 08:35:58 -0000

From: Max Kellermann <max.kellermann@gmail.com>

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 .../recipes-multimedia/vorbis-tools/vorbis-tools_1.4.0.bb    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.0.bb b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.0.bb
index e43cb4032..8e9914b49 100644
--- a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.0.bb
@@ -8,7 +8,7 @@ SECTION = "multimedia"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "libogg libvorbis curl libao"
+DEPENDS = "libogg libvorbis"
 
 SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.gz \
            file://0001-oggenc-Fix-large-alloca-on-bad-AIFF-input.patch \
@@ -20,6 +20,7 @@ SRC_URI[sha256sum] = "a389395baa43f8e5a796c99daf62397e435a7e73531c9f44d9084055a0
 
 inherit autotools pkgconfig gettext
 
-PACKAGECONFIG ??= "flac"
+PACKAGECONFIG ??= "flac ogg123"
 PACKAGECONFIG[flac] = ",--without-flac,flac,libflac"
 PACKAGECONFIG[speex] = ",--without-speex,speex,speex"
+PACKAGECONFIG[ogg123] = "--enable-ogg123,--disable-ogg123,libao curl"
-- 
2.18.0


