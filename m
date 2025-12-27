Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8529E8FDD0
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 06:56:45 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4538.1766818605013845211
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Dec 2025 22:56:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l1Sgb49U;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42e2ba54a6fso3315381f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 22:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766818603; x=1767423403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6babLmB0EWhsYzXag+cwMpKxm9HXllTcGzeo8yDotM=;
        b=l1Sgb49UuYatM/M5Dg4MKLy+mozuVTf+PxIOD1EKxlQnYcJDKwBxghdP3FfKjlNmNS
         DlG4xJy3v4I94adzRdvDdN88M3AqPGRavplDdmgH90l0DzwHMOsuzu/vBLhYOHOHhlG7
         cITBWw+HCLlWe4oTh2tMeaCj3ivogss83uAquFWXuIfynDg3rqGImCIh4UhpDNNUXloJ
         gHdD7OLtfe4ZDglVmkBQ3QADBtv8oWjuYgXcaQbru2jKs2gdPiWoTDYGQbr/XQ0+HQo5
         XMSEG+BQgdFnAM3/GfW9uOUiwilM62LfFSAe1bquFKRtyfDqjmFPqup1t/VNn54tBj6l
         O77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766818603; x=1767423403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F6babLmB0EWhsYzXag+cwMpKxm9HXllTcGzeo8yDotM=;
        b=jwofaR8nEkWHfWD46C0Spt+lvoh0fZkPa42dJwhK9hrCwh7lLEammQWbF57M0ENFjc
         QH/xFDIs/HbAV5tLL8L6KYNHoDnGSolkA3WoQ4T/IFdSdMeeUVF10T5edloCLmuxfPaM
         m+4D+FJC7Ehnv78SiLfWj2wGzaPOu7QCuYcJy2WTfjmDjFBE6tConexbxYX/dFZtlSC0
         PMQCuadQ5yZZe+p7QotnFtJTQy/pGvihDBWhrLyqgtZE82uebY/agpZ1w/Kx5Qqr8lRj
         PSVq0f4MpVfYnvV54XaJbDU5zSobwIgupbFXr8BzrXbEYs+dwtRZtoe+oBnUCik+z68u
         9vDg==
X-Gm-Message-State: AOJu0YwL6/+H1/A/bmLchgF4obGWHVx6ZKdYXnbFPQUVI7TaUt9j3VY4
	ZFAHdiQmahW+p6gO7omupK+g6hJWHZSaO8hTTjYyqHfsEjIpSZH2Ju0lbnxFPA==
X-Gm-Gg: AY/fxX4pN5msNHoZb3Dd1raaeA4jtM+UnILsC0fcVrgyZQKXiRTrxXBNozD+g46ApgM
	pS6i4DiXvkf4XHtPZfMU2+siT6B3MICOrr+6mvIg7+W8PiHzy/p6xY7E4iB//05BykcI8H8n2P8
	tfVTIT2zqbTv6whYXnwEinpNBCtfI4aJ6dnm3aFb4XvZRwVEXFv1hAaPHANpOEy9/KLljgjfw9r
	O6tJg+1i1KmvLg81r92UEUKgFdeDxdVmzSHqUaBZUHL9FOuIwHV8jE/750puFwxDsK3WsSQS9Ge
	v0Rllpke3+DfS/+HY9DEq0pLyhJPVWHT5TyjMWtARA5oSvk7e08QWXfvKSMLePmPBFduaWIqVyJ
	0LvCJe46J1zpFjQkoVYPfz4IksRyvqJihzy7xZoh/Sf97wTJ1XzI4U+OlHcMYEjROaD1qHIPwWT
	EDqjn1ldEp
X-Google-Smtp-Source: AGHT+IFkS+Al/a4VQWRAC4tyQNjCGmWoJy3YRROTiV9wF5co0pOwjoUVON9oqfJhYzXQkYOJ+BIZfg==
X-Received: by 2002:a05:6000:288c:b0:3ec:db87:e5f4 with SMTP id ffacd0b85a97d-4324e4c1285mr28659854f8f.7.1766818603310;
        Fri, 26 Dec 2025 22:56:43 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa0908sm48902371f8f.31.2025.12.26.22.56.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 22:56:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 5/6] libowfat: update SRC_URI
Date: Sat, 27 Dec 2025 07:56:35 +0100
Message-ID: <20251227065636.3144581-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251227065636.3144581-1-skandigraun@gmail.com>
References: <20251227065636.3144581-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Dec 2025 06:56:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122948

The https link does not work anymore, it just refuses the connection.
http still works though.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/ncp/libowfat_0.32.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ncp/libowfat_0.32.bb b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
index cc67d9aefa..2f00da34c5 100644
--- a/meta-networking/recipes-support/ncp/libowfat_0.32.bb
+++ b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.fefe.de/libowfat"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-SRC_URI = "https://www.fefe.de/${BPN}/${BP}.tar.xz \
+SRC_URI = "http://www.fefe.de/${BPN}/${BP}.tar.xz \
            file://0001-Depend-on-haveuint128.h-for-umult64.c.patch \
            file://0001-replace-__pure__-with-compiler-attribute-pure.patch \
            file://0001-fix-incompatible-type-error-with-gcc-15.patch \

