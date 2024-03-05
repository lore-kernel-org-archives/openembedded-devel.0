Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4235C48BF6
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 02:10:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12125.1709604592407007059
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Mar 2024 18:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=omthAqQK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=37941debd1=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 424CCNGH009345
	for <openembedded-devel@lists.openembedded.org>; Tue, 5 Mar 2024 02:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=d5lA/
	gBt9QVbt/cuZ+6QERndcp5M6HBCj5eyTGvJwHg=; b=omthAqQKO5bByGLmnCKcH
	tIqBgBMYbJlG2o+rINYKoiTvD/RSH0sFn+NDEfgin08aQ9oyQbpTA9TOkbXEJvrd
	PlJWZ6FIl2UxaYkcUa8POiFRJEJzGOb8KsbU2JuAP158nCgQZGd6BgL6hmByFAct
	3HJerwHkgMgWTOSpR9Y5iii3zmWEJ0dDsAOyTaV5I1vRrd/B+boA88Xb4cn8slkX
	/AOPSjhMVhqxdvWKUqLq/ecW1Pg3PC8xzGKOrtpfrO5DDbXVFVtGpAp/qVoxsxvS
	FgOVb1R7ocbcsF4xkPhEjFm234bhsNcMfm36v19aaVx/v19LmsgivHl18Mq/xlMt
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wku36aajs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 02:09:50 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 18:09:49 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 18:09:48 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] multipath-tools: upgrade 0.9.3 -> 0.9.8
Date: Tue, 5 Mar 2024 10:09:47 +0800
Message-ID: <20240305020947.2357051-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: YOZ8pAnk9zCdQV3kxM4X43OGgka7hAsu
X-Proofpoint-GUID: YOZ8pAnk9zCdQV3kxM4X43OGgka7hAsu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-04_20,2024-03-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403050014
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 02:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109108

From: Changqing Li <changqing.li@windriver.com>

Drop following patches since already include in 0.9.8:
0031-Always-use-devmapper-for-kpartx.patch
0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch

Refresh other patches

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-RH-fixup-udev-rules-for-redhat.patch | 74 ++++++++++++++++++
 ...roperty-blacklist-exception-builtin.patch} | 39 ++++++----
 ...H-don-t-start-without-a-config-file.patch} | 54 +++++++------
 .../0004-RH-use-rpm-optflags-if-present.patch | 55 +++++++++++++
 ...conf.patch => 0005-RH-add-mpathconf.patch} | 68 ++++++++--------
 ...m-kernel-cmdline-mpath.wwids-with-A.patch} | 23 ++----
 ...on-invalid-regex-instead-of-failing.patch} | 36 ++++-----
 ...default-find_mutipaths-value-to-off.patch} | 16 ++--
 ...modify-create-config.mk-for-cross-co.patch | 40 ++++++++++
 ...0-Subject-PATCH-Always-use-devmapper.patch | 72 +++++++++++++++++
 ...ix-bug-of-do_compile-and-do_install.patch} | 12 ++-
 ...dd-explicit-dependency-on-libraries.patch} | 10 +--
 .../0021-RH-fixup-udev-rules-for-redhat.patch | 76 ------------------
 .../0024-RH-use-rpm-optflags-if-present.patch | 74 ------------------
 ...modify-Makefile.inc-for-cross-compil.patch | 59 --------------
 .../files/0030-Always-use-devmapper.patch     | 77 -------------------
 ...0031-Always-use-devmapper-for-kpartx.patch | 45 -----------
 ...-replace-perl-with-sed-in-install-ta.patch | 44 -----------
 ...ools_0.9.3.bb => multipath-tools_0.9.8.bb} | 29 ++++---
 19 files changed, 377 insertions(+), 526 deletions(-)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-RH-fixup-udev-rules-for-redhat.patch
 rename meta-oe/recipes-support/multipath-tools/files/{0022-RH-Remove-the-property-blacklist-exception-builtin.patch => 0002-RH-Remove-the-property-blacklist-exception-builtin.patch} (61%)
 rename meta-oe/recipes-support/multipath-tools/files/{0023-RH-don-t-start-without-a-config-file.patch => 0003-RH-don-t-start-without-a-config-file.patch} (72%)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0004-RH-use-rpm-optflags-if-present.patch
 rename meta-oe/recipes-support/multipath-tools/files/{0025-RH-add-mpathconf.patch => 0005-RH-add-mpathconf.patch} (90%)
 rename meta-oe/recipes-support/multipath-tools/files/{0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch => 0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch} (86%)
 rename meta-oe/recipes-support/multipath-tools/files/{0027-RH-warn-on-invalid-regex-instead-of-failing.patch => 0007-RH-warn-on-invalid-regex-instead-of-failing.patch} (76%)
 rename meta-oe/recipes-support/multipath-tools/files/{0028-RH-reset-default-find_mutipaths-value-to-off.patch => 0008-RH-reset-default-find_mutipaths-value-to-off.patch} (70%)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0009-multipath-tools-modify-create-config.mk-for-cross-co.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0010-Subject-PATCH-Always-use-devmapper.patch
 rename meta-oe/recipes-support/multipath-tools/files/{0001-fix-bug-of-do_compile-and-do_install.patch => 0011-fix-bug-of-do_compile-and-do_install.patch} (80%)
 rename meta-oe/recipes-support/multipath-tools/files/{0001-add-explicit-dependency-on-libraries.patch => 0012-add-explicit-dependency-on-libraries.patch} (83%)
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0021-RH-fixup-udev-rules-for-redhat.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0024-RH-use-rpm-optflags-if-present.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0030-Always-use-devmapper.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0031-Always-use-devmapper-for-kpartx.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch
 rename meta-oe/recipes-support/multipath-tools/{multipath-tools_0.9.3.bb => multipath-tools_0.9.8.bb} (80%)

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-RH-fixup-udev-rules-for-redhat.patch b/meta-oe/recipes-support/multipath-tools/files/0001-RH-fixup-udev-rules-for-redhat.patch
new file mode 100644
index 000000000..0ec5b5b1c
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-RH-fixup-udev-rules-for-redhat.patch
@@ -0,0 +1,74 @@
+From 1e1ba9ecc16895bf472eae345d44631b65629611 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Thu, 13 Apr 2017 07:22:23 -0500
+Subject: [PATCH 01/12] RH: fixup udev rules for redhat
+
+The multipath rules need to run after scsi_id is run. This means moving
+them after 60-persistent-storage.rules for redhat. Redhat also uses a
+different naming scheme for partitions than SuSE. Also, there are some
+false warnings that gcc throws because of the changed options. Fix these
+too.
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+
+[OP: Rebase to 0.9.3]
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+
+Rebase to 0.9.8
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Makefile.inc        | 2 +-
+ kpartx/kpartx.rules | 2 +-
+ multipath/Makefile  | 4 ++--
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.inc b/Makefile.inc
+index 5668e638..de89b21f 100644
+--- a/Makefile.inc
++++ b/Makefile.inc
+@@ -59,7 +59,7 @@ tmpfilesdir	:= $(systemd_prefix)lib/tmpfiles.d
+ modulesloaddir	:= $(systemd_prefix)lib/modules-load.d
+ libudevdir	:= $(systemd_prefix)lib/udev
+ udevrulesdir	:= $(libudevdir)/rules.d
+-bindir		:= $(exec_prefix)sbin
++bindir		:= $(exec_prefix)/usr/sbin
+ mandir		:= $(usr_prefix)share/man
+ LIB		:= $(if $(shell test -d /lib64 && echo 1),lib64,lib)
+ syslibdir	:= $(prefix)$(LIB)
+diff --git a/kpartx/kpartx.rules b/kpartx/kpartx.rules
+index 1969dee0..d2b28233 100644
+--- a/kpartx/kpartx.rules
++++ b/kpartx/kpartx.rules
+@@ -39,6 +39,6 @@ LABEL="mpath_kpartx_end"
+ GOTO="kpartx_end"
+ 
+ LABEL="run_kpartx"
+-RUN+="/sbin/kpartx -un -p -part /dev/$name"
++RUN+="/sbin/kpartx -un /dev/$name"
+ 
+ LABEL="kpartx_end"
+diff --git a/multipath/Makefile b/multipath/Makefile
+index 67fb5e62..2ea9e528 100644
+--- a/multipath/Makefile
++++ b/multipath/Makefile
+@@ -27,7 +27,7 @@ install:
+ 	$(Q)$(INSTALL_PROGRAM) -d $(DESTDIR)$(udevrulesdir)
+ 	$(Q)$(INSTALL_PROGRAM) -m 644 11-dm-mpath.rules $(DESTDIR)$(udevrulesdir)
+ 	$(Q)$(INSTALL_PROGRAM) -m 644 99-z-dm-mpath-late.rules $(DESTDIR)$(udevrulesdir)
+-	$(Q)$(INSTALL_PROGRAM) -m 644 multipath.rules $(DESTDIR)$(udevrulesdir)/56-multipath.rules
++	$(Q)$(INSTALL_PROGRAM) -m 644 multipath.rules $(DESTDIR)$(udevrulesdir)/62-multipath.rules
+ 	$(Q)$(INSTALL_PROGRAM) -d $(DESTDIR)$(tmpfilesdir)
+ 	$(Q)$(INSTALL_PROGRAM) -m 644 tmpfiles.conf $(DESTDIR)$(tmpfilesdir)/multipath.conf
+ 	$(Q)$(INSTALL_PROGRAM) -d $(DESTDIR)$(mandir)/man8
+@@ -50,7 +50,7 @@ uninstall:
+ 	$(Q)$(RM) $(DESTDIR)$(udevrulesdir)/99-z-dm-mpath-late.rules
+ 	$(Q)$(RM) $(DESTDIR)$(modulesloaddir)/multipath.conf
+ 	$(Q)$(RM) $(DESTDIR)$(modulesloaddir)/scsi_dh.conf
+-	$(Q)$(RM) $(DESTDIR)$(libudevdir)/rules.d/56-multipath.rules
++	$(Q)$(RM) $(DESTDIR)$(libudevdir)/rules.d/62-multipath.rules
+ 	$(Q)$(RM) $(DESTDIR)$(mandir)/man8/$(EXEC).8
+ 	$(Q)$(RM) $(DESTDIR)$(mandir)/man5/$(EXEC).conf.5
+ 	$(Q)$(RM) $(DESTDIR)$(tmpfilesdir)/multipath.conf
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch b/meta-oe/recipes-support/multipath-tools/files/0002-RH-Remove-the-property-blacklist-exception-builtin.patch
similarity index 61%
rename from meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch
rename to meta-oe/recipes-support/multipath-tools/files/0002-RH-Remove-the-property-blacklist-exception-builtin.patch
index c15444a85..a24c827dc 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0002-RH-Remove-the-property-blacklist-exception-builtin.patch
@@ -1,7 +1,7 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17
-00:00:00 2001 From:Benjamin Marzinski <bmarzins@redhat.com> Date: Wed, 2 Jul
-2014 12:49:53 -0500 Subject: [PATCH] RH: Remove the property blacklist
-exception builtin
+From bb6db01cc19940bb5162c1cc0c9b5f8e4c209822 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 1 Mar 2024 10:34:06 +0800
+Subject: [PATCH 02/12] RH: Remove the property blacklist exception builtin
 
 Multipath set the default property blacklist exceptions to
 (ID_SCSI_VPD|ID_WWN).  This has the effect of blacklisting some internal
