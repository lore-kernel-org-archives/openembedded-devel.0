Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB6FCD98E4
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 09:28:33 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11428.1781688506991761870
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 02:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EK3bet64;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-492329c5514so3412415e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 02:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781688505; x=1782293305; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvfUcuKV43eO5ZgtyNSTQEI6aV8hprXj4tUulRYI93U=;
        b=EK3bet64GGvkcyypF2IleAIYlXkzukjaBjTOfe2zB5XirLpUffF5cZtwrzJGq8zNhs
         3067ceyLNqE4/9035wT1bbVHFU9FK85CKHnlceWxFWYzdHQtFOrg+g/7v+uekscoN4KV
         grcT6gJ/wb/06IiGYb3Sm7hMqCpUkO8Hts/OQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781688505; x=1782293305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UvfUcuKV43eO5ZgtyNSTQEI6aV8hprXj4tUulRYI93U=;
        b=LymRvwD4qHICfy5xUNDmWOG8XomSDQwdHyQWKKgx1diyu/HEtqccA2ItmkT5ENzWGR
         u8x6fv8+vvCT5bpx03FJ6qc9IEuyn5xXXrbdBjlvWlQFX058nrUNcly07WCVDkYIr3Ku
         ObZXx9BJmQmI/610KRSzTStIbTGb5YvGUm8CtTI3TBECXc6/peaF31KvTgX801fbBFVC
         3g697Y2vkpIbdqWUj/2v2QMXGRf761UHa8sjAVj+ggEUpX8+/4yWYVXAaE8kugMklL2j
         gDdSXZJoRkq9nFR9Kia7ZDcbEnwtJCpw3PTKemaPTlHPIsNWgR0NP+3x8vdmHML8obAk
         1sfA==
X-Gm-Message-State: AOJu0YytAbtLBXmg5EDM5O8RxV8ULUd+Ocmmi3AYz8DgNUHjhHuPf2vu
	czzdTS6TPx0d2PRDnWJKQXNig8HFyBugFgA5vDnzr93gF3NcjoWqppe5WjLG6I83Ksd2wG6nTOr
	cjhzy
X-Gm-Gg: Acq92OG+zKq2cpyIFqAHFciWfYy4n5hdr7/hAs/08e37zEaROo6JQNiFtsdBitg3Nvc
	i6NHZwKj7eUAb/CxquCXDmgT+tB8oJeuWx5jcF3towS6lSAB1i3BvyX1Ulb8FFS7Pu7BvZOgxgl
	RjKedVRKtYfD8azYTIrrPx2STReKzQm0hr47NUEIevmgKc1wxUbZpVmttnJFqsdjIe4pMGNVv5/
	GFJRuM9at7I6TQU1y71bNjIfSalYr9zcmp2fKr20RgodNG5WmBEJs5i5UOYDd05bOQxvOF920Hv
	x+DmaCojhomoN6pA4ADTvJfvIun/KPG0LDK2BHjvlQ3fY27iJ2ZdRu8PCCXlw1tiCFO8ZvxGc5k
	ASXx9eCIlOowflPuBKpPVn0tfVgZlW56ObyeZbrux3wR3Es5vfb3id7+ResZyJC8Q7nzhKv7QEX
	NV/5BaqFX+WlEIr9g5y6ZmD/6j9w==
X-Received: by 2002:a05:600c:1382:b0:48f:e230:29f4 with SMTP id 5b1f17b1804b1-492340eb75fmr31450425e9.15.1781688504749;
        Wed, 17 Jun 2026 02:28:24 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4601esm154647225e9.1.2026.06.17.02.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 02:28:24 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-wand: Upgrade 0.6.13 -> 0.7.1
Date: Wed, 17 Jun 2026 12:28:16 +0300
Message-ID: <20260617092817.4090239-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260617092817.4090239-1-leon.anavi@konsulko.com>
References: <20260617092817.4090239-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 09:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127656

Upgrade to release 0.7.1:

- Updated accepted animation formats for Image.animation property
- Added new FILTER_TYPES operators
- Fixed Image.length_of_bytes() method by refactoring & applying
  c_magick_size_t type
- [DOC] Fixed typos in documentation

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-wand_0.6.13.bb => python3-wand_0.7.1.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-wand_0.6.13.bb => python3-wand_0.7.1.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-wand_0.6.13.bb b/meta-python/recipes-devtools/python/python3-wand_0.7.1.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-wand_0.6.13.bb
rename to meta-python/recipes-devtools/python/python3-wand_0.7.1.bb
index 8de764a7b6..b050390014 100644
--- a/meta-python/recipes-devtools/python/python3-wand_0.6.13.bb
+++ b/meta-python/recipes-devtools/python/python3-wand_0.7.1.bb
@@ -2,13 +2,13 @@ SUMMARY = "Ctypes-based simple MagickWand API binding for Python"
 HOMEPAGE = "https://docs.wand-py.org/"
 LICENSE = "MIT"
 SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0bf19e5c00d047fee994ae332db3aab6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2a2b05e6331064556e971cfa0efca0bf"
 
-SRC_URI[sha256sum] = "f5013484eaf7a20eb22d1821aaefe60b50cc329722372b5f8565d46d4aaafcca"
+SRC_URI[sha256sum] = "2325eae60fb21b88e293d5ec8dcdedf2644a0c00eb75024c9b47975e1e902e80"
 
 inherit pypi setuptools3
 
-PYPI_PACKAGE = "Wand"
+PYPI_PACKAGE = "wand"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 FILES:${PN}-doc += "${datadir}/README.rst"
-- 
2.47.3


