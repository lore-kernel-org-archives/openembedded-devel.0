Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q757Q-00012M-F7
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 14:12:24 +0200
Received: by gyf1 with SMTP id 1so84217gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 05:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ato7KhJBKKBh9Zhb22eNnS8HP9JOO41/2Gu6t7Bon9A=;
	b=lTJXiH7C3duhSNdeuyqclw/DbjVRC9hliA6GBnoea4D5XnRHZe0+z74XjqcG2BNNgR
	MCo/cHA0zkT553HPP1qAXntb/WMieuYrJ0OVzquxDnvrGuJlszu8Vxp6+6PSHQm1Jy3y
	tkakWfMv3j672Cmebqz2I+x7QwhOQBvOaHDLA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=nqWKzmsVZUIOtZKUhNOyoxZLMhG4ex1QjHdnJlv9nvLGBoAYUL63bzRKprkQe7+o6V
	AyZKpG3Y7yYM44Vq7xB060XeYTu9/ACFzu/TtvqR3TO6Db14yq8gGYWX8Sr3R+QqrsNw
	E9Hdd2oKdE6iZZduHUeo6uhwgvXGWnfryn9rw=
Received: by 10.236.181.70 with SMTP id k46mr7130846yhm.29.1302005417796;
	Tue, 05 Apr 2011 05:10:17 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id h43sm2798378yhm.22.2011.04.05.05.10.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 05:10:17 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2011 17:40:03 +0530
Message-Id: <1302005404-21580-3-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1302005404-21580-1-git-send-email-heroor@gmail.com>
References: <1302005404-21580-1-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH 3/4] ti-sysbios: Update Installer unpack commands.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Apr 2011 12:12:24 -0000

From: Siddharth Heroor <heroor@ti.com>

* New versions of TI Sys/Bios use a different installer unpack
  command.
* Bump PR.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/ti/ti-sysbios.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/ti/ti-sysbios.inc b/recipes/ti/ti-sysbios.inc
index 84a76a4..046b6fe 100644
--- a/recipes/ti/ti-sysbios.inc
+++ b/recipes/ti/ti-sysbios.inc
@@ -7,14 +7,14 @@ require ti-paths.inc
 require ti-staging.inc
 require ti-eula-unpack.inc
 
-PR = "r1"
+PR = "r2"
 
 S = "${WORKDIR}/bios_${PV}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios/${PV}/exports/bios_setuplinux_${PV}.bin;name=sysbiosbin"
 
 BINFILE="bios_setuplinux_${PV}.bin"
-TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
+TI_BIN_UNPK_CMDS="Y: q:workdir:Y"
 
 do_install() {
     install -d ${D}${SYSBIOS_INSTALL_DIR_RECIPE}
-- 
1.7.0.4



