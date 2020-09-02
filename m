Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.15399.1599072275989228700
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 11:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BiYHdoEZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id o68so147268pfg.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 11:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r+Dbg8uf6vcLA0agNXUqEar6xeLseJRrX9m979Q22dI=;
        b=BiYHdoEZBV0P3qsAEMQzPiAw8xzqt+c85gwL/xrv59LXrHreaJUpkseHzIEwDKv75n
         LCHOJOe7+UDe9ORrsTKj101iv7LO10hNjrUQ74/UDcwihRjzaKcoaLeS85n3RzC67QG6
         fDY4KtGNpNlQMGxN4Y0Ipsz1xqia8eGVlkw+vEQZICix+tUCfeYgHeDNLyFghhkDhkcA
         NTHtS9EJXfEivqUCEke/gvEcH+RMazc1qRd6ftowN4lNEIdI4wJkMw/atcNikS48zIrL
         JrrKipcIExCwUhUrJc+8SvBgaAVoaxhtCZNsXTczr/nkjp4EUUNOFITUeZW6t+bkN1Mn
         1dcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r+Dbg8uf6vcLA0agNXUqEar6xeLseJRrX9m979Q22dI=;
        b=lHG1QwJHxUOVNedq6ktA3nDD7uwpKBF+sUThAqFCKcA/OgLOtwGm+63ZERYMCcje3F
         4etYbSZKdpT6NBzilzFzICdL7G5eK+mmTz+qYht2+xAiIZMPTIRG+FMh5S6JRfIzv46F
         ti+1m0sDxMKv9ez/LWCCosQMxe6puHjnCMLce4OxOWIRYyk3G6AUzU8t5KM2l1bYDcdz
         PhbQ3F/yh0wD7Cp3LerV0lMyAmzZR/3XZmWc15IPDYImg/F4uA71in17sA0lxQkWRxsf
         F6C0M6KiGJCWcsBzWRNlxYvXSNnoWbjRBABcu9nypN5JPm7NewTmtJtQJXL352FJxiG2
         Gfaw==
X-Gm-Message-State: AOAM530akmlsuKbqS4UZjTIT3NAFDMv6Nm8bR2Vh1vAL/KGVKxDrht3w
	Z8SKWdkJz4i3bd3639rQF3zZZXPcQzS66g==
X-Google-Smtp-Source: ABdhPJzsG+mU/wNXiXD1+8Gb4DVq034Dk0zYX8ByKc31k9du4kKnWAUm8qCNZ/K2hpejgzAiIIxQBA==
X-Received: by 2002:aa7:989e:: with SMTP id r30mr4399896pfl.205.1599072275214;
        Wed, 02 Sep 2020 11:44:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id x12sm126813pjq.43.2020.09.02.11.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 11:44:34 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] packagegroup-meta-oe: Remove log4cplus
Date: Wed,  2 Sep 2020 11:44:30 -0700
Message-Id: <20200902184431.1098556-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902184431.1098556-1-raj.khem@gmail.com>
References: <20200902184431.1098556-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

log4cplus is now in oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 55d623d95e..b784785416 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -250,7 +250,6 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
     ldns \
     libgee \
     libsombok3 \
-    log4cplus \
     lshw \
     luaposix \
     capnproto-compiler \
-- 
2.28.0

