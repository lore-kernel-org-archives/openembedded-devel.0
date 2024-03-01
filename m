Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C25EAC5478C
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 06:14:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16701.1709273662668586697
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Feb 2024 22:14:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=b6lzc00/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3790b160fd=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4214VgJ3003856
	for <openembedded-devel@lists.openembedded.org>; Fri, 1 Mar 2024 06:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=+oNDVhk/xm0IKVOhDKWlpChwWBL8xQDfpel8Mr5bg/Y=; b=
	b6lzc00/3J3at4DNItETHd5H4TcaXcD6ykrjsTJzLpqiPRx4Hd2Tg09y2x3dpBdN
	IpMmoiny32RzLz63yHBh/Os1RQ+0ZfvdE7nF/q8R7XjLK1w/J7amYNLIW7+fUjJV
	eKggF/bn5NEKd/4nH/oEjS6aMzxKwj8gq9lG1oLq35NUkX7j/ap9KbNZF6M3X0ea
	q84vQ0PO7QkFp9+pr6ZWk9K4jkVwDoBjARrUS2cRJr+BDTlha0RJbxkHkKaAcIgL
	FjoPr/YP0cbTvCYR/CeBNICAJeEg6YrAvZTrK5wNSYDxg8hzxXHBb1K4pyiVPR+i
	AhMDE8oH129R8gYQZZUDhQ==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf5nx6bxc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 06:14:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOOiBcfqy+Rc27edEKeayBah5fsCS2T7BHJixiaSqaIVrpp+zg9LZKv/uAwuRwBKckqnIPhVrHbTOfJjomuzTY0Og6wcZM8+fQ8OfrblUi2RVUmQLjdXi++yl46ela2jR5MiNEy1SrU5C4ctlXyPIW/acnJGbrlFBK9D+l8oTCa0b5WTJcWKRoAZFNSv8TpRw0F4i8ezt/YrpHJC/+Ata8uL0wdtyYhQXHlhim68ltSHmFlgzmWtAjfvUtvTxPozDst7zuuzjYHWD+H1+b6RfyO/26ozfODhg4Oxfk6AfN1uX4LbtBZBoR53jHoTpN1z91mRtkmiwRHkJe+EmpVevw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+oNDVhk/xm0IKVOhDKWlpChwWBL8xQDfpel8Mr5bg/Y=;
 b=MexCU8lw8uBtZ1H+k3pPhe/1qGfQeneERFaDpsAYV2YUb6YegDbURkCqE80lzJpt+sMibQsGMgvETACjFYJln3ilIZ0qz1ZTgGj67dy/hFrzJvYWim3yXmhRHeixySi9dbsOSLoq47ZZe02rv6p9vsOB9X4jIw12uHU7nKFU+Krt25Z+uem9fOhNKTY93jYugIES1nr+5gzTjwWBgGUTqW5NsHG/qNDwqvWweNykgZT6p/+yJXWdCNMJsSeBcWtnroxAbL9Ta7rf9jWikODc/nnRrMMWTWC4FmzdD27vucs/0iqlFsAel7RDT8mnK0h+Zs8K94rJGJWEvWnsr4eJBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by DS7PR11MB7950.namprd11.prod.outlook.com (2603:10b6:8:e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.16; Fri, 1 Mar
 2024 06:14:19 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%5]) with mapi id 15.20.7339.024; Fri, 1 Mar 2024
 06:14:19 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] layer.conf: Add nativesdk-libdevmapper PREFERRED_RPROVIDER
