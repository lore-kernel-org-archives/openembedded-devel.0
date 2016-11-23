Return-Path: <joe@deserted.net>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 914B671B0C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 15:08:27 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id r94so1947001ioe.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 07:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id;
	bh=HtmHW75EP9wFVr+tXP9rckjiXXcBgxCgw69HehyTz1k=;
	b=yO5NIbFJCTyZjZYaQULvMdk82zWcb7NJOR+61IyedwaIZ9+Q68AzKE4y3E9/tFe26B
	jMwwn6eRbCfFVyleFTS0b8bXzA9hWhfFDVaQEumw54HK57Mnv10BT1GdPYtQz8ljQAln
	uOjUh7AuCb2m8kLlo9yYhQCQ3hVgISokT85mxXjlLt0OEWKxbtPvm7Di7AWC6Fzytn8E
	MFFcnYaVimckh9K4RscIfXG6ficmPPmsK1CpKO85HHrCrG40Scf+jriPjIBaJnpnbTIZ
	9PPKQpRGF+biiL8SJaZpFkcX6Dlg6kwOD/qOIIEgkLPyyUn/Nxkaa6AtNhFnwE9JlIA6
	sbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=HtmHW75EP9wFVr+tXP9rckjiXXcBgxCgw69HehyTz1k=;
	b=OzfUOLomh+DE/+iciofAc5U6IzeEY1jJ6jpARUDTKHiMZGE18C95xr+fpTXLwC8DHG
	bYY0T3ETJ4NUbEF9SAM2+kfW9sn93eOI3U62fUgqH4VJbnRGW7Z3GbTSMnKLc4zg1j4Y
	MQL3S4dMITfA9Z13oZWbQlLsTAVTMoRgK3yp2wbz5jSFRyyke77zgkrKQ2FyemveM1ht
	1a+/nSMweoxx5ODptNgHsKkDyL2cryK1PubjaBTWjadzkmokJD2oFY/DER3FpaEi20t2
	yLGVcnaF8DM7aPugrw2FKK42RTLlMmhz92gYkie/UAevxFFLxEF//Ao5XznXOuJVQKbk
	eZpQ==
X-Gm-Message-State: AKaTC03OcJO3RA8xguZHf8KwmCmyfbPhQI+rb6VJgnkXaF3boAHLtpzwsjWStxJNwllRrA==
X-Received: by 10.107.15.232 with SMTP id 101mr3412456iop.218.1479913707826;
	Wed, 23 Nov 2016 07:08:27 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	17sm11552624ioh.12.2016.11.23.07.08.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Nov 2016 07:08:26 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 10:08:29 -0500
Message-Id: <1479913709-20703-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] iscsi-initiator-utils: Update to 2.0.874
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
X-List-Received-Date: Wed, 23 Nov 2016 15:08:28 -0000

The latest iscsi-initiator-utils has been available for a while now,
update our recipe.  The new version no longer bundles its own ISNS server,
so this update brings in open-isns as a dependency.

