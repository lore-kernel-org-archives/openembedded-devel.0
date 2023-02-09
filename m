Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF4EC636D3
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 20:56:14 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.2738.1675976164301333319
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Feb 2023 12:56:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eZMwLkyJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: festevam@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id n132so2751153oih.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Feb 2023 12:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1675976163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wOusLYeotCf0bv0x/jrUMaNaElkCG8OoiqDIpUwIrnU=;
        b=eZMwLkyJNPdY10BGAZe/GfJIDxGPCr6hT7MuPgw+14VJzEYwdHyC2pcsww7V39Tbk1
         3rgWd0hoACubaFF6WmmsE64cD9nrxSdUSIu1L0IdpVytx6xsmgYxQXjnTP0qli0QEmnt
         aNvFDuUtChJuRWdtRujnB+mUpyMupaN5ZqZExKF5SsCc/2EAu1lauTwVMBnMH37BHPSC
         DSaO8qSnT8f0CMU2s+BQzdhKa1x0U/j6pvVxca7bnSKJ2aERcxAlLIkzHzoiRHP4l3ot
         mNCwxtJ6aOWYD87pVCBKgrYY1uK4ZcdTW7M0Zxpd3LSdWUW2qKvSUYgbHWTz70uTSyid
         4ZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1675976163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOusLYeotCf0bv0x/jrUMaNaElkCG8OoiqDIpUwIrnU=;
        b=xCOdV/Oa6mWLkAcqLtx7ow0DfCHWv8b4xGBOCvkZnkNDqXqYz8RxZFca5hi0EGxgIW
         7HIOmQz1w8fRNkgJXsZ81DoFFygxlFyJawhRXMInuj/Mo0xUeVcI6nbgzfA9znId1jqZ
         z1RY9OCuF6tnEt36ZXyFN+I0mki83uDZMC/9lXQRDslz476OpCN/VXKfGp5hBJxOPb2a
         w+aQzjGlDjs34XERkhFDJktz0wVs+STlpyTZRfPDaIFDJ/05UFo58+7jQGOQh9c6v3rs
         2ze2RgPMBK3HyNThmmxgCXFKKVXkqbWXDgnyRHr123AukG2r/j6sZKTdQU66Qm4Vtjya
         iJLg==
X-Gm-Message-State: AO0yUKV+ySovuscC6x1OlxrW/LQ0AN9/1czH6NaR3s2BQGM05bh3sNGO
	ghegc2bTdGith7mh4r+PGQs6t5OCs4A=
X-Google-Smtp-Source: AK7set9VpPuDMdXMLHAcar2cIhNwvkNOHgvskR87DyUqQsP8ZWsoQ8A04DXs0fEm41zlmKWOLHanMw==
X-Received: by 2002:a05:6808:1293:b0:361:141b:dc2a with SMTP id a19-20020a056808129300b00361141bdc2amr7209091oiw.3.1675976163316;
        Thu, 09 Feb 2023 12:56:03 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4b69:41f3:ffc7:9a38:3654])
        by smtp.gmail.com with ESMTPSA id y9-20020acae109000000b0037b6f5d6309sm1381404oig.2.2023.02.09.12.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 12:56:02 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] spice-gtk: Update to version 0.42
Date: Thu,  9 Feb 2023 17:55:52 -0300
Message-Id: <20230209205552.1582677-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Feb 2023 20:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101010

From: Fabio Estevam <festevam@denx.de>

Update to version 0.42:

v0.42
=====

- !115 - Fix compilation on win32 with EGL
- !114 - spice-widget: fix hotspot position on Wayland/HiDPI
- !112 - meson: Allow building on a Wayland-only environment
- !110 - usb-backend: Fix devices not being enumerated
- !108 - spicy: Add keyboard shortcuts for copy/paste sync
- Require meson >= 0.56

The original recipe name was spice-gtk_0.4.1.bb, but the spice-gtk
repo tags the releases as 0.41, not 0.4.1, so update it accordingly.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../spice/{spice-gtk_0.4.1.bb => spice-gtk_0.42.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/spice/{spice-gtk_0.4.1.bb => spice-gtk_0.42.bb} (96%)

diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.4.1.bb b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
similarity index 96%
rename from meta-networking/recipes-support/spice/spice-gtk_0.4.1.bb
rename to meta-networking/recipes-support/spice/spice-gtk_0.42.bb
index 44b42a331..2d1b64967 100644
--- a/meta-networking/recipes-support/spice/spice-gtk_0.4.1.bb
+++ b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = " \
 	file://subprojects/keycodemapdb/LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 "
 
-SRCREV = "74e673d7c3d9cd281d85c691fbc520107066da01"
+SRCREV = "f04479c16f0969fb394ebe74b6eff74e560a42f0"
 
 SRC_URI = "gitsm://gitlab.freedesktop.org/spice/spice-gtk.git;protocol=https;branch=master"
 
-- 
2.25.1


