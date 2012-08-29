Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T6icY-0002E4-K9
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Aug 2012 15:47:50 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 29 Aug 2012 06:35:35 -0700
Received: by weyr6 with SMTP id r6so319064wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2012 06:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=T5NHWFqvrTfonIcumhVPK/mDLhJo4O1BKvV0gM8ly+c=;
	b=OMA5MMhVv07Ket03Rz5ocs928y/KpYg1ytcaTqbE6qMBl8qdc0EKyYKnkPVYQN9uy6
	pfmnv4KBnfjp7po9786AvG9erWcwYpOGgArOhyjHke558TW3JN3t5HQC29Y1ifVar+Yy
	PhZo2YZX8nmqIiNEHizd6arYj8OchtKNDe4Opcd8TNnig39Lt3Mg0LXO27MF6+myepQM
	QlKvkNXlHvYsKdFDHDBiH9t5Vy/mQqh1JPt6ED+J1rxzl4YbVG8mJ/7dZ6ToCuMnGJGa
	sUKeDdDfVeP20HeKJYq0NWBJKVs1O4gBp7ekTJRqfbasaVhleuP5ithIShiwKdvlxU5v
	HpTw==
Received: by 10.216.234.100 with SMTP id r78mr947131weq.107.1346247333128;
	Wed, 29 Aug 2012 06:35:33 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id h9sm10322774wiz.1.2012.08.29.06.35.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 06:35:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Aug 2012 14:34:51 +0100
Message-Id: <1346247292-9421-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlNQqtLG2faBJ8hgVtfYzqe7Q8oEvkxsDLPJX8xYYlhKzA3xNW/CDEHfFWkibXoyUnO/8PA
Subject: [PATCH] meta-gnome: replace virtual/gail dependency with gtk+
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
X-List-Received-Date: Wed, 29 Aug 2012 13:47:50 -0000

GTK+ integrated the gail module back in 2009, so we can safely drop the explicit
gail dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-gnome/recipes-gnome/gnome/libgnomecanvas_2.20.0.bb    |    2 +-
 meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26.0.bb |    2 +-
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
1.7.10



