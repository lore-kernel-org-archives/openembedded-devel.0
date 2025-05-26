Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FFDC5AD49
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 12:34:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.27691.1748262849174641188
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 May 2025 05:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7241dca39d=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q4ft5I016917
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 05:34:08 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46udmm1c29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 05:34:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GI9UKIXyw44B4scoCx7roiZYAu2QiWgEH20Oa0ZfGgpMzHXbBfATERqAkN14c5YsCzvws6orzRMeQnNP2GXgX8X+xIRcR/9zAFyHhH8SXD3JoSl3p5cLB5El4/IMIy2mT8798Z50bUeu96I9r4PIAU6yD5O7GY2qe7Nisyc9H1okuGK6tDTHOEtVZLNokrASgYOupQA5pj6Ir04yM7UdyL3WQLFy5/XNO2MiWK30bpp8FVw+/Dq4BX53XSyJB+42GWNY2jt4zxMes4DS0JE1QazJ+GJJB5UlwsjptrITmQsi+XN6QCXlRYQ7VHK3nGUR+ot5qlLJtLBIGlWl0FgZww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cx+ZBDbk0HhYDGKXEJW5WyA9r725fauGiFq4vl+p9wk=;
 b=GVO8joIGVeVd+ogLg/ltzIPGuC38SDuhPBkHmUXR1EHFReF9F3oZXuufT384cxmWk5NJG7AJfasu/3p2uFUIw7sAzXheSuh+XMD3QoVDCdF1TknWvAO8kfHib7/7VAnI7x1YZdSKaJuMwv9hRw9henl6Pd3Ixtme7u8mag2VdtV0H8pDWHeX1aMEsjcuiXmwW/vdQ+P1DrDW+Ev2LJHboiHrCSTnhsk2bnM0hbzgJzQacHR3cATVufWkVp9a1aQ9Xyv9qzed4HjB9Qmy+rtZDUFgwxo/QqEhlRoTkR4bh8PngU68RLdTufrgeWRJsAw9IfMz/qFBY6Zqm+maF8khlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SA0PR11MB4544.namprd11.prod.outlook.com (2603:10b6:806:92::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 12:34:04 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 12:34:04 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [walnascar][PATCH] binutils: Fix CVE-2025-1180
Date: Mon, 26 May 2025 05:33:06 -0700
Message-ID: <20250526123306.868591-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH5P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::13) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SA0PR11MB4544:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f27f6fb-61ba-4e99-d6b8-08dd9c5199f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Qvdui3aQPSG5kKEYHTqx52hRYLeYsOj/UprZAWAAeYxKuBeUEEaWffcFCwnZ?=
 =?us-ascii?Q?DOp/th9A/XGivR/S+aQ1dzp40QFzRZRE65kx/vfWQ261Zn7uyodgjXjI2JYU?=
 =?us-ascii?Q?vL6xWYucAonGUhpKbnbBuS0mGMH9EYVZdXPUkjm9BgUz8RGQiM7qoWyGPbg2?=
 =?us-ascii?Q?vPFdcq4Pflmr56RH06EMdT+QdSKeRWrClBlEROs76lXEKA/r/7x1Phf+0zp9?=
 =?us-ascii?Q?cRVYSEgcX41c2HJiUHqvBxW1KwbnDdHqrr3hLAkn6dW53etS9qSrpEvaBM51?=
 =?us-ascii?Q?CU5mUcbF3Dspi/3g9S6WLJM7cUcgoJWMvSRlSRAP4XEzBq64abLxK7jupM8+?=
 =?us-ascii?Q?W82Gi8GyM6wV0fnlsDVlKloFDeWAieCrf5XskGTTUOSv4JHGVk3mAFxbO+xO?=
 =?us-ascii?Q?rl4VCjEZ0OwIFKLqeSLkSjUk+aKWyy8+GXmYWrOaKQ5PZgMw8Mn0iKAm1nGA?=
 =?us-ascii?Q?vlWiBD4gEVWA5PIq+xqYQ5leensdQbRJLeUokvbTrsaNg6DdP+GvC0cNQ0j0?=
 =?us-ascii?Q?cS6WZmQqO2RluPoeO/RHwIUFAhhYjzglR5fzRXluEqRC+XfGKrLYDMXNQpo2?=
 =?us-ascii?Q?BUvNI/G9X68ikYkW8T6sZUm4eC6FSZtlXHrk9LI2ZuPTxcr5WhfCU6g0Yf/g?=
 =?us-ascii?Q?UYQKInb38Zc4WCYLd4qQtPt7hafxR22mFTekOlaNxc4NtbBNEeOM8ZBUtPqD?=
 =?us-ascii?Q?Hg9CXFp9t7tCBXqZEirjd2nGATTaMKyfRJHz1MuIRCxN/yxmmWOzge6sWLQb?=
 =?us-ascii?Q?x6DjpPiMSE+Oxo3PQkVaHCh/OncBv+bspNBe6cOoinPTl36XOKqpbw6nVaHt?=
 =?us-ascii?Q?y4ytTzjghl6VIN6yyw0qLnQcRSXBKguq/6F8EZSXlBgN3ZaD5ouV2mL66T8w?=
 =?us-ascii?Q?IlXeBP/2fFBhE2PVO/+LxJ9ZpklqAC2jXXth/oh3EfchU7WxM8Xll7cc3YC1?=
 =?us-ascii?Q?0WvObKI7oH+Pn4QpXQrniQRyJr4vkU0PzbIQC91F4ugFUiUJbClbfE3XJ9EX?=
 =?us-ascii?Q?bjR2Q6q540pHIgabx+7uUQ6vSxzlJBoLLBJ8KpZZaFLBOxvKEUf5rLKboR92?=
 =?us-ascii?Q?dQbTuw+uiM5LGQbgtzXVxvKjMFF0SGYEBQmoSytge30kMJeG7nTkPXOHF67o?=
 =?us-ascii?Q?oKeemZmGminu6N8LZlBI1j3s2YxLlKcRVohN+DPBcBgMSXGJ1PiEWJ8qXajx?=
 =?us-ascii?Q?sFwLEtLBSG8gl6QvD/jXFyiAK0tlzVMhkGrOxZ2cIOTlr03u4lEUMrDct9KA?=
 =?us-ascii?Q?fXz70262SuVOtO+ssWgzbqgh4DwIqtDCLprSSF7cQCcGkzocNDaiUF6MB6Ej?=
 =?us-ascii?Q?lQj2RUfniW2vFhXM47vroWjsklhkg3a/zb+DMv5WpXsNnJas/GHfh7B+VhXE?=
 =?us-ascii?Q?0NX8UsXg9Jeoo8lZlUKkllRfXGj9svlZ3NPqfVjK8FaMkzP/feZStNLEytfM?=
 =?us-ascii?Q?fiDCH8IzNBFOUu2zdHDUMfp7gJYaiMq8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?P0+cELkZgxh6Y5doZoEOAy9NUBXj+XqSQIsb/iTNa8D6LX/GICZneMqCB9AB?=
 =?us-ascii?Q?5RadXzrcrTx2+Rllp7NGVn+ww5qaDVYrLik0BZno3LJOoaifCQek1mJ5UqqL?=
 =?us-ascii?Q?NJ6NVWHtSiVZNBtTR9wI11HuDLaM7buoKigrydcI8I6V1j4VYpVh0nAat5K5?=
 =?us-ascii?Q?dmQ3wRx2PGNfFLwGTTMF0gJUlkDOcMZ476seoLcKD4lb0nLNfp+lytawsGDt?=
 =?us-ascii?Q?hvMwNq2MKy0YaHkAbEP4kMJfQuO9zSSepS0ueBQvyNpB7XTs4nNL9GQFR8n9?=
 =?us-ascii?Q?KJkusWU6Bv0c27roaq8l7Ls8+9I1YMKGNjU81XVHpSzB9PePx+geRmdIohct?=
 =?us-ascii?Q?HVQSs2OvhRiBSPJwdnoRxehHRYaXAUCJoVEDB0r1BuxK20152Ok2assVF3me?=
 =?us-ascii?Q?kN9Xg3RJBzH+HaBeRI6vHgt0oHyqUfzryzirSSBVJXyTfeCGcO2MN5tUDnK/?=
 =?us-ascii?Q?F4+V86xrxcA8C2fl1/7vTbsJZuUB+oJbYSqGJvcN+TV9sl9sjsX8QQrBg+kL?=
 =?us-ascii?Q?B2y6QnxCD5IQOl/8BkidgM0c2WuijDRgix/aDQ9IFHqvMho3r4+kO+sxIkJR?=
 =?us-ascii?Q?ff8RkMpZH83i3N7F+2rjVu7g+Ldt50qb0JWstT7hpGjJrbyD+hJohXUvmYiW?=
 =?us-ascii?Q?hJlIMxzC7UBvJQ9adq9Axhi4Uh18m9jdkD+P/PCqRep9xJWlPce9K3HAWh8A?=
 =?us-ascii?Q?haG5zwgJH/dzazdMoHoozDFcqomt33M3ywnyL88VyMMjHjD9C/UMwFuERXIe?=
 =?us-ascii?Q?eCd5aMFa5t+zfQPmj8aec0H9QbWuOoZ7XttP0umi3qLqfeXTO3557Msi/ECN?=
 =?us-ascii?Q?t6U7qxBxgphOW0ZWjXp4ssWZsyOOhMXKtvUw50PYxgw26v2NmiyUXS68Nqtb?=
 =?us-ascii?Q?ElXi66btBlQZJo1Nwr4WsqdoJGKJpufRpNl/X5zSV42EZ9pHizY6Mto7C1rw?=
 =?us-ascii?Q?7m8b5mSNFJZnQfXE7qjl390QPk81qAgwALvWSyMQ0vCYnLNvoLQEch6nt7qK?=
 =?us-ascii?Q?uBlCqbQ2B9ClYhuo6arJTDs72Tu4W6Zf1HoJr1GhsJ+ywmktq/qFaIo4wrou?=
 =?us-ascii?Q?VTZiaU7Sf1G1pH8Egbcx/XWmqNkAQmHWXmjKAGkQXJRcm1yJSgQaXjk7DWE9?=
 =?us-ascii?Q?Xim6b3vbFJ5MAd8EvMv3ELf0BMGeEuMSNbTJtHVfC6hw7oVQ86D9Ol5/E7rW?=
 =?us-ascii?Q?Sv1ar3cb6lL7zJvY07KVXs/OHyE2FACxKPJmBb7OsdsEVf7cmTCdxWVZVGG4?=
 =?us-ascii?Q?CnLvph7Yx/4o29K6ygo6hE4Tm5kucyNEJiLbr4nVsyQe24mKLS35y3N0XSTF?=
 =?us-ascii?Q?awCzKWkMLyX/1jF7yNAr0GcoTwDCt5J5m+AjhzeT1iT8kllCB+le2CO3k5uB?=
 =?us-ascii?Q?EGC8qCJ81CB+baZcG4Jcpdt/KDZs3e2xonSiLlNpKa90MUeRnViyrSzkBAvu?=
 =?us-ascii?Q?VE4TpXY4t1XbAkiCMC/NV51jNlmRlIYlsnCu5e7FoiEvuGof2oC+vHsJsYMR?=
 =?us-ascii?Q?XkKbnXyZoj3LtujWB82CH0mRpMhdSlOY2Q5WWqEIqP2Ey0F74ICbgYUg+Rhp?=
 =?us-ascii?Q?99QBy5k0qDnoIF5AdSPzgJFn+ztv83vt20xnTGgjzu45k3hGp/P94gzOp1lA?=
 =?us-ascii?Q?Uw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f27f6fb-61ba-4e99-d6b8-08dd9c5199f8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 12:34:04.7075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qv5aW4htIhjBEE8LcZpdOwDcyc3QNHBqIiXqAp/S7Z1Ad2ELlEeXfxS1dPf37NNbi0c8m7+HT5mfaGA1kFhOSgMwl3jCm01PutY2E0wyZwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4544
