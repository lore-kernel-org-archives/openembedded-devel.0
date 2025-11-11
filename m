Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66462CD13D2
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 09:38:17 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13811.1762853889993930264
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Nov 2025 01:38:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nRxQETmx;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b679450ecb6so3238052a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 01:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762853889; x=1763458689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymxMQtp7JRxeSfPpQ4FbvHhApjSOvY2+VV+JYKoQhH0=;
        b=nRxQETmxADjjP16XLTCN7IhNIOKJEJy2Crb4AY/KVVPmRmfx7V2PyoMsTBaFk65YV8
         Xyolg8unQo+yEW+xNuKDprVJFCubayLi8Ze1WssYYmDEll6kF/hTQzPpI7DV9mwpNCQW
         NB9KfTJFI5CSM8coHKGoFdrrh3U02MRWs7DF6eZx3gJmLJ7xLHOaeHlyaXSYwu9rEWFC
         //VBNHjmI38PNIenvl1BqqACqvv2r6V4Px+rTaxbMCVej4p1dok1L6eZ544Ko0sCXygL
         Ko81qrm5d+9GDso85mhuYa/ELec2jTCKVoQTXyjixeBqUX3kWGziBiRux+qqjLm9R/Vb
         Mcmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853889; x=1763458689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ymxMQtp7JRxeSfPpQ4FbvHhApjSOvY2+VV+JYKoQhH0=;
        b=S2uJqxXsLFH4o4tSLasMG/WkNYGF4rRYmzPlwNJ+3FKI27/ZvhP2dh4kf9sIaJsT/3
         3NNkYc8Mtbs/g6b/OI8TGOGNFH5GZNbZStzND7/gjDj6mDsJ3Jgv8pHf0SRKSI5VVSMT
         V7xnWHUxDtoh4umjlYZxMddNn8YjQ2YoVnr63qw0rCP7VYCXUUGf3Qy3EtbGhbx29UON
         QvmORP0rszvHWaUKLIXGpk30ngTFwzujXreAytctdA8Emw0ZqBH0wBuOnOspsP4dGAgU
         fxUqS2Kt/TZ1higa+l8GiYXcd557TSkzOkN1g9AqK50k8MxeZDzyKf69M8uR67U6YnMx
         DdZA==
X-Gm-Message-State: AOJu0YzeLQj4UcSPDn9NEG4nBt4ONKTE16vSHKH1TqGPCL9p8QUnjTJ/
	Vah/Xmq7QdGHE1kMKft3T+oooIrLc9eN+pyWveIqHCcXxGmfeH9vRV4b3fbZT3HNZmY=
X-Gm-Gg: ASbGnctNHmvSMdgt8p/oeOhWEMJH/vAsQ3OG8r/CHswlg2WOTMrR7FWUph9rK/6yV3j
	EdZ/Rut1L7877SqihalEVVwDkLSpn4kptkgTVFcnRRQuS6j2eizh03rdxOxH3mKuxwOnmAsF/vM
	33GFUt6sYxJv5Co4mCSAqhilLoHScLY8ck7PIPBtu29GnfMhIPGI1cum63L24PicteGpce2b5X3
	GROAS45iZWBRkSLtDPQ+GjHlgbSt2VeKlTqUKW9TMSzzNaImsxrYdqKXUINPELOcAxyFda8HaDJ
	4Wxy9XcI9FGZ8iGOAxcBN1oYy8NtRvDiMCkF1Zv8xeXuuPdOnZsZqNcXarLrUx4wDGHcXZmc7dl
	VXG5fxjyLe1sugNJCyMnt7uB2pSgCX4iGFzwERZDLJJoyLUO51Yg6/+JpZP0kAEkwZ3dkX6iZ9Q
	VxKMw5W8XSR7XIRJ5FXDWGIyVZ
X-Google-Smtp-Source: AGHT+IFDKWYYe4WVUkrqMQsGhxpXOYDklAy+8RGFr06/bXMcBoijiQzbnQlWmFtepLdcaJBZrmhhlw==
X-Received: by 2002:a17:902:fc8f:b0:295:290d:4afa with SMTP id d9443c01a7336-297e563d4a6mr138803135ad.23.1762853889140;
        Tue, 11 Nov 2025 01:38:09 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm173611505ad.23.2025.11.11.01.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:38:08 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Chaitanya Vadrevu <chaitanya.vadrevu@emerson.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 11/18] samba: Run populate-volatile.sh update in postinst
Date: Tue, 11 Nov 2025 22:37:26 +1300
Message-ID: <20251111093733.1393568-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
References: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 09:38:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121514

From: Chaitanya Vadrevu <chaitanya.vadrevu@emerson.com>

samba-common installs a volatiles configuration file but had not been
calling populate-volatile.sh to apply the configuration. This causes
samba installation to fail on a running target due to missing
directories.

Call "populate-volatile.sh update" in samba-common's postinst which
creates the required directories and enables samba to work.

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@emerson.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9fd087d29861383ef5b2261a97c220bd895c3142)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.19.9.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb b/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
index 30b7ea5a1f..d50d9f5155 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
@@ -353,4 +353,10 @@ RDEPENDS:${PN}-test = "\
     ${PN}-testsuite \
     "
 
+pkg_postinst:${PN}-common() {
+    if [ -z "$D" ] && [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
+        ${sysconfdir}/init.d/populate-volatile.sh update
+    fi
+}
+
 ALLOW_EMPTY:${PN}-test = "1"

