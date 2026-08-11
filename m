Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B793EC5AD55
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 05:37:58 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48003.1786426671520671199
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 22:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UsjvPwsh;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e041ea211so3094483a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 22:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786426671; x=1787031471; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OizkEUiCLO/kFhM9sUvzxIJ6ECRfDZuPj8xQ9SNpzkg=;
        b=UsjvPwshBH2fL2p7QtfwRkUHcv1s7HZtSSBLNnbNpop+LyBSS61J4QVRVA/jrsVNhV
         7s3mTngrp0pjMuxdSNfk4ZCN5+KS36leQfMYj/Y/ILi1CqDXFJ7sOSoki+DVWHTBg7+3
         mfc4gZJt7pd/or8rlzac/yvlcjsNrevqaKy2eWL/3Jlf66ojEBG6TJKAVPilLwTb6TQU
         SrzhrrusipRfw3aBOY9j5Asb/Dkj/V6tweS/7b7QLzw+XGIAGV4N640BDICct6xmv205
         VinxFh29BO+XLd5tTFj8XO448VJUomZmTqlS7fun5oifapcPpjntTRofbbuv6+C+nOne
         Jvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786426671; x=1787031471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OizkEUiCLO/kFhM9sUvzxIJ6ECRfDZuPj8xQ9SNpzkg=;
        b=V6QxFs7d230RpUzSHkrbJ1pE6Zzea12Zbc5cBX3S75jrFLKU9Mj7awiHA9Mz0Lz7bB
         br1Hg5YEhXmkvQD43gMwtk1OXcmbHOsjIH2XCR8b2LlSC8UciE2G9M+cWhUmA84ICNvz
         gXObvef8IkL6kWbXPLxKqdEkNjztLT2cdNYcP8e9iR8oF3o5TGiFT6WOKnjsM28e97M/
         fT9nR16o7/y6v6ODlZHdoTa8QKyxH/BQvRpwkxAQQoCK1iMDQDmEHSpFOGAYH6tZbrW/
         TLwxbUmM+7NjThePKzhM+P9Ogpbn5x2ctgHrOOUByFFod1Qa1yV1l7O72DmqXZcMfHXJ
         iE0g==
X-Gm-Message-State: AOJu0YxQ++49sbVj22tW7VL8dHpQP8oxoOpXMWmV1LEpwngFHybNBC+d
	ESNLqfdiERyhq19qpZsUnqrls2ObX+QCdqdgMkmPsN8V8wh2OR1UV3LkQTNFCu8n
X-Gm-Gg: AR+sD13ttwz8xLGU5QX6q+Hoexy5AuX7w8tEfiFtn/ngh0zY5AtzPeU/XJM+E7mvYoK
	pX1h6QX+nlr824w9s+zRgQnvfT7kTpDVzZwQUxIWY+RvF9A54xrU5VLcQIjwbOhPCr66nrZm9px
	Nxk/mRPUeG+8noX5uR7xfgoVkOSINUNAK9IbzOBM4DiygAJiCAGpzDVZzZzJ1xU8SOerOINm1px
	zx5TzdNF1ajHmnzkzvIKX0yZ3aRzq3armsn7bDAmUNLJ/Hx0rtMRK/pRZ5KvCUZrEHqOAxbo6A0
	m+gwnJcw9fQwQ6qwO71BVvWdhsxsmEEy3s4eJHh6CBIpHxrIdhcJ3IwPwR7mezrwiFFWYqehElb
	XzLKvZxJowNpTApMXV+75Nc38C0Xnx7T0LFUJESTRNR/xvprbP8j/rtJA6bGyYzE1ZJx5noihFL
	+vpGkjN/ajN59I+/ds6S+aZsHfThrrufb3jyfe10CGake2Aw8YY43OuwzUSwdUxkWDMt+7uTz2Y
	g==
X-Received: by 2002:a17:90b:5608:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-392ec184a5amr964309a91.0.1786426670857;
        Mon, 10 Aug 2026 22:37:50 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c64237e9csm923812eec.18.2026.08.10.22.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 22:37:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 5/6] libcec: upgrade 8.1.3 -> 8.1.6
Date: Tue, 11 Aug 2026 17:37:27 +1200
Message-ID: <20260811053728.4125303-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811053728.4125303-1-ankur.tyagi85@gmail.com>
References: <20260811053728.4125303-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 05:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128913

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/Pulse-Eight/libcec/releases/tag/libcec-8.1.4
https://github.com/Pulse-Eight/libcec/releases/tag/libcec-8.1.5
https://github.com/Pulse-Eight/libcec/releases/tag/libcec-8.1.6

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libcec/{libcec_8.1.3.bb => libcec_8.1.6.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libcec/{libcec_8.1.3.bb => libcec_8.1.6.bb} (96%)

diff --git a/meta-oe/recipes-extended/libcec/libcec_8.1.3.bb b/meta-oe/recipes-extended/libcec/libcec_8.1.6.bb
similarity index 96%
rename from meta-oe/recipes-extended/libcec/libcec_8.1.3.bb
rename to meta-oe/recipes-extended/libcec/libcec_8.1.6.bb
index dd118753cd..c8b98d620f 100644
--- a/meta-oe/recipes-extended/libcec/libcec_8.1.3.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_8.1.6.bb
@@ -9,7 +9,7 @@ DEPENDS = "p8platform udev ncurses swig-native python3"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11 libxrandr', '', d)}"
 DEPENDS:append:rpi = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', ' userland', d)}"
 
-SRCREV = "bfc6a5fe0425d09f02e282f676113cc3150c118f"
+SRCREV = "19eaa50afe5407f02c5dede0298d092bc47d3162"
 SRC_URI = "git://github.com/Pulse-Eight/libcec.git;branch=release;protocol=https;tag=${BPN}-${PV} \
            file://0001-Enhance-reproducibility.patch \
           "