@@ -15,31 +15,36 @@ Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
 
 Upsteam-Status: Pending
 
-Update patch to 0.8.2
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
 [OP: Rebase to 0.9.3]
 Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
-Upstream-Status: Pending
 
- libmultipath/blacklist.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
+Rebase to 0.9.8
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libmultipath/blacklist.c | 16 +++++-----------
+ 1 file changed, 5 insertions(+), 11 deletions(-)
 
 diff --git a/libmultipath/blacklist.c b/libmultipath/blacklist.c
-index 8d15d2ea..820b0d68 100644
+index 75100b20..4fdaca76 100644
 --- a/libmultipath/blacklist.c
 +++ b/libmultipath/blacklist.c
-@@ -198,9 +198,6 @@ setup_default_blist (struct config * conf)
+@@ -221,15 +221,6 @@ setup_default_blist (struct config * conf)
  	struct hwentry *hwe;
  	int i;
  
--	if (store_ble(conf->blist_devnode, "!^(sd[a-z]|dasd[a-z]|nvme[0-9])", ORIGIN_DEFAULT))
--		return 1;
--
+-	if (nvme_multipath_enabled()) {
+-		if (store_ble(conf->blist_devnode, "!^(sd[a-z]|dasd[a-z])",
+-			      ORIGIN_DEFAULT))
+-			return 1;
+-	} else {
+-		if (store_ble(conf->blist_devnode, "!^(sd[a-z]|dasd[a-z]|nvme[0-9])",
+-			      ORIGIN_DEFAULT))
+-			return 1;
+-	}
  	if (store_ble(conf->elist_property, "(SCSI_IDENT_|ID_WWN)", ORIGIN_DEFAULT))
  		return 1;
  
