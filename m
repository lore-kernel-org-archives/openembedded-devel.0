Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB41CCCA472
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:42:37 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.17066.1759323963592894041
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C6v40GmN;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: joao.raul.434@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e430494ccso34098115e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759323962; x=1759928762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cUVIxDaxSVLEuZHiy7XE0DLCXKR28V1M/C7syxjPOGw=;
        b=C6v40GmNjyI9Kh5OOK41nkaKGcyzHU0IVBSxoTfFmEYQtcud6eD6w7w+cC4StAwphk
         11qVj8XcL1xFQ0+aS6rIvH07x8+2LVdIhmUNGTHGvx/3E3ooYn0Q8ZhhCV1MWM0wrnwx
         EI1hPv03XoJHZdriA8HdZqMlApJWEnqn71J0o87AqVAAce338RtC1MVBI/slMyy/s6fT
         TBnabxER0U8kOakCYG+eFvQLkAnbCYNLk7hQJ1x+GsTMrFin8ZDGpbxVxDu2hLo0Q/ht
         XQE3LRqLryLnaueR69Rblo56SnNM4MTlrzHiLq0ozjs/A5OHsm9JAWqBf7445ptD0sMr
         Ef8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759323962; x=1759928762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cUVIxDaxSVLEuZHiy7XE0DLCXKR28V1M/C7syxjPOGw=;
        b=kTEP/+xkhP8LoLn1OeiX4I2lp1lmxj71ulFtbsu2SeWFyaGNVf6XE6qeBEZ+BlXTqh
         V8/isRXCqCUdx8Wwe1sALtPtYHzKZky0ik2qwde3JGseBSS9+x6pYAq+6963k5LpOBgK
         XBZRd4djg5tEmzgGJasiXHAHJa4gFiDZW5Iyl06hIZmo6zRNIANV2oBEuEE/km4ztiBn
         rI1U8hzEA08uOVF8Q6ZDbXL/SjTgLovNxb/Jano6zTe7z5OrH5vlvP7j1mXuihe4Fud2
         jcYHWFCxl3bzqaqSCakp0PhrX5mfq5tAqs2ckJhQfohuRTxHBIMRH7AzpsLFUsZOOSHF
         s/UA==
X-Gm-Message-State: AOJu0YxGIWZD5bXykRAKMpmso4rudQwx0QEPgZg/XGepp1VmSHQKTrLO
	6dBMmbRgDTlH8IwJaS1rO9TzCO2veXsgIju3UgGQdOERT7hCKfvUGgMOMSA/xk2N
X-Gm-Gg: ASbGncvufqiP4MvHFWnjETGahQzZErNign41Jrl0+8TaJ1MAecIo6P5OjuPLXDaIEPo
	nW1Z6lJRLLJgh62JWFpLQ2CsAxJNkMuneLGmOTtU5aaX/wkQnAyP1WsMXQvoqwj9lWh6zq8eCCf
	PQiGZMht43Kvw2luhmtVvUe3OAP68y6cPYnzErkBAP0cfIUh/u5mEvQdGee1j+uzN5oxBerNlQn
	JLYtj64fjIQzuLyoHfBy3gokIRVrogO8fmBXPKFLdzDzNpkoOCmKEPdmPRY0IHndKBaHkER3cpB
	ycP7D6jpIpr4mHE9HizeFs27wCn/PIOwNQ5gCBnJBD5DI6rumu0ewZNQtO1odCZWDGCycs62tY3
	J+uliihRuWFeNUjAzIP1OFVT/2Un3SPZN0sF2Di+sTdghrDwGboz6fZR3frCkgAeQOA+5PF/Qwh
	5i19JtolNFtbFbS677/TkzzgHbCjeh81JE9h0M19gLJx/AlQ==
X-Google-Smtp-Source: AGHT+IF5jpma3/8L9Yb45M2O2QOkLSwhLtlyXPAQY8hvCUElXLEP/mt9PQ6PswcLZ4r6TlW3VXgO7g==
X-Received: by 2002:a05:600c:1da3:b0:46d:d6f0:76d8 with SMTP id 5b1f17b1804b1-46e61293b8dmr30637205e9.35.1759323961373;
        Wed, 01 Oct 2025 06:06:01 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e619a8ae2sm37345405e9.15.2025.10.01.06.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:06:00 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com,
	joao.lima@hbkworld.com
Subject: [meta-oe][PATCH 3/3] openocd: enable dmem and jimtcl
Date: Wed,  1 Oct 2025 14:05:53 +0100
Message-ID: <20251001130553.686-1-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120112

From: Joao Lima <joao.lima@hbkworld.com>

Build configuration:
   - Enable dmem adapter driver (--enable-dmem)
   - Enable internal jimtcl (--enable-internal-jimtcl)
   - Add both features to default PACKAGECONFIG

Signed-off-by: Joao Lima <joao.lima@hbkworld.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 846d2f62c5..b39ca5c244 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -55,7 +55,10 @@ FILES:${PN} = " \
 
 PACKAGECONFIG[sysfsgpio] = "--enable-sysfsgpio,--disable-sysfsgpio"
 PACKAGECONFIG[remote-bitbang] = "--enable-remote-bitbang,--disable-remote-bitbang"
-PACKAGECONFIG ??= "sysfsgpio remote-bitbang"
+PACKAGECONFIG[dmem] = "--enable-dmem"
+PACKAGECONFIG[jimtcl] = "--enable-internal-jimtcl"
+
+PACKAGECONFIG ??= "sysfsgpio remote-bitbang dmem jimtcl"
 
 # Can't be built with ccache
 CCACHE_DISABLE = "1"

