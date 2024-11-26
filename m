Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3870AD5A6F8
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 08:11:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.40900.1732608693243139551
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Nov 2024 00:11:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1060a1ab4c=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ52WdG005193
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 08:11:32 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433618aya9-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 08:11:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uh3w1HR/2o4GBp9EKCShPicSxh5UdzRY5h7q69WDSeQvEu5E0FoIOGp/MSFYmR9pxR+UtJqNuRWIKtdWigfLhuXv+F0rxCnxdI/busFg7zYJ5VE0YVRw1XzbmKZ+CvmnPolhCz0kVS8H4XO5Lyo1Ut41DlC5ce3oXPBK4MDMJeGdkhiAcn8pqjtsls//rJFexnnIMVBJfzBn3PjAHwt8sPWQEDtGkLh+L5eC3WYVZ0rHWBFHx6A3F/7FpBx7Er/rS/duqtYJSeMnd4W+QCFXMcw74vL0ls0tr0YXfugdfTLI6kMKm4nnRXLVpZr49wKO1ADr6aYDaNzsAN6GClOqsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wmPoBNWy9sO3flp4Wh3a2CZfMcN8bURjdtHb2GuSJg=;
 b=zU58mQw3DFNabnHHtosDpe4+1ghSL1m2+CXw2CMtb+W7WnI3ifZfFqwmUZeH4JYaCZDfUapIjxanOq8zyEbcjBhG09zN3AWTOGt9/1HPpXpsVYwdzJj5SAQqh9Xg5u0CkjzYe3VwXYpqD4cPlzE6QhBuP4jwKiFqIAVaLsSiM59kjX8wuNx3iY2ze/l7yaGLJb4R9S8bdLbAZMEp32Uyx+i6Ko5yboZ1HA3FBcvYq1P7W80UOAR3XKM7hj3G3389gZ1D41h6DV1ZwOCNUd2OH1VN0iKET4fWc303KJU476g6uZYX8/TdTGlKse4p8iDkjzJVFJsyWI894ZiKhsU9Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Tue, 26 Nov
 2024 08:11:30 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 08:11:30 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH 4/5] frr: fix CVE-2024-31948
