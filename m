Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0971AC433F5
	for <webhook@archiver.kernel.org>; Sun, 22 May 2022 20:45:10 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.20247.1653252300203568886
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 May 2022 13:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AtRAX5RJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 i20-20020a05600c355400b0039456976dcaso6585079wmq.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 May 2022 13:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NtLtEwBQ+4rnS7WWu66EBjLcBHn98B6Gx3P7pu248y4=;
        b=AtRAX5RJMcpwsZjV+xSYbhUtp7d/7OVTQQS2fGo3cN4ifpFg9ag7Yu20uRLcSTug7j
         +Ra/cSfQjIuYUCY3GLnR/QcIsQHb0gtlRnLDU42pufhPpb0y0AKsJsZHL0mvWv7skuNk
         ier7PcO4SqO628oBKIK98CwE3TKMTh5kgES8674DLCixqbJZa9IHVgVqm+YVIbanh/hY
         aczeBupx6fCAsirtpDCagzJB5E2pHGDCCjndooQ6Pks4muP+ZsQwkLx6r2wsT1o/Vu40
         qfTauvkcrMp4hRIzwECtkZDbpjNQCoX8R53sZMLQBkKzguZkanPtgYvNwiXIYfR+DWb8
         janw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NtLtEwBQ+4rnS7WWu66EBjLcBHn98B6Gx3P7pu248y4=;
        b=i2HeJiJ37clvsc9EMh1HMunzwotQ0nY6MxPBHEU0fuNA5LEV2n3eD6MQnvbRsVXx1I
         hmmWGmW+uAHeilF/edLu5tHDB7nG6jbQojwpFBdNOtO2kNiFJlyN9bT/0UFYKtiGVZQk
         BiGmWM48es62t+luL1qijLia9yvZnyKiol2nVz3pVgVIEPRxSohffNUqPLI+MZkUqYyc
         ogN/C1aON/jZNTktn9QKeUpN7IETClgtM2GZpva/hIgJNTxg34UWiAyw3jbdlZ491dWr
         lIYaMcDG7EEeKPuYKn52RNZaYaGSYai9OwBUekhhhAZuHTlB6T412Ymwfs/2yYK/uroq
         Q73g==
X-Gm-Message-State: AOAM531FnAGm1FyWGSDM8XkN1CSaW790qvKr47SGzQyxYc0QaqNmkHJg
	iNXOtuRAKrapyBszPmK/W9GDjwcCNiLDRw==
X-Google-Smtp-Source: 
 ABdhPJzd9Lisr34CNG2l9sru1abnthuQnWpojEgDKBxbNd+x/6YoDVy52lxh71eE9SHAgXsuGdK5hw==
X-Received: by 2002:a05:600c:1989:b0:394:8dc0:b57f with SMTP id
 t9-20020a05600c198900b003948dc0b57fmr17753504wmq.110.1653252298343;
        Sun, 22 May 2022 13:44:58 -0700 (PDT)
Received: from uvv-2004-vm.localdomain
 (dslb-002-205-242-149.002.205.pools.vodafone-ip.de. [2.205.242.149])
        by smtp.gmail.com with ESMTPSA id
 q11-20020adfaa4b000000b0020fc6590a12sm3386999wrd.41.2022.05.22.13.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 13:44:58 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [meta-filesystems][PATCH] overlayfs-progs: add new recipe
Date: Sun, 22 May 2022 22:44:40 +0200
Message-Id: <20220522204440.2323651-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 May 2022 20:45:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97221

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

overlayfs-progs contains fsck.overlay, which is used to check and optionally
repair underlying directories of overlay-filesystem.

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 .../overlayfs/overlayfs-progs_git.bb          | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git.bb

diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git.bb
new file mode 100644
index 000000000..2f173b259
--- /dev/null
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "File system check utility for OverlayFS"
+HOMEPAGE = "https://github.com/hisilicon/overlayfs-progs"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
+
+SRC_URI = "git://github.com/hisilicon/overlayfs-progs.git;protocol=https;branch=master"
+
+PV = "1.0+git${SRCPV}"
+SRCREV = "e10ef686570d9c7eff42f52461593a5c15da56bd"
+
+S = "${WORKDIR}/git"
+B = "${S}"
+
+EXTRA_OEMAKE += "'CC=${CC} -O2'"
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_compile () {
+    oe_runmake
+}
+
+do_install () {
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/fsck.overlay ${D}${bindir}
+}
-- 
2.25.1


