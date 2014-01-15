Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id B3DB96DA89
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 14:43:05 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id r15so522764ead.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 06:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=hvFFrRvw0Xdpid2MLfL/zbNOtb1b22LSOWHWPjy9PRs=;
	b=Qzfm/XtiVgnuRfBIRm03VtczUhyrqMXEko2LYBLPM/f20x14H4Uj78CisJXWG/3AMl
	z47GTgzlPaj1LdJ02kgTJPv4Sm5mgA5qVDjGGp5LUmLJMuCKSK2zhvKoGoycA/1p5L5n
	L+fJCQIQTH21yjRwEUV4vHTwUCcRkunjlc9KCQZOMUT2muHY9nYnnoJjFRe9j1kfPuxg
	9FqDQyFOJamlsX0Ml8n0N8lP1JpzSBF+KkAnbcf9waBa9Xo4U1vH1eSu69R/UKM47YCV
	OD5JyN0NaVerUHsJTrMs/kHyiRdZepXFSPBRh/Kad8ltrPLTK1Q/s/2S2dLvYoCxAjad
	G+TQ==
X-Received: by 10.15.49.9 with SMTP id i9mr3322111eew.112.1389796986292;
	Wed, 15 Jan 2014 06:43:06 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-248.unitymediagroup.de.
	[109.91.251.248])
	by mx.google.com with ESMTPSA id 7sm10764574eee.12.2014.01.15.06.43.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 06:43:05 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2014 15:42:57 +0100
Message-Id: <1389796977-30387-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1389796977-30387-1-git-send-email-schnitzeltony@googlemail.com>
References: <1389796977-30387-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] dconf: update to 0.18.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jan 2014 14:43:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb | 29 ++++++++++++++++++++++++++
 meta-gnome/recipes-gnome/dconf/dconf_0.7.5.bb  | 23 --------------------
 2 files changed, 29 insertions(+), 23 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
 delete mode 100644 meta-gnome/recipes-gnome/dconf/dconf_0.7.5.bb

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
new file mode 100644
index 0000000..ae9c809
--- /dev/null
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "configuation database system"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+
+SECTION = "x11/gnome"
+
+inherit gnome gsettings
+SRC_URI[archive.md5sum] = "69a12ed68893f2e1e81ac4e531bc1515"
+SRC_URI[archive.sha256sum] = "109b1bc6078690af1ed88cb144ef5c5aee7304769d8bdc82ed48c3696f10c955"
+GNOME_COMPRESS_TYPE = "xz"
+
+DEPENDS = "glib-2.0 gtk+3"
+
+inherit vala gtk-doc
+
+EXTRA_OECONF += "--disable-man"
+
+PACKAGES =+ "dconf-editor"
+
+FILES_${PN} += " \
+	${datadir}/dbus-1 \
+	${libdir}/gio/modules/*.so \
+"
+FILES_dconf-editor = " \
+	${bindir}/dconf-editor \
+	${datadir}/icons \
+	${datadir}/bash-completion \
+"
+FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/libdconfsettings.so"
diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.7.5.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.7.5.bb
deleted file mode 100644
index 7d11cf8..0000000
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.7.5.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "configuation database system"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
-
-SECTION = "x11/gnome"
-
-inherit gnome gsettings
-SRC_URI[archive.md5sum] = "d784f8afca04473d194a72047595c28e"
-SRC_URI[archive.sha256sum] = "e2103e8207744903790e9fac6427fa394bb485a0c7f4e0d03b0fb43268c34f33"
-
-DEPENDS = "glib-2.0 gtk+3"
-
-inherit vala
-
-PR = "r2"
-
-PACKAGES =+ "dconf-editor"
-
-FILES_dconf-editor = "${bindir}/dconf-editor ${datadir}/dconf-editor/"
-FILES_${PN} += "${datadir}/dbus-1/ \
-                ${libdir}/gio/modules/*.so \
-"
-FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/libdconfsettings.so"
-- 
1.8.3.1


