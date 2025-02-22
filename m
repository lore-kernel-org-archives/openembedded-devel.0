Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 875FDC021B2
	for <webhook@archiver.kernel.org>; Sat, 22 Feb 2025 21:15:55 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.54690.1740258945227312135
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Feb 2025 13:15:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ay5ARW+e;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38f325dd9e6so1662163f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Feb 2025 13:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740258943; x=1740863743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ushhl+OpAhxylXzxTBDma8h6hcbVliX6YoZCrKwObRI=;
        b=Ay5ARW+etYkTDj9Lh3Gpkiv8ACXwfNNetODIs9t8Q18JIJ3AfrY/C7HqFDub+4DWXn
         ZALI0bQAE9gb6wOyJZNPrI7Xn8GldAwZjbEiL99SR+dqL9/rMyTvanXKiDzWLIJ6PTl8
         Go8r3N8UEyz0aggkTFXifk5sXy3WwYZiazZbCeF2pjGPs1XRNbB2DTtMLnUbYvr5Qppe
         DiKlWFZuzvHuK1SzKNct4DwBWBiSBR5ggJsVEYaSF20tJfyQ14nIMXN/g8SVJiAjDsYL
         CS7Tgbx3EzI+pYV/5efqOyKYf6ctDuITO9Ru5prJSo3rEbL0OdDfDvDU0d5+UqEOsdEt
         4VTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740258943; x=1740863743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ushhl+OpAhxylXzxTBDma8h6hcbVliX6YoZCrKwObRI=;
        b=dGF2IAYfbbempExh87QIFgIocZDc68BnWT1579G1PRcyihMkN/LhyUYMG9EyqJpuRZ
         YG15lgzlMX90Ms/u17iQX/+DU9RMK2jjxvXQ5Igjx1WQYY/HAncRPVb2bWN7h0NGPtl+
         LEy832dvEYDbTqe8RW3dOXps951xNWD+3EKImunaDLARbUnzhsTf2GwgnQkQE3t6tGPO
         Mr3ThnUPltKiwCOY4EkOYeOh0ffyRm438Aejqx68V4FLHH1qit/volcyN7DOCMnll5kq
         ywvTDRYTQGeqex7HuOYEflPUnpSYpiKmdKLcmLERY0jRY2jH7/MlUzddCcpKFuzxX7kC
         KSkw==
X-Gm-Message-State: AOJu0Yw+sNBMeJM/FDY3xCuYwXkdnR36DVslxD55Frlf8eFlrqdmPufL
	0Lec59oOZxNQrTUTOQ1yRXDT6vL5PjftXaeSbM0ebtBNNMrR8ys6ZGPG2g==
X-Gm-Gg: ASbGncsLuUWCYZVMXvNQAwoqoe4zI83HAeU8BeFsO9ONMKhLqrj1lRWyXe4Erh6KsR5
	A+NQfTU0+flxmfGJtt8ii8tdkOCvFPyE/+befuD+kEEPGB2vO5RS0r9O04JA7rjCGCrsR8Ab9Cd
	lGd7i8U7wbnyjuOZsjwm0pcB2JFfAhL8pz1YTM4Q2g3pq4IaxY/fy1ZfRwq6wJWGkPyMxhGLAdy
	EM5/55RBECScEQxyszUfKgZj+MTikPUx/35p2cmbIsn2i2oKZA0rPna2UAj1PbMV/4aYHhZa7Kz
	FrETHdEthBs1T3/K2/TyAYBCZoB4IKD5OLPytSvpPD8MpfR7rB/4
X-Google-Smtp-Source: AGHT+IHwiQMbwPMRGgY0bfhwe8hAlbDkTPl2hFuHsDsleAOTEiPQ4jjMyj2g2V14MJ+tSNOjTdtcbw==
X-Received: by 2002:a05:6000:1ac7:b0:38f:48ee:ddc2 with SMTP id ffacd0b85a97d-38f6f0b238amr5345032f8f.37.1740258943342;
        Sat, 22 Feb 2025 13:15:43 -0800 (PST)
Received: from swi-bsandu-l1.corp.ad.wrs.com ([5.13.133.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b434fsm27588231f8f.16.2025.02.22.13.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 13:15:42 -0800 (PST)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-oe][PATCH] rasdaemon: upgrade 0.8.0 -> 0.8.2
Date: Sat, 22 Feb 2025 23:10:35 +0200
Message-Id: <20250222211035.405019-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Feb 2025 21:15:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115542

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 .../rasdaemon/{rasdaemon_0.8.0.bb => rasdaemon_0.8.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/{rasdaemon_0.8.0.bb => rasdaemon_0.8.2.bb} (94%)

diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.0.bb b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.2.bb
similarity index 94%
rename from meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.0.bb
rename to meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.2.bb
index a7a3bf12c5..333d75a4f5 100644
--- a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.0.bb
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.2.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Tools to provide a way to get Platform Reliability, Availability and Serviceability (RAS) reports made via the Kernel tracing events"
-HOMEPAGE = "http://git.infradead.org/users/mchehab/rasdaemon.git"
+HOMEPAGE = "https://github.com/mchehab/rasdaemon"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d3070efe0afa3dc41608bd82c00bb0dc"
 
@@ -7,7 +7,7 @@ SRC_URI = "git://github.com/mchehab/rasdaemon.git;branch=master;protocol=https \
            file://rasdaemon.service \
            file://init"
 
-SRCREV = "4e83b848e7961af25028f3a2cecf37a63279a2bf"
+SRCREV = "e6cc13e37a17843a2a82313928cd6deed9918649"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.5


