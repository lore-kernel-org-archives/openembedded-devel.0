Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515A6C9832F
	for <webhook@archiver.kernel.org>; Sat, 26 Sep 2026 16:17:50 +0000 (UTC)
Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22290.1790439469370699474
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Sep 2026 09:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NWZgGwdh;
 spf=pass (domain: gmail.com, ip: 74.125.229.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3413069aa25so1018750eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2026 09:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790439469; x=1791044269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tPLzzs4nu4xmsCak75NRnO7m+tILXPjxrpuVkDvVOb0=;
        b=NWZgGwdh5me1+v5pIEumhLWJb6T6wrGc545nc7bZFKnMaeni4nTh1Prsa26+5DnCnq
         8dPVKmBnB0K8APAuBr2ZmAul7v606V04JJ7iXWNFq+GP36BY0eMAXiv4MowjqpdPy8qE
         O0gVymL+sZWuvzqAyNcepzXlLC1M3zjjBLUOEfgV8EutwR99i2PqO/qjo5a/ckeBU4Ly
         zQQadWnGWmuz6dAALTr9c5wZTFhNGVoSpinrc78WRd/LxIss2hzFa2YjiPcmAh7QIeev
         h7UPkFP81CJfcpCyNEHQ1NkDtxeVSxGtzX0VfEOvIHa27I7m2hNGtdSHX7eB2Js9Txq1
         2jYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790439469; x=1791044269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tPLzzs4nu4xmsCak75NRnO7m+tILXPjxrpuVkDvVOb0=;
        b=OnGIGozG84A1h3ICfrx7a3koOVr5rN61PPOEZkYv6AktAiUaEDXXXCV1mr9ZJxLyI1
         ZzPzUcupOOKn0Ng7z6oRY/d9VNFlYUTpSnv+0eC5B2Bw7O1qBm7KMN08ZlLChwmkER42
         QPdT3JSEUBUmDNDks8Hy/s0AZJJy1gKqJG3YNzmOvB080vzkQvG7DKKG+3N7cmA5t/I3
         E/5Gq9RxKV0QuKpQ/WwmA6rbmhb120YTyn3RqQgb4EuUV2RzuAS929IaRggXZPiGi+a/
         5TDhAiMDwdlmkn6l7jhHxQYQQJLSXKU4bY9mVjdPCvnhEde5/Dx30UiinJAgsnKuspjd
         OO9w==
X-Gm-Message-State: AFq9FYIYhqSrqi5tbgOxSmjLMquqbex6wYGTs8vpxen7L/y6ZUFLrBgE
	0MRzhFm4FThCuALN98k9yjXsT5yDhUA/kq9dLcMTvwnAe2MFzML9siJbZOqJ5bo3Ua4=
X-Gm-Gg: AYBFou13cxarQB6dMq5rxTjjS5W7iYJ5nOj3iqEGdPPsIFKF8Ayg4L0f1Ri8KYAny7T
	1bJNrlrKd2uBTrwZD37o0iQOzhBwZ62omil4avYsSRdMPYjWFYFFkSRQk+dd5HoU2MNm+AmW4xV
	QFaVXvWoj96TutWZUVJUKm1NA2U2ymRUw4ousxxkWLEWH6fTpKc5N0MZbOU7FpWxNdu3x2gtouU
	jnT83casZHyA/eCTR+EjA7ft0BItfi+TbEgDh1q6yVDaw0VWeaviZ0+tAF8bfUYpdVuIe9s3jUv
	73l7g9qFCp+CkPIjEy0X9YjJi4XIvbmpu/eZNSz3eXrZ6vsz3NKKhnIEZ1w6Otjg0fZoylMjHM8
	Z9xMDo+DFDBOEqwq3J5EzLrGNfnNjxQAYYUuLZfPprHB4HAgKt/P4nVVd+1nsHl3Ljzjs5H3XQP
	eBz84Pg6bPLvk7VNThx46C03wZHcKV78sp627RBIfw5OYpWNITvs/nipWrlBQFe3Jp+IInirBUE
	ZUzM5jJ5pOWqFRLTQdfJvhTwwaTamQEiIUZ/0FpBH0yDh9iFlsAjgGOyxHB+SQ0x4r+4oZGuQEm
	IjWIEiKYdltCWpb/8uAHuS9YGYQ4tGF/hKaxCDhJ1a8ofttT2r8EytOFqnsJ41t0XaS8kdYrf7i
	FO+5xolf5x5usTKXdSmd1sd9tBGyXgHIoKlS5Okd9Lb6wfYRdhr1fVRW6NQdWkRH4CXO5a13RJy
	jLqzvy8jFk3JWRUCv0GJPCc6mS7uDU0eRcGkwKOA==
X-Received: by 2002:a05:7301:1505:b0:341:80ea:c987 with SMTP id 5a478bee46e88-34271c88658mr3170147eec.17.1790439468545;
        Sat, 26 Sep 2026 09:17:48 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141a4a00dsm16609664eec.1.2026.09.26.09.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:17:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] sushi: guard libsushi's X11 Window field for Wayland-only GTK4
