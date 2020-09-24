Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.9179.1600922569290996104
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 21:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from ALSAMON-X.corp.microsoft.com (unknown [131.107.159.250])
	by linux.microsoft.com (Postfix) with ESMTPSA id C2B7120B7179
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2020 21:42:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C2B7120B7179
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] gedit: Add gsettings-desktop-schemas to RDEPENDS
Date: Wed, 23 Sep 2020 21:42:46 -0700
Message-Id: <20200924044246.33064-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.17.1

gedit isn't able to start at all, showing the following error:

(org.gnome.gedit:32150): GLib-GIO-ERROR **: 04:29:21.795: Settings schema \
'org.gnome.desktop.lockdown' is not installed
Trace/breakpoint trap

gedit tries to look for the lockdown schema which is part of the
gsettings-desktop-schemas package.

Add gsettings-desktop-schemas to RDEPENDS_gedit so when gedit is installed it
finds the required files in the rootfs.

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
---
 meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb b/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
index afd9146ac..4da44b605 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
@@ -16,6 +16,8 @@ DEPENDS = " \
     tepl \
 "
 
+RDEPENDS_${PN} = "gsettings-desktop-schemas"
+
 inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc vala gettext features_check upstream-version-is-even mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.17.1

