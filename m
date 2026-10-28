Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40337.1793186501062629780
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2026 04:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LdJCk0EA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5761ad7a49=omkarabaji.patil@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SA2Sg12233340
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 11:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=sOq5wVvWfJbjio5GesoQ
	mxiEQ8RNgIxaQd0nS6pxJ+o=; b=LdJCk0EAeqtPl98EsVBzFhImd7l3QXdptyLu
	siSNQIyCCLcI6hSC9k6MKsweNhGh9qQTQCOuOEaOBtULAGVwqmIM8634/RxWemXO
	RVw7kl0e1weMnfK9UGAxLzJ0H/mfEvtKza59O0YXYLHqzAYXVSOl5HDMCPnV9jGZ
	raV/QYEPHoqpeC+jgNggXzTq6LkqNtB3MCqGDVwg5ziLQLxl1Y8wL4znT/YVbOGN
	BgV0A9dyqL/HPPyQiLjeY5NqlTolbP7gdleBmewgmbH6k5+CI480h6gN9vIi9/Z7
	9cZeMJqClsLyFePEaYfRD9geWiO3bRtMKy+zSaFB1qTjvhYbEw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022078.outbound.protection.outlook.com [40.107.200.78])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hgkn7p3f5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 11:21:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=suZpnSa/3if6u4a0bceep47le9+SYepfoamVwohw+iLdcb1ItCsei1oOxXXP2OBQe/oCD6U+8lEbPfaJ2DU2mWDkZTi/8G76RKv1znEZbtYRncGxUXyYAwZJpF7erq6nx7zyD4G98SH646s5V16bRf3rvwQhoKWwzD1aXNN8gX+fn9Gjg9UrK2wTQqdcU6kIx+IuQwbSydNdMKAX1It1PjvUtoBRDySHqu9+KrgPvZUhh23gRoS2hU0P9LENQ+Z0nmY8eQVKF8wM8RVht8QaBJ0F2ZVGs5Jvyqm5D2zwVDit9e2++hH0NKxGJvr0j4l/hB6/cEqm0pa9n+ozim9Rdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOq5wVvWfJbjio5GesoQmxiEQ8RNgIxaQd0nS6pxJ+o=;
 b=qNMxn8e/Oq+y6tNnXJnmvSRAX+Vf0S2WyCrbVw9QYwxeoW3lxFCRIICwI/lj5EcjyjXtBIUhKopEPx0dRFSCjxfuxBEkTzKkpuJvf8ZtY+KjbqOVrwAhfSVq6MdicwR0yiry/6j/3eQNdSrACUxsAzUI9Tib8Do/e6LwCEVceoNQ6xPkoncLXVL9wz+3z94cCKyKwSI4Q2pM3l69XU07FEdk/nBjqI68qecTVcjzMhEntRTig3fxv32XePgJODcbGfbRch822YRoD6sqKQgOdVbVJJsISnzewZE1rCKKevT1ZVA+UBGkUdSbmSMXHRpZ3p7h5eReklQg+tEpa04Jdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19) by IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 11:17:40 +0000
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::bd8b:e175:4855:9e44]) by PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::bd8b:e175:4855:9e44%7]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 11:17:39 +0000
From: Omkar Patil <OmkarAbaji.Patil@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH] brotli: upgrade 1.2.0 -> 1.2.1
Date: Wed, 28 Oct 2026 16:47:16 +0530
Message-Id: <20261028111716.3519552-1-OmkarAbaji.Patil@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0123.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::11) To PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF3ECB6A513:EE_|IA3PR11MB634048:EE_
X-MS-Office365-Filtering-Correlation-Id: 5694c029-21f9-40c5-2bbe-08df34e513a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|38350700014|11063799006|56012099006|261022105027099003|261009223027099003|261021121427099003|261026140227099003|261021123027099003|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: QpX50HKMTjjQI/Fy/+2pJD71NCwxEZitguaRSy+z+IHexcvpWJIBT29NavXKJkT63//m28NuP8Eu94kqd8Z5yt+lhI0WsONs4MLR0yhApzXYJ2aglpku9G35cVqO7RUBYDshbPlJnmZFGiWyjI+2upIZjYfW8HeIcW3BXVt8tEyuOw3EXsT8aQp4A1gRV+b9/3G1SSE8omNdqDpAq+M2oF6ifiKd4BZbymUDt3mgmugzRYYPwPAEeyGt6Dxqk0Mi2qEkqKM4OaKoIjt6B8fAvGgIkHbb6wvvXbamlLMa9E+jL5pB9y8o2CGTRlsboHGhIOVEVw56amdrP3tDfPy3qoTTn4X8ocuUwtmGare4zLCeBO36hNi7+nane6lkQJWVeXKISmtxYfcHvDlJOoQfWaDF4IoLs1srWEzrfRAic3o9n9ZjL7Cd/Dgs2/XcARNP5JbZZxtJDtB08dY4wxp/M+jNyLojN9aIohsV5r898BZnvhNQTYqqAOpYwcVoDoPrm0GaF8PcA1A89ARDWZVFhw7uw1AznpsgRPpsUrmtsWa5vTu0oOwtJ8Ya8B2/proSxXIquk+S4ZaRGGuE6O9b6qICCXm/8hnczn1Fv0gHllBb5fJWvhISWPnp6htoSEXuj+ULKsZALD0FU8dTZ5ACNHYYiRTBCnoyOz5UQrluXrjuAkAQkTy0Uk+51cQ+bv4GNzSWOPf82GtpkyzbEhZTJJCHgM3RzRNGk6W0zNSE9vc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF3ECB6A513.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(38350700014)(11063799006)(56012099006)(261022105027099003)(261009223027099003)(261021121427099003)(261026140227099003)(261021123027099003)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vrzIzpCTNbUJO/v81Kllhud4wKoQ+MVGqAKE6khI/Y5hzNU1NwAgfVQCi5yr?=
 =?us-ascii?Q?LIHsrYY+v6f2XyHTZl9XJD7Y3RphAHasmvTdfKwMka8wuHcLden776oKOxz6?=
 =?us-ascii?Q?KIX7n5Teh0E2o+YKdgAxchghqJ4e/W7AXFFXeLB/grt8kIt2tyGIxI5XreXD?=
 =?us-ascii?Q?bBEvum5PQFrvHSKm3ESC46yhcW/LfuzOHjUiOlDY6wD2UXBNYBlL1bSNa/OD?=
 =?us-ascii?Q?5DrrC5l8dR4rK37bStvC9d/O6bQ3wtFJehsyA1xVD84yg07TTpHnlRUabWtc?=
 =?us-ascii?Q?IX71Jo4+gEHgqDI1p9eA3vWvJt3ES+b/3mg6TzkMPoXJHKFKc5LNshSVxt+z?=
 =?us-ascii?Q?et4vPbk1zDBZyK0nIyoV6E5dWnTPpV3evUroLdYs/63VdzWqhcyBx2iP0oWL?=
 =?us-ascii?Q?uCAICN+Xvto+B7PaeFmmXNSqLroluf9uLEZkaN62AAEel/AZPYSwbasjutsN?=
 =?us-ascii?Q?232WFKFN4s85Ilz9Km3li9nM5E7Pm21d7Ti/VBwrmKtbv4FVvKLPK1Va8B/Z?=
 =?us-ascii?Q?QiFggj8Ec1LgRGOMwq7OAMfIOz3s/ImRQXQ06t2YkPNefTfmR66SxXa7k2UC?=
 =?us-ascii?Q?WpKIp/DyNUAziwHf2uuRHX27ha8f2itcLJnYpyQY7+9SbhPmjeXxNmbEgeEu?=
 =?us-ascii?Q?Fp7rH2RXKo5/Vp7vrgX1oKy48Rb11gKV6i6eXpsvrxhtJCKMgSsr52Fz6/iW?=
 =?us-ascii?Q?/HN/hDuzakl4bxCFeIzFZKvZCu9pGRBn1twxuhyprOlqjHhPf+QkQgWANult?=
 =?us-ascii?Q?r8T5hpIxK8PagAWztfivrT73nM+42WFt29fafa0nuZyKVUAgmBOJIRjYHJ+t?=
 =?us-ascii?Q?nYKFVhYfRw0682rUefT+SOjZHg4O/vta4AMfcIyKaEDvfLtp58vB1mWRGPLm?=
 =?us-ascii?Q?mJBt6l3Yzrdh4xc57cFZGTsXWSZtrr2qyP80BeuBRX8Lqvl88siRxFiGnebo?=
 =?us-ascii?Q?WviCooxwtrGarxwsZ+IqKUA9HeduE83bB0efe92rykOrEaAbyiBbg7xnAy8P?=
 =?us-ascii?Q?HKbTZJ3+tT8or0yy8CHkEyD2puVW/waC6gnTnsFJmVP2qRn9spATU5QLR1bh?=
 =?us-ascii?Q?dEznseWdVv4u6+PNjGe9XjV6kjKH3+IgjcEVgkamvspKQN+AailJixrH2Nez?=
 =?us-ascii?Q?OPTvT+vgQD0toLNPA1qNhepXncHkcHH8hWOiFN1wdyiMuHi87a5WKEeCuFVF?=
 =?us-ascii?Q?sWxBmcd6pR5bp/dDU6osk1//simzYWFkc0k9DByWXbjw8bcLosnz+obBcqCx?=
 =?us-ascii?Q?gcb1SaSI/Xug072fiJW1P83VwDorTeJJnn5iG8MooQuQeiwPrxqrcEZhjWqG?=
 =?us-ascii?Q?4+iWic+H4TpUEkfRKcmVlVisKE6gA7SUtayeN+eBL8pv8OOkQWIfhRTQ5gNV?=
 =?us-ascii?Q?ayDlFplrlD4o3rD2mJ5OcmGqb2mB9ksmeJFyOxkdXInM2jyzW/CvkLum2Dtt?=
 =?us-ascii?Q?mKxQZt938BrgKfwGUkVNuVY5DaE088AkRsL8n1uYV/YO44wuaCFDm+fHbh5D?=
 =?us-ascii?Q?BMR/UTQHrwKOINUfHUGE2+/Lu2Z2HOShkybihUQ2TV8F/pXyf4g5bCngIFL8?=
 =?us-ascii?Q?1sWC/G/b/wj+fdo4FcyPcTOZDa9JAyGiHMndQlair4Jn4nb6P6HaTeAmO+M+?=
 =?us-ascii?Q?I1qQUW+vGO0102rm8Gqe/y6vN4AN3f8pAA0BKuVclA9XIlNGlLu+msInIdUd?=
 =?us-ascii?Q?WHcm0eh/YR8JjDK+C8djs8dFZfGzceMaV6wePs6e3abKpIC6DJl9igb/vbhx?=
 =?us-ascii?Q?NXfLNGZTGwZaPvZHvkgvy6Q9at7iFdU=3D?=
