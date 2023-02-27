Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E31C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 21:51:24 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.8186.1677534675447695572
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 13:51:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=IvQLmGRZ;
 spf=pass (domain: konsulko.com, ip: 209.85.160.173, mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f173.google.com with SMTP id w23so8412551qtn.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 13:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvagVBtEqujzAEyYWDqpNb/lkys1HgUbI9rQOEDzVfE=;
        b=IvQLmGRZjfJAiAZX627l/kEz+Aah3v0Bqr59sq+5uYpcMuUhlmg0K8YjNSznS/JSwP
         p762yHD8A1u7TgIr5ydDcnhRJDJzT7QTQP+xW/Qv7C+dmw/4Qe6/AMLA+vHHCp8OdZJ4
         gx2Hi6rcxZQvXEpYrTa4mTrYl7pSRNd1pA208=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvagVBtEqujzAEyYWDqpNb/lkys1HgUbI9rQOEDzVfE=;
        b=smwgZ3oJi9mk0nBZWBn87YtjsNJ4eU0+pxroc3vqIgvUN6pwVHck2LJvd0u+Agravo
         hgEpVzxTsaHunwmwmSJUiJS9mjjS1UmI5amdKUw79SUkGI8WI3UcV1hxb2V4zkS3ushh
         gXVIACMha4kpdK/2mLzBh4/j5FdQceiUr4MVAhuD5W8Bc4PynSOZi/Cq6cTTbzRW8RTZ
         bVs7c7Qhn8I8LjbGiJ9cyAllNADmltOoXJQYa+C4EWwxHKSDQR5MJpeoK4cyP4n7NPZD
         kme76jrdDr+bCfAScsC31Yu98Rcgs5Uooo6JZKzgURe6zRCWxiFbyEDTpuaFYuvcDQ7K
         lgLg==
X-Gm-Message-State: AO0yUKWaLyQYhdUtM2OQnaxGRYS0UlVx8Oy5sgCtL3c9r74ChFoqjWyu
	i8/M34apnV1fkKRu9LxE46yst+TzdAM4CeyC
X-Google-Smtp-Source: AK7set8pbbhL73FL0X38bjaFjjJRiqhyQLrPCeXCzrRdXRT2nJq1TxOY6G4MYHwS03p55WItYZ121A==
X-Received: by 2002:a05:622a:1391:b0:3b9:bca3:d93d with SMTP id o17-20020a05622a139100b003b9bca3d93dmr1555582qtk.22.1677534675656;
        Mon, 27 Feb 2023 13:51:15 -0800 (PST)
Received: from ghidorah.spiteful.org (192-0-174-82.cpe.teksavvy.com. [192.0.174.82])
        by smtp.gmail.com with ESMTPSA id a186-20020a3798c3000000b007423c122457sm5650370qke.63.2023.02.27.13.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 13:51:15 -0800 (PST)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org,
	Armin Kuster <akuster808@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 5/5] fluidsynth: update SRC_URI to remove non-existing 2.2.x branch
Date: Mon, 27 Feb 2023 16:51:03 -0500
Message-Id: <20230227215103.795230-6-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227215103.795230-1-scott.murray@konsulko.com>
References: <20230227215103.795230-1-scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 21:51:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101307

From: Preeti Sachan <preeti.sachan@intel.com>

Remove branch 2.2.x from SRC_URI as fluidsynth github removed the branch.
The SRCREV is on master branch.

Signed-off-by: Preeti Sachan <preeti.sachan@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 534d04af483d5f3d4fc73162c110449f169677a5)
Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index 14d09e5f0..a4590d61a 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -4,7 +4,7 @@ SECTION = "libs/multimedia"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
-SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=2.2.x;protocol=https"
+SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=master;protocol=https"
 SRCREV = "8b00644751578ba67b709a827cbe5133d849d339"
 S = "${WORKDIR}/git"
 PV = "2.2.6"
-- 
2.39.0


