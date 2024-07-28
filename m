Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC635C3DA64
	for <webhook@archiver.kernel.org>; Sun, 28 Jul 2024 07:00:14 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.30860.1722150011491415488
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jul 2024 00:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cclohHGY;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fdd6d81812so16141615ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jul 2024 00:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722150011; x=1722754811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bGaf9Ec4mOePhpb9TX1YBSHY+XdlQ8yyX2EF8k7BMhw=;
        b=cclohHGYhzKAnOLC7R57IcWLgSu7EL8ClvigPjr3yGn8umFbRiSbKa96EFtYN1NXZa
         YEg84u+PWo3nDMcTI1mkDGFNxNlxf960NB2RfXatV5sZelrA22yQssPfTcuHah/eZ+jk
         jXHU3EwzU36wJC6lgAa+jy62R41v3Htpm0OjBdNdjdjNdBHY0YFqlT8ffwtVz79ZTQdK
         k1bdAnbKoPEmKRMF3VmBGCHp4bI/tq2zyVPnPzqQzddEMaHo7caTuocTuGcHKsF+CkxS
         Y93MRk+4suOxwMKdSQtHOeADL7oiQ/PECQKXZMAbhVgQFGyg8hUNxNyJ1SegHPUYCeXo
         jIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722150011; x=1722754811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGaf9Ec4mOePhpb9TX1YBSHY+XdlQ8yyX2EF8k7BMhw=;
        b=Ms0CZdg9xSYFBJf0ZZjfmEOjjl7/kMGUMb1G5DlM/H84nY6lVCTQPXrwB6zJSmsYBH
         Q/2jqwIn5LOBz8mdr82jchy2a7yZU57rpYNc20EPSjOcKNOPTbMCnkd8CrgQYxJyB9wc
         kgWw/V5r9cl7gZnEOulzXKtvEMhtqwHarVOaOS4epBizT+0acOCyW29xiMFctx4xPaUJ
         K7viLtLuhPEEWWy8NdRl1PDFg/A14jLPGGwZQc0ruY1Wmzqo1fSRC3kQ1164c5eF3B9W
         3eSNRqreXOnhXmVt22BnFHeAvppExOO02RpNk42XADJto5gFrOmzr4xz+nlJfj6TLNt9
         IvNg==
X-Gm-Message-State: AOJu0YzGFAc8FyLTW5t/2N/sHjPZ6zvHtTJMJk/6leaJ9wcRMfF3ObRo
	hsuDWz//F65gcZwUSDLNvmCbq1RTllGKHgxre8NZuzReuEDQD+Os75GEqiwg
X-Google-Smtp-Source: AGHT+IGuG1SfyhB2zicUEKsBFW5TES0tEkypZT/dpGC+gqfiBR5K/0zW7LkeWCrrN+jRh/TKYRqZ+Q==
X-Received: by 2002:a17:903:1d0:b0:1fd:67c2:f97a with SMTP id d9443c01a7336-1ff048d4ca7mr51267265ad.47.1722150010427;
        Sun, 28 Jul 2024 00:00:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4c22])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ffcb9dsm60210645ad.306.2024.07.28.00.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 00:00:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] ldns: Upgrade to 1.8.4
Date: Sun, 28 Jul 2024 00:00:08 -0700
Message-ID: <20240728070008.419793-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jul 2024 07:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111448

	* Fix building documentation in build directory.
	  Thanks Michael Tokarev
	* Updated the configure script for split openssl directories.
	* Fix for windows compile; asctime_r compat, search for inet_ntop
	  in ws2_32, avoid double decl of inet_ntop, check for symlink call,
	  include config.h in edns.c, have socket compare use correct
	  signedness, add -u repo option to makewin.sh, fix quoting in
	  makewin.sh and check return value of bind and connect in net.c
	  for failure instead of a socket type. And fix to install .exe files.
	* Fix to compile with OpenSSL 3.2. Update acx_nlnetlabs.m4 to 48.
	* Fix to compile DLLs, and pick out of the lib64 dir, and include
	  libssp-0.dll and ldns-config.
	* bugfix #237: Resolver uses nameserver commented out in
	  /etc/resolv.conf. Thanks grembo.
	* Added RESINFO rrtype.
	* Added WALLET rrtype.
	* PR #241: Fix coverity cited problems. Thanks Enji Cooper.
	* PR #233: Several Python SWIG issues. Thanks Florian Weimer.
	* PR #231: const ldns_rdf * typemap fixes to support swig-4.2.0
	  Thanks William S Fulton
	* PR #227: keys.c: fix build with libressl >= 3.8.1
	  Thanks Fabrice Fontaine
	* PR #224: Portable executable progs don't underlink to libldns
	  Thanks Ørjan Malde
	* PR #216: Update declaration for function with no argument
	  Thanks Ed Maste
	* PR #214: fix the build in FreeBSD's base system
	  Thanks Pierre Pronchery and Dag-Erling Smørgrav
	* PR #206: improve 'next-label' algorithm in ldns-walk
	  Thanks Jelte Jansen
	* PR #205: Add functions to extract RFC 8914 extended errors
	  Thanks Roland van Rijswijk-Deij
	* PR #203: Expand CI: Cygwin, BSDs, musl libc, 32-bit, and big-endian
	  Thanks Felipe Gasper
	* PR #191: 16-unit-tests-edns: Fix leak & warnings
	  Thanks Felipe Gasper
	* Added NXNAME rrtype.
	* PR #242: Openssl no engine improved support #242
	  Thanks Petr Menšík

Detailed Changes [1]

Fix buildpaths QA errors while here

[1] https://github.com/NLnetLabs/ldns/compare/1.8.3...1.8.4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/ldns/{ldns_1.8.3.bb => ldns_1.8.4.bb}   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/ldns/{ldns_1.8.3.bb => ldns_1.8.4.bb} (76%)

diff --git a/meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb b/meta-oe/recipes-devtools/ldns/ldns_1.8.4.bb
similarity index 76%
rename from meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb
rename to meta-oe/recipes-devtools/ldns/ldns_1.8.4.bb
index 16816e62d8..f071f579df 100644
--- a/meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb
+++ b/meta-oe/recipes-devtools/ldns/ldns_1.8.4.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34330f15b2b4abbbaaa7623f79a6a019"
 
 SRC_URI = "https://www.nlnetlabs.nl/downloads/ldns/ldns-${PV}.tar.gz"
-SRC_URI[sha256sum] = "c3f72dd1036b2907e3a56e6acf9dfb2e551256b3c1bbd9787942deeeb70e7860"
+SRC_URI[sha256sum] = "838b907594baaff1cd767e95466a7745998ae64bc74be038dccc62e2de2e4247"
 
 DEPENDS = "openssl"
 
@@ -19,5 +19,6 @@ do_install:append() {
     sed -e 's@[^ ]*-ffile-prefix-map=[^ "]*@@g' \
         -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
         -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
-        -i ${D}${libdir}/pkgconfig/*.pc
+        -e 's@${RECIPE_SYSROOT}@@g' \
+        -i ${D}${libdir}/pkgconfig/*.pc ${D}${bindir}/ldns-config
 }

