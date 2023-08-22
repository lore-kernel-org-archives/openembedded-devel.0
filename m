Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF0DEE49AE
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 23:46:43 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.4783.1692699309732196665
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Aug 2023 03:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DaRpTx1Q;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: bbara93@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso3894211f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Aug 2023 03:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692699308; x=1693304108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mhIpNSh604IZkTwnV/1wJpU19m28BlOOZ60ik0dBnwU=;
        b=DaRpTx1Qtt1053hdzTLRdGdVOfY3t2BVbCaQhnzWqzyDtbp9UVvqRTalw3qGYN2grG
         NohE21feWe8e1hmDIo/vewWBcKv871djXRUVMtcEtDj3dNilw1PzlLrNsAo8A82Agg0W
         YnqkqVgwe0g6/RdVg2+cVe82mnK0h5epCNMU1RBpbdsjuCYBFyEn3EYDYfl9i3eNk4tG
         4Whfz/qAQXxxotKgPxlnmHsCdJWrDsAMVTmXjB3emIj0jD8cLR4g4YnS76KMpc6vymbs
         VRTJFl7Jkj0ONSziMYgFS8WARDvxF41XdlEuSkoqLIX/pOD6b/WY2nUsvBS7AOI9nmqK
         dxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692699308; x=1693304108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhIpNSh604IZkTwnV/1wJpU19m28BlOOZ60ik0dBnwU=;
        b=Zyg45xpJyCOMphbRUHRGr6rHbIxdSaAhM7ntSzSuiMIcGNCkHGc8ky8cOCDr7S9zAE
         ULhUXmAjnSYqtmn3ekTcXxhG9rGkwfDhjSVSqSTMwRhPnhnhyAupi291Y3RR7Zjy9cTe
         q15TfYHKlep5VBry6HuC0N/KimY0V2eTNLDhJ+VCb8dg15ZH1c+NamHJl7Mop+vTd7Up
         sdn5AGM1PozQZDuPJ82MDDdmRVLpWbfJ7AIgryBk1F/pAQdkXBMfrzyYEnmVNaOtAtaV
         /NYJM2KRSxFBzmRV7jE3CVB+6YSxz2ddVbG95VJy6KipK6m3r/6+DvBbFVpJtiOuU+MO
         cQ7Q==
X-Gm-Message-State: AOJu0YxMddFxhH5TnFMEk9ijlvktyo+TfBGQYpug51gjf07o/T/Zxte/
	HNsTczTlhqFOngHLjkBq0ng=
X-Google-Smtp-Source: AGHT+IENkbIYyFDMB8+A574U+2gkHM6QDd7r6aY6at8dX7Qw6+L9LKMo3RPEFdiaQEUnKTplU5JalQ==
X-Received: by 2002:adf:a345:0:b0:318:1535:34fb with SMTP id d5-20020adfa345000000b00318153534fbmr7311266wrb.13.1692699307770;
        Tue, 22 Aug 2023 03:15:07 -0700 (PDT)
Received: from PCBABN.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id i14-20020adfe48e000000b0031c3ee933b5sm7385648wrm.108.2023.08.22.03.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 03:15:07 -0700 (PDT)
From: "Benjamin Bara" <bbara93@gmail.com>
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: [meta-oe][PATCH] libvpx: fix VPXTARGET for non-neon armv7a
Date: Tue, 22 Aug 2023 12:14:43 +0200
Message-Id: <20230822101443.715588-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Aug 2023 23:46:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104522

From: Benjamin Bara <benjamin.bara@skidata.com>

The compiler might use non-supported instructions, as the build config
requires armv7-linux-gcc targets to have NEON[1] and drops the mtune
value[2], which also might use d32 registers on d16 cpus.

Falling back to the generic-gnu target respects the toolchain-set values
and should therefore be used instead.

[1] https://chromium.googlesource.com/webm/libvpx/+/626ff35955c2c35b806b3e0ecf551a1a8611cdbf/build/make/configure.sh#955
[2] https://chromium.googlesource.com/webm/libvpx/+/626ff35955c2c35b806b3e0ecf551a1a8611cdbf/build/make/configure.sh#973

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 meta-oe/recipes-multimedia/webm/libvpx_1.13.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.13.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.13.0.bb
index 79b330c31..558b448ba 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.13.0.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.13.0.bb
@@ -26,7 +26,7 @@ export LD = "${CC}"
 
 VPXTARGET:armv5te = "armv5te-linux-gcc"
 VPXTARGET:armv6 = "armv6-linux-gcc"
-VPXTARGET:armv7a = "armv7-linux-gcc"
+VPXTARGET:armv7a = "${@bb.utils.contains("TUNE_FEATURES","neon","armv7-linux-gcc","generic-gnu",d)}"
 VPXTARGET ?= "generic-gnu"
 
 CONFIGUREOPTS = " \
-- 
2.34.1


