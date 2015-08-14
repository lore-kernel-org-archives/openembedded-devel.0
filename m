Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6996E268
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 19:10:36 +0000 (UTC)
Received: by pdbfa8 with SMTP id fa8so33897862pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 12:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GrCQkkq+1cw4dklulJS7U/GTtHUq8s4gaSkTsK97tpI=;
	b=eav4eEADEgp08xm1W7sKIuDxmc48i5A4bvW3p8sN8gS+ofwCMIth9xaUhIWJprD1ft
	rxsLqguMPL4ZEEQWXH4fdUyOyOWH2K6GQUJzZjSMMJWqbuyJe8ZNae+sKgqbNcW3sIca
	CXmgSZjjYSvfu266tSQ4tZb6Rhh/so+LTngB0chm+ku7uHB24BYR5iz+8or6L6HKsQU0
	OB/BpM7wx6ZUZVEVco58CWOz7y+oyZwU1CrYgyJ2CiYyAJliSjkhqudHW3GoFBRJ362Q
	ogq4WqrEIuhQ1/y92nZikoQgqTzvAJ/A2NqfNdROcTABLkuNbv68MQQna5Qq8BZvEKis
	la5A==
X-Gm-Message-State: ALoCoQl/dhnp2ukwqMf0uo5e/DsAavsL9t4E66p7lMzrQReZuHjVHdL8ixfEQO5DGFfyFDSPCUU8
X-Received: by 10.70.41.6 with SMTP id b6mr91010608pdl.89.1439579436761;
	Fri, 14 Aug 2015 12:10:36 -0700 (PDT)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id v4sm6857281pdg.79.2015.08.14.12.10.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Aug 2015 12:10:36 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Aug 2015 00:40:27 +0530
Message-Id: <1439579427-15694-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] scsirastools: add new recipe
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
X-List-Received-Date: Fri, 14 Aug 2015 19:10:42 -0000

The scsirastools  were designed to add to the Serviceability of disk
devices under Linux so that the system does not have to be rebooted or taken out
of service to perform common maintenance or service functions. Devices handled
by scsirastools include SCSI, Linux software RAID, SAS, SATA, and USB storage
devices (some via SCSI emulation).

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../scsirastools/scsirastools_1.6.4.bb             | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb

diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb
new file mode 100644
index 0000000..8e34104
--- /dev/null
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb
@@ -0,0 +1,41 @@
+SUMMARY = "Linux SCSi tools to service maintain disk storage devices"
+DESCRIPTION = "scsirastools were designed to add to the Serviceability of \
+               SCSI devices under Linux so that the system does not have \
+               to be rebooted or taken out of service to perform common \
+               maintenance or service functions. It handles SCSI, \
+               Linux SW RAID, SAS, SATA, and USB devices via SCSI emulation."
+HOMEPAGE = "http://scsirastools.sourceforge.net/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=687ea108478d26152ae46eb29d9d1545"
+PR = "r0"
+
+SRC_URI = "http://prdownloads.sourceforge.net/scsirastools/scsirastools-${PV}.tar.gz \
+	  "
+SRC_URI[md5sum] = "2d775111b62e2dfc1960a722f5fda211"
+SRC_URI[sha256sum] = "38d2c6c9b04a2c594e528927b950754f94c0522718d17c78e6589ba778339bf8"
+
+inherit autotools autotools_stage update-rc.d
+
+# mdadm Makefile has CC set to gcc, hence override CC to ${CC}
+EXTRA_OEMAKE += "CC='${CC}'"
+
+INITSCRIPT_PACKAGES = "${PN}-diskmon ${PN}-raidmon"
+INITSCRIPT_NAME_${PN}-diskmon = "sgdisk"
+INITSCRIPT_PARAMS_${PN}-diskmon = "defaults 80 20"
+INITSCRIPT_NAME_${PN}-raidmon = "sgraid"
+INITSCRIPT_PARAMS_${PN}-raidmon = "defaults 80 20"
+
+PACKAGES =+ "${PN}-diskmon ${PN}-diskmon-dbg"
+PACKAGES =+ "${PN}-raidmon ${PN}-raidmon-dbg"
+
+FILES_${PN}-dbg += "/usr/share/scsirastools/.debug"
+
+FILES_${PN}-diskmon = "${sbindir}/sgdiskmon ${sysconfdir}/init.d/sgdisk"
+FILES_${PN}-diskmon-dbg = "${sbindir}/.debug/sgdiskmon"
+
+FILES_${PN}-raidmon = "${sbindir}/sgraidmon ${sysconfdir}/init.d/sgraid"
+FILES_${PN}-raidmon-dbg = "${sbindir}/.debug/sgraidmon"
+
+RDEPENDS_${PN} += "bash"
+RDEPENDS_${PN}-diskmon += "${PN}"
+RDEPENDS_${PN}-raidmon += "${PN}"
-- 
1.9.1


