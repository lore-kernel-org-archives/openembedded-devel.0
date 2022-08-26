Return-Path: <potin.lai.pt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E642BECAAA2
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:22:22 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.32795.1661480534336805815
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nvL6Xaqw;
 spf=pass (domain: gmail.com, ip: 209.85.216.48,
 mailfrom: potin.lai.pt@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id e19so344855pju.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=rS7DS0v2m7wKajlD83boiexYDL2gtEMfVNA5OMNWFxA=;
        b=nvL6XaqwRdl2776kCloG678uqBpdjH3J7JVmsVAU8f/brrJAV6n8BonU75ul2OiCdt
         0vI3cRZ8X7X6MPxwVb2rm6Ct5y2EGqigPge0hjF2TXb9+B1SJM9XC4WuigKBCZzpnKnn
         WRXqCKuKOu8nQvkiklm7xtZCTZ0Zvva4ABzHbn8K+Sm8rxQthk9tzeNWcdoFLWHRdwAa
         sI3k+wVQ8S2M1BG29dNfTrBHpchP7rn2jkBu0fUANUJ540nTbub0jNotUYG+12lQmGRB
         GI7+o+NiP/p7TI3Dx7yKXnUResh27m0cnu+DgWgjydIwXwNSFDKS1MlS/YPaxshpfZfJ
         QYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=rS7DS0v2m7wKajlD83boiexYDL2gtEMfVNA5OMNWFxA=;
        b=1UsmWd3eEMMhjQmFL+iaYu4o51o/gEgrntlM4y1lP7sV5xYdG6I0RlFqJ3PpOasC3e
         vSHEdE/dH/hkKVCgp8jJggTILMojHV0/hjrW1Zj3IGcEOYjskoHZMAQ/GKXndn8dAQDQ
         gzX+bQih+s2j7NBtNCGDGnIeMTf436Oiu4XEV23natdHRPFmhGBlpbzrmnwuUaO76zz7
         cVb4ZlO03TSfZEJPB0TsAw3V/ue/eSm0a9vqNA5xLvk5MeAqRSLh/vDB63SoEGxeu7IL
         sBO9yXlm3pl/c+YjgH6To0piS7M5Vnuj/0tsgEVtK02qz8xNFHAFZVweoCduNu/suP3o
         /dVQ==
X-Gm-Message-State: ACgBeo21grCuYeg0Vu8/f/DuZ4IHcnpLqTDPHC8LR2KAe9NReS/nv775
	LDXq3GiGDMTNUUsdkNrJgqHUpWA1pSfxRQ==
X-Google-Smtp-Source: 
 AA6agR70UbE3JCdRqynVR26zLuaxvNr0rYiQnhbjvVCWRIoxIaC8AU/KEMhJjeZplsj+fbKssR7mGQ==
X-Received: by 2002:a17:902:6b07:b0:172:a76d:7cc5 with SMTP id
 o7-20020a1709026b0700b00172a76d7cc5mr1787735plk.128.1661480533096;
        Thu, 25 Aug 2022 19:22:13 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net.
 [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id
 h4-20020a170902680400b00172a4170ff5sm260419plk.86.2022.08.25.19.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 19:22:12 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Potin Lai <potin.lai@quantatw.com>
Subject: [meta-networking][RESEND PATCH v4 1/1] mdio-tools: add recipes
Date: Fri, 26 Aug 2022 01:43:18 +0000
Message-Id: <20220826014318.182478-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 02:22:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98449

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


