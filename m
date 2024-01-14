Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9836FC47DA2
	for <webhook@archiver.kernel.org>; Sun, 14 Jan 2024 07:20:26 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web11.34967.1705216820421916261
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jan 2024 23:20:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lqgn9evu;
 spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-36074b286d6so41474565ab.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jan 2024 23:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705216819; x=1705821619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SI9/XRyg4BY2heJ/bLt0/Kn+aBDYbbRpPmP4mitW91E=;
        b=Lqgn9evu/Ry3g7hdCB4O+uo057F27OMscV5rE5QKtQTRye2OVBDdB6q7ItGlsKJysH
         elKULSkk4xdT5a1dMVUbVcgtGhZyFuYPvrqvU4gcSOdXjEXg6IHD58HXyEXHXY7uXN23
         6/SYkbXcyF1+qetJ/oUPkhRcnekNZP2a+HHb0LScUQfaZN7p0lN5KZ/0U+OVLKL+3V99
         TBikfbkJrO5VDK53PIjQdH6gKOj1myYil8Dx1oeBJqe0gtluqmsQNx9lVu1Eq98mmj5B
         G0UC/qjUR+j05ClkSle+A//XUNSoqpn2CYanD1TzDzMrSeyRnnsRP/g7XUbMZ0ao1Hfx
         NPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705216819; x=1705821619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SI9/XRyg4BY2heJ/bLt0/Kn+aBDYbbRpPmP4mitW91E=;
        b=t4OnyeZSNbVvAY6MtH5iJegKs6jkjkAngtLRX9AaxRFZls4x1XKX09kQAeOJfCYWR5
         9Vyi7fm9P/hpzryyNFLFZz2XnMo4r3XwAviKlJc1TGnAO/bTGzommGBlbxUaQRAT7NjM
         GDAKnQxG7+GaNxJji11AFpPi0kM5sUoczC0t4GfC1dfJY026FlZEB7hng6a+GdRpIH26
         5uma8GQaT9w8HZM0GMuxt/Vh80J2GWIdK4HQJf1nrwxN8rDdmmHrUEEKMsfVGcjWwc+8
         8xR1mbXxVprSqOemgfMsy+nFUo4MR6JMT8mg/efZV++JvoYt5q1UrLhiGYukRZVOAfrK
         dhtQ==
X-Gm-Message-State: AOJu0YxRRO0fB/t+X07DBrfQ8q0UHeA8QU4F072yWIIUuKoTUDVud/AL
	sdPditYdQUdUn9jk9n9sWsTUnCKX4a2qMA==
X-Google-Smtp-Source: AGHT+IGHzDkxLyE8kBOBprB3Jj9iAU3To2oPPiLRTWOPG1eW+dAFAwItCMdXHXuFYInyp+4eQ6b7gA==
X-Received: by 2002:a92:cf12:0:b0:35f:edad:9b69 with SMTP id c18-20020a92cf12000000b0035fedad9b69mr3127070ilo.37.1705216819330;
        Sat, 13 Jan 2024 23:20:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::3648])
        by smtp.gmail.com with ESMTPSA id i63-20020a638742000000b005b458aa0541sm5864020pge.15.2024.01.13.23.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 23:20:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 3/5] libwnck: inherit gtk-doc
Date: Sat, 13 Jan 2024 23:20:12 -0800
Message-ID: <20240114072014.601505-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240114072014.601505-1-raj.khem@gmail.com>
References: <20240114072014.601505-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Jan 2024 07:20:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108271

Recent changes to oe-core[1] mean that if a configure.ac uses gtk-doc
then gtkdocize will be called. This means that recipes that don't
inherit gtk-doc (to depend on gtk-doc-native) but don't explicitly
disable the use of gtkdocize will fail to configure.

Inheriting gtk-doc both solves the configure failure, and allows us to
build the API documentation.

[1] oe-core 891ec38d4c5cc5ac7bc34938276261ebd6f6d54e

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
index 8655affdbb..d7f47002f8 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
@@ -9,7 +9,7 @@ PACKAGECONFIG ??= "startup-notification"
 PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
 
 GNOMEBASEBUILDCLASS = "autotools"
-inherit gnomebase gobject-introspection features_check
+inherit gnomebase gobject-introspection features_check gtk-doc
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[archive.md5sum] = "f03e1139296e2a3a92e3b65a3080cd32"
-- 
2.43.0


