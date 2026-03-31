Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF505FF60CE
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 05:55:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13990.1774936541503785167
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 22:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ksqbF7Rc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8550d9304b=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V4OXZd1999440
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 05:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=/EuYapvj23BYcpM0T+qE
	OFF/zh9Hh+rGDNnFIBiC/BM=; b=ksqbF7Rc0f3yLRfu+jnleOg+nZoT08mdODMp
	878gEfUrFTymdGxnCeFuSPh4EFIgkG2T9Bxvwb6IOw4kWQtBIzc7Rqf8YPnp6UQC
	YpWZiLju/UomL0Iwge8VYlA3mjwg7jjdTeVD/wfRwyPEUGNwdOb6BgtwLBb3XqOp
	DH8J2pzLwGQ8Lu2iBC0wr4wN8QEQXfjwAnh7e33YvuRdquY3zeeSMWRFn5Muagm8
	xkVmUNSkyink5D0MNmKtDtXqDE1CCzNblH2ZiZd8f0knnWIRPZ0V/38MNUnZXxdn
	WjcmtfXKHAnCs0xcVYnNjhgwdD4RiHfoQTLZhQie0kmnMQyuEA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011000.outbound.protection.outlook.com [40.93.194.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d646vu76c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 05:55:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C536T21rMZD9UBA5YNbFgRqfY/G67RH+LRDRIR98rMUQgTjI/MVRZrbTwMSv2zoEc/T3cKI+JFx3BO49zPvGapuhpgSHP/DCJHjNwPr+LpeG0O9GTCJdQKE8YwgpxGoDP235Krzdn6E/G6NR69gT6LGU2X9SPrQDxUYhNuWJ9Soz1C+hb0YTJde6hRyXyqeF2J2Ev94FBqKQ6VtBRgUBLxcd0vu3rD0ilJBlBG3+v0m4aEzj1m9lQ2tUcVDJN5JG4EBSZTHW+tVit7akXDzcKpw7+5P0UcgICUT/iRGhxGoINDw4dR01vyWrVENXo5bjRrVDDYR/JuHhUL+T5TdGZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EuYapvj23BYcpM0T+qEOFF/zh9Hh+rGDNnFIBiC/BM=;
 b=VkyeeRZjSMAZlBcSdpczj5swtaiihCC4iOrQXYqtkkb3LGQVgVp/mpqS0mBH8ryK5AsYWwQHUPUzEVnc/P9Ks940KrA4+daFLJ16TeOkUyHkylRXxCNtwvR4LyJoIyUJPVaVkNgfeAKkE1ig/6jfyJQcCwUSomLJ8YiGlmxE5vf26UeHl70hCWFnVl9LrfPrppvXtSpAo141UvWvW9jJxINkMIhG9T+fxjOQEbMaEbUpVXZI3t2syiBQ9HTFtLsHarfUpa338sWG7A/T3FgH0CRbrPKv1ORuPKOcP7f/us92zC2vFmXh0V/N7h1W7cdSLAex1HprVUAFIES+JswrsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH7PR11MB6748.namprd11.prod.outlook.com (2603:10b6:510:1b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 05:55:36 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 05:55:36 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/4] strongswan: update PACKAGECONFIG soup
Date: Tue, 31 Mar 2026 13:55:17 +0800
Message-Id: <20260331055520.444552-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: IA4P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:559::8) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH7PR11MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: a92e350d-9c6b-4610-1d8e-08de8eea2115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	WWX74OVefF3uoRYdRhDxVfh6Os8TIrXJaWMBB109BmzaWrPomQ6a+V2eppyjCYeDBOsAcYO4Mau74kpWvogZND9jLGrpTIngcBUzgkJeHwPlPdPIT0NNvidHnBajdNHR6gxi9PQ2O++pvlv00ZJPSIu96WuEDKDTm+9EaGL8f783DDshTryDpXKJjYqmdwi2miqM/5oshNCsNm15hwaqGg0kRGS+pKLEtYoi6XAXrrdQGmcphg8uM4qASePb/wAsWEIK4JUX5x2MRkonpsjc0sbSGyE3KtJjaBT9I4i4eNJ9KejpBgc95+itljtaqtFLYsokZJpSoo4+TqynL4wmeVhDFQeODOwLHW4ESNGOCzygu28vSlkiPe4pRq6aWwUSRV6JjzANQOuJ+mDuD9dyY0Pk5lQ3Hm3ndj5O1x+fdUwrRLlONR+O91BMfA4H7ZfIdHpsJ2lTFbqUxz2vuPTVscWws1EbRDtKEOy3bPppKLdQWo9uaZ5XMclOQKp7tXuzkYaP90A8UTddHB4iEzg8VeLopNWY3jSblIdqNrqQGEh2cs6yi4puX6s/vkbkuUFcrJLyyajq0Z/a7aFfVz9U39RcH6/7oEjOTa9MtGy7iVqUvTrgybINwPSTTnBr3KgE7usbwIGOl6nAiGPlSAEgOINR/wvFi4a37NJ1l5TOI06lyUwzTkeF1DPf4HvhwLhKSEvXa6aywmVdik/ENSrcEtkK0U/AEngeraVxRnf0W8ijKSNkB99lMlGCmHo2+vdJgxZXr30bTm99GWM0c4uEmr2Q5yLMrfhQqlN4RWl5Aig=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XS6CnUMRyhURG9YXnGyzZ8vuRcnpS4JVXA7nZGk5fliXALzwyCWjWIX1zfY1?=
 =?us-ascii?Q?O2FqqRJJB0Ap6scNuxFWgtThQ8nZDnc77HAbdFTlc4tDA0v09OKoTIsH5kLr?=
 =?us-ascii?Q?lTgZslajL6It+JAlnGwe4ZoRDLzk7Kao5apqArSAbIy2Y8kxnEK7GkFo3rhi?=
 =?us-ascii?Q?bDqDdwTIC556yoBkst3dZi7ECqCYzYS0J8REQIq4SqPU4WY92V+qMPm8r8Nw?=
 =?us-ascii?Q?9B8RVjfc7OfBdDNON7FyGGsJIRYn9Z4sZwHFht4MF+ey10XRCNVxP0Va6B64?=
 =?us-ascii?Q?8xD/hdLJkIK4MZzYkJd59jo01H+tohRzy2qi//T15rD3P2KwhjixdPbOaqGH?=
 =?us-ascii?Q?PHhmquD5gBRFk1ZEA/MwH4mvKiA6gDMfoz0RzjPAWz3QbakWdsPpMhTFUH4r?=
 =?us-ascii?Q?TCY0LR24F8FR3bA6mRb0YtolPOLj/qA5dZnJLHtT2lxoLFTIluPklAbpsqSm?=
 =?us-ascii?Q?ac6irldlpZyiVMDHRNCZ2TlvQlSnqJzzVl2p/tFXFsabElsAgtUFYWNM8c7p?=
 =?us-ascii?Q?jBJfQw0oiUD8fn/q2sPyd3EKpw63XiRQBISAOFZ/NDYyR8rfkmv0SDpwNcqF?=
 =?us-ascii?Q?JBeaQ5lr3svht3kAPxKLmh0kmW2Uy9Vl8O4Hgblp05jKxue3Oj57KPphi2gE?=
 =?us-ascii?Q?ko9n57Je09XO3AUbu37HzL+kEYkUruNd/wsvF6tklpKJgtGrvyg5aNC9NBIj?=
 =?us-ascii?Q?wigTH40HL5IH5OIn+V4bGd8SOYtZ6hBztGzb2IV2O7kqfmSvnW22eA1yQM36?=
 =?us-ascii?Q?2eyyCEJac4z2/Yve1/c+q9plt2SdmcLSf1fse/T3L0SeeMSaFzptsnHUxVnx?=
 =?us-ascii?Q?vysxlKpPWHV09NalaPDuP8aXja3EPJtVXxekN/44msxV6I37uX6aPMzSxjD9?=
 =?us-ascii?Q?4is8niRqgPAbSwQ++sQ8Ztz6VIdsVhWYSaMDHch6Wg7AjpzLH5U4Umph8giv?=
 =?us-ascii?Q?mZFbJt7CW1voJX5mOMRdB9dfNPjYzgXrtnImYKVBi1zgECaNy5iWToQP4kv/?=
 =?us-ascii?Q?m74MDEjgVwo4oChNN18hSnbd3N6Rm7dvMEg+k6/G7eZa1nhch9QnazZ9ok4Y?=
 =?us-ascii?Q?CdtWPxnmdRdJer5IyagDvCsaTKbcU3m8NgeTGOei2WoaNdL4PAd0VhAVg+dJ?=
 =?us-ascii?Q?qEdnHScdjwDlphv1xYa4f03u8yFWqd2db++PdFyuIeCpYxrATfrdV5OFWYTU?=
 =?us-ascii?Q?HJJGj7xYiz4S7hQvVDjsdslxb1qleAyJKmZkMB5tKwuBhVnN2rF0VAvjyDv1?=
 =?us-ascii?Q?QPEKlvQlgqzzNc1qVMJbAEjZsSCj8I2H0GeBeOkgKhfgXpiSTeTGHmESNCJE?=
 =?us-ascii?Q?l/CCYzF9jiNP8Tjt3c66oPhgYM+AcOJWRKubP0WfE9P+5ji+4BWYNRKftjPM?=
 =?us-ascii?Q?cVjE5xWlcKn+wWexEXFpsyfp3MXrQR7gYFheNu8ijhatf1qEjZXdtiLUZzym?=
 =?us-ascii?Q?x/vsIgKm7/glKVn6WSCRrvaSOuPqckI7SuXjguQIJ4tPO1OAe2jsAWyMjAnn?=
 =?us-ascii?Q?aez0n/lz2dY7jnGQWBT6X3sXMj6HvpoiJAfy99R+S47uGNsHt07wxKirb/6c?=
 =?us-ascii?Q?kb19Uj+uxLZ2u7l/5Ajkvb7y2BT7ah7CUB4COHZkWnBYVXJlL4w/FRQBxu7c?=
 =?us-ascii?Q?n/ioEoimEY8iOago+T5yOWQ8pa2vAXk1ktsMZUeU9lLIY7ESV/5atVBYscDW?=
 =?us-ascii?Q?ZbPH412BuTexf35K0GAX3FYiGIlicP1lOesw4jNZ/Oo1AeAMKj4qeBwgi+3M?=
 =?us-ascii?Q?t24m8gKQjRTcxV5zBUm7CGXExhk6psU=3D?=
