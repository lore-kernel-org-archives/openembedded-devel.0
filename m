Return-Path: <xiao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153BFD39426
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 13:44:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15967.1775137438844076919
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Apr 2026 06:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XMJncdcG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8552e98255=xiao.zhang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63238epk3116781
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Apr 2026 06:43:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=LDoYQnV4D
	x+4P1TxqHDipmSgYYckTkZbkMGk33V8a+4=; b=XMJncdcGn+Fn7LyccD/A0HrK6
	LE1W461V7PDs3luoEVxD41EfYW/gdTwbrj9Eymp8PbL0rUpOdqo5nui41c9QBv5k
	cxVaaRgFWpRdHHyi2qyuqjyjVWZpVGn8aDjgMKIVWpCpXUPg9jvcMUOX0etd0j+e
	qt0uoK3364CMrwqfIiber1zSVqxObEatke9n7+fgQ+FzCv8Bg59zbPSIwkN/uHym
	4vsHxGZg7q50mUxqQUiU8y/0IARtuWOMrtSKnULhqb3Y9ty+kRDjshydzT5XECsf
	YC/Us+OvFX+/yJHR4ijWh+5hcs3DSQM7HL401wC6jwxS7esPkGUufmAMHeygg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012046.outbound.protection.outlook.com [52.101.43.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d6a8vfsuu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 06:43:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zbv/TWkhA6BVsCSGMrFvLNRWU3GJkdOiCiZLxDYZBXmrIjB5U2vipju0zr4OZnSD4RdS1Dgnlo+DRorV4GMOJaiUBzDAnydCwIOqqhe4qZ0clYQ1+NknOUj6tlEnFfA5DnM/5yjHdLgHwFJGN9Tf4NdmVjCPaOi3OWzIlpb53m/Hm10wvJzNcYx6bA8GpXdyFd8l/sPqm+0x4/LnbjZjoYgeRgxbLV6VnGsvDLQmrm8nrVZc57fRalNv+IM+y0ynybAERLxiZxzjRYkiee5WO4W8tb+bUybIOINb+bXL2EmwX/gTfj3ckZTABZtBTmfF8YsU8clZYwDKhO1CIDTnYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDoYQnV4Dx+4P1TxqHDipmSgYYckTkZbkMGk33V8a+4=;
 b=ftlMnqONnUmGQOOxcratB2szHDqfwL+FqoMsw3jUCMP0Fg05Si8WIddgnmnyN0ClZgyqR8qqk0K3jYaKU8QQ6cQLKZPktSYCulMG6/Gx6Zo6oWTorSdNLnjk2cQCmW0wySiRVJSwCRCFVvWrwRXqPZ5zhhp3gQ2wA+i86NZAVI3sO3ADfNcvG+2UZbvNwrBo81tV43ka/+nsGXwMb4ibX/UEcec6YxTYysRFKjBYPkLguHeGtByZWgq25oef4QHtt6lf9HpsRrDB0MNwCgw9Pcl/XwZzkbZOvTsHwE6yYytB8F7W9mIgH7paK8SiTyAr8jCpfIseJ7tnxbdAD9aGPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6080.namprd11.prod.outlook.com (2603:10b6:8:84::8) by
 SN7PR11MB7509.namprd11.prod.outlook.com (2603:10b6:806:346::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.15; Thu, 2 Apr 2026 13:43:55 +0000
Received: from DS7PR11MB6080.namprd11.prod.outlook.com
 ([fe80::675d:2fe5:276a:f11d]) by DS7PR11MB6080.namprd11.prod.outlook.com
 ([fe80::675d:2fe5:276a:f11d%5]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 13:43:55 +0000
From: Zhang Xiao <xiao.zhang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: xiao.zhang@windriver.com
Subject: [oe][meta-networking][PATCH] ebtables: Use update alternatives for "ebtables"
Date: Thu,  2 Apr 2026 13:43:49 +0000
Message-ID: <20260402134349.2558762-1-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0063.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::8) To DS7PR11MB6080.namprd11.prod.outlook.com
 (2603:10b6:8:84::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6080:EE_|SN7PR11MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: 710ca681-0919-4c3e-43fd-08de90bde286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	sLFbUTdqSWX6vjD7w5Y3ijnHFjakE8BHt9i6hyuAYDOx4uhaMcBzUe4Oq/M50e8ikmNZ2djroboCLuDabUWBEFI0hXctaTmRMcn15r6J0xnUXIEsMro2eQ+cece+SEwfACpenVwZ7pL0VBp64MH0/aRjGGgOf8Xfd9ILM4AXAfH/9A6UANd+v3DBb4eGqVtaTvf87lzHGHlTOboJYNzUg7KchR/O79jq5utW9yBcHYbN1Q1b6OIjBAupQxAUwkwCTIkFb7lAmm88/V0JHC/KOT68KtP0CwbnspQY41JbiSkWY+S85DdZ1HWKrMgw3s7eutHOgYOW6bYGALg61PHXqWKdAhQ06J0y9GGJeSbnZ0Xn7bNwiLxtn4x3+VAKTrm+U5DGheFh8QEGglVdLPjjonf6nMRnQ4j3FtQzVbqyJQa2OkICk7SGSTIpwbExgF1HTTCnduZD0zO+JlMXcAHMfcWaCrIUpI4F8d4DXEitDoaECCMaGgYuIV/vqloguiHNSF5sSmpZObIFVKGw8cTAx8kFquAKQPyYtTR4kem7UFDLflNKnNuanek3jReJSLITte3Z+cmozmEpAUv5I4xpSu/47zb0Fcz2YgiPwUiAhGylTxwJpcHC/q9N7yNGKJ4jPCVtX9Gxs/5MT82TD0v5vF9++h4HOWh0hqqNvt8bFSrJQ5TQSZ7zOAT3rgWj22Qd4AN7IiMKyBC519Q2nsmIgaro8Ci1seKL4xQ33R6Z3CfMjIGDMVo7aLA/XPhKu1olhJg96nASra1zx5c5DKGHMRfOUgZ/OQh78pq1gQ8Yd8w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6080.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GloJOTJ0ZQFbeXeFDxX3A1VNIuT9Lfzjb3zsZBeLGFOXYneSrffqyvdOuF9y?=
 =?us-ascii?Q?sIZHKadpTCrlYW67DFJsqTOLulGIjx8XBHO+Ol2Ggk7+5Rqb75Xr7zpL0lEK?=
 =?us-ascii?Q?kpwUjVZrXl/9pdxGbaKo9BD5M3U5+9WHtAVs+9nSmnAtIVZ415H4HYXwYqXw?=
 =?us-ascii?Q?kZ26HpkgnAbbzASNzcrCdgOUJuyTuZluUiaThX7NhR+desPNOfu7haiGaHNA?=
 =?us-ascii?Q?kEr5PYU21LX8CYjZmRe5Xun2jT/6Xc9Mv/7QpkwEzkJy1bbnGvquKLu+gZkv?=
 =?us-ascii?Q?kwdOalBz70XsbnaCiYfCCFUr5JLOFErfPdYGiJHhBo+Tz75KhAvbHznY2RyB?=
 =?us-ascii?Q?6dKXn36ZgsWxu6nwvIClS0uOxawzHoBnVbe2UwvEG/0nOCue5lhndCBeRkDa?=
 =?us-ascii?Q?4Erp8TwN1IXmbT4u2cDG+2737F9UtLb2GAQByADa9Jj23FSPoGeeP7eOTbCa?=
 =?us-ascii?Q?mBCFHIq7vrpsmK/+97P1/yjgSg1HVNj+hz6wbjvS0U2aMCQgTxCBNdu+F4Wj?=
 =?us-ascii?Q?9Y6KWEEGZcxhg70vQhwS0cK7C4cBBeqAQMZDNjmtfOgEl3DMmsxHUYIRZDLf?=
 =?us-ascii?Q?GKRvyQKechbgQCQwgB3/Ha1eidemu21xfQAJtZ/NBgY1/y084RUiVGzkclje?=
 =?us-ascii?Q?tpOUa7bgFg0tMmGU/Nf6iRy1TZflTSeBIrOAnIOTggTJrO9iedXVyiJpDgSU?=
 =?us-ascii?Q?n0ohL7tSsKDRaEZIa6jajya9o13F5ydru84IIwOD+YrWqWv2H8A4sTingB1w?=
 =?us-ascii?Q?VTdaKLUfw9t7eNqQ0Vv/Bze9RR6cq+IzHW2tJ7hLkw3oZy/53/v6BjNo1T6V?=
 =?us-ascii?Q?fxcSRZyhrwWuYd+vjumQ1KQluUMcksjp7IR8fz/kFcg8FEvTwxXBmvWjmXjW?=
 =?us-ascii?Q?I0OUusmFTJYzzJ9AD+rzvk/L5+GRp5khAWpwIInehSTDO8g5o6akY6XUrZ5k?=
 =?us-ascii?Q?MD2pNLMYRoopkOqWJ83SBSf7zgGKmWdt/XJDIIjVN/mT5erH8FvjrvmZK2v0?=
 =?us-ascii?Q?Fxq2S8unnL35FvnW4NHab3H57RnoVQq3p54v/D45Il/OtGx4yGwoUEbFyTJ6?=
 =?us-ascii?Q?Yw12ve86alG/6XdCKEYZW2hgvxSc9uQ5esn+IkcPN/dfIix7Olb5/8DJV/Nr?=
 =?us-ascii?Q?FWleldTxKSAG5ocii6+PhELniNKAuu3LxunnVJtTEiSYvp3W9Ve8C4FaDqSK?=
 =?us-ascii?Q?BlxLZ158b+UmXqzHgmV+uvxVqyIgpwjgcb9m5M8jOP3iQZcycF3p4cdpt0oJ?=
 =?us-ascii?Q?Hrd/RXnnXOccayrWdBPUBl3QQgFrqlG2FA02sMy2V9vISzvNwe53rV1jLKux?=
 =?us-ascii?Q?yL3OM0/hM986diag4nlJE7nXQa4hbtx9ZM7VmRphfFRAoIbvXztydGqXBxLl?=
 =?us-ascii?Q?x8ljWdfuL9esRsYwkNJrHd+2FLTzaTuY+HkIFH4ahO/S0/m7ZQLt+CsmCWKP?=
 =?us-ascii?Q?Un7X9iXdvfJ1J5OylCbep2dPx+e0IVVXVKaWskyurTfLnKwzLWwHUZFPZChx?=
 =?us-ascii?Q?wrD1iq0ihC9o2zunovkhPoSbH1xr0qR/vv+1vKCa+UItgNAVz5J3eEyCS8vI?=
 =?us-ascii?Q?I7pNPbpPVJ753xvD6fW21PSu+iUMlja6bAAireYHEDB4Lsn3MYQsaXrkUI77?=
 =?us-ascii?Q?VozNs/4/MnYlOreXtor4zU2Zin83dTYNWecJWtEf23fkxIdfrbcqGthvn+Ts?=
 =?us-ascii?Q?fOPNKZfZHk5rACwvssuw8XrUo/TzK3nnRpmHfSpbRBXmlM5OVfMitE4DaA0u?=
 =?us-ascii?Q?PfuLW1EJ1Wy/dLl7aUcNXrASm4A/eqE=3D?=
X-Exchange-RoutingPolicyChecked: 
	HtkaRq2XMiQCCK+282QiGQWyazFFW3ZT1fwsQbAbERX+5JLnVLc8iJiFg2zm6JBPULO0Azzd2ZxgmB1ZjzZhfUy4wbNOcP5l5thWLuSxV4STMGx1wREB4aNer899P5cuKFfBq2AT3in4x4nz577fCt5Q3mIxsNzMBUbFq+pDO/lnNUd4bM0A5gPglWmUvSJVOMjjLRv6032amm67rcyQNdcPvkHfecNGxb37hTb31f4IaYNEhooL7irLFwmq9sreVBHFKlF6G7ftMelq63nD/gMhosGKssTIihD5Au42VPSwLP4l9mYomeAPMDyt6jo3o9nsHYg0bRDaw6fyHIHK+w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 710ca681-0919-4c3e-43fd-08de90bde286
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6080.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 13:43:55.8530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdTMqMXiwnnZVnpgEd6QvOkRmV7cKphGZNjESyWnQqFcK0AeAJ8ACXmLranLs11ZolcGMGIAaNMzqrrOCTgIzcRcErMU47JxwqFastLi6KQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7509
X-Proofpoint-GUID: Z_jubXf_rx492bTVvEik3ETt5fdxxU12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEyMCBTYWx0ZWRfXyY6oKNaBCKbN
 Pc/bZqOSm9bnFOvb0uxzTxo3UW76Vvb0571ALALecpEgxyh472jzmSL1Z38Dfcl4K8ce0uc/99y
 3h7CDIjlF1aqya2ieZZ/KkpNcSPAQbOs0kqq9NfT9nA/9O17jv0KPZK5m12A0ozDVHXi7JZOTQC
 V5S7s/ok41Eeyoe9LVs6V8FSLte1fhMcvaWtzHkjjrj9YxIjjuG5DoMYr9vB0fLtq+waktCC9jl
 cqlkAfV/tkkU3+B3R85CxgEYeiIfCEStCaFXl3n9fOKuO/0AWsD665h4j8NQIbuGjQTfrVxGDMe
 n5SFAHrpFQEUQDUXEhaqKknhbfywKcg9mJBDeuuI0j3dlsGttwro0Sg3DK9wgKV6g83KMhLj4cL
 Fbwi9Ai6OK1UhfJvXjkSbrzv7a20RPfv/bx2jSQ7lBIrYq4Ri5E9ZoImfYx+ieODvd3V0caXznW
 XK3db14QPmr/wET2JQQ==
X-Proofpoint-ORIG-GUID: Z_jubXf_rx492bTVvEik3ETt5fdxxU12
X-Authority-Analysis: v=2.4 cv=ZKHaWH7b c=1 sm=1 tr=0 ts=69ce729e cx=c_pps
 a=2EcEh/UKxA6NVIT+L3iE4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=NbQ8Lc32ByzW4zsrGy8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1011 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020120
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 13:44:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125967

The ebtables utility can be provided by both ebtables and iptables
packages. Set higher priority for the version provided by iptables
to prefer it.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
index be8c49854e..5ae30e440c 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
@@ -21,7 +21,7 @@ SRC_URI:append:libc-musl = " file://0010-Adjust-header-include-sequence.patch"
 SRC_URI[md5sum] = "071c8b0a59241667a0044fb040d4fc72"
 SRC_URI[sha256sum] = "b71f654784a726329f88b412ef7b96b4e5d786ed2bd28193ed7b4c0d677dfd2a"
 
-inherit systemd autotools
+inherit systemd autotools update-alternatives
 
 do_install:append () {
 	# Replace upstream ebtables-save perl script with Fedora bash based rewrite
@@ -49,3 +49,7 @@ FILES:${PN}-dbg += "${base_libdir}/ebtables/.debug"
 FILES:${PN} += "${base_libdir}/ebtables/*.so"
 
 SYSTEMD_SERVICE:${PN} = "ebtables.service"
+
+ALTERNATIVE:${PN} = "ebtables"
+ALTERNATIVE_LINK_NAME[ebtables] = "${sbindir}/ebtables"
+ALTERNATIVE_PRIORITY[ebtables] = "90"
-- 
2.53.0


