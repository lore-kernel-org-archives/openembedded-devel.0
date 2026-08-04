Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA1AC55172
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 09:11:28 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12426.1785834678487446207
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 02:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Jbcitk5a;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81ed000b507so38554997b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 02:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785834677; x=1786439477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FV3tQxJ0vTincE0pewggijmAr50xIV416MFtIu8X0qY=;
        b=Jbcitk5aJMovIRJrYFL9OUKrMQTZH/g7wLMr4hWFjrRZK52W9ZX9bCWDQPaEEo30m0
         Ea1zK35kU5GoE1MpVx1H1uOq1ro0J5P4lNxCC2rN7ail65ArE0VggtQN8V/yBqo5SIjp
         DgMAVVT33dTDxWITCNTWRXe+7MgdHV4FHJ/M0ZUXfjUlqZ+WyKNjHzIs5AzM6mQvjeiT
         wZNkWzDBUsbBbnuf6sTLP4hnzw/R2QfWYRY+WTj0brDbtSKnXDOs66xkfui0IJW3/6s9
         aVgeV8znxLOoMvAIkHOR/yXLlKzT2Mp8c+7fDb04iqJ4fDqYKPyC2T3zz4CCpFtuA3aH
         nq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785834677; x=1786439477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FV3tQxJ0vTincE0pewggijmAr50xIV416MFtIu8X0qY=;
        b=ku6EZ/Vd7iU2EzM0RpLHz70KLgwOa2FluS5OUiC9xaMxMtw7MbMGiWYEG8PJCJFFLU
         PkNY+sz0/D2KxOCkdEEms032EYeg4sR7BW+1y6qmq5ThfEJXCzA64h2RC4CSc1Wishy1
         PXxwSUgf9q/TcRS3ABMBbQUOG9H8LUTPZb2k24NyMaXIOzr+5LJTEFkz/6al6Lka4kPU
         yKB2S9ycJ8R2KcJx4kJoFNGTHBEBO3KrATl451u5eaLRBlWhPHKuRehyQhebY6Xi6pi+
         qGX2DFIwhgM8czSRVcGp+fDeW/NEUcnK+HaFvhEd6O/DlvFm1KXX6IMw2hylQo4uOXLq
         ASCQ==
X-Gm-Message-State: AOJu0YzAWn7Ysc0icbaAm/Gqtu/uWQniE4ost/hk4/XchwS8dAJXlCIx
	khD+AavgAytfJQLSKNMgP6qOTuzyDWn0TDbuXvBU6Wy4v6OWAtQm5Mc6/H9ggbHh
X-Gm-Gg: AR+sD12yqVJXS/BoHJB7ZwbTJXX4NmwcLe1ERuo5RSevGoWw4lg+sXEwr7BAQBZj4cY
	+vWaPZCqoNZVl1UnUncIxsth5GK5Nuujq45b5GfONPG5+B8byT2noyYFlqQ05U+DHHnwJGAEgd5
	cRvp4cCclubNVw6T8l37sbtNHhIygU63HpBHXiNUyu8gUc/7EluZgvPkGUd1uLCe0rXK918eVCN
	50nZepnVEhO+dL6p2GblTQ2CkSDvQgKlvPbVq5FiVuGRKGolfG4uJG3BzEkFw8aFz7MD19n0Mid
	j085HlRycMlIuj8V11JrPCsjqRoDsYx6q+yQaSAS5A6LIgNXczgWHNUfjf/UUWYEOmagPzJrbpJ
	xzdRUDZidnNaymhmgoGDdjVa02e/JZ6btyuWlsOBLch7Z1zfbiIPaXTqLcJsXBhlatVGysC73Xy
	jtKwrE6In4w5rFJqiRk4TyFEhZ/1ip11KlWwAnEhCxRJXXDn3s071nCSJnXsgMLOjuIp2LXHpKl
	VlIc95VwhItuC/47qov/s8qWIJL/hBYbhRPEuJH74IiSfSyMpKIO0XEK3QrvRBw+lwhLGJ3rx2r
	/kTtimc1HirUrXVxMrbvbl4=
X-Received: by 2002:a05:690c:6706:b0:80e:5236:b944 with SMTP id 00721157ae682-81fd4a4d080mr164058987b3.10.1785834677305;
        Tue, 04 Aug 2026 02:11:17 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-820131d8bdasm1956427b3.10.2026.08.04.02.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 02:11:16 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH v3] thunar: upgrade 4.21.5 -> 4.21.6
Date: Tue,  4 Aug 2026 05:11:03 -0400
Message-ID: <20260804091103.2883650-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 09:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128742

Drop backported patch which is already built into this new version.

Changelog: https://gitlab.xfce.org/xfce/thunar/-/tags/thunar-4.21.6

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../0001-Properly-guard-gdkx.h-include.patch  | 37 -------------------
 .../{thunar_4.21.5.bb => thunar_4.21.6.bb}    |  4 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/thunar/files/0001-Properly-guard-gdkx.h-include.patch
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.21.5.bb => thunar_4.21.6.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/thunar/files/0001-Properly-guard-gdkx.h-include.patch b/meta-xfce/recipes-xfce/thunar/files/0001-Properly-guard-gdkx.h-include.patch
deleted file mode 100644
index 9d4afc7167..0000000000
--- a/meta-xfce/recipes-xfce/thunar/files/0001-Properly-guard-gdkx.h-include.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From dd7fbf4540891053a4083228aac2485e6c469199 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
-Date: Sat, 11 Apr 2026 18:07:05 +0200
-Subject: [PATCH] Properly guard gdkx.h include
-
-Fixes: #1820
-
-Upstream-Status: Backport [https://gitlab.xfce.org/xfce/thunar/-/commit/201f8ca0c3bc7b5e651201526fc3006a130718eb]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- thunar/thunar-session-client.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/thunar/thunar-session-client.c b/thunar/thunar-session-client.c
-index c36719c..2832818 100644
---- a/thunar/thunar-session-client.c
-+++ b/thunar/thunar-session-client.c
-@@ -30,6 +30,7 @@
- 
- #ifdef ENABLE_LIBSM
- #include <X11/SM/SMlib.h>
-+#include <gdk/gdkx.h>
- #endif
- 
- #include "thunar/thunar-application.h"
-@@ -38,7 +39,6 @@
- #include "thunar/thunar-private.h"
- #include "thunar/thunar-session-client.h"
- 
--#include <gdk/gdkx.h>
- #include <glib/gstdio.h>
- 
- 
--- 
-2.34.1
-
diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.21.5.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.21.6.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/thunar/thunar_4.21.5.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_4.21.6.bb
index d8e9edfc25..3ccab0ad69 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.21.5.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.21.6.bb
@@ -11,9 +11,7 @@ GTKDOC_MESON_OPTION = "gtk-doc"
 
 inherit xfce gobject-introspection mime-xdg perlnative gtk-doc
 
-SRC_URI[sha256sum] = "eddbd4bab29c73718734e0bfcf650ceea8b4fcc8cb2cbb0b24fe22b286a2be00"
-
-SRC_URI += "file://0001-Properly-guard-gdkx.h-include.patch"
+SRC_URI[sha256sum] = "5412d3feb14b4c47ccea8b00e9a9e3dcc1ea0e86e305abcee344f2fe82518bf8"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[pcre] = "-Dpcre2=enabled,-Dpcre2=disabled,libpcre2"
-- 
2.43.0


