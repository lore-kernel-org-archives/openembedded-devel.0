Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29969CD37AB
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:36:02 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6302.1762976155774852983
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 11:35:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MhoYwsLU;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b2e9ac45aso32488f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 11:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762976154; x=1763580954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKwgkn+lF1z/ocbg/d8AeDgwYodY/2s2tlPPiS/Ypjg=;
        b=MhoYwsLUckFY7tAco3TiUkynBgnl7aSO/u7NL0GPYIySWQmsnv+at4AFyhw9sZfssk
         Cfqz4G9o6i3KK4sqMiZrd8XWQFUQDVVJkiz5XYoUpPIlLtynG0j49BKTON7soFjS9C3O
         B8r0xF65UNW2C/rc47KkKhTxPnVDsq+SwrJDRcLAZN4eDa4Z2BFqO6YrpkV7I/KtsF9r
         /6oNMIDR5TKfe/0ARDHCaZfwzjlVmzipJJjCDyQimfnC7EBBIm9e7uLEEISgntgvKKBo
         dbe9WwBog+iGTkUl1tJzuIFDk8s6Kj5RTqburDq1rj7FK0IKKdKCQ/uGJiKK6RYOU6Ys
         vi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976154; x=1763580954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KKwgkn+lF1z/ocbg/d8AeDgwYodY/2s2tlPPiS/Ypjg=;
        b=M1glK246xHS37dC65OZEYHL6RnOruwt7mQRWtT3jItZkE3GPbXBg3W049ZnVQt2eGX
         UvqUzk+iA8Q2fu926hv6X6wRhBT5166NC2vZAMlRM9vVgbUT+PSqvQBhQEtxjuExWhXT
         NDE3GIM4ePexxP4B8E9MRWgxVvpkJkDldlLSq2rYX0CM5193Khq16wjClTGg5Mb9v+UD
         SSeatfylNK+FOrFGzJ3vYn/xVMhRX2BGsgfOiKCgdMRS7aCZLg85H3/aZssD1Rjz+KEi
         QdEPpCFiQzOELeSj9hZ6yNYknxkkgK5zBj/IVqLMs1iqVlJ89OAu1Dd7uDKnyXfAU46w
         z4cg==
X-Gm-Message-State: AOJu0YyDrvPhWO7otcjKx1fXH9pqIx49K683NqTZuWbxbdFR023u7mo/
	WsJlHjgfn2dDD2Ce3UwWP7szmFx90GRbJDSwJRfg6PykX61MmtJg2h3uhBrnVHiq
X-Gm-Gg: ASbGncs3MxcTX8ze/GEG+9ag5I+ZKcr/6KWuh6ejEdkCwjj7njKp84r+5fkhhWnvK5+
	ZYPCmNTuGENR/npcHPS1fG3xVYtxMySdTi4ONBksYwIhI90A9aEyIdmM85rFoO/QWE9cTtEmniR
	0xyrVnvml/+lVcaeVP/jRed5FjlSWdedj+OxkPBhC7gNMNyrkH3noLqD9z6hTWI3uiDqAJAWMYa
	APvgFVdBnze31ZdarJTRBb9lxYRwZzzAK2w+p6pG81+gxCIZj3Pwj12//jlALhxANtC/sY59ONB
	qQjN6mI+yHuu1vlCwpOpauCNi/HuzGwT7FHQ7c57qRMIctJ3WSekQu4zNF25lqiMeqMuCYMizOU
	SQWnB1qFLpKrXGgK3WEz/Gp1fuvzqNT9D/4mbbqQ3bp0P905r723U3hLWsi4eWGfFzgp/LNmOWA
	==
X-Google-Smtp-Source: AGHT+IHoDg5A8YGK5c2KORk24hbyVlgOFLFNEpaR1WPjUM5xfPgCmztKtrhtcqtKm3Ti00KGxdyVig==
X-Received: by 2002:a05:6000:2506:b0:429:ba48:4d8 with SMTP id ffacd0b85a97d-42b4bb9e6e8mr3923770f8f.25.1762976154091;
        Wed, 12 Nov 2025 11:35:54 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927c9sm28723881f8f.27.2025.11.12.11.35.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:35:53 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 15/21] libvdpau: fix SRC_URI
Date: Wed, 12 Nov 2025 20:35:35 +0100
Message-ID: <20251112193542.1589821-15-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112193542.1589821-1-skandigraun@gmail.com>
References: <20251112193542.1589821-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 19:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121576

The old repository was moved to a new freedesktop gitlab instance.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0e79b3a9079a36b5c32de17b5b9a794ac2247e2c)

Removed "tag" tag from SRC_URI for Kirkstone

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb b/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
index db3c045588..3ee56b0a23 100644
--- a/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
+++ b/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=83af8811a28727a13f04132cc33b7f58"
 DEPENDS = "virtual/libx11 libxext xorgproto"
 
 SRCREV = "79f1506a3307d3275b0fdfb2e110c173f68e6f78"
-SRC_URI = "git://anongit.freedesktop.org/vdpau/libvdpau;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/vdpau/libvdpau.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 

