Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A88D78324
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 13:52:49 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.21])
 by mx.groups.io with SMTP id smtpd.web11.174236.1733147557657264536
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 05:52:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arri.de header.s=selector1 header.b=L8GO7Q2a;
 spf=pass (domain: arri.de, ip: 52.101.70.21, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yo2LMtAwqQFc5JedBxSRblJplYHhTbRUT4pirdaZT75ZTi6+i5K3MitnoyWM43FyWW7G+UFY48f34S3CVnTuycJgkWjo3v3bhv6E1W4JLwc5tF0FBGXkhcxYR6Lgs1AUB7YAM44+jDusV40zc0meID9GyPF8kRiOhhXyDRWqMfp1nuMB8USDm0+Ia+qRWcSKhl8j4RMz+QRTfLu3sKtTmhNdQYXqer1SV7ZuATADA6RNi/HS/aTjq/nPEZm5DN6jHs4VZffPPqRBOa22aIMTSFVm0iOz0NxQIDAwMoxRd6Zf5JthD0cs4rRakeHGEkCsQ1Lesp8xgtAE5epeEvakDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lk2ir08y4SoQZlyFRkO/mpryoLclKECgCKNHxhRZhQI=;
 b=EREzLpLaWMadXhrgUTvhZyHZFL78+t0U2xlPxgyxUKpcL/+1rBHfsIxTdhSUbmBjGyGaJdt92GdJpSgSSXUSeoFNny9rHryOtkkn7ozio90cLKo+9v3IrClnGyqpF3iROFEnOvNP2svJYE43mRFZuYJBpzApDAQk6QB7EEpvCKIXLZ/umnbUoYMIXgqgIGWH35sdWdZpNwI2xCHeW4iLT1B8ayxmmLaKscqwMT50eIktn23PKuNv8O24sJ7jKi0uda9zaGqGDfrMew8f9YS609KRQ5mo2kRUwAY7pv8ITZ0ja3h9EXpOspoVqQF/P6MuaerGpXo8aX6r/zSPHBYDtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=axis.com smtp.mailfrom=arri.de; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=arri.de; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lk2ir08y4SoQZlyFRkO/mpryoLclKECgCKNHxhRZhQI=;
 b=L8GO7Q2aSAeqTw9OLrvbr/dCYVAHPR9Ae/EJLt0CLs9AkAIQ9oMWv8ITJ2QqLgueQaAqa5ZGSRGS6P8WbE4VcoxFMiigfN2q6IKMahg0BSX2BlrqVdUXvRk2EAjVkji4bOaNSpDfolr0v+fwUWJGJ32e0GlbOhyKXO1tZHbGr8Y=
Received: from DUZPR01CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::6) by GV1PR07MB9047.eurprd07.prod.outlook.com
 (2603:10a6:150:a5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 13:52:30 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:46b:cafe::6) by DUZPR01CA0018.outlook.office365.com
 (2603:10a6:10:46b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.14 via Frontend Transport; Mon,
 2 Dec 2024 13:52:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Mon, 2 Dec 2024 13:52:29 +0000
Received: from n9w6sw14.localnet (10.30.4.231) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.38; Mon, 2 Dec
 2024 14:52:27 +0100
From: Christian Eggers <ceggers@arri.de>
To: "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>, Yi Zhao
	<yi.zhao@windriver.com>, Yi Zhao <yi.zhao@eng.windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "Marko, Peter"
	<Peter.Marko@siemens.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "Qi.Chen@windriver.com"
	<Qi.Chen@windriver.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS
Date: Mon, 2 Dec 2024 14:52:27 +0100
Message-ID: <2168139.9o76ZdvQCi@n9w6sw14>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <PA4PR10MB5707F3BA475C5BF809C08D34FD352@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
References: <20240922073618.1359707-1-yi.zhao@windriver.com>
 <2746495.vuYhMxLoTh@n9w6sw14>
 <PA4PR10MB5707F3BA475C5BF809C08D34FD352@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.30.4.231]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EC:EE_|GV1PR07MB9047:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fddacc1-1f7d-4b5e-f6f6-08dd12d8903e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?y9wlCfcjJ7KZ9E/d/4Hc+40zk0y5rdOoQpVgfMeA0tbRX/xhG+yxU5aBjGjJ?=
 =?us-ascii?Q?lA808cPj3jMjBNW3bKJLiEo0Kj47nrFlV/63lKL1hfZxlnu3F2yyQdNjQDGa?=
 =?us-ascii?Q?BGOkT28WK3xTeLxE900WIMkhCCXm9VUkNvimjXZ0U0kQES9GEUCrmsG6GCT7?=
 =?us-ascii?Q?l0HPbf71ChKY8Y80mekD8ECUN0m5Zrc+r1vUDkYg3FE0eLrEJSGqL/ezpkYi?=
 =?us-ascii?Q?mBLdgcx2AFN4TTODIVObu72VE+igxzDBdtdLysbD8Xr6r8vZ0g99WFGaOlPS?=
 =?us-ascii?Q?FeICDvxBU8fuSUJDgTZ4X+maq0ZFlnxOCul39HMivEBeqzYkUSyksWh3pQbR?=
 =?us-ascii?Q?IRcJKItjS8bSsbwuY9VhhiulqH4DUOc0xqKfcFOYuXvgntpnA6heLYVUwvKI?=
 =?us-ascii?Q?qZqR16RFRU38CueBJhnZUZTPDDx6WOnMp2mxtSHgueEpT9Ef9pX9FiG+mXqi?=
 =?us-ascii?Q?4PhMUBJbebLd8T6ffedfhKot1itZqqzswku1mjffU5mgNP/1KP2ug/sKHEtK?=
 =?us-ascii?Q?aGKMkykawf4nW6CkWmtbO7YUX00Re/uZhMxb12/ZUQRAoxUMsIJ5hW1uyj2G?=
 =?us-ascii?Q?MR2aHTtkXj7vdGhb2PGye7z20RWBeRwsNMGo2BGzeqicdWYtPxS0TSUUaXDL?=
 =?us-ascii?Q?Y8URyoDn76M9VADp5aZTi1UoZV/ijSFo86nlbLd2eMKO0IR1tPJFPoXu2kgQ?=
 =?us-ascii?Q?Kv+lGymnjd78nMt0GNj5UoEONlUQcnqR9lgJKlQxWQg13RtLNGqIwqW6VPtw?=
 =?us-ascii?Q?SCgeLzFeRtCs77rBlBUjFkUm2suKqwV1Y7UUmzSfpfp9jRO6ri/lUYrBX3KR?=
 =?us-ascii?Q?zUq1ZFghdEz36H+ArFIPdFrNIxSXHCBNiCCkjNyHF9QYmQsA5T1yNKnZI8Rq?=
 =?us-ascii?Q?/nWuQNgdPIhYjgkZ/G1r1OL89v1bIcBYgn9PfP30NpRQC/25iWQnLGonGKi4?=
 =?us-ascii?Q?erFilRv0h9ru3niD9At+rEPF9WH1zmfBR7SKojvI7rBs7yvz3UISqw6XtIfA?=
 =?us-ascii?Q?f6g4XbkhaIxa2pSO6e4HfAURrxtK71uiDIqz9hfXjen/7eeDE7IefdbYT/6n?=
 =?us-ascii?Q?V60MFuox0KUgVJQNeQL5PZq9adxBjcLoudyGVcOEG32spy6uAoAMGrxtG4tY?=
 =?us-ascii?Q?y7N4mNhl7JqaAOXI7/8J/x8u5bKlc39xoZ3IHhHEXQei+fNbIsx+HRM3Mmtg?=
 =?us-ascii?Q?6U840MaFS4BCM7UkdwqXu3pRFBxnF9LPLcI3rYPGsQ7CaTNUdls/u/wRFteO?=
 =?us-ascii?Q?FVdPZW8/Pa9gyLZFI9spIDHWcXp4BXxzzyToV4Hd1I6+4zLuePKlchFsgJgd?=
 =?us-ascii?Q?VZXag7poVYVeOWm67GGHA26P777w02OT2uvgM8e/Kdj1o+GwmPS4HUtAcYEY?=
 =?us-ascii?Q?5rgMN6OiNGVt/A2t/lOnkNZIE1/t?=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 13:52:29.8134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fddacc1-1f7d-4b5e-f6f6-08dd12d8903e
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR07MB9047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Dec 2024 13:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114141

