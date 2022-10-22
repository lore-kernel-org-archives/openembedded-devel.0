Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F44CC04A95
	for <webhook@archiver.kernel.org>; Sat, 22 Oct 2022 09:17:34 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.4830.1666430243609677675
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Oct 2022 02:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MxWDV/Ne;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id bu30so8345847wrb.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Oct 2022 02:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tkfsVB+FFcu4W3l612orSIteWIk+57LmypOVzvb30gQ=;
        b=MxWDV/NethlLUFNi8slujDpbcdmtc6mdhGI3ZLN6gFSIhlNaa1OVA5bsgTSGlaDiDb
         C07+vyx6e5OEHYZZmhSj5maNN9j8b5LiWqsH35sWX/E5z5rrsYJmH9lKo9ZPDV7BZttI
         tzQ1bluRenKAVp5OtQNCH+ermGS/yVhrJKx4ZAYgQRGtIx1rnrNXg4LWFOI72wjhCaqy
         Z5pR0nPbSBUZohSYQwUayleUSwkav9gNS1GngN7rqpj/K/OGqT2MYbLYZ3IHFt5vUPrY
         uWeqkSHAwwwm66DQRWkymiZaUkP6Tyb7GD+Ku/cTePKbgTXFhsuRYMeYXir6lp/tt79B
         qN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tkfsVB+FFcu4W3l612orSIteWIk+57LmypOVzvb30gQ=;
        b=Fk2iD2xAQpc2w2lHB51mS1coxJcIafU33TKxccat+JVHI/qbbqF3gcK7TIxUW0ljOF
         4tJxxFUV9QuBo0XjN1Bf67KLIukgIhMij4U+PsHLxR4BYm+nPJ+waeVC5LJcNaCppSZ7
         Xs57n8Iwx0I52WfvazMwtH/GfuksOiuRoRqTXkrKh3smJNw4ntuOUacWK4eomDne/uQL
         SzBnnltD3uF1qRDGBuvL8DRCtRUrJkQdb976SP5KnQSeh71V8cG8K16OfeyI95ShDeCY
         kOC96bDYdlphdC0yeZRhDwwUtSk7aZjnmRtj3HqGGVMJlnLacyDSKnb1dfDE1cD04Vr8
         whwg==
X-Gm-Message-State: ACrzQf2nFeEmrhwwjXmFI76XaRk/e3piMTtaRcMsnsgkUEEB2qbq2NKK
	OZ1bSlgXHK9soEuV0CcbtSxOmWXi11Y=
X-Google-Smtp-Source: AMsMyM7gYTz7Q6ajgyDsQUChmtt2DyXWhL2UeTcPwANm/jtv2ihBg7yoA9Rw7iTOiJrmdEeLX6E3RQ==
X-Received: by 2002:adf:e504:0:b0:236:4882:e784 with SMTP id j4-20020adfe504000000b002364882e784mr7643085wrm.670.1666430241857;
        Sat, 22 Oct 2022 02:17:21 -0700 (PDT)
Received: from localhost.localdomain ([80.209.166.248])
        by smtp.gmail.com with ESMTPSA id s6-20020a7bc386000000b003c4ecff4e25sm5134842wmj.9.2022.10.22.02.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Oct 2022 02:17:21 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] lldpd: Upgrade 1.0.14 -> 1.0.15
Date: Sat, 22 Oct 2022 10:17:09 +0100
Message-Id: <20221022091709.9153-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Oct 2022 09:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99257

Add github-releases to make new releases discoverable.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../lldpd/{lldpd_1.0.14.bb => lldpd_1.0.15.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.14.bb => lldpd_1.0.15.bb} (95%)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.14.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.15.bb
similarity index 95%
rename from meta-networking/recipes-daemons/lldpd/lldpd_1.0.14.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_1.0.15.bb
index eda0129feb3a..6a3687cf7218 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.14.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.15.bb
@@ -11,9 +11,9 @@ SRC_URI = "\
     file://lldpd.default \
     "
 
-SRC_URI[sha256sum] = "a74819214f116a5dbc407a3d490caa01ba401a249517ac826a374059c12d12e8"
+SRC_URI[sha256sum] = "f7fe3a130be98a19c491479ef60f36b8ee41a9e6bc4d7f2c41033f63956a3126"
 
-inherit autotools update-rc.d useradd systemd pkgconfig bash-completion
+inherit autotools update-rc.d useradd systemd pkgconfig bash-completion github-releases
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system -g lldpd --shell /bin/false lldpd"
-- 
2.35.1


