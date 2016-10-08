Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7DEEA6FFCC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Oct 2016 10:03:50 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i130so6405347wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Oct 2016 03:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=VDsnX/Cx0LpOpF+jdAXNOIOj5D7Rb/ET8zSqjsoaIkE=;
	b=keR2GHwqMDJqVwQxsWWK+pGoqML4DvHhjQTnxmRmxfNfjSS0f7rnpVhwmZpopTnnvT
	NlomFoDXQogya05BWMQA6qPVOAdp6sny5ul9I4cE5M5kyI2pCE4Q1unkTv2Q++jJYRiR
	+DYJPwLFR80h9fHNROXnr97afxja9c6GcUvScUKaPO2FUo43jXzJ7iXdViwRtJf0PgzN
	zd6enRwFenqNXbADwSW3Gqm9uXPAC7AF4/9MCcIhRB96RpA9ruWtAFdZTHpb+If/cQNS
	vhPhTcxreIz5YVD+4UrUDhl0vq8GuvRZHW+EwoSSE53EUAz4CPkarj8vKqq0nwACVUcD
	77Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VDsnX/Cx0LpOpF+jdAXNOIOj5D7Rb/ET8zSqjsoaIkE=;
	b=SjD4Ag0nqVBM2qHq9WeATp56p+2AUyUs6eZ0aM5ydHdp0UOXuOlkstT1obwFD2aFlm
	0wiyjvMwIc4EjqKzoMZKNgx+UeHMxa5qMLBNI75w27jBs8tPJOQwyY73C/Gu9VlVlcJa
	/XpIepT5fDieY4itcjLKi0yRtlF2mGdPa20nbdXxPznSsy4GtIalsvTiDvV8A8ZVzvkw
	uvBRAeP8HS5PurJHAFNPlBzlTp8G7h6BgzfjhKGpxCZuK17mZE3i5wxgkgjGxZT+sPeA
	dN5QBuCvSiOeYEM0wyVCSy/ubK12ERCZpYaUgGX++TYOFdHNLDoLoU0f12AB2rS/6fm6
	alzQ==
X-Gm-Message-State: AA6/9Rn/edxhQQr8ugbFrVfAJp4bgLnsxoYy1ZsUHqdAC/QD/HxNzce9T03zQtpNiEluoA==
X-Received: by 10.28.213.211 with SMTP id m202mr2558112wmg.79.1475921031764;
	Sat, 08 Oct 2016 03:03:51 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0EC6.dip0.t-ipconnect.de.
	[79.223.14.198]) by smtp.googlemail.com with ESMTPSA id
	n7sm7509219wmf.18.2016.10.08.03.03.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Oct 2016 03:03:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Oct 2016 12:03:35 +0200
Message-Id: <1475921015-7131-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1475921015-7131-1-git-send-email-schnitzeltony@googlemail.com>
References: <1475921015-7131-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH V2 4/4] xdg-user-dirs: initial add 0.15
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
X-List-Received-Date: Sat, 08 Oct 2016 10:03:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It lives in meta-qt5-extra for a while and I tested it in my images. It is a
nice helper for desktops so I suggest to move it to more common layer.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xdg-user-dirs/files/xdg-user-dirs.desktop      |  9 +++++++++
 .../xdg-user-dirs/xdg-user-dirs_0.15.bb            | 22 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/xdg-user-dirs/files/xdg-user-dirs.desktop
 create mode 100644 meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb

diff --git a/meta-oe/recipes-support/xdg-user-dirs/files/xdg-user-dirs.desktop b/meta-oe/recipes-support/xdg-user-dirs/files/xdg-user-dirs.desktop
new file mode 100644
index 0000000..a9a22d3
--- /dev/null
+++ b/meta-oe/recipes-support/xdg-user-dirs/files/xdg-user-dirs.desktop
@@ -0,0 +1,9 @@
+[Desktop Entry]
+Type=Application
+Name=User folders update
+Exec=xdg-user-dirs-update
+StartupNotify=false
+NoDisplay=true
+X-GNOME-Autostart-Phase=Initialization
+X-KDE-autostart-phase=1
+
diff --git a/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb
new file mode 100644
index 0000000..b94e0cc
--- /dev/null
+++ b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "xdg-user-dirs is a tool to help manage user directories like the desktop folder and the music folder"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = " \
+    http://user-dirs.freedesktop.org/releases/${BPN}-${PV}.tar.gz \
+    file://xdg-user-dirs.desktop \
+"
+SRC_URI[md5sum] = "f5aaf5686ad7d8809a664bfb4566a54d"
+SRC_URI[sha256sum] = "20b4a751f41d0554bce3e0ce5e8d934be98cc62d48f0b90a894c3e1916552786"
+
+inherit autotools gettext
+
+do_install_append () {
+    install -d ${D}${sysconfdir}/xdg/autostart
+    install -m 644 ${WORKDIR}/xdg-user-dirs.desktop ${D}${sysconfdir}/xdg/autostart
+}
+
+CONFFILES_${PN} += " \
+    ${sysconfdir}/xdg/user-dirs.conf \
+    ${sysconfdir}/xdg/user-dirs.defaults \
+"
-- 
2.5.5


