Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39596F4613D
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 15:46:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20889.1774280803739267891
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 08:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KyF06Qlj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7542070fc2=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5tAeQ3100785
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 15:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=6yR+clM3NXfNeNHds/2x
	UgHxUOCCKuH5BaCKIuaG/r0=; b=KyF06Qljs/2waf/2iXRmldaUGVmeVkQGDy+g
	WtVbAXPxb1u4TFlk+ns1obfNbXgHF+hlgLBVHX8FHpEImTgnPR0WARbIM89R0EB1
	rCjG0tD/ibqSPNV6ApT7VL9DieSKEVQMkAarV9ithGqzXpAYx9CZQVgP7H+yTEec
	dDPbKXCAVc8inDExbdfs0t3MorH9Au1sHEpecps8srBb+jCSRayo3NKr/I5OlT/I
	Jj9R98bwMWv7mbX+59qfSYNdE6mTy/HaCjNjTeoEYDPg6dslepKrCKF9EmcRm7Oz
	F1vlGWWRwyqmltVqFGvZPFeCzaER+mdaNvwTGPt9Eav0TxyChw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013049.outbound.protection.outlook.com [40.107.201.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1gj824mk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 15:46:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKyQJlP/6C0LceAsQV47le6EcPyPZU/Sa50S/9Z+k+YoaH6QaVX4J41mWcHbSa/P09iBAfNMbpqSr04NglpeDuUDe6NU5UbA2pdX7OCjGfgKwXQe08KtLsBEzx63mPsNazq4RvtbbkWNjbS/+sIGvhSUa1w4fMor4t5RQnz2TrtWuPoVpB0jGXlmcLBiWGsZBp3mHL+gbhxIGe3sr1uM3bQ0C61JYmymnL8NO0pjVSu+ILuf133+PFzyb9EKcByKTBBpNvGA3GieDbjaSK3GRAwYuT55aeBSUsvXBV1Qg01q2ho2Dl8aMiCMD2G7jXQMSzobOnGCMeYfzATjJp1i5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yR+clM3NXfNeNHds/2xUgHxUOCCKuH5BaCKIuaG/r0=;
 b=A12SSsv5yS2JFeahEp04BSB6mx2Mi8MMAAZbOjgD/bLS3Uzi50wkYwNKJ58RPl1F4iuxJvZkXEvYuDq/ZMqwY8iaPRl2jGhqsfTaqC7YbVgubLkQ3LcG0dz+RRCz4I6MWseYzqpNnlXt9GQnwfzv2TIwf+pJ5+sHhak7bFCAwqsPCYyTZgOtkNXK3d6F4mPYa8bPlMeIc0vyR7sy6+ppGSefbBAS3rPEEJ/YGkfuPtf//zXshTpGr+y6B4pHx/CTPmhd4VAM28Vco1q3yClpzUx401lG454hLRg6yf4wuJesq/9ID7eZcqEeLRjbTAHnRfN8sDJ7/UU40JI72sP/KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB9469.namprd11.prod.outlook.com (2603:10b6:208:5b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 15:46:35 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 15:46:35 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] frr: upgrade 10.5.2 -> 10.5.3
Date: Mon, 23 Mar 2026 23:46:20 +0800
Message-Id: <20260323154620.3176805-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:195::23) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB9469:EE_
X-MS-Office365-Filtering-Correlation-Id: f0ed2a35-283d-4745-bf4e-08de88f35cf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	mu+ydF98FobYL56smJPoyqDCXbs1MAVmkVxr3FUwA1HK2to1kw47LcWLxeFhmJmgb6H2tF4VolAsPv5C4lGBul9rYrtbmQr8OBGTeJk+G7QAIF6yVwvXSZ73yvmCFELBcYqAMXvte0zxPcRN5/SuqvgP5IxftiFQYZ4V4wbL9bqvaiiiZtSnwuThVpM3onf2DxbhZbw7OnNqcJdzDN4d0+56PnVfybObSKkhQgtVrrJnAlI4/nE3nGWDm3XG8I++Y2DjbyZdtqQhSny5VM3fPpAN5Eml4xB9bi4FR0VDvHgszEC7dYFWBk59YHppKkYhgPy7egg4NEgEoA47Zhj2YvcUJVXNR8KZXYK7xzukAowRosxvN0PgQZsHCax+YiI5pMvF/NOTgCWUfxmU6zoFDhnatb83ll6qv9Kj/eti3AQ4HRgLRnX6/VayFCjljjKlax4QFahDmncHvWIgVIrwX669RC+7aTtSsQKLJkvhldtRbTHvuXUaBNKvt8Dz3FhyXWGKzLF2cHdQqgJ2nUj9RUHyEV+ZIF2jWkQCK6wvox9Ckrt79mzMuePR7P9j9QrHezbTYzTGXLfY7eBsrXdmcsNECkji81vVFdH8wCR39KHmqgFh7XE1qy228K6lgiXRHO9iOAifiIqiZTk6Nc0fkzr8KTHe8FdQejvIL7Yjq4E25ToPUO2c23I9iG6IMjpjpH4CfV5F8aPVWsOw9I+YlpzujJjjHKVNhh6sBJL9LJKxVyvzmExozQpeMLtpwfnLpvll8Zkhq+k9jK1rFLMgyNEGp72PRKpl076LC2F8UQE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DOUbd3KTWPR/Hq/+X7da7JrSGsp0KjcCyoFuBL2DvmT45IQAn6JCr9FLPm9G?=
 =?us-ascii?Q?7l+GBNylCxQdGkUxOsit4lx2pa+myKUqLIVtb0r7QL6nskm6CFc/iXiNkcOV?=
 =?us-ascii?Q?YDwfrMso45DAvSNFj2TtA1lFZ6MwCOAd1euRxCI5FrlU/c0D3XJ1Didd5B1c?=
 =?us-ascii?Q?DupEM3335oigy+4CDcmDQxD5QJz6C5X8M6x61+VE72V6UvlA2jouc6+PZXtu?=
 =?us-ascii?Q?/LXVwqM1psiuM59yJxSO9iktsgbX2wWT3qNtVhYJxIjnZaXZlYEnPRCJ/d5a?=
 =?us-ascii?Q?G7heESlj2kHbAd3Rgjt4ad+35CBN3RxxmbW2UPFo84kDdsJxuh9ZCzCLUAut?=
 =?us-ascii?Q?DDbIN4uSQmpxfcytlmD1krmbrsZWqsQeWSa0ESjrA/toyEwD2klWFI1KlY+l?=
 =?us-ascii?Q?JnvrFjqn7l0Vq4uFzHyDMjTF9LV1YV+8ZaANk5cVcLT0x9gluD/4hvM4tFUA?=
 =?us-ascii?Q?Hm0zXno3gOiOjrsgExdgqbggq/7kf3j5Vz541AhxlWBZaBnMid1XMW3iHqGk?=
 =?us-ascii?Q?ln/9ynYJkbR/AESLES9INh6slqiQM0VPVOc3E5cPbf9YPqRCHgE15nqAtFcx?=
 =?us-ascii?Q?5xsgv7sbtsexA5LrnAB7sVseCwEQ6NufwJqslPGJ2RTcMXy9KprOCikpJFgj?=
 =?us-ascii?Q?/ThnmYRqdaDk3DYrGHh4+wfayI1gn3CWnQJ3EaR5fKqnd7gpjttgLlunT/+L?=
 =?us-ascii?Q?01dYE0IcEWoj4igQGGg+S3sHIIl9Ks5oXO8sMad+1tYVzBJi4mqN3aW5xSKy?=
 =?us-ascii?Q?+7ruOcB19qIq8pwhB2Cios7E0EkFf6B4CivryExB/rNVHmD6hw8zl9oC1qOJ?=
 =?us-ascii?Q?UJNu3SzUBCTxCUqGBg042SWGe+YRmhGPRg8GIDyre/0PG/56uxhBNkrwZ0db?=
 =?us-ascii?Q?LHXiysnfslaJ+mfeP4JjCF9bbKMn8NBwpdR4fEl3sRPOE54ElfFpnokbjLLS?=
 =?us-ascii?Q?y0YOP8iwcM++ZK5xEk65kgY9HVOrlNIA9ihR71X6r7Xp3VHKj0Ob3gYHnrwY?=
 =?us-ascii?Q?C2AuEIr8bA9jnXtzCIv3404cEy7OMePsi0/oyneuIpEo3AMHP49NG+I9AN2Q?=
 =?us-ascii?Q?YrsGTtXvVRZSo0ifsFy7L7de0ogXED00Xefv9hnghjfoR/VsyeSc0Rrfm0aD?=
 =?us-ascii?Q?Vj6tFdL0ZHnlCONrr0Z25nasAndyuK9bnh/fbRiI3zJ5CdEzRdna/AXI2HQ+?=
 =?us-ascii?Q?hkXs7bhzyGi40hfOQOe39MtQ0Pd5q2t2f5UhlYa3kHYKktre3+Yp6gZyusuN?=
 =?us-ascii?Q?2yrU3R6/NDpyQqzlcu3J7zORx0E8vG2OhoVmnmy7aON3A43pD7yt7AyAw1RA?=
 =?us-ascii?Q?F8Lrf9eHugobdVb01b99dqbSOQxQR/hAeEcJ6IR2Hf1z8JL/NHdm0/YjPkEc?=
 =?us-ascii?Q?PG0CeJM6HavS+MprP9LtueJFlexabjXrdnqu28L1VTdBpsyKnE+wCUjv9irV?=
 =?us-ascii?Q?a5jr8BIs/SBQKufFu3X53z4l0ebzB60j0XWJMSIQbYNom5jZMUQvGTOwLdhp?=
 =?us-ascii?Q?3tYJHaoYFKO9d9RR+9LRJVrzUCU+hmTd6aph2TnpQk5xGOCiarDTWOVui4mj?=
 =?us-ascii?Q?3VngU47BbJFOkqIG/lXfsoSUIvVzi6h9AgULBb3SfhoaBjIkm2C+7TAgRGWY?=
 =?us-ascii?Q?hQQSaT4OoXqi0aYxo5hAr7Us3vRi+sbYLvrFjwI+YhpgB1XwR+naoPtEU6ck?=
 =?us-ascii?Q?/i96HxcIYLyCtw38GZBZoBDc5LkAchQZQICBJU7ANiAo/VB46vEi9JhJ3hm1?=
 =?us-ascii?Q?pFT6s7GGxQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	BeiJN9aWtcJnaE2dyeLtSo0KQZimj///kabgJXnc7EGGJgFKmNlNYNOjhkv/S9VsNJTkuGGKOWGV7i1OTymegiUHo+sLt8UWKLj6B+/B+1I6wYXL9M1Oh13jLC9ok9YXRe7TqUd3nBTybCgRBOSSQ1HwqE2IhcUC7xxVTlRLgqm6fEzN1ilDIhNzI76AYSLuO8aU7Jaif9fWy4gdc/WWfUWkFvAQYb5Cwpx9vOEBhuHygBz06CnA9CQ++I0lCqGbcCUF1fZwv5D1rFHO7LC2rPQS42F2bRk2BekhQ/kXWy2mL/jFtKeGJ0obKgsIzL5ffN94zc63WJcnFyaSc2gq7w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ed2a35-283d-4745-bf4e-08de88f35cf1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 15:46:35.2858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kktrMMvZa0XXPC6hjuptP5oQRfz8428OMsDQQnA0j1ESKAqXaWXa1HOGz7OB2kqUP6QubR8wpQrYKa04VVwfOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9469
