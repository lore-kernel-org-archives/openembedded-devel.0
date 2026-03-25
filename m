Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC03106B536
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 13:16:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22333.1774444599955060726
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 06:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EMktxOmN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75448586db=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P8xP2V4151309
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 13:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=fxCTLdGL8SFowswiZaFz
	cNR4Pr7X1S1883Vhq+qekq4=; b=EMktxOmNOmK3adG607i6uAojzZ5y1j/1cWto
	FOX2I9JAytXqcm4yle6RYXuAAQPGmSAujzgRrwHNm0Y9fFtNV9t9yCNAIOymuOP0
	1CCUiWspIwRfkRpLkTJzkqqCf8Qi1fYEIXmwW3EVak7sT2fv4m1eL4/Bi3TbWn9i
	n9j3U63g++ycxOb1hDJQ06yGX1p53p+J8llSn/ajckb2V9SNQ/7a+EXQMQEuAFKT
	zrOV3UTMa+8DTDJnNFEwL1zKncqHRx4z/0WdrDwGWz30499lxPVF1UgAa104TSec
	Si65coKhZ/yIIY9rdzg2q+izl0feZpQ288nDGhIy+Cb0+A3gUQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012058.outbound.protection.outlook.com [52.101.43.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1gj852hr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 13:16:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSNK9RzDJE1M6Stl3a5lDSkgzL6GjOP8tNoy/G4yOClVs5mmkn/J+qF9hnbAPPicSt1gqLEWa5PbfSD5/exwyXPM0K/pzRouIXHsZotL++jbLzCXG8YmUBUnX3ldImmNQvoEqHqzEV/fmNTHNi7Imc4uTw2kMFrpKqjWk3oS+yMyKwe1Hzw4BNp8t4TEz5+hg43GWcobjIYHFaJ2bAi2lqSgCrF8Y19Ky38gSSSzWLfgB6s3wPGOFZEpIxtrBNA26dlvLMTr6IEg69ujCyqVwvgSsBX8l30OPF99ggNqfgkUq/jVaj1cUcrE1OjV5zAX9kRi3HdDCEeCu81HXkRY0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxCTLdGL8SFowswiZaFzcNR4Pr7X1S1883Vhq+qekq4=;
 b=nJ+m5KM74HKd5PbrQtE7ZcdMIw13WFtsYqW8mYey+pqd16vPHzxy2/8i8K5pKkzXpLuQCO82Zh36ZzPtIC8rwCWFhqymhstG3ha2DC46E3vQva8u0aIePgzZjUJOXJTCdRJ1+gnZXD4GgZEcpCgQgBx8260aV/5HDcEo+nszplyXqt9xijBgfHupnaIwthlsGi1pOxeDUXh1Jw84rT/JFEb/f4pqV9CVvh4UnguqpLUMd6FpnD1P/bXWoVRx4MnR9kLtBumZMZ8w0LFGoEpCRxDiu2N74T9Z/R799ncpKnvh4vUu8+Y5rz89AuVNlWfAotAMD2d4rTi8eQY1M6oFpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by SJ2PR11MB8588.namprd11.prod.outlook.com (2603:10b6:a03:56c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Wed, 25 Mar
 2026 13:16:35 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 13:16:35 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] sd: Add sd recipe
Date: Wed, 25 Mar 2026 06:16:13 -0700
Message-ID: <20260325131613.2254096-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0103.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::18) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|SJ2PR11MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: d621b0fd-e1ca-4d06-21e8-08de8a70bd47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	yErWX5gBRfi2wWzX/3MpIpr2iu8vo829udg0ZuWXXDywbhZi7CtbxJqHo7sPxyJrmyabcB6Vx6g38PTNRpyt3wlRC9P6yKln5xH1uacEoX9+ODGN/OaA8vyp/UntHkVrMh9gU+Dg0wBP9Go5GOwzhiIjTrWINOKzERZUAABtG4NKmdClIEQCrL93FLYe/jsQ8dcB/14YCdUPDww5eomLJAdqL1H5IHxbxUGQUZc8+STBrXDs9OiVd9A+g7Cbv8CN+YecO3ZnDiZ9P98hB+IT9Ad5QPbDKMdRjIMeR2OoEVwVoi2p2/xcFq1DZXPJqzolDjpG8dZrSn+/Sqem76Vs6VYWP9eQ6+K/qiG3KnjxDiTW+Ku+75bIV1QJ915xAYrUq7nm0IbNrQzuwdvBB5Nx/V94ubzrF6cr0CyvfzPoqj15j5z/fuwPcMTvZMMLXfCetCrWCoIWG8ig2D4EI4mltFmIWQE9b2adAgk3CkNYUS6cZ0LhYikJvyIHANnxW/Q+zUEDnlVScME+ERLA6WnEgF53P6XriJigZ5nDn8goUIarLvzx08AUgTCC6WkMBSM9xD/zFxbuCa6tIkBWcfoKSWmKgnJNj1p+lpGvoRPBBa3C8ufP44VvBZcVT0dLGyB9puzgcCopIY2XrBw4M7u46twgvKXimFZh+XvtM7vcEacReYjKzMDm21qzFIiQ3SjhsMdUW9wNrn2gSQoskC/yfehe7luuETAV/NS/zQ321N2/T6Kn6/VWyjtM6VQ+mh67JImZtm8Jg/hYaMSZibLUKvwVTluqzgBPyAzq08u61Ag=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pyMYsuGEMNMa00G1sdB9j1ZlviIOopEPdWuxzpDWJatN+OyZRTlMpCdWIxcB?=
 =?us-ascii?Q?RnvU0rE4Fg/lzdJFSv++esTwvhs3Vb7bnLZauNJ2U8TXeSUHdP/Q/WitgtLh?=
 =?us-ascii?Q?ymOK+P3ahrtP2Wz+5Xpkp/oSCh+pWm8csmMzTtXGmOxx8EHLnQeZPYiysqoB?=
 =?us-ascii?Q?hT2ROyd2SBOo9k5Ec7SQePLTkr4N+PYe3aa6MsRieS0h/hj8a+SqRgFbHBfr?=
 =?us-ascii?Q?E+O+mR/X6X2+vmcvAecNxxcklMWDfjbN9tHNv+IJ+uoQrEujZPSV++bgXAiB?=
 =?us-ascii?Q?5pEANBwdQLry8MqnCga93PnFfG/DQcxaAB66Gh8vvaDtuPLhw8HrGPHsZqlf?=
 =?us-ascii?Q?p/Lw3WNxqDgKAuru2EMuiErD6Lkvko9I/pMZJug5b1uEXfloOTEgDSBvBHJj?=
 =?us-ascii?Q?+jd9VKdt7pQCaWrhFlTFuODZTwlQuBV+k3AhxaugolVTL6Or2ZM7dpqWHJpQ?=
 =?us-ascii?Q?CqoCxmlJOMUl4QasYoDbuXIO7GUsKWlLPZubTB+/fqmYHkVZftuFiOdc6ohD?=
 =?us-ascii?Q?NXTHQHSDP8GxDl6fD0DF6vne5VvGj+Q/tL0LmI1zLVhcYbbui7RPbqH0E3A8?=
 =?us-ascii?Q?0SznqPFNNtk6k4gAD/fQc6JyidVWqkfYjJ765XdMX/B43Zv+1k/BhO7Em+gw?=
 =?us-ascii?Q?mW40fCGMw/bvqecYbRDCACB3l8vDjXm+brE2ugXriZrTdiIr5DvPFbsDQ5k/?=
 =?us-ascii?Q?CjawcLqnVAncR562K01xqO7XgaDrXhyW0FEsxYA86nZO1EEes+3X2qfR8eOR?=
 =?us-ascii?Q?agxrbirnH17ZTFokuoIXspeeLLDq3CuBdvQ3j6stZPrg1wdlCh3DaOeOnbkj?=
 =?us-ascii?Q?VgPozCvMQoWVv69BkElJrRRlW3eGUzZlECjt9PyrLLLMfuCjk4zRoOHiP5O7?=
 =?us-ascii?Q?wdC+mVsLu+yfkqCqmHIpOlyMcE3VHh7ANKq/R0udEquXpM0X5LIXCCryAH71?=
 =?us-ascii?Q?GyN469kynxqfJrxEnx0Sk0F7MX0P5wz0RZyh6DetThqYKmVNITySaIVFjCWV?=
 =?us-ascii?Q?kUbuTwOMBtyPc0vFNccwB2921cT2QbkKh97muIHNXT4s8GlVPOkTLVHFN0Ai?=
 =?us-ascii?Q?mqIBmp71IurKRPpO5VZSF173RNBxOW80OqUnEobma12sNoO3ZGWv9u+6QUVV?=
 =?us-ascii?Q?qv5zz+8Wo01TpkaJKMEXSBfcymu8VHaCOOA5Voq7qSriAlkkh6T85rszc/Hs?=
 =?us-ascii?Q?u6B4l0vOs0SCFZw/lGM54+tPQ86FDb4HDw03IpGsO8Dmx1sj6HBPaoy7dxuZ?=
 =?us-ascii?Q?LVOEfxDRd/oOv5LNDUF/CywpajH4QNV+smyKJvvWr0HlP15hnclzxSiTK2LY?=
 =?us-ascii?Q?8hs4AM7GzpnPJK8ZX7oeKcLYGCTYQKFR38osEM8mBKHPVDCD2JK2iLe0L7GM?=
 =?us-ascii?Q?KnI2mX0p8xJmKzAydvigPq/VypgfjL6adIZGq8j/Bn8xRHBmKg7opR8R4rLD?=
 =?us-ascii?Q?/pZgxqmHxxsqhKEETEcrPJERY6ZpalfYNmrdm1I9H2oJYdC66wvzQssL1Udb?=
 =?us-ascii?Q?RLn6s72uySegGe/37wvRjUjEo5sZurxI15TSQ0YoHOzxNS7x1SEkajQF/koH?=
 =?us-ascii?Q?wKiQ4owy8CNnsJNdTRXGGWFOdzAWUtB9ZRS3JXrf/5LGVAYLIjyHtjqt26je?=
 =?us-ascii?Q?xPbTSwCWW57+Tu3xQkRKEPlPUQrE/qkKR05wwFGv8I+6cBzPV43rM/xt196w?=
 =?us-ascii?Q?922oX4O4D8gKU4wODzAqPw1o0ncoh6U3+/YjUnvbp5OFhWv2A0fq7dhrmrzh?=
 =?us-ascii?Q?wdJQ+gl9sbGc0DI5vOzck3kzbl4RjsJnGVzCRp1FUwQ6VYmJryCp?=
