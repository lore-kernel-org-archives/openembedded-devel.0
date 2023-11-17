Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 898AAC072A2
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 10:54:53 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.8875.1700218492347872996
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 02:54:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z3CKbgsK;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6bcef66f9caso332109b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 02:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700218491; x=1700823291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N4dPHfrpJswPD+GWKOi8deRzAbooruk9W9lTb7HlY+I=;
        b=Z3CKbgsKdferaJOfbY7nBKwKxidFzEU+sND1aNifgXg4UpNxsFeAgCNXLtpRsu2Ti7
         t9ui2Pyzv6m8XxucLllVHIklaY2n1FDeP5t4T2CB5/G/gQdoNolTRlokfYOxjS1XlXt3
         jrLGjvr20YWIW/uZHYGD1Ky1C+Z3mEGGnbnKQzuI6Zd7H3EpHMJRRKf84sv6MWUxvhum
         JXNZLpJVeB1XC9gEVmitZj77zugTF+KoNorm0cOKpu+PQg4xe0DWH2g07TL/U2DXAatf
         W2t8MtceqTsAuvtlX11yTv48XjUQe+V4QWmQn6crLBon8gnC9btlOxsxMBlDD0F5q3Qg
         o+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700218491; x=1700823291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N4dPHfrpJswPD+GWKOi8deRzAbooruk9W9lTb7HlY+I=;
        b=aFNnH6tbaHtjPE9Pc1cvResRp+Xqd3CvsKs1aTdkLiUWV5T2HgcE6+09khBULtFPOL
         FYqSc/G4VsgsYMvUGoN0MGrRaG9HZRf221ZwyBxo8LB+Bl98+ZPtcpanutG5XZzx0wTq
         WZ9bCwpITU+dIBUCRldrnfS5Gj4a3APm45O/AA5O7wcGVXf+g/dtJsq8yBcwIBGmLJ7P
         cFQZcJsrKkzyvcRlpzA7PM3GZNZWTYye3CosUebRgj29162wNZ/tA2PH5UUrerh8iVxT
         U3swd+VRnDg4MamwTjvaKdIZqajDlTsxKkS+reUuwEnag2DvXz2P5S8+dL82OkylVLwx
         XFfg==
X-Gm-Message-State: AOJu0Yzx01f5td4HiDWTgWNK+JK6x3qpG/+T74JDB3ZNye6QDte8kVk4
	7ywLc2WTgIMUaNqJXixYpVUj0d7xoUo=
X-Google-Smtp-Source: AGHT+IEAL8ELu0pVSC9udSmOy1DaklUbdq3oxF5e9SCkYCPSaHFKP++iCKDO7L7AGQkOo/XqtQKRNw==
X-Received: by 2002:a05:6a00:6894:b0:6c0:81a3:fe4c with SMTP id hr20-20020a056a00689400b006c081a3fe4cmr8770417pfb.3.1700218491073;
        Fri, 17 Nov 2023 02:54:51 -0800 (PST)
Received: from L-18010.kpit.com ([203.192.207.62])
        by smtp.gmail.com with ESMTPSA id y17-20020aa78551000000b0068ff6d21563sm1194998pfn.148.2023.11.17.02.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 02:54:50 -0800 (PST)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akash.hadke@kpit.com
Subject: [meta-java][master][PATCH] Update LICENSE to GPL-2.0-or-later
Date: Fri, 17 Nov 2023 16:23:42 +0530
Message-Id: <20231117105342.442935-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 10:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106866

As per the below text from 'COPYING' file change
'LICENSE' of following components to 'GPL-2.0-or-later'

1. cacao-initial-native
2. classpath-native
3. classpath
4. fastjar
5. jamvm

COPYING File text:
This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 recipes-core/cacao/cacao-initial-native_0.98.bb | 2 +-
 recipes-core/classpath/classpath-native.inc     | 2 +-
 recipes-core/classpath/classpath.inc            | 2 +-
 recipes-core/fastjar/fastjar.inc                | 2 +-
 recipes-core/jamvm/jamvm.inc                    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-core/cacao/cacao-initial-native_0.98.bb b/recipes-core/cacao/cacao-initial-native_0.98.bb
index 8432456..83359a7 100644
--- a/recipes-core/cacao/cacao-initial-native_0.98.bb
+++ b/recipes-core/cacao/cacao-initial-native_0.98.bb
@@ -1,6 +1,6 @@
 SUMMARY = "CacaoVM for use as OpenEmbedded's Java VM"
 HOMEPAGE = "http://www.cacaojvm.org/"
-LICENSE  = "GPL-2.0"
+LICENSE  = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SECTION  = "interpreters"
 
diff --git a/recipes-core/classpath/classpath-native.inc b/recipes-core/classpath/classpath-native.inc
index c81e064..7f6fb56 100644
--- a/recipes-core/classpath/classpath-native.inc
+++ b/recipes-core/classpath/classpath-native.inc
@@ -1,6 +1,6 @@
 SUMMARY = "GNU Classpath standard Java libraries - For native Java-dependent programs"
 HOMEPAGE = "http://www.gnu.org/software/classpath/"
-LICENSE = "GPL-2.0 & SAX-PD"
+LICENSE = "GPL-2.0-or-later & SAX-PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=af0004801732bc4b20d90f351cf80510"
 
 DEPENDS = "fastjar-native zip-native"
diff --git a/recipes-core/classpath/classpath.inc b/recipes-core/classpath/classpath.inc
index 35e7db3..b179d4c 100644
--- a/recipes-core/classpath/classpath.inc
+++ b/recipes-core/classpath/classpath.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/classpath/"
 SECTION = "libs"
 
 # GPLv2 + custom linking exception
-LICENSE = "GPL-2.0 & SAX-PD"
+LICENSE = "GPL-2.0-or-later & SAX-PD"
 
 PBN = "classpath"
 
diff --git a/recipes-core/fastjar/fastjar.inc b/recipes-core/fastjar/fastjar.inc
index 8412236..3eece43 100644
--- a/recipes-core/fastjar/fastjar.inc
+++ b/recipes-core/fastjar/fastjar.inc
@@ -2,7 +2,7 @@ SUMMARY = "jar replacement written in C."
 HOMEPAGE = "http://savannah.nongnu.org/projects/fastjar/"
 SECTION = "devel"
 PRIORITY = "optional"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-or-later"
 PR = "r1"
 
 DEPENDS = "zlib"
diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index 693817f..278b9b7 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -1,6 +1,6 @@
 SUMMARY = "A compact Java Virtual Machine which conforms to the JVM specification version 2."
 HOMEPAGE = "http://jamvm.sourceforge.net/"
-LICENSE = "GPL-2.0"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 DEPENDS = "zlib classpath virtual/javac-native libffi virtual/java-initial-native"
-- 
2.25.1


