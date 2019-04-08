Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 36D3B7D417
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Apr 2019 22:43:10 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id v14so1019324wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2019 15:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=a5PDGptRPYyVRuHX+uRUCIKcid7OQHKYQJkkfcI/43M=;
	b=EDq2Hk5sLSFclPe2wCmbfQSpzzG83Xs6iHrCqPvEAVZXItQhVdIobsZZuF53ePYyeb
	JrX1H0v0imsvUIdjZVIQfOqtwwzv2esxpnT/42CYq/b4Hyooc7lLzxkFx/om8trp226T
	DXMmaqxsEFv+3gtsOpoU1jy6Muwp3HWqnDp3WtLt+YtbWaIcEtNy+mdgpT3vcWgJBq4s
	XArWldosMfD0F7NttHvOuIA2y/3HJRf7D1JwqhtGcHduELMrrTnj2kmPVZQvdkq+Xgli
	QQ+ZQ01cepAbc8bi4oF1wz3APTnU3Piyx7yIp2/EN2He8p5TYfsXmrNW5us38VyM8/Qm
	J5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=a5PDGptRPYyVRuHX+uRUCIKcid7OQHKYQJkkfcI/43M=;
	b=gp5c3N1hLNWZarcVTo23FDa+u8QvZCcV4rfrGNTG557ZlrCSSTNqyOtVJ3oYpp9aVt
	oVsLbVlQ1nJiK/TxaNe/gsdpOGwZYSeIIbPnombOXmfuQEyMs2M5Xtk7TeYlK1w2KS7h
	1opDrtSLwApjwHLYJAuYVOgCe6Yre8z8TNz/ndpAWE28mioKqOdY1x8pn6Va6AJfNV9Z
	3NN18IOXxtQUKsMUkwJ1tPD/cMhPtK4WYT3A+0CbLpQeNfJR0wXRy/kz2+gxO8XXiFNQ
	zF4r/ka3qeiGn6SD+YDHfE6rut3PpcxrrWBxeL7K8gmcZCiLndcd81lfwJofwyJBbdq1
	4MZA==
X-Gm-Message-State: APjAAAWkBunWe1r+LrcEL63Gk8qcoOjEGC/EXiire/1hUn1C0cr/mWYe
	Gax0WLrZYL1TTSPqHbg3xs2FL/bi
X-Google-Smtp-Source: APXvYqwGJyarWsuDrR2O5p98i8QEBlBVSE8zVSJGXz0Yg3oAqsgOSgJ+LfASEPk8qXrpNlcIf1calA==
X-Received: by 2002:a1c:41d6:: with SMTP id o205mr20545960wma.2.1554763390782; 
	Mon, 08 Apr 2019 15:43:10 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F03E65465DDF607A3E693C2.dip0.t-ipconnect.de.
	[2003:f0:7f03:e654:65dd:f607:a3e6:93c2])
	by smtp.gmail.com with ESMTPSA id
	k4sm42824144wro.33.2019.04.08.15.43.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 08 Apr 2019 15:43:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Apr 2019 00:42:54 +0200
Message-Id: <20190408224258.1744-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190408224258.1744-1-schnitzeltony@gmail.com>
References: <20190408224258.1744-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] udisks2: upgrade 2.8.1 -> 2.8.2
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
X-List-Received-Date: Mon, 08 Apr 2019 22:43:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From release shortlog [1]:

| The 2.8.2 release brings mostly bugfixes without any changes to the public API. Notable changes include:
|
| * migration from intltool to gettext, udisks no longer depends on gnome-common
| * added 'windows_names' as a default mount option for ntfs-3g
| * fixed an issue potentially leading to open filedescriptors exhaustion

OE-Notes:

* Follow changes mentioned in announcement
* Rename recipe and move PV into recipe

[1] https://github.com/storaged-project/udisks/releases

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../udisks/{udisks2_2.8.1.bb => udisks2_git.bb}     | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/udisks/{udisks2_2.8.1.bb => udisks2_git.bb} (76%)

diff --git a/meta-oe/recipes-support/udisks/udisks2_2.8.1.bb b/meta-oe/recipes-support/udisks/udisks2_git.bb
similarity index 76%
rename from meta-oe/recipes-support/udisks/udisks2_2.8.1.bb
rename to meta-oe/recipes-support/udisks/udisks2_git.bb
index 3f2130ecd..9c9e5e52a 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.8.1.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_git.bb
@@ -10,8 +10,6 @@ DEPENDS = " \
     dbus-glib \
     glib-2.0 \
     libblockdev \
-    intltool-native \
-    gnome-common-native \
     libxslt-native \
 "
 DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
@@ -22,17 +20,24 @@ SRC_URI = " \
     git://github.com/storaged-project/udisks.git;branch=master \
     file://non-gnu-libc.patch \
 "
-SRCREV = "05ae471be3c2adf2255b3a01edb00bba06e02afb"
+PV = "2.8.2"
+SRCREV = "7a787aa3b340fc7f1ca72d748635d6c5445edc58"
 S = "${WORKDIR}/git"
 
 CVE_PRODUCT = "udisks"
 
-inherit autotools systemd gtk-doc gobject-introspection distro_features_check
+inherit autotools systemd gtk-doc gobject-introspection gettext distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "polkit"
 
 EXTRA_OECONF = "--disable-man --disable-gtk-doc"
 
+do_configure_prepend() {
+    # | configure.ac:656: error: required file 'build-aux/config.rpath' not found
+    mkdir -p ${S}/build-aux
+    touch ${S}/build-aux/config.rpath
+}
+
 FILES_${PN} += " \
     ${datadir}/dbus-1/ \
     ${datadir}/polkit-1 \
-- 
2.20.1


