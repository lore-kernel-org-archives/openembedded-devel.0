Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.257.1617899805066974879
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S85R1Pk9;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id s11-20020a056830124bb029021bb3524ebeso2953004otp.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=INa9xkEkliyh9L9BumDdheoO+KAYSIrIsB5/TY4Tkwo=;
        b=S85R1Pk97pjc2KR9RNUet+ufYuYMGi5wmaSk9sMRJrOF/U0sspPeNjJR1WLQkoS+Ky
         EHFj5VVRtd8Zrisjo/cWkoE5xlepPAQLI1KSddvoyIBvPimOEyV3ND7RXyJPJuRF8XKd
         9NQ6+tuXnA77mM5VcnfJ6Cc3w0GTHLLMyQv9jzt4hQNvsdgyrL0bkCHQ7zk0WcG1M/TL
         +x0nMxlQMjtqBLehExiUeWMZ1Wwy/T+drUqE7INQFNwp+AKCG+CsAcQI2AxUI/DOz4sq
         te/l+qq4azhmF7kDuuKxLb8o3xqjEB4t5KjALtCSU43430PEG1Vimmk8tvXUUN6Dcaom
         WIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=INa9xkEkliyh9L9BumDdheoO+KAYSIrIsB5/TY4Tkwo=;
        b=okV8os6LyuYgGqn2g+yB3TjSM+WU/Brj1lEnGnHuNTT6+7fCSwUGQXD3SsN6fAOrVD
         cYc8K1s5hZu2A1tJwBuuKWL5g0QfE6QgiYLVo4f5G3Rzf7rNXsFHSAD7RJoclg1y0uv9
         RGpVFA+0HGwVn3EyWtgMYsNbV6T0dv3VjRc8w+fypeAev6o9JHVYBEASoWd1gM/FgYbX
         RLT1YbWP4X+hH4f3hQmZ4TQ4Ssrk7xDAMCdik9/anushRxlfODwSoCNTcMzuKYl6lRkf
         KKMCGUYT5n0uMo3iiQI1gWEeGyP4zvC5vEqyeNYoGmQCFaWRGQ4aHROzW7yQbwtDynSH
         weng==
X-Gm-Message-State: AOAM531aTsqw1CkLDaQZV2MM19diO0aOvb6r6CmtVfSZN46zYOQU1R1r
	daiXlr/EykfKgN3tkvuzZp2muYDitL0=
X-Google-Smtp-Source: ABdhPJya8RJjVxh/JQZIn3NT0mCS4y960XZ7EdIxS0eY3+C2OSKW+6OGM49t68HthdF96HrZ+di/Aw==
X-Received: by 2002:a9d:7081:: with SMTP id l1mr8294623otj.358.1617899804325;
        Thu, 08 Apr 2021 09:36:44 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:44 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 34/64] nodejs: ppc64le machine support
Date: Thu,  8 Apr 2021 09:35:41 -0700
Message-Id: <ec627a986c7832df6f1b2dd49f8fe46588850192.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Andrew Geissler <geissonator@yahoo.com>

Commit 836912ab changed the logic in this recipe to stop looking for
"ppc64le". This caused the ppc64le systems used by me to stop working.
There wasn't much in the commit message on why this change occurred but
ppc64le is definitely still needed.

Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 649fb54245a2cb330ee6f78ab28c917492760f76)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
index 3a2822c38d1..9b86bf3373b 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
@@ -39,7 +39,7 @@ def map_nodejs_arch(a, d):
     if   re.match('i.86$', a): return 'ia32'
     elif re.match('x86_64$', a): return 'x64'
     elif re.match('aarch64$', a): return 'arm64'
-    elif re.match('(powerpc64|powerpc64le)$', a): return 'ppc64'
+    elif re.match('(powerpc64|powerpc64le|ppc64le)$', a): return 'ppc64'
     elif re.match('powerpc$', a): return 'ppc'
     return a
 
-- 
2.17.1

