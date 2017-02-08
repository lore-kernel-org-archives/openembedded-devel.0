Return-Path: <andreas.kling@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id CEE926022F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 14:31:56 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r18so33617814wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 06:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=P+4WHfDrTe25zVqQDyow1QPIMKkZsRCNJFGuYGuCgok=;
	b=GVl7lWdMAmdvZ5ebX/8280NXqJ0VZuIV5sWvzTFi74NFWbGYGGUkjcZykj2BqgnFn8
	xtwwTe1ayfux+A+HXVqzf9Y24VCrKTM1OLFR2zeVEndQiFDCCa+hi0DahytbjSFXQ8r/
	pY2RtXfv/eg1vohjc6yO4flBKsrhFfVlcCluiAE359G2S02oPSg/0KE3fGolmTjXVqxS
	CIRmOXON9t0j3YUnOgvkiIBXY0jBZ1t/XEilWwpAkSQX9sFlk/k2AnmbdIf03S2h/Gv3
	2ouH6f4zAI1Mkc5BLTi7OAnVU7aVZ311o/yAgpSlyvuQg0V0lvuH7gHIW/OQif6Ts6nY
	+45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=P+4WHfDrTe25zVqQDyow1QPIMKkZsRCNJFGuYGuCgok=;
	b=uCfGKg6MbILAl8Kf7TO8lGr4Sdob6dqVyxig8aLsbMSpQh1HYvvV9KAATG7k3mhsMk
	EjQQLj+1VkNx30I2XJF/fttEp6ZaJ7nn7HMGL7Afr6H00vfcoFWTUwfbXfbNpiltBjml
	zifmPtbN25IgRvuZKc/y+zBoijxpawgHvQh3ajrcILB8398MmDvgUqCHBAu6WoapO305
	ktphiJPQDJitqu/Ys/5cUPdMnexPcMjGIXeINdY00LWg9tldRLea/EHmgokBubMA9uSl
	kgo3pvKGYW8wsBZG98PahiiqJqAK6+p+smVSZcBqhti2Jc3X9X6klQWB+XGYWHzmeQJs
	yB+w==
X-Gm-Message-State: AMke39leX1t+/TL4ITfRL0E6SKQ9b/6CpJ8+dqaWw0xMY1Z/eVpwE3VttNrH8XlcPJCw7Q==
X-Received: by 10.28.20.209 with SMTP id 200mr18376085wmu.64.1486564316686;
	Wed, 08 Feb 2017 06:31:56 -0800 (PST)
Received: from nb-lx-hgc-001.peiker-cee.de
	(business-176-094-229-202.static.arcor-ip.net. [176.94.229.202])
	by smtp.gmail.com with ESMTPSA id 36sm13283196wrz.8.2017.02.08.06.31.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Feb 2017 06:31:55 -0800 (PST)
From: andreas.kling@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 15:31:40 +0100
Message-Id: <20170208143140.22903-4-andreas.kling@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170208143140.22903-1-andreas.kling@gmail.com>
References: <20170208140755.12812-1-andreas.kling@gmail.com>
	<20170208143140.22903-1-andreas.kling@gmail.com>
Cc: Andy Kling <andreas.kling@peiker-cee.de>
Subject: [meta-gnome][PATCH v02 3/3] dconf: make gtk+3 dependency optional
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
X-List-Received-Date: Wed, 08 Feb 2017 14:31:57 -0000

From: Andy Kling <andreas.kling@peiker-cee.de>

  dconf requires gtk+3 only for dconf-editor and is useful
  even on systems without gui.

  add PACKAGECONFIG for editor, enable it by default if x11
  is present in DISTRO_FEATURES

  add gtk+3 to DEPENDS only if editor is present in PACKAGECONFIG

  add x11 to REQUIRED_DISTRO_FEATURES only if editor is enabled

  Note: editor will be dropped from dconf in version 0.23.1
---
 meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
index f7666cc0f..8c66958a6 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
@@ -9,15 +9,20 @@ SRC_URI[archive.md5sum] = "69a12ed68893f2e1e81ac4e531bc1515"
 SRC_URI[archive.sha256sum] = "109b1bc6078690af1ed88cb144ef5c5aee7304769d8bdc82ed48c3696f10c955"
 GNOME_COMPRESS_TYPE = "xz"
 
-DEPENDS = "dbus glib-2.0 gtk+3 libxml2 intltool-native"
+DEPENDS = "dbus glib-2.0 libxml2 intltool-native ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk+3", "", d)}"
 
 inherit vala gtk-doc distro_features_check
 
-REQUIRED_DISTRO_FEATURES = "x11"
+PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "x11", "editor", "", d)}"
+
+#note: editor will be removed in version 0.23.1
+PACKAGECONFIG[editor] = "--enable-editor,--disable-editor,gtk+3"
+
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains("PACKAGECONFIG", "editor", "x11", "", d)}"
 
 EXTRA_OECONF += "--disable-man"
 
-PACKAGES =+ "dconf-editor"
+PACKAGES =+ "${@bb.utils.contains("DISTRO_FEATURES", "x11", "dconf-editor", "", d)}"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.11.0


