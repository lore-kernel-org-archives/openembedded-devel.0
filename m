Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C7EC5475B
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 06:47:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16906.1709275667414619785
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Feb 2024 22:47:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fi6xORDH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3790b160fd=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4216Kcek015630
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Feb 2024 22:47:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=IMUfTGP1Sx5IwQP+WS
	aA4kgGd5Odjf/Ffe+ALeuoEGc=; b=fi6xORDH3efqysa/2yPJdeWkY3T4zz3rf0
	kWkn4eDVw8iiqMYhgrVwMd8yz/YbHK78PDzb6oNIZM1MPtVo6hjocgzpnfqIMdDJ
	Dg5B8oQVeNrOUIsRbr8rSDqNKgKvM5iuUNCIN7ttewZ3ewylQKYY4UH48LdGsTUH
	vV8lYwGKrLFFpr5nzLqIK7aYyGGIFIwypyxFbYafrcVX0OcqIOPQwWiD2HzFNy+E
	HVDH24gJjxLOJFz0JT3Qd1KmQTlZb8k3o4x/KuysfnjTTKUcUoegGauBzMbv3TdP
	KbaV1g9+mnn4YgtB7KBiGjIH+C9pkyQPVkyAk6QmJaGEdnNB3Ryw==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wk755g3tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Feb 2024 22:47:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wy/dnT1DegqRRnCaDhFltSTRvSDoPaQjFhoV0Gu6JeE9VCK+1ybL9rdY0jjz33Hyrkw57rzREiJ0+sWLx7UFPzdRZOS3OTQsx3dZ3cDBteMtTaUeJfB5JQd3AdMyJMRN14uzoprl2qoJuSPHAOXxbCrVTvWQO72CnHsHmRvSuO/S0PYPZTGHCf/BoOI32FcF68KHXoCPVZLYNhTWm4GRw8LXlUSBig9gsOUwK0w22WgyjoM6JBQWemmFBmgBd6n4/bYR7gJ7sIpP2gH6N/qWFjSt3I4vW8pBm221j1ohbcuKzv6tp5N/JgoL1BIx7cNhXZyUWmuUnjHilsU0cQ2l1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMUfTGP1Sx5IwQP+WSaA4kgGd5Odjf/Ffe+ALeuoEGc=;
 b=DdSq+2mMwK2imSMwZQPmO1BJjdkQAjWj1a7a/MVBsrWkgsotXoyvsVHZbAyuFIMmstc2Cs2yX53NBKkIL9/uFINl14ifYTlR1EdmRr4eLSW55g7Ku6Xq4uPFTulO2v3Yx5j3gWvDRSQBQyfwtOTscdZh9XWoEJdxI7UG1SdsojNVJyLYA+iQZUGmZwQS3c7q8+G7lQnFfnviDQMwFEelnFtaQHOqBLrZAqsBafA5sN6ASO9+8D83+kbU555esF5x+UfHshcsyxdyBe4cXwjQqxf4QnmCrPgDxxc7NUv0Y+jfbpI99cEuZRbMtHtbdI2NRDYI+F84i2KyEe2pmtoIgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by CH3PR11MB7793.namprd11.prod.outlook.com (2603:10b6:610:129::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.16; Fri, 1 Mar
 2024 06:47:45 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%5]) with mapi id 15.20.7339.024; Fri, 1 Mar 2024
 06:47:45 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] openvpn: upgrade 2.6.7 -> 2.6.9
