Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B02C88CBA
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 04:23:24 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.6224.1686630196221202398
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 21:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Qa/WIMpf;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b3c0c476d1so18784915ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jun 2023 21:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686630195; x=1689222195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViGw1pxN9g5zE7RcS5g+KtKMk19btzj2xCpInepGe1c=;
        b=Qa/WIMpflpWLVb8taioH+kQj77ou43y7u2FU4iQ3JvNGC6rSPIkb96yy7VWbIctf4S
         C0/yqGkilhImb6CNyYp+KPsKW3NZxE7G4DJ57LpJOUziL1y6Xca3UX3IiqlI1Somsiyj
         j+xnbGg7Mk1i5p7KndFwt7unVDFtipDBPO9J+2jc0kMp6U1FNpNTst7TMByHJh6UZci/
         SGdABWgqnRhim+3YIgU1V0zCoGJHyv8xQjfd1CK/SGAVz7CkXYRhWT4+XxnDpUy2f/+8
         2IpJB/KWFFmACG5X8ouGU0I+s6Mp3HG25BqCsrYEBH5n0CYZbGd99Sndk7rXd/XIbLkr
         Q6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686630195; x=1689222195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ViGw1pxN9g5zE7RcS5g+KtKMk19btzj2xCpInepGe1c=;
        b=E4c6t3ZJtPfySXlaHcDcr/BbokZYsw8CN1jvq1V7YqulC9vZWz20oHOhLtCZggvggC
         4Sqwv0z8VUj7cHaO0AmE87XR64EmlVJMzW35JiWRAuJT1oq/vAFJA64VPo3U951UJrvQ
         liptHegGRz++ZDysjpFNbsLd2fAXXe1+jc66g0oRKoZL5Np+2BZSTk8Hw8FYGtXYTKy9
         WDBfPMn+9NzIr9H50L3fdusUvNiddRykJH8fAu/pRSrk1wuSBD+PzuXtqosmejbj/4mm
         te+YuaYenY9+QIPWyD83HFKTRaiZafGpv/e3Q0voCcVoIbeHLrOXZYmlE1shySwrfJgK
         b+sA==
X-Gm-Message-State: AC+VfDxh+R4sLQaUi0BemXdhKutQHz8loFdgOFmcIQtmgsF8BZo16M8G
	aNUDbpmnuoc0eCAn1XhQ+rfLQBuPt2o=
X-Google-Smtp-Source: ACHHUZ6txFgG6378aHgoYHlZaM/CDaLip2/p9UJX+KYGWI7wsMXLdj+X3ehAGYurrMtOMoZDrnBTzQ==
X-Received: by 2002:a17:902:e88c:b0:1af:d812:d27 with SMTP id w12-20020a170902e88c00b001afd8120d27mr11577708plg.9.1686630195401;
        Mon, 12 Jun 2023 21:23:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id ji18-20020a170903325200b001b20dc1b3c9sm5025847plb.200.2023.06.12.21.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 21:23:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/3] spice-gtk: Fix build with lld linker
Date: Mon, 12 Jun 2023 21:23:11 -0700
Message-ID: <20230613042312.696835-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230613042312.696835-1-raj.khem@gmail.com>
References: <20230613042312.696835-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 04:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103254

lld flags errors when checking for --version-script linker option since
the export file specifies symbols which do not exist during link, so in
a way it is right, however bfd linker works fine and ignores this error.

perhaps the meson check should be improved but until them lets add
--undefined-version option to linker when using lld

Fixes
aarch64-yoe-linux-ld.lld: error: TOPDIR/build/tmp/work/cortexa72-cortexa53-crypto-mx8-yoe-linux/spice-gtk/0.42-r0/git/src/spice-glib-sym-file:1: unknown directive: spice_audio_get
>>> spice_audio_get
>>> ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/spice/spice-gtk_0.42.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
index 542ddb69b7..27504392a6 100644
--- a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
+++ b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
@@ -55,4 +55,6 @@ PACKAGECONFIG[vapi] = "-Dvapi=enabled,-Dvapi=disabled"
 EXTRA_OEMESON = "-Dpie=true"
 EXTRA_OEMESON:append:libc-musl = " -Dcoroutine=libucontext"
 
+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--undefined-version', '', d)}"
+
 FILES:${PN} += "${datadir}"
-- 
2.41.0


