Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A898C02199
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 12:37:05 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.39774.1738845415211364465
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Feb 2025 04:36:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RIYrwhvt;
 spf=pass (domain: konsulko.com, ip: 209.85.218.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaec61d0f65so203972666b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 04:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1738845413; x=1739450213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4TjuYyZosfitZNp9IrwPEkMOcnLwnHA8MpirUKAO65M=;
        b=RIYrwhvtHYNDJaGt+M6at3nc9HpX6UES/n5yhgtcrGubWG2vNoc3IvKvZYcRS5Hb8S
         uQKADyvw9MgsrT6QIbuM05MZCeYxJCMvWah0NdsDauZ/7OXQpKvshYNiW0hWpsl9GhA8
         XFLVa1/svHaCxIAlomCfUayLv2f7F34T4vhaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738845413; x=1739450213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4TjuYyZosfitZNp9IrwPEkMOcnLwnHA8MpirUKAO65M=;
        b=SYDn0lkGQJ6VaXqCpzegW+N3JVwgc8GrXj2CX/MM9xLMT/17YYfwdRaoqNQwb6FE5T
         VM5JYNMawewp08dZBlODZoTkgeA9pgeoJtvI9Lxh9NTeAaFcWm4aM1xUS4hgZ3rP6LkW
         G/P6SItL/yEQ035l5LLHjK1mahC4oYDh80FuPnxYTvM+45NuzhjVEvzKuyIiXL/TjOMi
         WhPLLy87DzR9O9HSZicYnFtVk5875fmjyapbSfAwFmlOrqMgZ/t38vykD30LLO3dv94B
         z3t1P2eBsfUFOnO+hALWwnL04aDp+Exs+D+8sCVwLKizkTMYMhriqlgi7uM+6faoe8jZ
         wCRg==
X-Gm-Message-State: AOJu0YwtbYST5BqRMhG8/j9HAyU16Lz8nq7S9GuTJqz2BgwcV/Kc6bwb
	hEd1++m9DT/9xCqkel/VfH873y2vn+dI6mGDaH2L/ERGE+SXM+xQriv85C1u2Qz/g4Pmpd8tGGc
	1
X-Gm-Gg: ASbGncsfIX2O2uyZnx3ny9Ok67vgk0lTTMTcmwuQB9VNRyo/i4HXMDoirJxYYr2Hk+L
	0bgxWCTBBsUe+hkFeM1lXnYmw/hDqay7sg/c1snJVrp+8R89EA5fauU+iSdK9IeapeFPyZcug4C
	PDhGq54Q2HBXVegqLVXg9iGHVzRkfoQg6FbC7jUUbD8mkPLdPdSebnpgIbf36MeMZ0OYRNXtiR9
	OjSB6HoFu+drFVXoy00RRrAlcH4libylOIlGqFD5zm9Jyv/R4fvTi9QeeL/fjHAHFitvoZ2iS7F
	mo9Xos5A0bRww96pcmfa3JNvslHwVQ==
X-Google-Smtp-Source: AGHT+IE5GkZfRmQbOZhSRzdP1Spv9erz67dfJsJvxY9J0z26ZNWlfvVGJeCC0K76YNm7hKyJyH7uFA==
X-Received: by 2002:a17:907:7d90:b0:aaf:74d6:6467 with SMTP id a640c23a62f3a-ab75e347a2dmr731578866b.42.1738845413192;
        Thu, 06 Feb 2025 04:36:53 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab779832909sm56927066b.49.2025.02.06.04.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:36:52 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][scarthgap][PATCH] sip: Fix homepage and license
Date: Thu,  6 Feb 2025 14:36:50 +0200
Message-Id: <20250206123650.118049-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 12:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115287

After the migration from Mercurial to GitHub the homepage has
changed and SIP has been licensed under the BSD-2-Clause license
since Feb 9, 2024, including for release 6.8.6.

This work was sponsored by GOVCERT.LU.

License-Update: SIP is licensed under the BSD-2-Clause license.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-devtools/sip/sip_6.8.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.8.6.bb b/meta-oe/recipes-devtools/sip/sip_6.8.6.bb
index 157e404515..1defe29b08 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.8.6.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.8.6.bb
@@ -3,8 +3,8 @@
 
 SUMMARY = "A Python bindings generator for C/C++ libraries"
 
-HOMEPAGE = "https://www.riverbankcomputing.com/software/sip/"
-LICENSE = "GPL-2.0-or-later"
+HOMEPAGE = "https://github.com/Python-SIP/sip"
+LICENSE = "BSD-2-Clause"
 SECTION = "devel"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ed1d69a33480ebf4ff8a7a760826d84e"
 
-- 
2.39.5


