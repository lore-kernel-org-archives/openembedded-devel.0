Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6334C54E49
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 06:49:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16921.1709275790692330481
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Feb 2024 22:49:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gD77lsDr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3790b160fd=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4215t28m012076
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Feb 2024 22:49:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=+oNDVhk/xm0IKVOhDKWlpChwWBL8xQDfpel8Mr5bg/Y=; b=
	gD77lsDrCcv3QgpCuMYYtktRrKfGZ936g9htViJv1QU/26Hg2z5qwv+2pvOX62iv
	eIOODZHt5K2fOFRolk+0FAyE7LP+9N40gaVtLGUgekADByBt+DmA7DP3KEgpP2rO
	gDiR0MJt7ktEoFi80OzFY3ViTrK6R788QhU9fuuGN+gHQLHsKHqNKfuUYKds9kEO
	n+IbZTWcjz3Pzkp2gk0/oyzNDO3gLbPxAdMWRhUlRNVSkhTZ54M+G14o20N/KLC4
	5ppmD3ycigOoaMl0UGCF+1eMzyb3utWb4FyJY7LdNneKEnlwIc5PSZlzeilwmUTZ
	hdiuqAUGyDuiDZpY6BDomw==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wk755g3vp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Feb 2024 22:49:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WISl+0dd82dHQmXLHpRbwfinVYCHlEFS9g4fUoVPwQEqTt8Yk9jGhMNYfFmiNiwGYpmJFrdHkfNJgJaKurZgaSlF/fzNOp6etp+YcU83he0V+E9ATjNkP7fUz9QJH53GMiWDbwLteZ6HrMTRtfK29IZBBBDBiwSnI6wImHkDved5mww1nVqKAPfjLHBDPl+rw10o53ew0KYQKZe8bAzMMICagqS1PCIEuP2hLsz/RCnHpW736aq/ZwOX31jpvrQNgQcP6pwU2EtXavDqifHeNjygn2wORWnAHfIMqJDIKQiu4IFMSOmJoxRx/1GYnTo6wQshdBDYkx5XqkV7GPUToQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+oNDVhk/xm0IKVOhDKWlpChwWBL8xQDfpel8Mr5bg/Y=;
 b=CsmSISD7pdrTjOyO3Vt/9UDU+MiV/+LD1ATS0LYf+jcza+Z8m4vBvWDC3lRM6aYAP5x2qyw8ruyI56f4mLAhNucXiJCUIvtd10lePQ0YZojoCYMKPMOKgDH5RB6hK8RL/ml2ih3dVIVM+Tpn76kmOz6cMysCB4Z1ZcG7MbW8vZfW2waFzYs5l8WEnzrAvxdV5ht8DGw6gWooTqbaU1GnxhRdV408RWAmtf+jkwbr7XdSSvBxL5BD3odsNcCkwarraL60AztHGx5Ftl7R/LImXtGrwm1V6epHnWkZEJLy2PpljvMc9PQGki6HJ5p+o9one7AAiW3Q8oxEq+Gb/upkCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by CH3PR11MB7793.namprd11.prod.outlook.com (2603:10b6:610:129::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.16; Fri, 1 Mar
 2024 06:49:49 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%5]) with mapi id 15.20.7339.024; Fri, 1 Mar 2024
 06:49:49 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] layer.conf: Add nativesdk-libdevmapper PREFERRED_RPROVIDER
