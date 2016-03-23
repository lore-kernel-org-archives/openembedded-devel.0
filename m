Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 04F7260249
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 18:35:17 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id 124so56381266iov.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 11:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2p08uFrVBvfZcvb2JAgXP8wqyc5mTpxhNTGH0Idxe/w=;
	b=pePmsYXkUonRbK+MXHUezaXmzHYy89Ypg6Sg0wVBkpIp+vF72MtAMVbc/YrsEcAaJi
	XnMV0nIrNCrWoFn7CWv8Xi2lVZIRBeHyKryJS3gAz9PHW+cel9h/pq67aF3gZtkPCRZD
	FLhQ00qE56KX1JmiUQ0SHDzxWSAI3W+ygmSjxc/rtiK1/2J1SDsXW3f14XV5p7TivMMa
	8vKTd/PNPWFGJzOJYnW2jc0tixhJMoMiPJ/qYjKzeWYm9pIwrqCp4o8oDgajy72Q5jZi
	vYzhtDTVEK8/9miEU/uRkXJnDGRwUnuQ4nsqo8d9FzhOgtLE0UGSC5jw9zAoXpc8+Bbi
	DxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2p08uFrVBvfZcvb2JAgXP8wqyc5mTpxhNTGH0Idxe/w=;
	b=bkk8bhdDwHl3cvYq8cd+aIN+hcHVR9huUmxAT0LRgVSD1SzfOj8EbAP7+YjZb3lLPM
	+E7XU6Adq6HY6TCmgTPq8/vvEurLlOpfULE4y3/0uzTxwS5Rt1uk1rEDIVNy9ExG3U6I
	pQqL6xtFizkHgU4eGs6AP13vMM9IbRUHnK/vu/yOT3sAQcFoH/QbwDGlqCKP1ZEA8JfQ
	XCxziT79dcdG40q0Z8r7ezTBcPQqU/gJwYfLAHacSX3ALiAzW01vRO7d8IYamy9QwO3F
	7caDyT4reTicgRWkR9/ZjgEUzTFFrfm7/wAOdmMHnlYz3fSM549RdiTzLp0U/DpG9JGG
	/uKw==
X-Gm-Message-State: AD7BkJLN0ltoEMRYhq11BECX/lBokzGAaNPz8N7xxVByPXA1yvbfDiAdG82l4yHq9Sz4eA==
X-Received: by 10.107.11.213 with SMTP id 82mr5407819iol.152.1458758118230;
	Wed, 23 Mar 2016 11:35:18 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	yq10sm1595879igb.8.2016.03.23.11.35.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 11:35:17 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Mar 2016 11:35:11 -0700
Message-Id: <1458758111-23333-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] lvm2: make it more explicit that readline support is disabled by default
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Mar 2016 18:35:18 -0000

Any PACKAGECONFIG default assigned with ??= is lost by subsequent
assignments with +=, therefore lvm2 is currently building with the
readline PACKAGECONFIG disabled. Make that explicitly clear in the
recipe. Also minor formatting updates, to align with style guide.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index a891950..a8d44da 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -5,7 +5,6 @@ LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24"
 
-S = "${WORKDIR}/LVM2.${PV}"
 SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
            file://lvm.conf \
            file://0001-implement-libc-specific-_reopen_stream.patch \
@@ -14,8 +13,14 @@ SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
            file://0004-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch \
            "
 
-PACKAGECONFIG ??= "readline"
+S = "${WORKDIR}/LVM2.${PV}"
+
+inherit autotools-brokensep pkgconfig systemd
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
+
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 
 # Unset user/group to unbreak install.
 EXTRA_OECONF = "--with-user= \
@@ -34,12 +39,6 @@ EXTRA_OECONF = "--with-user= \
                 --with-systemdsystemunitdir=${systemd_system_unitdir} \
 "
 
-PACKAGECONFIG += "${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
-
-PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
-
-inherit autotools-brokensep pkgconfig systemd
-
 do_install_append() {
     # Install machine specific configuration file
     install -m 0644 ${WORKDIR}/lvm.conf ${D}${sysconfdir}/lvm/lvm.conf
-- 
1.9.1