X-Authority-Analysis: v=2.4 cv=WpErMcfv c=1 sm=1 tr=0 ts=68345fc0 cx=c_pps a=sq93dIqHAeCeaTEzQLya6w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=CCpqsmhAAAAA:8 a=PYnjg3YJAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=H8h2X5dFQeY3KuWU6QgA:9 a=Nb4uE5ka7GsA:10 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDEwNiBTYWx0ZWRfX0xBe/IpXF0zX YvY4aOIQBFfXpC4Jm+wJUpceNC+PHv9ZaW78Rpx30jNJ3+rmvcH1QrfOsateVkzINnSBZmne1jn fIv41lYDXGWPidFG1mhx6s+hDTmaYjrfvxHJGbNjl3LZXOrdCUFYcRLxPVGG+jhaEYmf6Gz+8RS
 aZ729AnMHq2XYcFkWyQmxjw07L4+tx+r0iQedc3ETwTRgyf4cJW0ntADPbQHVKnDvH+cbInF7ue GOWAFPPnALgEpj53/PrUP5cBM1cV7zmI2TU08kucd1JzDBQMSbEhZxmrHwnqFHdv7k63725fzLV MB2k5B5tYO6dNEL2Y9e7Jpt5h9Y4bDOytNueyKk7JMJqbM0RxHp3Kz4hzM/MfxMXK8S75pTzlWl
 cUlMLfTmJRKY1vB0GQczoVmCByXyaioYpIEsIUyngz4YOIUDZmpqin0K8X0B88+5GORUrlnp
