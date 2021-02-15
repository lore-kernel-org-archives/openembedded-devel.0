Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.25705.1613351618902639521
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Feb 2021 17:13:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dGh3yB/l;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id j12so3205968pfj.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Feb 2021 17:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=23neqUXoxuQ8mobAJ9jgTUQcnTJHA9VtisLp8n7X1JE=;
        b=dGh3yB/lY52fZ6M1CUbVt44tkgrsUl6966AulTK+l/tqzgz+34BCz4gAHD1JM0GsV3
         l1GVPgIRmnaRrk+Y+DywaRVL7wvWAWToFNmbI0ycGINYKxFUgbSrUt28rq5v/Z52ZRgM
         KOx9uV64ZrxTfHI8p4Wi109bHj36xnsupCRVMpIUZRdbFdPi0z4Eo73FxAms1YfZwW/9
         i3LkNnPjonpkwf03bnvNaS+h4ir4Huk+z0MzLqCKFtw1RG+lUPmGoGsCS/3Bys3qzC4o
         65WlD3csv4wbUM1E3Tu8kUR1ALlBXows1S6VScy+3jvLs0vRw1mocF0Kg7qSYxUkbb9/
         bpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=23neqUXoxuQ8mobAJ9jgTUQcnTJHA9VtisLp8n7X1JE=;
        b=pfObOHX+BWc3KB+nkUw3s4zgSoOhM6WUmjmst2KwzeLYzcydE8y6uc2jmd3JaSfOHd
         YzezMwfvkU1HNRJ5beh+8k5n9Rqsv0J6o8hR1Lc7HFP1kjaKKiEIn6OpkCVpBc6Cd+6k
         AYq+uRYElL0rgUciaAvX+3t67A07D8zEAIWXKenH8VvqaKZdteDys2vPnPifLwdW5U9P
         tpGGG/3dxytE8dT6OzejTelzYdnYQIyXGWZBe/f/3hFHvRAth0bbcCeelBhQ9u9MX6JR
         NrK7iJboP3F57LP4wxdVU2tDqbWQ4n5Jrrtu2NTMzeJorQ1OuLq91slKmsB76RKW0rFT
         wcAg==
X-Gm-Message-State: AOAM530weClmcK50nyehXyE/eRZOomlIcmkKtVVRE0gjpV/3fkAw7FQS
	A3c3tsng6fGt89aFoWMschFbLMZaFDCG1g==
X-Google-Smtp-Source: ABdhPJxEnmK52jZHtzGC4KiN5DDxuGnhXD0qVFZWyjEwqKjvc+1H26oDAaN/IxVScg/u/x0bw8+HOA==
X-Received: by 2002:a63:af1b:: with SMTP id w27mr12647605pge.162.1613351618371;
        Sun, 14 Feb 2021 17:13:38 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c8b8:7fc5:a225:bb8d])
        by smtp.gmail.com with ESMTPSA id t1sm16077998pfl.194.2021.02.14.17.13.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 17:13:38 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 04/15] celt051: update SRC_URI
Date: Sun, 14 Feb 2021 17:13:18 -0800
Message-Id: <1de0f4c33b92b9bbd885044df505154c177db59e.1613349480.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613349480.git.akuster808@gmail.com>
References: <cover.1613349480.git.akuster808@gmail.com>

From: "changqing.li@windriver.com" <changqing.li@windriver.com>

original SRC_URI is not valid now, offical CELT repository
moved to gitlab

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5450c958bf66afd560fd8dff5b432ea71f10165c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/celt051/celt051_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/celt051/celt051_git.bb b/meta-networking/recipes-support/celt051/celt051_git.bb
index 12b9124f74..c3e4cbbe6d 100644
--- a/meta-networking/recipes-support/celt051/celt051_git.bb
+++ b/meta-networking/recipes-support/celt051/celt051_git.bb
@@ -16,7 +16,7 @@ PV = "0.5.1.3+git${SRCPV}"
 
 SRCREV = "5555aae843f57241d005e330b9cb65602d56db0f"
 
-SRC_URI = "git://git.xiph.org/celt.git;branch=compat-v0.5.1;protocol=https \
+SRC_URI = "git://gitlab.xiph.org/xiph/celt.git;branch=compat-v0.5.1;protocol=https \
            file://0001-configure.ac-make-tools-support-optional.patch \
            file://0001-tests-Include-entcode.c-into-test-sources-to-provide.patch \
            "
-- 
2.17.1

