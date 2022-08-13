Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE42FC25B0E
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 04:38:11 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.1984.1660365488346791519
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 21:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pGosgslR;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id u133so2543048pfc.10
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 21:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=/+uU6jnqbEd80Wc3bkErnY7Ij2IskWZCAVXh5M8z5so=;
        b=pGosgslRosMKrWRyUmIOaG2A54Id5CEMnWDEYSWinigOYr5IataROzN0dkaVPLmDkh
         h5lOfdBPncPkhFw2V9IcPy1f7uyIyFF0eZ1YkoKLdEhFVIFtqxZM2V84H0+zhowKecuM
         DEghr8vSmqr8pHTZqTxsvpuokho6yMeBMRS7g0rZORZEX9FL5ZkpgcRnASi6cVaviTka
         Dgpby1BrIwMn/e5Bxd0nWu/jIW/PJ/yx1ac7we3mZCXPmC3CB1/lxEGsa5G10oCNE8uA
         b5l83FqpXBW38LUMQyo4/fx/22dopu42tzS2DpWdJxpvZjgfb1zpYfhoms4UjI2HCGWJ
         DspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=/+uU6jnqbEd80Wc3bkErnY7Ij2IskWZCAVXh5M8z5so=;
        b=2PBF4jAKkQDENKHVJaVjvxeiAsTCl3mWFHa8FgSmD7am0ijGrCktATjH5aVMdVldI9
         KFXgyM74RzujnWI5TLU1RP8YSFrQM9MUJopMKp9nt4pqRHwQucfIiCVXJZLaixp4O+8r
         NrGL6T5s0thi/+GIzTeW/HSXqAvxOAQxzwdCdH56YoCyJWisz1Qa0tScCqhD2uIM+b1e
         pXkHM4Uoi94c6uNVImmFQWrVir0lBOyjVtosGBqkDRD/n0nkFMq1qcZkHhLZX757+Xdv
         8I9Bha821iTFRN2nIbsMB2800ErfeOVmew1++7dNR52l3RlQcS55B3FYOL0W16H666El
         LIew==
X-Gm-Message-State: ACgBeo0vi273HCr5fEJKNlvlT3eqoEXj4wh989PtUEPmbM434Qhde/vS
	r06lz5EUVuutJ8N9e5Iq4jTv/m9VhTA=
X-Google-Smtp-Source: 
 AA6agR5q1Vs1pa2o6D0BO3NT9UphKieFtuBFphSMiIWPjBRAhQSorAY2iT9n9OkpWKRWLyL2DkNKUQ==
X-Received: by 2002:a05:6a00:1941:b0:50d:807d:530b with SMTP id
 s1-20020a056a00194100b0050d807d530bmr6497552pfk.17.1660365487250;
        Fri, 12 Aug 2022 21:38:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 j4-20020a170902758400b0016d62ba5665sm2601694pll.254.2022.08.12.21.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 21:38:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/6] netperf: Always enable largefile support
Date: Fri, 12 Aug 2022 21:37:59 -0700
Message-Id: <20220813043803.3548501-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220813043803.3548501-1-raj.khem@gmail.com>
References: <20220813043803.3548501-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Aug 2022 04:38:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98220

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/netperf/netperf_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/meta-networking/recipes-support/netperf/netperf_git.bb
index 06b2eddbb6..4074f0cd07 100644
--- a/meta-networking/recipes-support/netperf/netperf_git.bb
+++ b/meta-networking/recipes-support/netperf/netperf_git.bb
@@ -28,8 +28,7 @@ CFLAGS:append = " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
 
 # set the "_FILE_OFFSET_BITS" preprocessor symbol to 64 to support files
 # larger than 2GB
-CFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', \
-    ' -D_FILE_OFFSET_BITS=64', '', d)}"
+CFLAGS:append = " -D_FILE_OFFSET_BITS=64"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[sctp] = "--enable-sctp,--disable-sctp,lksctp-tools,"
-- 
2.37.1


