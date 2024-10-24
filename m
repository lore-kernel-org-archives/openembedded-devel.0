Return-Path: <chanh@os.amperecomputing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1282D0BB65
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 06:51:45 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.200.136])
 by mx.groups.io with SMTP id smtpd.web10.8636.1729752693954942302
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Oct 2024 23:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@os.amperecomputing.com header.s=selector2 header.b=jG/nXuqd;
 spf=pass (domain: os.amperecomputing.com, ip: 40.93.200.136, mailfrom: chanh@os.amperecomputing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LXcN78a9RfEoMn7nXLDQ4CQsiIGeorI2JX4LioBGX2ktBspwsX10/FLuXNlULyjOp9uCnq0yL61/LyLA/o3x+ZOcD5APhIiUZJtrhTtu7DqpIS54UznJVOM0l4VZfBnXyIW3sToM5k7AMRvAXOebqO/sHWZhuirFn/aTEzrx7C21mss5M5AWyz1U0cNg3gwfexJ+igDBD4NGIOqPXzWayL7Ik/lnu/U3w59hwhqS3gbkLIR4toUIsl0bmFBGA2LK01OaqrqzEjQXHrPRVBgxi39O8HurqMET1IotOsEkNQnvFN/FwD8oYwzi7c3w3JXzA7Rld+BDQYhDHcko/FtWag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJGnE+Wy4oQVfu4EBEdSCtq0V3KTVPJc24VPpAj0Z4E=;
 b=mvQu+omL3Og1/tJAP2zYGT4QA8POYw/8va7nE2ZBioUb7/QptgZETWIA9nL0Frhlv5c4NvKxYm9Io7LgDLybnuvuREEgEUmtn0ZquNdFG3BAyXU247wVOU+G/FZ9/Kw5YzlslafJefzDu8v5kvzuVeSpky+aAxCDYepIUW/DSFVkxb32+rOJbNqJKJQbbZgjObdMeL84G7h4AFrFFBRqgnIjPzbI0S/waSeMIFKqmEhKGE1gYk6uJprFq64/5u8QI6xYLYYIfZ2UhZ9fDBVcvimvvXWs4L9ixzEff9lTkS9OT7G7zPYKJkymXElbBKS1byrZ1O/SD5S+6ET6LEZNSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJGnE+Wy4oQVfu4EBEdSCtq0V3KTVPJc24VPpAj0Z4E=;
 b=jG/nXuqdbpzgg0sakn9XvVzN7yIoJfZ1mabeU2oe1ws+2SU9kNfi8echwfYYq9nugCjPteZi6kBQ2fULpiMY6xTSyHvAgJTQxWY5OyP0kBcmZwAv8zNSYl0X+vyebdjivHvOdZUm7sv+MqyEMS5EkOppSo5fRQsJRgCkuVOS06A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 SJ2PR01MB8125.prod.exchangelabs.com (2603:10b6:a03:4fe::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.20; Thu, 24 Oct 2024 06:51:30 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%5]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 06:51:30 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: Khem Raj <raj.khem@gmail.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	openembedded-devel@lists.openembedded.org
CC: Thang Nguyen <thang@os.amperecomputing.com>,
	Thu Nguyen <tbnguyen@amperecomputing.com>,
	Chanh Nguyen <chanh@os.amperecomputing.com>
Subject: [meta-networking][PATCH] mctp: Fix CI build error with musl+clang
Date: Thu, 24 Oct 2024 06:51:09 +0000
Message-ID: <20241024065109.74010-1-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0025.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::12)
 To BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|SJ2PR01MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: b07fa4e8-971e-40da-c656-08dcf3f849dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZyjaB9jHJIyjc9MXJu8qM4mANQFCXZ+WgXeHd3Vke/HzQe7QSkwV8+irPHNE?=
 =?us-ascii?Q?BBZwsSZ3dUt/LclfSosu+qpuG2/kxIM7n4dZp9QOIw1iQOJP+EJfekdRaOzH?=
 =?us-ascii?Q?4ga63CdOiy1H2sG66NJBeAIpKTg7m5cwZZslMZ72OxF+yl0miqE88PBBZqa0?=
 =?us-ascii?Q?oifhtRPS1xUkN6EeAtLRPWwTZgmWStFgOZQPBK39lyBFKAA5gm5k6HONCSLA?=
 =?us-ascii?Q?+/FONDxSQIMsk8VujT03IMXW8KMvJlkb8A8LVJUEm/JXra7pO2yvxJr+hfqJ?=
 =?us-ascii?Q?GLg3l5m7B85CtTsc5+6+sBz2cnHdyiQOFmn4Zfl7Y/5k7Z0W9xW9i+J1zv1b?=
 =?us-ascii?Q?foTbNP13GF/k/r1j0EcG3v8aDMl+TptrZ9Rf7vf+wmfaj5JVBVUogMQ12Ezw?=
 =?us-ascii?Q?hSmTD9Q6hGkEt/DFKihhh2cUst8KH1MH0e0knN0Rcp+yH9c+57afUGOPvlCl?=
 =?us-ascii?Q?e6vwP71H1qOyZec2WPfDp6TgO+LTCW3dCsZiFGkVkRBt+mHU4e175g3C6OAD?=
 =?us-ascii?Q?7EjKqljHYqil5WEe4Bhnjawtt+ki5P6TQEtxbC+F3kF6MvI2oTleDFEbI86z?=
 =?us-ascii?Q?4n2Sx3C1yE+cGqaUgW1UnBT9LRFz1xnmLg5S2Sx/RnqNgvSl1sb1DoFJ/2gk?=
 =?us-ascii?Q?UtxNrvCb4ROsKcN0o4VRKMdWKWMO3GQjp7Xw1jzw+O03AO3ckFNz4eyy4Sf0?=
 =?us-ascii?Q?MS1jc4PZGa/HHEAXdzjOlsEdqGslpbqmClvCKUd84r8U8nnfpbwv9kVoAkj6?=
 =?us-ascii?Q?Y5xgSfV4o6ULqKAP8efJHWyIVRYvZY9Bheoy3sUJtGEVduyniQwnZlaUk2Rc?=
 =?us-ascii?Q?DmvhaUC9cpV+FltN4EmPlLnxw789+CBSPQTctGPXe5ev0krc45UmVLtVUVTb?=
 =?us-ascii?Q?jYjOWgxJrP0KpqxqyyubAQ2vDtUHWlATgV9H8jDn4dwLSRdym32YhIl0dRq4?=
 =?us-ascii?Q?vj7JprJohcPiRrSSd3Nxy0mFO+QUVMvVHVveIAFLUyh0sHZ0xGSnW+d6pwhg?=
 =?us-ascii?Q?dXLLlJHjG7iUPW0EdKKr/DrZQVdIE6qjzKtBHwgFZFkflbJI0q3atlLFqG8c?=
 =?us-ascii?Q?aKLUKokabcMriMZBRAK5D0PHKRvQaxt8S0/FUeM3HyFxwswjWN9zEoykRk5H?=
 =?us-ascii?Q?dlsXwPN2yd3PXrhGn/oRvvP8Iq+YR679ZbDjSPWjOQW4XeuOt5ZUbI+6Vwut?=
 =?us-ascii?Q?C/S+8AOTqXnbUp7x4h5C3Fw1Cii1n+EVpqWecxCtojjzm69hZJ+WK1dC4Q5L?=
 =?us-ascii?Q?N5NvAG3yDwmxPYMpRuvrbt/tD0OQpWKjIfRT5WZBo9qhL6vf4rqz7u+T0dXA?=
 =?us-ascii?Q?G1u17Wi7f/GU4jp7lUWmvOlSyrDjOfmsa7erSmiSoq1vcomSZy5V6nqb4Y4/?=
 =?us-ascii?Q?js9J7SQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YaRvOk/vXxpS2JSjJ5jQ6IkrzgUleZKwi9m8ZkOQkNaIW6HoomVIojtezeSv?=
 =?us-ascii?Q?+NpK1YUgwBAzUmeAaJfjaOUAF1OpGRI+rJ32X14HFRhqj2GUSesv3T7Aob0j?=
 =?us-ascii?Q?ZwnmJHIFhcS5LqDVpX3DUL0C7VIQdEg5pfYVuTMho4XxWjLz6gxiuAbFg09h?=
 =?us-ascii?Q?QE4YxqMJ/HtrmLr0VxeeqiMrnyQlha8bB2dhajIDnH7sgvOKd8kHWbz5QyRY?=
 =?us-ascii?Q?lQO1zHwRqvvwAPHrWAmFaAUgS/V6El4I2apd4hTbTEww5ODNIkPfPjAttAqX?=
 =?us-ascii?Q?KeUkQQz2YAAOU2PsYPCY12guHRtPumyYPh8t5CAzoZUrecRxEp8YDFLdm/g6?=
 =?us-ascii?Q?4o3qqcWaxFR77GTtEAMWM0jQjIJyRzmY7QhrixMLVo2u/DDB06oqu/+k3rhT?=
 =?us-ascii?Q?5wlH18OLNYNuvIBDXP5NWWllBTLHq4bI6O+rABoMeZ1ATxRokLsVACxxe5N/?=
 =?us-ascii?Q?ZtN/8okuyG8FRqDVXIy+tV2FHpdA5REqX+zyUHhiELHB2NiKp9utDe7YuVXZ?=
 =?us-ascii?Q?ZpNY5VZQlyGt+TItE1xWUjh/vA04258NCsdPnbvexOS36BnlAtLUC18ZDofB?=
 =?us-ascii?Q?OeFqkspyW0u6mKT+7BKAegfwOMVm6GoCkgtBY/lPRD+SxlmIc3fHtAXPLGsI?=
 =?us-ascii?Q?KSkwXAiZI0dctQKA/hqQHPC4o6OdqWBe/Yde7dEm2I9Sx/PL3RKabgqskTX4?=
 =?us-ascii?Q?Px9iTw66g960ZiCk7TDaI26W65060cziO3P5w9eetwoYCEnXObpjUtSFYJHl?=
 =?us-ascii?Q?kjUqWW7OY3wDUcgZMCRyRWtF1gJh/n43fFyGl1eCKsGQ02jMxfda/kXPOOkX?=
 =?us-ascii?Q?o2NxqV83jT56hJZA0E+S+yT7lkqjhyM1y/kL6imQ4Cgl7GyMc9QO3GtxYWee?=
 =?us-ascii?Q?7wTsVNk3QnG1svGPEPxVQaqBHJEzPPovCvhj+ZTZUKXANj2GOstwu7rFSgl+?=
 =?us-ascii?Q?wzF1+2FLdwKNxnu2fe6SjX1pg2yFiOyDzGlnNV2h7wdfq4Oo49mg0wKbj0yn?=
 =?us-ascii?Q?midrFqn1RGmKDHizlj4RhM72nyKQ8V4TfYOxbGzoLvNqRAvZAfec71WOZyZB?=
 =?us-ascii?Q?iJFBg4+ei/V4FffPtMe8OtSByn0XB62f1jsg0B8a8Or/6dYZk0TQR6y4/kIv?=
 =?us-ascii?Q?LVN+Hk3EWRpipCVHEuU2LoaKOwglT+8IeulPIJ3ctVdfIxTGW/GfNKZL7/8n?=
 =?us-ascii?Q?EkQSpTJ0YaLajh2pMKVo73hz8biKbbwMiKDamOkcIk7pItW/LvrNT9Hpihvc?=
 =?us-ascii?Q?Kwm5gbB+dXLhb59hBGVU3kpw4eW2LxrQPz5LoCKefXmodMglC0plKsOOo9DZ?=
 =?us-ascii?Q?NP1jVLTLnWmkFrWl+s0lsQIUnwVNYOZGdlIPSnjRdU/8sNnHyIvPsI+WQ5/E?=
 =?us-ascii?Q?qT7/D4Tvx37IDUrtU2+Ixrqhtj3QIlbDNBvztDKb9K3ePem/vzMYQDG6qpRA?=
 =?us-ascii?Q?7H1cz+MoT0DIeQd/Du8MkuwR37XoYKKU2Q4/6RSYIEhPnd1AzueCCsLxg17y?=
 =?us-ascii?Q?LtkJR95JHXxjfc+5Ebu/DrvXL1SsXA4OfLlykhrrEnutJpCbTQteUaIsBZFi?=
 =?us-ascii?Q?ZK3K00iJfZd1+V0FWidQyL+QEph6Z4Wc2llfwtbfjXAevw3tY2zngMhHC2Ea?=
 =?us-ascii?Q?oHbg++v4CVPy8vExDXAQcog=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b07fa4e8-971e-40da-c656-08dcf3f849dc
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 06:51:30.0250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ie55F4JuB9NrjQIsk6jJAckwAMWhBNmcWbLGCfP9aByuydTdAmenA6AzxFww7HQXIbHoa5SgMOVxe5Fmvp7GNFmKjUZJe2SzkNtETmMDmE03qqVmS/3vQTdWw0nqvQL2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8125
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 06:51:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113159

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 meta-networking/recipes-support/mctp/mctp_2.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/mctp/mctp_2.0.bb b/meta-networ=
king/recipes-support/mctp/mctp_2.0.bb
index c6aa7c104..793afe755 100644
--- a/meta-networking/recipes-support/mctp/mctp_2.0.bb
+++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
@@ -5,9 +5,9 @@ LICENSE =3D "GPL-2.0-only"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db2=
1"
=20
-SRCREV =3D "f110926b082731b25720b444378ad55d7a9d451d"
+SRCREV =3D "089dc53fa7387cca517cd713061c323ca06fb6dd"
=20
-SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3D=
https"
+SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Ddev/cross-fixes;=
protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.43.0


