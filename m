Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id A34D5746E8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2018 16:38:16 +0000 (UTC)
Received: from heron.blarg.de
	(p200300DC6F065000529A4CFFFE3DD983.dip0.t-ipconnect.de
	[IPv6:2003:dc:6f06:5000:529a:4cff:fe3d:d983])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id 97A692201C0;
	Tue, 23 Oct 2018 18:38:16 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Oct 2018 18:38:11 +0200
Message-Id: <20181023163812.5631-1-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 1/2] ncmpc: update to 0.33
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
X-List-Received-Date: Tue, 23 Oct 2018 16:38:16 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

Several build options have been changed from "boolean" to "feature",
and thus we have to change "true/false" to "enabled/disabled".
---
 .../musicpd/{ncmpc_0.32.bb => ncmpc_0.33.bb}           | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{ncmpc_0.32.bb => ncmpc_0.33.bb} (80%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.32.bb b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb
similarity index 80%
rename from meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.32.bb
rename to meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb
index 62885bba1..9e8522a9e 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.32.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb
@@ -15,11 +15,11 @@ DEPENDS += " \
 PACKAGECONFIG ??= "colors locale mouse nls help_screen artist_screen search_screen song_screen key_screen lyrics_screen outputs_screen"
 
 PACKAGECONFIG[colors] = "-Dcolors=true,-Dcolors=false"
-PACKAGECONFIG[lirc] = "-Dlirc=true,-Dlirc=false,lirc"
-PACKAGECONFIG[locale] = "-Dlocale=true,-Dlocale=false"
+PACKAGECONFIG[lirc] = "-Dlirc=enabled,-Dlirc=disabled,lirc"
+PACKAGECONFIG[locale] = "-Dlocale=enabled,-Dlocale=disabled"
 PACKAGECONFIG[mini] = "-Dmini=true,-Dmini=false"
-PACKAGECONFIG[mouse] = "-Dmouse=true,-Dmouse=false"
-PACKAGECONFIG[nls] = "-Dnls=true,-Dnls=false,gettext-native"
+PACKAGECONFIG[mouse] = "-Dmouse=enabled,-Dmouse=disabled"
+PACKAGECONFIG[nls] = "-Dnls=enabled,-Dnls=disabled,gettext-native"
 
 PACKAGECONFIG[help_screen] = "-Dhelp_screen=true,-Dhelp_screen=false"
 PACKAGECONFIG[artist_screen] = "-Dartist_screen=true,-Dartist_screen=false"
@@ -33,5 +33,5 @@ PACKAGECONFIG[chat_screen] = "-Dchat_screen=true,-Dchat_screen=false"
 SRC_URI = " \
     git://github.com/MusicPlayerDaemon/ncmpc \
 "
-SRCREV = "b03703653d3f4a418c4a8b6a9e32834dd882a185"
+SRCREV = "8e98f89ff07b140e6357dab2a9a9f6432ae0e521"
 S = "${WORKDIR}/git"
-- 
2.19.1


