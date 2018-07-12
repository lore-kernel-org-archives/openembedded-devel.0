Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 79A9C75447
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2018 01:27:15 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id w126-v6so52805209oie.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jul 2018 18:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=c3OLroWUwfyB9XTwZi2LSE231CArBXaFpzhrwElTFEU=;
	b=d+AJ/OkejwZmxgIDGzpUfh6bH5De3ic3DwxcZ+aLCBp8W2ISnHzVDKsE5lWw9vrnX6
	Em1DRALEF2xl8aFQ4tcrhf2/qwU5OukaP50Nbfu/Q9FgNULGJCrtzYTJ+YUbyIHfFT1U
	GU0GhSFPzVQB+Tmv4eFhbbBHLfIzXDGTymNjpBqYzELA9E62qjtZIzpiBGRD6FY7WBGd
	Mpmhi856nsYzOXgE5C2fnFOPd/abr+P/Cm+9XVSfwWn8uUkkx+oUKfbWU9/CH1K15caG
	vWlOpf8oPxsCboCnQzTfxWNhIWySs5r4rY3lS6RGLhYxkuvhPlcH7A9T0ee9gQcUp7/P
	tTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=c3OLroWUwfyB9XTwZi2LSE231CArBXaFpzhrwElTFEU=;
	b=LVJN279TtOMwqfhOqyCnMLkHsLeeuHjjvGGtVQZhkCYJE3kLbZkMhNHvvHRZ9RW/6c
	p/48P+X8zEZgHjoGH3+N9Gb6lN88di29cVGLO0XTo2i3P2INZlk+Uo7iqnBBLh1WpZaB
	wmslWppms/0tEX9pmveFUx4PYzSTww4x72YxLcxfckyT5eFc++9msozzZhgHYvs4U5p6
	0qkuafj+mBQLeQdxAOVS0QjDvL4ftf/9ldiWssETSA40S0TC8QdZ49EW7wqTw4ROKRH8
	mf0/8l1cbKvY5CfvlopMIpRhF4PpVcs46uSPJhB9FuWrc5heLwE/y3ANn9MLNz3z1QfT
	bEeQ==
X-Gm-Message-State: AOUpUlG/0ihhqyrA0/vInjgg7TfPvBH6vyaXxZpEKQTwYwirEXmC6Xad
	YAdOu2XFY3uyb+o0Kpv1P8Y=
X-Google-Smtp-Source: AAOMgpcys0+QafchbMbWbolc/bOQNEl+3ekdHK7Sb1SpmbhfX70n6/nP/sqivhq6/4fCwj7c9j7o2w==
X-Received: by 2002:aca:c257:: with SMTP id
	s84-v6mr255958oif.104.1531358836509; 
	Wed, 11 Jul 2018 18:27:16 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:3df0:c2f2:5900:71b6])
	by smtp.gmail.com with ESMTPSA id
	y27-v6sm87401oix.4.2018.07.11.18.27.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Jul 2018 18:27:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 11 Jul 2018 18:27:11 -0700
Message-Id: <1531358832-14848-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531358832-14848-1-git-send-email-akuster808@gmail.com>
References: <1531358832-14848-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 3/4] openbox: fix runtime error for missing python and pyXDG
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
X-List-Received-Date: Thu, 12 Jul 2018 01:27:15 -0000

Openbox-Message: Cannot set locale modifiers for the X server.
/usr/bin/env: 'python': No such file or directory

/usr/libexec/openbox-xdg-autostart needs python, add rdepends

Also missing rdepends on pyXDG

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
index c35a0c7..f4d21b8 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
@@ -39,7 +39,6 @@ python populate_packages_prepend() {
     do_split_packages(d, theme_dir, '(.*)', theme_name, '${PN} theme for %s', extra_depends='', allow_dirs=True)
 }
 
-RDEPENDS_${PN} += "${PN}-core ${PN}-config ${PN}-theme-clearlooks"
 FILES_${PN}-core = "${bindir}/openbox ${bindir}/openbox-session ${libdir}/*${SOLIBS}"
 
 FILES_${PN}-lxde += "${datadir}/lxde/ \
@@ -54,3 +53,5 @@ FILES_${PN}-gnome += " \
 "
 
 FILES_${PN}-config += "${sysconfdir}"
+
+RDEPENDS_${PN} += "${PN}-core ${PN}-config ${PN}-theme-clearlooks python pyxdg"
-- 
2.7.4


