Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD20C4332F
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:33:59 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.11259.1651502036718734406
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pgIV33g0;
 spf=pass (domain: gmail.com, ip: 209.85.216.47,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id p6so12849926pjm.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4pk7DaVyu5XlQs8DRFaCc7kyKIiQciCvfRlhK4PFGn0=;
        b=pgIV33g0gTvHkOoKnaTCnnrF0x8BMWgytjvh94K0BvjoakNsW7rnHSzcDmX1YToT/s
         Hhtib4hGBnw/qdZZE9o1CRBCtcr18CDFfaDEuBIlakQ6t16OwGB0lW3EJx58mdd4c7UE
         z9U+p8oJoQJgL7Zj5EKyxd/kQhQ0gKHOfcRiAet9QLyM08VY2beB5/YyPD83CZ0cgj6H
         Qp2iN7FPmUVhmPm1zxmt5Z1HE26wQD1J2GvzXGhOBT6rRoNyN9ElbDaXrDYgM7xrCJfW
         puakDOvE6S2igHQBeYnPMMNLZVdymNwEGnLo7LcLI17AJGZel8+0YaySoMN3jHRORco2
         IIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4pk7DaVyu5XlQs8DRFaCc7kyKIiQciCvfRlhK4PFGn0=;
        b=HsfZtXRfm/Nza/aa0RKX1OtsIjE4QbiK/oOoCkEhAA1BwU12UdXwkilyzutecSavF0
         brBm8CjwKyZMntPMeSyJLzpumVd8ik7gTe5haxWzW3876RESNl4Qz5Bd7U7+Ls6e4gwL
         r4Tvo6c56HvdeyK+NjqTI3li2xmLMlImBf5VWqZxRg81UI2/G24G3mYcNfnrXlFl7zqd
         l5kSMgJGHndcFn/g/zcjE0QMZpeMGqWx+plc17cwGmpvedwUQCHMalfMzbauBvfVLii9
         utdrSy3c1PpeYOSuNcSJKanrjaB8xT0MlOfpNBWhE+Zlyss13jA5Sw99xk4YS6A/ekmd
         AZ/Q==
X-Gm-Message-State: AOAM531v9rr9J61CTzazULIrnquH0xBWl7DkICZyyhDDrnuwo1Ak7oN7
	5v8+HOlVIiU/h5/37aiaFIocSGhcRMM1jA==
X-Google-Smtp-Source: 
 ABdhPJx3fKsITkPs4Ags6v2OKj3xaq6yrmdV34+2NcSCIyBXUEhI7vKq4sDohjmtwhGWUGHLfhGXQQ==
X-Received: by 2002:a17:902:a705:b0:156:9cc5:1d6f with SMTP id
 w5-20020a170902a70500b001569cc51d6fmr12027464plq.66.1651502035907;
        Mon, 02 May 2022 07:33:55 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:33c6:b9d3:2a7b:1418])
        by smtp.gmail.com with ESMTPSA id
 i14-20020a17090332ce00b0015e8d4eb1f0sm4785518plr.58.2022.05.02.07.33.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 07:33:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][v2][PATCH 05/10] packagegroup-meta-oe: update pkg group
Date: Mon,  2 May 2022 07:33:40 -0700
Message-Id: <20220502143345.1500852-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502143345.1500852-1-akuster808@gmail.com>
References: <20220502143345.1500852-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 May 2022 14:33:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96934

Signed-off-by: Armin Kuster <akuster808@gmail.com>

--
v2]
Move to dynamic meta-python pkg group
---
 .../recipes-core/packagegroups/packagegroup-meta-oe.bbappend     | 1 +
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
index 09f3e34f4c..ae4d38085a 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
+++ b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
@@ -14,6 +14,7 @@ RDEPENDS:packagegroup-meta-oe-extended += "\
     mozjs \
 "
 RDEPENDS:packagegroup-meta-oe-support += "\
+    nvmetcli \
     smem \
 "
 RDEPENDS:packagegroup-meta-oe-extended:remove:libc-musl = "lcdproc"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 765edc5c5f..756ba46e34 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -122,6 +122,7 @@ RDEPENDS:packagegroup-meta-oe-bsp:remove:riscv64 = "efivar efibootmgr fwupd fwup
 RDEPENDS:packagegroup-meta-oe-bsp:remove:riscv32 = "efivar efibootmgr fwupd fwupd-efi"
 
 RDEPENDS:packagegroup-meta-oe-connectivity ="\
+    cyrus-sasl \
     gammu \
     gattlib \
     gensio \
-- 
2.25.1