X-Proofpoint-ORIG-GUID: Kk9o6U2ChTWtS5A4jJKMvWJHtmcYN8Hx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyMiBTYWx0ZWRfXyOqVaCOiM7Xy
 iOebCvI5ZrM47Hq7s2HAdWuTrrZxUi4o7K4UFnj1cYP+0ySR9MwOjeGExqjlhdXEo9WKFoilq1N
 FywaFrZvvKWQE3LMyWG1Vp2OpnG5cQbIoCaHHkZA3M7eOu8mFPSbmoIkt8i17ccctuv3bz1zvzS
 CvUAb/W4s+P0oggzvkGkSltFZICRLaXVIWmLBCLeE3JmtaLjOprwjJEJEQLbT3nLQL/6AxNnuCG
 dQMHSZmSUna6kEVbAGaCQWgJs1b4hgGQcEKLHVCRvmMehn4CVXN9R1EYK/5mBM49KZ7c26X1qGd
 CZMEuIhQ+EFy/F+2JNBEH4DHDUyVL29/BqxtvC/JBZETJwA7QYJZ1bzkhqw3yEGJUh/dZn0DJH+
 77GjAqC9w4HopqK6k68MfPpv/JtAJXUseqvEbdaqOMUGJIC1nm7QQJAOnMByPj7xnX/ZTNI0YJn
 6b6lZU8IeL1juBTnldQ==
