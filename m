Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4141FC433F5
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 07:36:21 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.1531.1652340980124802068
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 00:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WK//pEaf;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id h16so5284346wrb.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 00:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gnW2/2cpLZpuZ9bmGGf6vA2HU1aKm1z/KOdzIzcgB8k=;
        b=WK//pEafjt0XrRjQfN5uMEmCNHSPfQjjrqi00cGaF8qtsO02KTyhcq27xExeK1qn+O
         xgh/+6VUk3jvflgzmGlw2lr4nvy6SNCl4VEnl492qrPd9CTzYHjF6LfjhiOMaqM0vb+w
         xaUyG56AcP+Hn9d6/c4QBiVRs4P3OnTZgo2iR8WU/tOqFkD5gZPXyoVLRutbOK6DsFnS
         NStnGaC00B3c641paN+gV2r0AYC9/IYuTcrLPP60M1j0i2jAEkWULMTeC9iKC38lWwft
         TGO/AhwgxORhPQm/eTj517AymPq8J13ytJjy8dK4uQ7zhDJFGH82O2XDpTuIIRyU3FSZ
         MmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gnW2/2cpLZpuZ9bmGGf6vA2HU1aKm1z/KOdzIzcgB8k=;
        b=cjXLPoNRCXzd4py8kYGT6ogPUl2KCPr3gDGMC+1LuLSXkqkNf/7y1ozJlpoAb5a+Ji
         q8QJV3rBzXx+k/zQD1p0kDadNqIg9a5+7pnkT7z12e/fNmrsYoMdCo3tCX2lPknrzyJV
         UOJfvZ9WP2F/lgdOb6+GeWQ/hMncHmT0yYSo8dge/nLKj+dcVCGpE55HYKeiSwJVMRTj
         j8sv2uVcW7++RAcNYfefXyRlhT51F3F49Cjy55FDp5E9QFiMVn/o+01rvXAnRUia6vWU
         euCgRd+IsQ05oSQogUaD6+6ZaVrsWrmNrk17kXtsDdWmi6gUPCk/gsVSPtDSfY7pBBuw
         PUag==
X-Gm-Message-State: AOAM531kfxQUQQVsO+507Jc85YJBYUq4DF4kF2qUDVDuzkj7N3j342Ev
	WjeDaMM6eDodxOEkq9/AbchBaXfHSwqsEQ==
X-Google-Smtp-Source: 
 ABdhPJxOwRFeCjcEAe7l8wF1y/1NfKt15+KgUJHe13589Z/QtcXMzw3KsC6pWfaIjbGo9zyQSDInyg==
X-Received: by 2002:a5d:4ed0:0:b0:20c:dfe2:6e2e with SMTP id
 s16-20020a5d4ed0000000b0020cdfe26e2emr5184811wrv.523.1652340978011;
        Thu, 12 May 2022 00:36:18 -0700 (PDT)
Received: from developer.localdomain
 (dslb-002-205-242-181.002.205.pools.vodafone-ip.de. [2.205.242.181])
        by smtp.gmail.com with ESMTPSA id
 j5-20020a05600c1c0500b003947e11c3ecsm2101073wms.17.2022.05.12.00.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 00:36:17 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <v.yurkov@precitec.de>
Subject: [meta-oe][PATCH] polkit: add udisks2 rule
Date: Thu, 12 May 2022 09:35:40 +0200
Message-Id: <20220512073540.3020016-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 07:36:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97047

From: Vyacheslav Yurkov <v.yurkov@precitec.de>

The rule allows non-priviledged users from plugdev group to
mount/unmount block devices

Signed-off-by: Vyacheslav Yurkov <v.yurkov@precitec.de>
---
 .../files/50-org.freedesktop.udiskie.rules    | 24 +++++++++++++++++++
 .../polkit/polkit-group-rule-udisks2.bb       | 17 +++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-extended/polkit/files/50-org.freedesktop.udiskie.rules
 create mode 100644 meta-oe/recipes-extended/polkit/polkit-group-rule-udisks2.bb

diff --git a/meta-oe/recipes-extended/polkit/files/50-org.freedesktop.udiskie.rules b/meta-oe/recipes-extended/polkit/files/50-org.freedesktop.udiskie.rules
new file mode 100644
index 0000000000..2ffa4087a8
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/files/50-org.freedesktop.udiskie.rules
@@ -0,0 +1,24 @@
+polkit.addRule(function(action, subject) {
+  var YES = polkit.Result.YES;
+  var permission = {
+    // required for udisks1:
+    "org.freedesktop.udisks.filesystem-mount": YES,
+    "org.freedesktop.udisks.luks-unlock": YES,
+    "org.freedesktop.udisks.drive-eject": YES,
+    "org.freedesktop.udisks.drive-detach": YES,
+    // required for udisks2:
+    "org.freedesktop.udisks2.filesystem-mount": YES,
+    "org.freedesktop.udisks2.encrypted-unlock": YES,
+    "org.freedesktop.udisks2.eject-media": YES,
+    "org.freedesktop.udisks2.power-off-drive": YES,
+    // required for udisks2 if using udiskie from another seat (e.g. systemd):
+    "org.freedesktop.udisks2.filesystem-mount-other-seat": YES,
+    "org.freedesktop.udisks2.filesystem-unmount-others": YES,
+    "org.freedesktop.udisks2.encrypted-unlock-other-seat": YES,
+    "org.freedesktop.udisks2.eject-media-other-seat": YES,
+    "org.freedesktop.udisks2.power-off-drive-other-seat": YES
+  };
+  if (subject.isInGroup("plugdev")) {
+    return permission[action.id];
+  }
+});
diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule-udisks2.bb b/meta-oe/recipes-extended/polkit/polkit-group-rule-udisks2.bb
new file mode 100644
index 0000000000..ae024d0328
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit-group-rule-udisks2.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Polkit rule to allow non-priviledged users mount/umount block devices via udisks2"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+require polkit-group-rule.inc
+
+# The file originates from https://github.com/coldfix/udiskie/wiki/Permissions
+SRC_URI = "file://50-org.freedesktop.udiskie.rules"
+
+RDEPENDS_${PN} += "udisks2"
+
+do_install() {
+    install -m 0755 ${WORKDIR}/50-org.freedesktop.udiskie.rules ${D}${sysconfdir}/polkit-1/rules.d
+}
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM:${PN} = "--system plugdev"
-- 
2.30.2


