Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C17DC5478D
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:14 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.9336.1708419303168362243
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:55:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ahfe9JIr;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419304; x=1739955304;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xv1twDS/ywawCj3naELLxUeVjU09/9tHPnSmaG63zMI=;
  b=Ahfe9JIrtHI8s2nGd7JKXfjA9uJj5uF7Vy++9SKq015dGY8i7lX+bJwB
   hup6FRHIhosjOD+IutDuNEbbrxItL7z5peq3WCh4Z8ou05+RDhwTEm2AC
   7UrVTHYYUXB6RVKjXRkq3kVsrRIbC7OecscR4UsV4mgKdQNDb4q0fOZ3S
   Pa84vOf42RcGn+pw+VrwPXZlemVJnWkOb2vAMP0R5OUDqeol6lu8HSNLF
   izgn2Hg/eo+fJojD0sNlgoO6Ib80VCfiWdhgcd1bQd1lnHNj9GwEGCEZD
   pGiJ88yPXeoqdpC9gyQnh8J44xoauRYuiVROnomsPRdy53vzM3YF65BTD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="151648138"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="151648138"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:55:03 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A46EE2FC0D
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:55:00 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C5B733BD86
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 61FCC70BD9
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0F46A1A00A1;
	Tue, 20 Feb 2024 16:54:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 24/26] remmina: upgrade 1.4.33 -> 1.4.34
Date: Tue, 20 Feb 2024 16:54:39 +0800
Message-Id: <1708419281-26047-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10--5.273200-10.000000
X-TMASE-MatchedRID: AFiVwG0qm0+jz0nOeth/yUIIxwDaU5mrKm0e+N6FGPFR6SMusLeVMGwv
	1p7aepQ/dmjn29714VM9giHeuBY6CjWs2YGWPbxrqhcdnP91eXEfimmlcABuN1GJGXffuLdvmBQ
	vLjMBsUH31F8+7A8MyEIaN3m1uYXoVDlAsp6ys4nsQeQyqY+GpWCDsc7zPa02jlXUAIjJm2fUh5
	yQ6tsoTIVbeBz7GUKVcQR+wM7m1ZqplFX1YsR+ALA6Z+NDfTN5Xs5nqGvDCfNOed0Eey3YOQ5TN
	Nnv1eM6Q2NuPcoVKfUrrRag9ywuR0qyi4srEQAuP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwUe
	vDt+uW6pByRBJ91zJGFp9qfciji95UcZtwNsCroURSScn+QSXt0H8LFZNFG7bkV4e2xSge7kIQu
	4pucs+c5sX+dj8XjqR/c05EjyCU/HdFQo4LTXwksMHBii02BH
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108943

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* [REM-2981] Move ssh-unrelated code outside of HAVE_LIBSSH ifdef
* [REM-2974] only attempt to resolve hostname if initial ssh_connect fails
* [REM-2980] Remove flag that prevented remote audio from working with flatpak version of Remmina
* [REM-2982] Update Flatpak to use GNOME runtime version 44
* initial port to core22
* [REM-2984] Add null check to prevent freeze when opening an rdp connection
* Fix GTK critical error when editing RDP profile
* Remove snap installs for broken link executables
* SSH private key auth: If username is empty, prompt user to enter it
* Fix Flatpak freeze on connection when importing RDP profile
* Fix of some grammatic issues in German translation
* [REM-3003] Re-add line removed by accident in !2532
* GtkFileChooserNative support
* Spice UNIX socket channel initialization enhancement
* Fix segfault for 'remmina -p'
* Add unlocking code to let plugins use passwords
* CI Pipeline Updates
* [freerdp] update to build for stable-3.0
* Allow Remmina to be built without FreeRDP
* [REM-3048] Fix crash on multi-monitor with FreeRDP3
* Added developer_name to meet new flathub requirements
* [New features] Bring back remmina server features with new additions
* [REM-2983] compile ssh with gcrypt for flatpak builds. Also sync flatpak...
* Update copyright info

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../remmina/{remmina_1.4.33.bb => remmina_1.4.34.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/remmina/{remmina_1.4.33.bb => remmina_1.4.34.bb} (96%)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.33.bb b/meta-oe/recipes-support/remmina/remmina_1.4.34.bb
similarity index 96%
rename from meta-oe/recipes-support/remmina/remmina_1.4.33.bb
rename to meta-oe/recipes-support/remmina/remmina_1.4.34.bb
index 590f5089e..921d34d9f 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.33.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.34.bb
@@ -25,7 +25,7 @@ DEPENDS = " \
 DEPENDS:append:libc-musl = " libexecinfo"
 LDFLAGS:append:libc-musl = " -lexecinfo"
 
-SRCREV = "2c4e1479433e51418ecb6089f35182bfebc5b57e"
+SRCREV = "75a0bdb795d99e052690178ae0d81ebdbd2cbdd3"
 SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
-- 
2.34.1


