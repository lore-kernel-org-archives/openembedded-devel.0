Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D0BC5DF89
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:37:01 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.830.1787117818796747749
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ViK6hCEZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cca0c5799eso5615765ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117818; x=1787722618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yubk550zwheiR7k2K5VA1Doic8e9eSmwTGEq+mpWVT8=;
        b=ViK6hCEZzAiPO+6KqDb0gmDiEN2RQken6PQv/PYK2TQ2tWKsRWOt/+c8NfT2CaeWK1
         Zh+KrcNKVcBB+QmiX/bXts22j0WxLWFjgWmJY3cDn4Wv2i1kkONCcfOGktmOiClIopw3
         ArBGfvv0IN1XqQ6NuP/8V7o5r4aHTgQmobd90KhlGLtBxNndYyRwd7i7BVv/ynG+8Iqo
         14WICOPf2GEmfKRRKfepL0LZdN1Vmiv+2BAAGqcdF1LDkU/puHgXosdvNZdtmfk3fuY6
         3ntqVAnguRSu8uqVW4ymwAGj1mOr3YskEbx2UjPhsE5BipCiOdOmlfwz7aE+v2wmqDc0
         +jRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117818; x=1787722618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yubk550zwheiR7k2K5VA1Doic8e9eSmwTGEq+mpWVT8=;
        b=R4fjOOyYPc2/HBeSbTl0loL0Ieu7/tqgSZg/f9X6Dgm/9Vrnl7WG67+6vMZj9J6cHB
         tJPXfQNoYwY+Dru1EffrYGAFK7UWXvjw9MgctEsF0G62L75IQpeJEX98J5YXce1kkVQM
         n5n+zLKv+0O32lhTjD83vqQYJVMNpLCJJX+ntvK74lxoqeI4GI9G5REXgGt5bL3lVBV5
         lQjd6GWBYpYaTBb5M0B7pqMYFBah4KQ8m1nkt4C3jbEjeipp7/wOEiKOueVwT3rR5PQ6
         txKyQ64yxLTxTDgk9x5UuYTA4jODy3gkEZN/z49dx3YUSzCZEbTumFSV2ZPmqxiHeyUm
         5BgA==
X-Gm-Message-State: AOJu0YynEAFiFhuoaJ7iChZEveX+DjSGZXAYWTILLMJ8j9oFY7x+967g
	8W6jkVZ3/6ZZI1cutkNE/Tj5KxRonWHoOIPWaQ0mleIg/l90FAip79TQNuyJUQ==
X-Gm-Gg: AR+sD12bvvS+Pg5A4ffm1XHMF3n3kmmcuKNPLXIQNQUtYYL+RjJguuz1RjjryDeaPHY
	zbCDWoWWRm3aT1ptw301irx4CDQMYyVrlhZkbG8ketNd4YGW2ayYsy87mX98aOEWBaefrn2Qg+p
	i5nbt5U5INnafVNnXbIfFdlV9E7bMRyHJX2k99rTmvRBu9KcyVuMrb/kpDH9LAH+s8hEoOhAf9t
	AjwsMxQp81t+vQ7Vq3hyTAAQd7z60qKiKgahHHhiN4Vov+sVS3Ud0DgoZheiAyFPhcgdLxzFb3A
	vr0dIRA6MskH2rN/CtXEEGMg2HVZujKm0b+WCiBqDMSfznLHG+oFtAa8Ab61IhXfvlfrd+cvD2y
	i7L3B0RP/e/iJzkp7ya0SK369xE3HY4mZdr1bN2OK2M/Pso5DLOqLTT1D27bamdkjcFLRCgEcxV
	YzMe1iTvWBoIMrzNCah/RhexBFsELQ+AwLJb33R5jwlWfMpRRwlSVPUjOIQvsYVUPvOwnr0QZR+
	g==
X-Received: by 2002:a17:90b:28cd:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-395812a8b7emr4261363a91.6.1787117818109;
        Tue, 18 Aug 2026 22:36:58 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:36:57 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 9/25] ramspeed-smp: add UPSTREAM_CHECK_COMMITS
Date: Wed, 19 Aug 2026 17:36:13 +1200
Message-ID: <20260819053629.391864-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129253

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version ramspeed-smp
...
INFO: Current version: git
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-benchmark/ramspeed-smp/ramspeed-smp_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-benchmark/ramspeed-smp/ramspeed-smp_git.bb b/meta-oe/recipes-benchmark/ramspeed-smp/ramspeed-smp_git.bb
index 1e55bcf87e..e13ce26ae2 100644
--- a/meta-oe/recipes-benchmark/ramspeed-smp/ramspeed-smp_git.bb
+++ b/meta-oe/recipes-benchmark/ramspeed-smp/ramspeed-smp_git.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=92cffec6695a20eab8d0e4770f4e9353"
 SRC_URI = "git://github.com/cruvolo/ramspeed-smp.git;protocol=https;branch=master"
 SRCREV = "2011a256caa6a0ccdb88cb8c6b1e69c8f782b729"
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 do_compile() {
     ${CC} ${CFLAGS} ${LDFLAGS} \
         ramsmp.c intmem.c fltmem.c intmark.c fltmark.c \

