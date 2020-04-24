Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web10.1399.1587749381284946993
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2020 10:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uysabhbh;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id s18so2258099pgl.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2020 10:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KtELMEJslL13Be+MbXROPM7v76/6QiDmpZZ61o6FmNY=;
        b=uysabhbhH37yStaNBxM4QmQFv+MhD4ucP0GThq1YRjKsytrufOziBRQGyuD/Y1nMxd
         us1SoRMceQvxqA/EAUjxrW4ik/dTURa35J3xsbGBIRtCLgn2PDhkKnHSIZEkW52vgzEK
         U0S4s6/+0Ha2vcKJF4t6Oe2l5quXhpCeohyCpA8GpSIevOIajktIO7vdm9pBY8cs7lju
         RuFYoY0x5SMMJmSgaoJgk6KNYm3FljJGCD09wPGc0KkOB+i9xHE8OF+2tkgXszrmMfph
         X165wD1ttiRm/uuY+b0SUG1yNs9gLtRg7/IRdEA9a6irEI1bIFmw9C8OSED7VbmSURCh
         I3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KtELMEJslL13Be+MbXROPM7v76/6QiDmpZZ61o6FmNY=;
        b=avT1NpidCU4hK6MIY0IwbFKRSGssplwg4IxGQreGj1Qa/1FZpmjs4kIZSjYtOhCOID
         1AFLk+hiVIUvzdzGb9qlMye9eTFHCPODEgZJMCilPA82gBAIgQiEM9M637ZkiakOHuSx
         yzan+QKPbp2l0dtWZS8Zzh16KCGEjNiZPGBTrRZF9VI8IX8XTYVkz8ONm5kxXTBhVbzW
         lK7Bim3Lzrj0hKDuK+d3fGQsQjQNdBiIdFJpY3L4c3TVaO5Dp28Z2U+9F7c9pgzOqaak
         /F5uwo3NR091xY2wPpH6ao4EtcE879BODYJ2Q1nRLJ8p25k9SdF1lt5mjhPxQ5fUwQar
         J2dw==
X-Gm-Message-State: AGi0PuZZVlzrnUDtJKTf/T0Mi87vH1RkxvxZ1/v6FLJLXZFHPH5/AtZx
	ZZ3m6QH7mqrberliuO0mg9UZ4+k6axM=
X-Google-Smtp-Source: APiQypLEgZ4XWW9xUdkGhdtgR9h/6bvkCqUGaThhMeKRVTgyOQRHSaiXYaIKszzb8+RuxJ7bwYQmIw==
X-Received: by 2002:a63:602:: with SMTP id 2mr10229017pgg.383.1587749380412;
        Fri, 24 Apr 2020 10:29:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1a60])
        by smtp.gmail.com with ESMTPSA id t126sm6103874pfb.29.2020.04.24.10.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 10:29:40 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH] packagegroup-meta-initramfs: Remove kexec and vmcore-dmesg for riscv
Date: Fri, 24 Apr 2020 10:29:38 -0700
Message-Id: <20200424172938.668178-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are not yet available for riscv

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-initramfs.bb   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb b/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
index dc4928b5ab..b6fc11ba44 100644
--- a/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
+++ b/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
@@ -22,3 +22,5 @@ RDEPENDS_packagegroup-meta-initramfs-devtools = "\
 RDEPENDS_packagegroup-meta-initramfs-kernel = "\
     kexec vmcore-dmesg \
     "
+RDEPENDS_packagegroup-meta-initramfs-kernel_remove_riscv32 = "kexec vmcore-dmesg"
+RDEPENDS_packagegroup-meta-initramfs-kernel_remove_riscv64 = "kexec vmcore-dmesg"
-- 
2.26.2