Date: Sat, 26 Sep 2026 09:17:45 -0700
Message-ID: <20260926161745.3891393-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2026 16:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130319

ExternalWindow unconditionally declares an Xlib "Window xid" struct
member, but GTK4 only exposes the Window typedef (via gdk/x11/gdkx.h)
when it was itself built with the X11 backend. On a Wayland-only GTK4
build (GDK_WINDOWING_X11 undefined), this fails to compile even though
sushi's own X11 handle parsing still needs an integer member to track
x11: handles received over the window handle protocol.

Fall back to gulong, the same underlying type as Xlib's Window, when
GDK_WINDOWING_X11 is not defined.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...the-X11-Window-field-when-GDK_WINDOW.patch | 42 +++++++++++++++++++
 meta-gnome/recipes-gnome/sushi/sushi_51.1.bb  |  2 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/sushi/sushi/0001-libsushi-guard-the-X11-Window-field-when-GDK_WINDOW.patch

diff --git a/meta-gnome/recipes-gnome/sushi/sushi/0001-libsushi-guard-the-X11-Window-field-when-GDK_WINDOW.patch b/meta-gnome/recipes-gnome/sushi/sushi/0001-libsushi-guard-the-X11-Window-field-when-GDK_WINDOW.patch
new file mode 100644
index 0000000000..f93734800d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/sushi/sushi/0001-libsushi-guard-the-X11-Window-field-when-GDK_WINDOW.patch
@@ -0,0 +1,42 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 25 Sep 2026 00:00:00 +0000
+Subject: [PATCH] libsushi: guard the X11 Window field when
+ GDK_WINDOWING_X11 is unset
+
+ExternalWindow unconditionally declares an Xlib "Window xid" struct
+member, but GTK4 only exposes the Window typedef (via gdk/x11/gdkx.h)
+when it was itself built with the X11 backend. On a Wayland-only GTK4
+build (GDK_WINDOWING_X11 undefined in gdkconfig.h), this field fails
+to compile even though sushi's own X11 handle parsing in
+create_external_window_from_handle() still needs an integer member to
+track x11: handles received over the window handle protocol.
+
+Fall back to gulong, the same underlying type as Xlib's Window, when
+GDK_WINDOWING_X11 is not defined.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libsushi/externalwindow.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/libsushi/externalwindow.c b/src/libsushi/externalwindow.c
+index 1111111..2222222 100644
+--- a/src/libsushi/externalwindow.c
++++ b/src/libsushi/externalwindow.c
+@@ -38,7 +38,11 @@ struct _ExternalWindow
+
+   GdkDisplay *display;
+   char *wayland_str;
++#ifdef GDK_WINDOWING_X11
+   Window xid;
++#else
++  gulong xid;
++#endif
+ };
+
+ G_DEFINE_FINAL_TYPE (ExternalWindow, external_window, G_TYPE_OBJECT)
+--
+2.43.0
diff --git a/meta-gnome/recipes-gnome/sushi/sushi_51.1.bb b/meta-gnome/recipes-gnome/sushi/sushi_51.1.bb
index 8af34b2f26..c1584554b5 100644
--- a/meta-gnome/recipes-gnome/sushi/sushi_51.1.bb
+++ b/meta-gnome/recipes-gnome/sushi/sushi_51.1.bb
@@ -28,6 +28,8 @@ GIR_MESON_OPTION = ""

 REQUIRED_DISTRO_FEATURES = "opengl gobject-introspection-data"

+SRC_URI += "file://0001-libsushi-guard-the-X11-Window-field-when-GDK_WINDOW.patch"
+
 SRC_URI[archive.sha256sum] = "d326ec69fc004be3a5fc048f7ecf2c8eb828b7d8b682f1e7a2ba01a5e72993e1"

 export GI_TYPELIB_PATH = "${STAGING_LIBDIR}/girepository-1.0/"