X-Exchange-RoutingPolicyChecked: 
	W5IovdO77B/kXqZLbapXgw+8lBThgZEruSoSkONrLEV0Cfo6UDDHs0/EiO46Za4CkNaMah/nBa5Wk70kwPQqPLiTzK828wOPZFWGRro2ydiB3PQczGZDknQFs5HTNriErZD24idwHjS7tTKDMnKSDa77hKZ4OmVSWfGxzXwxcLu4M63gEJnX0Z/Y2k30oICeRm0abSwznXm5ES9VdauIuDN6w5tH+KSI/ED5pUWeTzDQH2c0gWLMOwlOjN4vt8KFnjTDb0tPnqPirWaxLL8w6SAo1fW5yrrTDGmzom1vJbiHlcSn3UmjpCxuDEsEuPt+ghZq0Vb+BknDH2SAGr7x/w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a92e350d-9c6b-4610-1d8e-08de8eea2115
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 05:55:36.5398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CgIrSUFv49NvFvZEzrtnS0YdqUP/aURnuMaFq2s/uQ3yuIH3mdeA0CstzArHosUMwPvOLxBjQAa9t16coGXjlwJSVNxWQw+Ie/cFS+y24bY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6748
X-Authority-Analysis: v=2.4 cv=Zqjg6t7G c=1 sm=1 tr=0 ts=69cb61dc cx=c_pps
 a=QnZ2uEdZlRAtgHxfLCbJPw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=tnuk59Wu1iIBOb2KLCAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: WYl_tOoVUqQiMq8pTA8rNYLPiaI-N87-
