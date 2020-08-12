Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.304.1597264908398341860
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 13:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=crz1YObG;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id m71so1622682pfd.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 13:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PbceAYjXeBm77lFciXW1VTb3XTt0GHasBMhOkeIdisg=;
        b=crz1YObGB1Zem4MNUwGADHCkdzdzJUfyxKV6imL3wsXIfcGl8eWGE63QK/AjeyX31K
         fC63im/VAIno6ZJYFq98PBwB0AItFZPU3j/LUaDPac28NgAgKHnrRp8nG/5Hw5PzOs8T
         l3ddp3xsq0nkkI1iuWB8+lFP32/SnpWTI+khFz8JOL9iaksUKfQfjU44pwwzaR0+Ld0x
         VnLMHrdYE3Vpr1ADx+o5QnbYt6t9iQQiEzX2t4gkv8rko42Jzeim3ZFegMwWrTw+boQG
         kUCqEnTa0D8Pl0QgGwwBfKBqPiwQhnmLF43oXGoJegNA9DbaH6IEFQVjqtgfhl5bdnD7
         N5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PbceAYjXeBm77lFciXW1VTb3XTt0GHasBMhOkeIdisg=;
        b=gxwWFgQSN0QCdCGQ/g8UElKgvU6UAYcmh38xM2J+wLdl/922mmXzgy3flr/qQ8Vreu
         ibERw1WHyceF7IdG6SCsggqeXAXQaEt6fCsCCKkXfRBsYl5qh0j/ZuyxOYkyerMK2PA0
         3XMGwxvvCY/5yNNxc05g32nxUUfkKK9bHIjmsDnWodMR4HST3FAlzpbRmOo0/SGaoHhJ
         Ys6FJM+5yiLOflND/tgMm5UZCLjRUe+zVPa6RjOdzopXOLVW9S6PH2OIeUS4Jph8CaKW
         B4b4GcBHiUDoSyyFXrvM72K23hG0Q25TrdtO7aZgYX7vMXhU3yWfI3/eKX70CfpGkuCK
         64oQ==
X-Gm-Message-State: AOAM530jYctpRoIzOMCxka6zwpOp+vR3iJX4U/aaEcvUjEioc+q+xBY0
	pOeNcs7yzO7vZN13rZmVAsSKt+wZKAM=
X-Google-Smtp-Source: ABdhPJyZKT3q8VKD7dU2afmdUgTbbvvh3syQj1jUAnROETqmzAAI2uUfVpnziywp+J5PD+cOCPsSHg==
X-Received: by 2002:a63:1116:: with SMTP id g22mr858571pgl.63.1597264904551;
        Wed, 12 Aug 2020 13:41:44 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id l22sm2984287pjy.31.2020.08.12.13.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 13:41:43 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][ 13/18] drbd: Upgrade to 9.0.24-1
Date: Wed, 12 Aug 2020 13:41:25 -0700
Message-Id: <20200812204130.1012160-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812204130.1012160-1-raj.khem@gmail.com>
References: <20200812204130.1012160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It builds fine with kernel 5.2+ now so enable it again

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../drbd/{drbd_9.0.19-1.bb => drbd_9.0.24-1.bb}              | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta-networking/recipes-support/drbd/{drbd_9.0.19-1.bb => drbd_9.0.24-1.bb} (77%)

diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb b/meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb
similarity index 77%
rename from meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
rename to meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb
index c296c3bc1c..cb73bdbce9 100644
--- a/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
+++ b/meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb
@@ -11,8 +11,7 @@ DEPENDS = "virtual/kernel"
 SRC_URI = "http://www.linbit.com/downloads/drbd/9.0/drbd-${PV}.tar.gz \
            file://check_existence_of_modules_before_installing.patch \
            "
-SRC_URI[md5sum] = "bd1202eaaf81641752d0c9b003b10f6c"
-SRC_URI[sha256sum] = "5b3d2bcb99542940e40af903dea783cf04524e9f41cc530e210d2c15ef84fa58"
+SRC_URI[sha256sum] = "14970459f55bc465503b88b24d1a266b2ace0d69fe3cb387005b8477cd6475ed"
 
 inherit module
 
@@ -21,5 +20,3 @@ EXTRA_OEMAKE += "KDIR='${STAGING_KERNEL_DIR}'"
 do_install () {
     oe_runmake install DESTDIR="${D}"
 }
-
-PNBLACKLIST[drbd] ?= "Kernel module Needs forward porting to kernel 5.2+"
-- 
2.28.0

