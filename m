Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 132BCCCF9EC
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 17:57:56 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.26.1761328673620732332
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 10:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b7tKP8sm;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-471066cfc2aso21285885e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 10:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761328672; x=1761933472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIPYasjmYT1SFQ04vrzUA18bPLhxQu49C4+R0wqifWQ=;
        b=b7tKP8smUh0TOje/3jXusj+OjOxGEiE6QK3hDdpig5CVPaU3082O/oOpVHVmG6HFvH
         LtRTAtjoaqoDVmoa83iYEUq1EGwPjuUP0Tg0xx93aezfSI2IjfoGNNN/MpyAxfv6Z5nv
         Iy/dGK6DWD0hvlfZ4g29IdEqtx10r97L/B6rArvNR6lohu7snHS5TzdgLvVt5krWI/Aq
         PwqOCE0g2Efy1P9/2u/9jhTbL1CsFTA6FnltB3g1f1b2ClT3bpXjzrOd3iaUFQvKifvR
         qOYXaAMmtN4nPed0bagtZD4NWbV4YP4YgNEDQNIj8DWz7QF1PQ9a13x49xHlgKuP/lUu
         ID1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761328672; x=1761933472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIPYasjmYT1SFQ04vrzUA18bPLhxQu49C4+R0wqifWQ=;
        b=uZbaZUr2ca9AySgbJUJseozlgHdeq18BtJy8ymdLz8wS808gWFg+Ty7BytmRdpKjOO
         vmT/VittRUfDQS9ZQnq+vCLlurPHaIiKCD96BSKa2KEuLH1/Dq655M7djTBiF7RixExI
         Ik4h27bJWahgrMPsA2f/w5zQSt+rDwBhm0Wu7EpJaCAUQdVKevwR2A9AdfseKGePCnAs
         HRMBTUjm4imV0s108kF5EvAiuYRXIeModCWzk7QyVaWSu0dM2HN1ooVH+8d1zzw3K4Fk
         9llwWQ79MecSdNrekcZD2C66Aqj6KJgBDAyEFWnfE/rz86+kJ15W7huV9q5Zd+4+7Ur9
         hrQw==
X-Gm-Message-State: AOJu0Yzx7AmCyvR+2/gn9GTOchnlXcwpoZPTDfU95YdiLwBCjwg0+8Vn
	JRkEL6GOQnRqhG5THpbxGP4ooWcN535Z+STS0cDx4fhkO492G+FFM1Fxok8pxw==
X-Gm-Gg: ASbGnctaR39geLGdR/FPpBjDujuWqUAQ+hgbBg5cBnESui+bn9diEuV2QriH1Wgbg7L
	YtCZPsbM76lSr/B39s39oJc5WGzgXCbccQ+qlWHbB0oFC9AW3iLZJLGeT5FjpHk2VfsMBzGrbhw
	39G4GQQMMAKluXlEbx95rNs8BPv4I9K0yMg9UamWAUUgEpUKMJRnKCxQkj2IWEYP+ks7E7NkmsM
	0PYL1CO70OQzi+iqK77zCGtRIAyedUgEUY+/BZpGmWb3VGZ48/DCvyFg+SVWppUC0BzR3Vi0WBJ
	1ljj7sBtlT+y01kfxZupJ4tGtm2pl5QGqQg0cj+XCxqsuvgPOFXb+tzLKgzAmwopMvVOSdeQT47
	xzyXui4dbvG77jA14atwfdlgP6KJVOlvlag/oYDI9vo+1Q7BHH8GaTVvzZPa3OcfM+0I0BB0OJf
	HUoWalOCq+
X-Google-Smtp-Source: AGHT+IGrgVaojxabtmOuMRieHGATvgALLlQwbN92LqeKnadOnNim7J6w+03IGSvoBSljLZxX7eO6gQ==
X-Received: by 2002:a05:600c:450c:b0:471:15f1:a4fb with SMTP id 5b1f17b1804b1-471179036f2mr221732355e9.21.1761328671956;
        Fri, 24 Oct 2025 10:57:51 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c43900e1sm192686925e9.17.2025.10.24.10.57.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:57:51 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 05/11] libdigest-sha1-perl: fix ptests
Date: Fri, 24 Oct 2025 19:57:41 +0200
Message-ID: <20251024175747.704498-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024175747.704498-1-skandigraun@gmail.com>
References: <20251024175747.704498-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 17:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120963

Add missing dependencies.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/conf/include/ptest-packagelists-meta-perl.inc      | 2 +-
 meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index ce62e92c2b..751a22c708 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -16,6 +16,7 @@ PTESTS_FAST_META_PERL = "\
     libdata-hexdump-perl \
     libdbd-sqlite-perl \
     libdigest-hmac-perl \
+    libdigest-sha1-perl \
     liberror-perl \
     libextutils-config-perl \
     libextutils-installpaths-perl \
@@ -34,7 +35,6 @@ PTESTS_SLOW_META_PERL = "\
 
 PTESTS_PROBLEMS_META_PERL = "\
     libconfig-autoconf-perl \
-    libdigest-sha1-perl \
     libfile-slurper-perl \
     libhtml-parser-perl \
     libmime-types-perl \
diff --git a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
index 350bad3ea2..5742785f08 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
@@ -19,6 +19,7 @@ do_install_ptest () {
     cp -r ${B}/t ${D}${PTEST_PATH}
 }
 
+RDEPENDS:${PN}-ptest += "perl-module-dynaloader perl-module-exporter perl-module-test"
 BBCLASSEXTEND = "native"
 
 FILES:${PN}-dbg =+ "${libdir}/perl/vendor_perl/*/auto/Digest/SHA1/.debug/"

