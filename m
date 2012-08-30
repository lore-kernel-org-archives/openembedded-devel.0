Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T710t-0005AF-Jn
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Aug 2012 11:26:11 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1048756wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2012 02:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=cqc6te/Q+jqXYxO3kAC0Ab4otRxD4VHCrN+2FXHLsPU=;
	b=IRj6EawiSyleQZFZNAxRSNaxtkMQp72fCroBlEh6fjqGlSwohJvsfNNkmGmjLBBGWS
	dxRJolupqaU0TScMmHEikFmYnUSVni8UCatq9j+t+8fFNhJ4o1BxA9aVDYKLogTpiBvD
	xF6sSoqclIENfLk89eY73phR5YFaLuUHlaHTD+gyBQmDj9SIdPYFKXUfSklnQCscbnsX
	G/7Tg01nZJ5Caybnla9zQ/2bPOoFNgGCm0CqRgKyLc9I+tiM9XRBHri21P5EBXd9pmt1
	hFol4+DTbpfICOyk0TSBI6kAlAiTX+27zrwFHhRvvt4m4hoeVZiIDXSGHcRdwdhG8DrE
	OxUA==
Received: by 10.180.105.6 with SMTP id gi6mr9940646wib.4.1346318038823;
	Thu, 30 Aug 2012 02:13:58 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cu1sm14798005wib.6.2012.08.30.02.13.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 02:13:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Aug 2012 11:13:34 +0200
Message-Id: <f9f7866fb77d77bd928306e033d85357693b44cf.1346317656.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1346317656.git.Martin.Jansa@gmail.com>
References: <]>
 <cover.1346317656.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346317656.git.Martin.Jansa@gmail.com>
References: <cover.1346317656.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/5] meta-gnome: replace virtual/gail dependency with gtk+
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2012 09:26:11 -0000

From: Ross Burton <ross.burton@intel.com>

GTK+ integrated the gail module back in 2009, so we can safely drop the explicit
gail dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome/libgnomecanvas_2.20.0.bb    | 2 +-
 meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26.0.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome/libgnomecanvas_2.20.0.bb b/meta-gnome/recipes-gnome/gnome/libgnomecanvas_2.20.0.bb
index 266d44b..9562956 100644
--- a/meta-gnome/recipes-gnome/gnome/libgnomecanvas_2.20.0.bb
+++ b/meta-gnome/recipes-gnome/gnome/libgnomecanvas_2.20.0.bb
@@ -5,7 +5,7 @@ PR = "r2"
 
 inherit gnome
 
-DEPENDS = "libglade libart-lgpl virtual/gail"
+DEPENDS = "gtk+ libglade libart-lgpl"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26.0.bb
index 936872f..79e9e8a 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26.0.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26.0.bb
@@ -5,7 +5,7 @@ SECTION = "x11/gnome/libs"
 
 inherit gnome
 
-DEPENDS = "libglade libart-lgpl virtual/gail xineramaproto"
+DEPENDS = "gtk+ libglade libart-lgpl xineramaproto"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-- 
1.7.12