Additionally, open-iscsi.org is defunct, the new home is at
open-iscsi.com, update the SRC_URI and homepage accordingly.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 ...nitiator-utils-Do-not-clean-kernel-source.patch |  44 ++++
 .../iscsi-initiator-utils-dont-use-static.patch    |  21 --
 ...text-add-include-for-NI_MAXHOST-definiton.patch |  35 +++
 .../iscsi-initiator-utils-use-var-for-config.patch | 240 ---------------------
 ...2.0-873.bb => iscsi-initiator-utils_2.0.874.bb} |  68 +++---
 .../recipes-support/open-isns/open-isns_0.97.bb    |  33 +++
 6 files changed, 151 insertions(+), 290 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-Do-not-clean-kernel-source.patch
 delete mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-dont-use-static.patch
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-fw_context-add-include-for-NI_MAXHOST-definiton.patch
 delete mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-use-var-for-config.patch
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.0-873.bb => iscsi-initiator-utils_2.0.874.bb} (65%)
 create mode 100644 meta-networking/recipes-support/open-isns/open-isns_0.97.bb

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-Do-not-clean-kernel-source.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-Do-not-clean-kernel-source.patch
new file mode 100644
index 0000000..2c46611
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-Do-not-clean-kernel-source.patch
@@ -0,0 +1,44 @@
+From 4ebab8add4a549c16ab8b124137546c0a7b46a9b Mon Sep 17 00:00:00 2001
+From: Joe MacDonald <joe_macdonald@mentor.com>
+Date: Tue, 15 Nov 2016 11:11:30 -0500
+Subject: [PATCH] Do not clean kernel source
+
+The default behaviour should not be to attempt to clean the kernel source
+tree when building userspace.  When not cross-compiling, however, this action is
+harmless, but when attempting to build within the sysroot and since this package
+is purely userspace, the clean step will fail.
+
+Removing the clean step eliminates an unnecessary dependency on the kernel build
+infrastructure.
+
+Upstream-status: Inappropriate (embedded specific)
+
+Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+---
+ Makefile | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index c8cd00e..9576bba 100644
+--- a/Makefile
++++ b/Makefile
+@@ -37,7 +37,7 @@ endif
+ 
+ all: user
+ 
+-user: iscsiuio/Makefile
++user:
+ 	$(MAKE) -C utils/sysdeps
+ 	$(MAKE) -C utils/fwparam_ibft
+ 	$(MAKE) -C usr
+@@ -75,7 +75,6 @@ clean:
+ 	$(MAKE) -C utils/fwparam_ibft clean
+ 	$(MAKE) -C utils clean
+ 	$(MAKE) -C usr clean
+-	$(MAKE) -C kernel clean
+ 	[ ! -f iscsiuio/Makefile ] || $(MAKE) -C iscsiuio clean
+ 	[ ! -f iscsiuio/Makefile ] || $(MAKE) -C iscsiuio distclean
+ 
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-dont-use-static.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-dont-use-static.patch
deleted file mode 100644
index ce48e2b..0000000
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-dont-use-static.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-iscsi-initiator-utils not to use static
-
-Upstream-status: Backport
-This patch is from fedora17.
-
-Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
-Signed-off-by: Vu Tran <vu.tran@windriver.com>
-
-diff --git a/usr/Makefile b/usr/Makefile
-index 673b7f1..fd14a10 100644
---- a/usr/Makefile
-+++ b/usr/Makefile
-@@ -61,7 +61,7 @@ iscsiadm: $(ISCSI_LIB_SRCS) $(DISCOVERY_SRCS) iscsiadm.o session_mgmt.o
- 
- iscsistart: $(ISCSI_LIB_SRCS) $(INITIATOR_SRCS) $(FW_BOOT_SRCS) \
- 		iscsistart.o statics.o
--	$(CC) $(CFLAGS) -static $^ -o $@
-+	$(CC) $(CFLAGS) $^ -o $@
- clean:
- 	rm -f *.o $(PROGRAMS) .depend $(LIBSYS)
- 
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-fw_context-add-include-for-NI_MAXHOST-definiton.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-fw_context-add-include-for-NI_MAXHOST-definiton.patch
new file mode 100644
index 0000000..37d695f
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-fw_context-add-include-for-NI_MAXHOST-definiton.patch
@@ -0,0 +1,35 @@
+From 79bea58a554205dd185509fbc4e76b5fc40f9038 Mon Sep 17 00:00:00 2001
+From: Joe MacDonald <joe_macdonald@mentor.com>
+Date: Tue, 15 Nov 2016 12:36:45 -0500
+Subject: [PATCH] fw_context: add include for NI_MAXHOST definiton
+
+This appears to build successfully with gcc 4.x but fails on gcc 5+, though it's
+not immediately clear why NI_MAXHOST isn't being defined from the include
+chain.  Currently engaging with the upstream devs to determine the best course
+of action, but this is an adequate workaround.
+
+Upstream-status: Pending
+
+Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+---
+ include/fw_context.h | 4 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/fw_context.h b/include/fw_context.h
+index 44053d8..0b05cea 100644
+--- a/include/fw_context.h
++++ b/include/fw_context.h
+@@ -21,6 +21,10 @@
+ #ifndef FWPARAM_CONTEXT_H_
+ #define FWPARAM_CONTEXT_H_
+ 
++#include <sys/socket.h>
++#ifndef NI_MAXHOST
++#define NI_MAXHOST 1025
++#endif
+ #include <netdb.h>
+ #include <net/if.h>
+ 
+-- 
+2.1.4
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-use-var-for-config.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-use-var-for-config.patch
deleted file mode 100644
index 50227a7..0000000
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator-utils-use-var-for-config.patch
+++ /dev/null
@@ -1,240 +0,0 @@
-iscsi-initiator-utils to use var for config
-
-Upstream-status: Backport
-This patch is from fedora.
-
-Use /var/lib/iscsi/ instead of /etc/iscsi/ for holding
-state files.
-
-Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
-Signed-off-by: Vu Tran <vu.tran@windriver.com>
-
-diff --git a/README b/README
-index 7364b2d..5e8bff8 100644
---- a/README
-+++ b/README
-@@ -164,10 +164,10 @@ available on all Linux installations.
- 
- The database contains two tables:
- 
--- Discovery table (/etc/iscsi/send_targets);
--- Node table (/etc/iscsi/nodes).
-+- Discovery table (/var/lib/iscsi/send_targets);
-+- Node table (/var/lib/iscsi/nodes).
- 
--The regular place for iSCSI database files: /etc/iscsi/nodes
-+The regular place for iSCSI database files: /var/lib/iscsi/nodes
- 
- The iscsiadm utility is a command-line tool to manage (update, delete,
- insert, query) the persistent database.
-@@ -444,7 +444,7 @@ a scsi_host per HBA port).
- To manage both types of initiator stacks, iscsiadm uses the interface (iface)
- structure. For each HBA port or for software iscsi for each network
- device (ethX) or NIC, that you wish to bind sessions to you must create
--a iface config /etc/iscsi/ifaces.
-+a iface config /var/lib/iscsi/ifaces.
- 
- Prep:
- 
-@@ -478,29 +478,29 @@ Running:
- iface0 qla4xxx,00:c0:dd:08:63:e8,20.15.0.7,default,iqn.2005-06.com.redhat:madmax
- iface1 qla4xxx,00:c0:dd:08:63:ea,20.15.0.9,default,iqn.2005-06.com.redhat:madmax
- 
--Will report iface configurations that are setup in /etc/iscsi/ifaces.
-+Will report iface configurations that are setup in /var/lib/iscsi/ifaces.
- The format is:
- 
- iface_name transport_name,hwaddress,ipaddress,net_ifacename,initiatorname
- 
- For software iscsi, you can create the iface configs by hand, but it is
- reccomended that you use iscsiadm's iface mode. There is a iface.example in
--/etc/iscsi/ifaces which can be used as a template for the daring.
-+/var/lib/iscsi/ifaces which can be used as a template for the daring.
- 
- For each network object you wish to bind a session to you must create
--a seperate iface config in /etc/iscsi/ifaces and each iface config file
-+a seperate iface config in /var/lib/iscsi/ifaces and each iface config file
- must have a unique name which is less than or equal to 64 characters.
- 
- Example:
- 
- If you have NIC1 with MAC address 00:0F:1F:92:6B:BF and NIC2 with
- MAC address 00:C0:DD:08:63:E7 and you wanted to do software iscsi over
--TCP/IP. Then in /etc/iscsi/ifaces/iface0 you would enter:
-+TCP/IP. Then in /var/lib/iscsi/ifaces/iface0 you would enter:
- 
- iface.transport_name = tcp
- iface.hwaddress = 00:0F:1F:92:6B:BF
- 
--and in /etc/iscsi/ifaces/iface1 you would enter:
-+and in /var/lib/iscsi/ifaces/iface1 you would enter:
- 
- iface.transport_name = tcp
- iface.hwaddress = 00:C0:DD:08:63:E7
-@@ -550,7 +550,7 @@ cxgb3i.00:07:43:05:97:07 cxgb3i,00:07:43:05:97:07,<empty>,<empty>,<empty>
- qla4xxx.00:0e:1e:04:8b:2e qla4xxx,00:0e:1e:04:8b:2e,<empty>,<empty>,<empty>
- 
- 
--Will report iface configurations that are setup in /etc/iscsi/ifaces.
-+Will report iface configurations that are setup in /var/lib/iscsi/ifaces.
- The format is:
- 
- iface_name transport_name,hwaddress,ipaddress,net_ifacename,initiatorname
-@@ -636,7 +636,7 @@ need a seperate network connection to the target for discovery purposes.
- *This will be fixed in the next version of open-iscsi*
- 
- For compatibility reasons, when you run iscsiadm to do discovery, it
--will check for interfaces in /etc/iscsi/iscsi/ifaces that are using
-+will check for interfaces in /var/lib/iscsi/iscsi/ifaces that are using
- tcp for the iface.transport and it will bind the portals that are discovered
- so that they will be logged in through those ifaces. This behavior can also
- be overriden by passing in the interfaces you want to use. For the case
-@@ -654,7 +654,7 @@ we do not bind a session to a iface, then you can use the special iface
- 
- iscsiadm -m discoverydb -t st -p ip:port -I default --discover -P 1
- 
--And if you did not define any interfaces in /etc/iscsi/ifaces and do
-+And if you did not define any interfaces in /var/lib/iscsi/ifaces and do
- not pass anything into iscsiadm, running iscsiadm will do the default
- behavior, where we allow the network subsystem to decide which
- device to use.
-@@ -696,7 +696,7 @@ To now log into targets it is the same as with sofware iscsi. See section
- 
- 	    ./iscsiadm -m discoverydb -t st -p 192.168.1.1:3260 --discover
- 
--	This will search /etc/iscsi/send_targets for a record with the
-+	This will search /var/lib/iscsi/send_targets for a record with the
- 	ID [portal = 192.168.1.1:3260 and type = sendtargets. If found it
- 	will perform discovery using the settings stored in the record.
- 	If a record does not exist, it will be created using the iscsid.conf
-@@ -705,7 +705,7 @@ To now log into targets it is the same as with sofware iscsi. See section
- 	The argument to -p may also be a hostname instead of an address.
- 	    ./iscsiadm -m discoverydb -t st -p smoehost --discover
- 
--	For the ifaces, iscsiadm will first search /etc/iscsi/ifaces for
-+	For the ifaces, iscsiadm will first search /var/lib/iscsi/ifaces for
- 	interfaces using software iscsi. If any are found then nodes found
- 	during discovery will be setup so that they can logged in through
- 	those interfaces. To specify a specific iface, pass the
-@@ -761,7 +761,7 @@ To now log into targets it is the same as with sofware iscsi. See section
- 	This command will perform discovery, but not manipulate the node DB.
- 
-   - SendTargets iSCSI Discovery with a specific interface. If you
--	wish to only use a subset of the interfaces in /etc/iscsi/ifaces
-+	wish to only use a subset of the interfaces in /var/lib/iscsi/ifaces
- 	then you can pass them in during discovery:
- 
- 	     ./iscsiadm -m discoverydb -t sendtargets -p 192.168.1.1:3260 \
-@@ -1072,8 +1072,8 @@ where targetname is the name of the target and ip_address:port is the address
- and port of the portal. tpgt, is the portal group tag of
- the portal, and is not used in iscsiadm commands except for static
- record creation. And iface name is the name of the iscsi interface
--defined in /etc/iscsi/ifaces. If no interface was defined in
--/etc/iscsi/ifaces or passed in, the default behavior is used.
-+defined in /var/lib/iscsi/ifaces. If no interface was defined in
-+/var/lib/iscsi/ifaces or passed in, the default behavior is used.
- Default here is iscsi_tcp/tcp to be used over which ever NIC the
- network layer decides is best.
- 
-@@ -1188,7 +1188,7 @@ If set, iscsid will perform discovery to the address every
- discovery.isns.discoveryd_poll_inval or
- discovery.sendtargets.discoveryd_poll_inval seconds,
- and it will log into any portals found from the discovery source using
--the ifaces in /etc/iscsi/ifaces.
-+the ifaces in /var/lib/iscsi/ifaces.
- 
- Note that for iSNS the poll_interval does not have to be set. If not set,
- iscsid will only perform rediscovery when it gets a SCN from the server.
-diff --git a/doc/iscsiadm.8 b/doc/iscsiadm.8
-index 7c209f6..e94cca0 100644
---- a/doc/iscsiadm.8
-+++ b/doc/iscsiadm.8
-@@ -89,7 +89,7 @@ This option is only valid for ping submode.
- .TP
- \fB\-I\fR, \fB\-\-interface=\fI[iface]\fR
- The interface argument specifies the iSCSI interface to use for the operation.
--iSCSI interfaces (iface) are defined in /etc/iscsi/ifaces. For hardware
-+iSCSI interfaces (iface) are defined in /var/lib/iscsi/ifaces. For hardware
- iSCSI (qla4xxx) the iface config must have the hardware address
- (iface.hwaddress = port's MAC address)
- and the driver/transport_name (iface.transport_name). The iface's name is
-@@ -166,7 +166,7 @@ If no other options are specified: for \fIdiscoverydb\fR and \fInode\fR, all
- of their respective records are displayed; for \fIsession\fR, all active
- sessions and connections are displayed; for \fIfw\fR, all boot firmware
- values are displayed; for \fIhost\fR, all iSCSI hosts are displayed; and
--for \fIiface\fR, all ifaces setup in /etc/iscsi/ifaces are displayed.
-+for \fIiface\fR, all ifaces setup in /var/lib/iscsi/ifaces are displayed.
- 
- .TP
- \fB\-n\fR, \fB\-\-name=\fIname\fR
-@@ -535,10 +535,10 @@ The configuration file read by \fBiscsid\fR and \fBiscsiadm\fR on startup.
- The file containing the iSCSI InitiatorName and InitiatorAlias read by
- \fBiscsid\fR and \fBiscsiadm\fR on startup.
- .TP
--/etc/iscsi/nodes/
-+/var/lib/iscsi/nodes/
- This directory contains the nodes with their targets.
- .TP
--/etc/iscsi/send_targets
-+/var/lib/iscsi/send_targets
- This directory contains the portals.
- 
- .SH "SEE ALSO"
-diff --git a/usr/idbm.c b/usr/idbm.c
-index 4d30aa9..316e54f 100644
---- a/usr/idbm.c
-+++ b/usr/idbm.c
-@@ -2468,9 +2468,9 @@ free_info:
- int idbm_init(idbm_get_config_file_fn *fn)
- {
- 	/* make sure root db dir is there */
--	if (access(ISCSI_CONFIG_ROOT, F_OK) != 0) {
--		if (mkdir(ISCSI_CONFIG_ROOT, 0660) != 0) {
--			log_error("Could not make %s %d\n", ISCSI_CONFIG_ROOT,
-+	if (access(ISCSIVAR, F_OK) != 0) {
-+		if (mkdir(ISCSIVAR, 0660) != 0) {
-+			log_error("Could not make %s %d\n", ISCSIVAR,
- 				   errno);
- 			return errno;
- 		}
-diff --git a/usr/idbm.h b/usr/idbm.h
-index 245f046..f45e86e 100644
---- a/usr/idbm.h
-+++ b/usr/idbm.h
-@@ -28,12 +28,16 @@
- #include "config.h"
- #include "list.h"
- 
--#define NODE_CONFIG_DIR		ISCSI_CONFIG_ROOT"nodes"
--#define SLP_CONFIG_DIR		ISCSI_CONFIG_ROOT"slp"
--#define ISNS_CONFIG_DIR		ISCSI_CONFIG_ROOT"isns"
--#define STATIC_CONFIG_DIR	ISCSI_CONFIG_ROOT"static"
--#define FW_CONFIG_DIR		ISCSI_CONFIG_ROOT"fw"
--#define ST_CONFIG_DIR		ISCSI_CONFIG_ROOT"send_targets"
-+#define ISCSIVAR			"/var/lib/iscsi/"
-+
-+#define NODE_CONFIG_DIR    ISCSIVAR"nodes"
-+#define SLP_CONFIG_DIR     ISCSIVAR"slp"
-+#define ISNS_CONFIG_DIR    ISCSIVAR"isns"
-+#define STATIC_CONFIG_DIR  ISCSIVAR"static"
-+#define FW_CONFIG_DIR      ISCSIVAR"fw"
-+#define ST_CONFIG_DIR      ISCSIVAR"send_targets"
-+
-+
- #define ST_CONFIG_NAME		"st_config"
- #define ISNS_CONFIG_NAME	"isns_config"
- 
-diff --git a/usr/iface.h b/usr/iface.h
-index 01f7074..2c6ef72 100644
---- a/usr/iface.h
-+++ b/usr/iface.h
-@@ -20,7 +20,8 @@
- #ifndef ISCSI_IFACE_H
- #define ISCSI_IFACE_H
- 
--#define IFACE_CONFIG_DIR	ISCSI_CONFIG_ROOT"ifaces"
-+#include "idbm.h"
-+#define IFACE_CONFIG_DIR	ISCSIVAR"ifaces"
- 
- struct iface_rec;
- struct list_head;
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb
similarity index 65%
rename from meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
rename to meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb
index 4b13155..c3ac5a8 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb
@@ -4,18 +4,18 @@ independent, multi-platform implementation of RFC3720. The iscsi package \
 provides the server daemon for the iSCSI protocol, as well as the utility \
 programs used to manage it. iSCSI is a protocol for distributed \
 disk access using SCSI commands sent over Internet Protocol networks."
-HOMEPAGE = "http://www.open-iscsi.org/"
+HOMEPAGE = "http://www.open-iscsi.com/"
 LICENSE = "GPLv2 & LGPLv2.1"
 SECTION = "net"
-DEPENDS = "openssl flex-native bison-native"
+DEPENDS = "openssl flex-native bison-native open-isns util-linux"
 
-LIC_FILES_CHKSUM = \
-        "file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-         file://utils/open-isns/COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
-SRC_URI = "http://www.open-iscsi.org/bits/open-iscsi-${PV}.tar.gz \
-           file://iscsi-initiator-utils-use-var-for-config.patch \
-           file://iscsi-initiator-utils-dont-use-static.patch \
+SRCREV ?= "8db9717e73d32d2c5131da4f9ad86dfd9065f74b"
+
+SRC_URI = "git://github.com/open-iscsi/open-iscsi \
+           file://iscsi-initiator-utils-Do-not-clean-kernel-source.patch \
+           file://iscsi-initiator-utils-fw_context-add-include-for-NI_MAXHOST-definiton.patch \
            file://initd.debian \
            file://99_iscsi-initiator-utils \
            file://iscsi-initiator \
@@ -23,33 +23,43 @@ SRC_URI = "http://www.open-iscsi.org/bits/open-iscsi-${PV}.tar.gz \
            file://iscsi-initiator-targets.service \
            file://set_initiatorname \
 "
-SRC_URI[md5sum] = "8b8316d7c9469149a6cc6234478347f7"
-SRC_URI[sha256sum] = "7dd9f2f97da417560349a8da44ea4fcfe98bfd5ef284240a2cc4ff8e88ac7cd9"
 
-S = "${WORKDIR}/open-iscsi-${PV}"
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
+
+inherit update-rc.d systemd autotools
+
+EXTRA_OECONF = " \
+    --target=${TARGET_SYS} \
+    --host=${BUILD_SYS} \
+    --prefix=${prefix} \
+    --libdir=${libdir} \
+"
 
-inherit update-rc.d systemd
+EXTRA_OEMAKE = ' \
+                CC="${CC}" \
+                AR="${AR}" \
+                RANLIB="${RANLIB}" \
+                CFLAGS="${CFLAGS} ${CPPFLAGS} -D_GNU_SOURCE -I. -I../include -I../../include -I../usr -I../../usr" \
+                LDFLAGS="${LDFLAGS}" \
+                LD="${LD}" \
+                OS="${TARGET_SYS}" \
+                TARGET="${TARGET_OS}" \
+                BASE="${prefix}" \
+                MANDIR="${mandir}" \
+'
 
 TARGET_CC_ARCH += "${LDFLAGS}"
+
 do_configure () {
-    #need to support cross-compiling in open-isns only
-    (cd utils/open-isns; gnu-configize; \
-     ./configure --host=${TARGET_SYS} --build=${BUILD_SYS} --with-security=no )
+    cd ${S}/iscsiuio ; autoreconf --install; ./configure ${EXTRA_OECONF}
 }
 
 do_compile () {
-    #make iscsistart one of PROGRAMS if install_user in do_install
-    #sed -i -e '/^PROGRAMS = /s;$; usr/iscsistart;' Makefile
-
-    #fix the ar used in open-isns
-    sed -i -e 's:ar cr :$(AR) cr :' ${S}/utils/open-isns/Makefile
-    oe_runmake user
+    oe_runmake -C ${S} ${EXTRA_OEMAKE} user
 }
 
 do_install () {
-    #completely override the install_user as bugs in Makefile
-    #oe_runmake DESTDIR="${D}" install_user
-
     #install necessary directories
     install -d ${D}${sbindir} \
         ${D}${sysconfdir}/init.d \
@@ -83,8 +93,8 @@ do_install () {
         install -m 0644 ${WORKDIR}/iscsi-initiator.service \
                         ${WORKDIR}/iscsi-initiator-targets.service \
                         ${D}${systemd_unitdir}/system/
-	install -d ${D}${nonarch_libdir}/iscsi
-	install -m 0755 ${WORKDIR}/set_initiatorname ${D}${nonarch_libdir}/iscsi
+        install -d ${D}${nonarch_libdir}/iscsi
+        install -m 0755 ${WORKDIR}/set_initiatorname ${D}${nonarch_libdir}/iscsi
     else
         install -d ${D}/etc/default/volatiles
         install -m 0644 ${WORKDIR}/99_iscsi-initiator-utils ${D}/etc/default/volatiles
@@ -93,11 +103,11 @@ do_install () {
 
 pkg_postinst_${PN}() {
     if [ "x$D" = "x" ]; then
-	if [ -e /etc/init.d/populate-volatile.sh ]; then
+        if [ -e /etc/init.d/populate-volatile.sh ]; then
             /etc/init.d/populate-volatile.sh update
-	elif command -v systemd-tmpfiles >/dev/null; then
+        elif command -v systemd-tmpfiles >/dev/null; then
             systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/iscsi.conf
-	fi
+        fi
     fi
 }
 
diff --git a/meta-networking/recipes-support/open-isns/open-isns_0.97.bb b/meta-networking/recipes-support/open-isns/open-isns_0.97.bb
new file mode 100644
index 0000000..fe41093
--- /dev/null
+++ b/meta-networking/recipes-support/open-isns/open-isns_0.97.bb
@@ -0,0 +1,33 @@
+# Copyright (C) 2016 Joe MacDonald <joe_macdonald@mentor.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "iSNS daemon and utility programs"
+DESCRIPTION = "This is a partial implementation of RFC4171, the Internet \
+Storage Name Service (iSNS).  The distribution includes the iSNS server, \
+supporting persisten storage of registrations, isnsadm, a command line \
+utility for managing nodes, and isnsdd, a corresponding discovery daemon."
+HOMEPAGE = "http://github.com/gonzoleeman/open-isns/"
+LICENSE = "GPLv2+ & LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=321bf41f280cf805086dd5a720b37785"
+SECTION = "net"
+
+DEPENDS = "openssl systemd"
+
+SRC_URI = " \
+           git://github.com/open-iscsi/open-isns \
+"
+
+SRCREV ?= "09954404e948e41eb0fce8e28836018b4ce3d20d"
+
+S = "${WORKDIR}/git"
+
+inherit systemd autotools-brokensep
+
+EXTRA_OECONF = " --prefix=${prefix} --enable-shared"
+
+do_install_append () {
+    oe_runmake -C ${B} INCDIR=${STAGING_INCDIR}/libisns/ install_hdrs
+    oe_runmake -C ${B} LIBDIR=${D}${libdir} install_lib
+}
+
+FILES_${PN} += "${libdir}"
-- 
1.9.1


