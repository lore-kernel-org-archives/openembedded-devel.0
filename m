Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44CEEC4321E
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:06 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.1699.1649817319633907048
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 19:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 23D2ZIPN001475
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 19:35:19 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 23D2ZIIi015757
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 19:35:18 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 12 Apr 2022 19:35:18 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Apr 2022 19:35:17 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 12 Apr 2022 19:35:17 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [hardknott][meta-oe][PATCH] zabbix: Fix sereval CVEs
Date: Wed, 13 Apr 2022 10:35:16 +0800
Message-ID: <20220413023516.958975-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96605

From: Changqing Li <changqing.li@windriver.com>

fix CVE-2022-24349,CVE-2022-24917,CVE-2022-24918,CVE-2022-24919

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...-DEV-2077-fixed-reflected-XSS-issues.patch | 93 +++++++++++++++++++
 .../zabbix/zabbix_5.2.6.bb                    |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/0001-.F.-DEV-2077-fixed-reflected-XSS-issues.patch

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix/0001-.F.-DEV-2077-fixed-reflected-XSS-issues.patch b/meta-oe/recipes-connectivity/zabbix/zabbix/0001-.F.-DEV-2077-fixed-reflected-XSS-issues.patch
new file mode 100644
index 000000000..1d32a9cfd
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix/0001-.F.-DEV-2077-fixed-reflected-XSS-issues.patch
@@ -0,0 +1,93 @@
+From fe3e2c2deeef568ec7e961340487497e31eb1a81 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 13 Apr 2022 10:19:39 +0800
+Subject: [PATCH] ..F....... [DEV-2077] fixed reflected XSS issues
+
+Merge in ZBX/zabbix from feature/DEV-2077-5.4 to release/5.4
+
+* commit '5986cdf2572acaaaac1fc113d6407d5f0cd00c35':
+  ..F....... [DEV-2077] fixed service actions #3
+  ..F....... [DEV-2077] fixed service actions #2
+  ..F....... [DEV-2077] reverted unnecessary changes
+  ..F....... [DEV-2077] reverted tests
+  ..F....... [DEV-2077] fixed service actions
+  ..F....... [DEV-2077] fixed reflected XSS issue in service configuration form
+  ..F....... [DEV-2077] fixed reflected XSS issues in uncheckTableRows function
+  ..F....... [DEV-2077] fixed reflected XSS issues in graph configuration
+  ..F....... [DEV-2077] fixed reflected XSS issues in action configuration
+
+Upstream_Status: Backport [https://git.zabbix.com/projects/ZBX/repos/zabbix/commits/05976188fcca518c029e1af9ed03fd331786d77d]
+CVE: CVE-2022-24349,CVE-2022-24917,CVE-2022-24918,CVE-2022-24919
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ ui/actionconf.php                                | 2 +-
+ ui/graphs.php                                    | 2 +-
+ ui/include/func.inc.php                          | 5 ++---
+ ui/include/views/configuration.services.edit.php | 5 +++--
+ 4 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/ui/actionconf.php b/ui/actionconf.php
+index 5b67f72..8cda3fc 100644
+--- a/ui/actionconf.php
++++ b/ui/actionconf.php
+@@ -37,7 +37,7 @@ $fields = [
+ 	'name' =>							[T_ZBX_STR, O_OPT, null,	NOT_EMPTY,	'isset({add}) || isset({update})',
+ 											_('Name')
+ 										],
+-	'eventsource' =>					[T_ZBX_INT, O_OPT, null,
++	'eventsource' =>					[T_ZBX_INT, O_OPT, P_SYS,
+ 											IN([EVENT_SOURCE_TRIGGERS, EVENT_SOURCE_DISCOVERY,
+ 												EVENT_SOURCE_AUTOREGISTRATION, EVENT_SOURCE_INTERNAL
+ 											]),
+diff --git a/ui/graphs.php b/ui/graphs.php
+index 79bb195..1d10803 100644
+--- a/ui/graphs.php
++++ b/ui/graphs.php
+@@ -43,7 +43,7 @@ $fields = [
+ 	'name' =>				[T_ZBX_STR, O_OPT, null,		NOT_EMPTY,		'isset({add}) || isset({update})', _('Name')],
+ 	'width' =>				[T_ZBX_INT, O_OPT, null,		BETWEEN(20, 65535), 'isset({add}) || isset({update})', _('Width')],
+ 	'height' =>				[T_ZBX_INT, O_OPT, null,		BETWEEN(20, 65535), 'isset({add}) || isset({update})', _('Height')],
+-	'graphtype' =>			[T_ZBX_INT, O_OPT, null,		IN('0,1,2,3'),	'isset({add}) || isset({update})'],
++	'graphtype' =>			[T_ZBX_INT, O_OPT, P_SYS,		IN('0,1,2,3'),	'isset({add}) || isset({update})'],
+ 	'show_3d' =>			[T_ZBX_INT, O_OPT, P_NZERO,	IN('0,1'),		null],
+ 	'show_legend' =>		[T_ZBX_INT, O_OPT, P_NZERO,	IN('0,1'),		null],
+ 	'ymin_type' =>			[T_ZBX_INT, O_OPT, null,		IN('0,1,2'),	null],
+diff --git a/ui/include/func.inc.php b/ui/include/func.inc.php
+index 359fdfb..43c1a41 100644
+--- a/ui/include/func.inc.php
++++ b/ui/include/func.inc.php
+@@ -2175,11 +2175,10 @@ function uncheckTableRows($parentid = null, $keepids = []) {
+ 	if ($keepids) {
+ 		// If $keepids will not have same key as value, it will create mess, when new checkbox will be checked.
+ 		$keepids = array_combine($keepids, $keepids);
+-
+-		insert_js('sessionStorage.setItem("'.$key.'", JSON.stringify('.json_encode($keepids).'))');
++		insert_js('sessionStorage.setItem('.json_encode($key).', JSON.stringify('.json_encode($keepids).'));');
+ 	}
+ 	else {
+-		insert_js('sessionStorage.removeItem("'.$key.'")');
++		insert_js('sessionStorage.removeItem('.json_encode($key).');');
+ 	}
+ }
+ 
+diff --git a/ui/include/views/configuration.services.edit.php b/ui/include/views/configuration.services.edit.php
+index a12385b..625fba9 100644
+--- a/ui/include/views/configuration.services.edit.php
++++ b/ui/include/views/configuration.services.edit.php
+@@ -141,9 +141,10 @@ foreach ($this->data['children'] as $child) {
+ 			!empty($child['trigger']) ? $child['trigger'] : '',
+ 			(new CCol(
+ 				(new CButton('remove', _('Remove')))
+-					->onClick('javascript: removeDependentChild(\''.$child['serviceid'].'\');')
+-					->addClass(ZBX_STYLE_BTN_LINK)
+ 					->removeId()
++					->addClass(ZBX_STYLE_BTN_LINK)
++					->setAttribute('data-serviceid', $child['serviceid'])
++					->onClick('removeDependentChild(this.dataset.serviceid);')
+ 			))->addClass(ZBX_STYLE_NOWRAP)
+ 		]))->setId('children_'.$child['serviceid'])
+ 	);
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_5.2.6.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_5.2.6.bb
index 37bb9a282..c2b28a3fb 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_5.2.6.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_5.2.6.bb
@@ -26,6 +26,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/5.2/${BPN}-${PV}.tar.gz \
     file://0001-Fix-configure.ac.patch \
     file://zabbix-agent.service \
+    file://0001-.F.-DEV-2077-fixed-reflected-XSS-issues.patch \
 "
 
 SRC_URI[md5sum] = "31dab3535a1fa212f5724902727f6d4d"
-- 
2.25.1


