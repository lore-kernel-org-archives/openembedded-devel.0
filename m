Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B536CCF9E3
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 00:33:23 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.4340.1761870802758025586
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 17:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MfSTe7Y9;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b6cf257f325so1432900a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 17:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761870802; x=1762475602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u1+JpSYjIxOwQUJK6I8weeYnXRIZMgy3WVzh1zEhxhs=;
        b=MfSTe7Y9fZijIX/j4n678uAltHxBVeoAR3IUQBnvge1hIN3vacqDn9TBNhhM8HI5DD
         JT7qMRz/CEM7r4+cfLRW/BkbGyZtB0sVhTa6Psk5OlsB+gVL2jwGQSvravoWNoPEXkW6
         bBQx7zRUcn1gF0NYkYvBHlEjqMxAGJ1lE2MMNDPEFHc84m8+3+C3mqb04uqkn3pyOEgO
         q74Kp750Esm39558/gWoWAkkSDOhbWL16y3mLdV5J+Q67KRmPGVPnZ+cyznXuz64+thz
         zcCnQlgrBabSR9cVtnOanUoZBDuIkkBctMaGDOn5sUFp+iDWlJGWTgWWZv03MRz4XGS1
         CyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761870802; x=1762475602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u1+JpSYjIxOwQUJK6I8weeYnXRIZMgy3WVzh1zEhxhs=;
        b=EsWYVJANwiq/faQf6EKrKGFN/bH0u1fZvd/H+mCskiJPYecy+tFRi78RuqEMOqwfMj
         VcMXBa1VmeeiIxqT+t29On5xt5Eajv11ZHlKJSJQQxZQEp0qz8fJXdTp0PSvagBcKKLt
         vw7N7GkEBH9lKxE4jgJnGZf50MdGv1KtI5CyDATGrq8rcM8hOqTTwf/hrHq0qL24ZUAy
         bZFM/mCs5w6Lshwg4CPrfvOmySgAWfq5LyNCu7G3jGZ5AcJAb6zpl253EyweR7SJwoZU
         vK1lQN4mv3X673DpO5Ns+KixzoVx9ZgYjqx7T9oVOqFIy50kx7NSdgu7TKuq7Ghbo6tY
         rnEQ==
X-Gm-Message-State: AOJu0Yy9XIegXdv9XqxzNtrm3aX1aET0Ic9svOcHmGkRHkZa6XHXVXNh
	PnOjALPdXaIF0nBCWcHo6rV0J9zuFA+fqoXxqAe7ryj736PF1ktehrTmRmXY6PJQh5w=
X-Gm-Gg: ASbGncuUAFDO7cnr5sTY3VNriSvvsnOC2AkpyeABGJSG0In7BNfsC7noT1XFhszla9M
	kxnW2xHHsRxo7O/CO797o5rVbXZ4mwKnJdDFS9j0RI8eaUPIqRhfMU1JSZrY/TYIDHXd0JqnJUU
	KaPd/ymf8Ly/TCB0nEIFh27La07FelhkR2bjUXjvahwT/xPoRVrgjTLXj2+ofIlmZw+Uca9rtYe
	P4s+3zpKFqv3CldAdsfs/tZmiVBme7uiK1Qi0nRiFdeOP0yczPGXVxyKe4SBz8/RiHawCH/B4eD
	IdJg/18jHXECiErWb3HaOMFOTQk+kLxmbY0zIOG+zh6ud7NYqH+3ozeODRd2QZx932hGJo4I3d9
	jgHw964UFLzHPn33jcDrMZ52DjI7S+qT1M4BUw0R5oFyIBZj0cD20EkxFbY3ZS1DDo+lWqqg1e7
	hW/FuJK8Rf3m7Vfg==
X-Google-Smtp-Source: AGHT+IE+IzsFTAzFjGn7Rev4M4U2t/dn3XTWktrLQsHRwJFPH2ZC/X9vZeiksDjWazfEGY7INovPLA==
X-Received: by 2002:a17:903:a86:b0:295:1a5c:355a with SMTP id d9443c01a7336-2951a5c36d6mr20185545ad.61.1761870801749;
        Thu, 30 Oct 2025 17:33:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952699b603sm2208285ad.79.2025.10.30.17.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 17:33:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH] neatvnc: upgrade 0.8.0 -> 0.8.1
Date: Fri, 31 Oct 2025 13:33:14 +1300
Message-ID: <20251031003314.2860674-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 00:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121211

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog
https://github.com/any1/neatvnc/compare/v0.8.0...v0.8.1

This release fixes CVE-2024-42458
Details https://nvd.nist.gov/vuln/detail/cve-2024-42458

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../neatvnc/{neatvnc_0.8.0.bb => neatvnc_0.8.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/neatvnc/{neatvnc_0.8.0.bb => neatvnc_0.8.1.bb} (89%)

diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.0.bb b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
similarity index 89%
rename from meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.0.bb
rename to meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
index c9c4a6c27a..9065050c62 100644
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.0.bb
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "https://github.com/any1/neatvnc"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94fc374e7174f41e3afe0f027ee59ff7"
 
-SRC_URI = "git://github.com/any1/neatvnc;branch=master;protocol=https"
+SRC_URI = "git://github.com/any1/neatvnc;branch=v0.8;protocol=https"
 
-SRCREV = "46432ce8cade0b54a38d4bb42eb07f96c8ff49fd"
+SRCREV = "07081567ab21a2b099ceb41ae8cab872a31cbb9a"
 
 S = "${WORKDIR}/git"
 

