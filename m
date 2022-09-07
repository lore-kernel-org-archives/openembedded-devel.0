Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A96ECAAD3
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:41:25 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.2659.1662594083272462970
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W04FrLro;
 spf=pass (domain: gmail.com, ip: 209.85.215.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id r17so2612105pgr.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=b8xIBPBySPcCTK98uPdUSmK7NyJvP4bjoMfrvK4lVT8=;
        b=W04FrLrocLourYd/9ULL9qE1fWe1EpPG8myaXlm7/GBw0P7pbmHsotcE8bpDqFzMPF
         LnSxcLzj4t/s+PLDjWEzdPfsqIWO84mewx4gnQVz7XY95pTgtJE5NGf6/opOeIK5rzrG
         7Vrgq0W2rwN8yEO7DrvF1EKH/TOLKCw4d3eqbFMF8NvjoVFmtVYkvjD+b6eytXfWtl4B
         WO4U1cwtD1tuAygECTR0fGX0zjJoTrlxhTDIoKqviA81LAMphFrt+GSA9IyPLoWDECHY
         FV3gZ9FmjKGROq0NpsyZ+vEJjsKOnqbzj38n9G98jgOKxDEqYzsUYriUc8AK3TqYeOIw
         gBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=b8xIBPBySPcCTK98uPdUSmK7NyJvP4bjoMfrvK4lVT8=;
        b=3oElxR8ymvC01uyHxtescdjvKNQa/YDft16YT21Sz5dxEzNGHPktsibR3zt0fpihky
         gL4XPNZ52+il47z+KNUGk9e/qHEdYLqXPuKH6QIyaeSv/qzJKjXGRpcm9LNjopp5NHj3
         OdC2XbpDsTzqWiCILcvxDxEzZ1W7l5DOI29gMAm5tbkSsA039vr5JqQUoxVZeEo8ivmQ
         J42c+LNJDgqZq8pMGRhZSZKl6UCEzozoISx8XTB09R9FP1lRp8yQfEMzkIxA9zrapo8j
         4FRBVd6cu+oNFfncR+4vcKQyinTjvv6JbyfzWp+LQHBYHyqShRtv3tNOh8QDbTPRA7o1
         sBmQ==
X-Gm-Message-State: ACgBeo0y59+FrPpAQCi8MouSRdQg8R+7y6B1KmxaIGGw+bDWnNXN37xS
	DNZscX0Vbj0MzgjysJmkffRkgblQxKDvIA==
X-Google-Smtp-Source: 
 AA6agR670W8JL5UvWVyTRA66ifUoAVJoe8en6RGKSzeJ19z17OCHi66PTFq0FJ8HSurPUqv/2Tf8tQ==
X-Received: by 2002:a63:5d46:0:b0:434:a7e8:a14d with SMTP id
 o6-20020a635d46000000b00434a7e8a14dmr5447646pgm.366.1662594082456;
        Wed, 07 Sep 2022 16:41:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c5306917fsm10276495plb.53.2022.09.07.16.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:41:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 22/22] geary: Fix build with clang
Date: Wed,  7 Sep 2022 16:41:02 -0700
Message-Id: <20220907234102.3312797-22-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907234102.3312797-1-raj.khem@gmail.com>
References: <20220907234102.3312797-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 23:41:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98712

Disable Wint-conversion as error

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-connectivity/geary/geary_40.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
index 4b454dc02d..3ff0a412e2 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
@@ -52,6 +52,10 @@ PACKAGECONFIG[tnef] = "-Dtnef=enabled,-Dtnef=disabled,libytnef"
 PACKAGECONFIG[valadoc] = "-Dvaladoc=enabled,-Dvaladoc=disabled"
 
 PACKAGECONFIG ??= ""
+# rfc822/rfc822-message.c:2097:12: error: incompatible pointer to integer conversion returning 'void *' from a function with result type 'gboolean' (aka 'int') [-Wint-conversion]
+#|                                 return NULL;
+#|                                        ^~~~
+CFLAGS:append:toolchain-clang = " -Wno-error=int-conversion"
 
 FILES:${PN} += "${datadir}"
 
-- 
2.37.3


