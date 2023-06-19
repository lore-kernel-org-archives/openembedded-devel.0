Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92171EB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:18:13 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.7290.1687180688051262496
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=r32r7I/5;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-57083a06b71so28561957b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687180687; x=1689772687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zjQJh6YrB17/LIyVI0W0Ux5d1PG8s2HRkKqMGCmhMoA=;
        b=r32r7I/5iqheG6BPaK8YcqZ7ySkMvzA3MBdFPmNpcnJfK2aRn2F9d+ivEhyK/nK3Db
         zSxlD6Bbaap7k2giO0HwMiolnl1KifgabZE0zIhXXLdL/GypwG4xGHikgR+7slF3RgOT
         kRVIn2vIkcPNAOCk3L1IiRYzeZNmvDuUeQkpuQT7AXWJj1lx4gC+Z9b1wGzLursEg4jD
         MOISpwVCkHqrFN+L0ym2IojeQv7inF2EUWJ0EHWyprzo6SFaM2WTLgW7UgX66TGOTk93
         OFAKnjXOMp14/HwAXcdbWlBoRv46MSstZmF+5ym/OihKG7aDbpEipqvcibq8ArzJDuaP
         f1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180687; x=1689772687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjQJh6YrB17/LIyVI0W0Ux5d1PG8s2HRkKqMGCmhMoA=;
        b=lkrGLYw4gJ0JZkbWTox2d1SKLUoORwaNbq42gSNhvClEy5qmziAXJgQDqi4Qx9W3ha
         LGgJa2MCOlNlp9M6bxuR53wuZJ+hScJMfVpodh55fkncemH1sgIHLyWp/trzQzFe9bDy
         vyNTpBk74lhgV5N4NfrAKx9MeBe0q/FrJJhEB23eWWAUquApKQX+fSViLAFUTRO3JnEs
         wD/WCYiPkz70MFAa9M6hSOn/aYWOXhL0dAQWruAzTGNksmzvEb9ymwBBu2b6BD0coBdF
         DqAzDeIoRX17qI9ImyJZ6GOFJENcHmmg9+lZlr5FhAl1sdAGRXVN2iAKvFCjttKRmsFn
         vguA==
X-Gm-Message-State: AC+VfDyMpbJRwWYfLJLiahWXwgYVlzfzl/683f60/hKiHunRPmGojdRz
	WX0ASp8uuW6ac3g5gdew+fPDmenYXzI=
X-Google-Smtp-Source: ACHHUZ64GLWA8iUFhBbEzpG97QErH0PnIrAtY4HmI9RBAUfSjS+X2VfepNpTRuUtfMOZsaG4nrw68A==
X-Received: by 2002:a0d:ca91:0:b0:570:66f2:e3e3 with SMTP id m139-20020a0dca91000000b0057066f2e3e3mr8721212ywd.36.1687180686917;
        Mon, 19 Jun 2023 06:18:06 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:c3d0:ee42:2807:16d4])
        by smtp.gmail.com with ESMTPSA id p68-20020a0dcd47000000b0055a382ae26fsm6725568ywd.49.2023.06.19.06.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:18:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Arash Partow <partow@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] ExprTk: Update package to release/0.0.2
Date: Mon, 19 Jun 2023 09:18:06 -0400
Message-Id: <20230619131806.181933-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103383

From: Arash Partow <partow@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0522e66a26b1f4778948553a193a4728fb239efe)
[The SRC_URI HASH no longer exists in repo so use 0.0.2 version]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/exprtk/exprtk_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/exprtk/exprtk_git.bb b/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
index 52975c8215..4019f26899 100644
--- a/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
+++ b/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/ArashPartow/exprtk"
 SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-SRCREV = "281c2ccc65b8f91c012ea3725ebcef406378a225"
+SRCREV = "f46bffcd6966d38a09023fb37ba9335214c9b959"
 
-SRC_URI = "git://github.com/ArashPartow/exprtk.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/ArashPartow/exprtk.git;branch=release;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


