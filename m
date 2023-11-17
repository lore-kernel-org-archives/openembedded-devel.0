Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE26CC197A0
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 09:17:52 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.7911.1700212670214004272
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 01:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=bnQuXaxF;
 spf=pass (domain: smile.fr, ip: 209.85.208.175, mailfrom: yoann.congal@smile.fr)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2c5087d19a6so21953971fa.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 01:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700212668; x=1700817468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tJTlELY0lKp/U2GwxPQ3nKfuaMyc4sgNN4a2VUheqU0=;
        b=bnQuXaxFU5YgzmV/Ayzm9YaW9lWxJcyiMkZLj/gaHJI1VqggXesKrt1Dqq5d+GA9yZ
         fcpPqBU8bJnmOk0qRqI8rhhGKA2a+Va58CHHrfI1xJbYwls2gvX5m4n4yyy7UOmZYdhI
         cPAJUYaTPowK7Bi5UCXNSliYOBGVYsIYzGKp2AxpceaB64wvtG0mEH8kuS8coaQVNsrv
         xPbAZWeVPJX0w/lvUFkE7W79E+EM+sIGN1FKsfDdjBAPkFw1klZ/0yIczutX3hTFt5Mg
         gDMSalE7UO/2LLkukgzUPgDHtQyp0ojeZE6im6TivprufWJXU89nfDYmDReDooeballP
         BDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700212668; x=1700817468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJTlELY0lKp/U2GwxPQ3nKfuaMyc4sgNN4a2VUheqU0=;
        b=wI+TdawAt3psqXNgT4x7BL5Cdl9qupkQzdZIUnHoN4LcfUGDL+//qH6wgEGb6MIcGl
         I5c5VofdQDRyvl6J6+GWLm/lGDRBdC41TX+Q3gN7wrXPiOb7t4a0DbVk/aR2MXlWW3xm
         tCS5hS24knFTPICaCufbOtXE/th1nlrVkAFZSt+5AbRdO9W/amr3eTgenCpnTRyu93ks
         xrPo5O+/WA9TnZJauxHllRxsr0B622c5gj7HR4mMH9PptjRfLSAPQT1Pz4/wUAKB2QQi
         o3o8RuuOVljsjZ5wf9A5QKcunCRgqq1p/Gq+XeEYSZf63A10OQb+IjsnQjiWB+gfpSLP
         uUFg==
X-Gm-Message-State: AOJu0YzpIuv2N7Ihayd2xq/Fft/RNLwftko7L7+63vsawpeQjvJJ2vlf
	BgnCpU/lHFAaHUjRm07NqQIOiRMovm5pbZAUAuk=
X-Google-Smtp-Source: AGHT+IEsJVr3J84JlevjCdkxTTuT/H0acN8rCFGCk605kwy2AkTT5/Tk0hJ/D7Shfbur8b3nh6zABA==
X-Received: by 2002:a05:6512:1143:b0:509:8e20:e7c6 with SMTP id m3-20020a056512114300b005098e20e7c6mr12237233lfg.32.1700212667708;
        Fri, 17 Nov 2023 01:17:47 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id f12-20020adff44c000000b003313e4dddecsm1679132wrp.108.2023.11.17.01.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 01:17:47 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][kirkstone][PATCH 1/3] packagegroup-meta-oe-extended: RDEPENDS on an existing mozjs-91 package
Date: Fri, 17 Nov 2023 10:17:31 +0100
Message-Id: <20231117091733.450572-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 09:17:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106861

"mozjs" does not exist but "mozjs-91" does.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-core/packagegroups/packagegroup-meta-oe.bbappend    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
index 09f3e34f4..e1db8bac9 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
+++ b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
@@ -11,7 +11,7 @@ RDEPENDS:packagegroup-meta-oe-connectivity += "\
 
 RDEPENDS:packagegroup-meta-oe-extended += "\
     lcdproc \
-    mozjs \
+    mozjs-91 \
 "
 RDEPENDS:packagegroup-meta-oe-support += "\
     smem \
-- 
2.30.2


