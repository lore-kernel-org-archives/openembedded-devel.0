Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D100BC3F6B0
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 04:38:11 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.1952.1660365489585737219
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 21:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fzIvMjsS;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id f192so2545920pfa.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 21:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=dkBvk3LWcxt064MURnZogYze5llsQXQsKPRrPdLPO6o=;
        b=fzIvMjsSqjciN+FjBxuE7wvBDdoo6Rg2uZ+E3NgUOTZ/ShoWd01tF0a1fjNBXu5d7R
         935S0pp0Fgg/m+9Qpwhp9LPr35Z6LlBcvYtM874RLRoEcsksbBKQVF4XozQtfF8B7/Gm
         MUorbwFx8iGaVSGUt04yfDoymF2hnznCp+vx/r6JZQ8MQXB1fo05mwj/cfl2Pc4gGPM1
         SE53pi3hCylV/ETVmA001amFW1U5r3ZASy/E1+DGCNESZIJJJWLCfSWd+TSYrCHEx8Na
         xpQtPgYl8YKSHZpUbTgOCW3EtIDNlp6w0O5I5Hv3AVCBk/GdbY45/7jRVQBYc+AdZYyf
         r20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=dkBvk3LWcxt064MURnZogYze5llsQXQsKPRrPdLPO6o=;
        b=SSnoscJRjymaTfzYyLnbOE6T6JbcW0LlMbB437sjft+sFMaf3hdjAFbi+duQCvSVPe
         kRF5BFOaBOlnKiTtqJIbwf3e2mAJZ0R7yr/UPRAiSNEPpCnUds2wfhiZOaGyfCrp/2pW
         Hf56XLnIyKrE5Fcdz909JTmSzY/cpAl2VLvaM+JyxIDKbTFSWTp9t948BxoWypROF1E1
         rU12EuzY5n8XClPWe/FQmcCa/amHc1CJFlDuHiA3ZjLMjxuJceV2GcqrqtYLF9UyVGkN
         8Z2EzstWc10RPJywLvXlYfukVcFRCoSl6/vIvlGy5gn3IIZJenbavW0KZbMDxPtnCJEQ
         oYpw==
X-Gm-Message-State: ACgBeo1GIZji5KS2NfyUa4lmrNvNbADgFx6/IX4p5tJb5drPiJX7LCCx
	h3+1mM+UU6YB1bVGqd54YOyEoXaSnr4=
X-Google-Smtp-Source: 
 AA6agR5LNYe3OuJyvsw5Ogb1qlAZJ95W+wq1ank0dU40kZDR3bNyYyCDS3cjWFt16A+JFu3jiVCRVA==
X-Received: by 2002:a05:6a00:1995:b0:52d:5c39:3f61 with SMTP id
 d21-20020a056a00199500b0052d5c393f61mr6902314pfl.83.1660365488569;
        Fri, 12 Aug 2022 21:38:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 j4-20020a170902758400b0016d62ba5665sm2601694pll.254.2022.08.12.21.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 21:38:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/6] openipmi: Always enable largefile
 support
Date: Fri, 12 Aug 2022 21:38:00 -0700
Message-Id: <20220813043803.3548501-3-raj.khem@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/98221

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
index eca5865f68..18f4deca16 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
@@ -41,7 +41,7 @@ SRC_URI[sha256sum] = "f6d0fd4c0a74b05f80907229d0b270f54ca23294bcc11979f8b8d12766
 
 inherit autotools-brokensep pkgconfig python3native perlnative update-rc.d systemd cpan-base python3targetconfig
 
-CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64', '', d)}"
+CFLAGS += "-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
 
 EXTRA_OECONF = "--disable-static \
                 --with-perl='${STAGING_BINDIR_NATIVE}/perl-native/perl' \
-- 
2.37.1


