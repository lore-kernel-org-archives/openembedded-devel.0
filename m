Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id EF59F7E431
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:40 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id m3so4884898wrv.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=N24Z9vVTagw0ztvKHxfpobyuTTZu3RXE5vd21xNBnC0=;
	b=pk/RU/OMWAT1W0MrBmM9PKLzoktdfamz4eOVKNZwN3mATpyJAUy7cK5BBAjfa91GIm
	oMZltc3T14yvZzhSYursXClcipZzD/pRQGWTPJoih+oWbByHsX2OlR81zhQVPdGZ1CJH
	A1+62mruDrXXK0fyp8W1WhXWKFCQdV/6AJ7QMyQlfC3lCO5lF+EXDRM/CGUFU4z7zrFt
	IEVuMuDrUpInu8e7MiwbMdmL0aV4eOzXxN55iPt5VOhtMqBdk9Iu5q1W7Bkj4TI8gDqU
	pp+M1LASxtHdU1TuRWZwF3yiBW0QHIinTBvQXppNc2xqN+KSfIMKum8TcpwnC0TCLozw
	G3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=N24Z9vVTagw0ztvKHxfpobyuTTZu3RXE5vd21xNBnC0=;
	b=J5fdbJB9B3F1bHe6YY9OwnyXiPyKDLaOWAlNZHtJU8XWq346dyH3b7JGynFjMUnT70
	h0dddmfMi6eeAfxwYPl3Po9A4hfhI4b24dYbyrUxlEWwqH4we98so3RTe1s5XkJy3kOD
	TvLM98lNkjm868ikhjdaQTa/yT2sezX6MjkAvlPaLsj7LWHUwN9+L9dRlksVE97IeYpL
	KItaeBAjJsMJHU61VQkiv94ENhXLgy8CaBD39DnkH/rQ7qgLc2A+bML09jT69yU+Emvw
	v+jg8ZPUdPeg3QBcfysvpjiSGdLLh4krMQ1PtuFoSjuM8JXaDqK/3UbeO2aKBUYEQeSQ
	X/Jg==
X-Gm-Message-State: APjAAAWFVrasvZn4p7zqnEpYUybBhaErOOjGKd62lewTQg02SbsZekd5
	l71PMmT0jbfSi8ZHSO+6g4oY93RMLYk=
X-Google-Smtp-Source: APXvYqyqIOYhRr07vqCvRN7M+L88q+2rM0RMotHqi1xwNaYIl12igrjFQVEUTYNdiljCKgoBjTFHiw==
X-Received: by 2002:a5d:5506:: with SMTP id b6mr56184813wrv.221.1558594181612; 
	Wed, 22 May 2019 23:49:41 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:57 +0200
Message-Id: <20190523064859.24336-40-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 39/41] gvfs: upgrade 1.40.0 -> 1.40.1
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
X-List-Received-Date: Thu, 23 May 2019 06:49:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* gnome-online-accounts will be added soon so add PACKAGECONFIG 'goa' disabled
  by default for people not building gnome-desktop.
* gconf dependency is not necessary these days

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gvfs/{gvfs_1.40.0.bb => gvfs_1.40.1.bb}          | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.40.0.bb => gvfs_1.40.1.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.1.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.40.1.bb
index 7caee2771..6e6358865 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.1.bb
@@ -5,17 +5,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=05df38dd77c35ec8431f212410a3329e"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnome bash-completion gettext upstream-version-is-even
 
-DEPENDS += "libsecret glib-2.0 gconf libgudev udisks2 polkit shadow-native"
+DEPENDS += "libsecret glib-2.0 libgudev udisks2 polkit shadow-native"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
-
-SRC_URI[archive.md5sum] = "96ef53ed613e4d223e0db3a7acea44f0"
-SRC_URI[archive.sha256sum] = "3739d64b79c95a9f0f9faf2c5f9e5298b4b2ebdd6431435ce656ecd19b31e2f2"
-
+SRC_URI[archive.md5sum] = "78496947d11a330d5435d669eade70ad"
+SRC_URI[archive.sha256sum] = "927af496efee4767f1ba12694190f9c93bc512a44854e88dbb6f5792abfad6b1"
 
 EXTRA_OEMESON = " \
     -Dbluray=false \
-    -Dgoa=false \
     -Dgoogle=false \
     -Dnfs=false \
     -Dudisks2=true \
@@ -42,12 +39,13 @@ FILES_gvfsd-trash = "${libexecdir}/gvfsd-trash ${datadir}/gvfs/mounts/trash.moun
 
 RRECOMMENDS_gvfsd-ftp += "openssh-sftp openssh-ssh"
 
-PACKAGECONFIG ?= "libgphoto2 ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG ??= "libgphoto2 ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
 PACKAGECONFIG[afc] = "-Dafc=true, -Dafc=false, libimobiledevice libplist"
 PACKAGECONFIG[archive] = "-Darchive=true, -Darchive=false, libarchive"
 PACKAGECONFIG[dnssd] = "-Ddnssd=true, -Ddnssd=false, avahi"
 PACKAGECONFIG[gcr] = "-Dgcr=true, -Dgcr=false, gcr"
+PACKAGECONFIG[goa] = "-Dgoa=true, -Dgoa=false, gnome-online-accounts"
 PACKAGECONFIG[http] = "-Dhttp=true, -Dhttp=false, libsoup-2.4"
 PACKAGECONFIG[libmtp] = "-Dmtp=true, -Dmtp=false, libmtp"
 PACKAGECONFIG[logind] = "-Dlogind=true, -Dlogind=false, systemd"
-- 
2.20.1


