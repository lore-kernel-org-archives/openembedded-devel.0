Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9E7C61DBD
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 02:53:43 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28009.1787799217811849247
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 19:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hL3V+WmG;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84eb992a881so1463217b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 19:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787799217; x=1788404017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSH6vVshyi3AeOqvPT1cqyXZlCeJYz4ELcx33Rez2EE=;
        b=hL3V+WmGj5GD5GRHz5TprCqXcd8gDBguJYuPKZrI7iMc+7jCeODhqGxDMSisuzGW0K
         31+hLRDDaf0dOpGHjV9BYROWwTei1M21fg/L2GBFG/5dC6aTDZ8CVEltBe7lwOusAy6W
         tKZsQXy5zxdiriAeBaF+Do/WtIaGC6Ijdk7hj+n8hTAvXlqXvQGpdqw66sADDWsA+GQD
         ur/gywKISiSAbXztByntOYhqmzuBtepCgdIErMp+WsEecj9AffSszaaYqfKs/rTPjziK
         wfwvx4Htl/g/GGOV6ldEDyroVIw3VJW6VVMOePVht8r3E3AL9tr61o8brOJENEP2lUMD
         d9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787799217; x=1788404017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zSH6vVshyi3AeOqvPT1cqyXZlCeJYz4ELcx33Rez2EE=;
        b=esj/vxCm6Dpg+gdGfAoZOzfB81TCq7eL2oOdGo/9f1r0rZ5tUpk8A7nTeudAxsdHk7
         gsdevDVYcMgsQ/yh3+HYDGsPQ28DQR4OWSbGkzger5mSKrOfAAms+gSJbHqwQheyRPHC
         ZwaNcy0CAidHKFSKtIVE6Sv+BYUICoJ0cW35mKjSz3Iw6CEiOHjPc5iwYClsWjZglqh1
         lljuwv7zrE+Ueb1W2hmhpQgB3objhyGIbxYI3RwZwolirHHC+Sc9UgAXQ1rV6Iy+viKY
         9eNrsM7LAA+TnEkG+HzrU2WtzSmc7fQoMHeS1NY0fIEsef4yPpL5te4puX57h/UgQO7l
         FXcQ==
X-Gm-Message-State: AFuF++kND9tWNrx1hN6Nj23MyFjUWYdyx8Sr0R1FpWixOaFi+OlWJH09
	VBskvb180Pbv+5U7iFgUEQEndJ8vacMoG9X7l4b7UGur69TIKoS3pOJV68Ff7Q==
X-Gm-Gg: AR+sD13mYy5Drw2eBK8tvAtSdvPTFOSJMyvlAHrbPcmyqK/cOATbT904fI98CUJf1z3
	7vHsBppJkJ7//RG1oDO6w4pCAOONzIReT2PzkIOzelLwExecaSMdPN7ofP/NSt+x3DHIIHj8/RB
	lMHh6EIRFW6vQIq/RA343g2tMBRBp8NkKMH1JzXgYeLfwgClm8b6OSu3P+IaGOArqCpNAJVbDLo
	5UeCB4IFM7rm5ICjmqpYGpVHBohIA+F2/WYNkUZvPxAX84GrZzegtk5GUeibsNMORGyBs1/j75+
	4Jl3JCaO2k6kzZfDL9NlWV25en7q77PaJgFqeFJOCgx2gHABYHKA0F+pJ0GUiwKzVJN6//OVTUA
	EuOdNdpbsKJKu+TlKY+WDZhnaU3HZakerT4mN4q+8LT30DVab7HrIDTtoxn9189k5uvWTUtWLZN
	2srO4y605ogLs7pCMBho8QanUZJm26GOnKW4zEsv2A+c7LABLdfPnwydGq7JBF44bURzPIbv4I
X-Received: by 2002:a05:6a00:8d86:b0:848:2eac:bfb2 with SMTP id d2e1a72fcca58-853748a0551mr23558488b3a.13.1787799217113;
        Wed, 26 Aug 2026 19:53:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8556db7ab0esm5787b3a.48.2026.08.26.19.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 19:53:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 2/11] libopenmpt: upgrade 0.8.8 -> 0.8.9
Date: Thu, 27 Aug 2026 14:53:14 +1200
Message-ID: <20260827025323.1433982-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827025323.1433982-1-ankur.tyagi85@gmail.com>
References: <20260827025323.1433982-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 02:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129522

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Note:
https://lib.openmpt.org/libopenmpt/2026/08/19/security-updates-0.8.9-0.7.21-0.6.30-0.5.44-0.4.56/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libopenmpt/{libopenmpt_0.8.8.bb => libopenmpt_0.8.9.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/libopenmpt/{libopenmpt_0.8.8.bb => libopenmpt_0.8.9.bb} (97%)

diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.8.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.9.bb
similarity index 97%
rename from meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.8.bb
rename to meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.9.bb
index f7bb5be4cf..3b4be321cc 100644
--- a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.8.bb
+++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.9.bb
@@ -14,7 +14,7 @@ DEPENDS = "virtual/libiconv"
 SRC_URI = "https://lib.openmpt.org/files/libopenmpt/src/libopenmpt-${PV}+release.autotools.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "d4f00ddd29eecb9594bda7be76c13aaa2de1dadc18391c3e905f728ec9af8822"
+SRC_URI[sha256sum] = "d7ce84fd05d686c4bcf66af40eae857afa371442db60eeda3f874bd6cf6fc318"
 
 UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)\+release\.autotools\.tar\.gz"
 