X-Exchange-RoutingPolicyChecked: US9C0AsrxrOcUicMhSkgyxjIgx9VyyidhVzLsifuQz3P7awHgLe/8ysQJIiQyjMmLM+oGfazuGA0wCLLuqjN6mxLqBhsBHpFCH0zjJQXxSsFtIhvdLyESh9HqEDTyG+ipenPZpio4JmewB4V+nVHW6U1Uj04ElRps/dZff+yFuRHFAJN/rgQlihgfAjz0omOrMy0G/RoDNpme4DWG+6HUR6KSd64cH9YA6gd1mdreGPDX0c9HLjjgZ7m2mHb31N0dzsCYyea5hgVuRb3grgrYxvQrsMFW1dBN+SYDCNyW3VWkGlYm3mGcDV55ZMg+e6biRvS/vTyHIDhjJcSMDmzPA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5694c029-21f9-40c5-2bbe-08df34e513a8
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF3ECB6A513.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 11:17:39.4508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7eNQA3ddcMTWep+kfj0RUaK3HrNsxhpw7O6+peGagM+CgaqRmD1xn5Cd5rbQ3MShE3cfpUCQw2ur8wscAcBeUUZy1HapCD/DrfoTWlLFfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB634048
X-Authority-Analysis: v=2.4 cv=GfaCDgXL c=1 sm=1 tr=0 ts=6ae1dac3 cx=c_pps
 a=kwEHbe0FhOXiazSsKgGQ8w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=nZOtpAppAAAA:20
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=t7CeM3EgAAAA:8
 a=puEJAWS3Ic2CCawLBr4A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: vD0WuOFu91usYoVNS_tqqlEAKDipdq2K
