Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FB0D5B85D
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 00:54:47 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.8870.1730163286392057602
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 17:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IJlv1QBW;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20cb47387ceso43984725ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 17:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730163286; x=1730768086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jI1w4X+mwPA18JV1pHGJZzd3xx49HIrqIkgJfFeqC2Y=;
        b=IJlv1QBW2JltG7DHkwmO/5pkRCCYcBxP/heLhp9k8Jlh76bzYAkebLCDQ1eD1lAMiO
         2aroG29ps+cg7QleKzfu0CjE/XLApioLpDmeeyV4X29eD2F75vvzBrxpKCahm8zWXi6g
         uunlLWwbAttXUb+qyQhiT1Cs+0xX5oRYnlds8g1mHvX49Ie7wS1Esck2j227tSkL27OU
         WJI3JYDCDZFLbFgsppTiSh/TGVxmbMm2iLZe7ZKKv7402n7sIb30p06BopJ54AFVrEuw
         J97B0za+ZCneY2LjEtOIyPX6o9QKWxXyIVawfzlWAFoY0wf6kuyObqksemsmVse0YSgV
         +YTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730163286; x=1730768086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jI1w4X+mwPA18JV1pHGJZzd3xx49HIrqIkgJfFeqC2Y=;
        b=V5AK+ixLNTTxRbF09ug/R6g1oFZBqB5z/71ItdqI+9sa75ryeEmIcv/pHgWM7RVWwy
         vjbbz0HUN+hc5yoCqkByK3iZHHEzSsfqpthV6eOMcBVGSjsH6T5NRg+AjaWPLrYbu1Ei
         BMNfKYEbzT/BK0l9G0nvxTdPB3jhpOgSpBWGjdvyxvhO9m8P+X+6Qn+OXLKP8Soj27rP
         LgQpJiDKtgsL3W2ll2in+PffFTRMWEAKHMq+LItMMkCpP+pbz6r1hKXdpKZsqfY5haes
         MGRt9nmNtVO9NB4apN/608u+7ZkH0nSjakWpGMVuyOuKIxT15DLfKWZtsEh9Y0Sski1m
         ysvA==
X-Gm-Message-State: AOJu0YwjIIEQWe+sfRK62CT1Nepy9BpmTO32LdJEwr80LACPugYm5E+N
	nGDYJ4BD+nFEc6eL3lPEyqLUuQDKvV2+7MxmhTJOLn9KPTCiZHGCsf+x7yGr
X-Google-Smtp-Source: AGHT+IG/35dqdwQV3LvPUcc6W21TVZni7wqOYHjKV2qzkooFYRqVB4nA0Yd7vBhnEYj4d5AMWdyF7A==
X-Received: by 2002:a17:902:e843:b0:20b:b39d:9735 with SMTP id d9443c01a7336-210c6c823dbmr159070145ad.54.1730163285607;
        Mon, 28 Oct 2024 17:54:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9a1e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc082757sm56331965ad.290.2024.10.28.17.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 17:54:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/3] python3-wrapt: Upgrade to 1.17 RC1
Date: Mon, 28 Oct 2024 17:54:40 -0700
Message-ID: <20241029005440.3916916-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029005440.3916916-1-raj.khem@gmail.com>
References: <20241029005440.3916916-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 00:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113316

It has all the python 3.13 fixes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...{python3-wrapt_1.16.0.bb => python3-wrapt_1.17.0rc1.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-wrapt_1.16.0.bb => python3-wrapt_1.17.0rc1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.16.0.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.17.0rc1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-wrapt_1.16.0.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_1.17.0rc1.bb
index 398d2fa6b7..636d677555 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_1.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_1.17.0rc1.bb
@@ -6,12 +6,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dc34cbad60bc961452eb7ade801d25f7"
 
 SRC_URI[sha256sum] = "5f370f952971e7d17c7d1ead40e49f32345a7f7a5373571ef44d800d06b1899d"
 
-inherit pypi setuptools3 ptest
+inherit setuptools3 ptest
 
-SRC_URI += " \
+SRCREV = "75f291f8bf1fe6535b13b0b3dfedca012ca6c8a5"
+SRC_URI += "git://github.com/GrahamDumpleton/wrapt;protocol=https;branch=develop \
 	file://run-ptest \
 "
 
+S = "${WORKDIR}/git"
+
 # python3-misc for 'this' module
 RDEPENDS:${PN}-ptest += " \
 	python3-misc \

