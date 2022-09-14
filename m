Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09547C6FA8D
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 12:03:34 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.5319.1663157009564219190
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 05:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UCXam4Cb;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id e16so25354631wrx.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 05:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=//M4UTVtlbNfqCHG6knPNwRikyy9zS3iU4SutMN9qqI=;
        b=UCXam4CbJBi/v3O3hi4J7yfer28KcOrWaIyNMTT1H78iN7OiopC9Ffo9u/nrkxDV6z
         ipODQy4dPBmXZWgrYnRAojO4UZnRIk4xu3WPH+2qk1vEQA1DPSI/11UOx0EXTPb7jIRb
         SVwBt9UYBMHq75DEJXA8svkRW1CKk9pGLjH0PROM/r6CuTcNMpXreY01SkvfsVPbTDOM
         8eGo9vZlq4gRw3Y+4sCez8yRZNtsk3m8cWYmVr31PAV26xSWkIYAq91QXzrCVV+N3Yd9
         Oc3XxdTCWwweJf6j8Y26RjorvmaomPvrM52svReFc/xWyARprnW2dXdr/kdQR+j0vmtX
         qljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=//M4UTVtlbNfqCHG6knPNwRikyy9zS3iU4SutMN9qqI=;
        b=IhFP2RKx+gfpBbjIE3ZakMSzBMHvy3qnvKkt3nU2xeka8Blg7Kifoyh7v4eMnZS3A9
         jfnAmWYItlFmQySEQTjlI/MNjxDCamFP+zU+Ll9/JjHfUny30gV6vg/jJMhm9UFnEAKo
         lAojEG3MAcz/VUc4kXs5mSAKAd546a4jmayS6l6uLmnN2/L4SSoP5oqLOEyfBI712CZm
         bvdX+Nn0j3VJYComqtXxXEuLEBqzNAV3tQSzVLUhMhueciK74qwFMp6jBQllJOJcbXY0
         afS/m68U/VqpBn9YX2vqwvkX+q9DaCD0/InVYWc/3ZaA1h2nCWpFGsmlQP1y6KX/ZakX
         VsIQ==
X-Gm-Message-State: ACgBeo0VCxQU4wGkzn7JHPg0nfqKXVcDBaNevhGyU88jFyJOB9u4tW2t
	KI8SGvjf+XCxBQvR4XqC8PKKVyoQjbXTxA==
X-Google-Smtp-Source: 
 AA6agR6lJRTpUpuNdIofR4vL62n4yz7bH/yyoFiow5NUE10VZN6KRXCTiEz8lTar4+PGB95K2I4lPg==
X-Received: by 2002:a5d:6b49:0:b0:225:6e92:22f5 with SMTP id
 x9-20020a5d6b49000000b002256e9222f5mr20157248wrw.529.1663157008007;
        Wed, 14 Sep 2022 05:03:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 w1-20020a5d6081000000b0022a2dbc80fdsm13286233wrt.10.2022.09.14.05.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 05:03:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/8] minifi-cpp: disable python support as incompatible with
 python 3.11
Date: Wed, 14 Sep 2022 14:03:12 +0200
Message-Id: <20220914120316.551377-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220914120316.551377-1-alex@linutronix.de>
References: <20220914120316.551377-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Sep 2022 12:03:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98798

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 3d40bf857..b843f72a5 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -58,6 +58,7 @@ EXTRA_OECMAKE += " \
     -DSKIP_TESTS=ON \
     -DGCC_AR=${STAGING_BINDIR_TOOLCHAIN}/${AR} \
     -DGCC_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${RANLIB} \
+    -DDISABLE_PYTHON_SCRIPTING=ON \
     "
 EXTRA_OECMAKE:append:toolchain-clang = " -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib"
 LDFLAGS:append:toolchain-clang = " -fuse-ld=lld"
-- 
2.30.2


