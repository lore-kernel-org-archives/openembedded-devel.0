Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web12.9590.1609946257469081185
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:17:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FkAWDWAT;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id b2so4752414edm.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qcH4TSe9gbhRjAsDx3N9hSFK3cOXBhFrMzALFMIpmZw=;
        b=FkAWDWATmrua2YFKP3gjbDqr7Cpjcn1uc5a03bVBksGQC/TR9/4N8EZYSmkt8KNcqT
         Hvjju+4LquzEHZOQ3n/f+s4mQFPWDjWnAJunapbq3OQg36k9+DgBupkL/sEAh6NTzMtU
         QDzuth6Cw0wAiUjeqOocy7/DsuF3wOyJltueWc69A0+07FsvDvVpym7rwPdLoM1RKchi
         60IyePEsjUqPX7oKp+PoldYXkFGc5hfglk+ElkvtKbOHGikFHz40v7wue+BaHXHcTIKB
         lHI2WQSziE+igdcSfTUo3aHuod6AY5AnzcxCMCwrru/JEuEaq5XcRh7k/Lg7vK10lZ4H
         uBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qcH4TSe9gbhRjAsDx3N9hSFK3cOXBhFrMzALFMIpmZw=;
        b=nIT3hLpTDPXSDd05yzLNmA1i4UnvXNsVvbwGMQLlmlkAr3Ss3VNDZyda4GabtI3WQR
         sZrG4v9j8R8KTO64MSqQXgDTvtbd8ZRgRlxvZQKpzFZpQPEylAtlozNFutIjaF7vN9uk
         7+ER9m0yAwVuaJfdhzXlHbBIvio24ZEeaNEOVumXBwpUyO42n3ZSeTWEhcbxaPCroaMq
         doi8iZa3qL0rCJ+1X/pnvY2YVFZQZ280wkei5U734vvcjdDiZwOFjDCQVcZgVcUXZxsC
         /wPnK6XB4UHbYejxRJwmfGfULbzLCHpfWDQAxNlWBTAT4n9PLfpX5aR/R9LzpPw24p0+
         tt8g==
X-Gm-Message-State: AOAM530biGCQZjlDKDIl46C4ZgQroKplkW4XnC1AI0S32j6D5OH5L8N1
	TdVrcSlk4jySTy5KxPDUWc6ND/6NITRcvg==
X-Google-Smtp-Source: ABdhPJx+3breFgsljyO4am80wAqhDU5m81L62FCExQX7sV8na35QkRljNQocBQGYrPPNREVo3tATkg==
X-Received: by 2002:a05:6402:b4d:: with SMTP id bx13mr4304325edb.93.1609946256080;
        Wed, 06 Jan 2021 07:17:36 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.17.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:35 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/28] garcon: upgrade 0.7.0 -> 0.8.0
Date: Wed,  6 Jan 2021 16:16:55 +0100
Message-Id: <20210106151717.1779543-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.8.0
=======================
- fix GarconMenuItem file documentation
- Remove GSourceFunc casts
- Remove GLIB_CHECK_VERSION IFDEFs which are obsolete after glib bump

Release notes for 0.7.3
=======================
[Please note that this is a development release.]

- garcon now needs libxfce4ui/4util 4.15.6+
- Use the symbolic close icon in the error dialog
- Don't launch apps as children
- bump glib (and gio, gthread, etc) minimum to 2.50.0
- relax automake requirement to 1.15
- Add new icon needed for xfce4-about-dialog.
- Translation Updates: Slovenian

Release notes for 0.7.2
=======================
[Please note that this is a development release.]
- Update README.md
- Translation Updates:
  Armenian, Armenian (Armenia), Hebrew, Lithuanian, Occitan
  (post 1500), Uyghur

Release notes for 0.7.1
=======================
[Please note that this is a development release.]

- Drop support for Gtk2
- Drop Gtk3 ifdefs
- Switch to xfce_gtk_image_menu_item
- Add support for GObject Introspection (Fixes #4)
- Improve GObject introspection annotations (Fixes #8)
- Fix missing transfer annotation
- Field codes expansion API update
- Transfer some code to libxfce4util
- Fix default merge rules in xfce-applications.menu (Bug #15504)
- Rename exo-helpers to the new xfce4-xx ones
- Do not add INSTALL in dist tarball
- Fix a memory leak
- Switch to README.md and foreign automake mode
- README: Use table for debug arguments
- Add basic GitLab pipeline
- Translation Updates:
  Albanian, Asturian, Chinese (Hong Kong), Danish, Dutch, Eastern
  Armenian, Estonian, Greek, Hebrew, Indonesian, Interlingue, Norwegian
  Nynorsk, Polish, Portuguese, Uzbek, Uzbek (Latin)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../garcon/{garcon_0.7.0.bb => garcon_0.8.0.bb}          | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/garcon/{garcon_0.7.0.bb => garcon_0.8.0.bb} (64%)

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_0.7.0.bb b/meta-xfce/recipes-xfce/garcon/garcon_0.8.0.bb
similarity index 64%
rename from meta-xfce/recipes-xfce/garcon/garcon_0.7.0.bb
rename to meta-xfce/recipes-xfce/garcon/garcon_0.8.0.bb
index c4b858fd7..bbaa6fd6f 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_0.7.0.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_0.8.0.bb
@@ -4,14 +4,17 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=04a01abcbdabffae1ca26335a293276b"
 DEPENDS = "xfce4-dev-tools-native libxfce4ui intltool-native"
 
-inherit xfce gtk-doc features_check
+inherit xfce gtk-doc gobject-introspection features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch"
-SRC_URI[md5sum] = "2964c7a7e5d4aac58b4afef9b8602914"
-SRC_URI[sha256sum] = "82c3b61b508011642b09e6fb01b1d3f22c4e4de0fc54a9244327d0ddb66b2423"
+SRC_URI[sha256sum] = "4811d89ee5bc48dbdeffd69fc3eec6c112bbf01fde98a9e848335b374a4aa1bb"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
+do_compile_prepend() {
+    export GIR_EXTRA_LIBS_PATH="${B}/garcon/.libs"
+}
+
 FILES_${PN} += "${datadir}/desktop-directories"
-- 
2.26.2

