Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q8OrY-00079W-0o
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Apr 2011 05:29:28 +0200
Received: by ywg8 with SMTP id 8so1683735ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Apr 2011 20:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=gAt0jiy4eVhSpnT25SvATOTnfxCxRpMZrnd3ZjjRO4k=;
	b=k9Zs3ElNHiQVZtMqXcwCzLv3s9NIxG7XZjGems5g39gV/GIwzmSbfWcNHJU2/h3XtH
	7dqHvFBsrqY2aoQvFBd5Vn958IypP11a9KtiJNzwR+6SaIrOmu+PoSAmOvxBFsvNi19J
	GgeHw5fUL6KR4TpU8Zithl2VwWHwOqHVlw9mE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=uDPI4iobk1/uEYfM6Icv3NmcfxYqWLjjTbRCHSGMt7unGtn9yrVOQ+ClTmxHZ6ro6C
	Nd9BQpvJLGkGLgXhwspKtgFvuKqlTEFaZE3arBq1x+AltJ5pwL/DrfqDT3omXdO9CK7a
	1jVKtyTTDJtzIH4KjrBngn6PWCp4SLlQ/ZiGY=
Received: by 10.151.86.4 with SMTP id o4mr2611029ybl.339.1302319627801;
	Fri, 08 Apr 2011 20:27:07 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id t16sm1767800ybe.19.2011.04.08.20.27.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Apr 2011 20:27:07 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Apr 2011 08:56:56 +0530
Message-Id: <1302319620-18223-1-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCHv3 1/5] ti-syslink: Add TI Syslink Common include file.
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
X-List-Received-Date: Sat, 09 Apr 2011 03:29:28 -0000

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



