Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CEEC79F82
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 17:14:08 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.490.1788887645125344061
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Sep 2026 10:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Mkddh5iB;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: raj.khem@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb752so159451a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 10:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788887644; x=1789492444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mArLEtg55ge84HTiq282CoTBRLccu0yIhNHXT41GqsA=;
        b=Mkddh5iBN2Otebs7849RhtmZzDivdCXJ/dPQt1At0bbTC4wCNhmfRPIpBJCwqFjj6C
         dtQnhYk5+E5fxZsLgXEG3DT+BSkUSqIw9WNo0e9i8TGO6GJF2nYd27/Zw3a/OLJ/XsRR
         V0UnWeG/zG3rQBQ4h4ZYYDm9HUD1uiC+/UhSvmwN6CV8dt/RIGsVZaT0QBfS0Ixe37zv
         cgYzVnHc+yCfAII9xbwa+SUrFAdSfRz/k4yvGVyKi3mHy61E8v7nYMMeHTRVe1MaAy+1
         GZQkzFV3T74YYIePgEBQwfi5Eh7bc2Qw+eqWgJWNhAvbejWQP6CTkwE/6lyGowapsbjE
         fvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887644; x=1789492444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mArLEtg55ge84HTiq282CoTBRLccu0yIhNHXT41GqsA=;
        b=VgGLEs+w8higCSn1Z8EfeUR8ClavqAPiD+sPj4sjn2kZc0PlxbKkZANSKWzC6o3+jG
         Z7PQAiw5WDljfpAQ8NzWAK/GbNdMqwByQX3hTZCbQ98xkr8ofVRZ8mzIU+x3qc1nnsbq
         6kTXwl0oAFqaimtFHWPEOHHQ6zDFBhY9IXGPYhsMyVE+fXY9N6O6p0MSjpDwQHNtVmLE
         cYvL8qcD+2G+lp7k9C61i/9bZ/sAyX0hNyVarTKPIUIS6JptTq/i7P5PZUhviio9Svm+
         Ppbi9b2UZAxRcbRldFLcFWy6uNNFQFK23CHYL9Mn/+dVkhcqbCky9zwHDUoCgGsIWF1T
         bnbg==
X-Gm-Message-State: AFuF++maE2X2A35SPdHRmkBbNmyDTztpW525vWu1s8J5zHraFJnAvtha
	vdH6LuHHb3sIAGm7rd+EXlJObUlUyY2n9aYzGVemtGTCKHbN+5JcB+EjnDKivw==
X-Gm-Gg: AYBFou1cnGyDlPXLUcCJADwk1Oo5ioJJ4MKnc7z08w/tIYqejL72IemUoGZU1/4Q/X8
	B3Z+wWdQHegjXwZYa3alIb+f2fYV8zgbMG6Wy1Uu5ErEehzSY5rU5ID/fLVWogCbR+WXooiYfiT
	wj/b5Bne4TWEjMKUTYl4OV0Lm7GuIhHS9ssCUTpRG/57YZIbiRWuPOR10MB42nHnI45SyroaP+3
	6KgSh6RGebBRHHuVTEqh+hnCYOX7dQ0gqPqBWdJr6qN/mIThTu/eMSJMZADyujnWx9R+oczsRKl
	dlg3JpQVDcSQo3xe+rYPiorNX63Uvz6BisEFMjhIcnOcWCxrViaLVnZusr+QN2An/5T636kbYT5
	TtP50IvK6wde4qIS2Pud/URpYLIk4ZuLyHuPgmdbiw/nLYrsz3KsP9mvt7xK6GB808MLOdTC1Uv
	ZodyVB9cJRZ5BLGjDaI3gazz9i4hZydo3WbvOntq8eNpX/aqBykwvc7HqXN69NoVbLFZmqzUPaU
	87CpZYpE5FE8w9zcp28ETRTE+NMr8Catap0QSQI3yKfFxSKPovTvLqVCAlyEXUm0bFasx2a3+Ko
	Nb9zF/+mXirkL91L+BS1XYsJR3rNPXalWLGP5TTPAWVuOrDEfN4qn1zD9u3aKEtxQgcN+uu/GmS
	obiDUjKDPZ1iAHbQFpSG55ResT9YXt6GssrtQFkIsn616sA==
X-Received: by 2002:a17:90a:d005:b0:398:a2ed:7b5c with SMTP id 98e67ed59e1d1-39bac4571c4mr1160314a91.24.1788887644346;
        Tue, 08 Sep 2026 10:14:04 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm39566297c88.12.2026.09.08.10.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:14:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 6/6] polkit-gnome: Fix build against gtk+3 without the X11 backend
