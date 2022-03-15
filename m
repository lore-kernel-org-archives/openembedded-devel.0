Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C090C433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 15:56:29 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.12818.1647359772417804439
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 08:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k+C6ru1E;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id h5so15230230plf.7
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 08:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B3LOXkILD8JYDNqiv5BJJuSfxj196FheDJjPCe/xvXs=;
        b=k+C6ru1Eiv/477l7PqdBNhQT09tDYmM6K9PLHps4ZvrVt2UpGSAAibmWpbZ/nLrg6x
         SUKlbGaIxXTJA15d4pmOLJYmtaqD+lNuzbcKKApFb7Ste6CebRhQwNRl40c2ZUt5uPoZ
         +W7iNO1ZeqvgqIHRMekFfVw29KeJf3hbEIEpYGkNdQvpGXRD3MYg9GRHXic2MdyMyYG8
         kSSupiYJySULXTO2zMY5Y1tUmeZFFKIjsSf49gkT/1DrGb5a+LyluADyrp5+Mfho+Era
         BXYwpOTrppj2c2zE4CPWUXbIYOxY+29NdEvmCEUdIwlJ6LOSsJsYEIOFmYfIgcZJt7iL
         9Zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B3LOXkILD8JYDNqiv5BJJuSfxj196FheDJjPCe/xvXs=;
        b=Fh6iKtMMqDhj5DglRjOmfObIEsVUd7EML5a2OXV/iWt2kHGU2SCYFnnoTuHhK4Q/Vl
         TlR8FMWS1ebyziLbjHkQOjwP23Wm8c6qsZb8JfuqhLmYRNrDZqTzP5myLTmtmozcoghc
         E6eq8doTMk9niknCXtPHgxWjN/GWyrtV2nmSd8LTO8jvSwWvVHPPO4VoN489/6MODRgT
         LT+E8Npsy4uoVEELd+iKoJJJ73/9TrCUeyga3xfoj8b7VpfEwUlaTFCL5kZhHushDOGN
         ZKSAKX/UJANZorYM1fZERyktZYOrHpmYcc48sCuipBAx0CeCNj+uzdCG4qZfVl5LQuRJ
         xZUw==
X-Gm-Message-State: AOAM530TGLpeYHc1KG0hG3cp8JoTkiobgsTIsPCW4nYu+/QKab2JmYkG
	+U6Q1t7uNaFL1ahWD6fpMhsPemzn4Uo=
X-Google-Smtp-Source: 
 ABdhPJzHqYyvBrn/kWNt1haAx5flJA3/Q69hfKfZCnklgibd1lr5rdnq/3Z7T188gD6NWT4fU40wmQ==
X-Received: by 2002:a17:90b:ed7:b0:1bf:aee2:319c with SMTP id
 gz23-20020a17090b0ed700b001bfaee2319cmr5525879pjb.66.1647359771504;
        Tue, 15 Mar 2022 08:56:11 -0700 (PDT)
Received: from nereus.local ([2601:1c0:6000:1b20:4e7c:5db8:f14f:580b])
        by smtp.gmail.com with ESMTPSA id
 rj14-20020a17090b3e8e00b001bf50a8b468sm3912101pjb.51.2022.03.15.08.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 08:56:10 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 4/6] python3-pretend: move to oe-core
Date: Tue, 15 Mar 2022 08:55:56 -0700
Message-Id: <20220315155558.969249-4-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315155558.969249-1-tim.orling@konsulko.com>
References: <20220315155558.969249-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Mar 2022 15:56:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95997

This recipe has been moved to oe-core in support of
python3-cryptography.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-pretend_1.0.9.bb  | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pretend_1.0.9.bb

diff --git a/meta-python/recipes-devtools/python/python3-pretend_1.0.9.bb b/meta-python/recipes-devtools/python/python3-pretend_1.0.9.bb
deleted file mode 100644
index 21d14a03b8..0000000000
--- a/meta-python/recipes-devtools/python/python3-pretend_1.0.9.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "A library for stubbing in Python"
-HOMEPAGE = "https://github.com/alex/pretend"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=411780c0b7fa756753e94affeee5bc99"
-
-SRC_URI[md5sum] = "ad53883ede48aeac7ae584f0de0240e8"
-SRC_URI[sha256sum] = "c90eb810cde8ebb06dafcb8796f9a95228ce796531bc806e794c2f4649aa1b10"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


