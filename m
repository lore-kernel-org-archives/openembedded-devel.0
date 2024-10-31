Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7781DD767C1
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 13:41:37 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.12746.1730382086951103374
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 06:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gk7l7pk+;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a0c40849cso149885866b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 06:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730382085; x=1730986885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P1crhDp7HuuD8CPYXl6Ip3vHZX4prQxnW2AJa3hTXsg=;
        b=Gk7l7pk+6fehPDi9Q0z+ibqFQfpKR3qzz7WYm2nKb52CEjgM5caDX8b1T0RyR5c6HZ
         eBSuAuIBkNt5wTjGTN5Gvl1BJ75V2aJbJJbu64rfhSc+ESbV7TyJlneiNeHi6CgmFbXE
         +cLXFOpA6xd6/z1eWu45EW+GwhoiAAwMx5vFrZbihXHFvbdYPG7wmZ5Ur1+TxPyzcLX8
         1dxGswfkYQylsJZqvQ9FX68EsrkLLs3OrXpC01sauvw3hRUrkqzgV1G6plJqEFUE3yk1
         I1EUUrXbVlQz6iM3ht8kdD+eU2NuWXdJFgS9R6ujsVl0H6uCNA5cn8h0wTtNqzv2ZDl3
         32xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730382085; x=1730986885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1crhDp7HuuD8CPYXl6Ip3vHZX4prQxnW2AJa3hTXsg=;
        b=KDBrgHEU5mp9w07KbLjDoEQ52zi0KrXHNQhdVNX8WxohSuqUIRasEaYPlddjzuIcUE
         vIxrMG6z5OoleJgY6HfmFVf3Avhc1RDv1IoBVq6qpCnnYH3Zo4Y5wJ+T1GyZOdGamFk/
         IjZS8slsLoX19RVpREPIdnfEKI2HRuQ9gexxCHlZP067L6bCnr2Dq0Wxhc+DGEvad2Nb
         PfdToEazHmWDnVFVSCigTAuIGAxKmCbDaEZSa9B9d6Ba15V5+hbuhW2aqv+7882yebHP
         1l1ds0sUKEI+WHTNogZA2JDu0uM0fdQe03AsBM87rmgGoskWqKmEDwx7ETXrYUnHcAf2
         nkaw==
X-Gm-Message-State: AOJu0YwPRsqpK8Ugjca9tBF3kAE04n5f/SMBD9qNu3K6xkbhZQ0ZrRtb
	RG/1QKq6RcpLrwy9w4WMlu4bsMrrropLI5K7t0/SqTqQ4ecEGS1cytJVfQ==
X-Google-Smtp-Source: AGHT+IECW/cU0BXhbv2ztlZgR8DlhBcrleJ/L1rs7djYFcMMNqP/bQ3owyFPOL06DdeFC8jXCjgDCw==
X-Received: by 2002:a17:906:db05:b0:a9a:3fd8:9c95 with SMTP id a640c23a62f3a-a9e3a6c8064mr675030366b.47.1730382084980;
        Thu, 31 Oct 2024 06:41:24 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e565ea53dsm69855966b.114.2024.10.31.06.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 06:41:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [master-next][meta-oe][PATCH 01/11] libgpiod: improve FILESEXTRAPATHS
Date: Thu, 31 Oct 2024 14:41:04 +0100
Message-ID: <20241031134114.2791747-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 13:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113358

* I thought that PN in FILESEXTRAPATHS worked as everywhere else and
  as described in:
  https://lore.kernel.org/all/2261745fc01a4e3887ee98f98a425e88@vivavis.com/T/

* but surprisingly (to me)
  FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-2.x:"
  ends with effectively ${BPN}-2.x in bitbake -e (and the build doesn't fail
  to fetch file://gpio-manager.init in lib32-libgpiod build

* I've tried with kirkstone and dunfell as well and it ends with
  "libgpiod-2.x" for all 3 PNs:
  dunfell $ grep ^FILESEXTRAPATHS= env.* | sed 's@/OE.*dunfell/@@g'
  env.lib32-libgpiod:FILESEXTRAPATHS="meta-oe/meta-oe/recipes-support/libgpiod/libgpiod-2.x:__default:"
  env.libgpiod:FILESEXTRAPATHS="meta-oe/meta-oe/recipes-support/libgpiod/libgpiod-2.x:__default:"
  env.libgpiod-native:FILESEXTRAPATHS="meta-oe/meta-oe/recipes-support/libgpiod/libgpiod-2.x:__default:"

  dunfell $ grep ^PN= env.*
  env.lib32-libgpiod:PN="lib32-libgpiod"
  env.libgpiod:PN="libgpiod"
  env.libgpiod-native:PN="libgpiod-native"

  There is the QA check for PN in SRC_URI, maybe I took it a bit
  further and updated all FILESEXTRAPATHS references as well in our
  layers (in 2023) even when it wasn't causing build failures, e.g.:
  https://github.com/webosose/meta-webosose/commit/38d3cbf010a5e4e112d82ee473eecc718d9cc687

* so it's not so important to use BPN, but it's a bit clearer as that's
  what it ends evaluated into and what default FILESPATH is using as well:

  meta/classes-global/base.bbclass:FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
  meta/conf/bitbake.conf:#FILESPATH = "${FILE_DIRNAME}/${PF}:${FILE_DIRNAME}/${P}:${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/${BP}:${FILE_DIRNAME}/${BPN}:${FILE_DIRNAME}/files:${FILE_DIRNAME}"

  BPN was added in denzil 2009 (and FILESPATH moved to base.bbclass,
  bitbake.conf has commented-out value since then):
  https://git.openembedded.org/openembedded-core/commit/?h=denzil&id=94c895aad5ad286f172b04bc33ba670220d5eba8

  PF was dropped in dylan 2012:
  https://git.openembedded.org/openembedded-core/commit/?h=dylan&id=3efa13cd76bbd5611805021945fc9def88d9fd93

  P and PN were dropped shortly after in dylan 2012:
  https://git.openembedded.org/openembedded-core/commit/?h=dylan&id=fb359583b659cda643973fa285002aaffb729a51

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb | 2 +-
 meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
index 0795839492..dac7dd36fc 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
@@ -7,7 +7,7 @@ SRC_URI += "file://0001-bindings-cxx-disable-tests.patch"
 
 SRC_URI[sha256sum] = "ae280f697bf035a1fb780c9972e5c81d0d2712b7ab6124fb3fba24619daa72bc"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-1.x:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-1.x:"
 
 inherit python3native
 
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
index 8d8a2cc3a4..224918a55a 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
     file://LICENSES/CC-BY-SA-4.0.txt;md5=fba3b94d88bfb9b81369b869a1e9a20f \
 "
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-2.x:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-2.x:"
 
 SRC_URI += "file://gpio-manager.init"
 
-- 
2.47.0


