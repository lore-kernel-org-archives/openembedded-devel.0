Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 008D27FA1F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 10:01:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4733rR0By4z8V
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 11:01:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572429687;
	bh=ObETB/uak7lBAOh/a+pNj0dndOFCUcIA01re/A1+SqI=;
	h=From:To:Subject:Date:From;
	b=ArETPL5302iRUKP5OWZlEFGOfNH0tp73qrU8/W9n/dpUzY0YKiupACysqIEV13gT2
	WfgmcTH8NPo8T33/ioUgmxaiRhbJFsDAc2dIxVAZJ8F20kwR7TY2/vllfKiOjtlLoJ
	FaXIq/HR9IAYcFEu7xXilOwH5zH0BCjRi4lWOKF7CI+9B6tT8mvI4f7N/hsPLYZGFE
	2uHJl+cshMnxpBc+oAUNkDxXFOoyquEswTbszgnC7YBZPXzuXbVHaEmhk98dCcflwV
	I5Mf2WIN4yvSzwDR4HJ3g39qHzgX6OCFoWswzFtuPnzyGIQU0+xFLhtvDtbUJaKk1x
	lB5iRkKBMovi0iBkyOF7azr0VjNmA6IhMErsdL0U1+iJL1cjghmEdPJgeNGQGdEiIG
	ITTFd6wnWnmCAL19NGml8hHZi6LnaQ2nvF9PPOISpovTlEiuCBIuYpX9kIn8RBFBlZ
	7/wTmrrt4YGN0D5sPM1ftKAmY4ra7rVK3seHCP/UggJMPrO/n/cScfyIY6QOm91ybx
	qGB2qZWE6pBZOutJ4sXVFiyOTQBAP8Aam9njiKDN/1/bqAFvI20gVdkU2OMDZ+A14+
	vrP9I955fMEX5ExAb40B1I7EGBcF+8PF/wjglCU6Y6+3bSfFOWX+O+3yjt5qQg3cUG
	d522VbmR8V2C3OsysxCg3w5w=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Oct 2019 12:01:26 +0200
Message-Id: <20191030100126.24714-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] packagegroup-meta-networking: Exclude nonbuilding recipes with musl
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
X-List-Received-Date: Wed, 30 Oct 2019 10:01:27 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../packagegroups/packagegroup-meta-networking.bb        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index f511d729e..8f8d7fe3c 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -42,6 +42,8 @@ RDEPENDS_packagegroup-meta-networking-connectivity = "\
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "samba", "", d)} \
     "
 
+RDEPENDS_packagegroup-meta-networking-connectivity_remove_libc-musl = "rdist"
+
 RDEPENDS_packagegroup-meta-networking-daemons = "\
     ippool radvd autofs keepalived proftpd openhpi lldpd \
     ptpd igmpproxy opensaf squid \
@@ -50,6 +52,8 @@ RDEPENDS_packagegroup-meta-networking-daemons = "\
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "networkd-dispatcher", "", d)} \
     "
 
+RDEPENDS_packagegroup-meta-networking-daemons_remove_libc-musl = "opensaf"
+
 RDEPENDS_packagegroup-meta-networking-devtools = "\
     python-ldap grpc \
     "
@@ -81,6 +85,9 @@ RDEPENDS_packagegroup-meta-networking-netkit = "\
     netkit-ftp netkit-rpc \
     "
 
+RDEPENDS_packagegroup-meta-networking-netkit_remove_libc-musl = " \
+    netkit-rsh-client netkit-rsh-server netkit-telnet"
+
 RDEPENDS_packagegroup-meta-networking-protocols = "\
     tsocks freediameter xl2tpd babeld mdns net-snmp \
     quagga pptp-linux zeroconf nopoll openflow rp-pppoe \
@@ -88,6 +95,8 @@ RDEPENDS_packagegroup-meta-networking-protocols = "\
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "dante", "", d)} \
     "
 
+RDEPENDS_packagegroup-meta-networking-protocols_remove_libc-musl = "mdns"
+
 RDEPENDS_packagegroup-meta-networking-support = "\
     ncp ndisc6 mtr tinyproxy ssmping ntp \
     wpan-tools bridge-utils ifenslave celt051 pimd \
-- 
2.17.1


