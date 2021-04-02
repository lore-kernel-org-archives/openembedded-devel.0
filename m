Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.10589.1617328733114076904
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Apr 2021 18:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Slfi2C2C;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id t18so2049788pjs.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Apr 2021 18:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=c50InpqN8UbBkS6qDvAqrTto4+nS4UyHU84QaFEj+SI=;
        b=Slfi2C2CJRaTLw+sMCN460uLzIVTDpp+ZPKLU9A3drmoszqnQZRBPoIcu8bsA5zb7w
         szI+LjBaRQsTr8n9Ze4D4lklLYq9oIlymK80iwZu8+EFOz1cfdCG6lwjdjUpkAPDCaLk
         z53ubgMfG8JRShPIJ390wJjk7fr8AqiiX5Xtz8E4baGXy85YUvRBP36KxMzb7yLzAI5g
         Otr9fY0xJbPTz5MhUOpr8v7T2WqyaAM04GLJ6t5kpf48BIM3jCEuEnbazmVgmbOCr0z8
         uujeFtZjzTGML8sqnJW4wC44UjV2BJm/S4BE7AsqSvOIITpdFyQ0PSM7YbqaQEF5yrvr
         pnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=c50InpqN8UbBkS6qDvAqrTto4+nS4UyHU84QaFEj+SI=;
        b=PFByLKZESHhsGURZ/RlDpDMoBkUG+Xyimb6M8r8NwfgAEenxACXK+Tw+vMB7azNoLv
         t9nH39qccw7KdZMgMcP7lAcWmki7OTEj1xcmLQOGnj0Fb2fYQNwtR4wARER+vmMWHfLK
         whmAWAKzgg4cJEp6bMVFSnj8j9a3k9NyB3HMnUQrOh0lgH/caeIwSe01AqxxyO+upQNF
         jPJOU7i61/q7G7f14ldEuhwLlc59jkA6P0hamVG7rylj8uxNLLUUaSnYeAdSuq7Gg+n/
         PhQW+5iSEmG5CxZKVqVii3SFHoQXbqmMvwkNhPFtBt7I/HbXRwlMvQttl/zVl9xgRSWy
         HCcg==
X-Gm-Message-State: AOAM530Vt7q3v7/dbbCQRYrZ8RSWf3D1nyeY2VD8ZZkANHabCwH071Qe
	0PfdwGp7jrXn4hi8jIl2IrrIvl1/ER0=
X-Google-Smtp-Source: ABdhPJwgvmyWNz39ae19Te1vWF+M3tIhpJcHARb0sHnDuMFehJjAJFZXIkJmqWzDjG9S4N5TSbnzsA==
X-Received: by 2002:a17:90b:410d:: with SMTP id io13mr10973895pjb.112.1617328732508;
        Thu, 01 Apr 2021 18:58:52 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:344e:3d2c:47a3:4e6b])
        by smtp.gmail.com with ESMTPSA id x9sm707641pfd.158.2021.04.01.18.58.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 18:58:52 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 06/14] bridge-utils: Switch to use the main branch
Date: Thu,  1 Apr 2021 18:58:34 -0700
Message-Id: <ddc258df40a4a8d21a722158c5e07818674b1ee8.1617328609.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617328609.git.akuster808@gmail.com>
References: <cover.1617328609.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

Fix the below do_fetch warning:
WARNING: bridge-utils-1.7-r0 do_fetch: Failed to fetch URL git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/bridge-utils.git, attempting MIRRORS if available

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f1bb995a05c80b748c704ae77380379c3f0a87ef)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/bridge-utils/bridge-utils_1.6.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.6.bb b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.6.bb
index 1c87c48bfa0..4b195ededae 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.6.bb
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f9d20a453221a1b7e32ae84694da2c37"
 SRCREV = "42c1aefc303fdf891fbb099ea51f00dca83ab606"
 
 SRC_URI = "\
-    git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/bridge-utils.git \
+    git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/bridge-utils.git;branch=main \
     file://kernel-headers.patch \
     file://0005-build-don-t-ignore-CFLAGS-from-environment.patch \
     file://0006-libbridge-Modifying-the-AR-to-cross-toolchain.patch \
-- 
2.17.1

