Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63784D4921B
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 13:05:28 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.40205.1731935118048738237
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 05:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F8gcj3OV;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5cefc36c5d4so2898060a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 05:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731935116; x=1732539916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iv7RyJmqOMvqOx9Yu8yIb2iGfuYi6xcWRGYsq1hafHQ=;
        b=F8gcj3OVsqijLI899f9Q7H8YuVfU2hOk/HqR4McPIcwE3pPVu6W0MT9VDzZPraEHES
         C/J72MhiHK/Jr0lx2AuYZnzSo8whOv8v6rKK8/IUc8jPd4bUSql6pmX89HP1KzL3MWoy
         yziXCuqA+67dE4AKQ2v2pRHXL/u2Tr1f78n7QmZsiH+35PeCK9XElqC7KsmRxrj2h9ER
         6oR0+Jkoa8uvoinBrUyGAeW6VSGBXgtxgKlF4OekCs6gp6ZwD4dx0vbFFP+0ia4035bI
         1Pq6ClQdlV8CEtYUAesIrK5DQNVUFiTTv1r9qkzFhfHSTNKDsuTsvZ+tmeeiPwsKO96P
         GNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731935116; x=1732539916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iv7RyJmqOMvqOx9Yu8yIb2iGfuYi6xcWRGYsq1hafHQ=;
        b=ZAVPg7xYWgUrCZ+g+2/AHeGyDL4R/gE+0nPHA8NGErZ2B+JbEFAMXYyzwRaPJi7kKC
         Y+82TOtr3nCK1bgos0Rg9l9eF01YbtHLStU5e7LJjoB7L2MDGKFxHdIxPrbswmNf+IDv
         q9ECIafs5F0OiSn7T/SChp3dNw0KYM2/x0mNXUwH0BgWc982q509LWnNmNWvFGThIJJe
         peiNKP9lem+sLZ7ajD4rVrs7cEzFmtCDNwmzEAJZ6IFNlJBsoNPj78y4hbjx13q5Lvgd
         zhBFkztBlIV50SCDxeqMzkVTF/rX0qngLJAMmj/lkggB6NETuM7Yldwuou+s6+9toSBL
         KAIA==
X-Gm-Message-State: AOJu0YyzxP05h/h9yNFBpZQWbzLNj7DXSraOBBdoO9T9QIy2JDGUc0u9
	7N5FAhfZ5B9rOAiKLYeuRsE1pI2bXHG6Ay8M2z4f5K46D7csIWYv+aQzoA==
X-Google-Smtp-Source: AGHT+IFTLFoBae3vmCDzdhDj/gTez2zSipsciIPceB6msfdgb9uL1mCF36vfiQVbEuw4THA8BPsjtQ==
X-Received: by 2002:a05:6402:27c7:b0:5cb:dd06:90d5 with SMTP id 4fb4d7f45d1cf-5cf8fd32311mr9106194a12.26.1731935115993;
        Mon, 18 Nov 2024 05:05:15 -0800 (PST)
Received: from localhost.localdomain ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df52adasm536700466b.81.2024.11.18.05.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 05:05:15 -0800 (PST)
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Claus Stovgaard <claus.stovgaard@gmail.com>
Subject: [meta-oe][scarthgap][master][PATCH 1/2] lcov: sort RDEPENDS alphabetical
Date: Mon, 18 Nov 2024 14:04:57 +0100
Message-ID: <20241118130458.3588473-1-claus.stovgaard@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 13:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113901

It is easier to get an overview of the perl modules needed for running
lcov if they are sorted alphabetically

Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
---
 meta-oe/recipes-support/lcov/lcov_1.16.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.16.bb b/meta-oe/recipes-support/lcov/lcov_1.16.bb
index 4f35eff90..53e192105 100755
--- a/meta-oe/recipes-support/lcov/lcov_1.16.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.16.bb
@@ -10,12 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 RDEPENDS:${PN} += " \
     perl \
-    perl-module-filehandle \
-    perl-module-getopt-std \
-    perl-module-digest-md5 \
-    perl-module-digest-sha \
     perl-module-constant \
     perl-module-cwd \
+    perl-module-digest-md5 \
+    perl-module-digest-sha \
     perl-module-errno \
     perl-module-file-basename \
     perl-module-file-copy \
@@ -25,12 +23,14 @@ RDEPENDS:${PN} += " \
     perl-module-file-spec-functions \
     perl-module-file-spec-unix \
     perl-module-file-temp \
+    perl-module-filehandle \
     perl-module-getopt-long \
+    perl-module-getopt-std \
     perl-module-list-util \
     perl-module-mro \
     perl-module-overload \
-    perl-module-overloading \
     perl-module-overload-numbers \
+    perl-module-overloading \
     perl-module-parent \
     perl-module-pod-usage \
     perl-module-posix \
-- 
2.45.2


