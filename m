Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D551C282CE
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.2200.1740525896906935447
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HxPC6RPO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525898; x=1772061898;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xD29ueYWw4VmO7s9MHRqBV1KXygMQPqbwgqtoqGQrhQ=;
  b=HxPC6RPO4TLVLdkgbRjxHdN/WlPvc9ao7mwY4wDe4qIqILWR0KDPNA1B
   sMAnyKORmYbNmIO22DE9z0NQjcoVRIzIRDRyA2QR3TrPRhBxmK4gREHoo
   srmZnAoDnPF9qlUDgE82R1Hiw8lSrsE22OfrF+6vcD3+f6S2FYQHbxhLH
   BqSQlLSmMdoXrVgdSTnkfIAGPyfymPl7j4vYmlO7h9FK8/5S6oaZPZ0U3
   1uVuhLTTcB+STFOLMstd6tHCJaqxErfrfldKXMx8Cv5IPw/22LJAPDEYr
   4wc+SAdZP7uyweiB6jA7DRhttW8FLe99KUON5CqWgT2/7dVjJd2ElzhMq
   w==;
X-CSE-ConnectionGUID: 8Uj5qAX0RN2MM2HzajgvTg==
X-CSE-MsgGUID: 4pvs2QvvTh6WCgReBY4xyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="191180225"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="191180225"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:57 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B86E6E6144
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7633ABDC81
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:54 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1A36B1A006C;
	Wed, 26 Feb 2025 07:24:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 13/51] liberror-perl: upgrade 0.17029 -> 0.17030
Date: Wed, 26 Feb 2025 07:24:03 +0800
Message-Id: <1740525881-21103-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115611

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Fix die/warn hooks for perl 5.41.9 changes
- Fix tidyall tests.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{liberror-perl_0.17029.bb => liberror-perl_0.17030.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/liberror/{liberror-perl_0.17029.bb => liberror-perl_0.17030.bb} (93%)

diff --git a/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb b/meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb
similarity index 93%
rename from meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb
rename to meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb
index 83baf2a026..cce79f807a 100644
--- a/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb
+++ b/meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb
@@ -33,7 +33,7 @@ RDEPENDS:${PN}-ptest += " \
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SH/SHLOMIF/Error-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "1a23f7913032aed6d4b68321373a3899ca66590f4727391a091ec19c95bf7adc"
+SRC_URI[sha256sum] = "34d382276c0fb0d6b38355b94c96a30b12d834d5662eb53f088ee25e3e712924"
 
 S = "${WORKDIR}/Error-${PV}"
 
-- 
2.43.0