Date: Fri,  1 Mar 2024 14:49:36 +0800
Message-Id: <20240301064936.1849170-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240301064936.1849170-1-yi.zhao@windriver.com>
References: <20240301064936.1849170-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0113.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::17) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|CH3PR11MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e09dfa9-bc2d-447c-3fbc-08dc39bbca1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zjzXYbFqpJ0tvvkDrG1dU5AMg1aO5DPyXtLSzT1BirXjDkYr2lSXvy8WD0iZdDPTpWFwTSfmelhtjKM4Z5rs0e3xIw/Mn2j71U60o+vVTB/xWoA3TKDEfr8u6JzkEADuryXhO6lQEny0c3sSXUxVZ/vBlFcGcwEWbUb+gQGu6betji09ebb5/vtyDB4PbG5n9N+SDXrIy3LCrzT24nKL0/CXtEi8Gx4+dpzO+rTfYxTW/KjVZM6VzR94ZTzY+X86z1FHEnbWQNfo9AhXmdgu8tJprYSfXMx+B2We+Eq73CIR25nXLvSdUeCetXrzH8gVW4iXC5jHHybDYY7yVs77qFarZBxOh0xfzDm4hdx7CXRH5Zf3v3uiVI0UNOEs7Tr5XFlBNv8F2bX2vU+cLrVzx8FCYD5x2jBX5JZ3MnzdYFymZz0tuKtigC5y6gQSLD2P44TW0maUKKGBrS8HHeKzIpaRidIS899uGFVU7I7xFgtF1gS+lr+RE219AzOIGl6afX34s/VEmvck7QW1FN20n8AXO7Tzn5Nkxkyrc9khvB9NdKhoblWqGhnjWtu0yqPoe3tserqjVaRjQRwIBsV5J6HOP4q8as7S1EmC3wubF1mEJ24Dw2zEiBcr+XnF8ADYr9HyW2SsSXWjjuJdgOv+irp9Y65P/mTXA2GaYiHXN4DOJHMdm3kVrEQ0CFcg4y5x
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EaTK1Gnd+H6Lldo4IxY0YWAgv6ov/5yBLEugV9D148eMDGmnYAwqRK9yddpk?=
 =?us-ascii?Q?9OpCqSamTx9qvgBu/zo9hXZOlCs8bPYpXlQtuotHaOIR40ubGupizxKx6GAK?=
 =?us-ascii?Q?vklujXn+jBShSm79B++GnbsI4tVD7z6XJMaBcutmvclnAaMp+LdYFV1Rqc4d?=
 =?us-ascii?Q?SNCOPCkek5yP1swt8JFsV2oubtH5SYWt4dyqVRQqULxB/uMWJPi/oDUXVs/f?=
 =?us-ascii?Q?V4NgWr8sckk8B43H/0DrQYKnwxuWcyBungxM24+fAxlginpCTvOn6O/6hPpR?=
 =?us-ascii?Q?C+cJJvrw9MZPQw0A5QPDoe5dJxjVqwzS12Ewm6TsIq3mL1M41Giis4hBpFqp?=
 =?us-ascii?Q?TQc12EfKOGj0PMPIe1AV4TS125Elxwa2H52DrSXFTiRejZEsRsMRJTcL5xGZ?=
 =?us-ascii?Q?46SfGm5r8v3+68sUr43oWF/kaytAasEt8xi2xrUVYda9Y8GqH4L3j8/PopOI?=
 =?us-ascii?Q?kLxDbbXakV+RxeXYXGv6GfeSJck76RuYmZGYlVQj4n5lpluGtkb71WsVrNyF?=
 =?us-ascii?Q?PGgQoRkO3ipnrTtKTEXtmkMFDbQ0dJgCZsrcbUadhQeOudr1A0xt011Tzoa2?=
 =?us-ascii?Q?d+Bx9xysu3DpynQ6AVHY1FqGzlEhC1LUC256elvpnWpprrUODtrPsqZPzygO?=
 =?us-ascii?Q?n+7pvS2GRz+JiJn81w8EpnLbNT4hnanNnVtO/+3pDFoWxQDEJS7/H0KW30tE?=
 =?us-ascii?Q?+7i3z/a9sgzpANo0k2hZrwrc3ntql8FKdxSfXzEyHIK1eUjuQs0LN+N08dz+?=
 =?us-ascii?Q?Ib4bGegcOFgHb+9w1MgBDD9sVAHX19tCNQyRrU3FfWZcsRzH3W4ihUxOmbpk?=
 =?us-ascii?Q?gnonzggmQQk+6XZK0KXetvrm0vSWq7Uqd2ojfVwgLCe+sgO/hD2LJUXx/DCT?=
 =?us-ascii?Q?FhGJNtThdahzH6xvU4KKBaRsS1R+D5NZ3JY/in9+HnLGP74mRs2s2YeFkb26?=
 =?us-ascii?Q?G4x05nndQjtJqdB3onDNzVru57yCcWmu3a01PRypIqgP1ZVAN7stfcKNAoIh?=
 =?us-ascii?Q?AQW99LkgqgSgT/767xQiVOS0NSc6RTht2kDL1mpHit4hH3yRDz29Ps4/rIeL?=
 =?us-ascii?Q?tXPmWKqscEQm823PEql/aJ+8IQsuHqdm9SiXtwphOXbBbWuOoZIB/hwjPViE?=
 =?us-ascii?Q?ps4ZgdJmzt9zXxDyN0gVU/8J6lVd53dFj+e8o5DO8JwBXg5gJSmRxlO1Houl?=
 =?us-ascii?Q?cicHkuoglPB15RMRcMpqgI7fox5e6Bl7EGFJaEpTT2gPG0Xm/6qQ0N/Uc376?=
 =?us-ascii?Q?zlzXUzHStJHRxxErRC61ZVzVqQ2W9o/ufegdxS/5ab10+1rLsvIMJk2JIPWX?=
 =?us-ascii?Q?RI+zD7iq9cb+GbNBhJ6nLv3UIwMQfdSMnAB1vjVxDbajVAwgVmeW+6/Y3UTH?=
 =?us-ascii?Q?paAdRGIrfhe97zzc+HevKAswYpgLlFRC03Fyp+9HR9cZqyW3xGbJUAfaklc2?=
 =?us-ascii?Q?5mLS9DZ7c/UehF40oBJtOa9ZUHpaDit52yC9C8TgrX87Ry13kMtdW0BsNizC?=
 =?us-ascii?Q?e2deWofRwlBgC+sm457Jnt59ncHGUJR94s6qe7xMRlS1QkH54bVwbmOIWLEe?=
 =?us-ascii?Q?jgO4dRW78ksT0YbaLOUyWjov0KiX/LitbOz8PPvw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e09dfa9-bc2d-447c-3fbc-08dc39bbca1a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 06:49:49.3698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DOmAA1RdkXBuRU9PFuvpQyk5fq6HMWfgHGi3uh7DK4won5pcVna4PLgbu3j17lNMP1wkE/d7QXOF6kqsgHxViQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7793
