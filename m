Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22468.1794808959747431811
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=OyYvHymO;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37986eb6fa2so3626263eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808959; x=1795413759; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RKtnidX9F8tXCxy7X3lDylidvm81ngfvjVm1SyEg8jw=;
        b=OyYvHymOmQL0X7lkKzcqRMFX27T5CzC+qEPMAEpYDmVryC0ggz63CrIDhBEv8uPFDN
         yiyiwzs2vScyD51t2woGpGqW8BtQC+prjj739oSbM7vxzXiUsIjaiW6KpV9zSbHmwVtX
         EFn7+XwwnXwj89zq5I2TkFsT9WBxKSHffS8lXmVKdU5ANVWLKGwx2sVQL56fmITCJVmg
         auFHNuhb1qs6YHQV0sV7wWgsz0VU77XHRrHWzA4NxgljI3YQQivBUlZG+TbpuSbg8Gnx
         3+TjSAaO01N14F2oXjS9YW1dYOvC0w/r+Mjt59f5INIWWfCbCWwgCw5Gz0X+jPJ2f9GO
         3NKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808959; x=1795413759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RKtnidX9F8tXCxy7X3lDylidvm81ngfvjVm1SyEg8jw=;
        b=FIht2/AzyTYo0dFtpGejuWeDrHuVvzhqdaobUWZFe6bobOarqpiSllYXvEH/YcFhDS
         YrFLg4Ea/xoSUyPFoUlzXZYp24qsGfS7jGF0gUghgGzDO1O/fCXBsy4i3SVzOW0F0p6Y
         iAS1chWExppGd98TOwSuaTfw4Yj9i8//rE+XyvfVI3ThNvHem3u136T0FEsL0/Cp30l5
         yMlG5URIYtBQDvgOKrccG3CGS2GCIMxf2EqL5k4C2GFiZ5uoUfR8GVUbGEvP3Suav8Ph
         5STLbpkycNAQ219O9cXODqIbVP2Z3xSAvlQRCZhkyyr9afxBnljkmxxFymXmfQl0wFFK
         M3eA==
X-Gm-Message-State: APuU4Z+vjqSYROmiS2zJOU+mqni0ShTnmBqd9fjBC/BeEhydwQbqmiIi
	SE6iV24U3znO1IHjNEuQTiX0IlocXbdDv57bkjvnzmj7IfXepg4ukKOtOyNrIPD9
X-Gm-Gg: AYBFou1FgJDqFZzpZdCYAwx8m7n7UahbTlUBie65hkOpFu6ol2WF5BHFa/dz7bQJk9l
	XkZMPz1H6yrrv5xYIaZulXqgGvK3vBs/QRP5ahZk5ykMKS+v6DzoGpcSI0F2ldiHfe0EHs+GZR+
	4IZFpjpOikpWgoi1Lmg3nfVqD72uB0+NR1jlNdyOYxhDN48EOpkXKTdsQyZA9tZp8clgqrpt8P5
	ISkFuFEjPQUUonmWWrvFig5w1/p8CPyQrQa2hzE+ZlQL3ZhT0EEPrnGoiGW/4EVwxqA7gjLpdQ/
	2mHWhQ2Ui2OGJDI4lGF3SEcQ4yqRkunQG4NhFI3I0anxAH4T+Rkh0Zpgg8Zxse+JKmijM/qe0A3
	1I+2A7go+Fgk5wZ43AI13XOAlEsMyTbE29TsyJ7vW1RiyyBuHOgpZQFHgDbBNt4sirFzkuaZeIk
	A+uOfnY28lkmn+t2Ku4pudmiafKqrlE6USltQlVUz46Km6ffqbQt2LWbkhkcuEFb+py3baSRhgB
	SKy9uioORdfLIByUF00F5eFJeLWVhKsa1gnyRizTUorCj+Pq1d8LTekIU+aqqIhI/7ClFnbF6SO
	UitpkSbi1+Kbz0bLgCStQxuhGIU+b+O/5GmdhCYt2yyt6ZKH9eHxJGg7eLFyMaSnbuA1iW2a6vK
	V5antCvJ3dNNSTFdlSFYK6te5PsA/FSpGJHXIQpm7WQccXCscGMPt+zW5xNUaJFmJSd5w1BEm7h
	5y0mtyhz47P1OLZ6RM9GLsVsr7AMRs2yf8L7yRXwc5AzNCX3rrYd/dP7zZ8qsYPqMJ957IjMLLi
	zRleqjF9h911V3GqPSyuBs/ym2K/8Bhy5V70OFCOPMDxXz+hyqISx1aQrZjVnDgguoZKYQE91sw
	uXPg
X-Received: by 2002:a05:693c:41c7:20b0:371:ede8:3e9b with SMTP id 5a478bee46e88-379680cf32amr9647195eec.36.1794808958888;
        Sun, 15 Nov 2026 22:02:38 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-xfce][PATCH 24/30] libxfce4util: upgrade 4.20.1 -> 4.21.0
Date: Sun, 15 Nov 2026 22:02:02 -0800
Message-ID: <20261116060209.2916444-24-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132422
Content-Type: text/plain; charset="utf-8"

The 4.21 series is built with meson only and released as .tar.xz.
Switch to meson, drop the autotools vapigen.m4 workaround and
intltool-native, and use the gtk-doc meson option name.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libxfce4util/libxfce4util_4.20.1.bb           | 15 ---------------
 .../libxfce4util/libxfce4util_4.21.0.bb           | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 15 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.20.1.bb
 create mode 100644 meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.21.0.bb

diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.20.1.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.20.1.bb
deleted file mode 100644
index 44a4308899..0000000000
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.20.1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Basic utility library for Xfce4"
-HOMEPAGE = "https://docs.xfce.org/xfce/libxfce4util/start"
-SECTION = "x11/libs"
-LICENSE = "LGPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4cf66a4984120007c9881cc871cf49db"
-DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
-
-inherit xfce gtk-doc gobject-introspection vala
-
-do_configure:prepend() {
-    # Remove vapigen.m4 bundled with sources so that the one shipped by vala is used instead.
-    rm -f ${S}/m4/vapigen.m4
-}
-
-SRC_URI[sha256sum] = "84bfc4daab9e466193540c3665eee42b2cf4d24e3f38fc3e8d1e0a2bebe3b8f1"
diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.21.0.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.21.0.bb
new file mode 100644
index 0000000000..c8c98d8022
--- /dev/null
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.21.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Basic utility library for Xfce4"
+HOMEPAGE = "https://docs.xfce.org/xfce/libxfce4util/start"
+SECTION = "x11/libs"
+LICENSE = "LGPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4cf66a4984120007c9881cc871cf49db"
+DEPENDS = "xfce4-dev-tools-native glib-2.0"
+
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
+GTKDOC_MESON_OPTION = "gtk-doc"
+
+inherit xfce gtk-doc gobject-introspection vala
+
+SRC_URI[sha256sum] = "205677cb96b778e5079eeac80f3a636d2a909b08fcf2aa05bfe4513c69c27f29"
