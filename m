Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id B238C6D45C
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Dec 2018 19:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=References:In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=BqY6j4Ce7wHHsRrE/hag4Xaue5Gf5mb9PHr+TdreCdI=; 
	b=L8RjiswmVnnC94+dbn6+rIDxBohWKzKqbhX22aGsjthtuUzKJlEjgcLxAP6oN6gawQTjs2h1MncgCkcOcI5FCK8kuK/KdUBm/MsR35BpBbnDniyogW6ooduH6TkT2U9vkK9C3u0lYDTje+S2xyjuj7REn6wI0PqgUqrEiq2v3D82KXt4/qNIwVsXq0pOT+sMP+PmOJVXuIJah5P/SpYCApY1F0x/XTLJ2H1+0eQzi1wdkFJJnLH1hY/K4BbGZltR9aaoxz/QdjOHWLXnG4vuJSnMQ4suaNmGgvQJLcesDah8NakMCK62sLEvhVFhDeilHLUy9a5eMXjkEvpQkLlZDw==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1gTAdZ-0001Ej-Ck
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Dec 2018 20:09:09 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Dec 2018 20:06:31 +0100
Message-Id: <0161d589404e5d18602f671d9a3b0064910c3d0e.1543690801.git.psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1543690801.git.psaavedra@igalia.com>
References: <cover.1543690801.git.psaavedra@igalia.com>
Subject: [meta-openembedded][PATCH v2 2/7] dconf: remove gsettings inherit schemas
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
X-List-Received-Date: Sat, 01 Dec 2018 19:09:09 -0000

... because it doesn't install any schemas

Motivation and details here:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=13040

Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
---
 meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb
index 99292a88c..b6f71c952 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb
@@ -10,7 +10,7 @@ DEPENDS = "dbus glib-2.0 intltool-native"
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gsettings bash-completion vala
+inherit gnomebase bash-completion vala
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.11.0