X-Proofpoint-ORIG-GUID: RLqEQ_jZ5reei1Pyu_meZf1ZFzQz5QKv
X-Proofpoint-GUID: RLqEQ_jZ5reei1Pyu_meZf1ZFzQz5QKv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_06,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1011
 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505260106
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 12:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117625

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/2025-May/141351.html]
CVE: CVE-2025-1180

cherry picked from upstream commit:
https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=f9978defb6fab0bd8583942d97c112b0932ac814

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../binutils/binutils-2.44.inc                |   1 +
 .../binutils/binutils/CVE-2025-1180.patch     | 165 ++++++++++++++++++
 2 files changed, 166 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 7a19aa31d5..99b8dfac97 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -35,5 +35,6 @@ SRC_URI = "\
      file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
+     file://CVE-2025-1180.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch
new file mode 100644
index 0000000000..073361cf19
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch
@@ -0,0 +1,165 @@
+From 509c5afcd71afd36cd6496f8c84733b11bd5e9e5 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 22 May 2025 01:56:17 -0700
+Subject: [PATCH] Backport fix for PR 32642(CVE-2025-1180)
+
+Backporting the fix from PR 32636 to fix PR 32642 (ld SEGV (illegal read access)
+in _bfd_elf_write_section_eh_frame (bfd/elf-eh-frame.c:2234:29) with
+ --gc-sections --gc-keep-exported option)
+
+https://nvd.nist.gov/vuln/detail/CVE-2025-1180 is associated with
+PR32642 which will get fixed with commit from PR 32636.
+
+(cherry picked from commit: f9978defb6fab0bd8583942d97c112b0932ac814)
+Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/2025-May/141351.html]
+CVE: CVE-2025-1180
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ bfd/elflink.c | 88 +++++++++++++++++++++++++--------------------------
+ 1 file changed, 44 insertions(+), 44 deletions(-)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 6346d7e2b4b..d765b688801 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -96,22 +96,37 @@ _bfd_elf_link_keep_memory (struct bfd_link_info *info)
+   return true;
+ }
+ 
+-asection *
+-_bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
+-			     unsigned long r_symndx,
+-			     bool discard)
++static struct elf_link_hash_entry *
++get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
+ {
+-  if (r_symndx >= cookie->locsymcount
+-      || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
+-    {
+-      struct elf_link_hash_entry *h;
++  struct elf_link_hash_entry *h = NULL;
+ 
++  if ((r_symndx >= cookie->locsymcount
++       || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
++      /* Guard against corrupt input.  See PR 32636 for an example.  */
++      && r_symndx >= cookie->extsymoff)
++    {
+       h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
+ 
+       while (h->root.type == bfd_link_hash_indirect
+ 	     || h->root.type == bfd_link_hash_warning)
+ 	h = (struct elf_link_hash_entry *) h->root.u.i.link;
++    }
++
++  return h;
++}
+ 
++asection *
++_bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
++			     unsigned long r_symndx,
++			     bool discard)
++{
++  struct elf_link_hash_entry *h;
++
++  h = get_ext_sym_hash (cookie, r_symndx);
++  
++  if (h != NULL)
++    {
+       if ((h->root.type == bfd_link_hash_defined
+ 	   || h->root.type == bfd_link_hash_defweak)
+ 	   && discarded_section (h->root.u.def.section))
+@@ -119,21 +134,20 @@ _bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
+       else
+ 	return NULL;
+     }
+-  else
+-    {
+-      /* It's not a relocation against a global symbol,
+-	 but it could be a relocation against a local
+-	 symbol for a discarded section.  */
+-      asection *isec;
+-      Elf_Internal_Sym *isym;
+ 
+-      /* Need to: get the symbol; get the section.  */
+-      isym = &cookie->locsyms[r_symndx];
+-      isec = bfd_section_from_elf_index (cookie->abfd, isym->st_shndx);
+-      if (isec != NULL
+-	  && discard ? discarded_section (isec) : 1)
+-	return isec;
+-     }
++  /* It's not a relocation against a global symbol,
++     but it could be a relocation against a local
++     symbol for a discarded section.  */
++  asection *isec;
++  Elf_Internal_Sym *isym;
++
++  /* Need to: get the symbol; get the section.  */
++  isym = &cookie->locsyms[r_symndx];
++  isec = bfd_section_from_elf_index (cookie->abfd, isym->st_shndx);
++  if (isec != NULL
++      && discard ? discarded_section (isec) : 1)
++    return isec;
++
+   return NULL;
+ }
+ 
+@@ -13994,22 +14008,12 @@ _bfd_elf_gc_mark_rsec (struct bfd_link_info *info, asection *sec,
+   if (r_symndx == STN_UNDEF)
+     return NULL;
+ 
+-  if (r_symndx >= cookie->locsymcount
+-      || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
++  h = get_ext_sym_hash (cookie, r_symndx);
++
++  if (h != NULL)
+     {
+       bool was_marked;
+ 
+-      h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
+-      if (h == NULL)
+-	{
+-	  info->callbacks->fatal (_("%F%P: corrupt input: %pB\n"),
+-				  sec->owner);
+-	  return NULL;
+-	}
+-      while (h->root.type == bfd_link_hash_indirect
+-	     || h->root.type == bfd_link_hash_warning)
+-	h = (struct elf_link_hash_entry *) h->root.u.i.link;
+-
+       was_marked = h->mark;
+       h->mark = 1;
+       /* Keep all aliases of the symbol too.  If an object symbol
+@@ -15064,17 +15068,12 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
+       if (r_symndx == STN_UNDEF)
+ 	return true;
+ 
+-      if (r_symndx >= rcookie->locsymcount
+-	  || ELF_ST_BIND (rcookie->locsyms[r_symndx].st_info) != STB_LOCAL)
+-	{
+-	  struct elf_link_hash_entry *h;
+-
+-	  h = rcookie->sym_hashes[r_symndx - rcookie->extsymoff];
++      struct elf_link_hash_entry *h;
+ 
+-	  while (h->root.type == bfd_link_hash_indirect
+-		 || h->root.type == bfd_link_hash_warning)
+-	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
++      h = get_ext_sym_hash (rcookie, r_symndx);
+ 
++      if (h != NULL)
++	{
+ 	  if ((h->root.type == bfd_link_hash_defined
+ 	       || h->root.type == bfd_link_hash_defweak)
+ 	      && (h->root.u.def.section->owner != rcookie->abfd
+@@ -15098,6 +15097,7 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
+ 		  || discarded_section (isec)))
+ 	    return true;
+ 	}
++      
+       return false;
+     }
+   return false;
+-- 
+2.49.0
+
-- 
2.49.0