Date: Tue, 26 Nov 2024 16:11:15 +0800
Message-Id: <20241126081116.2535308-4-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241126081116.2535308-1-peng.zhang1.cn@windriver.com>
References: <20241126081116.2535308-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0066.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::10) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CYYPR11MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 83b98b57-73ba-4827-b572-08dd0df1ef0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?58vk0taUySGdfKxxt4grBiFlgRYG3ENCoZy6zkq8PiOSNqsOy8tjaYifZVqV?=
 =?us-ascii?Q?sj/eIbObQn2hBGhvLsDLRP89rcqaXP8T/DcnfUH3IWYb6/H2RLTWV1ElQ2Iu?=
 =?us-ascii?Q?iV1bQPB9QNgG7O7lwSl7Irk6kx7WKrjFMzeyt+agIVLcne4nt8ZBzfCIqZ8J?=
 =?us-ascii?Q?v0W9bSNZ3hxDTnbaMcdiSRJzKs5QdhjK9zAUyzkFnBMzQRhrwSHB7jAL6JVw?=
 =?us-ascii?Q?Dgj9e/2T80Uzik5ppu0yAeg79SCTbcBMELdWOCpw49CU2/xTS8I83jrmXmE9?=
 =?us-ascii?Q?25GIwzyxshQ7WcYTu9bM8qhKsU2aFlMpwG5qVsiAyXy4r8AvJzEFcnNsc1ds?=
 =?us-ascii?Q?dx0EWkGJoAygVchW3hKT8QSq1vRxulpp2Yo3v/EhFhnPU1tV2vgMYQzMLvHz?=
 =?us-ascii?Q?soGQLm/J8abh82W+MNnPC7C6QhF8hWZd4ipJNgfcMUxoiEUKSIOXbnwi6YeS?=
 =?us-ascii?Q?73A+xAPSepHbdXl71wIo3PWbZJA0wBe8B6qNpSVQ0aT8cOGnS+xEEUd146pp?=
 =?us-ascii?Q?hNDWc3Ec61XSHr4hX/md/j+PEG1cCnoTfFqT0tAXzdoSp4xTvmzZbrD7ODGG?=
 =?us-ascii?Q?SGQXmJuczj49+sntaLkxX/3ddCIOXBy3munz9Y8425uVO+soPkPYMhdootYH?=
 =?us-ascii?Q?vBpvIZjJ5qwDVFpr9FhJeFdYwL8QxZGvpLUZEBHLmPBrPLI87QvfStKQMvt6?=
 =?us-ascii?Q?QWYi2/IgwVaZTmWhedetWm814AbOJmgImUtCw7EM2khFM8SdIpKV7kKzkMd/?=
 =?us-ascii?Q?ZqRLENTvkgnaZRVFpN6YuRG9RZlpWInKUpUXwf/n2xsa+7YCjkTPTJCPxw+7?=
 =?us-ascii?Q?tbg5A2PwsUkMnO3c63ovwnLblR/nDwCq8ENYjI3VJy7FvDEGaTWB4/x6Z986?=
 =?us-ascii?Q?BxkX+Pn/hN6AQYxWdjWHqAN16aO1y9P5AMLS1OGz+ZdLn4K5Y58pHnUGIz+w?=
 =?us-ascii?Q?2OiOWiJ75E5jeArpAx25m6uThsPebacDeyDHTiCttOfATgRNyIrcDggDxUb0?=
 =?us-ascii?Q?R6Ya57l3C/PSbnm2ZEqb1FTWCXm+F7eM7QgmHexJ5axYcfGCdnNN6lZS2VsP?=
 =?us-ascii?Q?uGKY8UDPp3W3O0lCmebJ8KKPKt3M16GxuivP1AaJlZzwJ8yGKx0C48HzDg6H?=
 =?us-ascii?Q?y8zGf2pruBshRbB15eU1NjstTr6QVDKZo24BirnY1fVbeWDkP2ROqdTvlk5U?=
 =?us-ascii?Q?0HbyjSWV/NiYHBSY1WTbkDxh8Ljyp1+4NjxliHe/5nPR/KFqhXxvTEjf7L03?=
 =?us-ascii?Q?eTPGnFfyzc9WUq+KOx7G3a5TQIxTAyO1TkEWyqqH9n7u96BWWymFJnfV+ajV?=
 =?us-ascii?Q?ida6OImiE5fnFHSxtbTn7FVzXFxgSBKTd4NJ/EdAkC5T4B6qreJEG7d5r+s9?=
 =?us-ascii?Q?BuE2AfU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aGavjd8+Y7aMKk1kqBwSYSUgOJiQ/2/Zt77wgvb1al6WK/EkKTt3XZR9WAS4?=
 =?us-ascii?Q?z68MWx3N+38d87k2wC+KlXdi2sokIZS7coxxx6c5wxw7chr2wyFvVm0zjzmH?=
 =?us-ascii?Q?jVsgW8PFjKQLWmYeAtNT7IpkemhpS7t2CuDwaeveGHEiZx1gD3YDxlbaKqJQ?=
 =?us-ascii?Q?NAX5JWKYOhCbJ7sx61uB15hJUK7OKXbcjJyBDbORlDgZuATk1hTG7POa9VAW?=
 =?us-ascii?Q?zTd8k+SGi/JQrVK1J22T4E4ZML0InVORTrZAIqw000shc+PWZ9yoMYCIgZQW?=
 =?us-ascii?Q?1hzEutzssiJVef3moxqljKVrhevZQLvaHasnAElkgyB27ksULQDV0/12QrxW?=
 =?us-ascii?Q?+Q/GMMpG9Qr3TPsmp9eaY3gzm2xA+XXPDWIbj3gOLzRKRPN7mb9iFuYk61u7?=
 =?us-ascii?Q?rha5qphuKbnB+LoYci0poE0TE08MfUOSMydf9tR8M+9UcrF+UirAW1UvdOjP?=
 =?us-ascii?Q?x2jmVOCYeIDkDva/TLMbAWf3+EsEPwQtJ72VF/WMhH9tA7Wmaw6sQVGLJ0zD?=
 =?us-ascii?Q?cXJh0E3xeOLLd8QQnQOXfAyKYNBejrBIL9Oli7VEvm/vwkilVJPEwPt+rF4Q?=
 =?us-ascii?Q?KtBfBnnAP8icj6eXDUbsz2VLLsjFk300UynGqxpnVk199I9KELJN3MGZpyYR?=
 =?us-ascii?Q?ijbWhhlN42uFOvSg2VFqWbc5ChWyj28mplJJREV7hLdygLl1f/FRhAxNdvEL?=
 =?us-ascii?Q?cUTs1zALJFFMHIlyYRUs6zXdrdt2Qm9vf7ClB6MX8WigASFasl+vhgwxPGXn?=
 =?us-ascii?Q?pVsxw0Q8YNhpNLKXzu9if96+50cVP3gElHepxmXwFjWbpZyfKLVrwYoT7MMf?=
 =?us-ascii?Q?qZd/lloyy84cyvcOjR3FaSIKs5UYouOpDQ8U+9PmkKMLOIUxljFKYqul5323?=
 =?us-ascii?Q?0ML796mS+Zpya0YdUQy2lxxTFEODa1i91vbs3ZF61CMF3S7vSpVi8mghY1hk?=
 =?us-ascii?Q?q0cbxEragK18DojnhqnP36rnngDhH6vQPVw8xvrSBAmePB5C+DTdhWzE9dzV?=
 =?us-ascii?Q?yBJTogVAvNhSCrvTgRgmRNocX8LWBjb9a2wqaFyjlW4P8wApKEhyjTiZ0Xfu?=
 =?us-ascii?Q?34tyD73r4+DAgsX+6whcvO+R1mRN355L6lwVlCfATRjNFlNNgekrMYup6nfs?=
 =?us-ascii?Q?dF8Q2XRg5Q+VXRLumfIJXIRVm6jQBRblkxE7++CYQxd7YDR6Fo7pI2cfA9Uw?=
 =?us-ascii?Q?7Xqom9T44IoVLf8QxHjy1HLqOu9T1auLU8Q01xkMNWgHaA4mcOAmcMcIEEHt?=
 =?us-ascii?Q?qlMNbNWugwQiAudcSTeA+u+LKCS7xq+JG4tH+YJjvCslgnAnl4e6QppvHkJk?=
 =?us-ascii?Q?Qxy4jqw67vaI2vxaBWRbT8isFari0M2JgbasPZqSwJWtfyXGuOm2oalMi0NV?=
 =?us-ascii?Q?uy2bTtvQm5KMCl7mU8WofHPlk0JSMdPPybvdkai4MRZJbC7xnZDQutvFn7rD?=
 =?us-ascii?Q?ymistQcWAOOiPunEKq3hIU1SsBWZBmG+crJ/TvTKZ945h+xZNMdGE04X2mMt?=
 =?us-ascii?Q?6fBnZXZrZ4YJ1voqN5cRGzWvIu+ZH7MptayTBal9UHuQjrJovH4f8cmHnuQa?=
 =?us-ascii?Q?TAnatnZGmpxBTP819up9miXwZGd40SeO6HV4TZnnizKn4pzzV7NyldcKK72o?=
 =?us-ascii?Q?oA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b98b57-73ba-4827-b572-08dd0df1ef0c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 08:11:30.7241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LeMDBgXrbgcZj1ZVgDuLHjsWz9Hzbn5fweukmnlnqtF5K4FCFuj8iEIuKK6TiHXgTfZ8u5zqQz3sirOjN87fkycJE8EiGe3Pgrf+oi7NFwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8430
