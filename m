Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38F6C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 12:13:32 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web11.7079.1718280809983796563
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jun 2024 05:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=nV+yHQPB;
 spf=pass (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45D2hXXM032034
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 12:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=3KNOgwuvdw6y0VlZTNeVkhFBsQSlzK3c/s5W8akBsJU=; b=
	nV+yHQPBBOCe7eLI3qr6nZxB1axfovsnpXBkcj/NGAEAgs9eSuaWW/lmwGY0uLfO
	xZqowvVpenZ1kEK5R4CBKxpzFmV9uPMKa4C8oZqsslZsXc6mrdau9aHMxm3h48C3
	5xqfgKCMyVKYw87Ckc7iyivs9V6fX6o2Ar6s83R9CQ8cCILGj4/fiQUow3RhwU9m
	XKEfPc3xZR0WmmAhhRZfd9WRajSgYUU5hrnCwzxdxuUsDoMP9ItAG9mANn1maFgU
	CNKWDzqsOHxPsOBJW1lcREnifMU25ni67v795PpYQc725FGVfbP4BD+zSYACN6uj
	T3paM/ZRjeE9QiH2X8CHQQ==
Received: from tut-ex23-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 3ypjq9x8kq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 12:13:27 +0000 (GMT)
Received: from TUT-EX21-PV.KSTG.corp (10.0.10.225) by TUT-EX23-PV.KSTG.corp
 (10.0.10.227) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 14:13:27 +0200
Received: from TUT-EX22-PV.KSTG.corp (10.0.10.226) by TUT-EX21-PV.KSTG.corp
 (10.0.10.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 14:13:27 +0200
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.226) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 13 Jun 2024 14:13:27 +0200
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH 1/2] libblockdev: Add missing dependency on e2fsprogs to fs PACKAGECONFIG.
Date: Thu, 13 Jun 2024 14:12:59 +0200
Message-ID: <20240613121300.156560-2-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240613121300.156560-1-pascal.weisser.ext@karlstorz.com>
References: <20240613121300.156560-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 1v4whYgQGSx1-Pb48g-UUdVo5sE5ILqt
X-Proofpoint-GUID: 1v4whYgQGSx1-Pb48g-UUdVo5sE5ILqt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_04,2024-06-13_02,2024-05-17_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 12:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110891

Related:

https://github.com/openembedded/meta-openembedded/issues/832

Signed-off-by: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
---
 meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb
index 1ad8036d7..5815daeed 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb
@@ -26,7 +26,7 @@ PACKAGECONFIG[lvm] = "--with-lvm, --without-lvm, multipath-tools, lvm2"
 PACKAGECONFIG[lvm-dbus] = "--with-lvm_dbus, --without-lvm_dbus, multipath-tools, lvm2"
 PACKAGECONFIG[dm] = "--with-dm, --without-dm, multipath-tools, lvm2"
 PACKAGECONFIG[parted] = "--with-part, --without-part, parted"
-PACKAGECONFIG[fs] = "--with-fs, --without-fs, util-linux"
+PACKAGECONFIG[fs] = "--with-fs, --without-fs, e2fsprogs util-linux"
 PACKAGECONFIG[doc] = "--with-gtk-doc, --without-gtk-doc, gtk-doc-native"
 PACKAGECONFIG[nvdimm] = "--with-nvdimm, --without-nvdimm, ndctl util-linux"
 PACKAGECONFIG[escrow] = "--with-escrow, --without-escrow, nss volume-key"
-- 
2.45.2


