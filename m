Return-Path: <andreas.kling@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id F3C1777317
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 09:07:40 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id c85so254145511wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 01:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IPeobukaQ9TPS4t90/itGg1SKNsTRam9ZSyA/mnZ0dw=;
	b=MQoj+OrChMaHh6AH8B6U0zKGfUgWdpj6GooIr3i2ihhIfcbrObodMZ0+k/wMOCkvL/
	n5wOKmY8JdTKf3P7s1oJzYG+Df3E4B9upba8ATJUAMWYPUaWQ+RXDvzNNK/jntQU260C
	i5o11VyKiwaQ/yZJsyFsRAxcL0td6uDslofSI+j8F7YG9vIDV1wwg8YCb5gY0K6RnZOT
	AlxFEzMBx9KRa0Wjf9Jl1G8aRmVY5kBHLfqLHCrIfnOW3e79N0Aiz+gukmsXi3vv3gmU
	XZHDpCafv4oWFlZJWazUkwT0s0nBbSNUj1961AlN1XqDNI4+BiHDjwkKaq5eNYADbqLh
	igXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IPeobukaQ9TPS4t90/itGg1SKNsTRam9ZSyA/mnZ0dw=;
	b=rHCkO5X0dDhUM0RPcoTScllvx2mLgaDouiT5zLc1hf+UzgNHaVXvo6V5EknREIG5e0
	nSkbVTDkmYCbqMC54V/NxejhLs7+oW4laetJZGJ7NCEHuypoSCJpzuZ975WFoIaYHK1+
	PhUl9uh/1t4joiIBsvtM+cuqDR5zBppXiQx4iSx4BaYnjvqc1Fq1kgV4ON77snpA8Ts3
	UAsc19F3VhCIq6pPxgzJZFrWOKfsoXQY6R24w9zgPxfxwKPE/Z+6c0oN8KyFEQ2hn0Qn
	9cnGM7dkq+d3/e8h/GGI3j1lw7z1F2/Z0G87tNJm8uUepR8iEJz95AZlvAnxvfK+35oC
	Rr/Q==
X-Gm-Message-State: AMke39nPkFzKrw1bZCSIOa2NA8CeIS9CZfr8GKnIPuED9/aBm74kY89c81JAmyPoNqiNow==
X-Received: by 10.28.153.196 with SMTP id b187mr24592477wme.53.1486717660898; 
	Fri, 10 Feb 2017 01:07:40 -0800 (PST)
Received: from nb-lx-hgc-001.peiker-cee.de
	(business-176-094-229-202.static.arcor-ip.net. [176.94.229.202])
	by smtp.gmail.com with ESMTPSA id v128sm565618wmv.2.2017.02.10.01.07.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Feb 2017 01:07:40 -0800 (PST)
From: andreas.kling@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Feb 2017 10:07:22 +0100
Message-Id: <20170210090722.11753-4-andreas.kling@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170210090722.11753-1-andreas.kling@gmail.com>
References: <CALbNGRQAEX5aBsvsb3rY3CQ1C0V-WFzsJKxnNnLos8LdJJxA9g@mail.gmail.com>
	<20170210090722.11753-1-andreas.kling@gmail.com>
Subject: [meta-gnome][PATCH v03 3/3] dconf: make gtk+3 dependency optional
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
X-List-Received-Date: Fri, 10 Feb 2017 09:07:41 -0000

From: Andy Kling <andreas.kling@peiker-cee.de>

  dconf requires gtk+3 only for dconf-editor and is useful
  even on systems without gui.

  add PACKAGECONFIG for editor, enable it by default if x11
  is present in DISTRO_FEATURES

  add x11 to REQUIRED_DISTRO_FEATURES only if editor is enabled

  Note: editor will be dropped from dconf in version 0.23.1
---
 meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
index f7666cc0f..e24bde449 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
@@ -9,15 +9,20 @@ SRC_URI[archive.md5sum] = "69a12ed68893f2e1e81ac4e531bc1515"
 SRC_URI[archive.sha256sum] = "109b1bc6078690af1ed88cb144ef5c5aee7304769d8bdc82ed48c3696f10c955"
 GNOME_COMPRESS_TYPE = "xz"
 
-DEPENDS = "dbus glib-2.0 gtk+3 libxml2 intltool-native"
+DEPENDS = "dbus glib-2.0 libxml2 intltool-native"
 
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


