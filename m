Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02302F417F3
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 14:58:30 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16609.1773068301478895432
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 07:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=UEQD8eZ8;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=927; q=dns/txt;
  s=iport01; t=1773068301; x=1774277901;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Kv0lKddJq4p4vuwuf6llbeNG3Mmf1ryah7kDp+Trr1c=;
  b=UEQD8eZ8hZYzQWF8cMg92Gku0mqYg8FunB1M/QJBpKWUE8MtbAl+xXi/
   4NFqOjxAZvdHwpkXu2O35kG20FL8vJEgE3x4zJlCACCimDgxvg43YMqJt
   cGpiCsICHU46VE1PNEMuHd6Wzz/9mjMXDfxIwNgVCesDugtoFmgfvtZoE
   eu/ntt8YAFcFr69iVOklP7HxLDFUi+txsogb6mX7jI69iX8RyoCNKmKKW
   DTGtJFwQFWVnYaxrKB+wwLWI+FZ4g3q35TFwJcwC1PNVpemXJY/AWctmR
   qL7/Oadb6Wy1Nwy/dFYyw8h/QSeqV7XqvU+BIOISS/T12wrsfMundO1GZ
   A==;
X-CSE-ConnectionGUID: 5F2IRv0aQv+NIMOqUQkM7A==
X-CSE-MsgGUID: 5YuPVV4qQ96bWfVEtVk2bA==
X-IPAS-Result: =?us-ascii?q?A0CIBQDC3q5p/4r/Ja1aglmCSA+BUEJJk1tPoD6Bfw8BA?=
 =?us-ascii?q?QEPUQQBAZIpAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZchxMBdlxEgwKCdAIBrHiCLIEBhHzbJgELFAGBOIU8iBl0hHonGxuBc?=
 =?us-ascii?q?oQHdoUQhXcEgiJ6FIF/kRxIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?QsbBwWFIA+IcnRugRODAwMLGA1IESw3FBsEPm4HjWo+gjM+ghhoAaYcoQ4KK?=
 =?us-ascii?q?IN0oVgaM6prmQakWYRogWg8gVlwFYMiUhkPjl/MaSM1PAIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:wribca9sqJl0cri/p8Y5DrUD0H+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 zRLWmmOO/mIYDanKN9+adzioUICvZXcztdhTQI4+3pEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mpyyHjEAX9gWAsaTpFs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lrE9c5wPgvCFhQt
 to5DRcUUymAor2flefTpulE3qzPLeHxN48Z/3UlxjbDALN+GNbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZOE0n1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3FboqPK4TRFJkN9qqej
 j/34lzHPE0DDY3BwwWLzF+wuOyVlwquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBdCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:4Gy1Xa2gIBFbDP72rqbQ/QqjBKckLtp133Aq2lEZdPUzSL37qy
 nAppomPHPP5Qr5O0tQ+uxoRpPgfZq0z/cciuMs1NyZMzUO1lHFEGgb1+vfK/mKIVybygabvp
 0QFpRDNA==
X-Talos-CUID: =?us-ascii?q?9a23=3AZfGBq2hlEaDUz5pKE6AgiZKHpzJuL1OH7U3Oe0a?=
 =?us-ascii?q?BFyVPaZiyUGKp+4Y7up87?=
X-Talos-MUID: 9a23:jVyPfgjoIgzzLaItCzugs8MpafZ125qQVFk0wMsMhMe6GDBOOG2XpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,109,1770595200"; 
   d="scan'208";a="682903940"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Mar 2026 14:58:20 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 65C8F180002AC
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Mar 2026 14:58:20 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 047AECC12B5; Mon,  9 Mar 2026 07:58:20 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][scarthgap][PATCH 1/2] yasm: extend recipe for nativesdk builds
Date: Mon,  9 Mar 2026 07:58:14 -0700
Message-Id: <20260309145814.3435361-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 14:58:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124998

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require yasm to be available
as SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
nativesdk variant for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index 5d1739ebf3..5ba4f67628 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -28,7 +28,7 @@ inherit autotools gettext python3native
 
 CACHED_CONFIGUREVARS = "CCLD_FOR_BUILD='${CC_FOR_BUILD}'"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 PARALLEL_MAKE = ""
 
-- 
2.44.1


