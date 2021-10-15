Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE84C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 05:11:09 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web09.5597.1634274668888790992
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 22:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZXUcJmP+;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id y1so5659848plk.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 22:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5cQpmjEBCASMCX1yfrv8fxc02KrriX8I9KxhMWNboZQ=;
        b=ZXUcJmP+VO8myBKV0H28XXLTAh/PHgS4g6n25eS1euC3hTUxqyhl67UuHOiandiAVX
         Gx0N9jTgI32kHTszVtokLHti1wR1gCaT3Blv9SJUKysXLae7rhbvSynvHwgV+hPmGLaB
         J7slhscuGSaudhjgd5pxweab4/lmo1bXgy9gJm48UfYw4qphFs7nkxHq4uGSQ4aDX4rA
         qJiDNq5gc5ipIwEuyiEzbkv57emT+MjBhY9zhUed4XVLBStlbG+WA93YQJSwNhMcgQpE
         ni2Gjzmk1XICFV7GAarK9FR7XAytnlJU44MHftYPxSNWA6+5pFJJfAzLcib4ZNxRwNWo
         iQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5cQpmjEBCASMCX1yfrv8fxc02KrriX8I9KxhMWNboZQ=;
        b=vCKmyrv7oPiRBsg9GmTJ+H1q6v8lRU2uMOUJ45I8KCIZKtFyQ97pbRJzjzAya44H13
         WfAAKAz6ZBCg5Scxdm5BrLWMF2ih0evvKG77vnhKPOi4kLQdQFEomXF4dgXo/Bmo4nAD
         RMNS3VSYP7gI5jfFVo1HK5m3cLJVeu7Z8TGA+Hq/q4T78uVZxqBBuQuPhYl1vQWBuSw9
         Y48fMnW8KWAiqgXoKhDKYjzbZlm5v6DPGagADIuiXgDbzpTHXumilAm0RLRkpQkXqITH
         VFUKGdlruTSgocirwGMvlyTr/P+doGLtYt7wyYgJY/cu53LWiHwpieQU9fYk+qxdJMW8
         jm1w==
X-Gm-Message-State: AOAM532zCX21PbBvoNqVF2NzRGjXCP3cXJX6sF1XgVH6SN01NOFK2QPN
	McG/mrPT+GJ/lvK1lHKQY5Mag9EBNgOOBw==
X-Google-Smtp-Source: 
 ABdhPJyA5KM4DlVOKeAfLluhE35anCob7jFbFJqj7LRRq72VF3btUBM2AJLXoajzYPyCV7Siw5c8XQ==
X-Received: by 2002:a17:90a:4b47:: with SMTP id
 o7mr26129594pjl.198.1634274667995;
        Thu, 14 Oct 2021 22:11:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3fd8])
        by smtp.gmail.com with ESMTPSA id
 i13sm3936220pgn.69.2021.10.14.22.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 22:11:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mozjs: Disable JIT on mips
Date: Thu, 14 Oct 2021 22:11:05 -0700
Message-Id: <20211015051105.2988337-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 05:11:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93323

Fixes
error: static assertion failed: MIPS32 jit only supports FR=0 fpu mode

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb     | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb
index 2f72ff8924..1346cf5879 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb
@@ -31,6 +31,10 @@ export AS = "${CC}"
 
 export RUSTFLAGS
 
+JIT ?= ""
+
+JIT_mipsarch = "--disable-jit"
+
 do_configure() {
     cd ${B}
     python3 ${S}/configure.py \
@@ -39,7 +43,8 @@ do_configure() {
         --host=${BUILD_SYS} \
         --prefix=${prefix} \
         --libdir=${libdir} \
-        --disable-jemalloc
+        --disable-jemalloc \
+        ${JIT} \
 
 }
 
-- 
2.33.1


