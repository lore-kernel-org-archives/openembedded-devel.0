Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21717C44507
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:06 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69125.1782634317650280027
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J7Wgp3OX;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so4928679eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634317; x=1783239117; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPvciNP2RemdHZxxYRAgvurTv1akdpvf+USK42DRB2o=;
        b=J7Wgp3OXQmVPbi4dNOE7PDoSUY3FTfA/jdw3L+kJliUr08Yr28PlUPDAHq0wZ+VSPA
         wHpuF3FjrBPVP/8Wcyc6AL7YGGtq9g2XsRjV72z0/FqMQVYQCQFFw0XLs/DKkKB6DtwA
         usopRR34+omQotDM+K+TVh4ocCgnuUTjIOE8YLnFPK1kz+kSglgWyG7IjFPHtXAl9QQA
         fB8/pphdFUGVGHFw/XkedzuWp3eBuIjO/ajR8T0NoROeVr52p+i6yU7rypxlLoxA4W3w
         6U3fEgoxDhshRiPPr0Mc6F9IHDxHJs5205rf1ntusEX/qV3EfgRt/wqQhc3cXNn4RKTn
         mh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634317; x=1783239117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cPvciNP2RemdHZxxYRAgvurTv1akdpvf+USK42DRB2o=;
        b=I3GwgGMGvGHUgMkWhDrvBNAuuW0FdUJ0zKKMgOgpc+zg3llv7MMBWZbvTkyazIUFr+
         MY6g8fAWcA9gEy0pKOONSnVYW4AIQ5mX1+gNn9Kgb6OAhkr779P0rDcoU7Hv4oFBH4+t
         kkeN6GmG/3Qo1R99TsDrBgz318z5q9535c4AWrFXyQQj5cS9vzgwQUg7Q3B4s9J6NcZ1
         mnBuh3+jO2x9NXzgMQtVZial2Zk3DjbHluhS9ag7Bc1twHhw49PIBDnu0HOfWy/KwoBP
         tTGkoMJsH9YXBm8v8x/wlgxd1PdintxK6YFxK6ys1200FAiIaPl6yul+8cngp5zPw9jU
         ZMhA==
X-Gm-Message-State: AOJu0Yw/GX2z5lMcSnEcEP27fh0LHlv4CQ8XO+CfvmokqnbBFl3LJFh3
	+ihJXjV8POLacwjyyAlxc7XsWmnvhvksYIk5rAzlRKoP28kXL8oWuzhpo4sA/nhbjeyoEQ==
X-Gm-Gg: AfdE7cm/rboZzLNbB+x1smfFAmc9jXaaZnS0KehJVb7Or1ckbJjGGZJ3MV2vCcA2hA0
	u9vjB80dh4yia8Rk2+I1uEivLOqqeTVBoXaPyMOtkTgH67VDyW8f5+ibYCn4A/fSmV1cMDqJpJw
	CWqCv/zIhg2e4BxXMw4p2ml0+1pzBNkOR1/cl7UQInR96y5srQbZGWfIDolFdFY5LDh2p36yK4S
	32awsQZp88SHc+rMGU2xyB9b8m+et+Hkrbjy2CtibgbatSe1zQtrNaw72x5hKTiwUf36HLxDBIn
	0LCk9K2YZ4L+VLRtzDrnIJU7hE1DUYaGGOjeR1c9RZmooYFAbUESLHl/fS47VxPTOt6vK1tU3rD
	6ssRQ0pKStSAfk4ACcTAQip7raLbhVfg/EhBhndvOiA1gIiAWaNaqliaXZhdIG1pTzyIcRkSTxf
	rbhuqeA2+rVT00UupWjLktjNAzUvaaJDI8TlImzyqgjEDyBKKQKQLO/e6VtRGkSyTwMtBSO43gI
	kqMVlR0K/VpHgHbtDNAwWz6z7QDZw8PTEBzCo1lAJBZo1LqQMEKDAUtGoCknL+9qv5NlUY1SfB6
	UnYmRLU29SJZDbWs3dDGltXJ0HxcsQ==
X-Received: by 2002:a05:693c:87dc:20b0:30c:ab97:d7b1 with SMTP id 5a478bee46e88-30cab97dc52mr4186713eec.43.1782634316986;
        Sun, 28 Jun 2026 01:11:56 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 034/128] cpuid: upgrade 20230614 -> 20260503
Date: Sun, 28 Jun 2026 01:09:45 -0700
Message-ID: <20260628081122.178348-34-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127844

Refresh the path patch for the new upstream Makefile.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../cpuid/{cpuid_20230614.bb => cpuid_20260503.bb}            | 2 +-
 ...1-Makefile-update-the-hardcode-path-to-bindir-mandir.patch | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/cpuid/{cpuid_20230614.bb => cpuid_20260503.bb} (90%)

diff --git a/meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb b/meta-oe/recipes-devtools/cpuid/cpuid_20260503.bb
similarity index 90%
rename from meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb
rename to meta-oe/recipes-devtools/cpuid/cpuid_20260503.bb
index 36614ca19d..c0e27bdc20 100644
--- a/meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb
+++ b/meta-oe/recipes-devtools/cpuid/cpuid_20260503.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "http://www.etallen.com/${BPN}/${BP}.src.tar.gz \
            file://0001-Makefile-update-the-hardcode-path-to-bindir-mandir.patch \
            "
-SRC_URI[sha256sum] = "b1c83045efc26076307751e0662d580277f5f9bf89cf027231a7812003c3a4e8"
+SRC_URI[sha256sum] = "8ee10fb48d4aa20c484a75d6852883710286ed2975c314bda6d0b0383908cbfe"
 
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 
diff --git a/meta-oe/recipes-devtools/cpuid/files/0001-Makefile-update-the-hardcode-path-to-bindir-mandir.patch b/meta-oe/recipes-devtools/cpuid/files/0001-Makefile-update-the-hardcode-path-to-bindir-mandir.patch
index 8654fb86c3..e9b3ac08b3 100644
--- a/meta-oe/recipes-devtools/cpuid/files/0001-Makefile-update-the-hardcode-path-to-bindir-mandir.patch
+++ b/meta-oe/recipes-devtools/cpuid/files/0001-Makefile-update-the-hardcode-path-to-bindir-mandir.patch
@@ -16,7 +16,7 @@ diff --git a/Makefile b/Makefile
 index 828d2b1..365e26d 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -55,10 +55,10 @@ cpuinfo2cpuid.man.gz: cpuinfo2cpuid.man
+@@ -61,10 +61,10 @@ cpuinfo2cpuid.man.gz: cpuinfo2cpuid.man
  	gzip < $< > $@
  
  install: $(PROG) $(PROG).man.gz cpuinfo2cpuid cpuinfo2cpuid.man.gz
@@ -30,7 +30,7 @@ index 828d2b1..365e26d 100644
 +	install -D -m 444 cpuinfo2cpuid.man.gz $(BUILDROOT)${mandir}/man1/cpuinfo2cpuid.1.gz
  
  clean:
- 	rm -f $(PROG) $(PROG).i386 $(PROG).x86_64
+ 	rm -f $(PROG) $(PROG).opt $(PROG).i386 $(PROG).x86_64
 -- 
 2.25.1
 

