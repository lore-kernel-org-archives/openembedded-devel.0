Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E47C5DF72
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:39 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24376.1786747589887738064
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DFd+BfmA;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1997535a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747589; x=1787352389; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+HcffRMrt8AEpKhJTyjFGIg3TqnxGbkzpsxAqXwKi2Q=;
        b=DFd+BfmAiWWcTjVfdFpfA6F5fnpmZbhYpYkuoUqSQw8iIzABHIvBJN4hHoaRaUGsqJ
         hqRW1xJAvMpgvEXP/MyPlZTdv5rlC1oaJnE8zWaxYllbOTpyGK7q1Pvg9A8tUcHOp+mW
         bReRS7UvkddycbcNA9bsqEJZb7yb3o8C9+tftw4FDnMD+BhWS+dGy8IY6fgz1u6DhViD
         23gCRiAbJS7hfm3vZduoub51EHNfU4fyCJS8w52LCg/3wncbB/l9ZG4JBSVfEEScgmx9
         m7IVR4554gTgysXyThj+adFEVnbX4Hdprw/t5OwA9U5H78ChPmWc8q5yV8UXOUAPS5kQ
         whag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747589; x=1787352389;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+HcffRMrt8AEpKhJTyjFGIg3TqnxGbkzpsxAqXwKi2Q=;
        b=tZjxM4oSv5JTtFdnFYBYoSm4D+Aoss5avGHVCoMehNLq5oJh19EIPVJ8NAZzag098V
         7MgCm16CXPbuN4f1BFAN/zeGDMpxhBWGmX8BTeGAe3gBTjdZMRjd1e9MSHKBPTOT9Q4n
         /6TRGHk26QRkQSxvDpCyjB7y/ftrIzh0egqWfJ19Y0/IgDQES9qZkgqF+m1AncBWmxDK
         P8LTIieIlupdAIdXcvmQFMPOFbd67fs58TSZKlIC9V3AZ9aiCmlqLaRsVDyfzfbtndsI
         JCF0m3rJ790HKM1wWLMdyOookZjFRhDae0blerCj3HEqw2LWjVK6Dm8yU2HvxbW+52Ce
         rDcg==
X-Gm-Message-State: AOJu0Yxfa6kpPhX9uLmgqRo8G/fwNOdXJjmcLWwgHjz2bwABHSSbw3Oh
	6fXqOHjSbAaCPsH5mQYxFFiS/gVc05tDZ7iFryY3ftEXOP+oMVbXTgVU8CA6Yh5V
X-Gm-Gg: AR+sD11dicUFkPSLbWrKUEWEMpFrr5+JDn1AFDsfeKcfVlyyDPxm7SGUMrlYfldlfSy
	260yH0DoSfgIg9KPX8eiCOEga8ES1tLVRmfgZzrn1Ay/8H7dncgD0VNLY18FYjjuU7myTa6V2n1
	DPov/lJbo5XKZObsGBYT6DY4x2Dn+i/UpGvnd0LCzthrCI9izxPMaIiAVJrxwiBdUht0x13RnTv
	XRd5XA+7Vpfyl/JFecijeSZVFat26EAEhXnrVDr3YRuphZn7HkrgA4Yh9mi4ek1cOFNS1/7Z8xj
	AIsaHKXFcKa+T3IIRaOhcCqOPVvRH5bY+OTN14PbCOacKwNSQG3yll7KxQcCxvPeeQHbR2MK/eQ
	lgKzdEwr0W97upD18tzevGcPqFQUixg+Y/hHQTezqXXEDs4AWNGSqlb2V+4v/WixBe6fP7UoasQ
	SPbmGMxII7bNHP7Jl+y8kGy/zYo1A/CI04isr7gtQ6B3Ps7HnB4G5qLbsMAc9ujXB+VlxwmsIqT
	+U2l/yBysx3vxCBz/MU5a1gvd6xk1tIpB2milaElU8AxhZe83uS06jeAyHwkEFAWPGMKKu6Dap7
	+WBZN/MJFNpewcikxKy/e9biLhQeaGjsiE3QlPdhl/+tJLSbw0YqnP49aIDUC4KjNB9Y6aSex8b
	/bzVCtSFaGhKpMW2kzH8UaaAMpn7akgwf89skZ6GOEa3pDz85jlo=
X-Received: by 2002:a17:90b:1c87:b0:380:540:d499 with SMTP id 98e67ed59e1d1-3933cae4b3amr9952024a91.6.1786747589222;
        Fri, 14 Aug 2026 15:46:29 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 042/109] libstemmer: upgrade 2.2.0 -> 3.1.1
Date: Fri, 14 Aug 2026 15:44:28 -0700
Message-ID: <20260814224539.1523174-42-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129106

Major release; see upstream release notes for details.

Recipe-side changes: patches / files moved to the new version directory.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libstemmer/0001-Build-so-lib.patch        | 28 +++++++++----------
 ...ibstemmer_2.2.0.bb => libstemmer_3.1.1.bb} |  6 ++--
 2 files changed, 17 insertions(+), 17 deletions(-)
 rename meta-oe/recipes-support/libstemmer/{libstemmer_2.2.0.bb => libstemmer_3.1.1.bb} (79%)

