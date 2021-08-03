Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.4137.1628020913605611232
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Aug 2021 13:01:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oznDRHK4;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id pj14-20020a17090b4f4eb029017786cf98f9so351514pjb.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Aug 2021 13:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CfFw+QbHhOvSiR8JpY2DRjOLCtgtCeXTWPSBfF3c/BM=;
        b=oznDRHK4Xi6Cey3xJHEsNftjki8dBi2J6BckeJUpnwWrqRXCtqEbea7laqLPID/yI3
         R1NK9McuEIGGuwzdJMkz05zbYOrDmii2WHgYHWm9Pxi9nF/BBJmSotfwKvPhQj2RmmSS
         viR2hJSZwVnid1Mtfn3lU/ps0j2e/lCMj42vjmR9N8UNs69sYe4RvShFUiorJzAf/Ymt
         T8pKHLrN6ZPGu8zfX5gSyF9/TM/GmQeVQDP4f8unibauq06aYp+m0NJEsjTPtDU2nnlb
         N9Lt9iYWGSRu6jXyR2A7xtP7sfGHi3+m+afq17xAXk/geMMFHE8etc+mL8k9N5FlFEd0
         rFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CfFw+QbHhOvSiR8JpY2DRjOLCtgtCeXTWPSBfF3c/BM=;
        b=fncq2/oob5Iq7+x9TL7RULv022pPqb7y2VqtTVfMUIoFv48v2I2/GeT6bqsNRuRQMw
         S4vKqFOCmfz2zuM9b2kV0IqfVziYgiG4MIxr17fOAjCDoyCkedlGNf/YWIHSIIBWc4lu
         bW/I8YAtoGqbHJuHre5KHd3CZhvck8CEqYT2yxbK3Y55nkSDNg0MwIEv/3YN7jgRZzQ5
         tivpIJVgFfTOnwcK8d4s4qpwOooKBDnvnKGOiYZJhgRbuqBxbRXjAybgIaPdU1uQ0VWe
         8XF1G6T28IO76YkrDxVgFOXg07/MBtCak1IN/5PYWAKw+tZ1P6uQN0CZT/IRQ532G5QC
         hThA==
X-Gm-Message-State: AOAM532wnt1KWp8KIIaUq506NYMyUiyns+lMXXn8aDchmrSyfBmb3Zz2
	4SVcGSV8RM+VTGirFEJlSgdApPwxw2BYwQ==
X-Google-Smtp-Source: ABdhPJyO3YHrK8NCcL1Go+NVwpyai26VEtEMV+vmKstlIow97T32BjjizrTCnTJVLv2Pw8ZqMMMmxQ==
X-Received: by 2002:a17:90b:3703:: with SMTP id mg3mr24641506pjb.140.1628020912952;
        Tue, 03 Aug 2021 13:01:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id a35sm18914290pgm.66.2021.08.03.13.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 13:01:52 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] packagegroup-meta-oe: Correct override name and fix syntax
Date: Tue,  3 Aug 2021 13:01:48 -0700
Message-Id: <20210803200149.2706807-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210803200149.2706807-1-raj.khem@gmail.com>
References: <20210803200149.2706807-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index ad95b9c458..5cd605ff49 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -632,7 +632,7 @@ RDEPENDS:packagegroup-meta-oe-kernel ="\
 "
 RDEPENDS:packagegroup-meta-oe-kernel:append:x86 = " intel-speed-select ipmiutil pm-graph turbostat"
 RDEPENDS:packagegroup-meta-oe-kernel:append:x86-64 = " intel-speed-select ipmiutil kpatch pm-graph turbostat bpftool"
-RDEPENDS:packagegroup-meta-oe-kernel:append_poerpc64 = " libpfm4"
+RDEPENDS:packagegroup-meta-oe-kernel:append:powerpc64 = " libpfm4"

 # Kernel-selftest does not build with 5.8 and its exluded from build too so until its fixed remove it
 RDEPENDS:packagegroup-meta-oe-kernel:remove = "kernel-selftest"
--
2.32.0
