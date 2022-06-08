Return-Path: <potin.lai.pt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4A0C43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 16:39:20 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web08.8895.1654706352195086682
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jun 2022 09:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AWCQD8B9;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: potin.lai.pt@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id b135so18780794pfb.12
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jun 2022 09:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=Gxslqa+zjR2J6tBvE0Lhcpnu8z/1G3R+aZvA1fYDRXk=;
        b=AWCQD8B96pWiJf6LiEzneDG/bvt4A33vvBOU5z+4jr+U3KN8TigM3nYE4jFsx57FVj
         Jhm820OuBINpan/L8VWAOYfyJyj44A1h013lBXUC1hjxdSOpaJ5qMbfRfrT2rIEsILNE
         25u+nVPFgq8mtmGJWnQqccC4eziT9LKZkKVNsYOJmJKU3qIWODZ9Xgo3lSn3+IO6Exup
         t4YbkxnHcVhppHmuMkiF3SKjpQTC+8v9gGo1yqrYli3sO+tTvge3fm6+LgzTKR0EOMSg
         YMNt8k+ozoBlaHkIdyriNYAy3K7vvOkz1F8Z2ll4bP9XFUX2uqmYgBcwhkD6LNrJfQFo
         gcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Gxslqa+zjR2J6tBvE0Lhcpnu8z/1G3R+aZvA1fYDRXk=;
        b=GX0XqFjQyXcRzCUJ79FxbItFlB2aSauIDx26doG8doGuVvKbcNQfj0fCaBQpZNnJcv
         J9rCPi4G0ZPJLu1TUH0izwtBy1VKLuKV5zYswwGKmp+xaZMseMQnQ+ycOXIftSff9l/h
         AxxxNm0rdpnhpUWhy0AFeOyhHgpuEra4/P+5l6cLkcOA+qB7dUSDaRP88P6HAvAP/Pur
         AU79yOXVpa4d+M8sLqL0MkycBD7w9Hd8aVFPdhJJqhyOt/OXQig5I2+9P6abjAFr7c+l
         N4x+at28syJIDqQ8yTrmQMKGkVZqbt+2l3iuXYTxflsFWm/Wmr1X33It49l6Tqo3n/KP
         +RqA==
X-Gm-Message-State: AOAM532CszbWW3Obx6anu5hzowEWi6uVopT4oqe8lg3RkhXJ2FF7IkhV
	V5gQyk4zFM3U8AUlE9fZjsPCM4ErC/VljBPS
X-Google-Smtp-Source: 
 ABdhPJzd20I2jVymebEEi4lNAW+YbYc4kBI4EEOyutR3EIb96vX7I4J1Uv0KRdzIYRmJMjd9biUJhg==
X-Received: by 2002:a63:6384:0:b0:3fc:68a8:b1ca with SMTP id
 x126-20020a636384000000b003fc68a8b1camr30381829pgb.597.1654706351572;
        Wed, 08 Jun 2022 09:39:11 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local
 (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id
 s14-20020a63450e000000b003fdb97e6961sm6897856pga.28.2022.06.08.09.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 09:39:11 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>,
	Potin Lai <potin.lai.pt@gmail.com>
Subject: [meta-networking][PATCH v3 1/1] mdio-tools: add recipes
Date: Thu,  9 Jun 2022 00:36:28 +0800
Message-Id: <20220608163628.5745-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jun 2022 16:39:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97444

From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>

Self-description from the README: mdio-tools is a low-level debug tool
for communicating with devices attached to an MDIO bus.

Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---

LINK: [v2] https://lore.kernel.org/all/20220201142608.186135-1-enguerrand.de-ribaucourt@savoirfairelinux.com/
LINK: [v1] https://lore.kernel.org/all/20220107150722.2221609-1-enguerrand.de-ribaucourt@savoirfairelinux.com/

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
index 000000000..a37500d93
--- /dev/null
+++ b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
@@ -0,0 +1,9 @@
+DESCRIPTION = "A low-level debug tool for communicating with devices attached to an MDIO bus"
+SECTION = "networking"
+HOMEPAGE = "https://github.com/wkz/mdio-tools"
+LICENSE = "GPLv2"
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
2.17.1


