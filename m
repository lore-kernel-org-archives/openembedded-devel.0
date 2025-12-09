Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6901CD3B7FD
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 13:10:12 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7302.1765285806183285691
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 05:10:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=D8suTnNa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=24386082c6=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B93TGHY983056
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Dec 2025 13:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=j7HOAvr9ICylWkh4XVrMhBYucVZiw+bTgJ1ySWcTgSo=; b=
	D8suTnNaL3K3P21zIXpr2Vx4QHzMyom8Kc9oGNXeSv8GUFAbsTEH9Zp+mknfTlUZ
	mOl34H5VZ4e1UIwc6O3ndPx0L2dgx89nW9bLzukz0/9kH4AVYjrlgMxcT23QN0F0
	yJk153l0D0T0NEaLscvf44JfsI+rRtZ/F8m5YSq9hH/TIJeQQUmUUg4XOcXm+A0i
	QSU5fY1RTHe+Zdoc8JjU7Gt+eAkOWyTozcYIXqrYejZscOkbFcMZE2mJbEj6IEs1
	ceppIfwADFzqxxmTepWWUJuqCAdNwM3qWjCOxeHtoGXFb0c1olCsnDWMaEB7rKl0
	dMkRJsE7BIoNxMEMwOkTKw==
Received: from tut-ex02-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4ax6s4a888-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:10:04 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX02-PV.KSTG.corp
 (10.0.10.191) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 9 Dec
 2025 14:10:03 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 14:10:03 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH 8/9] can-utils: Add HOMEPAGE variable
Date: Tue, 9 Dec 2025 14:09:12 +0100
Message-ID: <20251209130913.388053-9-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251209130913.388053-1-pascal.weisser.ext@karlstorz.com>
References: <20251209130913.388053-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA5NCBTYWx0ZWRfX1oBZ6y5WC1nH
 eBSv9Uanz6NgeQqiv36DQ1vtfKPQ2QPiojB5Dc6ansj485jQyb5HhCzOWkn6oW9efCk6JleDqj2
 P1JU+bCyOmAWFeM6oBFcD3rvQ3VzdGHtvvxRAHh/VaiJV4YEksgcxypxWE0z5OoFLcTWmFcnxoy
 pZ3IURRmA/ZWylxD3cwKlqtdZMuwTViswqt0NmqLQU5/ma3VIbDCj1UcOkaNQmZQfB9LtywEmlY
 5NrnvBb+E05waO8SfW8GZQVsj4syPQ+lUa5/Up6kHHQCARY0gOkUU1j9lO6iCj6Cereal8723a7
 pbglLmGZIDNbdjLHTUyS/3bRw2sgA5ZrD3RsuhXLw7QzzODJ15/HSNOMmB4pqH/DqIMiyxgQnce
 QRC8zZmYkJqT6qEN54GpzhMegBA1eg==
X-Proofpoint-ORIG-GUID: VyS8AuD19_Vqc7JJaGzZKBjKu9G9ReYN
X-Proofpoint-GUID: VyS8AuD19_Vqc7JJaGzZKBjKu9G9ReYN
X-Authority-Analysis: v=2.4 cv=N/ck1m9B c=1 sm=1 tr=0 ts=69381fac cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=n9SCklZpAAAA:8
 a=k7wnS1qkdw-vfq6QgNAA:9 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122454

Add HOMEPAGE variable to can-utils recipe.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
index 5dc41bcb93..9d55f324bf 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Linux CAN network development utilities"
+HOMEPAGE = "https://github.com/linux-can/can-utils"
 LICENSE = "GPL-2.0-only & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=44;md5=a9e1169c6c9a114a61329e99f86fdd31"
 
-- 
2.50.1


