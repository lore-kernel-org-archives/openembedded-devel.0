Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4915C4167B
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 03:08:27 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.5391.1699931298530929126
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 19:08:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i+1lV5XE;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cc3216b2a1so39364965ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 19:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699931298; x=1700536098; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tINHRy7guJoRS05TiGAk8bW8f6xvSxq/WFY/wfCFc48=;
        b=i+1lV5XEDMzQvGFyEhrI2N5tpGMZJ5C5Vi1f8NkLIz12lgu5DE6ZNJLvqv2ejxBLu/
         oeh8Dw81H6QUx+ml9Q8VAYc9mmJbWuqLKRpihFheSe91MrPo2su4Iy87b4Gyi0/XrPZm
         Gd/aecUB5AFPDZVklU+JosufIoQXp8d4T5a0Y6Rvy9fkfbzMjKzlyNVGKmWXaVzKeuRA
         lKNuSAnKwNuXPBTnM/op/2WnAg1Jpg1xyWMJ8Yninh147aj4fRj8mksvAAz6nDqmXuXK
         9EEOEAoC4zM6XMnpNYOCptWPuPfAsOj4A5b+vmlEB6AX5EIvumXEaEJzd4vK7v5QTh7H
         Bh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699931298; x=1700536098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tINHRy7guJoRS05TiGAk8bW8f6xvSxq/WFY/wfCFc48=;
        b=RrObBlUd/E5jaVzAq/lFcvKInwyvlbCLnCNW1MDxsgPoV2Eiy5rLACOGWvPY6a/nFu
         ZuyvSW+ErQFq0sZILFoBvDxcUuavAtYZX/TQ0D5w2e54/AR7F2Yh1MszvsVte6qPDDCB
         ZxxHuypOxjN0a91jFH2H9rJhckNNHpWKb+6AXYMrObyRCAfsABt57j0pHZPc3fCdPq+B
         3H/YRpnlJdDvKQRKIOhJNVm0SdraGg1s2ZpJZ0e/lBsyaDN+qfgYlCrg1TSnsus34KrF
         301KKvkWPWn5p4yG7MyZ4WGWH1HyybZy4iiJ6Nvwow4HelMDDFQ0FcZK/BcK5QdJDBP7
         uA+A==
X-Gm-Message-State: AOJu0YyiWegKTZlP2xOwTxBfPn5G3YjL8J6QRINSQA25g7o4JZkNcSMx
	XoNfEGbdexswxkPrpHXd01vDAst3gKEfRw==
X-Google-Smtp-Source: AGHT+IHJY6+miv+VL1+J26IDyyqfxJGdwtsod2hhrlGvBhy5YO316Ly1Jp8V0Wl0CAs0DRgFviPUAQ==
X-Received: by 2002:a17:902:da86:b0:1cc:70e4:28e9 with SMTP id j6-20020a170902da8600b001cc70e428e9mr1338935plx.49.1699931297641;
        Mon, 13 Nov 2023 19:08:17 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id n2-20020a1709026a8200b001c44dbc92a2sm4687978plk.184.2023.11.13.19.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 19:08:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 02/10] gnome-console: Add missing dependency on gtk4-native
Date: Mon, 13 Nov 2023 19:08:03 -0800
Message-ID: <20231113-gnomebaseclass-switch-to-meson-v1-2-111dd5d0fe68@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113-gnomebaseclass-switch-to-meson-v1-0-111dd5d0fe68@gmail.com>
References: <20231113-gnomebaseclass-switch-to-meson-v1-0-111dd5d0fe68@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 03:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106689

gtk4-native provided gtk-update-icon-cache=0D
fixes=0D
| ../gnome-console-45.0/meson.build:137:6: ERROR: Program 'gtk-update-icon-=
cache' not found or not executable=0D
=0D
Signed-off-by: Khem Raj <raj.khem@gmail.com>=0D
Cc: Markus Volk <f_l_k@t-online.de>=0D
---=0D
 meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
diff --git a/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb b=
/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb=0D
index 3282a6d5d3..748ea7b5a5 100644=0D
--- a/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb=0D
+++ b/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb=0D
@@ -7,9 +7,9 @@ inherit gnomebase gsettings pkgconfig gtk-icon-cache=0D
 =0D
 DEPENDS =3D " \=0D
     desktop-file-utils-native \=0D
+    gtk4-native \=0D
     glib-2.0 \=0D
     gsettings-desktop-schemas \=0D
-    gtk4 \=0D
     hicolor-icon-theme \=0D
     libadwaita \=0D
     libgtop \=0D
=0D
-- =0D
2.42.1=0D
=0D

