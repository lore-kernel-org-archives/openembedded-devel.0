Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T6iaI-00028x-3v
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Aug 2012 15:45:30 +0200
Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 29 Aug 2012 06:33:14 -0700
Received: by wgbdr1 with SMTP id dr1so413358wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2012 06:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=7uVP0ylJg8yT5VW3ct/EtSGc+/+zo03XwLhmlXa03fM=;
	b=NtQH5778doZAVyrzu+W5v+e7OyDo6qVXc2UcWpCwkz/e7VUAiSiqCfKUGux7vEwcn+
	evjB8JJ7eGZ9HWMZdFBw8q6xxHGyDWupLUaTYKKZuj7/Z0i0kFi2Iy0D5SMgMkAIYjvL
	mG6lhyew7ERo6eHPw1y5KioLIBJSE8clfIdwbQUd8fX+sZzx+/oOsAwIfxteixdpv/gb
	6fAz15nXtzcsE3j7IOwNk6XoNeBvhOqBNF9bH7j0HDmQrkmle/zUq0pcoVBStxhslMLV
	bbf4Fm16ltLvvMzA8Wj7EgundFX9m6ciSeS27Cx3eP0d2M2N+J1lUdCmOYJXZhTzvfZD
	XlLA==
Received: by 10.180.80.134 with SMTP id r6mr3887808wix.1.1346247192414;
	Wed, 29 Aug 2012 06:33:12 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fb20sm15680397wid.1.2012.08.29.06.33.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 06:33:11 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Aug 2012 14:32:30 +0100
Message-Id: <1346247150-17236-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmXIMoWAwOqvrbWgh/d+2e7KSIsmphU/qmjdAy3Xs5ad39Ed4B7ABkk7BhKkoPHUC+r2AB4
Subject: [PATCH] pimlico: remove Poky overrides
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
X-List-Received-Date: Wed, 29 Aug 2012 13:45:30 -0000

---
 meta-gnome/recipes-gnome/pimlico/contacts.inc |    4 +---
 meta-gnome/recipes-gnome/pimlico/dates.inc    |    4 +---
 meta-gnome/recipes-gnome/pimlico/tasks.inc    |    2 --
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta-gnome/recipes-gnome/pimlico/contacts.inc b/meta-gnome/recipes-gnome/pimlico/contacts.inc
index 9798985..04de63c 100644
--- a/meta-gnome/recipes-gnome/pimlico/contacts.inc
+++ b/meta-gnome/recipes-gnome/pimlico/contacts.inc
@@ -5,13 +5,11 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "GPLv2 & GPLv2+ & GPLv3+ "
 SECTION = "x11"
 DEPENDS = "glib-2.0 gtk+ evolution-data-server"
-DEPENDS_append_poky = " libowl"
 RDEPENDS_${PN} = "libedata-book"
 
 inherit autotools pkgconfig
 
 OWL = "--disable-owl"
-OWL_poky = "--enable-owl"
 
 EXTRA_OECONF += "--disable-gnome-vfs ${OWL}"
 EXTRA_OEMAKE += "GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1"
@@ -31,4 +29,4 @@ SRC_URI = "file://stock_contact.png \
            file://contacts-conditionally-install-schema.patch \
           "
 
-SRC_URI_append_poky = " file://contacts-owl-window-menu.patch;apply=yes "
+#SRC_URI_append_poky = " file://contacts-owl-window-menu.patch;apply=yes "
diff --git a/meta-gnome/recipes-gnome/pimlico/dates.inc b/meta-gnome/recipes-gnome/pimlico/dates.inc
index 9b338fd..3c4a048 100644
--- a/meta-gnome/recipes-gnome/pimlico/dates.inc
+++ b/meta-gnome/recipes-gnome/pimlico/dates.inc
@@ -12,9 +12,7 @@ inherit autotools gettext pkgconfig gtk-icon-cache
 
 # Poky/Sato specific enhancements
 OWL = "--disable-owl"
-OWL_poky = "--enable-owl --disable-dnd"
 
 EXTRA_OECONF += "${OWL}"
-DEPENDS_append_poky = " libowl"
-SRC_URI_append_poky = " file://dates-owl-window-menu.patch;apply=yes "
+#SRC_URI_append_poky = " file://dates-owl-window-menu.patch;apply=yes "
 
diff --git a/meta-gnome/recipes-gnome/pimlico/tasks.inc b/meta-gnome/recipes-gnome/pimlico/tasks.inc
index 9cd5259..a952153 100644
--- a/meta-gnome/recipes-gnome/pimlico/tasks.inc
+++ b/meta-gnome/recipes-gnome/pimlico/tasks.inc
@@ -6,11 +6,9 @@ LICENSE = "GPLv2 & GPLv2+"
 
 SECTION = "x11"
 DEPENDS = "glib-2.0 gtk+ evolution-data-server"
-DEPENDS_append_poky = " libowl"
 
 inherit autotools pkgconfig gtk-icon-cache
 
 OWL ?= "--disable-owl"
-OWL_poky ?= "--enable-owl"
 
 EXTRA_OECONF += "${OWL}"
-- 
1.7.10



