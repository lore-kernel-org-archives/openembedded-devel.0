Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 093C5C282EC
	for <webhook@archiver.kernel.org>; Sat,  8 Mar 2025 09:04:51 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.6122.1741424684155656892
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Mar 2025 01:04:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bwZLvw+E;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22435603572so17262915ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Mar 2025 01:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741424683; x=1742029483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyCqPfR7C7MFd4MVbfeFA9xfS41rcGB2YFQVzV11FqI=;
        b=bwZLvw+E1YkfPq/xNTNX12WWD8AxLHiGNR8j7qiWrQyOcPtQlvr+BaJZ7f9drU/SBz
         EBCTtlIHwacozqE49nCYPyePG11dKIypR2i1Ta8+g2GiSF9RKejA1iKMERhcZ8JbVQPK
         pUVi87jfOmQql795SgiaFQ+JwFL11rqlcQJdkZ8dZQp1gu+H0OnE3okyaEYbejCok2TV
         trarut2VPa23RVa6Z1CFHALoSZ0vfsbPt1rR8ogAvqQsWzV2zd4jXowcU6d4CUz2hv7P
         Nnm04nf+S6RcIHrODvuZAgITbVmRQXkYg73lffbUjpK6FdlSgsEsQC/rN6xhjZ2RTxeS
         Btsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741424683; x=1742029483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyCqPfR7C7MFd4MVbfeFA9xfS41rcGB2YFQVzV11FqI=;
        b=TkSLFCHZ2Lhjh6eLmQJ4+Xn3Lmt7KTkkv0RPT5Jy5XmsOOsNzXB1ITxa7XV3JAXjhl
         jnlZe5TDMAOhggIq0LdKWX587Ut9tb6hO4fKLDd4t4n19zvLdkNwf1JBs9jUzCIPrNas
         Sed9HdotwvsVRjUC7mpPKAG0fsuFMjnrEOh35caFiXhNc5YSNrS/4QDplQB6m8/lCNZ4
         t+GfKN5hrDZrWWz1d0fMsxVhgCPa8ur8WDCcji8WyZLAdegr3vr1rkuaVGLSRLpbuJYA
         lquAbSCbkXpEToFMegTmQfgecwp/NCj5nKU/YUAPy7M1qCj1pKtnIiM1owZLdfZ01U+m
         cxAw==
X-Gm-Message-State: AOJu0YwSTjZmk0aDPOu4/ZHgtu/t4649sHo6Y2Jf0v2mAy5G2m7L+GQk
	4MqFwUHFMpYjqztzr21ylizpqJldhR0vWDMyNef8KJiRfQ7DHfiARVpebw==
X-Gm-Gg: ASbGnctsa52JwqHnkhlh70PGf9J7YtbMZvH0lVi1oOA0zQjhdY0UV0XKdECAfF9U5XX
	BX2AleZ5SfSKjBRJ6cvDZbAterFf2fCJQokJfdYgoJTvlLPOXMmOGEmA+BkQCjuDZFWS9DbFZGk
	lJRB3vaRpF157sieihl3gUOxFc7UTbfrB7Xo/SMlo4bqINktVGTFsF6EQ0/BF2gt7Op86tRh+G9
	9vSWUv8SR4nG9cbWipyNXWUfR8KDzu544nLlF3MitPL7B1P56p4IVw2iWQylIqo+GryA0i5Sz8Y
	eRgmahUCUOx+XyDOAbgUoyonni/dgUjbqWzmxWf/uUhlsliH6e+19A==
X-Google-Smtp-Source: AGHT+IEbxXo8atxDBCpX1h1tfW+FfpB54EPu789HrOtDBAjfC0s3drvsauc4SOTj3JZCyuZJBIqhlw==
X-Received: by 2002:a17:903:192:b0:224:1ec0:8a16 with SMTP id d9443c01a7336-22428a97f21mr109823725ad.21.1741424682941;
        Sat, 08 Mar 2025 01:04:42 -0800 (PST)
Received: from L-18010.kpit.com ([49.36.57.235])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af50bc9b28fsm2124984a12.60.2025.03.08.01.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 01:04:42 -0800 (PST)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Claus Stovgaard <claus.stovgaard@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 3/3] lcov: Add missing RDEPENDS
Date: Sat,  8 Mar 2025 14:34:05 +0530
Message-Id: <20250308090405.345593-3-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250308090405.345593-1-akash.hadke27@gmail.com>
References: <20250308090405.345593-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Mar 2025 09:04:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115806

From: Claus Stovgaard <claus.stovgaard@gmail.com>

Found by just adding lcov to core-image-minimal, running geninfo and
getting errors like.

Can't locate Module/Load.pm in @INC (you may need to install the Module::Load module)
... at /usr/bin/geninfo line 63.
BEGIN failed--compilation aborted at /usr/bin/geninfo line 63.

Can't locate Module/Metadata.pm in @INC (you may need to install the Module::Metadata module)
... at /usr/lib/perl5/5.38.2/Module/Load/Conditional.pm line 14.
BEGIN failed--compilation aborted at /usr/lib/perl5/5.38.2/Module/Load/Conditional.pm line 14.
Compilation failed in require at /usr/bin/geninfo line 64.

Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e7f560b9b8dacf7aadf59d6321c2e869dcd5831e)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 meta-oe/recipes-support/lcov/lcov_1.16.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.16.bb b/meta-oe/recipes-support/lcov/lcov_1.16.bb
index 53e1921054..81b80790fe 100755
--- a/meta-oe/recipes-support/lcov/lcov_1.16.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.16.bb
@@ -9,7 +9,9 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 RDEPENDS:${PN} += " \
+    libjson-perl \
     perl \
+    perl-module-compress-zlib \
     perl-module-constant \
     perl-module-cwd \
     perl-module-digest-md5 \
@@ -27,6 +29,8 @@ RDEPENDS:${PN} += " \
     perl-module-getopt-long \
     perl-module-getopt-std \
     perl-module-list-util \
+    perl-module-load \
+    perl-module-metadata \    
     perl-module-mro \
     perl-module-overload \
     perl-module-overload-numbers \
-- 
2.25.1


