Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9841DC47DA7
	for <webhook@archiver.kernel.org>; Sun, 14 Jan 2024 07:20:26 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.35541.1705216818987913372
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jan 2024 23:20:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aSryUBFN;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5cf2306c1b4so2689427a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jan 2024 23:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705216818; x=1705821618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Mc5sTZv6rVCxDjaB9nG1Gqtvc0eIIkcFcEZqiQHTtA=;
        b=aSryUBFNBwl8GeWD42u18skNMs44ia9MEhnR3CN3cckMJKv6Ge4gQxIcrK12QYgCcv
         yTDjxjuG9XS1Rcs+q84G7T7xgQ7/soZZSOQIydDcg04lcTk3SRGyfQhHE2ydMTn0zg3D
         j5bwzC27Qcek6SXQbu5khP8FGGrm8FF4E5TTLv1llnP9dBOUO6aHTiCWn0wcOipK+CYR
         tYMIC6Mn8nYaGzrz5YiA0apYLPa1xfiShzO0E0VU3PfTt8u6q/MNCD5P5ZKTKox25Cc+
         OM/gFs7wjNE0MS36fZednxz5wkOgnFnzqrE1Y0VMHWUBjdnx06XNPndqiCVoik7m+eOd
         2yIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705216818; x=1705821618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Mc5sTZv6rVCxDjaB9nG1Gqtvc0eIIkcFcEZqiQHTtA=;
        b=Bo5oqU7uT7RCEbGrwMTswK3TOOBOqCqxlR6iBtYRXDr/6JdmflvMcaISt25IrtgY0k
         BVlGib9BqGj9667C3nuvjAX4P5MuBI9TUuweFeRS2xUKf9uqbizaOUD0TXLOagYUT48p
         HFTDysyBijxD9J9DWQ5jcaNRGaki54VVR4h+blbBmgef0MDEP0gwN728is0NJht+W9PP
         j9oQMAxmGT2unuEaaIk6GtgZj8RD+2eFAPKzSvqPiumjDd5fSvXis9O9bkAW+mHp3X6e
         Q3pOpc1KVYltLW2FqZEyTUP9nh7WCXzPCrlOFezw0kmedmcJ/DSLodTxMLO4GLvZhqm3
         u8rA==
X-Gm-Message-State: AOJu0YwVkgeXP9unzJyJHIGq+VVSKrkfkDjRK8D3N3GpSrCtrq+W2zmx
	kDLiLIRbqPupbUVY49sf3HbRrH3jnK9y2w==
X-Google-Smtp-Source: AGHT+IE79N2K7zLjvL7wuoJfHs89iVZX/JIgY3vUTOkFFVNEjOeP7CFCVLzgp8GR8DhTbkdSeSkAZQ==
X-Received: by 2002:a05:6a20:1013:b0:19a:754:bf4 with SMTP id gs19-20020a056a20101300b0019a07540bf4mr2966006pzc.62.1705216818041;
        Sat, 13 Jan 2024 23:20:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::3648])
        by smtp.gmail.com with ESMTPSA id i63-20020a638742000000b005b458aa0541sm5864020pge.15.2024.01.13.23.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 23:20:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/5] libxklavier: inherit gtk-doc
Date: Sat, 13 Jan 2024 23:20:11 -0800
Message-ID: <20240114072014.601505-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240114072014.601505-1-raj.khem@gmail.com>
References: <20240114072014.601505-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Jan 2024 07:20:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108270

Recent changes to oe-core[1] mean that if a configure.ac uses gtk-doc
then gtkdocize will be called. This means that recipes that don't
inherit gtk-doc (to depend on gtk-doc-native) but don't explicitly
disable the use of gtkdocize will fail to configure.

Inheriting gtk-doc both solves the configure failure, and allows us to
build the API documentation.

[1] oe-core 891ec38d4c5cc5ac7bc34938276261ebd6f6d54e

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
index 7955663f26..f52c210ed4 100644
--- a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
+++ b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6e29c688d912da12b66b73e32b03d812"
 
 DEPENDS = "xkbcomp gtk+ iso-codes libxi libxml2"
 
-inherit autotools pkgconfig gettext gobject-introspection features_check
+inherit autotools pkgconfig gettext gobject-introspection features_check gtk-doc
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.43.0


