Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C79CC54787
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:02:49 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.37569.1708333366690951204
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eqRY931Z;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333367; x=1739869367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=SFK5Gw+e2/eTENgQHhYp5D9LJiVsNsPUpIkFI2Y2Ocs=;
  b=eqRY931ZGUQCDzDux+ob/mfz9vP0YRNHk0x9Hjz6Ly08A8CgeiEYNbXr
   Rri0CkOQ3q9gyZ95EC8utosH9XuZm4hL/BoIrWExCB8i11wpf++z31vdx
   7RW3q2iNuP3pWSb141eEqwZ6Hv2PIVCMGWDm/d94sN4VllJAgT+oOJMgi
   acO/TwNocEbS5q/aISVobplKGaNtd26Leodi4H4s5b9K2LIjCOxhO1NLG
   nLieSZolFwX4vmriY5l16Mg0N4T8ehdroSlINcLFVFTii6VGQgKu2fMky
   TwdXBvQ0fE5apnZgB30m272g3rJQ1+q/AaSRRuzZlqGIkUui6kGFvHAVm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="149750370"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="149750370"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:44 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7FE224DA5D9
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:42 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A3F6CD3FF9
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3668720099594
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D9BC21A006B;
	Mon, 19 Feb 2024 17:02:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/23] mpich: upgrade 4.1.2 -> 4.2.0
Date: Mon, 19 Feb 2024 17:02:15 +0800
Message-Id: <1708333346-17704-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
References: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10-1.774200-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBLpCLN4NR43un7
	ya/+V5vjMzTo2qNcI5aysMXN8ch2JgE4dbnyjMJa/HTKStsDGMLBOVz0JwcxlwV9fM+V9jt7DrG
	3Q1PIT6gWm/gAtjCd7AYUFsN5WfiFzmzFHFKmrOZvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe2hKvDc1vo2QC24oEZ6SpSmcfuxsiY4QFP9cyTzXQ/pip9R0cXGxfsxRzUqAyOWqQOisx
	yAcTfNdSTFLmVSI5G17EsfPI2ERyruGqig55nYzhJAT05EPWBge2ZX1p8OSSOx9n1XpDqsJmC9S
	iJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108857

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://www.mpich.org/2024/02/09/mpich-4-2-0-released/

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/mpich/{mpich_4.1.2.bb => mpich_4.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/mpich/{mpich_4.1.2.bb => mpich_4.2.0.bb} (92%)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.1.2.bb b/meta-oe/recipes-devtools/mpich/mpich_4.2.0.bb
similarity index 92%
rename from meta-oe/recipes-devtools/mpich/mpich_4.1.2.bb
rename to meta-oe/recipes-devtools/mpich/mpich_4.2.0.bb
index ac8094d11..deb459ce5 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_4.1.2.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_4.2.0.bb
@@ -3,10 +3,10 @@ HOMEPAGE = "http://www.mpich.org/"
 SECTION = "devel"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f1804c45b8b4e816e53eb1f175d810f3"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=7a88f0d96d0d7396a7c66bf353235b62"
 
 SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
-SRC_URI[sha256sum] = "3492e98adab62b597ef0d292fb2459b6123bc80070a8aa0a30be6962075a12f0"
+SRC_URI[sha256sum] = "a64a66781b9e5312ad052d32689e23252f745b27ee8818ac2ac0c8209bc0b90e"
 
 RDEPENDS:${PN} += "bash perl libxml2"
 
-- 
2.34.1