Date: Tue,  8 Sep 2026 10:13:53 -0700
Message-ID: <20260908171353.701307-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908171353.701307-1-khem.raj@oss.qualcomm.com>
References: <20260908171353.701307-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 17:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129871

From: Khem Raj <raj.khem@gmail.com>

0004-Use-fresh-X11-timestamps-when-displaying-authenticat.patch includes
gdk/gdkx.h unconditionally, which does not exist when gtk+3 is configured
without the X11 backend, as is the case on wayland only distros:

  polkitgnomeauthenticator.c:29:10: fatal error: 'gdk/gdkx.h' file not found

The patch already checks GDK_IS_X11_WINDOW() at runtime, but that is not
enough: the macro is declared in gdkx.h too, so the include and the
gdk_x11_get_server_time() call have to be compiled out as well. Guard both
with GDK_WINDOWING_X11 and keep gtk_window_present() as the non-X11 path.

Include gdk/gdk.h explicitly before the guard. GDK_WINDOWING_X11 comes from
gdkconfig.h and no gdk or gtk header is pulled in earlier in that file, so
without it the guard would always be false and X11 builds would silently
lose the fresh timestamp instead of failing to build.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...mestamps-when-displaying-authenticat.patch | 35 ++++++++++++++-----
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0004-Use-fresh-X11-timestamps-when-displaying-authenticat.patch b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0004-Use-fresh-X11-timestamps-when-displaying-authenticat.patch
index 2c9c5bb16b..9f3e8f5406 100644
--- a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0004-Use-fresh-X11-timestamps-when-displaying-authenticat.patch
+++ b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0004-Use-fresh-X11-timestamps-when-displaying-authenticat.patch
@@ -8,41 +8,60 @@ Bug: https://bugzilla.gnome.org/show_bug.cgi?id=676076
 Bug-Debian: https://bugs.debian.org/684300
 Bug-Ubuntu: https://launchpad.net/bugs/946171

+Guard the X11 specific parts with GDK_WINDOWING_X11 so this still builds
+against a gtk+3 configured without the X11 backend, as is the case on
+wayland only distros:
+
+  polkitgnomeauthenticator.c:29:10: fatal error: 'gdk/gdkx.h' file not found
+
+gdk/gdkx.h does not exist in such a build, and GDK_IS_X11_WINDOW() is
+declared there too, so the include and the gdk_x11_get_server_time() call
+both have to be compiled out rather than only guarded at runtime.
+
+gdk/gdk.h is included explicitly before the guard because GDK_WINDOWING_X11
+comes from gdkconfig.h, and no gdk or gtk header is pulled in earlier in
+this file; without it the guard would always be false and X11 builds would
+silently lose the fresh timestamp.
+
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/polkitgnomeauthenticator.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
+ src/polkitgnomeauthenticator.c | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)

 diff --git a/src/polkitgnomeauthenticator.c b/src/polkitgnomeauthenticator.c
-index 23163b4..e57d76e 100644
+index 23163b4..ae237de 100644
 --- a/src/polkitgnomeauthenticator.c
 +++ b/src/polkitgnomeauthenticator.c
-@@ -26,6 +26,7 @@
+@@ -26,6 +26,10 @@
  #include <sys/types.h>
  #include <pwd.h>
  #include <glib/gi18n.h>
++#include <gdk/gdk.h>
++#ifdef GDK_WINDOWING_X11
 +#include <gdk/gdkx.h>
++#endif

  #include <polkit/polkit.h>
  #include <polkitagent/polkitagent.h>
-@@ -306,7 +307,17 @@ session_request (PolkitAgentSession *session,
+@@ -306,7 +310,19 @@ session_request (PolkitAgentSession *session,
      }

    gtk_widget_show_all (GTK_WIDGET (authenticator->dialog));
 -  gtk_window_present (GTK_WINDOW (authenticator->dialog));
++#ifdef GDK_WINDOWING_X11
 +  GdkWindow *window = gtk_widget_get_window (GTK_WIDGET (authenticator->dialog));
 +
 +  if (GDK_IS_X11_WINDOW (window))
 +    {
-+    gtk_window_present_with_time (GTK_WINDOW (authenticator->dialog), gdk_x11_get_server_time (window));
++      gtk_window_present_with_time (GTK_WINDOW (authenticator->dialog), gdk_x11_get_server_time (window));
 +    }
 +  else
++#endif
 +    {
-+    gtk_window_present (GTK_WINDOW (authenticator->dialog));
++      gtk_window_present (GTK_WINDOW (authenticator->dialog));
 +    }
 +
    password = polkit_gnome_authentication_dialog_run_until_response_for_prompt (POLKIT_GNOME_AUTHENTICATION_DIALOG (authenticator->dialog),
                                                                                 modified_request,
                                                                                 echo_on,
-

