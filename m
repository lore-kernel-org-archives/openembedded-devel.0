Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3C7D78322
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 13:39:19 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.46])
 by mx.groups.io with SMTP id smtpd.web11.173917.1733146755382294902
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 05:39:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arri.de header.s=selector1 header.b=dMFhfVZX;
 spf=pass (domain: arri.de, ip: 40.107.105.46, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXzs4KvabGdYyl43FXBKp8SIv8iafajdP08O2tLmXGFSWgnPs1V8HX1dONuYAYIfswbnEVkTezgutRUhJWx0KpUujQhZVJcXkX9uG5qYt6Ks2WI/4fw/TW3enOolfQMh5lm8XnrYaivUp0cJd+74TPLeB1gWnhOrmoS4cbry8nyQybRtME6nCAhCOwNJT2kqBeLagPD0alDCXYh/oj1hbPcFP2UumnYG1XaHhuybD4ELquLV/540axJdapHwmXld3jyTAxMhRBgq3RmJLxjeldJh/zUaWMuAfGASfgscaa99idypDfe0LdDeqw7t7St6AQ38WIdCmTFkS/9VXP5hdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNYMkdJIh6u2BhoMMalJEHIL5Flignp9nH01wMcC7aw=;
 b=BZPN+B03LY+S7JMmws5pbwNnLDgt4KrP+wLqe+lBmyPEsDYFSDZgtG7jdykN3N+fgj5ry1pQJZy/Mseb69ANmtkWkgxAzhVkF8EnZBtds4/tGSreBRxqWeXrJC9zYCtTKMY8BrV3ktLWi0KUhtrFCrlfLw57zj0o3Xt4J+S/rNoyzyBDfe6o0H2FDjUgcE8cCVq3/Ba296QwpsYy3G98agKeFqEonc25kV4S6dogIgI3u4vDeNioEYKOIdC8YzjtO0YSZKMXNJYVExOIz8jRo4Ix/Np+ftxMRgnV0JxLDuBw4ll8IXLKm2LuclDjz9GvRc++Iz9fzmkeBNmUTmCG2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=siemens.com smtp.mailfrom=arri.de; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=arri.de; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNYMkdJIh6u2BhoMMalJEHIL5Flignp9nH01wMcC7aw=;
 b=dMFhfVZXrahq5GJ1cWIgH0NTjNnI5xkXQ4gkp/B24kojPRLx7oukGo6RZqqyLMB1WyTSH8M6oIBTbX6Cy8gbOT6qfgvdD49Lp5ARuWzrp3Cft4x3I0RdXKvA5yjPOi5RpDow3EY1vpLPmp6Bz7JPHUIYOg/4DEDlC8sy0uI/JmM=
Received: from AM0PR03CA0085.eurprd03.prod.outlook.com (2603:10a6:208:69::26)
 by DB8PR07MB6330.eurprd07.prod.outlook.com (2603:10a6:10:13c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 13:39:10 +0000
Received: from AM4PEPF00027A61.eurprd04.prod.outlook.com
 (2603:10a6:208:69:cafe::36) by AM0PR03CA0085.outlook.office365.com
 (2603:10a6:208:69::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.17 via Frontend Transport; Mon,
 2 Dec 2024 13:39:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM4PEPF00027A61.mail.protection.outlook.com (10.167.16.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Mon, 2 Dec 2024 13:39:09 +0000
Received: from n9w6sw14.localnet (10.30.4.231) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.38; Mon, 2 Dec
 2024 14:39:09 +0100
From: Christian Eggers <ceggers@arri.de>
To: <peter.marko@siemens.com>, "peter.kjellerstedt@axis.com"
	<peter.kjellerstedt@axis.com>, Yi Zhao <yi.zhao@windriver.com>, Yi Zhao
	<yi.zhao@eng.windriver.com>, <openembedded-devel@lists.openembedded.org>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, <Qi.Chen@windriver.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS
Date: Mon, 2 Dec 2024 14:39:09 +0100
Message-ID: <2746495.vuYhMxLoTh@n9w6sw14>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <abaf94d8-0f87-4011-81fa-e2aa688e011d@windriver.com>
References: <20240922073618.1359707-1-yi.zhao@windriver.com>
 <180D44A5BB7DBFF8.7301@lists.openembedded.org>
 <abaf94d8-0f87-4011-81fa-e2aa688e011d@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.30.4.231]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A61:EE_|DB8PR07MB6330:EE_
X-MS-Office365-Filtering-Correlation-Id: 327aa756-37b9-45c9-8aa8-08dd12d6b356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ai1LEEhkYsqNf/V9uPnDBjR4Kz7qbGYyNwDAyIkeHzRST520BokmJKas/o92?=
 =?us-ascii?Q?XyZr7pix0LVN58BCVb89T9JJvCXu7w8iZT6ag2L4IsXXnnh8nrlINhtct8x7?=
 =?us-ascii?Q?+zfnpjdZpUA9bm9QPnsD/OtoH7aqVZ1Qc4AuELv0CGk0cO/4w3tTkeDS8ubB?=
 =?us-ascii?Q?PbphzQMHJfvbA5X1K4atXNM7xj4sqIY92JaiF7B8Im6e68chxMJVOICahROp?=
 =?us-ascii?Q?v9yai9mor2m29ALmYyh4Mabc9hufgHrRkmsm/Zmd+lzsWUfTmj+yucNY6rsg?=
 =?us-ascii?Q?ifa5R6f6a0hFY91rGtXwGjxK29cIlaeFilzZiLDlndGQnve+MxXbw692Qkqq?=
 =?us-ascii?Q?wNuxXiU+akXomSV4bdcyuimxgtI6GmhW7ejN6tzAOCYV2FZttqhi4u04mCYW?=
 =?us-ascii?Q?DvAVlObR+4uNCueIZet2jcpJHj3lmAoDTYnHDELCLvkCsjWI9Itq7O9T8C6q?=
 =?us-ascii?Q?ty3vd+pJ7m5bwoiWH/EsK8iveLJQk7L8eHOPFTWGyDPBrrewlxzL8As+NZFL?=
 =?us-ascii?Q?O0L5yd/LNljknFrcfEX8XAXehPvcxtmVVyN4WhOyLtRVDiTL3MIVHqzcIBiP?=
 =?us-ascii?Q?OFTgJaZr3pBuXwxwoGUKooaET6Hxck6OBJc8Pc8+uIRQMWVS9u2BN/eOzLYN?=
 =?us-ascii?Q?ue8UvGMg5bI2b5uPyHGZ5IBzBWksR/jEf7icgzVZWUJ2LhUQIle07zY+/pEU?=
 =?us-ascii?Q?gapA6BNdi2flT0U8M4FZE80kSqqggjAHXiCF9B233KLX/GXx/cGIrRdwWE52?=
 =?us-ascii?Q?kftMNCCRtz5q3dMZCtLmzN1d/bAvFCjbYYqaVVPQuHcOUkVcGMYOq9SGXCoE?=
 =?us-ascii?Q?i+Q6JsxeArJcfi2aiZApr4QNEZm/zMvuQXsqTCHrNUMYj4TpW4EzJc3R8JGY?=
 =?us-ascii?Q?swv6e9xrPcXGT478m9HYOlUQJ08+IIwjMKbu5iowF5+NGjQ+c5zYRcUIjHRt?=
 =?us-ascii?Q?+HuxCL+/53QU4+HXvjUJo6WmrbHNmUgnkS6gIrrXMF6oBSqtLQjnj2rBz4rr?=
 =?us-ascii?Q?hWjm/mz48OhP5PV2ZNXkgCbrPMI7o9aHlkYLQi8VQbjYX25j3wfIlQ7Orsig?=
 =?us-ascii?Q?KSUgsHcuJZvgSIPcEKyahUouqwQElJQwLpKqnJgVqHjTAk2z/9sA+IgKT8A/?=
 =?us-ascii?Q?r4uDbbkFtyRwe+wTKYNj+6lxJOSbvaoi9UyVlCfWiuoAPyLRsiO0o0nRAr9H?=
 =?us-ascii?Q?uBw+1gdN4C5vESaI9RJabBS7RIuzGZaLcJHyty7/K/9y6ICIyD7LhwS1mmqu?=
 =?us-ascii?Q?y2AdADIVTZBnIekZodmBU3BXyxtmjEYOLAk03zTBSeXtlEFUp5yZMuiPYuRC?=
 =?us-ascii?Q?WopgI3OP+fCgdOAWDasoM5qiclaJzFnJmUwfALd17OjFmm0Muf1khhQ6dILy?=
 =?us-ascii?Q?3ghrhcBkIyMko3EIbyR9gEgPtDBp?=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 13:39:09.7104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 327aa756-37b9-45c9-8aa8-08dd12d6b356
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A61.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR07MB6330
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Dec 2024 13:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114139

Hi Qi,

On Monday, 2 December 2024, 06:35:22 CET, Chen Qi via lists.openembedded.org wrote:
> Before we rework the abseil-cpp and protobuf recipes, a possible 
> improvement for this patch is that we list the needed libraries in 
> RDEPENDS manually.

my main concern was (as you already may have guessed) not having the full set of
absl libraries in my rootfs, as only some of them are required.  But I cannot tell
which is the best option to achieve this.

regards,
Christian

> 
> Regards,
> Qi
> 
> On 12/2/24 13:21, Chen Qi via lists.openembedded.org wrote:
> > I'll explain in more details what the problem is and why this patch is 
> > correct, given the current status of abseil-cpp recipe.
> >
> > In protobuf's abseil-cpp.cmake file, there's a hardcoded list of absl 
> > targets used by protobuf:
> > https://github.com/protocolbuffers/protobuf/blob/main/cmake/abseil-cpp.cmake#L56 
> >
> >
> > This value in turn is parsed and used to replace the 
> > @_protobuf_PC_REQUIRES@ in protobuf.pc.cmake.
> >
> > Here's the generated probobuf.pc file's contents:
> > """
> > $ cat  ../build/protobuf.pc
> > prefix=/usr
> > exec_prefix=/usr
> > libdir=/usr/lib64
> > includedir=/usr/include
> >
> > Name: Protocol Buffers
> > Description: Google's Data Interchange Format
> > Version: 25.3.0
> > Requires: absl_absl_check absl_absl_log absl_algorithm absl_base 
> > absl_bind_front absl_bits absl_btree absl_cleanup absl_cord 
> > absl_core_headers absl_debugging absl_die_if_null 
> > absl_dynamic_annotations absl_flags absl_flat_hash_map 
> > absl_flat_hash_set absl_function_ref absl_hash absl_layout 
> > absl_log_initialize absl_log_severity absl_memory absl_node_hash_map 
> > absl_node_hash_set absl_optional absl_span absl_status absl_statusor 
> > absl_strings absl_synchronization absl_time absl_type_traits 
> > absl_utility absl_variant utf8_range
> > Libs: -L${libdir} -lprotobuf
> > Cflags: -I${includedir} -DPROTOBUF_USE_DLLS
> > Conflicts: protobuf-lite
> > """
> >
> > Let me use "absl_hash" and "absl_absl_log" in the above list as examples.
> >
> > """
> > $ find ../../../abseil-cpp/20240116.2/packa
> > ges-split/ -name "libabsl_hash.so.*"
> > ../../../abseil-cpp/20240116.2/packages-split/libabsl-hash/usr/lib64/libabsl_hash.so.2401.0.0 
> >
> > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-dbg/usr/lib64/.debug/libabsl_hash.so.2401.0.0 
> >
> > $ find ../../../abseil-cpp/20240116.2/packa
> > ges-split/ -name "libabsl_absl_log.so.*"
> > $
> > """
> >
> > See? The current package splitting of abseil-cpp does not match what 
> > protobuf assumes. And I thinks protobuf's assumption is correct, 
> > because there's really a absl_absl_log.pc file generated by abseil-cpp.
> >
> > And there's the contents and location of absl_absl_log.pc:
> > """
> > $ cat 
> > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-dev/usr/lib64/pkgconfig/absl_absl_log.pc
> > prefix=/usr
> > exec_prefix=${prefix}
> > libdir=/usr/lib64
> > includedir=/usr/include
> >
> > Name: absl_absl_log
> > Description: Abseil absl_log library
> > URL: https://abseil.io/
> > Version: 20240116
> > Requires: absl_log_internal_log_impl = 20240116
> > Libs: -L${libdir}
> > Cflags: -I${includedir} -DNOMINMAX
> > """
> >
> > And there's the contents for the absl_log_internal_log_impl:
> > """
> > $ cat ../../../abseil-cpp/20240116.2/packag
> > es-split/abseil-cpp-dev/usr/lib64/pkgconfig/absl_log_internal_log_impl.pc
> > prefix=/usr
> > exec_prefix=${prefix}
> > libdir=/usr/lib64
> > includedir=/usr/include
> >
> > Name: absl_log_internal_log_impl
> > Description: Abseil log_internal_log_impl library
> > URL: https://abseil.io/
> > Version: 20240116
> > Requires: absl_log_internal_conditions = 20240116, 
> > absl_log_internal_message = 20240116, absl_log_internal_strip = 
> > 20240116, absl_absl_vlog_is_on = 20240116
> > Libs: -L${libdir}
> > Cflags: -I${includedir} -DNOMINMAX
> > """
> >
> > We can then find the absl_log_internal_conditions library:
> > """
> > $ find ../../../abseil-cpp/20240116.2/packages-split/ -name 
> > "*absl_log_internal_message*"
> > ../../../abseil-cpp/20240116.2/packages-split/libabsl-log-internal-message/usr/lib64/libabsl_log_internal_message.so.2401.0.0 
> >
> > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-dev/usr/lib64/libabsl_log_internal_message.so 
> >
> > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-dev/usr/lib64/pkgconfig/absl_log_internal_message.pc 
> >
> > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-dbg/usr/lib64/.debug/libabsl_log_internal_message.so.2401.0.0 
> >
> > """
> >
> > What does all above mean? It means that abseil-cpp is not splitted 
> > reasonably. This could be proven by the absl_absl_log.pc file as 
> > described above.
> >
> > So, given the current situation of abseil-cpp, Yi's solution is 
> > correct. Before abseil-cpp is re-splitted according to its pc files, 
> > which then could possibly lead to automatic parsing of the protobuf.pc 
> > file to add extra RDEPENDS automatically in protobuf recipe, we need 
> > to have Yi's solution. And we need to use RDEEPNDS instead of 
> > RRECOMMENDS (see the 'Requires' directive in corresponding .pc files).
> >
> > Regards,
> > Qi
> >
> > On 10/1/24 20:42, Peter Marko via lists.openembedded.org wrote:
> >>> -----Original Message-----
> >>> From: openembedded-devel@lists.openembedded.org <openembedded-
> >>> devel@lists.openembedded.org> On Behalf Of Peter Kjellerstedt via
> >>> lists.openembedded.org
> >>> Sent: Tuesday, October 1, 2024 14:00
> >>> To: Yi Zhao <yi.zhao@windriver.com>; Yi Zhao 
> >>> <yi.zhao@eng.windriver.com>
> >>> Cc: openembedded-devel@lists.openembedded.org
> >>> Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to
> >>> RDEPENDS
> >>>
> >>>> -----Original Message-----
> >>>> From: Yi Zhao <yi.zhao@windriver.com>
> >>>> Sent: den 25 september 2024 04:17
> >>>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Yi Zhao
> >>> <yi.zhao@eng.windriver.com>
> >>>> Cc: openembedded-devel@lists.openembedded.org
> >>>> Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to
> >>> RDEPENDS
> >>>>
> >>>> On 9/24/24 03:02, Peter Kjellerstedt wrote:
> >>>>>> -----Original Message-----
> >>>>>> From: openembedded-devel@lists.openembedded.org <openembedded-
> >>> devel@lists.openembedded.org> On Behalf Of Yi Zhao
> >>>>>> Sent: den 22 september 2024 09:36
> >>>>>> To: openembedded-devel@lists.openembedded.org
> >>>>>> Subject: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to
> >>> RDEPENDS
> >>>>>> Since commit[1], the libraries of abseil-cpp have been splitted into
> >>>>>> separate packages. When protobuf is installed into the image, 
> >>>>>> only 48
> >>>>>> abseil libraries are installed as runtime dependencies. But the 
> >>>>>> output
> >>>>>> of 'pkg-config --libs protobuf' lists 66 abseil-cpp libraries are
> >>>>>> required. Add abseil-cpp to RDEPENDS to ensure that all required
> >>>>>> abseil-cpp libraries are installed.
> >>>>>>
> >>>>>> [1] https://git.openembedded.org/meta-
> >>> openembedded/commit/?id=dd6421e65eb75c35a904f4b487ba022075035
> >>> ecc
> >>>>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> >>>>>> ---
> >>>>>>    meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb | 2 ++
> >>>>>>    1 file changed, 2 insertions(+)
> >>>>>>
> >>>>>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> >>> b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> >>>>>> index cc5204de4..354b3213a 100644
> >>>>>> --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> >>>>>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> >>>>>> @@ -106,6 +106,8 @@ FILES:${PN}-lite = "${libdir}/libprotobuf-
> >>> lite${SOLIBS}"
> >>>>>>    # CMake requires protoc binary to exist in sysroot, even if it 
> >>>>>> has wrong
> >>> architecture.
> >>>>>>    SYSROOT_DIRS += "${bindir}"
> >>>>>>
> >>>>>> +RDEPENDS:${PN} = "abseil-cpp"
> >>>>>> +RDEPENDS:${PN}-lite = "abseil-cpp"
> >>>>> This defeats the whole purpose of splitting up the abseil
> >>>>> libraries. What triggered this change? Was it an actual
> >>>>> runtime error, or were you only looking at the output
> >>>>> from pkg-config --libs protobuf?
> >>>>>
> >>>>> Since the .pc files are in the protobuf-dev package, which
> >>>>> depends on the abseil-cpp-dev package, all abseil libraries
> >>>>> should be available if you are actually building on target
> >>>>> or with an SDK.
> >>>> Our customer reported this issue. Here is his description:
> >>>> The abseil libraries will be included in the SDK, but not on the 
> >>>> target.
> >>>> The application is building with SDK. The yocto build is adding 
> >>>> protobuf
> >>>> to the image (no explicit abseil libraries are added). If an 
> >>>> application
> >>>> then are built using the SDK it can not be executed on target as
> >>>> libraries are missing.
> >>> Can we at least change the dependency to a recommendation so
> >>> that it can be avoided via BAD_RECOMMENDATIONS? Because as it
> >>> is, it penalizes everyone that use protobuf for the case where
> >>> one provides an SDK with protobuf.
> >>>
> >>> My suggestion would be to change it to:
> >>>
> >>> # Recommend abseil-cpp so that all its libraries are installed in case
> >>> # protobuf is provided as part of an SDK. Everyone else should add
> >>> # BAD_RECOMMENDATIONS += "abseil-cpp" to their configuration.
> >>> RRECOMMENDS:${PN} = "abseil-cpp"
> >>> RRECOMMENDS:${PN}-lite = "abseil-cpp"
> >>>
> >> I think that's also not the right way to do this.
> >> Adding unnecessary stuff to release images to satisfy SDK needs is 
> >> wrong.
> >>
> >> I also wonder if the problem is not at the SDK level.
> >> If you build an sdk, there is explicitly installed package base and 
> >> additional required dependencies of those packages.
> >> The dependencies may not be complete and fully usable, only their 
> >> parts sufficient for the explicitly installed stuff is present.
> >> Are the sdk users assuming that full abseil-cpp is installed and thus 
> >> using also parts not needed for protobuf?
> >> The proper solution would be probably to include abseil-cpp 
> >> explicitly in SDK used in that way.
> >>
> >> Peter
> >>
> >>>> //Yi
> >>>>
> >>>>>>    RDEPENDS:${PN}-compiler = "${PN}"
> >>>>>>    RDEPENDS:${PN}-dev += "${PN}-compiler"
> >>>>>>    RDEPENDS:${PN}-ptest = "bash
> >>> ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-protobuf', 
> >>> '', d)}"
> >>>>> //Peter
> >>> //Peter
> >>
> >>
> >>
> >
> >
> > 
> >
> 
> 





