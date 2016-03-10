Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE9C731D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 23:26:16 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l68so967312wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 15:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3DH3LXz2Ap7SfWez2H/pIwCPQhxVAx5nBFOJwdxX2nM=;
	b=Em33J4//CWY3HEXkVLZtkKMpk6aNm5ITLjZtJ22dYWyyJ3gEzU9IWank2qddYCUH/J
	pTM+WpOo53VVgcB550ApOjk25nT9ZZqd99puPUFx7cezclOx3AGGYLbJNIgClgBmeCFq
	o+8qAXmdKA52lgGqQLRuAUOpqtv7pGaqC51JMosMNdLzG4QeyYdb52BXDMG8UQuxDE0Z
	2rPSGO8XrGXJwK6h+LM4EXE0UsvCeZ7vEyTyUO9WB+UQTA8OK6B6hodRywtv7mz9uO/X
	rxKLMHhPuVdEOHEy1fQeAE/a8yhvTWChETmyt6QpGCttnN14pFhLi45QGw9e0Nrcos+A
	LP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3DH3LXz2Ap7SfWez2H/pIwCPQhxVAx5nBFOJwdxX2nM=;
	b=kSqpphfPLySRz2vz6tgUt9+lDGhwjReItRtsMsFc817HqaaJP+M8ggalY43AKkvgJq
	orqFXUL4c4n+wfY3DywH5WXbYX/ChrkJmCHmkUwWDla2pktYzLq2SuOv6GHpGGIzz5E/
	UPss3OjYxH6o8DdMa/Wj4476NnYRG5PF3XhX3vRFD+95Kp5hyxcNmWPKDU9J6MZU2dje
	JvPfxCPmUofjJCvBIfCPgbVC0d823D/Wgl0KibPSwV3iJdmrlqcKSC+tVYmnw6AvbQEg
	ZE7CQYUbWDP0d1zl6eO6FX6+3cKMhAj2LBqxuY6exL9PsxOOpuyUjEb1OjN/GQ93Gr65
	7kpQ==
X-Gm-Message-State: AD7BkJJbKWBY49R4+k61RUiXAlI/X5xyAOJHojyIodprF7+i4pKeyjYuc3WJejm+F1YJTA==
X-Received: by 10.28.93.79 with SMTP id r76mr560721wmb.32.1457652376738;
	Thu, 10 Mar 2016 15:26:16 -0800 (PST)
Received: from localhost.localdomain (p4FDF0B8D.dip0.t-ipconnect.de.
	[79.223.11.141]) by smtp.googlemail.com with ESMTPSA id
	e19sm390869wmd.1.2016.03.10.15.26.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Mar 2016 15:26:16 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Mar 2016 00:25:58 +0100
Message-Id: <1457652361-912-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 1/4] parole: update to 0.8.1
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
X-List-Received-Date: Thu, 10 Mar 2016 23:26:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

checked: patch or similar (for appdata) was applied

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../parole/files/parole-0.8.0-appdata.patch        | 30 ----------------------
 .../parole/{parole_0.8.0.bb => parole_0.8.1.bb}    |  5 ++--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta-xfce/recipes-multimedia/parole/files/parole-0.8.0-appdata.patch
 rename meta-xfce/recipes-multimedia/parole/{parole_0.8.0.bb => parole_0.8.1.bb} (82%)

diff --git a/meta-xfce/recipes-multimedia/parole/files/parole-0.8.0-appdata.patch b/meta-xfce/recipes-multimedia/parole/files/parole-0.8.0-appdata.patch
deleted file mode 100644
index e076924..0000000
--- a/meta-xfce/recipes-multimedia/parole/files/parole-0.8.0-appdata.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: submitted [1]
-Taken-From: [2]
-
-[1] https://bugzilla.xfce.org/show_bug.cgi?id=11653
-[2] http://pkgs.fedoraproject.org/cgit/parole.git/tree/parole-0.8.0-appdata.patch
-
-diff -Nur parole-0.8.0.orig/data/appdata/parole.appdata.xml.in parole-0.8.0/data/appdata/parole.appdata.xml.in
---- parole-0.8.0.orig/data/appdata/parole.appdata.xml.in	2015-02-28 07:23:54.000000000 -0700
-+++ parole-0.8.0/data/appdata/parole.appdata.xml.in	2015-03-07 08:25:01.940009844 -0700
-@@ -41,7 +41,7 @@
-   </provides>
- 
-   <releases>
--    <release version="0.7.0" timestamp="">
-+    <release version="0.7.0" timestamp="1396146123">
-       <description>
-         <_p>This unstable development release adds the new clutter backend and cleans up
-         deprecated Gtk3 symbols. It also adds a "go to position" feature and several bugs
-diff -Nur parole-0.8.0.orig/po/es.po parole-0.8.0/po/es.po
---- parole-0.8.0.orig/po/es.po	2015-02-28 07:23:54.000000000 -0700
-+++ parole-0.8.0/po/es.po	2015-03-07 08:25:17.447726837 -0700
-@@ -514,7 +514,7 @@
- "This unstable development release adds the new clutter backend and cleans up"
- " deprecated Gtk3 symbols. It also adds a \"go to position\" feature and "
- "several bugs have been addressed."
--msgstr "Esta versión de desarrollo añade un nuevo motor de <i>clutter</i> y elimina símbolos GTK3 obsoletos. Además añade la funcionalidad «Ir a la posición» y corrige un sinnúmero de errores."
-+msgstr "Esta versión de desarrollo añade un nuevo motor de clutter y elimina símbolos GTK3 obsoletos. Además añade la funcionalidad «Ir a la posición» y corrige un sinnúmero de errores."
- 
- #: ../data/appdata/parole.appdata.xml.in.h:4
- msgid "This release fixes a problem with detecting DVD drive locations."
diff --git a/meta-xfce/recipes-multimedia/parole/parole_0.8.0.bb b/meta-xfce/recipes-multimedia/parole/parole_0.8.1.bb
similarity index 82%
rename from meta-xfce/recipes-multimedia/parole/parole_0.8.0.bb
rename to meta-xfce/recipes-multimedia/parole/parole_0.8.1.bb
index 28bedaf..1514c61 100644
--- a/meta-xfce/recipes-multimedia/parole/parole_0.8.0.bb
+++ b/meta-xfce/recipes-multimedia/parole/parole_0.8.1.bb
@@ -19,9 +19,8 @@ DEPENDS = " \
     taglib \
 "
 
-SRC_URI[md5sum] = "fffdc23d2aa22271f01410a9e27c3404"
-SRC_URI[sha256sum] = "2d966aeb426de81d992829e33b3f66185b19fd031a1891968b3a40d6d50239cc"
-SRC_URI += "file://parole-0.8.0-appdata.patch"
+SRC_URI[md5sum] = "361e3059f1263c76a3711db2c7c1a97b"
+SRC_URI[sha256sum] = "4b216f5200490f8d2a9bf1b3fcd9a8b20834c95249bf13b9170c82e1fcbd80f4"
 
 RDEPENDS_${PN} += "gstreamer1.0-plugins-good"
 
-- 
2.5.0


