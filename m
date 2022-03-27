Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7BDC433EF
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 01:14:39 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.1430.1648343678235635133
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Mar 2022 18:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QhTGKlKT;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id o13so9474860pgc.12
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Mar 2022 18:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RogSjnpQGMM9rtj08iVz+C6WU3L7XNvZGAZNEQuETB4=;
        b=QhTGKlKT/UhF0d4A1V7qFrXHZOOrqO1kjOBKOwZ0HrXiU3lFpegpZpVBc5i2/OvgVp
         9WQA/EYlYyTliY35frNkGysC6opSguOfn+i9Q4SiQGLr98mSQDvxHhQDCfUT5EzyVY5p
         uSnerL7mCZ9RWOpUF1cncCdO8r4aYlE+ToZFm23aM8cG/sm7/imLRZvZxXI4OYle5XBZ
         FiQ5jYJmcQD5BtN2ok5a3WoJMivB9OiI/anN09uC4zIbRWYI78QJeHitj55VXnxw4n0K
         ypP6ZfCJWMFZudmv9bo1sO+IAqInGw61joC9XE2aFLlAXqN2jpghDCl8n1YDHds/0YAC
         zaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RogSjnpQGMM9rtj08iVz+C6WU3L7XNvZGAZNEQuETB4=;
        b=CMwer1j4Fp3f9IpG0wpvDI3BLyGsiptYE4aIjKARC/1YTf32ApCRbCuYss3BN2x04I
         SSpTLmbDHqKQI9W01Tsm4M7TKu9M3fyDRofby91t38qHK/FcjJmqIeHaePHr7fz9CuJk
         GtZPbg0GCvLz8JDkKQ3O+RAVhsDJtv0T9PH+T7rNU+MABcP7k+1LaL8EFtS9w2X9lHet
         uHc45h65yjN1wv/NCuWfj/NgOJUEumqtGDXpV5IJ0sghdaOirESuE9UFvkeg5F5Fza7I
         se01QzZeyL2yXsquhd83Xhy9EOHys+tXXiUpOR7XscLo7f2AuF4Yboa+Tl2sku8Q34of
         U0VA==
X-Gm-Message-State: AOAM53389YhUX0cu3rMzp/I9CsoBBwFvOns52Cf3KApcAAk6RVzfLTR6
	5jAlV+oeXPYNofV30d/wY74r5GCoYaE=
X-Google-Smtp-Source: 
 ABdhPJyDrAcyrytrwokgEr4IGbcvEtc5dHc0gQOP8mfPjzvhW2JiX4vFD3qZ15N8qqpnbmKqdO0GWg==
X-Received: by 2002:a05:6a00:1152:b0:4be:ab79:fcfa with SMTP id
 b18-20020a056a00115200b004beab79fcfamr17004464pfm.3.1648343677503;
        Sat, 26 Mar 2022 18:14:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 b1-20020a17090aa58100b001bcb7bad374sm16525147pjq.17.2022.03.26.18.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 18:14:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/6] a2jmidid: Fix build on ppc/musl
Date: Sat, 26 Mar 2022 18:14:29 -0700
Message-Id: <20220327011432.555592-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220327011432.555592-1-raj.khem@gmail.com>
References: <20220327011432.555592-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Mar 2022 01:14:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96218

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../jack/a2jmidid/ppc_musl_ucontext.patch     | 19 +++++++++++++++++++
 meta-oe/recipes-multimedia/jack/a2jmidid_9.bb |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/jack/a2jmidid/ppc_musl_ucontext.patch

diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid/ppc_musl_ucontext.patch b/meta-oe/recipes-multimedia/jack/a2jmidid/ppc_musl_ucontext.patch
new file mode 100644
index 0000000000..1fa64812ef
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/a2jmidid/ppc_musl_ucontext.patch
@@ -0,0 +1,19 @@
+Add musl/ppc mcontext differences specific checks to choose
+correct gregs and context structure definitions
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/sigsegv.c
++++ b/sigsegv.c
+@@ -95,7 +95,11 @@ static void signal_segv(int signum, sigi
+     for(i = 0; i < NGREG; i++)
+         a2j_error("reg[%02d]       = 0x" REGFORMAT, i,
+ #if defined(__powerpc__) && !defined(__powerpc64__)
++# if defined(__GLIBC__)
+                 ucontext->uc_mcontext.uc_regs[i]
++# else
++                ucontext->uc_regs->gregs[i]
++# endif
+ #elif defined(__powerpc64__)
+                 ucontext->uc_mcontext.gp_regs[i]
+ #elif defined(__sparc__) && defined(__arch64__)
diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb b/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb
index 339145dd0c..bfdf26ed46 100644
--- a/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb
+++ b/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb
@@ -13,6 +13,7 @@ SRCREV = "de37569c926c5886768f892c019e3f0468615038"
 SRC_URI = " \
     git://github.com/linuxaudio/a2jmidid;protocol=https;branch=master \
     file://riscv_ucontext.patch \
+    file://ppc_musl_ucontext.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.35.1


