Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9042E7E41F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:20 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d18so4884943wrs.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=WP+SUvCO3g4Pvoj6fCI+IZKcGzZrxUNMoGjptfDMgxI=;
	b=CzLRYnJbxFNHlHldfFOPvtK6afVfl8O3+/UcnVvfcEPK0yFTzHito0U8deqJMtCbg9
	x2TrljC0YMdo12jvIhOqYV+7UNwRg+xqvwreoAs1Ekz3gefwDrxqDi2s1R0WlEzENi+b
	0MRBNK7SCZwiReCzvg8oMRc7tI8nmXyOBAuuI32Y4pJgPlB3uX2wj/gDmhHsuTQtXpzG
	SrT9t8UXLVLZAtGlmv+NpgId9OjPJClcdUz8Zh/P1T6b3C8LT4Y9xmWPb0vIrA5TpFMu
	P9bzfXABi/UFibWOrdFDmOrRfzAbwftFC7ppfvK2pKYLSFH/urfPrUyP4eQssVBYqbdi
	3BXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WP+SUvCO3g4Pvoj6fCI+IZKcGzZrxUNMoGjptfDMgxI=;
	b=SrA1+J6zWprtgv34fCvTKasHC6Hv2TSDZMhBnuGKIGXUxMML432e4/D5lb7ajCJbLq
	7BNgn4nwOatxmRsu4Zgo3TCwU56Id0WZpq/NDW2Fyz/y+3wU+RKHMX4dr3nGtZcZ2xVE
	3VB68L36Psi4BCuOhiCsMVZ2sW+Jzh4wd9I0qLRy2TT90Arc+lZq5IEY2OHGKZc6Hfr7
	NQW6Kt7Ku6DuYhpazXT8DibZiNPsPvuG37W3NsBj+7p4xZsaY6ZHD9LppuCdaUhO2QMN
	4IBnP+CZthGcfYpKM9R+xOOPUTuxnbpIvqB22r4PBspXRTb0f3Ei5+KqHZZyKiiV32JQ
	19Vg==
X-Gm-Message-State: APjAAAUBJ7TCNDhhpSU5am/LpeaurbLh5VJSBwYpEYuvcsBhkRgME8zz
	QYbwSTim/xMYz/G44r3VpRhcdHbJH3c=
X-Google-Smtp-Source: APXvYqzF/d7qOPc1Sqe5pAW1X51gwuiCyVfSFDpIe5WE4Vxa1InmUDJWPzCi4TbxW7j/KO5S9HI4Bg==
X-Received: by 2002:adf:fdc1:: with SMTP id i1mr30280709wrs.103.1558594161221; 
	Wed, 22 May 2019 23:49:21 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:20 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:33 +0200
Message-Id: <20190523064859.24336-16-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 15/41] mousepad: move to gtk3
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
X-List-Received-Date: Thu, 23 May 2019 06:49:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

At the time of creation there was no gtksourceview3. That was a blocker
to use gtk3. gtksourceview3 was added long ago.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-apps/mousepad/mousepad_0.4.1.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.4.1.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.4.1.bb
index d122bfe37..67c49930b 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.4.1.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.4.1.bb
@@ -6,14 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 # intltool to provide intltool.m4 with AC_PROG_INTLTOOL
 # xfce4-dev-tools-native for XDT_I18N macro and more importantly XDT_CHECK_OPTIONAL_PACKAGE
 # which fixes mousepad/Makefile.am:72: error: HAVE_DBUS does not appear in AM_CONDITIONAL
-DEPENDS = "gtk+ dbus dbus-glib gtksourceview2 intltool-native xfce4-dev-tools-native"
+DEPENDS = "gtk+3 dbus dbus-glib gtksourceview3 intltool-native xfce4-dev-tools-native"
 
 inherit xfce-app gsettings
 
 SRC_URI[md5sum] = "fb85c23bcb096a46aee9ec22b4e4fdf5"
 SRC_URI[sha256sum] = "39a7379b929d964665299c385b2cf705e32e8760698ccc34f91c990bb733518b"
 
-# we have no gtksourceview 3.x around
-EXTRA_OECONF = "--disable-gtk3"
-
 FILES_${PN} += "${datadir}/glib-2.0/schemas"
-- 
2.20.1


