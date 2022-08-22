Return-Path: <potin.lai.pt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9E7C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 06:23:13 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.15186.1661149392436545078
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Aug 2022 23:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eq4G7s3u;
 spf=pass (domain: gmail.com, ip: 209.85.216.45,
 mailfrom: potin.lai.pt@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 c16-20020a17090aa61000b001fb3286d9f7so1116755pjq.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Aug 2022 23:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=rS7DS0v2m7wKajlD83boiexYDL2gtEMfVNA5OMNWFxA=;
        b=eq4G7s3udoWAUdhjtNg07wHdyEgYhjhJpqpslHedosr2J+MVxELgoIpy/cqKw/GMlZ
         6CTCRM2IyP1AtodtMyJndtTVVJMCB35R2y8VRF+Z02b/sInfb0o5Thxr/fLc2ltO8xji
         IYX/W+unUaKuegTH5GmAsutS2kS0Bea48PvNcskl67P/igjh0yqYanLMJ3QiFH9AJH8z
         Y5Ok8oDmYPQrpsIe8bjCrBAVouq4pgAXurDr6apvnGttw1KkXaCLLSIDFxE3Uzw2aDfD
         w+aEfYRmx732apIGeqeVCV3tRqNwfNSYh5kHJ73p8qR3rb4xRuplB+mYywssyz+EYXaU
         SU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=rS7DS0v2m7wKajlD83boiexYDL2gtEMfVNA5OMNWFxA=;
        b=G+NqkKSgjHuI5w24Xpa5JxVeajqqOfrmEJNLXuIgWLZrYJf8N8BIn87w6HKZFtGb+Q
         TRAbE8FUMchLs4b35HSAjZccfK+4TfCenAMyiMdJ1WK4uxaXm9t38g0YQ34j72dAGouv
         cslieBvjdQWI/eJQ9UyPu30GMC4gRDVUqvIXU10gat8jx49vJVxF8zlnPAb+G6PKsPEs
         gwKaW3N1Zcai+/hEgCNGML14jhb5RibKACLvh4a6HtLULyGlSCZ6JuQvdQbVKhOj9QH3
         49OslNIcaL/HcpCF/PnzZNBIls9cbcWPjAk/pXE+5B6QSGVJlHXebQIgOmAiCR93Nyyj
         hp+A==
X-Gm-Message-State: ACgBeo3rmMCNmssAQze+9YNuTsMs4WgSFEZxkqf3+wUczmbZmGV+fHkB
	gP5U3LEJFy7fS0QrXF36sNjDqpLNHY2Q9A==
X-Google-Smtp-Source: 
 AA6agR4kjjGIc68bJZ2FTirC/VzA1ZABZxFCbWG05o9QqvyaKBlSvFpU9ZmB9wEcPNfIJD8rvORXSw==
X-Received: by 2002:a17:902:f687:b0:172:8d6a:3c10 with SMTP id
 l7-20020a170902f68700b001728d6a3c10mr18877528plg.109.1661149391028;
        Sun, 21 Aug 2022 23:23:11 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net.
 [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0016d773aae60sm7563065plf.19.2022.08.21.23.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 23:23:10 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
X-Google-Original-From: Potin Lai <potin.lai@quantatw.com>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>,
	Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v4 1/1] mdio-tools: add recipes
Date: Mon, 22 Aug 2022 05:44:31 +0000
Message-Id: <20220822054431.3856258-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Aug 2022 06:23:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98352

From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>

Self-description from the README: mdio-tools is a low-level debug tool
for communicating with devices attached to an MDIO bus.

Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
LINK: [v3] https://lore.kernel.org/all/20220608163628.5745-1-potin.lai.pt@gmail.com/
LINK: [v2] https://lore.kernel.org/all/20220201142608.186135-1-enguerrand.de-ribaucourt@savoirfairelinux.com/
LINK: [v1] https://lore.kernel.org/all/20220107150722.2221609-1-enguerrand.de-ribaucourt@savoirfairelinux.com/

change v3 --> v4:
* update license to follow SPDX format
* mdio configs update and merged in yocto-kernel-cache
  LINK: https://git.yoctoproject.org/yocto-kernel-cache/commit/?h=yocto-5.15&id=0d58e2d6a7824df62129af91bbe9fadfdb5f9dce
  tested on yocto-kernel-cache commit: f7f709bf874f85baff9f2fb0ac0341c08399b144

change v1 --> v2:
change v2 --> v3:
* update version to 1.1.1

change v1 --> v2:
* moved in recipes-support
* removed version in mdio-tools_1.0.1.inc filename
---
 .../recipes-support/mdio-tools/mdio-netlink_git.bb  | 13 +++++++++++++
 .../recipes-support/mdio-tools/mdio-tools.inc       |  9 +++++++++
 .../recipes-support/mdio-tools/mdio-tools_git.bb    |  9 +++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 meta-networking/recipes-support/mdio-tools/mdio-netlink_git.bb
 create mode 100644 meta-networking/recipes-support/mdio-tools/mdio-tools.inc
 create mode 100644 meta-networking/recipes-support/mdio-tools/mdio-tools_git.bb

diff --git a/meta-networking/recipes-support/mdio-tools/mdio-netlink_git.bb b/meta-networking/recipes-support/mdio-tools/mdio-netlink_git.bb
new file mode 100644
index 000000000..b50d33f90
--- /dev/null
+++ b/meta-networking/recipes-support/mdio-tools/mdio-netlink_git.bb
@@ -0,0 +1,13 @@
+require mdio-tools.inc
+
+DEPENDS += "virtual/kernel libmnl"
+# This module requires Linux 5.6 higher
+
+S = "${WORKDIR}/git/kernel"
+
+inherit module
+
+EXTRA_OEMAKE = "KDIR=${STAGING_KERNEL_DIR}"
+MODULES_INSTALL_TARGET = "install"
+
+RPROVIDES:${PN} += "kernel-module-mdio-netlink"
diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools.inc b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
new file mode 100644
index 000000000..a8a435fad
--- /dev/null
+++ b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
@@ -0,0 +1,9 @@
+DESCRIPTION = "A low-level debug tool for communicating with devices attached to an MDIO bus"
+SECTION = "networking"
+HOMEPAGE = "https://github.com/wkz/mdio-tools"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://github.com/wkz/mdio-tools.git;protocol=https;branch=master"
+SRCREV = "07cbff2d5e2de05037e5e7edd5044d678394c8d1"
+PV = "1.1.1"
diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools_git.bb b/meta-networking/recipes-support/mdio-tools/mdio-tools_git.bb
new file mode 100644
index 000000000..cd4df3da0
--- /dev/null
+++ b/meta-networking/recipes-support/mdio-tools/mdio-tools_git.bb
@@ -0,0 +1,9 @@
+require mdio-tools.inc
+
+DEPENDS += "libmnl"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig autotools
+
+RDEPENDS:${PN} = "kernel-module-mdio-netlink"
-- 
2.31.1


