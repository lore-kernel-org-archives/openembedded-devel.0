Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECABD64082
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 19:34:01 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.1720.1731094303167012556
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Nov 2024 11:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BoBSP/ni;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e28fe07e97dso2693817276.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 Nov 2024 11:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731094302; x=1731699102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aJL5ZvgwtY4qToYm4USV6ViA3R8g3CrRb2LJay8Bbms=;
        b=BoBSP/nip+pS6wGqzySwpp/CPHoqmSbr/JKsikgGsVEdYBA9xVJqBYtybzbBj6VFl8
         TKlx3aRAh8J1crgqx4v5tURCtIJGfzU/igR8Nn/aP8j3CDxYj8shCkUSKcUklEkN3n8N
         CeghnC+BaTPxcAmzD7vlpNEh7tBDc8lCjyad+pcObyQ3PF1kpZr2+cDBqt8J7it/G8Xc
         ZX21o/VmD89SSd4oI6Occ6H/9luuVuEVVSrXEb0snqRUosNGz8ikIyVqB3qrskZIArtO
         35XaWDXmOSm+9ZYXzxBi3VoLNHTSY/tyR1Repv+crxTU6YJ/0aKz9Rg7XwTEU4xyFCe0
         cieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731094302; x=1731699102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJL5ZvgwtY4qToYm4USV6ViA3R8g3CrRb2LJay8Bbms=;
        b=g/gfBqT74KKab9+RQz7EaCjo/03Pw6i06sKBunyAmxUSuPdpP9GwDDNqVAeefn7vHr
         A7dRuvBBmJEVptL+Fd1Hi39j9637ugKMoKQePpROaRGokZnGE+ppz2vTNlAvTOPj3MEL
         aOeDIsrwsH7Q7ZGeFMGY2ZGBKhQobOYvOHWSOUVAHhRN6x/zXYzD5iy2l/A7WuOQy4w8
         o2FShR3LchN3umARMkmi0eMSFO8q6T7omy5GLaRX8YUE2tD0SmTxqizqgdMs9lnZT+Hi
         cIQGvgkEWWUZBVrnwz4ayHVzJeSZGwDFQ83i6kIJS+3jjUlaHD1s5iKijkgxLbXa1R7N
         KL2w==
X-Gm-Message-State: AOJu0Yx2e2KlAynyzXuEJsTtzrmqTHUpIaR3CCRVy6Fb4PAr5XXMRcug
	64ajLGS9TxD/5A3SLkZEF9GB9Y2fEN00wgCjm7L6Znietg2G92Ths170NomB
X-Google-Smtp-Source: AGHT+IFPV/U6JW4vqIsgS8BiMgl/yMar+Yz3cPFqO7y5cQMmLRZ6Vsbkwk9N/K5cnq86J8Y2crZb4A==
X-Received: by 2002:a05:690c:7308:b0:6e3:3521:88ff with SMTP id 00721157ae682-6eaddd9507amr50933497b3.18.1731094301754;
        Fri, 08 Nov 2024 11:31:41 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eace8ee1cbsm8396467b3.29.2024.11.08.11.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 11:31:41 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] xfce4-panel: upgrade 4.18.5 -> 4.18.6
Date: Fri,  8 Nov 2024 14:31:26 -0500
Message-ID: <20241108193126.7812-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Nov 2024 19:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113766

Change log found at https://gitlab.xfce.org/xfce/xfce4-panel/-/tags/xfce4-panel-4.18.6

- Update copyright year
- Do not use g_log_set_always_fatal()
- launcher: Ensure default icon in empty launchers
- build: Search for bind_textdomain_codeset in libintl too
- Fix memory management of GTypeModules
- pager: Avoid recursion in WnckScren signal handler
- pager: Do not query workspace count if screen is not initialized
- libxfce4panel: Fix custom menu items management
- clock: Create monitor proxy asynchronously
- Add missing G_BEGIN_DECLS
- Translation Updates:
  Czech, Finnish, Hungarian, Icelandic, Interlingue, Italian,
  Portuguese (Brazil), Turkish

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{xfce4-panel_4.18.5.bb => xfce4-panel_4.18.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.18.5.bb => xfce4-panel_4.18.6.bb} (94%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.5.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.6.bb
similarity index 94%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.5.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.6.bb
index 8e4e4966c..acc05f13f 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.5.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.6.bb
@@ -14,7 +14,7 @@ SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
     file://0002-use-lxdm-to-replace-dm-tool.patch \
 "
-SRC_URI[sha256sum] = "b20e0d10cc5149a601d8eee07373efb446ea3e179dd032ed8ddb5782e3f9e7cb"
+SRC_URI[sha256sum] = "21337161f58bb9b6e42760cb6883bc79beea27882aa6272b61f0e09d750d7c62"
 
 EXTRA_OECONF += "--disable-vala"
 
-- 
2.43.0