-@@ -435,8 +432,11 @@ filter_property(const struct config *conf, struct udev_device *udev,
+@@ -464,8 +455,11 @@ filter_property(const struct config *conf, struct udev_device *udev,
  			r = MATCH_NOTHING;
  	}
  
@@ -54,5 +59,5 @@ index 8d15d2ea..820b0d68 100644
  
  static void free_ble(struct blentry *ble)
 -- 
-2.38.1
+2.25.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0023-RH-don-t-start-without-a-config-file.patch b/meta-oe/recipes-support/multipath-tools/files/0003-RH-don-t-start-without-a-config-file.patch
similarity index 72%
rename from meta-oe/recipes-support/multipath-tools/files/0023-RH-don-t-start-without-a-config-file.patch
rename to meta-oe/recipes-support/multipath-tools/files/0003-RH-don-t-start-without-a-config-file.patch
index 840b00093..54b3bdc86 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0023-RH-don-t-start-without-a-config-file.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0003-RH-don-t-start-without-a-config-file.patch
@@ -1,10 +1,7 @@
-From 056fdaece0f1a3a5ca92e8c08912730faa89875d Mon Sep 17 00:00:00 2001
+From de8ee3480ec7479ed014c197a9d747403f6e0237 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 23 Nov 2018 17:25:15 +0800
-Subject: [PATCH] From 0000000000000000000000000000000000000000 Mon Sep 17
- 00:00:00 2001 From: Benjamin Marzinski <bmarzins@redhat.com> Date: Wed, 15
- Oct 2014 10:39:30 -0500 Subject: [PATCH] RH: don't start without a config
- file
+Subject: [PATCH 03/12] RH: don't start without a config file
 
 If /etc/multipath.conf doesn't exist, don't start multipathd and blacklist
 all devices when running multipath.  A completely blank configuration file
@@ -17,20 +14,21 @@ Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
 
 Upstream-Status: Pending
 
-update this patch to new version
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
 [OP: Rebase to 0.9.3]
 Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+
+Rebase to 0.9.8
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- libmultipath/config.c         | 18 ++++++++++++++++++
- libmultipath/config.h         |  1 +
- multipath/multipath.rules.in  |  1 +
- multipathd/multipathd.8       |  2 ++
- multipathd/multipathd.service |  1 +
+ libmultipath/config.c            | 18 ++++++++++++++++++
+ libmultipath/config.h            |  1 +
+ multipath/multipath.rules.in     |  1 +
+ multipathd/multipathd.8.in       |  2 ++
+ multipathd/multipathd.service.in |  1 +
  5 files changed, 23 insertions(+)
 
 diff --git a/libmultipath/config.c b/libmultipath/config.c
-index 5c5c0726..31894810 100644
+index 83fa7369..8a3a8f37 100644
 --- a/libmultipath/config.c
 +++ b/libmultipath/config.c
 @@ -26,6 +26,7 @@
@@ -41,7 +39,7 @@ index 5c5c0726..31894810 100644
  
  /*
   * We don't support re-initialization after
-@@ -966,6 +967,23 @@ int _init_config (const char *file, struct config *conf)
+@@ -959,6 +960,23 @@ int _init_config (const char *file, struct config *conf)
  		}
  		factorize_hwtable(conf->hwtable, builtin_hwtable_size, file);
  		validate_pctable(conf->overrides, 0, file);
@@ -66,7 +64,7 @@ index 5c5c0726..31894810 100644
  
  	conf->processed_main_config = 1;
 diff --git a/libmultipath/config.h b/libmultipath/config.h
-index 87947469..0dc89c16 100644
+index 384193ab..158cebf0 100644
 --- a/libmultipath/config.h
 +++ b/libmultipath/config.h
 @@ -10,6 +10,7 @@
@@ -78,7 +76,7 @@ index 87947469..0dc89c16 100644
  enum devtypes {
  	DEV_NONE,
 diff --git a/multipath/multipath.rules.in b/multipath/multipath.rules.in
-index 8d3cf33a..5c4447a2 100644
+index 780bf852..2c518378 100644
 --- a/multipath/multipath.rules.in
 +++ b/multipath/multipath.rules.in
 @@ -9,6 +9,7 @@ IMPORT{cmdline}="nompath"
@@ -89,11 +87,11 @@ index 8d3cf33a..5c4447a2 100644
  
  ENV{DEVTYPE}!="partition", GOTO="test_dev"
  IMPORT{parent}="DM_MULTIPATH_DEVICE_PATH"
-diff --git a/multipathd/multipathd.8 b/multipathd/multipathd.8
-index bdf102eb..a16a0bd5 100644
---- a/multipathd/multipathd.8
-+++ b/multipathd/multipathd.8
-@@ -48,6 +48,8 @@ map regains its maximum performance and redundancy.
+diff --git a/multipathd/multipathd.8.in b/multipathd/multipathd.8.in
+index f1cab3ff..5ae21db1 100644
+--- a/multipathd/multipathd.8.in
++++ b/multipathd/multipathd.8.in
+@@ -49,6 +49,8 @@ map regains its maximum performance and redundancy.
  With the \fB-k\fR option, \fBmultipathd\fR acts as a client utility that
  sends commands to a running instance of the multipathd daemon (see
  \fBCOMMANDS\fR below).
@@ -102,18 +100,18 @@ index bdf102eb..a16a0bd5 100644
  .
  .
  .\" ----------------------------------------------------------------------------
-diff --git a/multipathd/multipathd.service b/multipathd/multipathd.service
-index aec62dbb..ab7585de 100644
---- a/multipathd/multipathd.service
-+++ b/multipathd/multipathd.service
+diff --git a/multipathd/multipathd.service.in b/multipathd/multipathd.service.in
+index 6d03ff71..0cd85102 100644
+--- a/multipathd/multipathd.service.in
++++ b/multipathd/multipathd.service.in
 @@ -5,6 +5,7 @@ Before=local-fs-pre.target blk-availability.service shutdown.target
- Wants=systemd-udevd-kernel.socket
- After=systemd-udevd-kernel.socket
+ Wants=systemd-udevd-kernel.socket @MODPROBE_UNIT@
+ After=systemd-udevd-kernel.socket @MODPROBE_UNIT@
  After=multipathd.socket systemd-remount-fs.service
 +ConditionPathExists=/etc/multipath.conf
  Before=initrd-cleanup.service
  DefaultDependencies=no
  Conflicts=shutdown.target
 -- 
-2.38.1
+2.25.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0004-RH-use-rpm-optflags-if-present.patch b/meta-oe/recipes-support/multipath-tools/files/0004-RH-use-rpm-optflags-if-present.patch
new file mode 100644
index 000000000..91477a44c
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0004-RH-use-rpm-optflags-if-present.patch
@@ -0,0 +1,55 @@
+From f1b74f21875d6d9f0a5ac3d67df40a28b167052a Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 26 Nov 2018 09:19:17 +0800
+Subject: [PATCH 04/12] RH: use rpm optflags if present
+
+Use the passed in optflags when compiling as an RPM, and keep the
+default flags as close as possible to the current fedora flags, while
+still being generic.
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+
+Upstream-Status: Pending
+
+[OP: Rebase to 0.9.3]
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+
+Rebase to 0.9.8
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Makefile.inc | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.inc b/Makefile.inc
+index de89b21f..6ac632ff 100644
+--- a/Makefile.inc
++++ b/Makefile.inc
+@@ -95,7 +95,15 @@ SYSTEMD_LIBDEPS := $(if $(SYSTEMD),$(if $(shell test $(SYSTEMD) -gt 209 && echo
+ MODPROBE_UNIT := $(shell test "0$(SYSTEMD)" -lt 245 2>/dev/null || \
+ 			echo "modprobe@dm_multipath.service")
+ 
+-OPTFLAGS	:= -O2 -g $(STACKPROT) --param=ssp-buffer-size=4
++ifndef RPM_OPT_FLAGS
++	OPTFLAGS	:= -O2 -g $(STACKPROT) --param=ssp-buffer-size=4
++else
++	OPTFLAGS = $(RPM_OPT_FLAGS)
++endif
++OPTFLAGS       += -Wextra -Wstrict-prototypes -Wformat=0 -Werror=implicit-int \
++                  -Werror=implicit-function-declaration -Wno-sign-compare \
++                  -Wno-unused-parameter -Werror=cast-qual \
++                  -Werror=discarded-qualifiers
+ WARNFLAGS	:= -Werror -Wall -Wextra -Wformat=2 $(WFORMATOVERFLOW) -Werror=implicit-int \
+ 		  -Werror=implicit-function-declaration -Werror=format-security \
+ 		  $(WNOCLOBBERED) -Werror=cast-qual $(ERROR_DISCARDED_QUALIFIERS) $(W_URCU_TYPE_LIMITS)
+@@ -105,7 +113,7 @@ CPPFLAGS	:= $(FORTIFY_OPT) $(CPPFLAGS) $(D_URCU_VERSION) \
+ 		   -DRUNTIME_DIR=\"$(runtimedir)\" -DCONFIG_DIR=\"$(configdir)\" \
+ 		   -DDEFAULT_CONFIGFILE=\"$(configfile)\" -DSTATE_DIR=\"$(statedir)\" \
+ 		   -DEXTRAVERSION=\"$(EXTRAVERSION)\" -MMD -MP
+-CFLAGS		:= -std=gnu99 $(CFLAGS) $(OPTFLAGS) $(WARNFLAGS) -pipe
++CFLAGS		:= -std=gnu99 $(CFLAGS) $(OPTFLAGS) -pipe
+ BIN_CFLAGS	:= -fPIE -DPIE
+ LIB_CFLAGS	:= -fPIC
+ SHARED_FLAGS	:= -shared
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0025-RH-add-mpathconf.patch b/meta-oe/recipes-support/multipath-tools/files/0005-RH-add-mpathconf.patch
similarity index 90%
rename from meta-oe/recipes-support/multipath-tools/files/0025-RH-add-mpathconf.patch
rename to meta-oe/recipes-support/multipath-tools/files/0005-RH-add-mpathconf.patch
index 471ff0932..c6089612b 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0025-RH-add-mpathconf.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0005-RH-add-mpathconf.patch
@@ -1,9 +1,7 @@
-From b0b4cca566e3e0c3a232b3754555c41d4e0c1273 Mon Sep 17 00:00:00 2001
+From 8f52504859704466667e042baf437c2b6272ffb9 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 26 Nov 2018 09:55:12 +0800
-Subject: [PATCH] From 0000000000000000000000000000000000000000 Mon Sep 17
- 00:00:00 2001 From: Benjamin Marzinski <bmarzins@redhat.com> Date: Thu, 16
- Oct 2014 15:49:01 -0500 Subject: [PATCH] RH: add mpathconf
+Subject: [PATCH 05/12] RH: add mpathconf
 
 mpathconf is a program (largely based on lvmcomf) to help users
 configure /etc/multipath.conf and enable or disable multipathing.  It
@@ -16,11 +14,11 @@ Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
 
 Upstream-Status: Pending
 
-update this patch to new version
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
 [OP: Rebase to 0.9.3]
 Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+
+Rebase to 0.9.8
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  libmultipath/config.c |   1 +
  multipath/Makefile    |   4 +
@@ -31,10 +29,10 @@ Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
  create mode 100644 multipath/mpathconf.8
 
 diff --git a/libmultipath/config.c b/libmultipath/config.c
-index 31894810..af59dd3c 100644
+index 8a3a8f37..a40b41ab 100644
 --- a/libmultipath/config.c
 +++ b/libmultipath/config.c
-@@ -969,6 +969,7 @@ int _init_config (const char *file, struct config *conf)
+@@ -962,6 +962,7 @@ int _init_config (const char *file, struct config *conf)
  		validate_pctable(conf->overrides, 0, file);
  	} else {
  		condlog(0, "/etc/multipath.conf does not exist, blacklisting all devices.");
@@ -43,36 +41,36 @@ index 31894810..af59dd3c 100644
  			conf->blist_devnode = vector_alloc();
  			if (!conf->blist_devnode) {
 diff --git a/multipath/Makefile b/multipath/Makefile
-index 8482de6a..780b1b73 100644
+index 2ea9e528..6b1fa09e 100644
 --- a/multipath/Makefile
 +++ b/multipath/Makefile
-@@ -21,6 +21,7 @@ $(EXEC): $(OBJS) $(multipathdir)/libmultipath.so $(mpathcmddir)/libmpathcmd.so
+@@ -24,6 +24,7 @@ $(EXEC): $(OBJS) $(multipathdir)/libmultipath.so $(mpathcmddir)/libmpathcmd.so
  install:
- 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(bindir)
- 	$(INSTALL_PROGRAM) -m 755 $(EXEC) $(DESTDIR)$(bindir)/
-+	$(INSTALL_PROGRAM) -m 755 mpathconf $(DESTDIR)$(bindir)/
- 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(udevrulesdir)
- 	$(INSTALL_PROGRAM) -m 644 11-dm-mpath.rules $(DESTDIR)$(udevrulesdir)
- 	$(INSTALL_PROGRAM) -m 644 multipath.rules $(DESTDIR)$(udevrulesdir)/62-multipath.rules
-@@ -32,6 +33,7 @@ install:
- 	$(INSTALL_PROGRAM) -m 644 $(EXEC).8 $(DESTDIR)$(man8dir)
- 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(man5dir)
- 	$(INSTALL_PROGRAM) -m 644 $(EXEC).conf.5 $(DESTDIR)$(man5dir)
-+	$(INSTALL_PROGRAM) -m 644 mpathconf.8 $(DESTDIR)$(man8dir)
- ifneq ($(SCSI_DH_MODULES_PRELOAD),)
- 	$(INSTALL_PROGRAM) -m 644 scsi_dh.conf $(DESTDIR)$(modulesloaddir)/scsi_dh.conf
- 	for _x in $(SCSI_DH_MODULES_PRELOAD); do echo "$$_x"; done \
-@@ -44,8 +46,10 @@ uninstall:
- 	$(RM) $(DESTDIR)$(modulesloaddir)/multipath.conf
- 	$(RM) $(DESTDIR)$(modulesloaddir)/scsi_dh.conf
- 	$(RM) $(DESTDIR)$(libudevdir)/rules.d/62-multipath.rules
-+	$(RM) $(DESTDIR)$(bindir)/mpathconf
- 	$(RM) $(DESTDIR)$(man8dir)/$(EXEC).8
- 	$(RM) $(DESTDIR)$(man5dir)/$(EXEC).conf.5
-+	$(RM) $(DESTDIR)$(man8dir)/mpathconf.8
+ 	$(Q)$(INSTALL_PROGRAM) -d $(DESTDIR)$(bindir)
+ 	$(Q)$(INSTALL_PROGRAM) -m 755 $(EXEC) $(DESTDIR)$(bindir)/
++	$(Q)$(INSTALL_PROGRAM) -m 755 mpathconf $(DESTDIR)$(bindir)/
+ 	$(Q)$(INSTALL_PROGRAM) -d $(DESTDIR)$(udevrulesdir)
+ 	$(Q)$(INSTALL_PROGRAM) -m 644 11-dm-mpath.rules $(DESTDIR)$(udevrulesdir)
+ 	$(Q)$(INSTALL_PROGRAM) -m 644 99-z-dm-mpath-late.rules $(DESTDIR)$(udevrulesdir)
+@@ -34,6 +35,7 @@ install:
+ 	$(Q)$(INSTALL_PROGRAM) -m 644 $(EXEC).8 $(DESTDIR)$(mandir)/man8
+ 	$(Q)$(INSTALL_PROGRAM) -d $(DESTDIR)$(mandir)/man5
+ 	$(Q)$(INSTALL_PROGRAM) -m 644 $(EXEC).conf.5 $(DESTDIR)$(mandir)/man5
++	$(Q)$(INSTALL_PROGRAM) -m 644 mpathconf.8 $(DESTDIR)$(mandir)/man8
+ 	$(Q)$(INSTALL_PROGRAM) -d $(DESTDIR)$(modulesloaddir)
+ ifeq ($(MODPROBE_UNIT),)
+ 	$(Q)$(INSTALL_PROGRAM) -m 644 modules-load.conf $(DESTDIR)$(modulesloaddir)/multipath.conf
+@@ -51,8 +53,10 @@ uninstall:
+ 	$(Q)$(RM) $(DESTDIR)$(modulesloaddir)/multipath.conf
+ 	$(Q)$(RM) $(DESTDIR)$(modulesloaddir)/scsi_dh.conf
+ 	$(Q)$(RM) $(DESTDIR)$(libudevdir)/rules.d/62-multipath.rules
++	$(Q)$(RM) $(DESTDIR)$(bindir)/mpathconf
+ 	$(Q)$(RM) $(DESTDIR)$(mandir)/man8/$(EXEC).8
+ 	$(Q)$(RM) $(DESTDIR)$(mandir)/man5/$(EXEC).conf.5
++	$(Q)$(RM) $(DESTDIR)$(mandir)/man8/mpathconf.8
+ 	$(Q)$(RM) $(DESTDIR)$(tmpfilesdir)/multipath.conf
  
  clean: dep_clean
- 	$(RM) core *.o $(EXEC) multipath.rules tmpfiles.conf
 diff --git a/multipath/mpathconf b/multipath/mpathconf
 new file mode 100644
 index 00000000..e8391347
@@ -651,5 +649,5 @@ index 00000000..4cd32672
 +.SH AUTHOR
 +Benjamin Marzinski <bmarzins@redhat.com>
 -- 
-2.38.1
+2.25.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch b/meta-oe/recipes-support/multipath-tools/files/0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
similarity index 86%
rename from meta-oe/recipes-support/multipath-tools/files/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
rename to meta-oe/recipes-support/multipath-tools/files/0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
index 17c36e86c..8df7de3b4 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
@@ -1,14 +1,7 @@
-From 262de33671ede81e424344ea9125d9e546cf8612 Mon Sep 17 00:00:00 2001
+From f93248d8e3598ccdc42b6d639107917c9cda268c Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 26 Sep 2019 16:29:48 +0800
-Subject: [PATCH] From 0000000000000000000000000000000000000000 Mon Sep
-
-17
- 00:00:00 2001 From: Benjamin Marzinski <bmarzins@redhat.com> Date: Fri,
-17
- Oct 2014 11:20:34 -0500 Subject: [PATCH] RH: add wwids from kernel
-cmdline
- mpath.wwids with -A
+Subject: [PATCH 06/12] RH: add wwids from kernel cmdline mpath.wwids with -A
 
 This patch adds another option to multipath, "-A", which reads
 /proc/cmdline for mpath.wwid=<WWID> options, and adds any wwids it finds
@@ -23,21 +16,21 @@ Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
 
 Upstream-Status: Pending
 
-Update this patch to new version 0.8.2
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
 [OP: Rebase to 0.9.3]
 Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+
+Rebase to 0.9.8
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  libmultipath/wwids.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
  libmultipath/wwids.h |  1 +
  2 files changed, 45 insertions(+)
 
 diff --git a/libmultipath/wwids.c b/libmultipath/wwids.c
-index 89bb60ca..bab9aa85 100644
+index 591cd09b..b01f1b85 100644
 --- a/libmultipath/wwids.c
 +++ b/libmultipath/wwids.c
-@@ -451,3 +451,47 @@ int unmark_failed_wwid(const char *wwid)
+@@ -439,3 +439,47 @@ int unmark_failed_wwid(const char *wwid)
  	print_failed_wwid_result("unmark_failed", wwid, r);
  	return r;
  }
@@ -98,5 +91,5 @@ index 0c6ee54d..e32a0b0e 100644
  enum {
  	WWID_IS_NOT_FAILED = 0,
 -- 
-2.38.1
+2.25.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0027-RH-warn-on-invalid-regex-instead-of-failing.patch b/meta-oe/recipes-support/multipath-tools/files/0007-RH-warn-on-invalid-regex-instead-of-failing.patch
similarity index 76%
rename from meta-oe/recipes-support/multipath-tools/files/0027-RH-warn-on-invalid-regex-instead-of-failing.patch
rename to meta-oe/recipes-support/multipath-tools/files/0007-RH-warn-on-invalid-regex-instead-of-failing.patch
index 22cb4beeb..c64b8aeab 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0027-RH-warn-on-invalid-regex-instead-of-failing.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0007-RH-warn-on-invalid-regex-instead-of-failing.patch
@@ -1,7 +1,7 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17
-00:00:00 2001 From: Benjamin Marzinski <bmarzins@redhat.com> Date: Mon, 6 Nov
-2017 21:39:28 -0600 Subject: [PATCH] RH: warn on invalid regex instead of
-failing
+From 49d0b0279f54ceb96878e8e72e828efbb84a534c Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 1 Mar 2024 11:45:10 +0800
+Subject: [PATCH 07/12] RH: warn on invalid regex instead of failing
 
 multipath.conf used to allow "*" as a match everything regular expression,
 instead of requiring ".*". Instead of erroring when the old style
@@ -12,21 +12,21 @@ Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
 
 Upstream-Status: Pending
 
-update this patch to 0.8.2
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
 [OP: Rebase to 0.9.3]
 [OP: adjusted FREE() -> free(), made set_regex_value() static]
 Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+
+Rebase to 0.9.8
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- libmultipath/dict.c | 42 +++++++++++++++++++++++++++++++++++-------
- 1 file changed, 35 insertions(+), 7 deletions(-)
+ libmultipath/dict.c | 40 ++++++++++++++++++++++++++++++++++------
+ 1 file changed, 34 insertions(+), 6 deletions(-)
 
 diff --git a/libmultipath/dict.c b/libmultipath/dict.c
-index aa93fe43..55a22d32 100644
+index 5af036b7..e494419d 100644
 --- a/libmultipath/dict.c
 +++ b/libmultipath/dict.c
-@@ -155,6 +155,34 @@ set_str_noslash(vector strvec, void *ptr, const char *file, int line_nr)
+@@ -189,6 +189,34 @@ set_str_noslash(vector strvec, void *ptr, const char *file, int line_nr)
  	return 0;
  }
  
@@ -61,18 +61,16 @@ index aa93fe43..55a22d32 100644
  static int
  set_yes_no(vector strvec, void *ptr, const char *file, int line_nr)
  {
-@@ -1679,8 +1707,8 @@ ble_ ## option ## _handler (struct config *conf, vector strvec,		\
- 									\
+@@ -1798,7 +1826,7 @@ ble_ ## option ## _handler (struct config *conf, vector strvec,		\
  	if (!conf->option)						\
  		return 1;						\
--									\
+ 									\
 -	buff = set_value(strvec);					\
-+									\	
 +	buff = set_regex_value(strvec);					\
  	if (!buff)							\
  		return 1;						\
  									\
-@@ -1700,7 +1728,7 @@ ble_ ## option ## _ ## name ## _handler (struct config *conf, vector strvec, \
+@@ -1818,7 +1846,7 @@ ble_ ## option ## _ ## name ## _handler (struct config *conf, vector strvec, \
  	if (!conf->option)						\
  		return 1;						\
  									\
@@ -81,7 +79,7 @@ index aa93fe43..55a22d32 100644
  	if (!buff)							\
  		return 1;						\
  									\
-@@ -1806,16 +1834,16 @@ device_handler(struct config *conf, vector strvec, const char *file,
+@@ -1924,16 +1952,16 @@ device_handler(struct config *conf, vector strvec, const char *file,
  	return 0;
  }
  
@@ -101,7 +99,7 @@ index aa93fe43..55a22d32 100644
 +declare_hw_handler(bl_product, set_regex)
  declare_hw_snprint(bl_product, print_str)
  
- declare_hw_handler(hwhandler, set_str)
+ declare_hw_arg_str_handler(hwhandler, 0)
 -- 
-2.38.1
+2.25.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0028-RH-reset-default-find_mutipaths-value-to-off.patch b/meta-oe/recipes-support/multipath-tools/files/0008-RH-reset-default-find_mutipaths-value-to-off.patch
similarity index 70%
rename from meta-oe/recipes-support/multipath-tools/files/0028-RH-reset-default-find_mutipaths-value-to-off.patch
rename to meta-oe/recipes-support/multipath-tools/files/0008-RH-reset-default-find_mutipaths-value-to-off.patch
index ad03b8acc..1fa1f3be2 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0028-RH-reset-default-find_mutipaths-value-to-off.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0008-RH-reset-default-find_mutipaths-value-to-off.patch
@@ -1,10 +1,7 @@
-From 16900150e02e5b367a8b33621b393975ad011130 Mon Sep 17 00:00:00 2001
+From fcba3e0d4c8448a2510025acb255c7335413bf56 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 26 Nov 2018 11:12:01 +0800
-Subject: [PATCH] From 0000000000000000000000000000000000000000 Mon Sep 17
- 00:00:00 2001 From: Benjamin Marzinski <bmarzins@redhat.com> Date: Thu, 7 Jun
- 2018 17:43:52 -0500 Subject: [PATCH] RH: reset default find_mutipaths value
- to off
+Subject: [PATCH 08/12] RH: reset default find_mutipaths value to off
 
 Upstream has changed to default find_multipaths to "strict". For now
 Redhat will retain the previous default of "off".
@@ -13,18 +10,17 @@ Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
 
 Upstream-Status: Pending
 
-Update this patch to new version
-
+Rebase to 0.9.8
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  libmultipath/defaults.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libmultipath/defaults.h b/libmultipath/defaults.h
-index 6576939..a2404b2 100644
+index 64b633f2..a06a8a41 100644
 --- a/libmultipath/defaults.h
 +++ b/libmultipath/defaults.h
-@@ -17,7 +17,7 @@
+@@ -23,7 +23,7 @@
  #define DEFAULT_NO_PATH_RETRY	NO_PATH_RETRY_UNDEF
  #define DEFAULT_VERBOSITY	2
  #define DEFAULT_REASSIGN_MAPS	0
@@ -34,5 +30,5 @@ index 6576939..a2404b2 100644
  #define DEFAULT_DEV_LOSS_TMO	600
  #define DEFAULT_RETAIN_HWHANDLER RETAIN_HWHANDLER_ON
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0009-multipath-tools-modify-create-config.mk-for-cross-co.patch b/meta-oe/recipes-support/multipath-tools/files/0009-multipath-tools-modify-create-config.mk-for-cross-co.patch
new file mode 100644
index 000000000..041b79a9a
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0009-multipath-tools-modify-create-config.mk-for-cross-co.patch
@@ -0,0 +1,40 @@
+From 7452549e572b1c40aefe25524bf4bbbf34c952e5 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 4 Jun 2019 11:39:39 +0800
+Subject: [PATCH 09/12] multipath-tools: modify create-config.mk for
+ cross-compilation
+
+Do not look for systemd info on the host, and allow us to pass in CFLAGS
+using the OPTFLAGS variable.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+[OP: Rebase to 0.9.3]
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+
+Rebase to 0.9.8
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ create-config.mk | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/create-config.mk b/create-config.mk
+index 4d318b96..a65975ba 100644
+--- a/create-config.mk
++++ b/create-config.mk
+@@ -127,10 +127,6 @@ ifeq ($(ENABLE_DMEVENTS_POLL),0)
+ 	DEFINES += -DNO_DMEVENTS_POLL
+ endif
+ 
+-SYSTEMD := $(strip $(or $(shell $(PKG_CONFIG) --modversion libsystemd 2>/dev/null | awk '{print $$1}'), \
+-			$(shell systemctl --version 2>/dev/null | sed -n 's/systemd \([0-9]*\).*/\1/p')))
+-
+-
+ # $(call TEST_CC_OPTION,option,fallback)
+ # Test if the C compiler supports the option.
+ # Evaluates to "option" if yes, and "fallback" otherwise.
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0010-Subject-PATCH-Always-use-devmapper.patch b/meta-oe/recipes-support/multipath-tools/files/0010-Subject-PATCH-Always-use-devmapper.patch
new file mode 100644
index 000000000..b48720b8a
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0010-Subject-PATCH-Always-use-devmapper.patch
@@ -0,0 +1,72 @@
+From 5d2fa3c5975266a6c02214afa6254e6eeeb1baad Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 26 Nov 2018 11:17:41 +0800
+Subject: [PATCH 10/12] Subject: [PATCH] Always use devmapper
+
+Do not try to compute several _API_ make variables
+from host information when cross-compiling.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+[OP: Rebase to 0.9.3]
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+
+Rebase to 0.9.8
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ create-config.mk | 36 ++++++++----------------------------
+ 1 file changed, 8 insertions(+), 28 deletions(-)
+
+diff --git a/create-config.mk b/create-config.mk
+index a65975ba..8ba592f4 100644
+--- a/create-config.mk
++++ b/create-config.mk
+@@ -79,34 +79,14 @@ URCU_VERSION = $(shell \
+ 
+ DEFINES :=
+ 
+-ifneq ($(call check_func,dm_task_no_flush,$(devmapper_incdir)/libdevmapper.h),0)
+-	DEFINES += LIBDM_API_FLUSH
+-endif
+-
+-ifneq ($(call check_func,dm_task_get_errno,$(devmapper_incdir)/libdevmapper.h),0)
+-	DEFINES += LIBDM_API_GET_ERRNO
+-endif
+-
+-ifneq ($(call check_func,dm_task_set_cookie,$(devmapper_incdir)/libdevmapper.h),0)
+-	DEFINES += LIBDM_API_COOKIE
+-endif
+-
+-ifneq ($(call check_func,udev_monitor_set_receive_buffer_size,$(libudev_incdir)/libudev.h),0)
+-	DEFINES += LIBUDEV_API_RECVBUF
+-endif
+-
+-ifneq ($(call check_func,dm_task_deferred_remove,$(devmapper_incdir)/libdevmapper.h),0)
+-	DEFINES += LIBDM_API_DEFERRED
+-endif
+-
+-ifneq ($(call check_func,dm_hold_control_dev,$(devmapper_incdir)/libdevmapper.h),0)
+-	DEFINES += LIBDM_API_HOLD_CONTROL
+-endif
+-
+-ifneq ($(call check_var,ELS_DTAG_LNK_INTEGRITY,$(kernel_incdir)/scsi/fc/fc_els.h),0)
+-	DEFINES += FPIN_EVENT_HANDLER
+-	FPIN_SUPPORT = 1
+-endif
++DEFINES += LIBDM_API_FLUSH
++DEFINES += LIBDM_API_GET_ERRNO
++DEFINES += LIBDM_API_COOKIE
++DEFINES += LIBUDEV_API_RECVBUF
++DEFINES += LIBDM_API_DEFERRED
++DEFINES += LIBDM_API_HOLD_CONTROL
++DEFINES += FPIN_EVENT_HANDLER
++FPIN_SUPPORT = 1
+ 
+ libmount_h := $(shell $(PKG_CONFIG) --variable=includedir mount)/libmount/libmount.h
+ ifneq ($(call check_func,mnt_unref_cache,$(libmount_h)),0)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-fix-bug-of-do_compile-and-do_install.patch b/meta-oe/recipes-support/multipath-tools/files/0011-fix-bug-of-do_compile-and-do_install.patch
similarity index 80%
rename from meta-oe/recipes-support/multipath-tools/files/0001-fix-bug-of-do_compile-and-do_install.patch
rename to meta-oe/recipes-support/multipath-tools/files/0011-fix-bug-of-do_compile-and-do_install.patch
index bc07d75cc..f32d789b0 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0001-fix-bug-of-do_compile-and-do_install.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0011-fix-bug-of-do_compile-and-do_install.patch
@@ -1,7 +1,7 @@
-From 51f1f351262a31d94c10504e4d135526c6a7caeb Mon Sep 17 00:00:00 2001
+From 949070286692dfff89213792571da233fe82e440 Mon Sep 17 00:00:00 2001
 From: Wang Mingyu <wangmy@cn.fujitsu.com>
 Date: Sun, 10 May 2020 21:22:53 +0800
-Subject: [PATCH] fix bug of do_compile and do_install
+Subject: [PATCH 11/12] fix bug of do_compile and do_install
 
 when multiple processes make run in parallel,
 because of dependency error will occur.
@@ -12,16 +12,14 @@ Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
 [OP: Drop dependencies that are already present in the 0.9.3 Makefile]
 Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 ---
-Upstream-Status: Pending
-
  Makefile | 10 ++++++++++
  1 file changed, 10 insertions(+)
 
 diff --git a/Makefile b/Makefile
-index 27b4641f..f195b570 100644
+index 4df5f161..065249c2 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -79,6 +79,16 @@ libmpathpersist libmpathvalid multipath multipathd: libmultipath
+@@ -91,6 +91,16 @@ libmpathpersist libmpathvalid multipath multipathd: libmultipath
  libmultipath/prioritizers libmultipath/checkers libmultipath/foreign: libmultipath
  mpathpersist multipathd:  libmpathpersist
  
@@ -39,5 +37,5 @@ index 27b4641f..f195b570 100644
  	libmultipath/prioritizers.install \
  	libmultipath/foreign.install: libmultipath.install
 -- 
-2.38.1
+2.25.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-add-explicit-dependency-on-libraries.patch b/meta-oe/recipes-support/multipath-tools/files/0012-add-explicit-dependency-on-libraries.patch
similarity index 83%
rename from meta-oe/recipes-support/multipath-tools/files/0001-add-explicit-dependency-on-libraries.patch
rename to meta-oe/recipes-support/multipath-tools/files/0012-add-explicit-dependency-on-libraries.patch
index 3b0a70448..2f774940d 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0001-add-explicit-dependency-on-libraries.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0012-add-explicit-dependency-on-libraries.patch
@@ -1,7 +1,7 @@
-From ee9f7b6e764be5668bc958f8bb97a46e5056d050 Mon Sep 17 00:00:00 2001
+From 7a46f43682641436464579d8bf76c382e71ea557 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 25 May 2020 23:22:55 -0700
-Subject: [PATCH] add explicit dependency on libraries
+Subject: [PATCH 12/12] add explicit dependency on libraries
 
 [snip]
 gcc/i686-overc-linux/10.1.0/ld: cannot find -lmpathpersist
@@ -24,10 +24,10 @@ Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile b/Makefile
-index f195b570..2d22881c 100644
+index 065249c2..0444c2ea 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -78,6 +78,7 @@ libmultipath: libmpathutil
+@@ -90,6 +90,7 @@ libmultipath: libmpathutil
  libmpathpersist libmpathvalid multipath multipathd: libmultipath
  libmultipath/prioritizers libmultipath/checkers libmultipath/foreign: libmultipath
  mpathpersist multipathd:  libmpathpersist
@@ -36,5 +36,5 @@ index f195b570..2d22881c 100644
  DEPS_ON_MULTIPATH := \
  	multipath \
 -- 
-2.38.1
+2.25.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0021-RH-fixup-udev-rules-for-redhat.patch b/meta-oe/recipes-support/multipath-tools/files/0021-RH-fixup-udev-rules-for-redhat.patch
deleted file mode 100644
index 395f9a9b0..000000000
--- a/meta-oe/recipes-support/multipath-tools/files/0021-RH-fixup-udev-rules-for-redhat.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 9a941729d3c0d19d30d65e16b291c380e589eeb3 Mon Sep 17 00:00:00 2001
-From: Benjamin Marzinski <bmarzins@redhat.com>
-Date: Thu, 13 Apr 2017 07:22:23 -0500
-Subject: [PATCH] RH: fixup udev rules for redhat
-
-The multipath rules need to run after scsi_id is run. This means moving
-them after 60-persistent-storage.rules for redhat. Redhat also uses a
-different naming scheme for partitions than SuSE. Also, there are some
-false warnings that gcc throws because of the changed options. Fix these
-too.
-
-Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
-
-Update patch to 0.8.0
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-[OP: Rebase to 0.9.3]
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
-Upstream-Status: Pending
-
- Makefile.inc        | 2 +-
- kpartx/kpartx.rules | 2 +-
- multipath/Makefile  | 4 ++--
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.inc b/Makefile.inc
-index 4d843ce5..57779fd8 100644
---- a/Makefile.inc
-+++ b/Makefile.inc
-@@ -81,7 +81,7 @@ endif
- prefix		=
- exec_prefix	= $(prefix)
- usr_prefix	= $(prefix)
--bindir		= $(exec_prefix)/sbin
-+bindir		= $(exec_prefix)/usr/sbin
- libudevdir	= $(prefix)/$(SYSTEMDPATH)/udev
- tmpfilesdir	= $(prefix)/$(SYSTEMDPATH)/tmpfiles.d
- udevrulesdir	= $(libudevdir)/rules.d
-diff --git a/kpartx/kpartx.rules b/kpartx/kpartx.rules
-index 1969dee0..d2b28233 100644
---- a/kpartx/kpartx.rules
-+++ b/kpartx/kpartx.rules
-@@ -39,6 +39,6 @@ LABEL="mpath_kpartx_end"
- GOTO="kpartx_end"
- 
- LABEL="run_kpartx"
--RUN+="/sbin/kpartx -un -p -part /dev/$name"
-+RUN+="/sbin/kpartx -un /dev/$name"
- 
- LABEL="kpartx_end"
-diff --git a/multipath/Makefile b/multipath/Makefile
-index 116348e2..8482de6a 100644
---- a/multipath/Makefile
-+++ b/multipath/Makefile
-@@ -23,7 +23,7 @@ install:
- 	$(INSTALL_PROGRAM) -m 755 $(EXEC) $(DESTDIR)$(bindir)/
- 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(udevrulesdir)
- 	$(INSTALL_PROGRAM) -m 644 11-dm-mpath.rules $(DESTDIR)$(udevrulesdir)
--	$(INSTALL_PROGRAM) -m 644 multipath.rules $(DESTDIR)$(udevrulesdir)/56-multipath.rules
-+	$(INSTALL_PROGRAM) -m 644 multipath.rules $(DESTDIR)$(udevrulesdir)/62-multipath.rules
- 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(modulesloaddir)
- 	$(INSTALL_PROGRAM) -m 644 modules-load.conf $(DESTDIR)$(modulesloaddir)/multipath.conf
- 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(tmpfilesdir)
-@@ -43,7 +43,7 @@ uninstall:
- 	$(RM) $(DESTDIR)$(udevrulesdir)/11-dm-mpath.rules
- 	$(RM) $(DESTDIR)$(modulesloaddir)/multipath.conf
- 	$(RM) $(DESTDIR)$(modulesloaddir)/scsi_dh.conf
--	$(RM) $(DESTDIR)$(libudevdir)/rules.d/56-multipath.rules
-+	$(RM) $(DESTDIR)$(libudevdir)/rules.d/62-multipath.rules
- 	$(RM) $(DESTDIR)$(man8dir)/$(EXEC).8
- 	$(RM) $(DESTDIR)$(man5dir)/$(EXEC).conf.5
- 
--- 
-2.38.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0024-RH-use-rpm-optflags-if-present.patch b/meta-oe/recipes-support/multipath-tools/files/0024-RH-use-rpm-optflags-if-present.patch
deleted file mode 100644
index e7b3e1223..000000000
--- a/meta-oe/recipes-support/multipath-tools/files/0024-RH-use-rpm-optflags-if-present.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From cc38276a5d3926fd96e58366e15ba887d7d02ed0 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 26 Nov 2018 09:19:17 +0800
-Subject: [PATCH] From 0000000000000000000000000000000000000000 Mon Sep
-
-17
- 00:00:00 2001 From: Benjamin Marzinski <bmarzins@redhat.com> Date: Wed,
-19
- Apr 2017 06:10:01 -0500 Subject: [PATCH] RH: use rpm optflags if
-present
-
-Use the passed in optflags when compiling as an RPM, and keep the
-default flags as close as possible to the current fedora flags, while
-still being generic.
-
-Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
-
-Upstream-Status: Pending
-
-update this patch to new version
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-[OP: Rebase to 0.9.3]
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- Makefile.inc | 28 ++++++++++++++++++----------
- 1 file changed, 18 insertions(+), 10 deletions(-)
-
-diff --git a/Makefile.inc b/Makefile.inc
-index 57779fd8..34f2cc6d 100644
---- a/Makefile.inc
-+++ b/Makefile.inc
-@@ -140,20 +140,28 @@ FORTIFY_OPT := $(shell \
- 		echo "-D_FORTIFY_SOURCE=2"; \
- 	fi)
- 
--STACKPROT := $(call TEST_CC_OPTION,-fstack-protector-strong,-fstack-protector)
--ERROR_DISCARDED_QUALIFIERS := $(call TEST_CC_OPTION,-Werror=discarded-qualifiers,)
--WNOCLOBBERED := $(call TEST_CC_OPTION,-Wno-clobbered -Wno-error=clobbered,)
--WFORMATOVERFLOW := $(call TEST_CC_OPTION,-Wformat-overflow=2,)
--
--OPTFLAGS	:= -O2 -g $(STACKPROT) --param=ssp-buffer-size=4
--WARNFLAGS	:= -Werror -Wall -Wextra -Wformat=2 $(WFORMATOVERFLOW) -Werror=implicit-int \
--		  -Werror=implicit-function-declaration -Werror=format-security \
--		  $(WNOCLOBBERED) -Werror=cast-qual $(ERROR_DISCARDED_QUALIFIERS)
-+ifndef RPM_OPT_FLAGS
-+       STACKPROT := $(call TEST_CC_OPTION,-fstack-protector-strong,-fstack-protector)
-+       OPTFLAGS        = -O2 -g -pipe -Wall -Werror=format-security \
-+                         -Wp,-D_FORTIFY_SOURCE=2 -fexceptions \
-+                         $(STACKPROT) --param=ssp-buffer-size=4 \
-+                         -grecord-gcc-switches
-+       ifeq ($(shell test -f /usr/lib/rpm/redhat/redhat-hardened-cc1 && echo 1),1)
-+               OPTFLAGS += -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1
-+       endif
-+else
-+       OPTFLAGS = $(RPM_OPT_FLAGS)
-+endif
-+OPTFLAGS       += -Wextra -Wstrict-prototypes -Wformat=2 -Werror=implicit-int \
-+                  -Werror=implicit-function-declaration -Wno-sign-compare \
-+                  -Wno-unused-parameter -Werror=cast-qual \
-+                  -Werror=discarded-qualifiers
-+
- CPPFLAGS	:= $(FORTIFY_OPT) \
- 		   -DBIN_DIR=\"$(bindir)\" -DMULTIPATH_DIR=\"$(plugindir)\" -DRUN_DIR=\"${RUN}\" \
- 		   -DRUNTIME_DIR=\"$(runtimedir)\" \
- 		   -DCONFIG_DIR=\"$(configdir)\" -DEXTRAVERSION=\"$(EXTRAVERSION)\" -MMD -MP
--CFLAGS		:= --std=gnu99 $(CFLAGS) $(OPTFLAGS) $(WARNFLAGS) -pipe
-+CFLAGS		:= --std=gnu99 $(CFLAGS) $(OPTFLAGS) -pipe
- BIN_CFLAGS	= -fPIE -DPIE
- LIB_CFLAGS	= -fPIC
- SHARED_FLAGS	= -shared
--- 
-2.38.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch b/meta-oe/recipes-support/multipath-tools/files/0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch
deleted file mode 100644
index 952009b1d..000000000
--- a/meta-oe/recipes-support/multipath-tools/files/0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From d139474f2a6d87c1cd20dfbb916fe650bfcce968 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 4 Jun 2019 11:39:39 +0800
-Subject: [PATCH] multipath-tools: modify Makefile.inc for cross-compilation
-
-Do not look for systemd info on the host, and allow us to pass in CFLAGS
-using the OPTFLAGS variable.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-Update for version 0.5.0-144-g770e6d0
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-Update for version 0.7.1
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-update for version 0.7.7
-
-remove change about CFLAGS part, since patch 0024 already have similar function.
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
-update for version 0.8.1
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-[OP: Rebase to 0.9.3]
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- Makefile.inc | 11 -----------
- 1 file changed, 11 deletions(-)
-
-diff --git a/Makefile.inc b/Makefile.inc
-index 34f2cc6d..ee6a4c9f 100644
---- a/Makefile.inc
-+++ b/Makefile.inc
-@@ -42,17 +42,6 @@ ifndef RUN
- 	endif
- endif
- 
--ifndef SYSTEMD
--	ifeq ($(shell $(PKGCONFIG) --modversion libsystemd >/dev/null 2>&1 && echo 1), 1)
--		SYSTEMD = $(shell $(PKGCONFIG) --modversion libsystemd | awk '{print $$1}')
--	else
--		ifeq ($(shell systemctl --version >/dev/null 2>&1 && echo 1), 1)
--			SYSTEMD = $(shell systemctl --version 2> /dev/null | \
--				sed -n 's/systemd \([0-9]*\).*/\1/p')
--		endif
--	endif
--endif
--
- ifndef SYSTEMDPATH
- 	SYSTEMDPATH=usr/lib
- endif
--- 
-2.38.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0030-Always-use-devmapper.patch b/meta-oe/recipes-support/multipath-tools/files/0030-Always-use-devmapper.patch
deleted file mode 100644
index c2025ed6f..000000000
--- a/meta-oe/recipes-support/multipath-tools/files/0030-Always-use-devmapper.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From f20d7651a62efff818ebd0d1bc920f6f362c890d Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 26 Nov 2018 11:17:41 +0800
-Subject: [PATCH] Subject: [PATCH] Always use devmapper
-
-Do not try to compute several _API_ make variables
-from host information when cross-compiling.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-Rebase to 0.7.1
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-Rebase to 0.7.7
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
-Rebase to 0.7.9
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-[OP: Rebase to 0.9.3]
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- libmultipath/Makefile | 34 +++++++---------------------------
- 1 file changed, 7 insertions(+), 27 deletions(-)
-
-diff --git a/libmultipath/Makefile b/libmultipath/Makefile
-index 3b60a525..72aca7ca 100644
---- a/libmultipath/Makefile
-+++ b/libmultipath/Makefile
-@@ -22,33 +22,13 @@ ifdef SYSTEMD
- 	endif
- endif
- 
--ifneq ($(call check_func,dm_task_no_flush,$(DEVMAPPER_INCDIR)/libdevmapper.h),0)
--	CPPFLAGS += -DLIBDM_API_FLUSH
--endif
--
--ifneq ($(call check_func,dm_task_get_errno,$(DEVMAPPER_INCDIR)/libdevmapper.h),0)
--	CPPFLAGS += -DLIBDM_API_GET_ERRNO
--endif
--
--ifneq ($(call check_func,dm_task_set_cookie,$(DEVMAPPER_INCDIR)/libdevmapper.h),0)
--	CPPFLAGS += -DLIBDM_API_COOKIE
--endif
--
--ifneq ($(call check_func,udev_monitor_set_receive_buffer_size,$(LIBUDEV_INCDIR)/libudev.h),0)
--	CPPFLAGS += -DLIBUDEV_API_RECVBUF
--endif
--
--ifneq ($(call check_func,dm_task_deferred_remove,$(DEVMAPPER_INCDIR)/libdevmapper.h),0)
--	CPPFLAGS += -DLIBDM_API_DEFERRED
--endif
--
--ifneq ($(call check_func,dm_hold_control_dev,$(DEVMAPPER_INCDIR)/libdevmapper.h),0)
--	CPPFLAGS += -DLIBDM_API_HOLD_CONTROL
--endif
--
--ifneq ($(call check_var,ELS_DTAG_LNK_INTEGRITY,$(LINUX_HEADERS_INCDIR)/scsi/fc/fc_els.h),0)
--	CPPFLAGS += -DFPIN_EVENT_HANDLER
--endif
-+CPPFLAGS += -DLIBDM_API_FLUSH
-+CPPFLAGS += -DLIBDM_API_GET_ERRNO
-+CPPFLAGS += -DLIBDM_API_COOKIE
-+CPPFLAGS += -DLIBUDEV_API_RECVBUF
-+CPPFLAGS += -DLIBDM_API_DEFERRED
-+CPPFLAGS += -DLIBDM_API_HOLD_CONTROL
-+CPPFLAGS += -DFPIN_EVENT_HANDLER
- 
- # object files referencing MULTIPATH_DIR or CONFIG_DIR
- # they need to be recompiled for unit tests
--- 
-2.38.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0031-Always-use-devmapper-for-kpartx.patch b/meta-oe/recipes-support/multipath-tools/files/0031-Always-use-devmapper-for-kpartx.patch
deleted file mode 100644
index 2d043c399..000000000
--- a/meta-oe/recipes-support/multipath-tools/files/0031-Always-use-devmapper-for-kpartx.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 820d2ef3596189041da43d1139da8689336bb918 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 26 Nov 2018 11:19:45 +0800
-Subject: [PATCH] Subject: [PATCH] Always use devmapper for kpartx
-
-Do not try to compute the LIBDM_API_COOKIE make variable
-from host information when cross-compiling.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-Rebase to 0.7.1
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-Rebase to 0.7.7
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
-Rebase to 0.7.9
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-[OP: Rebase to 0.9.3]
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- kpartx/Makefile | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/kpartx/Makefile b/kpartx/Makefile
-index 742d3bcd..d886483d 100644
---- a/kpartx/Makefile
-+++ b/kpartx/Makefile
-@@ -9,9 +9,7 @@ LDFLAGS += $(BIN_LDFLAGS)
- 
- LIBDEPS += -ldevmapper
- 
--ifneq ($(call check_func,dm_task_set_cookie,$(DEVMAPPER_INCDIR)/libdevmapper.h),0)
--	CPPFLAGS += -DLIBDM_API_COOKIE
--endif
-+CPPFLAGS += -DLIBDM_API_COOKIE
- 
- OBJS = bsd.o dos.o kpartx.o solaris.o unixware.o dasd.o sun.o \
- 	gpt.o mac.o ps3.o crc32.o lopart.o xstrncpy.o devmapper.o
--- 
-2.38.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch b/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch
deleted file mode 100644
index ec123b212..000000000
--- a/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 21a8680b7bd436867ac689a0b4b1b18a3359e208 Mon Sep 17 00:00:00 2001
-From: Geoff Parker <geoffrey.parker@arthrex.com>
-Date: Fri, 9 Oct 2020 17:48:47 +0000
-Subject: [PATCH] libdmmp/Makefile: replace perl with sed in install target to
- work with pseudo
-
-The multipath-tools libdmmp/Makefile install target uses 'perl -i' instead
-of 'sed -i' for string substitutions. The perl method creates a temporary file
-and overwrites the original which changes the inodes and corrupts the pseudo
-db. Changes to pseduo cause a build abort rather than allow possible bad
-ownership or permissions settings on the files. 'sed -i' is compatible
-with pseudo.
-
-Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
-[OP: Rebase to 0.9.3]
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
-Upstream-Status: Pending
-
- libdmmp/Makefile | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/libdmmp/Makefile b/libdmmp/Makefile
-index e4589250..34e06425 100644
---- a/libdmmp/Makefile
-+++ b/libdmmp/Makefile
-@@ -39,11 +39,11 @@ install:
- 	$(LN) $(LIBS) $(DESTDIR)$(usrlibdir)/$(DEVLIB)
- 	$(INSTALL_PROGRAM) -m 644 -D \
- 		$(PKGFILE).in $(DESTDIR)$(pkgconfdir)/$(PKGFILE)
--	perl -i -pe 's|__VERSION__|$(LIBDMMP_VERSION)|g' \
-+	sed -i 's|__VERSION__|$(LIBDMMP_VERSION)|g' \
- 		$(DESTDIR)$(pkgconfdir)/$(PKGFILE)
--	perl -i -pe 's|__LIBDIR__|$(usrlibdir)|g' \
-+	sed -i 's|__LIBDIR__|$(usrlibdir)|g' \
- 		$(DESTDIR)$(pkgconfdir)/$(PKGFILE)
--	perl -i -pe 's|__INCLUDEDIR__|$(includedir)|g' \
-+	sed -i 's|__INCLUDEDIR__|$(includedir)|g' \
- 		$(DESTDIR)$(pkgconfdir)/$(PKGFILE)
- 	$(INSTALL_PROGRAM) -d 755 $(DESTDIR)$(man3dir)
- 	$(INSTALL_PROGRAM) -m 644 -t $(DESTDIR)$(man3dir) docs/man/*.3
--- 
-2.38.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.3.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.8.bb
similarity index 80%
rename from meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.3.bb
rename to meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.8.bb
index a7a9019e3..df95df6f7 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.3.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.8.bb
@@ -32,25 +32,23 @@ LICENSE = "GPL-2.0-only"
 SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=https;branch=master \
            file://multipathd.oe \
            file://multipath.conf.example \
-           file://0021-RH-fixup-udev-rules-for-redhat.patch \
-           file://0022-RH-Remove-the-property-blacklist-exception-builtin.patch \
-           file://0023-RH-don-t-start-without-a-config-file.patch \
-           file://0024-RH-use-rpm-optflags-if-present.patch \
-           file://0025-RH-add-mpathconf.patch \
-           file://0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch \
-           file://0027-RH-warn-on-invalid-regex-instead-of-failing.patch \
-           file://0028-RH-reset-default-find_mutipaths-value-to-off.patch \
-           file://0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch \
-           file://0030-Always-use-devmapper.patch \
-           file://0031-Always-use-devmapper-for-kpartx.patch \
-           file://0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch \
-           file://0001-fix-bug-of-do_compile-and-do_install.patch \
-           file://0001-add-explicit-dependency-on-libraries.patch \
+           file://0001-RH-fixup-udev-rules-for-redhat.patch \
+           file://0002-RH-Remove-the-property-blacklist-exception-builtin.patch \
+           file://0003-RH-don-t-start-without-a-config-file.patch \
+           file://0004-RH-use-rpm-optflags-if-present.patch \
+           file://0005-RH-add-mpathconf.patch \
+           file://0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch \
+           file://0007-RH-warn-on-invalid-regex-instead-of-failing.patch \
+           file://0008-RH-reset-default-find_mutipaths-value-to-off.patch \
+           file://0009-multipath-tools-modify-create-config.mk-for-cross-co.patch \
+           file://0010-Subject-PATCH-Always-use-devmapper.patch \
+           file://0011-fix-bug-of-do_compile-and-do_install.patch \
+           file://0012-add-explicit-dependency-on-libraries.patch \
            "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-SRCREV = "1332947447133fdf26246012b836868a3d974f0e"
+SRCREV = "3daacfdfd110b24a3a7d5a276dcf8512b7039199"
 
 S = "${WORKDIR}/git"
 
@@ -103,6 +101,7 @@ do_install() {
     ${D}${sysconfdir}/multipath.conf.example
 }
 
+FILES:${PN} += "${systemd_system_unitdir}"
 FILES:${PN}-dbg += "${base_libdir}/multipath/.debug"
 
 PACKAGES =+ "${PN}-libs"
-- 
2.25.1


