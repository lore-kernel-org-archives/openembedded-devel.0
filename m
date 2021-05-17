Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.19748.1621261517617064600
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 07:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=toE+RbaK;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id cu11-20020a17090afa8bb029015d5d5d2175so2970374pjb.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 May 2021 07:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=LX58ecUQfpieNCt94AOllXrKTzjptKtY4SBVZz7owQ8=;
        b=toE+RbaK2UcbGAQC06+++AKYBzadsanV6PPfFWCeEmqSANMNMzKQ8EnhDjmowuxNfB
         7cF2V8wpPvr7s04Q/UuBEFSo1gvUyNADp4yKStgrBJRGQ8iFYfptcN+8sRjsfNkQZkHi
         DS/5KH+Cc8CGu6CyUBd+LMM2yk7sKnDj6uXTStddeOoIqFANE8+GJu6ZQ/ivPl/jzoN5
         JruiuGec0DTA6NFv1Rqto8z78c3y1oz+ZTOr1nF7wdunC+5cT75bV8RmphyPBNBsNKLv
         JbSSIx6fMxixDek/3dgDCdX8U/ugsGSq3B9f12SaG7DCC5XnyI46Xx4SrztfLeQ0zZMD
         00lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=LX58ecUQfpieNCt94AOllXrKTzjptKtY4SBVZz7owQ8=;
        b=mX74U6IiGlt/IXJUAZkWXVX8qLYtJgHnTPuoo4LsPV+y6wLE0njSVecsIgGewlT0P5
         +aaooChlzfczQqugRQtx9MAnIN8W3xHu6vHT15l2yLwRKR8MZd243IkrOGMUeeLoedF2
         DZsa0w/BpvR9e+daQKq99tLSOYtICpQxjCQjodJKKfmInjhAS0rH5+GwDIQnDLKRqj6u
         39VWurPuUWwZP7hf3HkMw5301ZrVHDxYJTIummPi0pxxqguW0uXGlSEDxNemOe3Sm9hK
         6Lo6N7U0g0OEeM8QJgB1qRi/iwBsTDtaNB9jDmEiAJqvZstbsMiVwVqfOpr6DX62kMI5
         rXww==
X-Gm-Message-State: AOAM532ykd1Q3w/VauW2Wipu7bISDWeYiUXiQAjJM5qYjp0apjHr5XJf
	0zTbPeGPAPNZaHU2ChFxBRTyAnPjd0E=
X-Google-Smtp-Source: ABdhPJxwIA6cbZQrtGRk+uhMayWXk5tBTbBkWamfE/VpiLN2Wx0LBgVA/hYlL1qSSQnmaCBfjTRusQ==
X-Received: by 2002:a17:902:7407:b029:ef:a78c:a385 with SMTP id g7-20020a1709027407b02900efa78ca385mr285513pll.16.1621261517000;
        Mon, 17 May 2021 07:25:17 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e1a5:920e:5720:62fe])
        by smtp.gmail.com with ESMTPSA id s16sm10872008pga.5.2021.05.17.07.25.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:25:16 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 10/11] packagegroup-meta-oe: conditional remove tbb for powerpc
Date: Mon, 17 May 2021 07:25:03 -0700
Message-Id: <360eec5a843b3b8c9751d248e248b353fe13a35a.1621261426.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621261426.git.akuster808@gmail.com>
References: <cover.1621261426.git.akuster808@gmail.com>

From: Saul Wold <Saul.Wold@windriver.com>

Since tbb has a COMPATIBLE_MACHINE entry to prevent it from building
for powerpcc, let's also remove it from the meta-oe-support package
group.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 564f7219544401b9bce545181a7e22000d3f7d40)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 59908e2c0f..eb095a2374 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -921,7 +921,7 @@ RDEPENDS_packagegroup-meta-oe-support_remove_arm ="numactl"
 RDEPENDS_packagegroup-meta-oe-support_remove_mipsarch = "gperftools"
 RDEPENDS_packagegroup-meta-oe-support_remove_riscv64 = "gperftools uim"
 RDEPENDS_packagegroup-meta-oe-support_remove_riscv32 = "gperftools uim"
-RDEPENDS_packagegroup-meta-oe-support_remove_powerpc = "ssiapi"
+RDEPENDS_packagegroup-meta-oe-support_remove_powerpc = "ssiapi tbb"
 RDEPENDS_packagegroup-meta-oe-support_remove_powerpc64le = "ssiapi"
 
 RDEPENDS_packagegroup-meta-oe-test ="\
-- 
2.17.1

