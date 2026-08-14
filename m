Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83079C5DF6E
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:07 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24356.1786747564898151496
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=l4qev1tJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e041ea211so1747452a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747564; x=1787352364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BkCCsadCVPKu5uWm4tupNny4rlQqjLBve8u0/xXj6IM=;
        b=l4qev1tJgtp4Bxba30fMRrLZwaUF9g6bFDYXzjZVAd9qDI2PH2JPwgwx8Nll0srWrK
         XHph/7Lhwaz5qlc7Q/7NhCb3+rN2wBWdeL48BFFrpU0UEDYv4YBzT4rrVSmoYk/Ti4zh
         GTAduQcicSHwyX8Ba1fZrkS8648vS1RV6SuuM9XCNE7u/nYQY/isiCtY/c7PPWX9IwHg
         Uq9IbtVXnmShFkBVFDOTF4TmquI4DSWmmXKPX4mzukjyqNI+R+GcSC2Vh0lP/nX2oCof
         IM0Z2jK+p4IPNg6Mn88r6qABLW53+C00IbnhmJVdXvELF0MJQbxFHU7IVdsLI465r9S1
         tbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747564; x=1787352364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BkCCsadCVPKu5uWm4tupNny4rlQqjLBve8u0/xXj6IM=;
        b=olYdav6QjKqzQ1+NNCbvajGAbyDjflYiInEglrZtkHaaHcVkcusB5i/4hgyUdXAB4S
         nU80dnW6mvlH/QEQWCd9pgxLW2LJmOrT3baUbQn5ovlQO/pZwr3QJR0SpRiCz8cvVJUa
         isDiy04bESlvMsbeDxLLHunSuhu+54eIMJJUpcY8hCm8RFsWT9C6i0eXRr97cI2YRyLL
         0pQLczTQwEwbG0ftTIJUey4khxeSAXyS6kZeEmUY+KHyABOt9VTljnbeCtcefEVwCKQi
         8dAtAmxiq2tqhEPg11jAtVpXCa8L/h2UIr9WzxutEnDt7AZTg3MeVevxg8TVqY/jF/X2
         Dqow==
X-Gm-Message-State: AOJu0YwmQwR1nos3E5B1lbyOi2uqeDmlQ8om+mRRr59w0TFg519wrvfx
	DQZI5DUz8N6+0ab5xcwjl5fDjCWCjOjOzqDHc8/MiNF8xn131n65CxtOx8S2lg0l
X-Gm-Gg: AR+sD11qrGSVGOxVPBMi9l6iX6muS+b1qLmUh22BbAr3ZKTsAlV+cKCmipGeyJNlipE
	7F9cdYFxXyQoLTOEySy74DHtnb0ZQkZ8pNgaIL8PqzPuK5/uIt9cfbXQoeZnWD8RgZDPxw6Er9P
	5PihhKHjeoQ0FP9NFT6Qgpg62vBVZohPkHpg9heeW5yc2D+NSUqaBWokqAHYaSOl2MXRBknbiRD
	xN469UnmMWjq+b7t2ZYLY6SEraJV9lz7gJltH/b/id/1t/Gk/aIdeuQi4nv5AjMtVc9g0RDmZ0B
	88JQBtPILLdNWonv7MRlhUUDm4xyLHRicXRGt0VD2S8Fh6mtRqPt8nW6G0/CUHxHxF8H7pAfCD7
	OekIkbWCyLDXLjJUGd6Ltc6CVDDHWU3BEVGR14082nomRRfhulggUzFfZ6+nWiWS0kPv/+CJZWj
	skyS5gclkVhctwkghRay809qZiE7oHlAggLXnHkSrTmi+NdpqlnjUIoRm8qMkGZmk1bjgOROR6A
	RWUTaPXDSZ8AkhPoFCQaebqpmmvQykkgAxacBU03jvHG+jkSNqvd3AL4go0+JPC7TpP1RvqR2e1
	SZ+Ze5SaQ8amhfhwf17eq+5kUv/2R1rfkRNAn1Nivurm6oeniqhSxXB8Bin/fItGka9l015iIEd
	lLlDS36MXICjtsJeDIQLpSXGL38RrXBwT6mLN+GiB6CJNO3I=
X-Received: by 2002:a17:90b:2781:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-3933b87a55cmr10849502a91.13.1786747564109;
        Fri, 14 Aug 2026 15:46:04 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 019/109] function2: upgrade 4.2.4+git -> 4.2.5
Date: Fri, 14 Aug 2026 15:44:05 -0700
Message-ID: <20260814224539.1523174-19-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129083

The recipe was pinned to the 4.2.4 tag but carried a +git PV suffix; 4.2.5 is
a real tagged release so the suffix is dropped. Upstream release notes list
three changes: support for uses-allocator construction, with std::uses_allocator
specialized for all function types (PR #62); std::aligned_storage_t is no longer
used, since it is deprecated in C++23 (PR #67); and an AppVeyor CI fix (PR #68).
Header-only library with no API break.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../function2/{function2_4.2.4.bb => function2_4.2.5.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/function2/{function2_4.2.4.bb => function2_4.2.5.bb} (90%)

diff --git a/meta-oe/recipes-support/function2/function2_4.2.4.bb b/meta-oe/recipes-support/function2/function2_4.2.5.bb
similarity index 90%
rename from meta-oe/recipes-support/function2/function2_4.2.4.bb
rename to meta-oe/recipes-support/function2/function2_4.2.5.bb
index 588e44deaa..915eb1ed66 100644
--- a/meta-oe/recipes-support/function2/function2_4.2.4.bb
+++ b/meta-oe/recipes-support/function2/function2_4.2.5.bb
@@ -3,8 +3,7 @@ DESCRIPTION = "Provides improved implementations of std::function."
 HOMEPAGE = "https://naios.github.io/function2"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
-SRCREV = "a354bd093d2b6e50c9325dbce84d20b4e77aabc6"
-PV .= "+git"
+SRCREV = "496c20fede5378190fff471fcd7ee3d8705e5096"
 
 SRC_URI += "gitsm://github.com/Naios/function2;branch=master;protocol=https"
 

