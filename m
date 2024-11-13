Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 262B2D597CA
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 03:07:38 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.3306.1731467253018405674
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Nov 2024 19:07:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=joTQBj4Q;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e29687f4cc6so6022609276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 19:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731467252; x=1732072052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FNGO+pepTymz8E+cTuuXZmu4LIOGSvyUwtydLTHEHoo=;
        b=joTQBj4QtQ5dwArVKrUTmmo507w8vOKnrzQQEPL+zGx/yTqOkffPoDRew8LD7xkpbu
         6AKIgGPzyvtWoG4HknZjk4LbeiF+37rcrxYOp5WPl8liIEJkdWKMe3FSwu1e6hM8vvFi
         bfojQL8DcchmCFAKUKbZLNw4H9sZ1WsHzt30bQYyJqufRGvLKPBaMRyanW/4omkYDw7o
         AcpDUCugFFoCzsTKtfxPx7lVg/6O7dqNYvEPiXX1pXGEiCDBSv+SqqaAsZP5wThnylKp
         /ImGJ7OWE3pD0Vx5AZPLg5gLxmA+UP8vf7GqGa2qDSV28jyueHSVJkCnoL40PYhGzMr0
         pZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467252; x=1732072052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNGO+pepTymz8E+cTuuXZmu4LIOGSvyUwtydLTHEHoo=;
        b=pLo8jK9nD+vFiSGprE90e6Kctqa8pnQoFKMycmOIBjy/rW3UX8vj6aEM2l3+LdkJ0N
         4U1xVoufD4B+HU4AXWarEKXsPmorbupvqXLFiXAH38DWSx/gY66hs6TlPlLQkuXBKol0
         9ZD5D0x3umH+rWUCPG/WPCRN9pnywuZUtwZYQkK+pkVeI9OOqr99lTR+gy2G8NezJTrE
         UBdwOO6gSSGZHaJ8aJTWnJYKNoflH0Ous6trYOoVqnOdxd9m2m61rPz7mvGb9FkorPy+
         t6aJy8QVZ1GSQsgpUYwBq/37EsX9/Giyr0COSnHWbSTGS64jtU4hwgYE7KibEhmLk5an
         CWNw==
X-Gm-Message-State: AOJu0YwoDEJNw54W7eJrQmNw+A/cOu1eAiw/2LVA+N6J+JWRMapmTw6i
	TmMSnnWQ4MpuwrI3fMp7bgRGzTkXTWiqk1rxZxQwH+G8q6Rb3H2H9V7d9QOr
X-Google-Smtp-Source: AGHT+IEC+Z2n8au5MiGtVPq3GGOqnqz06loMOfH2SFQabvNTJBuEyE5gPaeSHQDHcTnWsPcKpZiN3w==
X-Received: by 2002:a05:690c:690f:b0:6d3:be51:6d03 with SMTP id 00721157ae682-6eadddbced8mr187010287b3.23.1731467251268;
        Tue, 12 Nov 2024 19:07:31 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eace8d508asm29381627b3.19.2024.11.12.19.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 19:07:30 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] xfce4-session: upgrade 4.18.2 -> 4.18.3
Date: Tue, 12 Nov 2024 22:07:12 -0500
Message-ID: <20241113030712.5644-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 03:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113800

Changelog found at https://gitlab.xfce.org/xfce/xfce4-session/-/tags/xfce4-session-4.18.3

- shutdown: Do not set an error when returning TRUE
- logout-dialog: Fix use-after-free
- Use glib wrappers for memory allocation
- build: Fix build when there is no suspend/hibernate support
- build: Add suspend support for Solaris
- startxfce4: Fix xinit arguments order
- manager: Always use xfsm_manager_save_yourself_dbus() (Fixes #106)
- settings: Remove useless tooltip
- xflock4: Update fallback list
- logout-dialog: Lower warning level
- shutdown: Keep error NULL when unused
- cleanup: Remove dead polkit code
- Revert "Fallback to old method for shutdown (bug #8630)."
- Use g_critical() instead of g_error()
- Use GLib logging functions or g_printerr() instead of g_print()
- Use GLib logging functions instead of g_printerr()
- build: Fix untranslated policykit file
- Escape/unescape string list delimiter when saving/restoring session
- Replace XfceRc with GKeyFile for session file parsing
- Translation Updates:
  Albanian, Armenian (Armenia), Asturian, Azerbaijani, Basque,
  Belarusian, Belarusian (Tarask), Bulgarian, Catalan, Chinese (China),
  Chinese (Hong Kong), Chinese (Taiwan), Croatian, Czech, Danish,
  Dutch, Eastern Armenian, English (Australia), English (Canada),
  English (United Kingdom), Estonian, Finnish, French, Galician,
  German, Greek, Hebrew, Hindi, Hungarian, Icelandic, Indonesian,
  Interlingue, Italian, Japanese, Kazakh, Korean, Lithuanian, Malay,
  Norwegian Bokmål, Norwegian Nynorsk, Occitan (post 1500), Persian
  (Iran), Polish, Portuguese, Portuguese (Brazil), Romanian, Russian,
  Serbian, Slovak, Slovenian, Spanish, Swedish, Thai, Turkish,
  Ukrainian, Uyghur, Vietnamese

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{xfce4-session_4.18.2.bb => xfce4-session_4.18.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.18.2.bb => xfce4-session_4.18.3.bb} (91%)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.2.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.3.bb
similarity index 91%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.2.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.3.bb
index 4021243e4..8151c6e36 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.3.bb
@@ -8,7 +8,7 @@ DEPENDS = "libwnck3 libsm libxfce4ui virtual/libx11"
 inherit xfce update-alternatives features_check
 
 SRC_URI += "file://0001-configure.in-hard-code-path-to-iceauth.patch"
-SRC_URI[sha256sum] = "01ff7fe8d4c2091adefc2925c6b7bb93152ba0732e95c9b9e64d8207fdbdeb8a"
+SRC_URI[sha256sum] = "382f93e096ec6493098719cab8cc31b93ad9bb469c0715c0c5117d75fe7394ec"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.43.0


