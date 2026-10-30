Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8915.1793358226907205652
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fW/DeeGM;
 spf=pass (domain: konsulko.com, ip: 209.85.221.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e6eb21a8fso221068f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358225; x=1793963025; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RltMLOWVMR2BZYOdqo+p7yT6Rg3vb1PbClSYef1NwSU=;
        b=fW/DeeGM6IwRkMBn2D0rT7P4uh9n2R/lqEH5fjjq6hsrmsCbF18xrUwnnJ9TWw9TtJ
         cGqD6wpO+TGqW0z16rcswkn7VK9eqRZZQ8YuWw3hMfBpeCbOfmChQ7YKO+o0XjwpQjKp
         TbTc8ZdtfzQwDASxeVfD1GQlWRHlGFfApbjW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358225; x=1793963025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RltMLOWVMR2BZYOdqo+p7yT6Rg3vb1PbClSYef1NwSU=;
        b=OJbyHbnKPyeNmd/tWj1XgAR7KXK+YCGEi+mf5Blbl28pUuoq0oSTNCBRdy8LVsT+zK
         T0fcO6X0xv+Vgf18ZbOyosKgjAU2sDpCs4jCDCkzCKoUyYLYQWPQx7ymVmHTSGdY16es
         FLGrWpdA92pntBhEGH3kNgMNMJrGqB2T4lDrDR8mAp6RdVEQ7ge1ZYsBpHyi1/4exuVJ
         v+OuMaXZ6dYP6P14CR1DWFbW4g5LA+CJ9Hkrotxt+jPbVc2JfKj+lEL7zW+oohK7OQ3j
         SicdNOeDPRULQz5danHxlkSmwOy+lQHsyU8as8dYOEok3xstA+vHwMvmLpE27qts10Wf
         w/6A==
X-Gm-Message-State: AFq9FYJRAXA8yS0jvsN6jWkFKG6+AH9FiGCdxGt4/CZBkhrJtz1djJbV
	N3dMx9t4bsBLUiLZEoeqzsn2s/T/4qtrDYx2ItGoEPt7fA4iNTtGivuC06X6cQMgDKu+L2hno3h
	XgjH7
X-Gm-Gg: AYBFou1dj0MEq1vt6uFLTqB+hHpUCaeoE7JGAio9O3H9jDoe3tfgSgUIwPYRwXivFcL
	Ghz/al/MaYwzEaENi3LsGvBI5Y4aCcdFA+fv9tpTZBh5SUSryC2ss5OuK1Cqk2WxX15v5vej8na
	6lb+SdmfnggsIQFD+qpL7l2O+iPz+Wnt2ELqtpQ8OjKlS1LWZGBlVV1DnbKmMKpfZ7nvrL9MZSW
	Au1lwR1VCaHTc3Td96n5LFxZqfMokl/GimE6GvhXpfaSLKMFu8K01uScPFTg40q7NBZg55sHMvF
	lF/52iI5xI5mgI/CzQN+IU6Xya1k7ni2vszF63RA/zWizX97OIVA5W9SLlaFmiSmpaCgAZmDABq
	zeWPWYXWAVRAqy2BxRIlJDi2k17XIjddqw+k670o7FV5stFcTkIFRI+R3xmFEutfuP6hgakEs5b
	I9BkY7Xf951gBTVJG+7aBayXp45S3PoGndLpMdqTx+WwcNfmxIc08ISUpR4CZy4+V2CS+laE4UH
	XLuIer4HMwf1kMjetl8HhAihSwAN0NWRX5zghXgf1RE4GwvRot/b4BwDmTvDn7SN4BXEPMwZUQo
	p3gfGNP49HEBidhjIpz8OHdvF8AtdXgFUMtGWBMT/bHh5SMCJLL74ryZp0rqi53PoMq8hIP2J2F
	SX0Vy3+LypFnvrzDuXIP0t6dZqFEirypH9sSPUU+EfO0/EcQwMQAHNQ==
X-Received: by 2002:a05:6000:5c1:b0:48e:7470:9eb9 with SMTP id ffacd0b85a97d-48e7470a047mr776271f8f.43.1793358225070;
        Fri, 30 Oct 2026 04:03:45 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:44 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 24/25] python3-requests-futures: Upgrade 1.0.2 -> 1.1.0
Date: Fri, 30 Oct 2026 13:03:08 +0200
Message-ID: <20261030110309.1124614-24-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131706
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.1.0:

- Cancel queued requests on close
- Remove the unused build attribute and the Python 2.7 NullHandler
  fallback
- Close owned sessions after their background requests finish,
  including when using a supplied executor, and reject requests
  after close
- Pickle check covers request arguments, not just the callable
- background_callback now emits a DeprecationWarning instead of a
  log line
- Fix pool sizing for supplied sessions
- Preserve falsy callback results

Fixes:

WARNING: python3-requests-futures-1.1.0-r0 do_check_backend:
QA Issue: inherits setuptools3 but has pyproject.toml specifying
backend setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...sts-futures_1.0.2.bb => python3-requests-futures_1.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-requests-futures_1.0.2.bb => python3-requests-futures_1.1.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-requests-futures_1.0.2.bb b/meta-python/recipes-devtools/python/python3-requests-futures_1.1.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-requests-futures_1.0.2.bb
rename to meta-python/recipes-devtools/python/python3-requests-futures_1.1.0.bb
index 715542e8bf..345ce5f578 100644
--- a/meta-python/recipes-devtools/python/python3-requests-futures_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-futures_1.1.0.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/ross/requests-futures"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e1e50798d0afe0e1f87594c6619a2fa5"
 
-SRC_URI[sha256sum] = "6b7eb57940336e800faebc3dab506360edec9478f7b22dc570858ad3aa7458da"
+SRC_URI[sha256sum] = "f839cf536e6638a6e0ca1cfd54ac761bf3bb2b5a7ecf9349557e53acc5244d36"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += " \
     python3-requests \
-- 
2.47.3