X-Exchange-RoutingPolicyChecked: 
	VaAnoOjjNfPouKCpDseHHftW8CSuxiXy+KXsO4tHfe8U91UfTJwNo2LF63K4sa8arFtAqDm1FHZJMMsrBWtNGOZdFaVT5g1ObmYbOuK92bdkXfafwhcn4Z6t5s+PQyNAw4z394DfWiKCMJcV8ULwfju/BEF/BCvyhHR+vSYIgmxOhsmpRIqFZ1Y5vWUABjSo/hBo9DTkKJ6dOoRDlDyMvR7fwTAHZdhOQjVDHG5qtqMnOI5WExC9s+ViiA9uhp/N1wFE8xDSHQMKE3AD9ng0LLBJWXnFSIesFE4qRUI6jVBAHUJ8qZ049E2kbPXfXVyWTMdAmfjhrN+CUnKZdVow/Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d621b0fd-e1ca-4d06-21e8-08de8a70bd47
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 13:16:35.2003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3GTZYeFgudhlNmAM5RfAoX5G4yed9Z6dgzIYTvmugKwhO1PjCAIDBnIL6OcJmPzFZutWaWEBx+Fo5KlWkt3mlIuPkIdNSiqM/ai611gsr4kwDfa4MHFKoHONd41mHJGD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8588
X-Proofpoint-ORIG-GUID: 0yiY95WAwswWBnynrcOmGRlldk3uZBbS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA5NSBTYWx0ZWRfX2RZiAXHvCkAw
 dlTdafrq44zcE61SZMb//+eulQ9udIJOxDup/qSgmad9Ar5pO0CUeJv/ym9pXp6iYwsgRCXQxTk
 7+D68w32FSddu1UmwC+HECEfMU3qMTdT7HNhxsKUELInS6a3fKfLDvb/4WLq4EgjKV+0+M98pP4
 yWrNL5N92W6nA/Y8EG+ILItnAwmGMWcwPEMMwXQwKcrYKpafePrRjBr9S+sQ0cSNR0LcruLDfx1
 JcwUlbIS9UxFg3LR99p35lcL4voXz+SS0PxTxqx8sHG0OV6wiTXp530yP1UC68Y6wDvGAw3rxBD
 aV6YZcQVFIvVV3c1i2R+OCthwTjR9JwSSarmqWnizQBxUYAiXY9G6fuzV+ZG4thlDV23CE75Dst
 pKZHZWQKxe7sZi5Q1TG6qdAFMgLYOeyGarJS2UJTUU4V3Ymuv2es2Vn/4MqxStITsC4+Y17+MjF
 oHaM37Zq80yrc3dRXGQ==
