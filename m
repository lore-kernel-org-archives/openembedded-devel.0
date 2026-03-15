Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091ADEFCBAD
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:04 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28884.1773581757481437802
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YHVNtc3W;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1015; q=dns/txt;
  s=iport01; t=1773581758; x=1774791358;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=1BbhxScQX0kR451qkDZatQ3fIdJSqS6KduDymUVOiF4=;
  b=YHVNtc3WnaK0dJI1O7ybo12SpwiGnQlFcsF4OeYF+qXZAFSyrN3Ztvz+
   qhv9zIbB/achixfcGJbjYr0pTaauP2Oi6d3rZclTbU0lTpj3LWJvhglLP
   mhe+T48Tu3ggrtuRVTklyjtWkc3Kjm5/cT9GfyfGCnWMabYvyJg1bqyxR
   /rO7neyTgaLZmVCdClinlI8ngghqfaqAT5o+uU6QzMLyfXAcM8pO/i8AM
   QZomWlfwI/fkjxJb5YIucnfkz1eCl8vN36esVzLvgjvszqD7K2ThdtZn2
   XtoERw7I1ov1jLbTuoi1ehj74PtjF8TDOsKv5F0CNrO5uscUNAdgO/Y3Y
   A==;
X-CSE-ConnectionGUID: valqVkHvTCi0foIGqmbM0Q==
X-CSE-MsgGUID: NOrxnDx5R6SGl/mZWqMa2g==
X-IPAS-Result: =?us-ascii?q?A0AiBwAatbZp/5P/Ja1aglmCSA9xX0JJlCqCJJ4agX8PA?=
 =?us-ascii?q?QEBDzcaBAEBhQcCjSICJjUIDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4ThlyGWwIBAzIBGAE9IDErKxmDAgGCcwIBsX2CLIEBgygB3HkBC?=
 =?us-ascii?q?xQBgTiFPIgZdIR6JxsbgXKEB3aFEIV3BIIigQ6Bf5EtSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4ELGwcFhRoPiHJ0bYETgy0DCxgNSBEsNxQbBD5uB?=
 =?us-ascii?q?416PYIzAT1RgUdoAaYcoQ4KKIN0jB6VOhozqmuZBqRZhGiBaQE6gVlwFYMiC?=
 =?us-ascii?q?UkZD45fzH0jNQI7AQEHAgcNAwuBaJF9AQE?=
IronPort-Data: A9a23:m27/JaO3CsBYpcrvrR31lsFynXyQoLVcMsEvi/4bfWQNrUokg2QPn
 WVKCmiPbPuLYjegctpzOd6w/UxTsJTRn4I1GXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVjlV
 e/a+ZWFZgf+gmMsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6+tnCFgIPq0Gxs12WW9J1
 NMBLTooNinW0opawJrjIgVtrt4oIM+uOMYUvWttiGiBS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzM3wsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQvgeGyaIuLIofiqcN9uGGCt
 mTq7znDXCo1MJua+wWc13v2ibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRul7fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:j9E6NK3V4Wm9Vhhao4BwCAqjBLMkLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddm2wUMqyXMbC85vyKhzWFLw==
X-Talos-CUID: 9a23:wjCmR2Nrg36vwO5DRiBj7XAXOt4ZWXyFwnDxDFa9A0MxcejA
X-Talos-MUID: 9a23:1W5wRwSz1Cz5QST3RXTKoytyMut4vp7wM28J1pA0hNChPHZ/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="691709603"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:57 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 424B818000277
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:57 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 695C6CC8D6E; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 21/24] python3-sh: extend recipe for native/nativesdk builds
Date: Sun, 15 Mar 2026 06:34:38 -0700
Message-Id: <20260315133441.3034831-22-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125232

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require python3-sh to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native/nativesdk variants for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-python/recipes-devtools/python/python3-sh_2.2.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-sh_2.2.2.bb b/meta-python/recipes-devtools/python/python3-sh_2.2.2.bb
index a84017a393..6e512daa88 100644
--- a/meta-python/recipes-devtools/python/python3-sh_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_2.2.2.bb
@@ -21,3 +21,4 @@ RDEPENDS:${PN} += " \
     python3-unixadmin \
     python3-fcntl \
 "
+BBCLASSEXTEND += "native nativesdk"
-- 
2.35.6


