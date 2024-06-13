Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C75C27C7B
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 12:13:32 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web10.6990.1718280810486327148
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jun 2024 05:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=MyWFAr1W;
 spf=pass (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45D2x212012212
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 12:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=qYjuFGHmP0xOes4zBoCQyc4XvnKugSIYnyehw66NYfw=; b=
	MyWFAr1W4a6D60rb+y9xB4LJprh+/dINVvE6AX2jGCtXEEGKH51bE45sy5E1Rcye
	+1s2duj7gQfBhJ3Op/na5Af5roD9OLRat30pfxrzh6pQrjBaDFczlbQvj99gr49S
	vCX4P9D8fNPiSnnKp270i7ZEW3JMaLvuVoLo/JB9GPLCRZJTsP18xPOVeN7VoaS0
	bznUa09iPaEISVYDbxicQXYitwz/+HoCptFlgcvBqPcnNWta+ZaQArdszWbaUKsT
	/OvPtQwIEFeDV0Fqz+V5Z/dlgjUFOmgpZl5MbcoOWeubpFOsYfQ0PU0WSNskjWb9
	3h8JvDrzt6fm4n90jOaKxw==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 3yq7nj2xhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 12:13:28 +0000 (GMT)
Received: from TUT-EX22-PV.KSTG.corp (10.0.10.226) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 14:13:28 +0200
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.226) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 13 Jun 2024 14:13:28 +0200
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH 2/2] libblockdev: Add missing dependency on keyutils to crypto PACKAGECONFIG.
Date: Thu, 13 Jun 2024 14:13:00 +0200
Message-ID: <20240613121300.156560-3-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240613121300.156560-1-pascal.weisser.ext@karlstorz.com>
References: <20240613121300.156560-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Aw8VLQcB-Y8RcLpF7EPY-Wpgt6bRHaC3
X-Proofpoint-ORIG-GUID: Aw8VLQcB-Y8RcLpF7EPY-Wpgt6bRHaC3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_04,2024-06-13_02,2024-05-17_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 12:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110892

Related:

https://github.com/openembedded/meta-openembedded/issues/832

Signed-off-by: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
---
 meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb
index 5815daeed..fb778005f 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG[doc] = "--with-gtk-doc, --without-gtk-doc, gtk-doc-native"
 PACKAGECONFIG[nvdimm] = "--with-nvdimm, --without-nvdimm, ndctl util-linux"
 PACKAGECONFIG[escrow] = "--with-escrow, --without-escrow, nss volume-key"
 PACKAGECONFIG[btrfs] = "--with-btrfs,--without-btrfs,libbytesize btrfs-tools"
-PACKAGECONFIG[crypto] = "--with-crypto,--without-crypto,cryptsetup nss volume-key"
+PACKAGECONFIG[crypto] = "--with-crypto,--without-crypto,cryptsetup keyutils nss volume-key"
 PACKAGECONFIG[mdraid] = "--with-mdraid,--without-mdraid,libbytesize"
 PACKAGECONFIG[mpath] = "--with-mpath,--without-mpath, multipath-tools, lvm2"
 PACKAGECONFIG[tools] = "--with-tools,--without-tools,libbytesize libdevmapper"
-- 
2.45.2