Date: Fri,  1 Mar 2024 14:47:35 +0800
Message-Id: <20240301064735.1844405-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0003.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::22) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|CH3PR11MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: c4f0861e-3a25-437f-d422-08dc39bb8004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7AvyW6zorpIsgKH0MFgm5IS3mbb6IlXO2TYNxyjIfAnm7XOEp3iUB82/dEgpkhkvpRwfI2Qb3ICPDLjjUEKHaN63J/nDtaCTq1WS49u6j+lv3sH6/mDDV05uKfEeY1jjE99cUoG9ktwSmphwqS35jjsv0eYCJ0orwJG3e6cwqlQOZAgW6mdjGjHo5rcXsKbkq4APIax15E5yNpYbYQEeF+i8KPPiYLtwQGyFctOibVpH0KVYY0SO9pqfu7H7z2PIZC1DrkAlxn6mrPHBs4eGI5gcAU54NmJAqlM7IUWEBd5+qreLKXPBmPQs58W9/s38ZazXiErqvKMdf8QdxOfKWUuSY8BE9CKbm9oTT5NO+dKb2A57kEmLn8qXJxs5GAc1UtCT+M4O6WZXyE47JlrNwG6OS/1fdHNJRhJsWz9zL+u+2Hti+bsvb4oc+WheZ9qLUH3BaY8X7bQg9f9QqHHIm9Gz5XcqEKuWTxL5EnEuSclaGJBDtm6aaEw/sRDyH6qhuKT+LdcuIGXgiusbm20xUPEghJgcs5UYW3pHWFZYHEJuBIvOZ9jhk0efAGdvK6j1SvFpnwF4uOJrlIVNYX3Ykwp9mNp4V4YaCQI6WU7CXo3xZuqk1AAkxkGt0PZSSjQ/vAf3yAXI+tNccG9nER3STZ3VGWpzC9XgmShH9KH0yKjc2+Xa2kGhsr3zVmxwnOsI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PBoluvWRlBngWBCXi1iCdmeytgY8E461wFgnrcmSKaaMZdP/XhIPu5t/3Ur+?=
 =?us-ascii?Q?5Me3VqD6EtTvBm0L1ygLaCpqZp+02BRmuIcbjpNBgM10CGFCwwSwc9pYsu4N?=
 =?us-ascii?Q?1tLyMGzmBtCcWtwpoWqP4bX/svWt81IUHbnEWjAPH/IZ0ji6Y2ydr2FSOmed?=
 =?us-ascii?Q?34AdnkArsW5ele1h0LLFraGoyzdt4CRiW7Ke9uCgjbJU9FCtrC4AOjAdLZ2u?=
 =?us-ascii?Q?2DR+yih/VQKAj1M9QwojNSOz5Z5EfmT8g/NSUFbvMCwW9DE4g7L1T4Tahn+b?=
 =?us-ascii?Q?DlqnFSEgE5eR9iFtaS4DfSmfZ6KEGb5Hfc8R5qbaOHCZxQ5aEpUDiE+fgkWZ?=
 =?us-ascii?Q?hgf9oMH5x1sc8D1qHy64avjZtNVsDOLqaUhJO6QnlTQ52+bcW5wOKskkWIS6?=
 =?us-ascii?Q?8c+FX7QgftcKOYMZozbeGYZkjZmMlxLG+lPedwiNhPTT7RpG8L5TAOtcblq8?=
 =?us-ascii?Q?hU65tYcKsit2tw98vMTu2tlVHZl0lawE5wRtVe1iiK7oX8nqYT1gsviranRX?=
 =?us-ascii?Q?P80YRjZVhHBnRkguuSDPePOdSgz5xLCq+oOfY/5gpMKl/oQONa259iq0WsvX?=
 =?us-ascii?Q?PQxYWM9f9qemBQMYvMnlfJu0LuU52PdtOZk2BF8bE1KRTR5cyEWCCMC3ssIb?=
 =?us-ascii?Q?LEqdh00nGqVOmTWrnVY5tWgRddw3vLIZYoOoepZbkCrhtX6ETa4oTAfq2IHh?=
 =?us-ascii?Q?rE9PXcu98g5AQ48DLFnCdrcUfRCJKh/GqkYY1iuPOcoO/cQBkeezj+bjvquP?=
 =?us-ascii?Q?fHHV/ULFY9qic8HA4r13TyrnpxA0VBVqM2vapl7dD48vpwOuL8e46C5SiG+3?=
 =?us-ascii?Q?OKEkT+XqZgYz0vWVGiQCbXoxb5jubufQgrZyuGkvfl9a2kPLz/pLSd54+zk/?=
 =?us-ascii?Q?AA+X584cyN6cWSisYB4Dtbl3hlNSHON2Fc65syfqpbn1HH3tOPXgKHKuc8+o?=
 =?us-ascii?Q?Mvel51I5FY4+UK3YcPjwWD7ToydKsMzaH7X4SN6BefjX10MwC9WTgxwuosYA?=
 =?us-ascii?Q?qSKqDROtrCjHzwGJmBbJLZcHZ5QpJXvY5R4G3l+edV/e+xU/4tdQXbwPgJTW?=
 =?us-ascii?Q?Pckv7xT8J4vIjejDt/AhODua3Dda26MA6gftBMfh/IVsW4iVvIV+3H28ai+c?=
 =?us-ascii?Q?RMSBemmGuwe8W9iOBfhTQTyZGi6v4BaZ7a6IpjbfOgyMii1E/vBH2gzvir/t?=
 =?us-ascii?Q?nOw47JT4YvOjE2xMfqCojC8uqyikzayY/2vUj4nSj0Z1yiEqmZcx1i22+OoH?=
 =?us-ascii?Q?Kpoubd0WegBmOY2HSehWKsnC9+94WVjsE8kHNs+ziyyysAkfqMmvmCWn/Ak3?=
 =?us-ascii?Q?RW1zcaY8Ca8rR8I4ouCgCKLHVN0S4dy5Ne29Ie4L/6k/MgqbktZluu11TJTx?=
 =?us-ascii?Q?7uLX4hnz7QO8Y16P5ZqBxErs8Iv8EZXRFk4C9f00qWGoSboEjfcGX52QB3CT?=
 =?us-ascii?Q?TulmPnWWvV+e+X00b3uYiPC3Di15HX/nBmtQSSt/P2BI88N3g8e/26URUnVb?=
 =?us-ascii?Q?Wg3UzUa5ApVIX0rvSmQ2yNCUiILat82mpsiIt67wEJNng/ekIBEZuUXw/HX6?=
 =?us-ascii?Q?h5g9owhqcpgMwPFHNQQgvGRPLUOVFIJW7yT7Siud?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f0861e-3a25-437f-d422-08dc39bb8004
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 06:47:45.1114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VP4IAkYO2Wmj9p9ZJzYgpLcsTFCxFg8Naudn7kNmWBJvQFnbopyX8cntG9/PYxaykCZuhOOf4SHBaTHMOWeyew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7793
X-Proofpoint-ORIG-GUID: y9oRQzntHob882lK1OIzn6RCHHHkZYcz
X-Proofpoint-GUID: y9oRQzntHob882lK1OIzn6RCHHHkZYcz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_03,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=867 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403010055
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 06:47:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109069

