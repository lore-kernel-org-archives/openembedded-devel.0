Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF464C54ED1
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 09:56:18 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.15505.1747884161734751726
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 20:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nOotFsT/;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-742af84818cso4575809b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 20:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747884160; x=1748488960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e9TwZS/Mn2ODMn4D19iq8GmCg10OUxCzBfrgFXa+4Y4=;
        b=nOotFsT/dHPRx5tAW4aaoMqpaVNRzfWSnA/WstqfV4k/MN4Tk/yw8Fa02KiTuDnvN9
         UTuUcr/AaM1OQCd8V5o5nqGWnxibYLQpBwoPo+9gw2a0LI31ie6b42UgquO10KGdO0OP
         yGiO57kR0hsOOa6hiI9FBNj8CprbHrL9cu1ZFMCyMeG7XmZwS4CAO+tgjOTOswZXBKNZ
         /z87p1hRfknpjQuwaW7kV2FDdeTT0xOakaMIgk5onJ+ivz8QSaRwuCZkHXrpOmbRa6H2
         H4O3AWqprhgXruF6fyoEoD0GKB9htJOxq/Jt6FPJJSQHzEI1K5kJ6F38nI/927wNQORb
         Nlag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747884160; x=1748488960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9TwZS/Mn2ODMn4D19iq8GmCg10OUxCzBfrgFXa+4Y4=;
        b=C9mUsVcXD3MadCLw6AAXtYVypPoK3AHAHAFLvThQUgwTF6NezJxtvYg6LOOk+/p7Ld
         ZRE6B8LD266U632si9+/AdvO6/y7MjHUG/jR43EUmAh9lSoQ9cHDW82kqP1RrIV0L/HG
         sH96evsGLnZcnOWeaeI/kpLrBppNsRipiQbDmSOEkpTpY6IX3wvl1M4FePakqhdExwMG
         cqclVhuQNb9HkVl/SiXzHF5/XIzf7AobD6P+FY5VQuz6oUDd+2N2KR+rmFTeMjix/69n
         gU8K6MEucYwWoM6csck+GQwlsiIqu8XKuTJicGZhS+ggDEnTqNxDb7RevmbRdMaSYwZ/
         diYw==
X-Gm-Message-State: AOJu0YyDPo6p1+ey1Bs0pCM0i7egcQO/vnv13hn1SZ+AZ4H0qqDOf0Nn
	BCnTeeb5KSQjDkjuud5pahOkKtSUavC6jRGpXRAmjqHiglDf/v3faw3VFSlGlw==
X-Gm-Gg: ASbGncuLqdjH2sgpW/Cliu3B2ptDVMEtbPHr78LAlHjyAhrs80a9S1GlAdiUrDcahct
	RVnEsM4pvEAzJcf7XjxOye4FhLTjl/zQCbWUvro68bDgaAnghn0HC8WHPjQACIGcrFlEnkGknN9
	WSaPBMpty9WUnUewHB72JhEwK1rSM3kObLgteXEeIkhhI8613QzP+Cep/muu+NZFiBxLraSLy+g
	bWSSGx10g1zdehuJIW6xfsNASnbofPWiyBL0EftbCYU1UFvhSZuiQXNBXbOQ2Rsk3uGASHDuLCk
	tn6RJ3W6oMe/aZ1Eu29KcxJ2vtkVmZYLOl0oJFkcjz5gl7LlV5jYKPXlHGCO5V3XmJeuzFu5ceZ
	RetRtExuUVAsSjNY=
X-Google-Smtp-Source: AGHT+IGorVWtVfNODkuSgkko+H9pwC38LBUJooNrKNcbiJBTPyPQ3zytRZdDAvzvOTJePhdr2jfn5A==
X-Received: by 2002:a05:6a00:ab87:b0:73d:fefb:325 with SMTP id d2e1a72fcca58-742a9787708mr31746428b3a.5.1747884160092;
        Wed, 21 May 2025 20:22:40 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:9111:1040:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742b6c3989asm8875794b3a.122.2025.05.21.20.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 20:22:39 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] libsimplelog: v1.0.6 -> v1.0.7
Date: Thu, 22 May 2025 10:22:07 +0700
Message-ID: <20250522032207.13061-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 09:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117580

- Add "spl_err_txt", to get text of error code.

Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
---
 .../{libsimplelog_1.0.6.bb => libsimplelog_1.0.7.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libsimplelog/{libsimplelog_1.0.6.bb => libsimplelog_1.0.7.bb} (92%)

diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.7.bb
similarity index 92%
rename from meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
rename to meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.7.bb
index 0aacbcd2cc..0302f7c89f 100644
--- a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
+++ b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.7.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
 
 SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "7676b9cf871bedd8648d2cf68ebf43dc2c79b94d"
+SRCREV = "edbe423bdd1b36faf30d2eeeb869e4c1755864de"
 
 S = "${WORKDIR}/git"
 
-- 
2.47.1