Hi Peter,

On Monday, 2 December 2024, 14:48:43 CET, Marko, Peter wrote:
> Hello,
> 
> > -----Original Message-----
> > From: Christian Eggers <ceggers@arri.de>
> > Sent: Monday, December 2, 2024 14:39
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> > peter.kjellerstedt@axis.com; Yi Zhao <yi.zhao@windriver.com>; Yi Zhao
> > <yi.zhao@eng.windriver.com>; openembedded-
> > devel@lists.openembedded.org
> > Cc: openembedded-devel@lists.openembedded.org; Qi.Chen@windriver.com
> > Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to
> > RDEPENDS
> > 
> > Hi Qi,
> > 
> > On Monday, 2 December 2024, 06:35:22 CET, Chen Qi via
> > lists.openembedded.org wrote:
> > > Before we rework the abseil-cpp and protobuf recipes, a possible
> > > improvement for this patch is that we list the needed libraries in
> > > RDEPENDS manually.
> > 
> > my main concern was (as you already may have guessed) not having the full
> > set of
> > absl libraries in my rootfs, as only some of them are required.  But I cannot tell
> > which is the best option to achieve this.
> 
> If you want full abseil-cpp in your rootfs, please use IMAGE_INSTALL for that.
> Packages should pull only their real dependencies, not something you need for other reasons.
> You use-case seems to be to develop application with abseil-cpp library but not installing it explicitly.
> SDK images need to install (or depend on) additional packages compared to release images.
sorry, but I meant it the other way around:

