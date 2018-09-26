Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 6E5627954B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 13:21:25 +0000 (UTC)
Received: from heron.blarg.de (p5DE2B75B.dip0.t-ipconnect.de [93.226.183.91])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id C3029220520;
	Wed, 26 Sep 2018 15:21:25 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Sep 2018 15:21:09 +0200
Message-Id: <20180926132115.10455-1-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 1/7] mpd: sort PACKAGECONFIGs again
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
X-List-Received-Date: Wed, 26 Sep 2018 13:21:25 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

The new ones I added were not sorted.

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
index c0d4c8c2b..9b506ba10 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
@@ -45,13 +45,13 @@ PACKAGECONFIG[lame] = "--enable-lame-encoder,--disable-lame-encoder,lame"
 PACKAGECONFIG[libsamplerate] = "--enable-lsr,--disable-lsr,libsamplerate0"
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[mms] = "--enable-mms,--disable-mms,libmms"
-PACKAGECONFIG[mpg123] = "--enable-mpg123,--disable-mpg123,mpg123"
 PACKAGECONFIG[modplug] = "--enable-modplug,--disable-modplug,libmodplug"
+PACKAGECONFIG[mpg123] = "--enable-mpg123,--disable-mpg123,mpg123"
+PACKAGECONFIG[openal] = "--enable-openal,--disable-openal,openal-soft"
+PACKAGECONFIG[opus] = "--enable-opus,--disable-opus,libopus libogg"
 PACKAGECONFIG[smb] = "--enable-smbclient,--disable-smbclient,samba"
 PACKAGECONFIG[sndfile] = "--enable-sndfile,--disable-sndfile,libsndfile1"
 PACKAGECONFIG[upnp] = "--enable-upnp,--disable-upnp,libupnp"
-PACKAGECONFIG[openal] = "--enable-openal,--disable-openal,openal-soft"
-PACKAGECONFIG[opus] = "--enable-opus,--disable-opus,libopus libogg"
 PACKAGECONFIG[vorbis] = "--enable-vorbis,--disable-vorbis,libvorbis libogg"
 PACKAGECONFIG[wavpack] = "--enable-wavpack,--disable-wavpack,wavpack"
 PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
-- 
2.19.0


