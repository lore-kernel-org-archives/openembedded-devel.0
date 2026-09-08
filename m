Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4917C79FA1
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 02:07:57 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.522.1788833276658351258
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 19:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KUTcfryf;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so4785607a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 19:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788833276; x=1789438076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=icmuinX9//mJxIKVWcJv3L9tPp5grv/qlwdMHAS7ZaY=;
        b=KUTcfryfPz7+FAk//7og48Dv1jp6aOKv8sIPN3I7VFdaI8yDinHZztA/bPqw0kGlG8
         zyQbJ4MJI3UNgNZRumJYpFZfJQCgZUOivE+DA6WevBcrRwoKqQ/YSKMNK/Tu7GOdjsuP
         +dyU4BuaKOqHLjJAHJTNJDNOWvddLPjFCu6jYZXx65hG3qBBKRUaxYvwgdeeI+6i2LtR
         NOSAOycGbm49wQ8ritUmDAGTwJ7ZY2wf4HhxIE4KMirxeW3EZzxfUEVNTzwNiSx1B1iv
         yev4nTjE1jVJzYBJKS3pdnwCUWSc7tndmV59f4RK2pPmU9/c+we8DFYgTJ1yirZEAPqr
         eusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788833276; x=1789438076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icmuinX9//mJxIKVWcJv3L9tPp5grv/qlwdMHAS7ZaY=;
        b=ERYOMizjpi8xs6WurBbrzxu//RHjt1YTB02JAfxS/7PZxkTqoJ2CDwmFtSs6+EWQLw
         LlBeZJ7mEuuysaq2e+M0YtsvCQet84M09fSc7IWD2MtpaCmj6Y2V3aTVUqIRErK1HwTB
         +IwZGdxJIH9tMlXKwP/hbmLdtYJdObTDXZLAUwbP4MD6hvsefHiMLuBekwwyAPqFxAGK
         NrNImLBj+Cm1HYBgM8jvYzkxlFweWGo24awJctSKSLgaGr88CUXytmZku8WivoTxFftp
         ++9q8DcCWf99tlgtyp1nGRa0WOSKjxoHrmnEeH4R7wEim9+avNGakSkgfOD8H0mh7DjU
         4Ihg==
X-Gm-Message-State: AFuF++lyhvtHiF448zIYx8AZ+PlBA96z77PfEHE3YLbRMGS2AP6kQTNS
	E5jkmjGxK7vNvMn35uSlXqbiQaOMSDN4YFrkfWfaQVce3u8Hh2wUoGu7uvFuNQ==
X-Gm-Gg: AYBFou2HW0B8IiRAESeVgdOiU16slyRYw/Xn69CSk+GO0Y0ZcOITUakeG0yU//axUUw
	ko0xBug1fhFXNmb66Q4B4AP0gFlYSaOm5bmTZ+TQ+zugsCS7OqMj5MuaPWhc5QmUA6RLzJB+JMR
	iuwVpvv0NIt/JpqgAAuKgqRM5q6L7gGP+OqKObsf9dvauI/KHSgPTFsDxerM19CH2ld0ra1K2KT
	f994tg+2P8iEUGlMJf3207SHrxVdP1vLLtz4PaejU+jbCs0wlUNiXdrUddGzzwb2IxbOk1yxy0q
	kSNM8Nqh+TGIyyhea6T1bYJBPtAjhEB4Cfgpyu9eEmGL0w6kCkte+rbpeqjHkUD+Nkekd/9TSTB
	jnRHjiWLE72GCEAsPw3ab9t+sZEV+tcVg3hWX3M5fvTO8hjnm1pdMQ8RA2zuc2p7zYfNW6SX2z0
	f/zqT1Czq0M+m2MjoJ/o0GN8bYAdVynXi+e4gdnQY+232AqtC2s0YubN03AsgW7GqSOzb/C8EJe
	BvyLeGctnzPJzltwaDeZyevLy+b8iMPhdDVUUqOBzgU5NeLTxelPAnkUAfoVGkoGtyZbpgNheLe
	pOa6I0nWqECEKSRddh9C5uNdY7BOHoOdqbwWTr4msATN970+PgQWlQkfMh1pFHLNU5WAcw2c0LE
	2V5uwz1gZ+qDQ0nQqwCa1DKGHIvat4T7vdwPeezC3ebk4gQ==
X-Received: by 2002:a17:90b:5344:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39b261b1a47mr42341640a91.13.1788833275944;
        Mon, 07 Sep 2026 19:07:55 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm14044803eec.20.2026.09.07.19.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 19:07:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/6] assimp: Do not treat warnings as errors
Date: Mon,  7 Sep 2026 19:07:47 -0700
Message-ID: <20260908020752.2748681-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 02:07:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129849

ASSIMP_WARNINGS_AS_ERRORS defaults to ON, which builds the library with
-Wall -Werror. That leaves the build at the mercy of whatever a new
compiler adds to -Wall: clang 23 enables -Wunused-template there, and the
bundled openddlparser copy carries a template that is never called, so the
build fails with

  contrib/openddlparser/code/DDLNode.cpp:34:20: error: unused function
  template 'releaseDataType' [-Werror,-Wunused-template]

Neither assimp master nor openddl-parser upstream has removed that dead
template, and there is no pending pull request for it, so there is nothing
to backport. Debian, Fedora, Arch and Alpine all turn this option off
rather than patch individual warnings; do the same, which also keeps the
next addition to -Wall from breaking the build again.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/assimp/assimp_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/assimp/assimp_git.bb b/meta-oe/recipes-graphics/assimp/assimp_git.bb
index b2d7a573de..561ef50508 100644
--- a/meta-oe/recipes-graphics/assimp/assimp_git.bb
+++ b/meta-oe/recipes-graphics/assimp/assimp_git.bb
@@ -25,6 +25,7 @@ EXTRA_OECMAKE = "\
     -DCMAKE_INSTALL_LIBDIR=${baselib} \
     -DCMAKE_SKIP_RPATH=ON \
     -DCMAKE_BUILD_WITH_INSTALL_RPATH=OFF \
+    -DASSIMP_WARNINGS_AS_ERRORS=OFF \
 "
 
 do_install:append() {