diff --git a/meta-oe/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch b/meta-oe/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch
index 2529d5d9d1..356ef8b469 100644
--- a/meta-oe/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch
+++ b/meta-oe/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch
@@ -21,31 +21,31 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 
 --- a/GNUmakefile
 +++ b/GNUmakefile
-@@ -170,12 +170,12 @@ C_OTHER_OBJECTS = $(C_OTHER_SOURCES:.c=.
+@@ -311,12 +311,12 @@ C_OTHER_OBJECTS = $(C_OTHER_SOURCES:.c=.
  JAVA_CLASSES = $(JAVA_SOURCES:.java=.class)
- JAVA_RUNTIME_CLASSES=$(JAVARUNTIME_SOURCES:.java=.class)
- 
--CFLAGS=-O2 -W -Wall -Wmissing-prototypes -Wmissing-declarations
-+CFLAGS=-O2 -fPIC -W -Wall -Wmissing-prototypes -Wmissing-declarations
+ JAVA_RUNTIME_CLASSES=$(JAVA_RUNTIME_SOURCES:.java=.class)
+
+-CFLAGS=-g -O2 -W -Wall -Wcast-qual -Wmissing-prototypes -Wmissing-declarations -Wshadow $(WERROR)
++CFLAGS=-g -O2 -fPIC -W -Wall -Wcast-qual -Wmissing-prototypes -Wmissing-declarations -Wshadow $(WERROR)
  CPPFLAGS=
- 
+
  INCLUDES=-Iinclude
- 
+
 -all: snowball$(EXEEXT) libstemmer.a stemwords$(EXEEXT) $(C_OTHER_SOURCES) $(C_OTHER_HEADERS) $(C_OTHER_OBJECTS)
 +all: snowball$(EXEEXT) libstemmer.a libstemmer.so stemwords$(EXEEXT) $(C_OTHER_SOURCES) $(C_OTHER_HEADERS) $(C_OTHER_OBJECTS)
- 
- algorithms.mk: libstemmer/mkalgorithms.pl libstemmer/modules.txt
- 	libstemmer/mkalgorithms.pl algorithms.mk libstemmer/modules.txt
-@@ -225,6 +225,9 @@ libstemmer/libstemmer.o: libstemmer/modu
+
+ algorithms.mk: GNUmakefile libstemmer/mkalgorithms.pl $(MODULES)
+ 	libstemmer/mkalgorithms.pl algorithms.mk $(MODULES)
+@@ -424,6 +424,9 @@ libstemmer/libstemmer.o: libstemmer/modu
  libstemmer.a: libstemmer/libstemmer.o $(RUNTIME_OBJECTS) $(C_LIB_OBJECTS)
- 	$(AR) -cru $@ $^
- 
+ 	$(AR) $(ARFLAGS) $@ $^
+
 +libstemmer.so: libstemmer/libstemmer.o $(RUNTIME_OBJECTS) $(C_LIB_OBJECTS)
 +	$(CC) $(CFLAGS) -shared $(LDFLAGS) -Wl,-soname,libstemmer.so.0,-version-script,libstemmer/symbol.map -o $@.0.0.0 $^
 +
  examples/%.o: examples/%.c
  	$(CC) $(CFLAGS) $(INCLUDES) $(CPPFLAGS) -c -o $@ $<
- 
+
 --- /dev/null
 +++ b/libstemmer/symbol.map
 @@ -0,0 +1,6 @@
diff --git a/meta-oe/recipes-support/libstemmer/libstemmer_2.2.0.bb b/meta-oe/recipes-support/libstemmer/libstemmer_3.1.1.bb
similarity index 79%
rename from meta-oe/recipes-support/libstemmer/libstemmer_2.2.0.bb
rename to meta-oe/recipes-support/libstemmer/libstemmer_3.1.1.bb
index d462d3018f..784b5b402d 100644
--- a/meta-oe/recipes-support/libstemmer/libstemmer_2.2.0.bb
+++ b/meta-oe/recipes-support/libstemmer/libstemmer_3.1.1.bb
@@ -1,14 +1,14 @@
 SUMMARY = "Snowball compiler and stemming algorithms"
 HOMEPAGE = "https://snowballstem.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=19139aaf3c8c8fa1ca6edd59c072fb9f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=07c3b61d971c3df6e19ce439cfe1fb8c"
 
 DEPENDS:append:class-target = " ${BPN}-native"
 
-SRC_URI = "git://github.com/snowballstem/snowball.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/snowballstem/snowball.git;branch=main;protocol=https;tag=v${PV} \
            file://0001-Build-so-lib.patch \
            "
-SRCREV = "48a67a2831005f49c48ec29a5837640e23e54e6b"
+SRCREV = "cd195b51e948a902a4312f023f4a14392516a543"
 
 LIBVER = "0.0.0"
 