License-Update: Remove conditional text for Apache2 linking exception[1]

ChangeLog:
https://github.com/OpenVPN/openvpn/blob/v2.6.9/Changes.rst

[1] https://github.com/OpenVPN/openvpn/commit/20bc8bd5af9d1ee0489d0ee58ae9c2c2f9b0cf9f

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../openvpn/{openvpn_2.6.7.bb => openvpn_2.6.9.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.7.bb => openvpn_2.6.9.bb} (95%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.7.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.9.bb
similarity index 95%
rename from meta-networking/recipes-support/openvpn/openvpn_2.6.7.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.6.9.bb
index 323abe32c..3af6b30a7 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.7.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.9.bb
@@ -2,7 +2,7 @@ SUMMARY = "A full-featured SSL VPN solution via tun device."
 HOMEPAGE = "https://openvpn.net/"
 SECTION = "net"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d8d34ce6390552676e4ce8279f13c48a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4b34e946059f80dcfd811e8dd471b5ed"
 DEPENDS = "lzo lz4 openssl iproute2 libcap-ng ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 inherit autotools systemd update-rc.d pkgconfig
@@ -14,7 +14,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "ee9877340b1d8de47eb5b52712c3366855fa6a4a1955bf950c68577bd2039913"
+SRC_URI[sha256sum] = "e08d147e15b4508dfcd1d6618a1f21f1495f9817a8dadc1eddf0532fa116d7e3"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 
-- 
2.25.1