X-Proofpoint-ORIG-GUID: ylFlxxmCjdvlsm9d3N5UpQWdsy1ZMGBU
X-Proofpoint-GUID: ylFlxxmCjdvlsm9d3N5UpQWdsy1ZMGBU
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=674582b4 cx=c_pps a=AVVanhwSUc+LQPSikfBlbg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=87jn28RfAAAA:8 a=vggBfdFIAAAA:8 a=u4Fk_TazrX1v4TD7wRYA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=aVDrfO6s1PESLM1EhDzk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-26_06,2024-11-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411260065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 08:11:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114066

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-31948:
In FRRouting (FRR) through 9.1, an attacker using a malformed Prefix SID attribute
in a BGP UPDATE packet can cause the bgpd daemon to crash.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-31948]

Upstream patches:
[https://github.com/FRRouting/frr/commit/ba6a8f1a31e1a88df2de69ea46068e8bd9b97138]
[https://github.com/FRRouting/frr/commit/babb23b74855e23c987a63f8256d24e28c044d07]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../frr/frr/CVE-2024-31948.patch              | 130 ++++++++++++++++++
 .../recipes-protocols/frr/frr_9.1.bb          |   1 +
 2 files changed, 131 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-31948.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-31948.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2024-31948.patch
new file mode 100644
index 0000000000..bc1f2edc7d
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2024-31948.patch
@@ -0,0 +1,130 @@
+From a11446687169c679b5e51b57f151a6f6c119656c Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Wed, 27 Mar 2024 18:42:56 +0200
+Subject: [PATCH 1/2] bgpd: Fix error handling when receiving BGP Prefix SID
+ attribute
+
+Without this patch, we always set the BGP Prefix SID attribute flag without
+checking if it's malformed or not. RFC8669 says that this attribute MUST be discarded.
+
+Also, this fixes the bgpd crash when a malformed Prefix SID attribute is received,
+with malformed transitive flags and/or TLVs.
+
+Reported-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+CVE: CVE-2024-31948
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/ba6a8f1a31e1a88df2de69ea46068e8bd9b97138]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ bgpd/bgp_attr.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
+index 56e77eb3a..2639ff864 100644
+--- a/bgpd/bgp_attr.c
++++ b/bgpd/bgp_attr.c
+@@ -1390,6 +1390,7 @@ bgp_attr_malformed(struct bgp_attr_parser_args *args, uint8_t subcode,
+ 	case BGP_ATTR_AS4_AGGREGATOR:
+ 	case BGP_ATTR_AGGREGATOR:
+ 	case BGP_ATTR_ATOMIC_AGGREGATE:
++	case BGP_ATTR_PREFIX_SID:
+ 		return BGP_ATTR_PARSE_PROCEED;
+ 
+ 	/* Core attributes, particularly ones which may influence route
+@@ -3144,8 +3145,6 @@ enum bgp_attr_parse_ret bgp_attr_prefix_sid(struct bgp_attr_parser_args *args)
+ 	struct attr *const attr = args->attr;
+ 	enum bgp_attr_parse_ret ret;
+ 
+-	attr->flag |= ATTR_FLAG_BIT(BGP_ATTR_PREFIX_SID);
+-
+ 	uint8_t type;
+ 	uint16_t length;
+ 	size_t headersz = sizeof(type) + sizeof(length);
+@@ -3195,6 +3194,8 @@ enum bgp_attr_parse_ret bgp_attr_prefix_sid(struct bgp_attr_parser_args *args)
+ 		}
+ 	}
+ 
++	SET_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_PREFIX_SID));
++
+ 	return BGP_ATTR_PARSE_PROCEED;
+ }
+ 
+-- 
+2.34.1
+
+From 70555e1c0927b84f3aae9406379b00c976b2fa0c Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Wed, 27 Mar 2024 19:08:38 +0200
+Subject: [PATCH 2/2] bgpd: Prevent from one more CVE triggering this place
+
+If we receive an attribute that is handled by bgp_attr_malformed(), use
+treat-as-withdraw behavior for unknown (or missing to add - if new) attributes.
+
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+CVE: CVE-2024-31948
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/babb23b74855e23c987a63f8256d24e28c044d07]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ bgpd/bgp_attr.c | 33 ++++++++++++++++++++++-----------
+ 1 file changed, 22 insertions(+), 11 deletions(-)
+
+diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
+index 2639ff864..797f05d60 100644
+--- a/bgpd/bgp_attr.c
++++ b/bgpd/bgp_attr.c
+@@ -1381,6 +1381,15 @@ bgp_attr_malformed(struct bgp_attr_parser_args *args, uint8_t subcode,
+ 			(args->startp - STREAM_DATA(BGP_INPUT(peer)))
+ 				+ args->total);
+ 
++	/* Partial optional attributes that are malformed should not cause
++	 * the whole session to be reset. Instead treat it as a withdrawal
++	 * of the routes, if possible.
++	 */
++	if (CHECK_FLAG(flags, BGP_ATTR_FLAG_TRANS) &&
++	    CHECK_FLAG(flags, BGP_ATTR_FLAG_OPTIONAL) &&
++	    CHECK_FLAG(flags, BGP_ATTR_FLAG_PARTIAL))
++		return BGP_ATTR_PARSE_WITHDRAW;
++
+ 	switch (args->type) {
+ 	/* where an attribute is relatively inconsequential, e.g. it does not
+ 	 * affect route selection, and can be safely ignored, then any such
+@@ -1418,19 +1427,21 @@ bgp_attr_malformed(struct bgp_attr_parser_args *args, uint8_t subcode,
+ 					  BGP_NOTIFY_UPDATE_ERR, subcode,
+ 					  notify_datap, length);
+ 		return BGP_ATTR_PARSE_ERROR;
++	default:
++		/* Unknown attributes, that are handled by this function
++		 * should be treated as withdraw, to prevent one more CVE
++		 * from being introduced.
++		 * RFC 7606 says:
++		 * The "treat-as-withdraw" approach is generally preferred
++		 * and the "session reset" approach is discouraged.
++		 */
++		flog_err(EC_BGP_ATTR_FLAG,
++			 "%s(%u) attribute received, while it is not known how to handle it, treating as withdraw",
++			 lookup_msg(attr_str, args->type, NULL), args->type);
++		break;
+ 	}
+ 
+-	/* Partial optional attributes that are malformed should not cause
+-	 * the whole session to be reset. Instead treat it as a withdrawal
+-	 * of the routes, if possible.
+-	 */
+-	if (CHECK_FLAG(flags, BGP_ATTR_FLAG_TRANS)
+-	    && CHECK_FLAG(flags, BGP_ATTR_FLAG_OPTIONAL)
+-	    && CHECK_FLAG(flags, BGP_ATTR_FLAG_PARTIAL))
+-		return BGP_ATTR_PARSE_WITHDRAW;
+-
+-	/* default to reset */
+-	return BGP_ATTR_PARSE_ERROR_NOTIFYPLS;
++	return BGP_ATTR_PARSE_WITHDRAW;
+ }
+ 
+ /* Find out what is wrong with the path attribute flag bits and log the error.
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-protocols/frr/frr_9.1.bb b/meta-networking/recipes-protocols/frr/frr_9.1.bb
index 807e4ef8ef..7043cad0f6 100644
--- a/meta-networking/recipes-protocols/frr/frr_9.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_9.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/9.1 \
            file://CVE-2024-34088.patch \
            file://CVE-2024-31950.patch \
            file://CVE-2024-31951.patch \
+           file://CVE-2024-31948.patch \
            "
 
 SRCREV = "ca2d6f0f1e000951224a18973cc1827f7f5215b5"
-- 
2.34.1


