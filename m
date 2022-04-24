Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1EBAC352A7
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:11 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.13887.1650769811971140392
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hQ3QMwKy;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id c23so19603128plo.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yJetwtPLbsw4QzF0XmgLTPoB/gh4RnPYzykVNWXGur0=;
        b=hQ3QMwKytcOOHABVDYe0S6F1ChwQYoWs7x/95X8YqhyO1BTKBBrO034CovDM2Gudqe
         bBAR50jQO/6oK/dX96tShFzMeYw7EZD8L3wO/VNKU1BFgyJ/y6J66aUvC6QqeUlMFAmH
         fVRsTlfVrOUQoMmTgnxtNgEAVfEUtK0u/6c/X+p7qg0gnxHi/aksYEli16w/A0C+VHOU
         JPDCeVkl6S6MuD0SC152lahpO3v5zW6OJWCI1Ak/gN32YfR7xfsUu4yrwciiNZCExEok
         d5BbR9trHKbYtji6udscmkoPgrKGD08tG/OSF+cVNVXmHzcTaKo41Uv8F/ELUT2vlnkm
         GQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yJetwtPLbsw4QzF0XmgLTPoB/gh4RnPYzykVNWXGur0=;
        b=iCr8VF0ohFXfPcW0sl6BpbFKxKMx2Y14obXIxBJCHIHSneoDEpyKZ0BlVQCOZj+Onk
         uUd34gTszr+uMfScDgr03whEFB1fBu+8Kk8zBDQrY+14JfKeGfNU1bj8QA6dXrjD+ByA
         AYJ7sKmaPaD23nud9h9FeWRWURgem0muTh+JfKKqyQb5hSwd0D3dpVV/AUS0D9LEHwws
         owFbfEpfIHhaxvAbWSgCCPefXJwmpTLxd6IA6FGOOMv4/3ouQS9dtBwP/V/B3iZvPXpi
         egqEAYZLa8+l6ZtAT5xpZRN5He31LYjJnvZdJdpm6DdXkde2Byi39o2E6HlAGTBt7xbP
         BxeA==
X-Gm-Message-State: AOAM530PhMJm0jeWwolKQO5SbN8whY6ZZvauht70x5dxC7s3hEyihwSQ
	8KGWLwcHK4gcdUCkW2Vk7fHAvc8xiuWetQ==
X-Google-Smtp-Source: 
 ABdhPJzxeuXExgDzbCErZ20FYrjohAiTDNjxa/yNytKOp+59BZVuwDE+9/GQ/W0LvONaLZ3dKJ4rtA==
X-Received: by 2002:a17:903:124a:b0:154:c860:6d52 with SMTP id
 u10-20020a170903124a00b00154c8606d52mr11788441plh.159.1650769811335;
        Sat, 23 Apr 2022 20:10:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 q13-20020a17090a2e0d00b001cd4989feebsm10630987pjd.55.2022.04.23.20.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 20:10:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 06/12] tomoyo-tools: Drop md5sum
Date: Sat, 23 Apr 2022 20:09:58 -0700
Message-Id: <20220424031004.3209576-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220424031004.3209576-1-raj.khem@gmail.com>
References: <20220424031004.3209576-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96743

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb
index d9f09d1744..2fcdb6bd61 100644
--- a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb
+++ b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb
@@ -6,7 +6,6 @@ HOMEPAGE = "http://tomoyo.sourceforge.jp/"
 SECTION = "System Environment/Kernel"
 
 SRC_URI = "http://jaist.dl.sourceforge.jp/tomoyo/53357/${BP}-20170102.tar.gz"
-SRC_URI[md5sum] = "888804d58742452fe213a68f7eadd0ad"
 SRC_URI[sha256sum] = "00fedfac5e514321250bbe69eaccc732c8a8158596f77a785c2e3ae9f9968283"
 
 S = "${WORKDIR}/${BPN}"
-- 
2.36.0


