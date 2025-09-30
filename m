Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18ED1CAC5B9
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:19:09 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.20995.1759223939631351722
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PcaZzaD+;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-91179e3fe34so231757839f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223939; x=1759828739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAAAaONOvH55c+yTSgxBbayu+mAXyKekMO4QVLrkvSY=;
        b=PcaZzaD+GfgxiWJ2d4Whd472WOkI4OfxDF42Ncauwm4+095AlVPWxJm7iduBOmhLIb
         HuZ4GlGwQuJvVOhgu0Aw/S1VtwgmkpANw3wIMRo5imU/ewlnkqVeJeech/+QMlS8hv3I
         Qy4lAi0hGlKB7PGIN+6l05wLSQXodQ0oVWghtKGKIVjmA4fs2k/wGBJ5ykLsFp1NfplO
         DdgyaWwwPjuxZjYyxL3aL6CxkMaz+6cSaIJ2MRNvDXRIFc2F1s0ZUN5qnYv1AIDHzErP
         wllVpVLlOe5Nt0ul7lQNOo8GaQT2NKApSh7mhuvjx188T31b97Uu1Mri3rVao9AEmAow
         OJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223939; x=1759828739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RAAAaONOvH55c+yTSgxBbayu+mAXyKekMO4QVLrkvSY=;
        b=YafVUIRJ7KBLTWZws2MDGIW+XzSpxPDdUXuSjQYkauQMRr8Z3uAVi2GLT+VHccsatS
         7S2ojSNxbP7iSw0ljPOqFiGkqQZ7BICcSKD5HkNOVKraNSRubx5jwwbhEdPfG2L7tcV/
         Akplqn0P0kAsE8YxeL7X8WHzVR1vqx0SKEfkjqtnYy0MIucqsyw0YEEayEeQaZWsx0GU
         CT01pfOvkv9YEAtLqx0N/4n2RrrzBoxxiLhu3ETXYimckmXJmVbekseUVWV/H5K1Z+qh
         LEVVTOukRl+lZJIw3ne4GRL6pV8nphFpUNyml5IluPINJiy31O5CtAy25Mu5dL+9Uguh
         efAw==
X-Gm-Message-State: AOJu0YyZ8IxUzsxcEx/ljWz0AOyTd1G6C/+8vg73uQsjrgygEZ5lYfwq
	q+/r6KNcJ8ReNsSBUi3JXEDJrCiufUhs4uKnUpuZz5HGM6RQ663G4ooQ8wUHD0hx
X-Gm-Gg: ASbGncv6ZLia9rfulqXJmqp+Aujim4Encmf/wPeh3fK+Zslq2N9mVH+5mmLKPIvlcp9
	YujCBfitA8mMEoWEK+9eT6ogqbG4BDLxsWn90WI60zHPT5L3Z4I2mzcLiD0Ud7Tm3DH55hxBlYK
	xH5g2OeTDtBlDEhImlHdAidWu6PrOHCtjelvl4nry6wyzhRT8maa89y/EXxfjS7vZ0fsvQdn2NQ
	J/mPGDB3CbC5wd0n3wHt50yF3FTI6q9IwTQT8m59fJMPYh4D6aAKWXD6b88zxgYH/+ACIBK/N+l
	MuZAbIWqIaEvoxL4bEblrJRvb+Eu/8zvgMBPwZqF4TRX2D+Dh+HN8rRtoyNeTZ3vALTMqpcdeFE
	jBfsaW6wRbHPT6BNqTbw6qg/eiaGDrsSKhWrp75A+3Sl4tb/y2tHypishkOhT3MFCi/UbMWgoSx
	wp/l5HLKRX+g==
X-Google-Smtp-Source: AGHT+IF0XN+/ygWsAP3cE5xzpApVHqDr6qhFwMqXPPchn9lOsEoegt/uPN1n9Tzwo0S2LpSgxO4s2w==
X-Received: by 2002:a5d:917a:0:b0:8c3:e106:74c2 with SMTP id ca18e2360f4ac-930ad1a6773mr446242739f.5.1759223938631;
        Tue, 30 Sep 2025 02:18:58 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm1837064173.2.2025.09.30.02.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:18:58 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 04/22] parallel: upgrade 20250522 -> 20250622
Date: Tue, 30 Sep 2025 22:18:23 +1300
Message-ID: <20250930091841.1693131-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120056

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3afbc2b0b8565322048f9937045ae922d078951f)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../parallel/{parallel_20250522.bb => parallel_20250622.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20250522.bb => parallel_20250622.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20250522.bb b/meta-oe/recipes-extended/parallel/parallel_20250622.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20250522.bb
rename to meta-oe/recipes-extended/parallel/parallel_20250622.bb
index 79ea168675..739263fe30 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20250522.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20250622.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "b4b28f475f8cff8bb6ed4b03cc5a67041f18fc73fa256923b23181b56afdb2cb"
+SRC_URI[sha256sum] = "69f578cf11f1b124ba3c2b673a16641debe63aeb3d2ac4cec5ad65f8a53d489b"
 
 inherit autotools bash-completion
 