X-Proofpoint-GUID: WYl_tOoVUqQiMq8pTA8rNYLPiaI-N87-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA1MyBTYWx0ZWRfXyadyzhsUUZX7
 fZ+SZXXSGsBe+od6/DptZa6nK4wZKoWE0D14rZTv+uIuztYba+Pf/W68Uom5WULhVWyRu3d5pDB
 6SkAGGfcys0CxrHMLsUv9gh0Y4pBEc4FLvxzfxHHBONE464cSjy2jlW7w3+r562saNcoXhEDU2k
 WIk1PsKsCdABndHskvpK7fJVS269CjbFFBb3LaYJIOVp4kPnE4IhGN2wMKMAgiNBAlUWM30rtW2
 msIKDKik8DPuwJYGUzp+qRF+O61/9RD7byjJ6mTwfFhBCQMYj7xxP7S2QdQeWHAGXOwRqd8w3U6
 KY3qy1JdhxQn2IUKJvA23lb791HKvNG8gELch5Ntp2asrT4oSMK2O2ENJtkp3SRGBhE8tIvabns
 y/kwRFZEIKk3/u+loJWq4rCrGkhrUWhy+H/Fradcj7kCZs+X9NRp9ZB0PEaNcrU1ZW5Om9jDtKT
 Hjqc++NLcHmjUOjwxEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 05:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125873

Refer [1], this can fix do_configure failure:
| checking for libsoup-3.0... no
| configure: error: Package requirements (libsoup-3.0) were not met:
|
| Package 'libsoup-3.0' not found

[1] https://github.com/strongswan/strongswan/commit/6ddabf52d5f335147601c7c2797da21820efafb8

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-support/strongswan/strongswan_6.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.4.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.4.bb
index 2587722b6d..fb44a3f946 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.4.bb
@@ -48,7 +48,7 @@ PACKAGECONFIG[pkcs12] = "--enable-pkcs12,--disable-pkcs12,,${PN}-plugin-pkcs12"
 PACKAGECONFIG[rc2] = "--enable-rc2,--disable-rc2,,${PN}-plugin-rc2"
 PACKAGECONFIG[sha1] = "--enable-sha1,--disable-sha1,,${PN}-plugin-sha1"
 PACKAGECONFIG[sha2] = "--enable-sha2,--disable-sha2,,${PN}-plugin-sha2"
-PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,libsoup-2.4,${PN}-plugin-soup"
+PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,libsoup,${PN}-plugin-soup"
 PACKAGECONFIG[sqlite3] = "--enable-sqlite,--disable-sqlite,sqlite3,${PN}-plugin-sqlite"
 PACKAGECONFIG[stroke] = "--enable-stroke,--disable-stroke,,${PN}-plugin-stroke"
 PACKAGECONFIG[swanctl] = "--enable-swanctl,--disable-swanctl,,libgcc"
-- 
2.34.1