X-Proofpoint-ORIG-GUID: WWAgQi7OxU24_GqJcyY-bm6obrM02Zbg
X-Proofpoint-GUID: WWAgQi7OxU24_GqJcyY-bm6obrM02Zbg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_03,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=859 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403010055
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 06:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109071

Refer to [1] and [2], add nativesdk-libdevmapper PREFERRED_RPROVIDER to
fix [build-deps] QA warning when building nativesdk-cryptsetup.

Fixes:
NOTE: Multiple providers are available for runtime nativesdk-libdevmapper (nativesdk-libdevmapper, nativesdk-lvm2)
Consider defining a PREFERRED_RPROVIDER entry to match nativesdk-libdevmapper

WARNING: nativesdk-cryptsetup-2.7.0-r0 do_package_qa: QA Issue:
nativesdk-cryptsetup rdepends on nativesdk-libdevmapper, but it isn't a
build dependency? [build-deps]

[1] https://git.openembedded.org/meta-openembedded/commit/?id=3f64779eae2d8312f569bee863f90ec4f8176e6c
[2] https://git.openembedded.org/meta-openembedded/commit/?id=1e848281ef6ff53bb89e323a978ebd00f02cb1f2

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 6b64328c8..732a7e5d0 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -50,6 +50,7 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
 
 PREFERRED_RPROVIDER_libdevmapper = "lvm2"
 PREFERRED_RPROVIDER_libdevmapper-native = "lvm2-native"
+PREFERRED_RPROVIDER_nativesdk-libdevmapper = "nativesdk-lvm2"
 PREFERRED_PROVIDER_android-tools-conf ?= "android-tools-conf"
 # Configures whether coreutils or uutils-coreutils is used.
 PREFERRED_PROVIDER_coreutils = "coreutils"
-- 
2.25.1


