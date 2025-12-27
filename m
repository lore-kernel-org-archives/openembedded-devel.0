Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DB6E9270E
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 11:38:17 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6479.1766835491815805239
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Dec 2025 03:38:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ek7HBpNj;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so6101301f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Dec 2025 03:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766835490; x=1767440290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=io1TVn0NY2XMceotPv9fXQppD01pUyVP8/qpnxOihKw=;
        b=ek7HBpNj13TfJZkozrKgfqzYsoSjyUFaXWRwCQqrcb/OG7GoZPpYadCGcsr8agqx/s
         OF1hc6k/Ug5m5N7H1Q18lgQIIrbhTOjMMzar+AzIhBZxTgGJ6znjR2d/J8OVm0mvsLT4
         ABMEb94enyFG91rygvl7xA+PRxT4r20B36WRsjEkzyKb06p5HMXrlTEAY8HXtLO7Ds3C
         iRRERvdwzJHEqinGzEiDiL2CDCoHjGd9hRl7Ju0VY430xGzEL0FSEGlrrI9dib+8ZdMw
         ZiiD9IMPnh58ZDTLI7awElVWX6r2VCBT+fuAx8qgM7so85ZUEcte3YJVmBgzGoXPfO3w
         WVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766835490; x=1767440290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=io1TVn0NY2XMceotPv9fXQppD01pUyVP8/qpnxOihKw=;
        b=N7qpx4A15qz+dexoNIeAL4SjxybL9IQZRTtfY+WyIGX+oWDxEnb10eZct69AKQH4rM
         VqgjwQh08L65197dV2DQLZ0PjGEXwf/+QHShGT3E9xOqRgPDpbxqBi3EeHFzqRJ4uywF
         SINs4u3cO6h35zJ66M17YMs4m5H2uTR0n9TVaSdMO0ciKT/2/rrFEVdDDevMAk/dtAOC
         G3EN9Ez7kv0B2hA+yJzM8+PGVP6Aa6vikx4h7oKhVSG+r4/uJvWG9R2ip6pKy02nwL2+
         ZeGQsmkxAaoT5j0+nG/xOTOTYBvueMInbtKlhtuilpLDgygDP6uSyIHGDV8JMEgGDBtL
         4k4A==
X-Gm-Message-State: AOJu0YximYZJSdDTkAULku7l20VBUZIQ+KgowcJFa83vmuEF1ncew3og
	Tczj/GSkxP/p7xwm+ZdMJi+DFVVzP7Nwg527GmvKYz+nmrLbLmKXG+6/UHgs8g==
X-Gm-Gg: AY/fxX4Yz5k3GR8dLoVOWGXAUbAX3zVnfRnZ84UjnjKn2RBucxUvnJ5xRvwVZDM2Cw3
	VJnZp+JpWd2Vjq0JFKqVGGswjtGf18GRk2t0Pmi1xldMp8pkAqsvNYqcBJF/RyQkQMtJwXZC+v7
	UW9OuZRm9mZ37/C/50U5fkVkHuHYhL4shNgGIfISwjoR8943TnQGksqwA39VA3Y8jLSLCKlUJWR
	MU5viAKgkWGdJz1ECJCDA+morruHcJtJiEDTkaw2fkG0NkOXlc2VhDip1Rc4q9V3E2Xvn0ZKtFC
	cqhvueFknYTNlNyDb+3iBIdeKp2TQOT/6LmPWKuwOWBn8oiP6JAyUC51SMOFH6zUggbnisczov3
	SAnzVixzufxKCAS/Y7ESl3HyOBBmP/9ywMFLX3H5zU1J95OfBOiveAxidNDsL9zEIXG8qR3QYIw
	9yg+fqiiVc
X-Google-Smtp-Source: AGHT+IFcnesQaCxzj94+GPbd7DeVhDI2/VeKI47Mo49QAHt6V576p6zXQqYoqEh9rjoYiXja+CrdVA==
X-Received: by 2002:a05:6000:401f:b0:430:ff81:2961 with SMTP id ffacd0b85a97d-4324e7077e1mr32849445f8f.51.1766835490008;
        Sat, 27 Dec 2025 03:38:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43277b82a58sm17023023f8f.6.2025.12.27.03.38.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 03:38:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/4] tomoyo-utils: upgrade 2.6.1-20210910 -> 2.6.1-20250707
Date: Sat, 27 Dec 2025 12:38:05 +0100
Message-ID: <20251227113808.3304770-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Dec 2025 11:38:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122950

Also update the SRC_URI, the previous one became inaccessible.

Changelog:
- Update project's website.
- /usr/lib/tomoyo/init_policy
  Remove rewrite rules handled by commit bdc35f164b0f ("tomoyo: use better
  patterns for procfs in learning mode").

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
index f172168335..2c517547af 100644
--- a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
+++ b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
@@ -5,9 +5,11 @@ being useful purely as a system analysis tool."
 HOMEPAGE = "http://tomoyo.sourceforge.jp/"
 SECTION = "System Environment/Kernel"
 
-SRC_URI = "http://jaist.dl.sourceforge.jp/tomoyo/70710/${BP}-20210910.tar.gz"
-SRC_URI[sha256sum] = "47a12cdb1fe7bbd0b2e3486150fe1e754fa9c869aeefd42fd311c4022b78010a"
+SRC_URI = "${SOURCEFORGE_MIRROR}/tomoyo/${BP}.tar.gz"
+SRC_URI[sha256sum] = "f5d1f422df0f68937245fb97c18336bcd813221955cbcdb3b1a3f65b3cae1a06"
 
+# there are periodic new releases of the same version, with this date updated
+PV .= "-20250707"
 S = "${UNPACKDIR}/${BPN}"
 
 LICENSE = "GPL-2.0-only"