X-Authority-Analysis: v=2.4 cv=LtqfC3dc c=1 sm=1 tr=0 ts=69c3e036 cx=c_pps
 a=8P36fUQdMjs6HQlwNDQNwg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=cstK37-naMQLIFvBk1EA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 0yiY95WAwswWBnynrcOmGRlldk3uZBbS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 13:16:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125624

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

sd is a fast, intuitive, and user-friendly alternative to sed, written in Rust.
Add recipe for the latest release (1.1.0).

- Uses a simple and readable search-and-replace syntax, reducing the complexity
  of sed commands.
- Fully supports regular expressions, Unicode, and preserves line endings.
- Faster, safer, and easier to use than traditional sed for common text
  manipulation tasks.

More information: https://github.com/chmln/sd

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta-oe/recipes-extended/sd/sd-crates.inc | 212 ++++++++++++++++++++++
 meta-oe/recipes-extended/sd/sd_1.1.0.bb   |  27 +++
 2 files changed, 239 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sd/sd-crates.inc
 create mode 100644 meta-oe/recipes-extended/sd/sd_1.1.0.bb

diff --git a/meta-oe/recipes-extended/sd/sd-crates.inc b/meta-oe/recipes-extended/sd/sd-crates.inc
new file mode 100644
index 0000000000..a37e5fa2ca
--- /dev/null
+++ b/meta-oe/recipes-extended/sd/sd-crates.inc
@@ -0,0 +1,212 @@
+# Autogenerated with 'bitbake -c update_crates sd'
+
+# from Cargo.lock
+SRC_URI += " \
+    crate://crates.io/aho-corasick/1.1.4 \
+    crate://crates.io/ansi-to-html/0.1.3 \
+    crate://crates.io/anstream/0.6.4 \
+    crate://crates.io/anstyle/1.0.13 \
+    crate://crates.io/anstyle-parse/0.2.2 \
+    crate://crates.io/anstyle-query/1.0.0 \
+    crate://crates.io/anstyle-wincon/3.0.1 \
+    crate://crates.io/anyhow/1.0.75 \
+    crate://crates.io/assert_cmd/2.1.1 \
+    crate://crates.io/autocfg/1.1.0 \
+    crate://crates.io/bit-set/0.5.3 \
+    crate://crates.io/bit-vec/0.6.3 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.4.1 \
+    crate://crates.io/bstr/1.12.0 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/clap/4.4.6 \
+    crate://crates.io/clap_builder/4.4.6 \
+    crate://crates.io/clap_complete/4.4.3 \
+    crate://crates.io/clap_derive/4.4.2 \
+    crate://crates.io/clap_lex/0.5.1 \
+    crate://crates.io/clap_mangen/0.2.14 \
+    crate://crates.io/colorchoice/1.0.0 \
+    crate://crates.io/console/0.15.7 \
+    crate://crates.io/crossbeam-deque/0.8.3 \
+    crate://crates.io/crossbeam-epoch/0.9.15 \
+    crate://crates.io/crossbeam-utils/0.8.16 \
+    crate://crates.io/difflib/0.4.0 \
+    crate://crates.io/either/1.15.0 \
+    crate://crates.io/encode_unicode/0.3.6 \
+    crate://crates.io/errno/0.3.5 \
+    crate://crates.io/fastrand/2.0.1 \
+    crate://crates.io/fnv/1.0.7 \
+    crate://crates.io/getrandom/0.2.10 \
+    crate://crates.io/heck/0.4.1 \
+    crate://crates.io/insta/1.34.0 \
+    crate://crates.io/lazy_static/1.4.0 \
+    crate://crates.io/libc/0.2.177 \
+    crate://crates.io/libm/0.2.8 \
+    crate://crates.io/linked-hash-map/0.5.6 \
+    crate://crates.io/linux-raw-sys/0.4.10 \
+    crate://crates.io/memchr/2.7.6 \
+    crate://crates.io/memoffset/0.9.0 \
+    crate://crates.io/num-traits/0.2.17 \
+    crate://crates.io/ppv-lite86/0.2.17 \
+    crate://crates.io/predicates/3.1.3 \
+    crate://crates.io/predicates-core/1.0.9 \
+    crate://crates.io/predicates-tree/1.0.12 \
+    crate://crates.io/proc-macro2/1.0.103 \
+    crate://crates.io/proptest/1.3.1 \
+    crate://crates.io/quick-error/1.2.3 \
+    crate://crates.io/quote/1.0.42 \
+    crate://crates.io/rand/0.8.5 \
+    crate://crates.io/rand_chacha/0.3.1 \
+    crate://crates.io/rand_core/0.6.4 \
+    crate://crates.io/rand_xorshift/0.3.0 \
+    crate://crates.io/rayon/1.8.0 \
+    crate://crates.io/rayon-core/1.12.0 \
+    crate://crates.io/redox_syscall/0.3.5 \
+    crate://crates.io/regex/1.10.2 \
+    crate://crates.io/regex-automata/0.4.13 \
+    crate://crates.io/regex-syntax/0.7.5 \
+    crate://crates.io/regex-syntax/0.8.8 \
+    crate://crates.io/roff/0.2.1 \
+    crate://crates.io/rustix/0.38.20 \
+    crate://crates.io/rusty-fork/0.3.0 \
+    crate://crates.io/scopeguard/1.2.0 \
+    crate://crates.io/serde/1.0.228 \
+    crate://crates.io/serde_core/1.0.228 \
+    crate://crates.io/serde_derive/1.0.228 \
+    crate://crates.io/similar/2.3.0 \
+    crate://crates.io/strsim/0.10.0 \
+    crate://crates.io/syn/2.0.111 \
+    crate://crates.io/tempfile/3.8.0 \
+    crate://crates.io/terminal_size/0.3.0 \
+    crate://crates.io/termtree/0.5.1 \
+    crate://crates.io/thiserror/1.0.50 \
+    crate://crates.io/thiserror-impl/1.0.50 \
+    crate://crates.io/unarray/0.1.4 \
+    crate://crates.io/unicode-ident/1.0.22 \
+    crate://crates.io/unicode-width/0.1.11 \
+    crate://crates.io/utf8parse/0.2.1 \
+    crate://crates.io/wait-timeout/0.2.1 \
+    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/windows-sys/0.45.0 \
+    crate://crates.io/windows-sys/0.48.0 \
+    crate://crates.io/windows-targets/0.42.2 \
+    crate://crates.io/windows-targets/0.48.5 \
+    crate://crates.io/windows_aarch64_gnullvm/0.42.2 \
+    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
+    crate://crates.io/windows_aarch64_msvc/0.42.2 \
+    crate://crates.io/windows_aarch64_msvc/0.48.5 \
+    crate://crates.io/windows_i686_gnu/0.42.2 \
+    crate://crates.io/windows_i686_gnu/0.48.5 \
+    crate://crates.io/windows_i686_msvc/0.42.2 \
+    crate://crates.io/windows_i686_msvc/0.48.5 \
+    crate://crates.io/windows_x86_64_gnu/0.42.2 \
+    crate://crates.io/windows_x86_64_gnu/0.48.5 \
+    crate://crates.io/windows_x86_64_gnullvm/0.42.2 \
+    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
+    crate://crates.io/windows_x86_64_msvc/0.42.2 \
+    crate://crates.io/windows_x86_64_msvc/0.48.5 \
+    crate://crates.io/yaml-rust/0.4.5 \
+"
+
+SRC_URI[aho-corasick-1.1.4.sha256sum] = "ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301"
+SRC_URI[ansi-to-html-0.1.3.sha256sum] = "c7bd918cc0ff933f0e6cf48a8f74584818ea43e07d1fba1f9251bb3df2a37ca2"
+SRC_URI[anstream-0.6.4.sha256sum] = "2ab91ebe16eb252986481c5b62f6098f3b698a45e34b5b98200cf20dd2484a44"
+SRC_URI[anstyle-1.0.13.sha256sum] = "5192cca8006f1fd4f7237516f40fa183bb07f8fbdfedaa0036de5ea9b0b45e78"
+SRC_URI[anstyle-parse-0.2.2.sha256sum] = "317b9a89c1868f5ea6ff1d9539a69f45dffc21ce321ac1fd1160dfa48c8e2140"
+SRC_URI[anstyle-query-1.0.0.sha256sum] = "5ca11d4be1bab0c8bc8734a9aa7bf4ee8316d462a08c6ac5052f888fef5b494b"
+SRC_URI[anstyle-wincon-3.0.1.sha256sum] = "f0699d10d2f4d628a98ee7b57b289abbc98ff3bad977cb3152709d4bf2330628"
+SRC_URI[anyhow-1.0.75.sha256sum] = "a4668cab20f66d8d020e1fbc0ebe47217433c1b6c8f2040faf858554e394ace6"
+SRC_URI[assert_cmd-2.1.1.sha256sum] = "bcbb6924530aa9e0432442af08bbcafdad182db80d2e560da42a6d442535bf85"
+SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
+SRC_URI[bit-set-0.5.3.sha256sum] = "0700ddab506f33b20a03b13996eccd309a48e5ff77d0d95926aa0210fb4e95f1"
+SRC_URI[bit-vec-0.6.3.sha256sum] = "349f9b6a179ed607305526ca489b34ad0a41aed5f7980fa90eb03160b69598fb"
+SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.4.1.sha256sum] = "327762f6e5a765692301e5bb513e0d9fef63be86bbc14528052b1cd3e6f03e07"
+SRC_URI[bstr-1.12.0.sha256sum] = "234113d19d0d7d613b40e86fb654acf958910802bcceab913a4f9e7cda03b1a4"
+SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[clap-4.4.6.sha256sum] = "d04704f56c2cde07f43e8e2c154b43f216dc5c92fc98ada720177362f953b956"
+SRC_URI[clap_builder-4.4.6.sha256sum] = "0e231faeaca65ebd1ea3c737966bf858971cd38c3849107aa3ea7de90a804e45"
+SRC_URI[clap_complete-4.4.3.sha256sum] = "e3ae8ba90b9d8b007efe66e55e48fb936272f5ca00349b5b0e89877520d35ea7"
+SRC_URI[clap_derive-4.4.2.sha256sum] = "0862016ff20d69b84ef8247369fabf5c008a7417002411897d40ee1f4532b873"
+SRC_URI[clap_lex-0.5.1.sha256sum] = "cd7cc57abe963c6d3b9d8be5b06ba7c8957a930305ca90304f24ef040aa6f961"
+SRC_URI[clap_mangen-0.2.14.sha256sum] = "b44f35c514163027542f7147797ff930523eea288e03642727348ef1a9666f6b"
+SRC_URI[colorchoice-1.0.0.sha256sum] = "acbf1af155f9b9ef647e42cdc158db4b64a1b61f743629225fde6f3e0be2a7c7"
+SRC_URI[console-0.15.7.sha256sum] = "c926e00cc70edefdc64d3a5ff31cc65bb97a3460097762bd23afb4d8145fccf8"
+SRC_URI[crossbeam-deque-0.8.3.sha256sum] = "ce6fd6f855243022dcecf8702fef0c297d4338e226845fe067f6341ad9fa0cef"
+SRC_URI[crossbeam-epoch-0.9.15.sha256sum] = "ae211234986c545741a7dc064309f67ee1e5ad243d0e48335adc0484d960bcc7"
+SRC_URI[crossbeam-utils-0.8.16.sha256sum] = "5a22b2d63d4d1dc0b7f1b6b2747dd0088008a9be28b6ddf0b1e7d335e3037294"
+SRC_URI[difflib-0.4.0.sha256sum] = "6184e33543162437515c2e2b48714794e37845ec9851711914eec9d308f6ebe8"
+SRC_URI[either-1.15.0.sha256sum] = "48c757948c5ede0e46177b7add2e67155f70e33c07fea8284df6576da70b3719"
+SRC_URI[encode_unicode-0.3.6.sha256sum] = "a357d28ed41a50f9c765dbfe56cbc04a64e53e5fc58ba79fbc34c10ef3df831f"
+SRC_URI[errno-0.3.5.sha256sum] = "ac3e13f66a2f95e32a39eaa81f6b95d42878ca0e1db0c7543723dfe12557e860"
+SRC_URI[fastrand-2.0.1.sha256sum] = "25cbce373ec4653f1a01a31e8a5e5ec0c622dc27ff9c4e6606eefef5cbbed4a5"
+SRC_URI[fnv-1.0.7.sha256sum] = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1"
+SRC_URI[getrandom-0.2.10.sha256sum] = "be4136b2a15dd319360be1c07d9933517ccf0be8f16bf62a3bee4f0d618df427"
+SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
+SRC_URI[insta-1.34.0.sha256sum] = "5d64600be34b2fcfc267740a243fa7744441bb4947a619ac4e5bb6507f35fbfc"
+SRC_URI[lazy_static-1.4.0.sha256sum] = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
+SRC_URI[libc-0.2.177.sha256sum] = "2874a2af47a2325c2001a6e6fad9b16a53b802102b528163885171cf92b15976"
+SRC_URI[libm-0.2.8.sha256sum] = "4ec2a862134d2a7d32d7983ddcdd1c4923530833c9f2ea1a44fc5fa473989058"
+SRC_URI[linked-hash-map-0.5.6.sha256sum] = "0717cef1bc8b636c6e1c1bbdefc09e6322da8a9321966e8928ef80d20f7f770f"
+SRC_URI[linux-raw-sys-0.4.10.sha256sum] = "da2479e8c062e40bf0066ffa0bc823de0a9368974af99c9f6df941d2c231e03f"
+SRC_URI[memchr-2.7.6.sha256sum] = "f52b00d39961fc5b2736ea853c9cc86238e165017a493d1d5c8eac6bdc4cc273"
+SRC_URI[memoffset-0.9.0.sha256sum] = "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
+SRC_URI[num-traits-0.2.17.sha256sum] = "39e3200413f237f41ab11ad6d161bc7239c84dcb631773ccd7de3dfe4b5c267c"
+SRC_URI[ppv-lite86-0.2.17.sha256sum] = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
+SRC_URI[predicates-3.1.3.sha256sum] = "a5d19ee57562043d37e82899fade9a22ebab7be9cef5026b07fda9cdd4293573"
+SRC_URI[predicates-core-1.0.9.sha256sum] = "727e462b119fe9c93fd0eb1429a5f7647394014cf3c04ab2c0350eeb09095ffa"
+SRC_URI[predicates-tree-1.0.12.sha256sum] = "72dd2d6d381dfb73a193c7fca536518d7caee39fc8503f74e7dc0be0531b425c"
+SRC_URI[proc-macro2-1.0.103.sha256sum] = "5ee95bc4ef87b8d5ba32e8b7714ccc834865276eab0aed5c9958d00ec45f49e8"
+SRC_URI[proptest-1.3.1.sha256sum] = "7c003ac8c77cb07bb74f5f198bce836a689bcd5a42574612bf14d17bfd08c20e"
+SRC_URI[quick-error-1.2.3.sha256sum] = "a1d01941d82fa2ab50be1e79e6714289dd7cde78eba4c074bc5a4374f650dfe0"
+SRC_URI[quote-1.0.42.sha256sum] = "a338cc41d27e6cc6dce6cefc13a0729dfbb81c262b1f519331575dd80ef3067f"
+SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
+SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
+SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
+SRC_URI[rand_xorshift-0.3.0.sha256sum] = "d25bf25ec5ae4a3f1b92f929810509a2f53d7dca2f50b794ff57e3face536c8f"
+SRC_URI[rayon-1.8.0.sha256sum] = "9c27db03db7734835b3f53954b534c91069375ce6ccaa2e065441e07d9b6cdb1"
+SRC_URI[rayon-core-1.12.0.sha256sum] = "5ce3fb6ad83f861aac485e76e1985cd109d9a3713802152be56c3b1f0e0658ed"
+SRC_URI[redox_syscall-0.3.5.sha256sum] = "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29"
+SRC_URI[regex-1.10.2.sha256sum] = "380b951a9c5e80ddfd6136919eef32310721aa4aacd4889a8d39124b026ab343"
+SRC_URI[regex-automata-0.4.13.sha256sum] = "5276caf25ac86c8d810222b3dbb938e512c55c6831a10f3e6ed1c93b84041f1c"
+SRC_URI[regex-syntax-0.7.5.sha256sum] = "dbb5fb1acd8a1a18b3dd5be62d25485eb770e05afb408a9627d14d451bae12da"
+SRC_URI[regex-syntax-0.8.8.sha256sum] = "7a2d987857b319362043e95f5353c0535c1f58eec5336fdfcf626430af7def58"
+SRC_URI[roff-0.2.1.sha256sum] = "b833d8d034ea094b1ea68aa6d5c740e0d04bad9d16568d08ba6f76823a114316"
+SRC_URI[rustix-0.38.20.sha256sum] = "67ce50cb2e16c2903e30d1cbccfd8387a74b9d4c938b6a4c5ec6cc7556f7a8a0"
+SRC_URI[rusty-fork-0.3.0.sha256sum] = "cb3dcc6e454c328bb824492db107ab7c0ae8fcffe4ad210136ef014458c1bc4f"
+SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
+SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
+SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
+SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
+SRC_URI[similar-2.3.0.sha256sum] = "2aeaf503862c419d66959f5d7ca015337d864e9c49485d771b732e2a20453597"
+SRC_URI[strsim-0.10.0.sha256sum] = "73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623"
+SRC_URI[syn-2.0.111.sha256sum] = "390cc9a294ab71bdb1aa2e99d13be9c753cd2d7bd6560c77118597410c4d2e87"
+SRC_URI[tempfile-3.8.0.sha256sum] = "cb94d2f3cc536af71caac6b6fcebf65860b347e7ce0cc9ebe8f70d3e521054ef"
+SRC_URI[terminal_size-0.3.0.sha256sum] = "21bebf2b7c9e0a515f6e0f8c51dc0f8e4696391e6f1ff30379559f8365fb0df7"
+SRC_URI[termtree-0.5.1.sha256sum] = "8f50febec83f5ee1df3015341d8bd429f2d1cc62bcba7ea2076759d315084683"
+SRC_URI[thiserror-1.0.50.sha256sum] = "f9a7210f5c9a7156bb50aa36aed4c95afb51df0df00713949448cf9e97d382d2"
+SRC_URI[thiserror-impl-1.0.50.sha256sum] = "266b2e40bc00e5a6c09c3584011e08b06f123c00362c92b975ba9843aaaa14b8"
+SRC_URI[unarray-0.1.4.sha256sum] = "eaea85b334db583fe3274d12b4cd1880032beab409c0d774be044d4480ab9a94"
+SRC_URI[unicode-ident-1.0.22.sha256sum] = "9312f7c4f6ff9069b165498234ce8be658059c6728633667c526e27dc2cf1df5"
+SRC_URI[unicode-width-0.1.11.sha256sum] = "e51733f11c9c4f72aa0c160008246859e340b00807569a0da0e7a1079b27ba85"
+SRC_URI[utf8parse-0.2.1.sha256sum] = "711b9620af191e0cdc7468a8d14e709c3dcdb115b36f838e601583af800a370a"
+SRC_URI[wait-timeout-0.2.1.sha256sum] = "09ac3b126d3914f9849036f826e054cbabdc8519970b8998ddaf3b5bd3c65f11"
+SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
+SRC_URI[windows-sys-0.45.0.sha256sum] = "75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0"
+SRC_URI[windows-sys-0.48.0.sha256sum] = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
+SRC_URI[windows-targets-0.42.2.sha256sum] = "8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071"
+SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
+SRC_URI[windows_aarch64_gnullvm-0.42.2.sha256sum] = "597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8"
+SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
+SRC_URI[windows_aarch64_msvc-0.42.2.sha256sum] = "e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43"
+SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
+SRC_URI[windows_i686_gnu-0.42.2.sha256sum] = "c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f"
+SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
+SRC_URI[windows_i686_msvc-0.42.2.sha256sum] = "44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060"
+SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
+SRC_URI[windows_x86_64_gnu-0.42.2.sha256sum] = "8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36"
+SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
+SRC_URI[windows_x86_64_gnullvm-0.42.2.sha256sum] = "26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3"
+SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
+SRC_URI[windows_x86_64_msvc-0.42.2.sha256sum] = "9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0"
+SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
+SRC_URI[yaml-rust-0.4.5.sha256sum] = "56c1936c4cc7a1c9ab21a1ebb602eb942ba868cbd44a99cb7cdc5892335e1c85"
diff --git a/meta-oe/recipes-extended/sd/sd_1.1.0.bb b/meta-oe/recipes-extended/sd/sd_1.1.0.bb
new file mode 100644
index 0000000000..6dc369fff9
--- /dev/null
+++ b/meta-oe/recipes-extended/sd/sd_1.1.0.bb
@@ -0,0 +1,27 @@
+SUMMARY = "sd is an intuitive and fast CLI for search and replace"
+HOMEPAGE = "https://github.com/chmln/sd"
+DESCRIPTION = "sd is a command-line tool written in Rust for simple and \
+               fast find and replace. It uses familiar regular expression \
+               syntax and also supports string-literal replacements \
+               without escaping. With clear syntax and sensible defaults, \
+               it offers an easy-to-use alternative to traditional tools like sed."
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE;md5=aec69d9265f7a44821317ebe1e576f1b \
+"
+
+SRC_URI = "git://github.com/chmln/sd.git;protocol=https;nobranch=1;tag=v${PV}"
+SRCREV = "4a7b216552d64134c0fa17a59b9d557d89019f0f"
+
+inherit cargo cargo-update-recipe-crates
+
+# Build only the main binary ("sd"); helper binaries like "xtask"
+# are dev-only and not needed, preventing extra build artifacts.
+CARGO_BUILD_FLAGS += "--bin sd"
+
+require ${BPN}-crates.inc
+
+INSANE_SKIP:${PN} = "already-stripped"
+
+BBCLASSEXTEND = "native"
-- 
2.49.0


