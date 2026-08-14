Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0B1C5DF6E
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:50 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24386.1786747609158525697
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aeTaxela;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38511175ad3so1505719a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747608; x=1787352408; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=anGuwLVAWISA6gC/8j5fIVrsvKBxH6S6nk9El/WWKDw=;
        b=aeTaxelafk8LNuV71bnZ88/C03X+zD/zyQe+yIC5d8/QrFC5xHn2MoepfIWnJzxpDx
         tfZINatW4kevIURGKkBTPlI+0JAOOaOE0RmErKQg/H++7tKw3TDnhD/GvBmvJO/8asf/
         J95kAUiS9hb8rhOuKl/xvo7BJu9SwzptHQoje43blT0cdtweAFv7rTNkHCqH7edc7icf
         ivoYO0635jJ3/lhWm4M19eHkbEfmCq4lKGlRDgqdtMDt9cXCKnFxzPago6ZdKznO59jP
         /VMv6TudZ/Y4uETo9+gA7Z1eNNK+dKMLBu+Ufx58ZOIIvyiKonNoU1ftNeTxLbcA576i
         6+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747608; x=1787352408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=anGuwLVAWISA6gC/8j5fIVrsvKBxH6S6nk9El/WWKDw=;
        b=JglzO9QaLJVObFnEssYe0KwDrt0uKXmuL5sAzBe/zuz/CI+t1WIu9lTnJ/ftubgx6q
         EJq1+PLKSIK//vSv/VpfctlHxqzBvISTzZgA0atj/PSmazIAk6Yavhf4ab3s+kSUlw3Q
         JknuDO9zJac0zCwvydYm3XpFu5IehwMrxUwo7K3DKqaSNxlJ2x0QaRo0uAzwMlyuSncA
         wthBfnpnrfG46tEF42yAfVKdcQeFpoBvKrVt6DNa6R2UF8oaaQJPBQtUEggSBOnoVhMb
         117Jc182cLrhgZqh7ZtM85B4ISlCiTC5Ra0GLA112r06mP+He2+YV2pIAjRBbQhg91u3
         G3iw==
X-Gm-Message-State: AOJu0YwcEWfT8bBMG0xFtEn1Lrb31bkpTK0M89NfFaO40i6T1wZ+dAIQ
	3Yis2GsWmcPGmco2W/QklzL3YPeH7zyOkzgLLIOjeHqdVeraLG4emEND0wFdP1gi
X-Gm-Gg: AR+sD118Kc52XLT7lln9gYVj6ej4TpLqANvG5Pk57+Bjk2dJ7yT4nAwCkpUyFM3MQy0
	tAKDdKTVs/mXcaKSAcfFkjyySecc6ChVbBG1iCfy+K/Kd9Vz+JrV5xgWHw30sqLvKKzDAdM5RCg
	nsYr46ca9UlIjuTnRmYzmUexdrOnsdGkUGKHQDhj7lgqclZCS/pGipiUdA/iOt3RHEGrXbuKw8l
	3p33klio2Jzm9FSsndHT5pveoKLNAV9KJKO3mc79YziPpnszNdFYNhQZLELrS4f7w5Cbm0KQ1WS
	X8CG0ZmZcCIz70aG43P1kdbIou5gNLIxAmqATJTLPvt/cGOeuOze7w6BjBye2kbmQqjWB33vfEW
	fXxpQqJmUMeQb5XuNKq0sIZ/0NVEUQa0U7VBnCWltUHaLfsGO6ZXNq1hWr+gcrpNA1Em66jLn/e
	H3UrP5f77YLtlLFBFdlE0Q9tJJSqLBxBEi9AGubRRtlTmCgPPcwrahbh+RL5RLSnC/TZqdmeXDE
	4ALVHa9aepQd5DYqR3cB2kZ4rgJMMVnxRMmpRw/tVHQX2mMc2XjKQJqB267yQBZ8gFmt+xZMwlh
	X71Bupsp3fkOH4vpJ4Qdt+2u1qS6c3GmE6yF98lgxvQFxhCd5Hx/WUei0lXFO4gCGmFMce3OqBr
	evUkkQNh1rWxpSMfSbLibD75Y8hXXicckms9omEjnloE2ZA==
X-Received: by 2002:a17:90b:1c83:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-3933b77c3f9mr10192999a91.2.1786747608427;
        Fri, 14 Aug 2026 15:46:48 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 059/109] rrdtool: upgrade 1.9.0 -> 1.10.3
Date: Fri, 14 Aug 2026 15:44:45 -0700
Message-ID: <20260814224539.1523174-59-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129123

Minor release; see upstream release notes for details.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../rrdtool/{rrdtool_1.9.0.bb => rrdtool_1.10.3.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/rrdtool/{rrdtool_1.9.0.bb => rrdtool_1.10.3.bb} (98%)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.10.3.bb
similarity index 98%
rename from meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb
rename to meta-oe/recipes-extended/rrdtool/rrdtool_1.10.3.bb
index fa6ba6b8b0..656cee7ffa 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.10.3.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=39df84cfd8a5e18bf988f277f7946676"
 
 DEPENDS = "libpng zlib glib-2.0 libxml2 groff-native python3-setuptools-native"
 
-SRCREV = "522b228d74da7054594b6ed9c289058acd6cd3e7"
-PV = "1.9.0"
+SRCREV = "f9a021cc9872d8f8fe8137353eabdd8819288791"
+PV = "1.10.3"
 
 SRC_URI = "\
     git://github.com/oetiker/rrdtool-1.x.git;protocol=https;branch=master \

