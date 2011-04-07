Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q7kC1-0006qZ-Vg
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 10:03:54 +0200
Received: by yxn22 with SMTP id 22so911579yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 01:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=gAt0jiy4eVhSpnT25SvATOTnfxCxRpMZrnd3ZjjRO4k=;
	b=LJVnOPweJ9Yn9Qfc66Z0WrV2/KUOBtY6e1lJU6+L3G7ymqzfoeD1e3UdCCnH6o8KCB
	pGUyfdmMVw7u24ieMVkDO80MTZI5SoPdo/qf1CgKmrPUPsWUi4Rai4gnPAHGch5JevZc
	pvQdCrc468rKjyuTQLwrJV19de5hphsRL/8Iw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=aZF6YZZBsYpB4u5Gx9idrOFEXw/E0c2e2PgwOZhznUjWniEVdPbdju5KSsj/rgUeBI
	0X7QtabyZnx8CY8Y8/KTE1+AVpHYwT2ZujmSxAfkMjri4KTU6li+TQWtTbt5sR249Z7K
	rWj32jq9yXSiWZ8C7Fl1A3iSpJvGYX3I3sXTU=
Received: by 10.91.5.40 with SMTP id h40mr486242agi.106.1302163304493;
	Thu, 07 Apr 2011 01:01:44 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id c4sm1593468ana.23.2011.04.07.01.01.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Apr 2011 01:01:43 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Apr 2011 13:31:32 +0530
Message-Id: <1302163296-16002-1-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCHv2 1/5] ti-syslink: Add TI Syslink Common include file.
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
X-List-Received-Date: Thu, 07 Apr 2011 08:03:54 -0000

From: Siddharth Heroor <heroor@ti.com>

* TI Syslink is an IPC layer for ARM-DSP Communication.
* Add a common include file for the different Syslink
  environment variables.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/ti/ti-syslink-common.inc |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-syslink-common.inc

diff --git a/recipes/ti/ti-syslink-common.inc b/recipes/ti/ti-syslink-common.inc
new file mode 100644
index 0000000..584fe8e
--- /dev/null
+++ b/recipes/ti/ti-syslink-common.inc
@@ -0,0 +1,25 @@
+# Define all enviroment variables required by syslink.
+
+SYSLINK_ROOT           ?= "${WORKDIR}/syslink_${PV}"
+SYSLINKHLOSSAMPLES     ?= "procMgr frameq gateMP heapBufMP heapMemMP listMP messageQ notify ringIO ringIO_gpp sharedRegion"
+SYSLINKPLATFORM        ?= "TI81XX"
+SYSLINKSUFFIX          ?= "xe674"
+SYSLINKLOADER          ?= "ELF"
+
+SYSLINKVARIANT_ti816x   = "TI816X"
+SYSLINKVARIANT_ti814x   = "TI814X"
+SYSLINKVARIANT         ?= "<UNDEFINED_SYSLINKVARIANT>"
+
+XDCTARGETS             ?= "ti.targets.elf.C674"
+XDCPATH                ?= "${IPC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages" 
+XDCBUILDCFG            ?= "${SYSLINK_ROOT}/config.bld"
+
+export SYSLINK_ROOT
+export SYSLINKHLOSSAMPLES
+export SYSLINKPLATFORM
+export SYSLINKSUFFIX
+export SYSLINKLOADER
+export SYSLINKVARIANT
+export XDCTARGETS
+export XDCPATH
+export XDCBUILDCFG
-- 
1.7.0.4



