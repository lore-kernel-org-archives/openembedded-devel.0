Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CAA8C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:42:17 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4301.1790160136483613815
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iRH2nAp3;
 spf=pass (domain: gmail.com, ip: 74.125.228.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8633a38df87so365869b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160136; x=1790764936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tifWFHRLR3GAf7fwoy5DFJwBVGY/sdZOIOxHCLVHr98=;
        b=iRH2nAp3SwPiW9VMVdXrGUU8v5XSqiVmtsVrQzJT1rj4bZNF55IIiqY3ZedwtRfN15
         x+J6Ol6o3THuGS3X/cfWoz+6MvqfLhAf1eqoNVpMYFVuzK0OJJiTqpWaj/A+lsivBcYn
         BNpkgC5h5k7zwltqLDYramnFiB99x+2KfahxeKV2nq9Xx226vyRm6rHpACE4Lk7ItrDy
         JAwxPXcw+A4Dp577OzH3MrNszK70wAgZrjhL1hF4sv1YAwcvNqJe+7nI3iXuu5bKmAhs
         C89SgJt5hAHZih4+QTb/c59ZdsMe7sO14zlAsTmxUonORQShU9zx0IOVz5Ek5eoqxa43
         uULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160136; x=1790764936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tifWFHRLR3GAf7fwoy5DFJwBVGY/sdZOIOxHCLVHr98=;
        b=Xjzxk8sMh2wams3Q3kae5jtX90R8fvqC6ArGAMFlquTtyJDbj3wwJKjaOVZnY3Hfzz
         Z2pvnXpgMkcMJqGrUGBDJmVE9C+P2K/XiCgQE3NEd4jVVlTtwkX7qLDBmY/2V7WiqEcZ
         pNUC4QarkICB5yo375oWVZllk5lx/6aRs+0W9DDnsZ2yKAZkgh2fTbj9WGKovWa5pu2a
         gBYV4hxwCxDaEr+Ox0mgq0LI5dSx8GarrOmIdTIVGT/hY7nNfj4YPVRvr01aU6WqETMr
         LPHzXpAa9UKXUbksgOlbaGgrIfFmh0cYD4VEPy7BluBpV2w1NtYM00JcyBFYZ0Lxrtu0
         ChCA==
X-Gm-Message-State: AFuF++kgmc9neT1iQtrMWQ3CCa4FXfES+jg6iQeDHgWm94mtzIhGJieO
	Z0AOR4z3/R+aQVB+Ko4cu/fZHU2KVe3Y/8Nw1CZL6WRoRQnr07Am+pcREEY1lw==
X-Gm-Gg: AYBFou1CDYIRbr45rxhr9q8b1przR3dq5Jxe2gGhWCXPJ8JgTjUMipIWlNH6OyP81Mx
	l1gzidf1zxfG/V2R4VR7XbYxLp+5cfC8vyEkml03dsTzmWflVFbiHa9qVJyyOnmlQJTqqur4zsB
	VVW/ZISBr2Fnt8VXYh1PwO/U1TIVYbI9xeJOxnb26S/Z1gUq8/OBRm/LLa80oed8p6CkHN6EDRS
	0+yJN7vlaBG90YE4yjpOVUfGTqD6NZ3VPi5GhqjXYHLmjXyAywDHsVztIkPDxFEVmIc6dRlfAuc
	J3fCagtJIvmW3BtSRyXYLVeWx5nbTvVfrueRm4YT30eOeIArDpMCS14yxcGYpIl1pThVBQqdXzU
	Ue2QTIazBdhp879rcNVUNCs7P+zj/wD9XQDHdPE8dc2EX2W4+AFUMcyiIMxYtlyk8Z9+YDm4/4d
	1VyTpzmD0A/3Dt7PSYPxBO09h060S5nqe8ncSO/QIMoAxPXF0NB8LoLQbZeNbjzJrE5aRBm1+yV
	FFzTjC66jSzSnK9gfgPgWY=
X-Received: by 2002:a05:6a00:464e:b0:869:9298:ba50 with SMTP id d2e1a72fcca58-87d16eb422amr2170060b3a.0.1790160135837;
        Wed, 23 Sep 2026 03:42:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:42:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 35/42] libssh: correct CVE_PRODUCT mapping
Date: Wed, 23 Sep 2026 22:40:49 +1200
Message-ID: <20260923104056.457360-35-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130222

From: Devansh Patel <devanshp@cisco.com>

The default product-only mapping generates a vendor-wildcard CPE.
libssh:libssh is the active NVD dictionary CPE and configuration identity
for the packaged libssh source.

This changes the generated product identity to an exact CPE, but the
frozen sbom-cve-check database leaves the 48-entry CVE report unchanged,
with no current CVE delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit f1c88ff462d97215b87e29719506d50c4d020978)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_0.11.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
index 49ffd29403..e0dafb47ad 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
@@ -15,6 +15,7 @@ SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused
 
 SRCREV = "a09fdd00416e53b6ed436df6ff14339a4f884601"
 
+CVE_PRODUCT = "libssh:libssh"
 
 inherit cmake ptest
 

