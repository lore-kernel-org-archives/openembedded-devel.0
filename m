Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D687CD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 19:46:51 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27888.1781812005031032328
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2026 12:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZcCwxd1S;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b9318997so9248225e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2026 12:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781812003; x=1782416803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0kgCeviRkBcD4m0a0IgJXyAi4fmy+4RNjTA4gcEUwo=;
        b=ZcCwxd1S62MDngiABZc6irmeu7zVyXipIZMaiTsJU+axq4MuyA1c3XUyi24hjJ6SFh
         6UEcwVv6dakg0OQK7pCyPwjfq77uTD+npFUTE30n+MBjsotUuULcoLKjziF/91a+qbx9
         Du5Hauf9x34JCqHXOK4M3YLeA3XWrf3sRLcBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781812003; x=1782416803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s0kgCeviRkBcD4m0a0IgJXyAi4fmy+4RNjTA4gcEUwo=;
        b=iuIr04Ry7WYf79kAhiCCpYfsIykwX39Rc4wX6BEesdrAb6k7eWx70WFtJA0fXSIcAi
         7loxiK21bpDXuf6BkxvtDwOwmqepGNBxe6nkjJepWpXsRg2YKogeK4RHXLxmGUfLNQpa
         bYgUtZ+F3kElQZNbWZcyAIQJkCN/o96Kt6h/f3dZs70p8pyS4yIQ37VFiCGOWSPKhdWy
         4mVBBr76q6OF8O4QmKUyKwwCPV9B3kjyJLZvF5vVS69YIzRTQyYuToDhlisOZaeC4yBj
         E/3flerZHc+KBtY+NtjKswVhS5oiRwc/im7+5TVyiww80C5PQHnZ78HD9i4It+ZYeBuz
         Hehw==
X-Gm-Message-State: AOJu0YzvUvl7fhY3FJlgIGCYFCht9N9SrENLmtGyTXl7I1Oye83nR1ZU
	XMRBwUCTH/eLJ7yjdQXSgmtFXq09i52kO3MfB25IdtO9vXXgb9VPrH2lIVd3+9UwKCSUR8mzkhY
	mDjK7
X-Gm-Gg: AfdE7cluZKh8AawuST32fp32+dPOgof09NXuuBmO6F/N9+JOSC4eYSBNjkg1D/tGsEX
	A45Rk5KYjDO7O3gZtRTFKvjXlluG6sKw3krkF/jufx4DdVEVZFxKbWiqRimZM6QGwQLKcHSsGuo
	O+XrdhfKH9EP3kNJBZN9ZXee12LrXRTU06XsWYfq+xZfLtDsidqIQYpPJVZAcizVvy2gDdv4HSJ
	CkPCpY9yFr/t0MYJvwA8gYr7ol3v/Q6oIS4ngsr/XgKd2Drd/d2h980zUx5Buq081R1Fk3BIYn+
	0YTLve+f0s5XjV4kAPAj/PcgHSaQi7c2B/gjdQFG2H/YCpkR+iok5DuDzKdVJ+q2mCT9D2gC4Qb
	eKRSAMB7/hUwCpfm75MDk02n/n2IoT3OyZMOclFgdfcl6266aM3pfs4JHnJbanXE80dz9MVlTjA
	W4uGb9ojR0DCkKOXp/NXRZ+LDOlA==
X-Received: by 2002:a05:600c:138a:b0:492:1e7f:d41e with SMTP id 5b1f17b1804b1-4923f14c484mr16910025e9.10.1781812003359;
        Thu, 18 Jun 2026 12:46:43 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fce9561sm11889395e9.5.2026.06.18.12.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 12:46:42 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-greenlet: Upgrade 3.5.1 -> 3.5.2
Date: Thu, 18 Jun 2026 22:46:38 +0300
Message-ID: <20260618194638.1802073-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618194638.1802073-1-leon.anavi@konsulko.com>
References: <20260618194638.1802073-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2026 19:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127669

Upgrade to release 3.5.2:

- The minimum supported version of Python 3.15 is now 3.15b2.
- Fix some garbage-collection related crashes on free-threaded
  Python 3.15.
- Improve garbage collection of greenlets. This mostly applies
  to Python 3.15.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-greenlet_3.5.1.bb => python3-greenlet_3.5.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.5.1.bb => python3-greenlet_3.5.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.5.1.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.5.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.5.1.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.5.2.bb
index 133d80331a..6ea765817e 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.5.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "5a56aeb7d5d9cc4b3a735efb5095bd4b4f6f0e4f93e5ca876d0e2315137b7829"
+SRC_URI[sha256sum] = "c1b906220d83c140361cdd12eef970fb5881a168b98ee58a43786426173da14c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


