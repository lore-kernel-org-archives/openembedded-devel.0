Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB656D59F48
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 15:54:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.45])
 by mx.groups.io with SMTP id smtpd.web10.49162.1730908478465807482
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Nov 2024 07:54:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arri.de header.s=selector1 header.b=YrWq+QCV;
 spf=pass (domain: arri.de, ip: 40.107.22.45, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKa+Olu7r3JRzMb0C/lHM7Xd9i+EhrzgmJykuD2MSwJSUMTIKG03Oo4du3iOf2s8wJO/y2EK19lAaCjxE5h3e1P77YImeo0J5/kMLvcb6OBbqRGwRW3gyqjPhDAaj5K3VMKOSjP9+34XJF9icyUZgQhUHwCTZ+L6j4iXqJRZir/Ko60BxMaW2J+cp6WpsZNACjRfE/LD4qADnCXHaUvWnbcImfRZJWvfASlZHoOLagTy0x7jpwVwblh5tpaFkdS2gbXesHF85mJ0Man1NekcsW/tAjniXtIcbxn6g389936KYxXMOlicOmUK2unnby+B9bS1O19HUrF2QnTVJ2PTGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZF17cmAf54/1NdzUTowXo1namSvCzObqwVCeqRo3Hs=;
 b=PPo9IoiQpy3DmNut9D0ImIwZlpHPyUtxiMrhDFdVkY41LyN91jAngOHqSE9NWiUq6oAiCwCgJbyz/nPersxhYpUn7C5C7omrJFEbdr6BPVT2uhXpm+o8OYNYv/S0EOnuBUpfIeIiBjBXIXpNmnf1faaqKUxJ8poY75UeTlDvgomptm/qNlj6Q1DgfWg2+RkHQmNRSoU9rly2/XEuXcpsou1ycuJGPppQT/MAf0Z+YBi8VmotuxNJ3eDVMofeRAopGqdBwk/nKTJ+Xz6X9lX1RtK8TNRyi0P98sPiASZAHd8bopJ9UpFDxnrtDxs6a/hvE4SV/TXJ8CmpdYdioCRnQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZF17cmAf54/1NdzUTowXo1namSvCzObqwVCeqRo3Hs=;
 b=YrWq+QCVOa5JxSzo+XkjrRsWbSLWpOb4Ngnuo3XD5K114MvFQgjEdhIEs1gjTDD5jhS1iYsEHz7DbKa+Hplq+UUbnOa25eLAIabdpzo5b3u41/1iMqb2KDaAYHCYRV7wC0XVc4ogjzyVhXDharONZEyt1FOLsZeJdOTRBEddmf0=
Received: from DB8PR03CA0010.eurprd03.prod.outlook.com (2603:10a6:10:be::23)
 by AM7PR07MB6548.eurprd07.prod.outlook.com (2603:10a6:20b:18e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 15:54:34 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:be:cafe::d9) by DB8PR03CA0010.outlook.office365.com
 (2603:10a6:10:be::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Wed, 6 Nov 2024 15:54:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 15:54:32 +0000
Received: from n9w6sw14.localnet (10.30.4.236) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 6 Nov
 2024 16:54:32 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
CC: Yi Zhao <yi.zhao@eng.windriver.com>, <peter.marko@siemens.com>, Peter
 Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS
Date: Wed, 6 Nov 2024 16:54:32 +0100
Message-ID: <26643868.1r3eYUQgxm@n9w6sw14>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <20240922073618.1359707-1-yi.zhao@windriver.com>
References: <20240922073618.1359707-1-yi.zhao@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.30.4.236]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EC:EE_|AM7PR07MB6548:EE_
X-MS-Office365-Filtering-Correlation-Id: 5807d432-c0be-4119-5446-08dcfe7b4e53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/luGq1CMawupbhVmxqiGwx9TbD3LA3Lx2o8sh990LpxrCvRxZbTHxI7VwB8L?=
 =?us-ascii?Q?fN1wNhXPkxH4mqkmCWjYy6jOPNsboa5/V1xk7ifjumG1SBkNhdk9PD7C57Jb?=
 =?us-ascii?Q?rY9ox2jRn+cZ3XsmoUhDmLcdF96XXzNvAfyQMQX15egWdWfEYcz1m3ciQP77?=
 =?us-ascii?Q?ESz2gHLmIFaYa7n+Oe6s0lcE5hQ8FBbR2qtGn7gXAwjsvdO2y4CRIdu0pVOp?=
 =?us-ascii?Q?B0lk27E2a3CrMg/bU6zkSZKvVl+ghyc/gqHbNTVQmOk2kZjM9JkBdNq8+R3P?=
 =?us-ascii?Q?E0EVuz6qjvg8kwPo6Ptima4Y80HXP1zI1QNpkCDDeeiA+wbf3CQdYAqOsImY?=
 =?us-ascii?Q?SRz6//nIue/jSS1lYOEXgcNPofoCT8Wc4HBk52Vu1NPeWa/DhY5s8d+95tre?=
 =?us-ascii?Q?Jljg2hAhQOiea7CsNKopwQlBfTMT1V7O+kJCPFKnWLkYbqhMFWOpkN0csF3C?=
 =?us-ascii?Q?1in1TKgRVB5eli27g/svxQO8D9LOCdeUHcVGV7CfQsxXbYij2sB+CHjCsZth?=
 =?us-ascii?Q?D43I29ZEdzbEzmhpDN9+C/6g8k26Da2qilCCL5dH9Sd/TMHF+bWwSPipzIyz?=
 =?us-ascii?Q?iRSSagP1xtkiZ82WM8NL+inf5sZEmFyGDnEfPaMfKkfELqJNt9t2fU1Gp3zh?=
 =?us-ascii?Q?3Ly/S40IQIGTdWMZBb/RNSvcjeM7YXCopufhmmz37X18PcaKJl77YjJv8dw0?=
 =?us-ascii?Q?QCykKBcdNJTUPmSEX1LI/XKWAZ2O5wre9qt7CM9Cn2L+9F3Iljg72PMaF5Gk?=
 =?us-ascii?Q?UhBJq2tu7ZWSzBmsB5R2OCvj1THeB7v5+b3BE0nM5q4zov8DvJQ7AhH1FBeQ?=
 =?us-ascii?Q?1jszsqW8HcoP9oC6gGBRNiQ8cvlKcOo3IRCcwq03XVL0m8Gi2kSwQ+ohELr+?=
 =?us-ascii?Q?5k/GwtR2GtnBWeqiDye6turNZMafaAWo8EKvMqpyUrqS7DkCzP9lOWHYWVx2?=
 =?us-ascii?Q?YfixUtDbY0vYW3du6VS1Hj1tUXOrzvPJKRyFEpOzZCxa13XUwbmRgn7wHtTU?=
 =?us-ascii?Q?Ga66uanY03j6kTVEJerkN8DoNB26TQZzLv50yAtZbtU7J6f3Pmxm+54qk21y?=
 =?us-ascii?Q?U8tzRxNBMjPGk2B2EcvqIqn4eShzk9j2+ykikCn2e40fZMsAlt2Ze5nF8XSQ?=
 =?us-ascii?Q?JwYQIgV3rX13ELr3eNO+6ihbJBJHSzzRcMd3j3GcqsNUqnSlTcWSX0GpaivE?=
 =?us-ascii?Q?NT6LatNB66EyuSgmKDW4u3Th8Z8Rxj2AvSYynskrYbLyolXiUuCQAFwGdV4+?=
 =?us-ascii?Q?tRu8VhPvSLSznfQN2QG6SC9fSDVra3yE15WIv2R4ku1Tx+v0V3rP9JuZeLBY?=
 =?us-ascii?Q?wgrMYu7hGUeKX8FG0Iezkf8pmrjh3a8KgOLJ42Pr0nrsgikJ6mZ9+a977D2w?=
 =?us-ascii?Q?6HJPU34=3D?=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 15:54:32.7503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5807d432-c0be-4119-5446-08dcfe7b4e53
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6548
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 15:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113742

Hi Khem,

I wonder why this patch has been applied although there were concerns about it:

regards,
Christian

On Sunday, 22 September 2024, 09:36:17 CET, Yi Zhao wrote:
> Since commit[1], the libraries of abseil-cpp have been splitted into
> separate packages. When protobuf is installed into the image, only 48
> abseil libraries are installed as runtime dependencies. But the output
> of 'pkg-config --libs protobuf' lists 66 abseil-cpp libraries are
> required. Add abseil-cpp to RDEPENDS to ensure that all required
> abseil-cpp libraries are installed.
> 
> [1] https://git.openembedded.org/meta-openembedded/commit/?id=dd6421e65eb75c35a904f4b487ba022075035ecc
> 
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> index cc5204de4..354b3213a 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> @@ -106,6 +106,8 @@ FILES:${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"
>  # CMake requires protoc binary to exist in sysroot, even if it has wrong architecture.
>  SYSROOT_DIRS += "${bindir}"
>  
> +RDEPENDS:${PN} = "abseil-cpp"
> +RDEPENDS:${PN}-lite = "abseil-cpp"
>  RDEPENDS:${PN}-compiler = "${PN}"
>  RDEPENDS:${PN}-dev += "${PN}-compiler"
>  RDEPENDS:${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-protobuf', '', d)}"
> 


On Tuesday, 1 October 2024, 13:59:56 CET, Peter Kjellerstedt wrote:
> Can we at least change the dependency to a recommendation so 
> that it can be avoided via BAD_RECOMMENDATIONS? Because as it 
> is, it penalizes everyone that use protobuf for the case where 
> one provides an SDK with protobuf.


2On Tuesday, 1 October 2024, 14:42:04 CET, Peter Marko via lists.openembedded.org wrote:
> I think that's also not the right way to do this.
> Adding unnecessary stuff to release images to satisfy SDK needs is wrong.