X-Proofpoint-ORIG-GUID: vD0WuOFu91usYoVNS_tqqlEAKDipdq2K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NSBTYWx0ZWRfX9z9YzEJUOS77
 vJHlUzyi4lq5xvgkYD5F9iDo0doTM6lxr28SO2pzWbqzyKdimCS1DNV5zQVght3I0Rb9nhUGO+g
 SEWQhPoNcWy+qRsT8X/42zZBd/4L/mdq5M2S4hOwHCA1WLKhYgvg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NSBTYWx0ZWRfX83M6eRW6qklq
 EPzDlL1LMQNQnTvmvfKOEedUIqRjuuXpWJRxTgpeyrvaynVVGwRsBHaof9wtvxu+m7phLVeRLNe
 +FdErA+8UmlyjLJ1PSG6hLpTMR2shSBZ2nAu6Rg255jM7WMa7hQ4C8kDONhcJez5uMtDcHj07ar
 jrzpJt/JtFPdM1+9CO2I1wMT2wizpBZXiaNT4kvqHO1BAibtvF7HrFfXCAbAn/SSmzC2asDGamE
 PI+yomg7TLI8CRbK+iUwXqHoHi0guJb21BOPUYvb4dLfl9qHATxw2Pw7Zo/ZmNRr2fsdq2rhN4t
 r+0Admy95RVwtAs/icTwSHGYAkTSuQxcLMUfu2QSbUj5CKmbMkgyGtV9wEVMM6qOTXxGYHfe6b6
 p3iCBRTQtMpoLmefwZ+CYTENWN35TyWpcnsn7DR4meIsiurE5it/V1OsIesfKFXTtVXtlQcU5GZ
 eh5qiu0Jt/4FEVOs19w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280045
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 11:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131624
Content-Type: text/plain; charset="utf-8"

From: Jason Schonberg <schonm@gmail.com>

This is a security release

CVE-2026-111497: out-of-bounds write permits remote code execution

Changelog: https://github.com/google/brotli/releases/tag/v1.2.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
---
 .../brotli/{brotli_1.2.0.bb => brotli_1.2.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/brotli/{brotli_1.2.0.bb => brotli_1.2.1.bb} (79%)

diff --git a/meta-oe/recipes-extended/brotli/brotli_1.2.0.bb b/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
similarity index 79%
rename from meta-oe/recipes-extended/brotli/brotli_1.2.0.bb
rename to meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
index 84495a3236..dca16cb79b 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.2.0.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
@@ -6,8 +6,8 @@ BUGTRACKER = "https://github.com/google/brotli/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 
-SRC_URI = "git://github.com/google/brotli.git;branch=master;protocol=https"
-SRCREV = "028fb5a23661f123017c060daa546b55cf4bde29"
+SRC_URI = "git://github.com/google/brotli.git;branch=v${@oe.utils.trim_version('${PV}')};protocol=https;tag=v${PV}"
+SRCREV = "db24a98aed38a16de78cc05ca15cdd8dc2a0d92d"
 
 
 inherit cmake lib_package
-- 
2.40.0