Date: Fri,  1 Mar 2024 14:14:07 +0800
Message-Id: <20240301061407.1769771-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240301061407.1769771-1-yi.zhao@windriver.com>
References: <20240301061407.1769771-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|DS7PR11MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: 6359b2d6-ffaa-4615-8f2a-08dc39b6d47b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tclJRFrR/b3U+ECKmQRMMcFYuSUTtFyvFS3IsH6lUsuRXipkaErls4UOq8PFgazPdqfjfm2SYzhDSo6X0y7xc+9kChrQWOKe/oACTur0f4HnL1+k6jGyDfSnZYC8HZ96m5mR2eSArrv46YQCNlYJoaHCV1Cwe37qUikWg6qOfLQ9V8QhlqZs7AtO6HDYG0aIr05aWl7XyRimG5OKs73EZhA/hOIqAJSOMy9C2W2v04FcgIF8hava0H3xaS48yCi+K8RrPY/7JNOlNnrv3QxMp0b9UrXDVQvaTctFi4i2aBMsNLy5r5anWOdXkeq9pxtKFw2lz+e7wk7NmWTmRUmy78mDaDQVTIgaMYGm+iyenUmc2zx/VaHAJBt8Td2ypl+3F1vV4t/u4WDzXrKb1xIh9bWjML+8G1Fm6oWGo2zvRt4319qUoAl3tFwV3Z4BYxmjsXUB/5VTag+VC35VZZUIfRJHHF3auhZA+AJc8lOzv9pydTwdfZOO2MeMO0jYcTTibKMU6lS2HSY2GIZtbEP3oOmCtBO6xOYIyHEb86YTzXhnILUroCr8BkLbR4soBF678URZL3/cfuxkXMZSMnjfPx4MkZiZDmn+xy0wt6sRANdrtUL2Z9XPG99J783Y4/myF6h9roEpbVPiMDH8jScjxlPY7k3LQdAMz2DUAyZw7XpnlWrTCXMj0sbx21SCEU6Z
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?f5raFkFBqz498xz3qEYwutYmWpb3QeVlDt/KhqWJ9WxN2eyVJhKT4zR8/A+g?=
 =?us-ascii?Q?o41q+bwdUwDfBMtkh4lvgyviW3cwp/3WSR7R6NQdJ/NIEO4Wn8VmB9wvojIQ?=
 =?us-ascii?Q?E8djV3geho8oIJNY6QPdWJgQaMSeZ4RsRdmQYNuyJk8GTtOTpb0x1aYF7B21?=
 =?us-ascii?Q?+fFgft04KET8niu9pzSNbdYpwKzFalIuOyDbM1b3aPdIS+joaRDWnvkkrgEb?=
 =?us-ascii?Q?9ALbT+mRFkE3EovF486t4ZqbJlz0ie1aSkD2NTUUCCcb92K3RG9tOl45xu+p?=
 =?us-ascii?Q?IZFwF7fZyAYl+uN4b71zUhiXPQaEympc/jot+P0ew1hYdpi65GkcyLbznB/V?=
 =?us-ascii?Q?LyWJAhu0mnnWNUsvj8K/8/01BNRevlRzs2aMa/ZCxlT7MVEcTU7Vq1x4i8v6?=
 =?us-ascii?Q?XdbgxPO9qNZ2kWkZlhEemM7EN2DByh4f8oPW+ytgHBRoh4kt6xlkZ/RvoFW1?=
 =?us-ascii?Q?dTIpXKGL/PPljiDOdG4h+CJQ3Lrjsys4lwkRw/9Nkvnj7/Ovx4icvECvxQNS?=
 =?us-ascii?Q?uElOkfv2HWo2Qx44daKh9eavrylIFkSvUBy30ecz6H+FFiv1/KWR3/bAqPvl?=
 =?us-ascii?Q?wUD/riWVDYNrC+9gHfzSUeZLSxGgVAsZfosOxjJa6P96yyqwvOQPln33dyJl?=
 =?us-ascii?Q?5dkGdvM5ZYvuOkJFkd80WOTbsOBXHBYv9qoEIcNueBMfgVVzdgJMzcKQFJaI?=
 =?us-ascii?Q?3R1+dDZeHHSRvGdL3i3meuhuE2IGMEPXBoFFpnsD3rHwL6CvDqsOF6Tdjnar?=
 =?us-ascii?Q?l+KACTsxmuz5WnuzSeZQQbJ4bVjcl+oynKxfBpIWSnSzZxyuq+C6ApES9aSY?=
 =?us-ascii?Q?/RRFLR8ETeUxc079RJxfeEH8rt8TO5YzWQixAhSu3OU/o3weiB7UfgmNaHf8?=
 =?us-ascii?Q?rY7qFIsF7g2kaYwqXKvB/9azETbm2qFMkqFRGjfVuRdzAwDd5loMlKMKRKMQ?=
 =?us-ascii?Q?KgGN/ldrcajimY5OjkakX0ik3Uz66mP1MkZMfh2M97TzjLAzDF8iI6/EhYMX?=
 =?us-ascii?Q?p9HSNKVThHGm2uvCp5weCLv3KZVRkP983tY74ZfoARDL3IzsunZwMjHesCC/?=
 =?us-ascii?Q?MLq4oXqvBAehoSl4/DfQcUP4m9QFpNbXM7nyJIQxZkju85rBDnyUsjJtLu2r?=
 =?us-ascii?Q?VGAflQaweanxh8nshqM70vRW5y6ggPfTzGhkpZiKNUbqEEmhwXtly+ruXSuU?=
 =?us-ascii?Q?u+zBvLrdfvK0NJx2GEiGMB8P/BtmplJEbIEMae0tf9Q7DIiYM4YhQkLGQJb0?=
 =?us-ascii?Q?xgyXL5HdP64ptqftwjuDf/jSyJsh19YELztWiodQHagzFcJBvRIB2OO1Oz70?=
 =?us-ascii?Q?Iplxnt1I3C6UI8RFPEFXgXT2wqFL43LBoVhBGSOm6lAPo/RzRF9L6uhG/s2u?=
 =?us-ascii?Q?P7ga0XOsw9DnJf5XqR/EepImxU4OAsXS6gErfDXXKsIzzF7ohLvT6YQ2Yjr/?=
 =?us-ascii?Q?pn0m1N33IXyGmyTMXR/9x4TVf/4uLY8cCbDz6kcb8k+mvaBgVqghSRhU5OEK?=
 =?us-ascii?Q?RdUer9qCrOgiBKEbMtlwl3IUX+y6Bf4jGmBCQZ/ttnCtFKZB7VuxfjDduy2p?=
 =?us-ascii?Q?mW+9aCQhAcoEyOno11PGxZANxXq8FyrYhyMj9wPO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6359b2d6-ffaa-4615-8f2a-08dc39b6d47b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 06:14:19.2923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3gNlhWfARF1JTK7L0gxBFCXzaq2/dDvU95iaPGJ0K939iMNKleh8bpn0eIXPX815RULuJJ2GW8M2GJfxeLGUbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7950
X-Proofpoint-GUID: 7CZj4Ne1GljH764vGwiS63X1u18tOnvP
X-Proofpoint-ORIG-GUID: 7CZj4Ne1GljH764vGwiS63X1u18tOnvP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_03,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=859
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403010049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 06:14:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109068

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


