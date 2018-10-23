Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id D6A2175129
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2018 16:38:22 +0000 (UTC)
Received: from heron.blarg.de
	(p200300DC6F065000529A4CFFFE3DD983.dip0.t-ipconnect.de
	[IPv6:2003:dc:6f06:5000:529a:4cff:fe3d:d983])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id 871982201C0;
	Tue, 23 Oct 2018 18:38:23 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Oct 2018 18:38:12 +0200
Message-Id: <20181023163812.5631-2-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181023163812.5631-1-max+openembedded@blarg.de>
References: <20181023163812.5631-1-max+openembedded@blarg.de>
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 2/2] ncmpc: add PACKAGECONFIG[regex]
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
X-List-Received-Date: Tue, 23 Oct 2018 16:38:23 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

---
 meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb
index 9e8522a9e..8468d125d 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb
@@ -7,12 +7,11 @@ inherit meson
 
 DEPENDS += " \
     boost \
-    pcre \
     ncurses \
     libmpdclient \
 "
 
-PACKAGECONFIG ??= "colors locale mouse nls help_screen artist_screen search_screen song_screen key_screen lyrics_screen outputs_screen"
+PACKAGECONFIG ??= "colors locale mouse nls regex help_screen artist_screen search_screen song_screen key_screen lyrics_screen outputs_screen"
 
 PACKAGECONFIG[colors] = "-Dcolors=true,-Dcolors=false"
 PACKAGECONFIG[lirc] = "-Dlirc=enabled,-Dlirc=disabled,lirc"
@@ -20,6 +19,7 @@ PACKAGECONFIG[locale] = "-Dlocale=enabled,-Dlocale=disabled"
 PACKAGECONFIG[mini] = "-Dmini=true,-Dmini=false"
 PACKAGECONFIG[mouse] = "-Dmouse=enabled,-Dmouse=disabled"
 PACKAGECONFIG[nls] = "-Dnls=enabled,-Dnls=disabled,gettext-native"
+PACKAGECONFIG[regex] = "-Dregex=enabled,-Dregex=disabled,pcre"
 
 PACKAGECONFIG[help_screen] = "-Dhelp_screen=true,-Dhelp_screen=false"
 PACKAGECONFIG[artist_screen] = "-Dartist_screen=true,-Dartist_screen=false"
-- 
2.19.1


