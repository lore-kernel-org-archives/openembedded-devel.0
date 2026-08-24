Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B16C5DF9C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 19:57:33 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6161.1787601444309325353
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2026 12:57:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WmmpTSRU;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1712a04ddaso664705066b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2026 12:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787601442; x=1788206242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7FqIuI9N17vYUVJMLFs1Sfh4bEQMN5W/wia5PslGH24=;
        b=WmmpTSRUvH6W20RB50+dcyidPPe9xA21VMiBKVX+QcbO+X1s2f5HtVFxUuIWL0E97c
         OUZnC+wpENaRyRM3Dl7BflJWyR9Y6wP83x1z92BszotfN5Pgs74cYJ5BWlVnorPi80q+
         +wdzfU3jfA7Mgfp8vepFSUua5O4pZZdoCGyzJ9de9CcXWo9/EE0ZpbDA+JpmZTBef/8i
         rglsixYXT62K3758oKYROsIRd4qP2y14lu4T6P4qb9eMN+1i/mc62qRVRoHnyLorzgTM
         7gFdcYRnQC0ywaR3weUNn6g2oppAuRbreaZ1IJAHfCSVkFmyyFq2HLiC2HkO/AM5H/iG
         tB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601442; x=1788206242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FqIuI9N17vYUVJMLFs1Sfh4bEQMN5W/wia5PslGH24=;
        b=q4vsNrZdg/MfbsN2g1gkgAfGy5CQv6RNUQTYm+Vs+5Df5oGNV5rcJpT9pl66eOb4mn
         /SaCG7Y5fUpxD0GHASfmnzOG0ArPOl8LJJ5we8b2oGK0op6MyQ1veBbvmoe5UBx1+e5l
         SDyurS2jLaWcjziqOwAOtyavz+1e75m2jIchnInSFrFZkPGZZaxOii+TgwdItwMq6FFK
         qDBvWHim/jVykRFdQ/tkrX/3b7cvRNUv6/+2ZV2Fq6Y0V+9/Tc49LPHywwLpLMLvDUWL
         y+CEeo9w06yRYRqx21dBhV7nrdlhoy+cys6C4XU7IbTE7Rsq4+EyisbiTACUNvUGb1zA
         H1vg==
X-Gm-Message-State: AFuF++k6pzfp34KGFiqHiedLekULICgqVb16SagA5lEcHQeMWiPeZUPt
	sK/jLutrRXplM0YCL3FJ3GcFgYuc/jhc88bxUdFtoC4P3t+Cmc7CK1xyd9HWtaK4
X-Gm-Gg: AR+sD12ElVHViU/fxhVQoBgxGSx4rPFIspjtjxmLKsVhW3TJ30kEc0ThTmbLvjBER7u
	EaulGsfd4fd34jK42mmFwLH4m65yhkxTbCeJGgLPrTwI+ulvATQpNcIAvYnv/TWewJRSl9PTjI9
	HRgqScwDnwV+Hr1++xkZr4o7wAjYa/W9aCIGSE9gvfC6yBaXl54nUH2K3nQBNxvJ3Dz+QPN2AiJ
	DGsPvzLtqV8LacxFIxE/nvqU/2NKzbQKCiqI2Q2BpEWmz0dSwBQjkPXmgPy4cgOp9GDGrdJyxPG
	pJbD1vFNU1WVvvKoHiZKgK4vIu1TLGPQeNqAfHw6Lp7aHxEMovVWoSN3gqWampChZXr+i2mk9Ue
	o6DpJp7GpV2y8oR1j+RKs9I/EcZcVR4eAYA3MU8qQbu9zd/B3DB/badsAQjcS68SbUPg9pebVs4
	QYyupqk74EEoc+GFm4mYRgpZo2nJGgFA1kw0CumQNNNZwWwcX0OD9dFdhH9Cv7SP1XdbP+D3iGA
	umZjupv
X-Received: by 2002:a17:907:9495:b0:c21:49df:1650 with SMTP id a640c23a62f3a-c2491c9bae2mr1752358166b.8.1787601441993;
        Mon, 24 Aug 2026 12:57:21 -0700 (PDT)
Received: from dld58y9k4-lin.dl.net ([2a02:b025:14:bc0e:acf8:87ca:abc3:f222])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e0126edsm10969445a12.7.2026.08.24.12.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 12:57:20 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <locutusofborg@debian.org>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] vboxguestdrivers: Upgrade to 7.2.16
Date: Mon, 24 Aug 2026 21:57:16 +0200
Message-ID: <20260824195716.3105925-1-locutusofborg@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2026 19:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129466

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
---
 .../{vboxguestdrivers_7.2.14.bb => vboxguestdrivers_7.2.16.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.2.14.bb => vboxguestdrivers_7.2.16.bb} (98%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.16.bb
similarity index 98%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.16.bb
index 952eca1a06..f12270680c 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.14.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.16.bb
@@ -24,7 +24,7 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://Makefile.utils \
     file://0001-vboxvideo-let-the-build-decide-if-drm_fb_helper_alloc.patch \
 "
-SRC_URI[sha256sum] = "384f293184c52fd51bc941c17d753b4019446f53a6b07c828adfb3e61fe0a500"
+SRC_URI[sha256sum] = "50356ccdaefe8f03537600ec31898b506e3a85ce79b94f26fb6cc1920c9e18eb"
 
 S ?= "${UNPACKDIR}/vbox_module"
 S:task-unpack = "${UNPACKDIR}/${VBOX_NAME}"
-- 
2.43.0


