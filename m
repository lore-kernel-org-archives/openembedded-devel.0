Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88B6C8302F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 07:07:00 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.4272.1751353613870918535
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Jul 2025 00:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XGa18WyE;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-234b9dfb842so25360885ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Jul 2025 00:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751353613; x=1751958413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IWuxV6MQjFYezyyMYzA7mdzC6eQt5KYKSh3F/iS52o4=;
        b=XGa18WyEsThCjlqmXI24d6LsKppdx3fEWF8nyRasMMSwfLqdQmtEKoGv/2DMmwoETe
         lfzobYCu28NaGi81WVCY/VblBtb1lzZ95gC25Y0HrA7MPYH4ul9zac8twU/j5UY9XX5X
         RUGgLefNqJPaC326G6Lp6RfArXaFkAWmEl7je/2P4gbTGXUwzBAQeo9x+MtdNUITd/kH
         /jQMR0O1sfcTbwugKkGkfGAuX2gej06H/q5kIcXIRHyUIUExOIH8ay7OzvrxHq572m4v
         mDoRp8zdbtVEgQQrSqaIKKIuVlXHWs53Y6AxnW8DVhQPXkpox/N+OG1AsdtDxW42hNMB
         a37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751353613; x=1751958413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWuxV6MQjFYezyyMYzA7mdzC6eQt5KYKSh3F/iS52o4=;
        b=k6LUovChrEqS5CpQwPkmEpV2GGA+VMQRJ4EJb40nTF96AtV0UwITe6bKORsZY6D9zc
         V/oiB87ND+dSos7uNqB4mnn0tNm2sjh61EPXuaZsmLvYMak9krSc6HcVAQKQr6e9uvSZ
         mFIWZIGyqWncQ9CsIlKrxxJCYG5pmN7T9wEoGbJ2hpu09bQLmBPrSSsnbHEK4P4MKpU+
         x3ifa1t+7XMUDB3BNeo/EZR7l9I8EJaTMfsZkbRxO5Fg/ThVi4/ur+MkYAJH2AXrY0Zs
         z86cBc9PrhhINcokLAXuVgVzEF/nFPjNMhr8LoQm8qhyLBPFBB8zv5TY3N9DX1sim4j1
         /RLA==
X-Gm-Message-State: AOJu0YyLwS22ZjaoEh9TcWooPGdL+bZexaU0rEkiJkoKI9lBTFiUBT0m
	8i6j2HhgRsCR7Kt8u7/Yh7YA3FMxWQTyHXaSoTvke8WGFOjdtIs8ajNGXqsmu92X
X-Gm-Gg: ASbGncv6j3uLPGuljzvBtL2y5evZxaLYt8rMaF5Ungxv8/I6GGMkvasToCnBlnkuE55
	OPzUEoQ3TO4GYcRMJ9L6tKg7/Wz58lstzJnIlER2eBKPmvp4rSYN3ErOfpJGCV8zWkdYadig+ai
	bfiE7pUZV4ruVr1+rnJwJ4FvtfZ96x+jlQemvwZvLXFycM9DYfxlysKYqb9dFQyzEHS5SOLHmx+
	iHAN0L1eR6dPbseyuJdIdg+ezf8NO2REkjOLslgaYQ2DdLOBfo2bDSVAfIkVqvMedEDrmW8bWyx
	pSfEDAZFjZ2zsfVGep/DaSEb3cJhJid5qDP757sy820SKaQhsRQrCA==
X-Google-Smtp-Source: AGHT+IG6U/qJsgAvIn9hgJBz2zq6vgBnnS70P0ISZAJqXkmzrv6+fwi10oLzC4k43poNoqGqhwPgdg==
X-Received: by 2002:a17:902:cec4:b0:235:7c6:ebdb with SMTP id d9443c01a7336-23ac2d86a01mr253408755ad.10.1751353612798;
        Tue, 01 Jul 2025 00:06:52 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adc64sm95439885ad.153.2025.07.01.00.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 00:06:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] nbdkit: Fix build after S moved into UNPACKDIR
Date: Tue,  1 Jul 2025 00:06:49 -0700
Message-ID: <20250701070649.2751375-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Jul 2025 07:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118187

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...plugins-Avoid-absolute-buildpaths-in-binaries.patch | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit/0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch b/meta-networking/recipes-support/nbdkit/nbdkit/0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch
index 2f7ffd3d20..524ea0602d 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit/0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch
+++ b/meta-networking/recipes-support/nbdkit/nbdkit/0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch
@@ -14,15 +14,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  plugins/cc/Makefile.am | 7 +++++--
  1 file changed, 5 insertions(+), 2 deletions(-)
 
-diff --git a/plugins/cc/Makefile.am b/plugins/cc/Makefile.am
-index df8b5d15..80586a17 100644
 --- a/plugins/cc/Makefile.am
 +++ b/plugins/cc/Makefile.am
-@@ -44,9 +44,12 @@ nbdkit_cc_plugin_la_SOURCES = \
+@@ -44,9 +44,13 @@ nbdkit_cc_plugin_la_SOURCES = \
  	$(top_srcdir)/include/nbdkit-plugin.h \
  	$(NULL)
  
-+workdir := $(shell dirname $(abs_top_builddir))
++workdir1 := $(shell dirname $(abs_top_builddir))
++workdir := $(shell dirname $(workdir1))
 +cc_no_sysroot := $(shell echo \"$(CC)\"|sed -e 's#$(workdir)#<WORKDIR>#g')
 +cflags_no_sysroot := $(shell echo \"$(CFLAGS)\"|sed -e 's#$(workdir)#<WORKDIR>#g')
  nbdkit_cc_plugin_la_CPPFLAGS = \
@@ -33,6 +32,3 @@ index df8b5d15..80586a17 100644
  	-I$(top_srcdir)/include \
  	-I$(top_builddir)/include \
  	-I$(top_srcdir)/common/include \
--- 
-2.40.1
-

