Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 2400079A4C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Oct 2018 17:01:20 +0000 (UTC)
Received: from heron.blarg.de (p5DE2B75B.dip0.t-ipconnect.de [93.226.183.91])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id D7DBE2201B5;
	Fri,  5 Oct 2018 19:01:20 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Oct 2018 19:01:08 +0200
Message-Id: <20181005170108.29819-2-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181005170108.29819-1-max+openembedded@blarg.de>
References: <20181005170108.29819-1-max+openembedded@blarg.de>
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 2/2] ncmpc: add various PACKAGECONFIGs
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
X-List-Received-Date: Fri, 05 Oct 2018 17:01:20 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 .../recipes-multimedia/musicpd/ncmpc_0.32.bb  | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.32.bb b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.32.bb
index bc7764424..62885bba1 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.32.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.32.bb
@@ -6,13 +6,30 @@ HOMEPAGE = "https://www.musicpd.org/clients/ncmpc/"
 inherit meson
 
 DEPENDS += " \
-    gettext-native \
     boost \
     pcre \
     ncurses \
     libmpdclient \
 "
 
+PACKAGECONFIG ??= "colors locale mouse nls help_screen artist_screen search_screen song_screen key_screen lyrics_screen outputs_screen"
+
+PACKAGECONFIG[colors] = "-Dcolors=true,-Dcolors=false"
+PACKAGECONFIG[lirc] = "-Dlirc=true,-Dlirc=false,lirc"
+PACKAGECONFIG[locale] = "-Dlocale=true,-Dlocale=false"
+PACKAGECONFIG[mini] = "-Dmini=true,-Dmini=false"
+PACKAGECONFIG[mouse] = "-Dmouse=true,-Dmouse=false"
+PACKAGECONFIG[nls] = "-Dnls=true,-Dnls=false,gettext-native"
+
+PACKAGECONFIG[help_screen] = "-Dhelp_screen=true,-Dhelp_screen=false"
+PACKAGECONFIG[artist_screen] = "-Dartist_screen=true,-Dartist_screen=false"
+PACKAGECONFIG[search_screen] = "-Dsearch_screen=true,-Dsearch_screen=false"
+PACKAGECONFIG[song_screen] = "-Dsong_screen=true,-Dsong_screen=false"
+PACKAGECONFIG[key_screen] = "-Dkey_screen=true,-Dkey_screen=false"
+PACKAGECONFIG[lyrics_screen] = "-Dlyrics_screen=true,-Dlyrics_screen=false"
+PACKAGECONFIG[outputs_screen] = "-Doutputs_screen=true,-Doutputs_screen=false"
+PACKAGECONFIG[chat_screen] = "-Dchat_screen=true,-Dchat_screen=false"
+
 SRC_URI = " \
     git://github.com/MusicPlayerDaemon/ncmpc \
 "
-- 
2.19.0


