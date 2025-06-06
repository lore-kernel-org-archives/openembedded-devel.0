Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7404DC5B549
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 04:07:16 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.26235.1749182829843059329
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jun 2025 21:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EN7H2rLb;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e81a6da56b2so185506276.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Jun 2025 21:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749182829; x=1749787629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/sVqk2ZJ0J2ng4a4uRaF1w7z8xuYmFC6BwW66yEnGk=;
        b=EN7H2rLbkNqC2nbD2Iz0UrrGNYltFA3m9fg1Lhvexu5OfO27dniPdE3ULeyEVNyutO
         sDwi/QPZSqUou1UNeCKp9m16DdGWe2L3kHs6BrDGdhBKwMkyeQWAVPMf2oiVsQI4XONn
         ChES3SHRnzIEcBdpqEAdrSAeiehblw3EyAbLIaiirXNuh+bz8orBI7UGjVH6BQrZec3i
         nALqef2TAtwR5+lMcA4QdMZyGa1AVexH42CM5m8e29DhGX2Dn02V+SKzZC6I+bKx1+rr
         Vt2KjiEyee+J1TveI9+1xQ0CGI5JtFO8WB4q9Qs/6feBUmZ9oD8t3dfLnTAunoP2yodL
         DLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749182829; x=1749787629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/sVqk2ZJ0J2ng4a4uRaF1w7z8xuYmFC6BwW66yEnGk=;
        b=k+3lbVte4MhBoc7cdoxKUps1+R2zpzyBVTb+XL8BUh2xnhXPx0UUhUwkDTFkU2rv2o
         gm2bukRv0N4TRSmyKXfd1Z7Ypa6KD/SWZoN9jELlsFUEwNugP8v4gBSoC7NyQiM8km0v
         s/FmA+xiTYScG3JVTv7cWsoPGxRvjouKrrjJ8mVdZCQ9IBkAUICghYZCQzmj8RU9ut7U
         7ST4wKpdZD8HlayPjcjx9JjwEfspXF5Sy9LHNP6/bdM4AKfw+JYJIU8Qed6/cHbNHU5B
         A01g/bWDke5IrqwcJyFCOZkXqSTyjn3bj9Gj+RjiapeCRx5R/HP5SwEErTPkVg7PbeH6
         V8vQ==
X-Gm-Message-State: AOJu0Yw5MZzy4vtRh5Aopw9VJlw7eq345rREJeOctxBn6mC1IdPn+H/1
	Fd6uCMg6Wej9dNgYoYtBxVsbbUusXACVv2PXWbPnpyjp+boxmuKTBcoFHGA1NN43
X-Gm-Gg: ASbGncupTANMtQPk9uYP2rB0PGtVdUq9FId9jXT5tXSvJMETHAsq/gpyYmEbaYP9En7
	nIFpbtiUueeIqsAt8xKwuWANr1T6SZAfa5fWexZe73QYWmd5ETYM6FYHxOcWswzH7FFoNR3kwu1
	1bRNh+HH7uBrh5MrhD2xVMECGSh5lMIJCqLiZw4oEZgwsRNKqXa4PHNjibQv1RLRbGcnfb/Vf+G
	sDSToV/xfjYJMF8cOvYtjAA8xTCsO8lzbSEaqn+kvxy2nkf5KSz661XwBjoJz50TTKSB2ix+I+l
	eRfSV0DwbrY2QNJGp86HfED8lbxuwLKn0y9quWcLm38YoU8nTKNiQxNDaGWuM/hK8FCluCqiQxA
	IgzYmPS1ExoNnC1GreOU+
X-Google-Smtp-Source: AGHT+IFlBigWAbfVMWwVqkOo/B/VxTOmYfx+GKV3ek3DucrVNqbViSEcmKrsSjKhWtuBcbnZywQlUw==
X-Received: by 2002:a05:6902:18c2:b0:e7d:caea:de20 with SMTP id 3f1490d57ef6-e81a2097cffmr3109703276.5.1749182828464;
        Thu, 05 Jun 2025 21:07:08 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e81a4157c3csm241440276.33.2025.06.05.21.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 21:07:08 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 6/6] xfce4-genmon-plugin: upgrade 4.2.0 -> 4.2.1
Date: Fri,  6 Jun 2025 00:06:03 -0400
Message-ID: <20250606040603.2410505-6-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606040603.2410505-1-schonm@gmail.com>
References: <20250606040603.2410505-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 04:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117759

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-genmon-plugin/-/tags/xfce4-genmon-plugin-4.2.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...e4-genmon-plugin_4.2.0.bb => xfce4-genmon-plugin_4.2.1.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/genmon/{xfce4-genmon-plugin_4.2.0.bb => xfce4-genmon-plugin_4.2.1.bb} (73%)

diff --git a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.2.0.bb b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.2.1.bb
similarity index 73%
rename from meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.2.0.bb
rename to meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.2.1.bb
index 6558a1492d..158dd2fbaa 100644
--- a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.2.0.bb
+++ b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.2.1.bb
@@ -5,4 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4b54a1fd55a448865a0b32d41598759d"
 
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "948d08ee5f2140847f109b531bc1d4cc6268496913ea7600d3c5ad89025a0362"
+SRC_URI[sha256sum] = "de540562e1ea58f35a9c815e20736d26af541a0a9372011148cb75b5f0b65951"
+
+FILES:${PN} += "${datadir}/xfce4/genmon"
-- 
2.43.0


