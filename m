Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B32C3527E
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:02 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.1586.1649979708428839658
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 16:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dIFE98dn;
 spf=pass (domain: gmail.com, ip: 209.85.216.51,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 e8-20020a17090a118800b001cb13402ea2so7135984pja.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 16:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EQkbLfHf56l7IpMq0G3ZhuUHxinJDSDv4QlwiFOANuU=;
        b=dIFE98dnosXN53mj401KCqT3Tu9scM8doZjx9oax2qQMeOzGvpkwEYV98W5gtbYiNS
         gLBLq/RotI3A2VyB2rQz6UMpO74J9L56hu3RJbgVWxRzK2utzdoNOcC7GfBIoiY8jvwW
         cgfC1JcJotzETCLPUIsoqPN9tLvr9zQFKE3Bogrn2HayGv1jyqsb/8OdN1lIqsn8b96x
         ZxgFu8+fz6qLyn/TegNxIA0zDvx1UKs3Fa2dMYW6zJ4qDDa+tPOC4vfXbLkexcolAbaA
         w6WLm04CzXFRVWqIItsumbgCUHTXmHIUsXR0tS3CSGNFMqEDgLxHz6PkKiVgC10/uXvy
         0z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EQkbLfHf56l7IpMq0G3ZhuUHxinJDSDv4QlwiFOANuU=;
        b=YkGGtvRUR6IKpUQQgTUHbxXdiQ105I4d6edtygmMruLupfEvK3+m4dW9+0o5Z+EJ8D
         qGv952VBCqJPelmxnDj2rbscbBU5Vk+u9JCMaG0Xx6JNYx8kVB1htutmaImaUzGFKUJU
         pbDkVYRPuHrkCHpNbFnnBTBVwDVLyFjsZVGxXJNtfpKQPa5+EGp4z0/yaNoJGNtf1wiS
         xOhfG1c1VhAVwoSx/sc/X2ktEzkOEkOl4tD4BxgluFYcQQx+YocHRppQLfZhl3cOmQw5
         xa/yZvwvGUStJsDeE07NBvHINP5nvc9u6Lp94zSSoEc6qsT2okDVQfqhgOgYCRpmMkoZ
         jX3w==
X-Gm-Message-State: AOAM530jwUb9zsRaFjtRP+To9AzHjlIHKPnXCiKxZZtKvsZWD9lrDYbD
	AwupdcpZYA5eTIVjI/tUbkZiRgjzpAo=
X-Google-Smtp-Source: 
 ABdhPJy5rrczTtgCxSX6vDrXPMF3Brtx97sIEPeysSqY+WMhR7ESzHZI/V8W6cQ1DOpd1F5x3K1ocw==
X-Received: by 2002:a17:902:7c94:b0:14d:77d2:a72e with SMTP id
 y20-20020a1709027c9400b0014d77d2a72emr49687478pll.153.1649979707496;
        Thu, 14 Apr 2022 16:41:47 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:8ba4:faed:21bc:f7bd])
        by smtp.gmail.com with ESMTPSA id
 y26-20020a056a00181a00b004fe3a6f02cesm904025pfa.85.2022.04.14.16.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 16:41:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>
Subject: [meta-oe][honister][PATCH] zabbix: Fix sereval CVEs
Date: Thu, 14 Apr 2022 16:41:46 -0700
Message-Id: <20220414234146.2228085-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96657

From: Changqing Li <changqing.li@windriver.com>

fix CVE-2022-24349,CVE-2022-24917,CVE-2022-24918,CVE-2022-24919

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-DEV-2077-fixed-reflected-XSS-issues.patch | 93 +++++++++++++++++++
 .../zabbix/zabbix_5.2.6.bb                    |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/0001-.F.-DEV-2077-fixed-reflected-XSS-issues.patch

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix/0001-.F.-DEV-2077-fixed-reflected-XSS-issues.patch b/meta-oe/recipes-connectivity/zabbix/zabbix/0001-.F.-DEV-2077-fixed-reflected-XSS-issues.patch
new file mode 100644
index 0000000000..1d32a9cfdd
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
index b5ab15df48..9d2a06c5ea 100644
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