X-Authority-Analysis: v=2.4 cv=LtqfC3dc c=1 sm=1 tr=0 ts=69c16062 cx=c_pps
 a=Yfwwr8Yczqb7c+94X7Exug==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=yEOxYvs7AAAA:20
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=J4_X-45zbXeUUFGPy9IA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: Kk9o6U2ChTWtS5A4jJKMvWJHtmcYN8Hx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230122
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 15:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125520

ChangeLog:
https://github.com/FRRouting/frr/releases/tag/frr-10.5.3

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-protocols/frr/{frr_10.5.2.bb => frr_10.5.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/frr/{frr_10.5.2.bb => frr_10.5.3.bb} (97%)

diff --git a/meta-networking/recipes-protocols/frr/frr_10.5.2.bb b/meta-networking/recipes-protocols/frr/frr_10.5.3.bb
similarity index 97%
rename from meta-networking/recipes-protocols/frr/frr_10.5.2.bb
rename to meta-networking/recipes-protocols/frr/frr_10.5.3.bb
index 710bdf4a5d..1c06f7bda5 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.5.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.5.3.bb
@@ -10,13 +10,13 @@ LIC_FILES_CHKSUM = "file://doc/licenses/GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a
                     file://doc/licenses/LGPL-2.1;md5=4fbd65380cdd255951079008b364516c"
 
 
-SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/10.5;tag=frr-${PV} \
+SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;nobranch=1;tag=frr-${PV} \
            file://frr.pam \
            file://CVE-2025-61099-61107-1.patch \
            file://CVE-2025-61099-61107-2.patch \
            file://CVE-2025-61099-61107-3.patch \
            "
-SRCREV = "fa68c0ca04f95125cb993b5cacb64fc1495348eb"
+SRCREV = "cd39d029a48a1e58929a7f31e7d61a594c2ecb42"
 
 UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
 
-- 
2.34.1


