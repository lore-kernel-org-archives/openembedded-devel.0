Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.8332.1598999778451233497
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 15:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NlDmPNbU;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 31so1467826pgy.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2020 15:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cThAU/wl3YIcDsZDLPgbobhFeW7D4qSOvHwbKh+qubA=;
        b=NlDmPNbU0iupjupvkSs7aphfhpfYAvY56SJmi8B+endHFz0+aA3obIZhf4xJC1L6KE
         IrWhWhet9ntqUhR32lyr7vdNUiG5pPlE5nwRX1DnE5zozGN4PtLepCGYvEPGE0sVLSfh
         jhPTdDhE2rCGAJINaFb4I5K5m6NdiK5XGv0vao09r/MZNG831tbDib2PB2Be9/7eMXP2
         iaG4CsKqdg8YKH0uStmrUdjOrrcwdB0ysXI87fOlcoDMzH4ElJjd8hCjpyMgewREy2xH
         DcaNHqFbNTVqT2AyrSECoEqsb3z42eLsWOEibvZLM7jvF9GpXf2vioI42DHY/Zqv98HQ
         PBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cThAU/wl3YIcDsZDLPgbobhFeW7D4qSOvHwbKh+qubA=;
        b=EKV/SMXPkSgTd8wSQuR9Ui32B9QCs6nyB9aj46i8tghgMKzI6AJVTOi4vwtEh5N37S
         tprfT5ZG4uTp025Djcrbtdr4F2oQUSi+IHAatPVfWaVTB7avSHve5tHeScrfJ/gQKYF+
         hmGK2QzzI+rFDGuiqtuyy8zCU00aV3ZCKzw3tsy89X1F1RHryjHXhiRfAZWhiDXHQaS3
         dCyy3/HIs3zhnWwkxV7k4cEYexr7RlBgTB1kvsUy2MnnEzYLmxGKjEKijt0gpQHB+NDS
         9R254Z8R4H+5m3mTXGKBekQ8u/kSqo1jwut/0YgW5HbSHfzzxCKOb78IkywJZiDdxgkh
         ABsA==
X-Gm-Message-State: AOAM532kHswFl12+GKade5OOwZeXUhyZ1L2NDIMfiHRoBghMRnL+EV8F
	E5nK6p3KPvFMmeUFus5dQjThcucmkgSFbw==
X-Google-Smtp-Source: ABdhPJxx+n1a2fwg3ACxBG5zMf64qVrzKcR6gkZbS8DXKZcIW5KEtNs8DQ7CZTSx0tmrJl8fH4sLDA==
X-Received: by 2002:aa7:982e:: with SMTP id q14mr328373pfl.299.1598999777416;
        Tue, 01 Sep 2020 15:36:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id q34sm3157964pgl.28.2020.09.01.15.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 15:36:16 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 03/10] bearssl: fix GNU_HASH link error
Date: Tue,  1 Sep 2020 15:36:05 -0700
Message-Id: <20200901223612.1386026-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901223612.1386026-1-raj.khem@gmail.com>
References: <20200901223612.1386026-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
No GNU_HASH in the ELF binary /mnt/b/yoe/master/build/tmp/work/cortexa57-yoe-linux/bearssl/0.6-r0/packages-split/bearssl/usr/lib/libbearssl.so.6.0.0, didn't pass LDFLAGS? [ldflag
s]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...LDFLAGS-when-building-shared-objects.patch | 32 +++++++++++++++++++
 .../bearssl/bearssl_0.6.bb                    |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/bearssl/bearssl/0001-make-Pass-LDFLAGS-when-building-shared-objects.patch

diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl/0001-make-Pass-LDFLAGS-when-building-shared-objects.patch b/meta-networking/recipes-connectivity/bearssl/bearssl/0001-make-Pass-LDFLAGS-when-building-shared-objects.patch
new file mode 100644
index 0000000000..3b341e0355
--- /dev/null
+++ b/meta-networking/recipes-connectivity/bearssl/bearssl/0001-make-Pass-LDFLAGS-when-building-shared-objects.patch
@@ -0,0 +1,32 @@
+From 9515448761739d6186e7d07da5b47e368753528c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 1 Sep 2020 11:34:33 -0700
+Subject: [PATCH] make: Pass LDFLAGS when building shared objects
+
+OE passes flags like hash-style via LDFLAGS which alters the linker
+defaults, its important to have LDFLAGS in link step even if compiler
+driver is used to do linking
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ mk/Rules.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mk/Rules.mk b/mk/Rules.mk
+index b480bd6..db65125 100644
+--- a/mk/Rules.mk
++++ b/mk/Rules.mk
+@@ -344,7 +344,7 @@ $(BEARSSLLIB): $(OBJDIR) $(OBJ)
+ 	$(AR) $(ARFLAGS) $(AROUT)$(BEARSSLLIB) $(OBJ)
+ 
+ $(BEARSSLDLL): $(OBJDIR) $(OBJ)
+-	$(LDDLL) $(LDDLLFLAGS) $(LDDLLOUT)$(BEARSSLDLL) $(OBJ)
++	$(LDDLL) $(LDDLLFLAGS) $(LDFLAGS) $(LDDLLOUT)$(BEARSSLDLL) $(OBJ)
+ 
+ $(BRSSL): $(BEARSSLLIB) $(OBJBRSSL)
+ 	$(LD) $(LDFLAGS) $(LDOUT)$(BRSSL) $(OBJBRSSL) $(BEARSSLLIB)
+-- 
+2.28.0
+
diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
index 74a876987a..1102bb95a5 100644
--- a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
+++ b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
@@ -27,6 +27,7 @@ SRCREV = "8ef7680081c61b486622f2d983c0d3d21e83caad"
 SRC_URI = "git://www.bearssl.org/git/BearSSL;protocol=https;nobranch=1 \
 	   file://0001-conf-Unix.mk-remove-fixed-command-definitions.patch \
 	   file://0002-test-test_x509.c-fix-potential-overflow-issue.patch \
+           file://0001-make-Pass-LDFLAGS-when-building-shared-objects.patch \
 	   "
 
 # without compile errors like 
-- 
2.28.0

