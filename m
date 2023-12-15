Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C450C46CCD
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:57 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.58187.1702626774932069273
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IvgDb8r9;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cb21afa6c1so4510001fa.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626773; x=1703231573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4GMKBSE+A5P73RluNQnquXFAb5xjxGcNcrYL0fjvTc=;
        b=IvgDb8r9mtRl4Vr+nTrbQvzO1fra6+VhqU6/W6DbndQS+WYMhfjx5finJZ8GSOxlKX
         BFnplDVInrN1lOxpdDp5Tw2w2PlEzoWiMTNGWQ/dP1c2YmRcOnm23BF/7vlBQk4OW4AB
         DwsEErxDF67RSEOznQnJL2RMUFAixdhBAJlHgtTiRoFvgG5D5Xp92d1C18p3IfJdKOn4
         SD9vkBCDQg3skblwG4hfNd07dxHCmt38ESdw7gWNbn/MESkOdATHimlB16F21EZonIDN
         0WM0rQh551e2/TfhfA5xYY4pwW7Qbsz39USU3J3YQTVFH2Ukpa9FCNjGlwzLMenlaMGv
         eu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626773; x=1703231573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4GMKBSE+A5P73RluNQnquXFAb5xjxGcNcrYL0fjvTc=;
        b=MAtmVnPUfSsgCnh7Z8deRezyhTGTCb/dHJgOYpEiayZtlm8fPt3MKSVosfilMmyVfu
         HJKjMfTReNRBk/JfiUMAf2KHERcgMs16+tLWtemNoZD3kloP8Z4yUXFXAMiZkMp11DNb
         W2UwyTFFWX5I4A8GT65mizXrcqpxDSzEUQs2Xfe+IMj1YWDkDKrBn4VWnzbNB/zpqJ+D
         gX7E2Lf0KZAq4rfq57KlZoMAZWKzpkIQ+IZ0l/y8B2aj8U9omXH/faK3l7w+Bvk5hTI6
         ZEBBGBOb9ojDCuZfrKukhtDYkdYbckn5i/NOb9KorEgK4QZtga1fT6oXjqOUEWQHwWMC
         UbeQ==
X-Gm-Message-State: AOJu0Yzl8NNwsnw5vgds59HDc+kgRSzE2LqJWRPA1REkAuQ+MJVsjJvs
	w+Fd0loQKvNht9b6C6OhKq6C73uvjX8=
X-Google-Smtp-Source: AGHT+IGNv++FzlF8Y3PGkhcqcJ+k84vOJLJ2nBC4WDEOvlhSng/r/6eTIlDN09lP2xS+z2MLOSH2ag==
X-Received: by 2002:a05:6512:2153:b0:50c:d72:200d with SMTP id s19-20020a056512215300b0050c0d72200dmr4863742lfr.111.1702626773118;
        Thu, 14 Dec 2023 23:52:53 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm10348666ejc.206.2023.12.14.23.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/20] python3-astroid: remove unneeded distutils dependency
Date: Fri, 15 Dec 2023 08:52:32 +0100
Message-Id: <20231215075239.3049865-13-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075239.3049865-1-alex@linutronix.de>
References: <20231215075239.3049865-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107506

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-python/recipes-devtools/python/python3-astroid_3.0.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_3.0.1.bb b/meta-python/recipes-devtools/python/python3-astroid_3.0.1.bb
index db3ef4392..348dc2ebb 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_3.0.1.bb
@@ -21,7 +21,6 @@ FILES:${PN}-tests += " \
 "
 
 RDEPENDS:${PN}:class-target += "\
-    ${PYTHON_PN}-distutils \
     ${PYTHON_PN}-lazy-object-proxy \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-six \
-- 
2.39.2


