Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4390ACF885F
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 21:45:43 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.112.1728078335778170511
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Oct 2024 14:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Re+IiPX1;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20b1335e4e4so25769785ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 14:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728078335; x=1728683135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GbTNyTA/nf1mK10LSCvI5VGrbOJV1vQS8h7pcsPv1m8=;
        b=Re+IiPX1JtnPMOVsJlUpGTLsSSupqKdvaq0lWNfg0VAHDhDVAffkbzunMI4fkG99To
         wvCU3OQ1nsRyrRFiuBH1f8zd5d2m2rnfMuXoS3xA9zkLICqSlmg3rpFt9IuN8EgnKSbc
         MaKkVMpeofqt+363bQlyofYt+JXTQ2hQ0XdGHjSYOIlYbaeG4zAAOemQwAXTKoM2Se9N
         +/TwH90TvzS0dIIZiBF5douDn5Lbd3utXCFxyT93dze5BRXsdyXSNOGddVAuUtx/QWEw
         yed0IqNBO6Ayn9AvWz1au9JQf7vvioCYm6Pfgu3lki8kQb0AlxjQ06Hf++cdMVbvxrXQ
         Th1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728078335; x=1728683135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbTNyTA/nf1mK10LSCvI5VGrbOJV1vQS8h7pcsPv1m8=;
        b=AlC5ahn4TgJrQJ08xW9uehKCo1ZgkYprGdoq9An8DWTQyGKLSj+7t/kVX8H6ovP/tW
         PLGKMssVjb8DMo5QbTQ4693WkfMYvg6vF4M0gqSsfhZjxs44LZrpE4yU5lkBjN+FaRH6
         wGzTRQ/TArfCvcfY+mv5eSpWjF2NK8Au+Dvh/I3Lc1pV32EgTL+Jw9+gM62b7/VzQt8R
         Ox0yLETGQxhmGlXMblrtM6RD7GcfnUql2Vb7GZ27wEifYoyYJBXsl67fe2CYWX2EBkhh
         D7xHWLvIx3jq9oZQ4Bw43xmbtPBpey5qbClwAlMTiuBgQjA/R6JWGlOa+6h9mIOA4tr9
         if5Q==
X-Gm-Message-State: AOJu0YwmlODxWxMIjkWmz2rkU/utIQZTudc1lfm2dK94VD9yfb2jZdnc
	OXnNb5HXUj5CM/m8Oc2z2zQc0iCjC1ynO1AEoWDPcPrpkOiEqaP4qUdGVsT7
X-Google-Smtp-Source: AGHT+IEUOl2LdaYCcbv9q1eIUd1nNZXTaAEZXi7neqcBGEf92HJ4j3qsASZx6KZfklJ7fvNVGw6Frg==
X-Received: by 2002:a17:902:ccce:b0:20b:9c7d:fe0c with SMTP id d9443c01a7336-20bfdf6bf9bmr59447875ad.7.1728078334622;
        Fri, 04 Oct 2024 14:45:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9f70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13992b84sm2957955ad.284.2024.10.04.14.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 14:45:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 1/3] ptest-packagelists-meta-filesystems: Move fuse3 to meta-oe ptests
Date: Fri,  4 Oct 2024 14:45:30 -0700
Message-ID: <20241004214532.2503043-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 21:45:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112669

Move sshfs-fuse out of problematic ptests into slow ones

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../conf/include/ptest-packagelists-meta-filesystems.inc       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc b/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc
index f57bbab930..875a2f139a 100644
--- a/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc
+++ b/meta-filesystems/conf/include/ptest-packagelists-meta-filesystems.inc
@@ -8,11 +8,10 @@
 
 PTESTS_FAST_META_FILESYSTEMS = "\
     e2tools \
-    fuse3 \
 "
 
 PTESTS_SLOW_META_FILESYSTEMS = "\
+    sshfs-fuse \
 "
 PTESTS_PROBLEMS_META_FILESYSTEMS = "\
-    sshfs-fuse \
 "

