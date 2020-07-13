Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.11814.1594608981367748372
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 19:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IpYns65j;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id x72so5376808pfc.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2020 19:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=YVEMXIlJtCJYGk2OcsL1zApx+uM5D1J04tWtdOEfCH0=;
        b=IpYns65jZOmI44pSgTh6NceAqjquRlZ2lbpK7OX3BBsHG39+GgYqHQcx08Vd5sd/O9
         ebxk5uPwur9HsNBrdkIZj/7wcbfAl2vMhbgOAlFUGyIFSiBzC5CEhNxslxjrY60gej5Z
         8LP2audsjXOLxsaRBcj9BvD+IO6C6NM2K+V1Ucwot71btR4QSmMrM7xnDxCTQVTiql1y
         e8bI41tmf+NHspv+tKWU73tAmxfyNO97cPjQXoVjybJPhX7mO6Ao98sZY+52rjQy8Hby
         E41/m3eDDdX4evMRsX39c12TFBl4Z21CRNjk0mpYk+6F1Z7yuUUsxQfsA7SBbJHQ130h
         T2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=YVEMXIlJtCJYGk2OcsL1zApx+uM5D1J04tWtdOEfCH0=;
        b=k/OkFhjldJ/MObU2xew6suAKB7MCTOFE/yhvPJYkHPqIZvNIkhkksh41WzNITw+5KV
         HsP61r00SvGJ7uvO6Qs1zUoc0U7gC5RIufbX2HAQzOIx8EYvl9WC/s5M1MkeWZWny5ia
         TItdsnJk8s/IDA/pa7lPNji+qpbS6/VaB2LmiQhWW4z+fZBAIPSKzCtxUz9fy4i36AvM
         Kb4lrvJ0y4ii6BzFp2hRK+XeYiqzdq3baHszdddW/VEuUT5+wbf4cWs2Dp+y2a3dwm1w
         wcKTlfVPqu6dDRr3aNNcTpOns5cL9sj6KBJ9QawfAuwr3RivI6SyzTB8rQurPuER1ey+
         61Xg==
X-Gm-Message-State: AOAM530ek5SjLE/5u1kMfospJpa7IaONn09RA2gtFfWosXGNVlKgQDHQ
	tDmqvmc7DAN6obGl0XwO/rJzwgvm+Ls=
X-Google-Smtp-Source: ABdhPJx8VLmP3svxJA7IawJROd+0QQNO9c+ZERonXw6VnNVeQZaRuxk0QjdXkmio/w7Y44oIQxjcpg==
X-Received: by 2002:aa7:9a03:: with SMTP id w3mr2454339pfj.228.1594608980744;
        Sun, 12 Jul 2020 19:56:20 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e013:ddd8:d9b9:dad6])
        by smtp.gmail.com with ESMTPSA id u19sm13687976pfk.98.2020.07.12.19.56.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 19:56:20 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 03/18] nss: Remove mcpu to avoid march conflicts
Date: Sun, 12 Jul 2020 19:55:59 -0700
Message-Id: <1d5fe0c17d2e7ea98fd14935a28d600a61e3965c.1594608813.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594608813.git.akuster808@gmail.com>
References: <cover.1594608813.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Some files are compiled with armv8-a+crypto and when using cortex-a55
the deduced march is armv8.2-a which then conflicts

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/nss/nss_3.51.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recipes-support/nss/nss_3.51.1.bb
index fba80ce2ab..36e6cd8fc5 100644
--- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
@@ -47,6 +47,10 @@ inherit siteinfo
 TD = "${S}/tentative-dist"
 TDS = "${S}/tentative-dist-staging"
 
+# cortex-a55 is ARMv8.2-a based but libatomic explicitly asks for -march=armv8.1-a
+# which caused -march conflicts in gcc
+TUNE_CCARGS_remove = "-mcpu=cortex-a55+crc -mcpu=cortex-a55 -mcpu=cortex-a55+crc+crypto"
+
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_configure_prepend_libc-musl () {
-- 
2.17.1

