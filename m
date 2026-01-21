Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F93C44503
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 09:02:50 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7880.1768986167719483961
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 01:02:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=C3aRUwbv;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso52540695e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 01:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1768986166; x=1769590966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4fU/FQsnSlLukjBFKj3ltKhA1gsPbEaqe59O9qnrAI=;
        b=C3aRUwbvLblsIcYFHLBWKyoQ0GHfErZqCmkclpY98gV1HZqlmw2P8GzVNoPdUG1fnu
         B+vv009j9WdMD4Vl1dRRenhPpNNSZ/IZ20fwF9rR5YAoXPM5feEJv7jD0A6umV9nDH58
         nzLFpUYmqGtFr6Rx98kPXtLGO38hEarw2+/UI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768986166; x=1769590966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n4fU/FQsnSlLukjBFKj3ltKhA1gsPbEaqe59O9qnrAI=;
        b=sEPHCAkSctOGT1/ElC8dvQvazZD0YsZnjLcVMPN4pSmWU+GLaa76btX9EHTc52tekf
         In/bNue4FX3tGjqc8/gCFaP/HYY2pLkTJhU7eAJQIBiNujlpXsJLbrCrQXtxB2T67U7T
         jBO8vVyX23Y8Oh0THAUE48DvRCZhq28eASRqpuuzq4zYf+0ztGXXsgNRjV+97WYOGY/N
         7ey9jOMZ0ovQGDFapfjnOn+BWrtdmCLsvKA8rFkofJ1VFVGJS9GzSU5BWEYOpEE2lH2F
         MZa+6y9qiCQEwIO6uJEF4SchuzMut0mQtN5pebkKNWrZVPXqhY/y/o/Hqy50c2Yaw2TS
         LmCQ==
X-Gm-Message-State: AOJu0Yw921ZF9mxrkfl3OJYv8h7D+EUcFa42JhmZNJQaxE3MvYal5FTo
	tOT98VUtJsBUGisZJrEM7Z+iLUIcuRIKhqJBWqm5M5pfBti2dMqLWrkIPVlr3CUBzKjQHWQpxHL
	O57Ak
X-Gm-Gg: AZuq6aIzwF+ejSVsxx4uYsxDXJL4A7SBvaallISKKyvGqXNyfFldahhcy+yxD34buwb
	iamVxGr5FQ3OonJdhXsa5G3TuUrCIGGwEYBmSBIUstD2zABbZN1EH/iFbG5r9a2BL+cLUfpSSFy
	4vWWm2Wkfei2oenUhWoFjVENN1jh//AeoelPAi7dRTkVd8EfrZBglAG3VYZgRUprJ+kwTxev0YS
	8U4ivfM/f+Yf/6oShPXEduIAEcjw3+fGqv7MO697s12bAfW7GLgp9fdAzfU/Ia+EMQ4wKIAAwg3
	Jbac1bTr6H5mbGSMiNOjq/D+XbniNGIBSNI0bHFKYXp/K0ONtkB17rCa8Kbn/6gw9m1RMH+Sexj
	gto+uyA8fmjgVMSG7rm04AiJE95NEGkhGnctb9QbmiZwx0pd0asJRswEE2QT8o7SSr1uEl6Reeq
	ArFgXRpMvkNld/Yw/ld3qj/y5ZEACzWKU5Op8=
X-Received: by 2002:a05:600c:4fcb:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-4803e78fdb4mr71417285e9.6.1768986165608;
        Wed, 21 Jan 2026 01:02:45 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8caceesm295050815e9.13.2026.01.21.01.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 01:02:44 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-pyperclip: Upgrade 1.9.0 -> 1.11.0
Date: Wed, 21 Jan 2026 11:02:40 +0200
Message-ID: <20260121090241.2437885-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121090241.2437885-1-leon.anavi@konsulko.com>
References: <20260121090241.2437885-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 09:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123690

Upgrade to release 1.11.0:

- Mention Wayland in error message
- Update __init__.py

License-Update: Use LICENSE.txt

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-pyperclip_1.9.0.bb => python3-pyperclip_1.11.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyperclip_1.9.0.bb => python3-pyperclip_1.11.0.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperclip_1.9.0.bb b/meta-python/recipes-devtools/python/python3-pyperclip_1.11.0.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-pyperclip_1.9.0.bb
rename to meta-python/recipes-devtools/python/python3-pyperclip_1.11.0.bb
index 80af514fab..09c7fc8f86 100644
--- a/meta-python/recipes-devtools/python/python3-pyperclip_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperclip_1.11.0.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "A cross-platform clipboard module for Python. (only handles plain text for now)"
 HOMEPAGE = "https://github.com/asweigart/pyperclip"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=d7dd4b0d1f7153322a546e89b5a0a632"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b6cd06fd72984ac1f8428337aec8cff7"
 
-SRC_URI[sha256sum] = "b7de0142ddc81bfc5c7507eea19da920b92252b548b96186caf94a5e2527d310"
+SRC_URI[sha256sum] = "244035963e4428530d9e3a6101a1ef97209c6825edab1567beac148ccc1db1b6"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += " \
     python3-ctypes \
-- 
2.47.3


