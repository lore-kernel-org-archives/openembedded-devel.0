Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027D6C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 06:12:54 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.18168.1704435168289534609
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jan 2024 22:12:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DDBcSy74;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a27733ae1dfso144186266b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Jan 2024 22:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704435166; x=1705039966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LZHrJmndgk6nwkzPRpENUit/yitewCFytEQcIYS7JSw=;
        b=DDBcSy74Kk36oTEWr1WtFqlEWBYzu38tEVA1WEvfFh2T8pJw3MN3cpBpv5SgvJN71h
         /gm0Sz4HziGHLN7/QWuisZ5zfmU8CVMixm+83eTpt8mVJUF0gajzrGxor4+5pWXHsLl0
         s9kKw85FhUfqtofN2M9dcrbZ4DpEjGdWe/tBNO6K7dKKLFMJY0mN7LeZEYLBz2jT68zL
         148as0cKMmnpadSEDv8wTTKWNwr/4cPxKQWlTVOL3gzoxhpr+wg1P/E/hjo57aizXLAB
         OleMMqyr15FVCSoGWkOgYiauGLQS2UWqGcQWPXWcgiB20eO3tkg9NAXzm0zupk9fycsv
         0fIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704435166; x=1705039966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZHrJmndgk6nwkzPRpENUit/yitewCFytEQcIYS7JSw=;
        b=b33vadYlroUpJDLgtANN/x8vD4Y8G2gvZqIpne/iynlG4aOYV4zXQAd7agkQF1q6yx
         uXF3/+XgTxo+IVQ2rYBkkk3zt8O8wWxFTdtTB5hogPr4Iuu6JbYZhtpVCgxj3vpOeLS1
         G6K269qOCvnmVxtkLXP2gEqOsUS4ZW2RJX0FFfXIGjhat+JYaFTMlAYulFLEuwC85ds1
         RY/pVixDMPPz0iKgSq+1OxjSDYk0areO23JuY/BcEchx90j59lMAU70a7hkylPm8LLhD
         tvxbqzgVCjvflmDq6FRhCA3ndXeMeapZGVQ08F5VJDB6n1Q51TsD3pd2EtYsxG2ncDPq
         xANA==
X-Gm-Message-State: AOJu0Yx/zgSUsmnU1ptYTuhZueMyD6NerZgc/vmwrSR6KoNQa/1/S29v
	Wdh5K93o8IzvU81naMab43+sQXuC5aE=
X-Google-Smtp-Source: AGHT+IFub49S6H2MZ6kNFR7OJLJyM+yft0n/BzTNZnUQ1MCXk+UV63etWg5WHd85FM3TGS8+/4xwDA==
X-Received: by 2002:a17:906:2646:b0:a28:a36f:b50a with SMTP id i6-20020a170906264600b00a28a36fb50amr350925ejc.134.1704435165990;
        Thu, 04 Jan 2024 22:12:45 -0800 (PST)
Received: from localhost.localdomain ([176.33.64.25])
        by smtp.gmail.com with ESMTPSA id e5-20020a17090681c500b00a1d5444c2cdsm480511ejx.140.2024.01.04.22.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 22:12:45 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] clinfo: upgrade 3.0.21.02.21 -> 3.0.23.01.25
Date: Fri,  5 Jan 2024 09:12:40 +0300
Message-Id: <20240105061240.27523-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Jan 2024 06:12:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108043

Changelog:

748c393 (tag: 3.0.23.01.25) Version 3.0.23.01.25
6ffc5f4 Keep track of the known flags
8a259ee Mark ARM extensions as such
315a45f Fix some extended versioning support
fd78db3 cl_khr_mutable_dispatch
89581d9 Sempahore KHR extensions support
6dedc29 cl_khr_external_memory support
9e770d9 Cleanup and add TODO
3bb2d68 cl_intel_unified_shared_memory support
120b67c cl_khr_command_buffer support
a38c9cc Update cl_arm_scheduling_controls support
b43aa37 cl_intel_device_attribute_query support
5b0ebba cl_intel_command_queue_families support
c8de099 Option to handle the NULL platform like a normal one
a6862eb Correctly size some variables
62bbef9 Fix typo: comfornace
d6f189d Makefile: Define and use `MAN1DIR`
95051d9 Makefile: Support staged installs with `DESTDIR`
a2d2cfb Makefile: Simplify by removing targets and move them to install target
7870355 Revert "Makefile: Support staged installs with `DESTDIR`"
a3729b0 Properly indent NV execution properties
77b4693 Don't fetch array values when there aren't any
efdb0f0 Show ICD loader properties even if no platforms are present
a10af94 Older NVIDIA drivers don't support CL_DEVICE_PCI_DOMAIN_ID_NV
a5bda6d Makefile: Support staged installs with `DESTDIR`
72a1ee2 Some more ext vs (next) core things
aabec89 Add missing extension checks
20b7053 cl_arm_controlled_kernel_termination support
11201e9 cl_khr_pci_bus_info support
78c53d0 Fix string buffer used to report error
e36ff2b Support cl_arm_scheduling_controls
d34bc1a (tag: 3.0.21.02.21) Version 3.0.21.02.21

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../opencl/{clinfo_3.0.21.02.21.bb => clinfo_3.0.23.01.25.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/opencl/{clinfo_3.0.21.02.21.bb => clinfo_3.0.23.01.25.bb} (82%)

diff --git a/meta-oe/recipes-support/opencl/clinfo_3.0.21.02.21.bb b/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
similarity index 82%
rename from meta-oe/recipes-support/opencl/clinfo_3.0.21.02.21.bb
rename to meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
index 781e698cb..6cacd3722 100644
--- a/meta-oe/recipes-support/opencl/clinfo_3.0.21.02.21.bb
+++ b/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
@@ -9,12 +9,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fd8857f774dfb0eefe1e80c8f9240a7e"
 
 SRC_URI = "git://github.com/Oblomov/clinfo.git;protocol=https;branch=master"
 
-SRCREV = "d34bc1a3bdc148e2e1fe64998398e1a0552ab04c"
+SRCREV = "748c3930a9b9cb826e631d77439e2cb8f84f5bcf"
 
 S = "${WORKDIR}/git"
 
 DEPENDS += "opencl-headers virtual/opencl-icd"
 
 do_install() {
-        install -D -m 755 clinfo ${D}${bindir}/clinfo
+	oe_runmake install PREFIX=${D}${prefix} MANDIR=${D}${mandir}
 }
-- 
2.25.1


