Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1848.1793653933927973798
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2026 13:12:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EsamAVBj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=576698308e=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K7Eex3118079
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Nov 2026 21:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=sohIEbh1u
	/b8dxJmeUqqhtg2YFotLRCWMdDkUJm9RqE=; b=EsamAVBj9BaYSoMM/rYFkKsQQ
	YmV192q3gQNNfRlrcBoL1ZXVzIPLw4GJlXLIW9iFBortmWVL36b08dHadu0SQGjk
	Lk7jx5vorCzoU5wGsnIoViLjGDujJwu7BcaX70TaJAyPYXELjK6cVRRL+lKEotl+
	lndstgBwMF4AD1NqMRKpe+t5+IU0cXKAE8Z5kz5o2nqzC+qPSXQr9xUFcIdA0UF9
	OiSxi287JvKIz0hrhtPeAc4t2aIs6hvL+qlsaoBuHElG0gINYH77k44I6WZPasCu
	ZV1FU/kH08BEfpuopa0PL2mwzb9P39HACCUFx297lrUIcpX52prJcBl5B1nug==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020116.outbound.protection.outlook.com [52.101.201.116])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hn7a6u5b6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 21:12:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7fJ+kyWZg9P43Ong9C2aJin84vbgryEOsA90wfEuvM88GY8X9CyGEBy3rOAvQ/lIwj2zKo5XMDk8PIS7N7HFKuS0JDIbR5Qj2+zT8Fmoh2zdV/DH2UWFHJsmuvjNGAD3aBEpBV9K1z8OidbbCU8KkCOzVgXz/SV0e+YLodIlaFi7ZLd2j9VhmfN14qCYkOUSf0Ed9vrjWAlROidwf0Bco+gYkz100wozrkhV3uUNl0VBUK7CHGjOkwDM8TEfjEBgkMbdxube+kIt0U1v9vVCMdQkQ3AHTqZksVAAWFaL8lhDFuCYMof8MKKGO4AgmGvqSLGfvWmIZV12wCfVv+Tnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sohIEbh1u/b8dxJmeUqqhtg2YFotLRCWMdDkUJm9RqE=;
 b=oTWLC1TnKr+PbPjepVAe5emF1uyAjLYNPTDQRkJklmdIfzlv5s8w8nObeU4inqeIjxJYh/QBneyTYHu+443g4FgIEm6R8/+IP6NyDnqg3lciynS7GtbTIOQLhKckfm0CcCdFtDnTE7mmMzsRuv2qVY3PkB6DMqQUNQ9fDhhSR+bjkyNPjLQDCmP1AA9yJ3BLpm/0sGAiQJ1UmXXU/HFc8H/rBMnI/PDg+X9HQTnGt1hCwu5LmBmaUSsbFKBV2eYTfOBaUVv/x3rQuii8LiqB2nDnGLdxNr3chX4MqqJleuUEXOuleA2OZHrWy3Xn2xf/QqRmB1M/3uEIrhnovpQXUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 MN2PR11MB4741.namprd11.prod.outlook.com (2603:10b6:208:26a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 21:12:08 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 21:12:07 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: kris.gavvala@windriver.com
Subject: [meta-python][PATCH] python3-pillow: patch CVE-2026-112393
Date: Mon,  2 Nov 2026 15:11:42 -0600
Message-ID: <20261102211142.319090-1-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH1PEPF0001330E.namprd07.prod.outlook.com
 (2603:10b6:518:1::9) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|MN2PR11MB4741:EE_
X-MS-Office365-Filtering-Correlation-Id: c269fa2b-6f34-4d67-293d-08df3925f337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|6133799003|260925022911599003|260925021311599003|260925021911599003|18002099003|56012099006|261102123227099003|3023799007|13003099007|10067099003|261009223027099003|261022115727099003|261022105027099003|261021121427099003|261021123027099003|261022075727099003|11063799006|261026140227099003|261028144727099003|38350700014;
X-Microsoft-Antispam-Message-Info: iMNSGPUIpnZN40vZWd0C898z6DhECEjjJZMsdlyGfIh6IYU8tLQuMtwLCfDkyuG/jBu/PwEr17wrAa4FYzbqfSboz2ZdsWlF++ylY0+YfChnp3iJxgZfn5FMh6/8xZbXcLxwAWffXeYlPSzTGSGBOW9p5WsZBtPagF93sOQEfVxMHPi4S0cjCz0Mj9mfMYLgYM6tJngeljJ1uzuL1YoevXqtrX2IUEPv8BbHAtDTyTyMrAklRiAtH4cSrpst6vXH0keZ3KG6BuBUfSpCk8VCQN9+O1GB0RTLz/pEeOmsnKsFsHC+h3weUi7l0mv7Ljv7ku5UXVFcQdKAizr0GnYYv0xbqd3sa/pKv7uI3E/cbmupbkqN8Lrir8DBHcGWqShBnmqH4cBlEqHhGIHz2BgcTNRQyeN/ySLJk608Tt0O8j+nK6+9Bvt2YKcFWPaFX5C443Drr4HDyaQ7dd9l4KHTBkeCSBK6o6nMCvQ1/jKRXNp5oyLgCtvG2x6Cg4YUipW6mfsau0xFEqQECImd8J3Jh5VkNIJiceRjtsfLBWCmQLUJqD7hln7DVOkZvhuBrfWVdsMyjj8OP3VDEX9PXWPvjgYhaF+Ae41lsGlVh1ySs66SZ7AmakII0Kel9rh6LWTNym/s+nFwGjLEkL9TY9C6tt49gok7etLZEwV+cXOSngvcpSiFaZb1Sm6/c74xfXjh1enymOgbnKcrEtIj6dq56X3e8O8Y3PnR54lom2v785k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(6133799003)(260925022911599003)(260925021311599003)(260925021911599003)(18002099003)(56012099006)(261102123227099003)(3023799007)(13003099007)(10067099003)(261009223027099003)(261022115727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261022075727099003)(11063799006)(261026140227099003)(261028144727099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i9ewF4mi0oqXQqovKjbjlJPtNGGyEo3cgH+1tV3OedbbSlX0Y2aYC8r57utD?=
 =?us-ascii?Q?7Uqo2698wEpOH1twhkFRgk1ZM9vWsLaTyr8e3JHbCWuWcs4ez/KDamdK3S1D?=
 =?us-ascii?Q?N27bPJ41N1Nc7SJMdERMFuWvOlN/+b6jQrrpO3a9y1bGKdgiIqK50LSR1W9P?=
 =?us-ascii?Q?AQRmO5Pe7CLw8xOQ4DjNm0iTqF1Y9DPc5Bv7OdVdWPBMXCvx4mdPw32SPFGZ?=
 =?us-ascii?Q?InMtjbVjdEOqm1OdONH6YjSdQV6Mw5PQZmknAkxl4gZtLb/aqrB+qHYncZpB?=
 =?us-ascii?Q?cgWt6XJ8Q+Z5adFVEm+fgrDByjuJN2qG/7HqoGOPwZONO4Of+IrEqcedWLpM?=
 =?us-ascii?Q?qkMI0jn/yBvZSioobPGD0Ptw+6nIrXelyyRs+ydN9u6LgkFEx+tV7thv9PA3?=
 =?us-ascii?Q?nvmmkqjs4UYkef5mD9ghJtPrQLsYHwBXsl8JpuMb1Tnfk1OEJbihg8ze4LjH?=
 =?us-ascii?Q?A7qQnpHRk/qAEP1F6xAHr0uLGVVsURIJqAOduTZKESBnEZQggR3/g+oVFv6e?=
 =?us-ascii?Q?ysDNlJ81GPbNfA5vr/itQPDJ93FfnnjP/PAXB6uAwE1iZkyX2IdNtuufkeyu?=
 =?us-ascii?Q?P1KfPI7IpBFjvop2WiaP9z3yzONMXOCIZj4aV+zQVtWQi/DOBgh1hOwFMhGT?=
 =?us-ascii?Q?qRXizjLIqfUyVIBm9pwrS/qexCXoTSN7R0RnD6C16wXCpA+DGVLIInEcbeW3?=
 =?us-ascii?Q?81ev06dBFcaZYw6loFjr0jepEIj75WnVOgpeM7mykcr35Yq+kO1x5UoEUjKR?=
 =?us-ascii?Q?RowJt4q9h9ty6/L9AcUf+9plpcLysR6WN2vbHqX5lUrT3VdpP9p6+LrWRLJ+?=
 =?us-ascii?Q?vQ8ybPp6CTvTJL10lgrNY48mfej+jSzCsYPfjoBs6GgWAgwFxkDXh1Uvje2f?=
 =?us-ascii?Q?BvwlV6KmI/YLvnnr5JRSNCc8NRYMeI+wyNRwvBsgQsJTx+wavX89HSGISNvR?=
 =?us-ascii?Q?ApPthpVh3pSeXOnc5PBWZ9UUyvvjHLKXOEtoyrgbhTD/RBBRs+kOy24rblVz?=
 =?us-ascii?Q?A9Gb5RXIV5Ca+q7TaOHhGBFMWkbALIsfyQnAuWdOcFFiOjnCNs26FqWJAsf7?=
 =?us-ascii?Q?62p4n5dT/bHjnCIAEA/5SPLUa86sps/jDX5b2ctKiCu+ndNfb1fRX0PYV4If?=
 =?us-ascii?Q?V9/dfcDq+I1UDXIQnt2m1iOOYJlX3FNFa91/vEU7I2LfcktW5u0NUyxpJVoK?=
 =?us-ascii?Q?9zuApWEMPlt0HV+Mh7D0pXFVaNcXrHsEdIjRb6p8xSbGaDLj7Iimefp1AtYV?=
 =?us-ascii?Q?duOS5NIIpZBlgi7XmnapwN0qK1j0qiQsFDM/pdcRYKRzYwDcyXC3eJ/32Y6l?=
 =?us-ascii?Q?ZfuiRZJdgWo1VprNEm1mhKKuuj77JBGktSY6jag9gZaVZlPOjEl7XsVF06H5?=
 =?us-ascii?Q?oFYYo4wWqb2sW/Is0Cl6oxoITZIhXj17CQSB0kLu+CuJOh7Bd0+GpfjNyyMU?=
 =?us-ascii?Q?DG4snOU9f+Kvke5YcKitopPSWO1oYpq5Hi2pMoqdvcP9QR+1iXGBAgrXeAMO?=
 =?us-ascii?Q?7ZZVRuj/MtHdP9Rvz2nMzGkBVd4htcHOmkV2qsCgWeyAW2yjy0a6QQ0ywkcG?=
 =?us-ascii?Q?8xRbHlhIuVePlZFZAcx2Q1E8U25Ldi5PFv9RXI9SGjdjeMKS8NmdoObVOHcA?=
 =?us-ascii?Q?KAlmYgPTYpvAtZfmjItPnoD71wVRIzbiI4QjRC+Lw5oP5F6PERsAq2dCgwIg?=
 =?us-ascii?Q?rds48o4fFacWYoinCsoudpw74vM7oArJnI2bCWt4mgmgXJlZkUTRw878TdL1?=
 =?us-ascii?Q?GBR94lX+lwjJx864oG5io86cXjXBe20=3D?=
X-Exchange-RoutingPolicyChecked: Vpt53vqbvjODCKCJ73Sb2yBbqktY9N8rMHbgUCxaE8jmjA9gsEBRi0NQsH7t9DFZQynPfig+3xy6yU1LQcUAfOtQMJhjtZ2qUmDgZPdbpsEwKk+Sz7j9n4XjXDd3W0/ZCC+4QBr04DahjK76nwq5L9jOqu4BldSiAwNkw6BxYh4QjgHTnR8k9ZRTPhVBxD+8CmL9OYLDm5YchzbZv/7GElbDijeGjIbAW6NhdoTEhJSU1hNMg6icD/0WpZ/tahsXNkYbAIPoaBMBEbnZWUp9M0K2aPVSkP5pp1/WeaTYxzibfnyGMsTBYDcqMgKdGXwl+jRYSlLMRGyfVYXrisp1Eg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c269fa2b-6f34-4d67-293d-08df3925f337
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 21:12:06.8975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jkyoz1SwOhyAxn184/3pHe9DUV1NHF+AFAu0UodGmHtyex6KoQPsV57w7agKah7KNeRcQmIP4x9S/Xmv3vqtUKLLZVp+2FyXtMFI5gWNibI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4741
X-Proofpoint-ORIG-GUID: tBZyKK2N9zXftwuSAvf1BPQsGRPsSQyY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NCBTYWx0ZWRfX8rCn9PKMlncn
 Nscwffy/+Mnp/ZWOyj76WZZoNlaHN/TunqQJCBo25/gvExiy/Z82vhFeWTyBr0c4o6YmRIFEPIB
 nOLdUH+YpIfSxO4DBveBb7s2nKjhtaVtQUz4tG8fehtHiaRz4QWsV3EcCiyCqR1e48phe6bVPGU
 Y8oOnEaDVRwXuczoVW/Ag7BBw2XVuQoxq3QExLqr8WuULV0FMAG4fxy5uZHP0Lfoj3MYPKoxpSW
 qfuBQj3NOTTGkIUAMmtFMgdarHoTotgttBVdKVQEjsnlk3W8rwVUuI01ASYaY4kD+TzbfGz5r0A
 fabdZZOfLvOmxhzEd3m6ytUBxdOc5krEZgS9YmYty+7hlfLvu9AjjxgsH3NdSQVKGPo30fUH0jq
 nUSfW9yFBuApsQ9LxrgX8iECQVo6I0KpMZzWje1Qjk47d4TIkAXv885tePmhEQRrVzbneGS/65m
 yiI5Xmv+JBa2d14/ZCA==
X-Proofpoint-GUID: tBZyKK2N9zXftwuSAvf1BPQsGRPsSQyY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NCBTYWx0ZWRfX37iFsB5BqlR2
 7Rz57t4c+cN9xhBVSv0qWsA4BTP4l3Un7C369j27PwTfNtA4DSEM0PTp1fTKTnlv6XSsaL/OyT5
 qZZ87Qu0hRMxpHSjQ0spDrZxxrq5S/LPpWHadd94q3AToh7khRtZ
X-Authority-Analysis: v=2.4 cv=LampeTfi c=1 sm=1 tr=0 ts=6ae8fcac cx=c_pps
 a=3HzPxjwlbby21TQhxie9EQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=FvlJRdF6AAAA:8 a=6gl_cCoBAAAA:8 a=Gvz4uYy1kyGDn9j8a4AA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=QLZTDCKk5HCdsrdKW35d:22 a=Bor9z-CvbNo2M6AZn8_k:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020084
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 21:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131753
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix and related tests in commit [1]
to address the issue in [2].

[1] https://github.com/python-pillow/Pillow/commit/78c08bd4d9c08037f77465a61d90633f669013f4
[2] https://github.com/python-pillow/Pillow/security/advisories/GHSA-332p-7hrc-92wf

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
---
 .../python3-pillow/CVE-2026-112393.patch      | 124 ++++++++++++++++++
 .../python/python3-pillow_12.3.0.bb           |   1 +
 2 files changed, 125 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch
new file mode 100644
index 0000000000..cb9be3b33e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch
@@ -0,0 +1,124 @@
+From 9b693ea929423da2bebef5523881ae3850c3877e Mon Sep 17 00:00:00 2001
+From: Jeffrey 'Alex' Clark <aclark@aclark.net>
+Date: Mon, 12 Oct 2026 21:18:41 -0400
+Subject: [PATCH] Fix heap buffer overflow in _tiffWriteProc when saving TIFF
+ to BytesIO
+
+libtiff seeks past the current end of data when writing the directory
+and writes tag values there. _tiffWriteProc sized its realloc() from
+state->size + size instead of the write position state->loc + size,
+so the first out-of-line tag value written after such a seek could
+overrun the allocation by up to the size of the directory. The bytes
+skipped by the seek were also never zeroed, leaking stale heap
+contents into the saved file.
+
+Size the buffer from the write position and zero the space added by
+realloc, matching the semantics of writing to a real file. Reject
+writes where the position is still beyond the buffer for the
+non-reallocating case.
+
+Reported-by: carlini
+Reported-by: Tomer-PL
+Fixes: GHSA-332p-7hrc-92wf
+
+Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
+Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
+
+CVE: CVE-2026-112393
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/78c08bd4d9c08037f77465a61d90633f669013f4]
+
+Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
+---
+ Tests/test_file_libtiff.py  | 36 ++++++++++++++++++++++++++++++++++++
+ src/libImaging/TiffDecode.c | 15 ++++++++++++++-
+ 2 files changed, 50 insertions(+), 1 deletion(-)
+
+diff --git a/Tests/test_file_libtiff.py b/Tests/test_file_libtiff.py
+index c9849a056..84e4299a1 100644
+--- a/Tests/test_file_libtiff.py
++++ b/Tests/test_file_libtiff.py
+@@ -757,6 +757,42 @@ class TestFileLibTiff(LibTiffTestCase):
+         save_bytesio("packbits")
+         save_bytesio("tiff_lzw")
+ 
++
++    def test_save_bytesio_seek_past_end(self, tmp_path: Path) -> None:
++        # When writing the directory, libtiff seeks past the end of the data
++        # written so far, and then writes the tag values there. Check that the
++        # in-memory write buffer grows to fit, and that the bytes that are
++        # skipped over are zero, as they would be when writing to a file.
++
++        # 7 distinct bytes per row: PackBits emits 8 bytes per row, so the strip
++        # plus the header are exactly 64 KiB, the initial size of the buffer
++        im = Image.new("L", (7, 8191))
++        im.putdata([(i * 37) & 0xFF for i in range(7 * 8191)])
++        kwargs: dict[str, Any] = {
++            "compression": "packbits",
++            "description": "D" * 65535,
++        }
++
++        outfile = tmp_path / "temp.tif"
++        im.save(outfile, **kwargs)
++        buffer_io = io.BytesIO()
++        im.save(buffer_io, format="tiff", **kwargs)
++        assert buffer_io.getvalue() == outfile.read_bytes()
++
++        # odd-length tag values, so that libtiff pads between them. Large enough
++        # that the buffer has to be reallocated
++        im = hopper().resize((300, 300))
++        kwargs = {
++            "compression": "tiff_lzw",
++            "description": "abcdef",
++            "software": "xyz0",
++            "tiffinfo": {315: "artist", 33432: "copyright!"},
++        }
++        im.save(outfile, **kwargs)
++        buffer_io = io.BytesIO()
++        im.save(buffer_io, format="tiff", **kwargs)
++        assert buffer_io.getvalue() == outfile.read_bytes()
++
+     def test_save_ycbcr(self, tmp_path: Path) -> None:
+         im = hopper("YCbCr")
+         outfile = tmp_path / "temp.tif"
+diff --git a/src/libImaging/TiffDecode.c b/src/libImaging/TiffDecode.c
+index 72e0d7b30..e21327f02 100644
+--- a/src/libImaging/TiffDecode.c
++++ b/src/libImaging/TiffDecode.c
+@@ -88,10 +88,12 @@ _tiffWriteProc(thandle_t hdata, tdata_t buf, tsize_t size) {
+     dump_state(state);
+ 
+     to_write = min(size, state->size - (tsize_t)state->loc);
++    // libtiff may have seeked past the end of the buffer, e.g. when writing the
++    // directory, so the required size is based on the current location.
+     if (state->flrealloc && size > to_write) {
+         tdata_t new_data;
+         tsize_t newsize = state->size;
+-        while (newsize < (size + state->size)) {
++        while (newsize < (size + (tsize_t)state->loc)) {
+             if (newsize > INT_MAX - 64 * 1024) {
+                 return 0;
+             }
+@@ -105,9 +107,20 @@ _tiffWriteProc(thandle_t hdata, tdata_t buf, tsize_t size) {
+             // fail out
+             return 0;
+         }
++        // zero the new space, so that any bytes libtiff seeks over without
++        // writing are 0 in the output, as they would be in a file
++        memset((UINT8 *)new_data + state->size, 0, newsize - state->size);
+         state->data = new_data;
+         state->size = newsize;
+         to_write = size;
++    } else if (to_write < 0) {
++        TIFFError(
++            "_tiffWriteProc",
++            "Invalid Write at loc %" PRIu64 ", size: %" PRIu64,
++            state->loc,
++            (toff_t)state->size
++        );
++        return 0;
+     }
+ 
+     TRACE(("to_write: %d\n", (int)to_write));
+-- 
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.3.0.bb b/meta-python/recipes-devtools/python/python3-pillow_12.3.0.bb
index 1c6668e53d..e4826da1a6 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_12.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_12.3.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f0ac3777cfc96ded1b825e32ae7c99"
 
 SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https;tag=${PV} \
            file://0001-support-cross-compiling.patch \
+           file://CVE-2026-112393.patch \
            "
 SRCREV = "bb1d8e8ab8d29048624d96e3ee53cecf7c13d13d"
 
-- 
2.43.0

