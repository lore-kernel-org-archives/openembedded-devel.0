Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F422CC9833E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:54 +0000 (UTC)
Received: from mail-pz2-f17.google.com (mail-pz2-f17.google.com [74.125.228.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35372.1790506308099519313
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P6vQzaAu;
 spf=pass (domain: gmail.com, ip: 74.125.228.17, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f17.google.com with SMTP id 41be03b00d2f7-cc4c3304784so829838a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506307; x=1791111107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/BVTm6vNFcgh+3eMjiFuhjIHwEgYCZX2jT/IgX6/U8=;
        b=P6vQzaAucRRMwKrAEDpsOzKZZfnTA6t76wUr7pvIBmhkD0lRBzXL5QlM7ea63Byn6x
         CooRZkfGrVH4BNIW9LhLNBa4hnl9aH9M3FFqhK7qF59pdE2TdawkGQjD6D4Vc0UrRzU6
         bA90mJGZibHhc7DlsdPavJ+tZtCO9rv9RVQXfy9eHlacAiEisR98KMpL9nutvsFpqeM4
         ddwSIn3UP+oi+CPO4+KnAAe0dQuLgNlfSHFILsXOnxBN+XUibwuK7kP4K0NnzqHrFE3x
         YdGK09v7dmCSS/5eukNGcBymvJ6WL6a18NBETV0T6GFd806vEYayZEdPDzAIRKB0/CtL
         DbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506307; x=1791111107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/BVTm6vNFcgh+3eMjiFuhjIHwEgYCZX2jT/IgX6/U8=;
        b=LAT6cbQ+fcBniEZ88VwPlPhfwSZZBJ4OYKYiZ7kgx/JWI2zq1gqHL/f3+sV/BTCyAO
         GKeQe+aNa9VaD61XKGE5VBboJL5C4opBTykDVqM+Elkeog+ysSzEKrurXfcKfyYzFmfj
         HgWo2OGQQWjUM7ciNjKEaZ3xSYGP6f+PPoNy1c+qrLwuaTGQa4G9v56sqzoTa0xso6XS
         qeNjyf+JCUbLApbbCwtQbu95Hx2wV9XUcYSndNP4A0MlQNDPGyhASvfl7MO51RipZwtu
         R292v16swHiHGW4qGmz28ahPbadjje8GRDyo9gQQ8RgWc0Ctk9u00sqZihhpT6iGRmrw
         gBRQ==
X-Gm-Message-State: AFuF++muTChkokgUs0GvYJZX445zJkIl0Nz4imvyxNQwC1TqO5Wc4JyS
	2DKugR5KU4fvNs+MBmWAfft+DSjxQy5fhx6A2LbPHM3yEGiasctX+BNK/YJ28Q==
X-Gm-Gg: AYBFou3o898wkbKXJlmYsWA773LSRO6ExbMcsWqjgxfKt4qbI2bL+OdO34Wu+40zB6r
	M4bRm0A0Hhdw1MSGp0g4XLg65w3cWu0K8Fa328dblnsY4wbyYvia5mb2/uHATnAj2Xh/PHooOtr
	fUjpfCpesWqtxyPHVDHlnxMliendsEJ6oTZmW2mXG38smX0f9rAlhHMzKP7xBexGYCQg409ymcV
	/25Cw3DTSEoiAFlwbab5gHrYBENrRhaftfoq0tmncJ6fh3cV8VBgFXDr9gQL87XqkICXBKCIAIE
	Fwy8mGdsn/m/zq208k/ShvWnFV7TUEIL6MtiYjhtUd35IubozJC3gFEt/Gc+2kpoPnnl5R0MQms
	pyJv2ZqbzfLaHUpK9x1wOOAufKWnLAHq9uVPp0hap/wVdttFCK4mtNslLHbt8p1uXDgYJHQgIMW
	aHF2jr07NJvwhU3BlyjrEV/kxMlVzOPA6+pw7i9SIEqDPElFznOl8t3qz4mn7+t0NJnurAN4Psn
	smpbF+U9X2e0yzN30RNhFs=
X-Received: by 2002:a05:6a20:244b:b0:3de:4a1c:a95 with SMTP id adf61e73a8af0-3de4a1c0e33mr2486536637.91.1790506307497;
        Sun, 27 Sep 2026 03:51:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:51:47 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 35/35] fuse3: upgrade 3.18.2 -> 3.18.3
Date: Sun, 27 Sep 2026 23:50:02 +1300
Message-ID: <20260927105002.1832451-35-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130369

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/libfuse/libfuse/releases/tag/fuse-3.18.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/fuse/{fuse3_3.18.2.bb => fuse3_3.18.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fuse/{fuse3_3.18.2.bb => fuse3_3.18.3.bb} (97%)

diff --git a/meta-oe/recipes-support/fuse/fuse3_3.18.2.bb b/meta-oe/recipes-support/fuse/fuse3_3.18.3.bb
similarity index 97%
rename from meta-oe/recipes-support/fuse/fuse3_3.18.2.bb
rename to meta-oe/recipes-support/fuse/fuse3_3.18.3.bb
index f901b30efe..75dde98a7c 100644
--- a/meta-oe/recipes-support/fuse/fuse3_3.18.2.bb
+++ b/meta-oe/recipes-support/fuse/fuse3_3.18.3.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.gz"
-SRC_URI[sha256sum] = "f01de85717e20adf5f98aff324acd85dd73d61a5ca3834d573dcf0bd6e54a298"
+SRC_URI[sha256sum] = "bcd19582c5e30f7fe45dd86a5540e998590aa01903afc7ebcbeea6c8ac5421ee"
 
 S = "${UNPACKDIR}/fuse-${PV}"
 

