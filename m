Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC874CAC581
	for <webhook@archiver.kernel.org>; Sun,  7 Sep 2025 12:45:48 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.18043.1757249144505725257
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Sep 2025 05:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UAVnMwry;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b046fc9f359so673259366b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Sep 2025 05:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757249143; x=1757853943; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=I0gOPiXo2pkPhOWctU4orGifFHMof/UF6+n/NwV2kFg=;
        b=UAVnMwryik1LBoDa2eAe+Q0lLCDMhpAQDcitYoMIhDlOBcvSWXnjTWNNaCZ1Kra68s
         h2LU3vtomLyQc6roduBFegNQR+5FZ/9ju8w08Z8FMrx8fRLLUDsesXvHh3yAhQtEHtRE
         WPO8AYJDZIq8kldXvvrc91/TrUowtBWO/ZDbyf+UlCGnPkQCSrVgVupM4GcSzTRqA2+g
         syDxudgrBSuj/BzoDSV+IMokyK81I5dPhXoSV7O7uhwgSae22dO0A4ktTopKRttVgyXj
         UG6lb3dwVOCT/jdwBMrS+dq6pMA93X+zYvznKI+Z4fEnEqn01JvxLVb2WvXl92Nd8GyD
         fmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757249143; x=1757853943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0gOPiXo2pkPhOWctU4orGifFHMof/UF6+n/NwV2kFg=;
        b=h6PdPQnhP2n8Omyt93cnnNgBIvkDDDnzyClkvTdFVoGfQUVVo6bt8mZqSACUq/wQkw
         z+2Jl0Fe6GkamEoyOa/PmZiIh+uR+sxENgItECAMmAeQgIr3GIvPGcSGfzorwS8aJEVJ
         EAsNIBwYgX7g3GT1MLD9BDrG41sOEGwCFlYzTReeDcXA1eEMPgfR4+yvhv9XIZt7Za13
         +dNtwI6NFqmRmZqLLkBD/xFzpAJ5H7qqDPGb3CYxDWNhuRv7j6NvEDrEGWxjCNihrgF4
         UuWcsIdBeCPzH5rEr/p2glppZJ6+FvxByj1BC3pZxHRR451U48pa8lACuYOk+wzEC881
         7oTA==
X-Gm-Message-State: AOJu0Yzq1zDTvDan9ihuX21tXpToc3pHTySflgRYlJNvJew8lOSKLluO
	tH5rzGSSxMaVKoDCVGyr7DumRveCk1qhF/Bm84KkrTrSUChFzs/OldBxHHDPOA==
X-Gm-Gg: ASbGncsJ4q0DUwPZYYDKl7+fgtqLOHPU132fvuCYG6XQaQ5Ou8yTVi6NXLosarspAWX
	sv/VO4ai6uQr5E//tF7ryBpNBw4BoUzlvd6BQ2alfjvsvP5WisrK3/tcfOAawxG8ZazWSJ1pfpE
	aiZRTn+7k+xiMRO9DpHcdwQ+tmG61E/CYkc1dIpCnuO5obOil9iVxo5F6FTOseJcrQy0QI/fCLc
	3pF3DtySYBwlQZMZW5qekiCffb3yPv8aPqxovP9gORhyrFDEDkARhq0q9iYh3D+0pX6lQA2toWi
	kDOecPoCMfu4WX66C7gwWAu6Fg7vAc4Wu3T/iGMP3E6yWPH6f42xgLWQ8qubNW2nNNJzbofi+H/
	cmDoUwO6yB3tIoSZIeg35VrZB8vH7H0U=
X-Google-Smtp-Source: AGHT+IFAd0ytJn3HnzVJnEWe3c4AZmGCWwTJIsLU5SZK1fBlS2mB0H+yF2Ss+XwVcd3jOafRxt/9tw==
X-Received: by 2002:a17:906:6a0c:b0:afe:ea93:ddbb with SMTP id a640c23a62f3a-b04b167cfe1mr384247466b.45.1757249142569;
        Sun, 07 Sep 2025 05:45:42 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b043d6c2f6asm1517685466b.62.2025.09.07.05.45.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 05:45:42 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH] gtkwave: Add libtirpc to depends
Date: Sun,  7 Sep 2025 14:45:41 +0200
Message-ID: <20250907124541.1067493-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Sep 2025 12:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119329

From: Khem Raj <raj.khem@gmail.com>

It was missing as the recipe is using --with-tirpc

Signed-off-by: Khem Raj <raj.khem@gmail.com>

Adapted for Walnascar
Signed-off-by: Gyorgy Sarvari <gyorgy.sarvari@gmail.com>
---
 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.121.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.121.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.121.bb
index 3f94933e6a..55cfc4f353 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.121.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.121.bb
@@ -13,6 +13,7 @@ DEPENDS = " \
     gperf-native \
     gtk+3 \
     gdk-pixbuf \
+    libtirpc \
     tcl \
     tk \
     bzip2 \

