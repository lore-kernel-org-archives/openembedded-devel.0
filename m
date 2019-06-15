Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id B9C9B7E3AF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:32 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id x15so3351196pfq.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4h3E0Js2feQNlBo/EtFisBriNHAtvETZoA9DaF2Vao8=;
	b=gQoPdl9e5tQCdDXZLRa77a/5+l+J0iG8TGnehme66fwW4P73VyzK8HoLmRLnM7Ybfw
	p32jxdDirAJPO31xeQNGbVSXVuBioQ25aNhIoWBnQ6ByVfgMaIXjr2RaJfGPRGQRFwJ6
	ZbblYQfq8/vV6EHy29OCUAGuHR8d58h9Ydg/hsoymdeq8cfvTz07cI6jPtJX9Du03kPr
	/huVgcG+nIEmCw4mCIQDLEtBofox/64EazAAbyfMgi3R0sRzTGi4VoJGfxshGAMIKf8e
	8GumLKT/1bPz1/hSEC5RBvutlYxFzgr/N/oXkv0u1Gcv5lhzdeedE5ihF+aCiTAmFYsQ
	nO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4h3E0Js2feQNlBo/EtFisBriNHAtvETZoA9DaF2Vao8=;
	b=M4LnRLKHF9xE0iKavKqmpypdcDRdlZraTelToXRKO+KdQkJTWRkZgy8BJAqPV/XGAi
	M6SF+UPg6htmRERJ0s36AGk2h1FhkYlSoyvOK1KA4IhjnI9nfaO2UZjVgW5j0huBnrTg
	2H1IXQhoOyJMLoR0P9ZR1IwHGTc6QPAlqHcJAaJpWDLRYS1f7vBnSCTSMlnjU+KIjdrS
	uL7ueQ6yEa67UICNKgI0Y985nCvN3AMrMvtuKYFW3XtJSPNsTkfWOVRuk1kCvDsJ2KAL
	VObgOrXnPneptQfKxjY8JGuS9SP797IeLdrxh3NNVkWZdwV3s0kA30Ct2FlSejqnoe0T
	uUNA==
X-Gm-Message-State: APjAAAV9eIv0KjkGvfYoRviglj9XdjREv2V/zZ0VixQrYad3oqL2tQVg
	GDu54Ts+UYDR+OzFhmNMUbh9iVGA
X-Google-Smtp-Source: APXvYqymKcdgM46xlt6bfqwsPyGKiXeXNugqtJQhxhSE+D15XE7PjFsUviIOgft9MFdKUW0+jb8e7g==
X-Received: by 2002:a63:4006:: with SMTP id n6mr12626857pga.424.1560621453594; 
	Sat, 15 Jun 2019 10:57:33 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:05 -0700
Message-Id: <e14c57e7db6a02a7829f412c34a1ab8825f927ab.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 01/23] gtkwave: add distro_features_check
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:32 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
ERROR: Nothing PROVIDES 'gtk+' (but /OE/build/luneos-warrior/webos-ports/meta-openembedded/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb DEPENDS on or otherwise requires it)
gtk+ was skipped: one of 'x11 directfb' needs to be in DISTRO_FEATURES
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gtkwave', 'gtk+']

and

ERROR: Nothing PROVIDES 'tk' (but /OE/build/luneos-warrior/webos-ports/meta-openembedded/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb DEPENDS on or otherwise requires it)
tk was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gtkwave', 'tk']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
index 60df6f7..b9aae0f 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
@@ -14,6 +14,10 @@ inherit pkgconfig autotools gettext texinfo
 DEPENDS = "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf glib-2.0"
 RDEPENDS_${PN} = "tk-lib"
 
+# depends on gtk+ which has this restriction
+inherit distro_features_check
+ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
+
 EXTRA_OECONF = "--with-tcl=${STAGING_BINDIR_CROSS} --with-tk=${STAGING_BINDIR_CROSS}"
 
 FILES_${PN} = "${bindir} ${datadir}"
-- 
2.7.4