"I do not like having the full set of abseil-cpp libraries in my rootfs only because
I use protobuf in my application".

Sorry for the confusion.

regards,
Christian


> 
> Peter
> 
> > 
> > regards,
> > Christian
> > 
> > >
> > > Regards,
> > > Qi
> > >
> > > On 12/2/24 13:21, Chen Qi via lists.openembedded.org wrote:
> > > > I'll explain in more details what the problem is and why this patch is
> > > > correct, given the current status of abseil-cpp recipe.
> > > >
> > > > In protobuf's abseil-cpp.cmake file, there's a hardcoded list of absl
> > > > targets used by protobuf:
> > > > https://github.com/protocolbuffers/protobuf/blob/main/cmake/abseil-
> > cpp.cmake#L56
> > > >
> > > >
> > > > This value in turn is parsed and used to replace the
> > > > @_protobuf_PC_REQUIRES@ in protobuf.pc.cmake.
> > > >
> > > > Here's the generated probobuf.pc file's contents:
> > > > """
> > > > $ cat  ../build/protobuf.pc
> > > > prefix=/usr
> > > > exec_prefix=/usr
> > > > libdir=/usr/lib64
> > > > includedir=/usr/include
> > > >
> > > > Name: Protocol Buffers
> > > > Description: Google's Data Interchange Format
> > > > Version: 25.3.0
> > > > Requires: absl_absl_check absl_absl_log absl_algorithm absl_base
> > > > absl_bind_front absl_bits absl_btree absl_cleanup absl_cord
> > > > absl_core_headers absl_debugging absl_die_if_null
> > > > absl_dynamic_annotations absl_flags absl_flat_hash_map
> > > > absl_flat_hash_set absl_function_ref absl_hash absl_layout
> > > > absl_log_initialize absl_log_severity absl_memory absl_node_hash_map
> > > > absl_node_hash_set absl_optional absl_span absl_status absl_statusor
> > > > absl_strings absl_synchronization absl_time absl_type_traits
> > > > absl_utility absl_variant utf8_range
> > > > Libs: -L${libdir} -lprotobuf
> > > > Cflags: -I${includedir} -DPROTOBUF_USE_DLLS
> > > > Conflicts: protobuf-lite
> > > > """
> > > >
> > > > Let me use "absl_hash" and "absl_absl_log" in the above list as examples.
> > > >
> > > > """
> > > > $ find ../../../abseil-cpp/20240116.2/packa
> > > > ges-split/ -name "libabsl_hash.so.*"
> > > > ../../../abseil-cpp/20240116.2/packages-split/libabsl-
> > hash/usr/lib64/libabsl_hash.so.2401.0.0
> > > >
> > > > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-
> > dbg/usr/lib64/.debug/libabsl_hash.so.2401.0.0
> > > >
> > > > $ find ../../../abseil-cpp/20240116.2/packa
> > > > ges-split/ -name "libabsl_absl_log.so.*"
> > > > $
> > > > """
> > > >
> > > > See? The current package splitting of abseil-cpp does not match what
> > > > protobuf assumes. And I thinks protobuf's assumption is correct,
> > > > because there's really a absl_absl_log.pc file generated by abseil-cpp.
> > > >
> > > > And there's the contents and location of absl_absl_log.pc:
> > > > """
> > > > $ cat
> > > > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-
> > dev/usr/lib64/pkgconfig/absl_absl_log.pc
> > > > prefix=/usr
> > > > exec_prefix=${prefix}
> > > > libdir=/usr/lib64
> > > > includedir=/usr/include
> > > >
> > > > Name: absl_absl_log
> > > > Description: Abseil absl_log library
> > > > URL: https://abseil.io/
> > > > Version: 20240116
> > > > Requires: absl_log_internal_log_impl = 20240116
> > > > Libs: -L${libdir}
> > > > Cflags: -I${includedir} -DNOMINMAX
> > > > """
> > > >
> > > > And there's the contents for the absl_log_internal_log_impl:
> > > > """
> > > > $ cat ../../../abseil-cpp/20240116.2/packag
> > > > es-split/abseil-cpp-dev/usr/lib64/pkgconfig/absl_log_internal_log_impl.pc
> > > > prefix=/usr
> > > > exec_prefix=${prefix}
> > > > libdir=/usr/lib64
> > > > includedir=/usr/include
> > > >
> > > > Name: absl_log_internal_log_impl
> > > > Description: Abseil log_internal_log_impl library
> > > > URL: https://abseil.io/
> > > > Version: 20240116
> > > > Requires: absl_log_internal_conditions = 20240116,
> > > > absl_log_internal_message = 20240116, absl_log_internal_strip =
> > > > 20240116, absl_absl_vlog_is_on = 20240116
> > > > Libs: -L${libdir}
> > > > Cflags: -I${includedir} -DNOMINMAX
> > > > """
> > > >
> > > > We can then find the absl_log_internal_conditions library:
> > > > """
> > > > $ find ../../../abseil-cpp/20240116.2/packages-split/ -name
> > > > "*absl_log_internal_message*"
> > > > ../../../abseil-cpp/20240116.2/packages-split/libabsl-log-internal-
> > message/usr/lib64/libabsl_log_internal_message.so.2401.0.0
> > > >
> > > > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-
> > dev/usr/lib64/libabsl_log_internal_message.so
> > > >
> > > > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-
> > dev/usr/lib64/pkgconfig/absl_log_internal_message.pc
> > > >
> > > > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-
> > dbg/usr/lib64/.debug/libabsl_log_internal_message.so.2401.0.0
> > > >
> > > > """
> > > >
> > > > What does all above mean? It means that abseil-cpp is not splitted
> > > > reasonably. This could be proven by the absl_absl_log.pc file as
> > > > described above.
> > > >
> > > > So, given the current situation of abseil-cpp, Yi's solution is
> > > > correct. Before abseil-cpp is re-splitted according to its pc files,
> > > > which then could possibly lead to automatic parsing of the protobuf.pc
> > > > file to add extra RDEPENDS automatically in protobuf recipe, we need
> > > > to have Yi's solution. And we need to use RDEEPNDS instead of
> > > > RRECOMMENDS (see the 'Requires' directive in corresponding .pc files).
> > > >
> > > > Regards,
> > > > Qi
> > > >
> > > > On 10/1/24 20:42, Peter Marko via lists.openembedded.org wrote:
> > > >>> -----Original Message-----
> > > >>> From: openembedded-devel@lists.openembedded.org
> > <openembedded-
> > > >>> devel@lists.openembedded.org> On Behalf Of Peter Kjellerstedt via
> > > >>> lists.openembedded.org
> > > >>> Sent: Tuesday, October 1, 2024 14:00
> > > >>> To: Yi Zhao <yi.zhao@windriver.com>; Yi Zhao
> > > >>> <yi.zhao@eng.windriver.com>
> > > >>> Cc: openembedded-devel@lists.openembedded.org
> > > >>> Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to
> > > >>> RDEPENDS
> > > >>>
> > > >>>> -----Original Message-----
> > > >>>> From: Yi Zhao <yi.zhao@windriver.com>
> > > >>>> Sent: den 25 september 2024 04:17
> > > >>>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Yi Zhao
> > > >>> <yi.zhao@eng.windriver.com>
> > > >>>> Cc: openembedded-devel@lists.openembedded.org
> > > >>>> Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to
> > > >>> RDEPENDS
> > > >>>>
> > > >>>> On 9/24/24 03:02, Peter Kjellerstedt wrote:
> > > >>>>>> -----Original Message-----
> > > >>>>>> From: openembedded-devel@lists.openembedded.org
> > <openembedded-
> > > >>> devel@lists.openembedded.org> On Behalf Of Yi Zhao
> > > >>>>>> Sent: den 22 september 2024 09:36
> > > >>>>>> To: openembedded-devel@lists.openembedded.org
> > > >>>>>> Subject: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to
> > > >>> RDEPENDS
> > > >>>>>> Since commit[1], the libraries of abseil-cpp have been splitted into
> > > >>>>>> separate packages. When protobuf is installed into the image,
> > > >>>>>> only 48
> > > >>>>>> abseil libraries are installed as runtime dependencies. But the
> > > >>>>>> output
> > > >>>>>> of 'pkg-config --libs protobuf' lists 66 abseil-cpp libraries are
> > > >>>>>> required. Add abseil-cpp to RDEPENDS to ensure that all required
> > > >>>>>> abseil-cpp libraries are installed.
> > > >>>>>>
> > > >>>>>> [1] https://git.openembedded.org/meta-
> > > >>>
> > openembedded/commit/?id=dd6421e65eb75c35a904f4b487ba022075035
> > > >>> ecc
> > > >>>>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > > >>>>>> ---
> > > >>>>>>    meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb | 2 ++
> > > >>>>>>    1 file changed, 2 insertions(+)
> > > >>>>>>
> > > >>>>>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> > > >>> b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> > > >>>>>> index cc5204de4..354b3213a 100644
> > > >>>>>> --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> > > >>>>>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> > > >>>>>> @@ -106,6 +106,8 @@ FILES:${PN}-lite = "${libdir}/libprotobuf-
> > > >>> lite${SOLIBS}"
> > > >>>>>>    # CMake requires protoc binary to exist in sysroot, even if it
> > > >>>>>> has wrong
> > > >>> architecture.
> > > >>>>>>    SYSROOT_DIRS += "${bindir}"
> > > >>>>>>
> > > >>>>>> +RDEPENDS:${PN} = "abseil-cpp"
> > > >>>>>> +RDEPENDS:${PN}-lite = "abseil-cpp"
> > > >>>>> This defeats the whole purpose of splitting up the abseil
> > > >>>>> libraries. What triggered this change? Was it an actual
> > > >>>>> runtime error, or were you only looking at the output
> > > >>>>> from pkg-config --libs protobuf?
> > > >>>>>
> > > >>>>> Since the .pc files are in the protobuf-dev package, which
> > > >>>>> depends on the abseil-cpp-dev package, all abseil libraries
> > > >>>>> should be available if you are actually building on target
> > > >>>>> or with an SDK.
> > > >>>> Our customer reported this issue. Here is his description:
> > > >>>> The abseil libraries will be included in the SDK, but not on the
> > > >>>> target.
> > > >>>> The application is building with SDK. The yocto build is adding
> > > >>>> protobuf
> > > >>>> to the image (no explicit abseil libraries are added). If an
> > > >>>> application
> > > >>>> then are built using the SDK it can not be executed on target as
> > > >>>> libraries are missing.
> > > >>> Can we at least change the dependency to a recommendation so
> > > >>> that it can be avoided via BAD_RECOMMENDATIONS? Because as it
> > > >>> is, it penalizes everyone that use protobuf for the case where
> > > >>> one provides an SDK with protobuf.
> > > >>>
> > > >>> My suggestion would be to change it to:
> > > >>>
> > > >>> # Recommend abseil-cpp so that all its libraries are installed in case
> > > >>> # protobuf is provided as part of an SDK. Everyone else should add
> > > >>> # BAD_RECOMMENDATIONS += "abseil-cpp" to their configuration.
> > > >>> RRECOMMENDS:${PN} = "abseil-cpp"
> > > >>> RRECOMMENDS:${PN}-lite = "abseil-cpp"
> > > >>>
> > > >> I think that's also not the right way to do this.
> > > >> Adding unnecessary stuff to release images to satisfy SDK needs is
> > > >> wrong.
> > > >>
> > > >> I also wonder if the problem is not at the SDK level.
> > > >> If you build an sdk, there is explicitly installed package base and
> > > >> additional required dependencies of those packages.
> > > >> The dependencies may not be complete and fully usable, only their
> > > >> parts sufficient for the explicitly installed stuff is present.
> > > >> Are the sdk users assuming that full abseil-cpp is installed and thus
> > > >> using also parts not needed for protobuf?
> > > >> The proper solution would be probably to include abseil-cpp
> > > >> explicitly in SDK used in that way.
> > > >>
> > > >> Peter
> > > >>
> > > >>>> //Yi
> > > >>>>
> > > >>>>>>    RDEPENDS:${PN}-compiler = "${PN}"
> > > >>>>>>    RDEPENDS:${PN}-dev += "${PN}-compiler"
> > > >>>>>>    RDEPENDS:${PN}-ptest = "bash
> > > >>> ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-protobuf',
> > > >>> '', d)}"
> > > >>>>> //Peter
> > > >>> //Peter
> > > >>
> > > >>
> > > >>
> > > >
> > > >
> > > >
> > > >
> > >
> > >
> > 
> > 
> > 
> 
> 





