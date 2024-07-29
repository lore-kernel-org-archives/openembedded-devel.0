Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860BEC3DA7F
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 17:09:40 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.61522.1722272977072841180
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jul 2024 10:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SRLZED8N;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42817bee9e8so15965955e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 10:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722272975; x=1722877775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPSOM/YvTJuSDfSbSXF7tCjvodfcmAB9yXNlJsrpLCw=;
        b=SRLZED8NjPZA34g1Nk7l21XGs+tAT+KWkVOjDbG4SKVtK7d8Xrtl4AR6yCjrU38yTZ
         wKGVrkBd8QCFUOKiM5i2GauIJNdFxc4xvkOF70wEioVgqXxLZmwHIYbLA5+f4HkXTzgW
         AUpZpT7ae8B10HMkXXA0d9EWHn6d7uHtgSLRnVVZ41CJXX6VoRaQdqretEfMe+NYeIgI
         WTxCqL8NvRoDFJhVb5jwKCC4gQxa/6RglnfUX9Z1LRbgXFJDgg9Ij6CjTB8U6pWwSzgB
         sX8OFFLOrJzOmQvAkhQ81SIrL3Fu4VRJ79rESLBUjf6qcPkeiZ5sjZmMMO81YsBEhiAB
         PknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722272975; x=1722877775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPSOM/YvTJuSDfSbSXF7tCjvodfcmAB9yXNlJsrpLCw=;
        b=mXDsQOXhlIAnYIAfbcr5iIT6wvuGva0vusdZqAV1wovyr5l0Hsm8JHWgpuFTlw2Vq2
         jeuq1X+iCmLfb/XwiP3oz7poS6I7H2Rk0K7XSURNQ//eUcAo5AUZkGJT4iPIaWnFo5bC
         ccK4p+Mdr6TbAESnCQ+DGNnuS4iQ0GDrWqSKGYefd+C8hj00/Zizx+TLg916KOSP4hIh
         KA2EABH3GOweKbRhLuCA/ZVDtiLN30OiL4GOkyyQB4BG07jXseIsbGFnrDXEaNlFSf6Q
         fTpEPS3DuZCKspGVbVv9yLB/tZpdZ/9vF1ZJtjzOXikCMh3RSZyZjYygf4IztKlt4xCj
         aXjQ==
X-Gm-Message-State: AOJu0Yx6hgLth97p/mAV+gzhXZHV7K/7PTCkZsuHZRgDu47qus9ZqbIW
	s+SNGPJyTNkdCLRP+EzpApLbraOAAj4IkBtpRRYlnccDTNioueZztK82iQ==
X-Google-Smtp-Source: AGHT+IFxVEXiER750oiinrxik394LFgnz8AK+B/FP6BriEY14+M0hmHMYsJKoMgSY9H/+Y7VoWmFPA==
X-Received: by 2002:a05:600c:1c05:b0:426:62c5:4741 with SMTP id 5b1f17b1804b1-42811d6dbf0mr56660135e9.2.1722272975312;
        Mon, 29 Jul 2024 10:09:35 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4280fa9a30csm115340725e9.30.2024.07.29.10.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 10:09:34 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>,
	Khem Raj <raj.khem@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 7/7] composefs: the srcrev hash was the release tag
Date: Mon, 29 Jul 2024 18:09:10 +0100
Message-ID: <20240729170910.2670446-7-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729170910.2670446-1-jose.quaresma@foundries.io>
References: <20240729170910.2670446-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 17:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111471

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 71fda358450c2d2f4a7be00e72a7563a12ec9d3d)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-oe/recipes-support/composefs/composefs_1.0.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/composefs/composefs_1.0.4.bb b/meta-oe/recipes-support/composefs/composefs_1.0.4.bb
index aaf33b40e..7b934e4ea 100644
--- a/meta-oe/recipes-support/composefs/composefs_1.0.4.bb
+++ b/meta-oe/recipes-support/composefs/composefs_1.0.4.bb
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM = "\
     file://LICENSE.Apache-2.0;md5=3b83ef96387f14655fc854ddc3c6bd57 \
 "
 
-PV .= "+git${SRCPV}"
 SRCREV = "7623e4dc89f62ada5724d4e41d0a16d2671312f5"
 SRC_URI = "git://github.com/containers/composefs.git;protocol=https;branch=main"
 
-- 
2.45.2


