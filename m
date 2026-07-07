Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76C9C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 08:11:37 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.169735.1783411850971312743
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jul 2026 01:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=k4yXen5H;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alessioigorbogani@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39b0c6488e6so42754451fa.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 01:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783411849; x=1784016649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sm6GsKaK9wh3mSGJhiajdwHBrX5ngUile4aSMV11FxM=;
        b=k4yXen5HBgmtj4jkT9pSjL83HtIeG9mlG+/AwmxtqLQFLSBsjCnwtMHm7J4JoNJlzR
         ciDSruLbLmartvogyVp+h/Not9XRx/6imxloNyy+HhpILRBCP7g6NDR69FM+9DrKGICC
         0pL4Tp6+qMxd4kjeLXsobcCCacQGLL8cijhnIViwUS3O0t/bxBjt7AEsIntlpmOQ7MsY
         Gjk1OmkD7DD3+XqOu+kX1hTJaFslzcWinOEAYYT7VhnIs2jcZ5bxhtpcXxm40Ie8J3qX
         a1se9YfULw7h2P1nL5nJEX6oSZn60ej7BSa/kwDSPgDhOnbcuiJUzFoISQFaTCmCp97H
         wiPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783411849; x=1784016649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sm6GsKaK9wh3mSGJhiajdwHBrX5ngUile4aSMV11FxM=;
        b=GJJWY/maLO1O66MIuYcxpJkBsri1FGXQvxDdMBTYWhH8cgnjUPWD5KRqGqiZE9Sgll
         iE0uetJiseDrHp6sBqYCGY4ROkj7r8yCmzkecpi7rsDY49vJMUrWg81081EDIhW+qiWP
         hEZwCh8Ea4lAqgycxdDTtd5vPUoR6Q3NynF7HJmUscfeg0pcujyNE2wr1KO+4/wiSYFW
         BAikzsuTkn3aZuajklpcKd7Wty8UKbNPOslsde7Z+R+xZYYFeiNcClT9pAXynqqgY1jD
         7YSh7/4zIprhE0qTqFtBvwI6OTIn+HOOnl+kh0zmlI3Wzc1jZxtFFPaV6FW9FPsnKjvI
         Ombg==
X-Gm-Message-State: AOJu0Yyq8zyJb04Cu3o5V3A9W8eqVJGJu1OaIGsQ3MOw0rvXEVa0r+br
	ujsK8oNAYOntiflD5uJ16dQJ3S/8WapIdYIh2lCbo4ex9rU8jKrK1eVY0aTyYw==
X-Gm-Gg: AfdE7ckoSO7avSwcLQMGf7Tha4ZUHRs82AY1jt4jokDeqvI4BP/Ow4a2SN+593KKsgf
	ftcte15kAF95tlbDhJzkYRLLyFYXh03cYOvtroEJKnURRyVLU2B0kpFGXrcWbUVxvi0FYmzDY0O
	fF/WZlxveS0REOnEfmUW5HGirLTCZQRNY0a50L6czW0eW3OtqSbmtA8w3wWMA8ahhanPjHrzY2J
	Uo4nkqdVQsjeyIKfNeGZ3nmQLZsanfUc3qOvYeaGg1CKgXSs/4EpnwO526pIQ/nya0lz9lnljqN
	9+jqDZgZ0XrFYZNBAIy4ufmur8anQrhGpG/qUxKlOVf5uq+eLR8xjcAR4E9V4H1Eb35+EYQKcfX
	NH+3YBM5VeRSLs4mNWgC70hGETrBMNda3q0Mv40b0Q53t4zSntXsBZC6Vgre+lAJowUEJAQjYCT
	SJlb/mw7c7xLzWxWQRPVfBZBl2JMNKLV4IAL0Hw6f5lZAfDzqUr6RFd7ZYp8CnaOSaDPTH3Eiln
	A==
X-Received: by 2002:a05:600c:198b:b0:493:b61c:72c3 with SMTP id 5b1f17b1804b1-493df099ef7mr41813145e9.32.1783411428606;
        Tue, 07 Jul 2026 01:03:48 -0700 (PDT)
Received: from voltumna.elettra.trieste.it (out-207-24.elettra.eu. [140.105.207.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm37056540f8f.17.2026.07.07.01.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 01:03:48 -0700 (PDT)
From: alessioigorbogani@gmail.com
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org,
	Alessio Igor Bogani <alessio.bogani@elettra.eu>
Subject: [meta-dpdk][master][PATCH] dpdk/25.11: upgrade 25.11.1 -> 25.11.2
Date: Tue,  7 Jul 2026 10:03:23 +0200
Message-ID: <20260707080324.2652858-1-alessioigorbogani@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 08:11:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128058

From: Alessio Igor Bogani <alessio.bogani@elettra.eu>

Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>
---
 recipes-extended/dpdk/{dpdk_25.11.1.bb => dpdk_25.11.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename recipes-extended/dpdk/{dpdk_25.11.1.bb => dpdk_25.11.2.bb} (91%)

diff --git a/recipes-extended/dpdk/dpdk_25.11.1.bb b/recipes-extended/dpdk/dpdk_25.11.2.bb
similarity index 91%
rename from recipes-extended/dpdk/dpdk_25.11.1.bb
rename to recipes-extended/dpdk/dpdk_25.11.2.bb
index e629987..efe2ed5 100644
--- a/recipes-extended/dpdk/dpdk_25.11.1.bb
+++ b/recipes-extended/dpdk/dpdk_25.11.2.bb
@@ -1,17 +1,17 @@
 include dpdk.inc
 
 SRC_URI += " file://0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch"
 
 STABLE = "-stable"
 BRANCH = "25.11"
-SRCREV = "8f56626b51efca87ac312d04bcd90935020b1e7f"
+SRCREV = "27757d03e981a1946434e9bf4c9cfb1ab7e03546"
 
 PACKAGES =+ "${PN}-examples ${PN}-tools"
 
 FILES:${PN} += " ${bindir}/dpdk-testpmd \
 		 ${bindir}/dpdk-proc-info \
 		 ${libdir}/*.so* \
 		 ${libdir}/dpdk/pmds-26.0/*.so* \
 		 "
 FILES:${PN}-examples = " \
 	${prefix}/share/dpdk/examples/* \
-- 
2.43.0


