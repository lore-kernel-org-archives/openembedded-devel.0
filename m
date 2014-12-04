Return-Path: <rapphil@gmail.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id B5C4B60601
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Dec 2014 12:43:38 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id x3so12459671qcv.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Dec 2014 04:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wGn1dXR0yiMW2omdY+XHYaX4Oa7//JbTFjATlNGmzPU=;
	b=WH9CIgUbrdEXJCN6XL6lQFVdZf7VvvS04LUrdX3jUwBcaDb2Br99lSSOiHvYHBdosM
	h7mqUDPzO4Jf5F1Oigb0vAR93Vd3gsggMCE/rFyJXkv5BC/6cynBa10zKVJt4M1Kgnej
	YL+VDxey+df+fBxP18OCJd1gXvZRq7Shg6OsVkt2g2ol5HCE7WFD2egdzNTQHm7CZxoA
	dLsQs2hLCcs5EMOvFq85GawmEUidPF81gKmvSMXVJOIkovGOY6OMOImiKvtNB6BrvM1H
	vKD04OcyVYeC6Nvt6Z7y3n2/FadkQUCXN+yKatvoJy0XD0lwPeeiQZJGXSW5BXAtW67G
	qTNg==
X-Received: by 10.224.67.7 with SMTP id p7mr16577354qai.97.1417697017805;
	Thu, 04 Dec 2014 04:43:37 -0800 (PST)
Received: from localhost.localdomain (host29.reason.com.br. [187.49.239.29])
	by mx.google.com with ESMTPSA id
	u64sm25860850qgd.46.2014.12.04.04.43.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Dec 2014 04:43:37 -0800 (PST)
From: Raphael Silva <rapphil@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Dec 2014 10:43:29 -0200
Message-Id: <1417697009-9094-1-git-send-email-rapphil@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] acpitest: fixing failing recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Dec 2014 12:43:45 -0000

Removed from blacklist and fixed do_compile error due to sysroot poisoning.
Fixed removing the redefinition of CC.

Signed-off-by: Raphael Silva <rapphil@gmail.com>
---
 meta-oe/recipes-extended/acpica/acpitests_20140828.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/acpica/acpitests_20140828.bb b/meta-oe/recipes-extended/acpica/acpitests_20140828.bb
index 75e10f6..93c20af 100644
--- a/meta-oe/recipes-extended/acpica/acpitests_20140828.bb
+++ b/meta-oe/recipes-extended/acpica/acpitests_20140828.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://tests/aapits/atexec.c;beginline=1;endline=115;md5=e92
 
 DEPENDS = "bison flex"
 
-PNBLACKLIST[acpitests] = "fails to find string.h since sysroot poisoning was added in internal toolchain"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpitests-unix-${PV}.tar.gz;name=acpitests \
            https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz;name=acpica \
@@ -20,7 +19,7 @@ SRC_URI[acpica.sha256sum] = "01d8867656c5ba41dec307c4383ce676196ad4281ac2c9dec9f
 
 S = "${WORKDIR}/acpitests-unix-${PV}"
 
-EXTRA_OEMAKE = "'CC=${TARGET_PREFIX}gcc ${HOST_CC_ARCH}' 'OPT_CFLAGS=-Wall'"
+EXTRA_OEMAKE = "'${HOST_CC_ARCH}' 'OPT_CFLAGS=-Wall'"
 
 # The Makefiles expect a specific layout
 do_compile() {
-- 
1.9.1


