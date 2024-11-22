Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E89D75E2A
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 11:22:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.22138.1732274539163709106
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 03:22:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1056a21441=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AMAljLZ014855
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 11:22:18 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xgm0pv5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 11:22:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJ2jR/ijOi6+ucj7J2mh69G8hJ+59s0ReB+sT1sRnJE5kSbSicVs4sV2vGHkrCqiSobaY7KnOUsvCMayCdRawMDrX8+TOcxfd7E8qUXTpTbAHQNB3MNzjYGCRS64JCKwetAJIyTKE4mJcCejFLWcihvAc+aYrp8e1dOFdSP36XDB+L0QgoWKxwazfbm2Di5UxI17FifWpB4HPWfKH36Y3SeDvJYvql3LKRGgqHyRh2t4ipjxmjkc0wUIBb4XgEHZj1Tq+w04lFNyjKBomAaH+zLyWl1g9fjMZ9/Y3eIGc9mWkKX8Wez7PlOQ/2zY/KGMKJQ7MIDclGNhsOba0GmOBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDEpA8c41FGuiFCuIJTHJfQF377urw0YpbokY6yFwvE=;
 b=tLxGeDFjY5RnvU87E1O05b3eIJsudBwZISAjU18/ptyuRNgAnkcKrRsFJm2rmwbES/CCwdHOLl4OeDs5oAvuELpu+rHVg+9eZlIWTP04MtAYztksEAwGsAR/HzZbXYaW89cyQTTaobx3nv2iQK1pwBu86mU6aEH/r1ufFI2RLtzXlXZ84atJuAhprCEzpSLpNo5dBEL30gosboKtuJ4I7ZXDkDgL9/nXCS3R69ByQTl5hJN1iU+BtoozDZWUe0O/5Y0Mh54FGXyP07krO9SLJWe8sAq0clCCFkVOjOwW7KjLh17VvnJ+X7AX15LakpIecXRXeRWnKNy2AwRI+cWD/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ1PR11MB6299.namprd11.prod.outlook.com (2603:10b6:a03:456::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Fri, 22 Nov
 2024 11:22:15 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%6]) with mapi id 15.20.8182.018; Fri, 22 Nov 2024
 11:22:15 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] hostapd: Security fix for CVE-2023-52160
Date: Fri, 22 Nov 2024 19:22:01 +0800
Message-Id: <20241122112201.1171240-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0051.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::14) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ1PR11MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: d35c8ff9-251a-42be-0f89-08dd0ae7eaec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pgm/VTfUaMmub7qYsbjRkqqHTUU+gNOr6WLebEIxAGBYTdKhiwlpKS0iDL4j?=
 =?us-ascii?Q?aY5yjPU4rEq5lsvhkP2bZMHXIZz9BurNoErpUYMABEox993PsqD3mAod/xew?=
 =?us-ascii?Q?WZf7Hckbslc3NlTOo5TfmfyYZhwmakLBsbM09n8doZ6cGitkHnOuSAM3Guxf?=
 =?us-ascii?Q?wuTxEFh/3M8QfCdD93Vgkvepi9khNKw/bRN82kwoXMDGNL7d1SXwAwfDL2Oi?=
 =?us-ascii?Q?PXMHaOUQayUDsh+QyeowQ3ALnMSku2LG2xTAtbjvpt25w6O2MdPY/IWDTD7E?=
 =?us-ascii?Q?irzxgfYLul4ckQuNOhCit6YHg0/EqF6WDZYvibIb8nYQOIybuLpcTAMJ5oIy?=
 =?us-ascii?Q?5Xk2wCvYVVQ5Uv6SGJsihQ7giqNxqbXdIXxrVfJ8RSV8a0OB3Vp9mDsSoyWa?=
 =?us-ascii?Q?BB5VCy8GQ0mPQy4rc0FPF6Wyftj43h6PmvDfjiu+X7Kkch+hyY8r8vVHd3/+?=
 =?us-ascii?Q?mwbRRePbb5gwRMXfcf2S+1HJi71b455bjkWM37vBh/DRJ8dWi+ihH2gLC/zA?=
 =?us-ascii?Q?PJenTvhJRg7QfbUKGeLKDNKLj38PnW2wiqajodqklsznSc88AGpwIzedvNjT?=
 =?us-ascii?Q?cpVZp0iTkswd9Lf9k4lKUVM2vWLE9dNy/2ic9BqJF6UnJIqSalEqAFSrVVg/?=
 =?us-ascii?Q?aVNxdR0CXRaxn0hvXBD7x7RqGvzornnZutTwJtUko9QSF7rbr0A6koef3SMi?=
 =?us-ascii?Q?CzuVbeWrIg6RFt7R/gTfxZdWKzssvkaPZcxJxqYrbqAY5QnTXhFqTirnftgP?=
 =?us-ascii?Q?Z7jZFRQhUHRAVe3SlaD7oAXL500sBx2Q/2BzG+RBN+acZk+Su1t8xw5jBJOb?=
 =?us-ascii?Q?tOD0JL0WD3FDNyaag1UzdGiz1k6h92oxC3ef0JMT5ikmRPw+qzySM60E4JFN?=
 =?us-ascii?Q?kB9i9ogWUXT0qKZjIj4gDtwOPlbdp/6DUAWpTvjn5CT8MHiWfm/BWOHYNmzD?=
 =?us-ascii?Q?jWnmMsLWlOMF1jXjttsL/Yta8af6nixYSg8YxC3wmRnWmdIwu0pzkW3haz7P?=
 =?us-ascii?Q?L53nLQnCbRflx4E+KJTF/T1fkL4PC5BUshCNQbbj1++IndreMZNrAs851MmV?=
 =?us-ascii?Q?3Cu9nBA02+7kOsXErXz/mYYWkSfAf5ZinK1Riiq712i41qfoFluxXKffdvfe?=
 =?us-ascii?Q?B4BHz1xw8D3Kp1nAO9JchpnO6EnOx/uBO04c3kRtG/25F920eu8P+mGxs1Hi?=
 =?us-ascii?Q?hf7SJM0MMJAX2/+0bu+zLwRPTYFObfGeFDyPQctgApou0JtreDGoUOsOw1Zo?=
 =?us-ascii?Q?t4EaZMWp1h17IwP5jTEswQ35Tx4O8PJt3m7QF9uv6qE6vm2NCV1JLoK8wBqc?=
 =?us-ascii?Q?Mj3Xsrw8d/mQrchhyOWqzLck?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NTYoQkgHg95fpocaD2xl9JH7aZlHbnKyRnoRX8JvYZgWTeIR4cm7q7pxvW1f?=
 =?us-ascii?Q?PrC51FGu9moQX2VzREPCzB4afxZU9TNauM//b2l044JLar1aFZEK4qVlt3xk?=
 =?us-ascii?Q?freG0qhEegOdws/jsBHUyD3FJCyG96Y9vNrAaY58C3dI2TtvoqcvVpuoHEuy?=
 =?us-ascii?Q?InV1QLomfOpGwygw8cl2k0HqqCSGbh79OFeU0LxJI0tecdXeo6za8i3hP1AO?=
 =?us-ascii?Q?Pq6PRcTGBSxiFZ+gegQb6h3C8T3ldV37QnqX4Znfb2/pI0QEan1eFDBmMRna?=
 =?us-ascii?Q?huoSEM/OtLh3RjoXNf6W6AIXyOa90HKmzqH3bb5kLsTDIZz2KrMPUGcwUPVj?=
 =?us-ascii?Q?RW2z014nYTyQKSJnhFV+GBHuqLHzXJPLGu4wBD/NQkiG0MpMhKPu9z2hCqGw?=
 =?us-ascii?Q?jJo965mmADI8Ftpyp8fkX266cWi8nT142BSLAzAT5KyjWeeG9+Zg177KxyVh?=
 =?us-ascii?Q?DJ5NK+eqSzqdkf+aHbnrc8RD29E0FG4p4eFlxv8ImKGsXzdSJqp1YkiMZc3b?=
 =?us-ascii?Q?lliDZ7/FYSkqEcGLznSt2VmCYTXhIb/aGrNKXpTgnRYcO3syIIwrZP3I77aM?=
 =?us-ascii?Q?tcF5w3oOXfW49O9Ycz6/UGIfBBrIFCBGdLnMlx8OMuoCONbc4dS2Y28+gygk?=
 =?us-ascii?Q?RV+uFilojmejfSYW7m441ZAROcFxSGFddSlJVs2wbKs8NW9UxFF80wNxdPSp?=
 =?us-ascii?Q?w74EWApWefMJEbIpsmA341S2TcZGsORD0cdO9kXAqz4F5CTSYMB1swiUETkE?=
 =?us-ascii?Q?MEKE+3PyzuMewFnsNGcXgwcEt6GwVtPEdHNPfEpZGUEL34kCyMyt6zMq9rdP?=
 =?us-ascii?Q?DdanKh3j+sZpBp0Lo50jFDOBiHdVISs4q+MRuaChN/5LO6hngQ0xpkongpnw?=
 =?us-ascii?Q?u2ByRqg3qjCQ1bPgk5e38NG8PZXbimXAkbo6v62lP0XHAEEn3Y32Q0VwxpAi?=
 =?us-ascii?Q?c0CMgF3o7V56yitoISmI4kY/EP6Nr3WIoIQlVJMfRQUuUxUa/RPQtg8wu7I1?=
 =?us-ascii?Q?o/YhnaaErtx6o2Ysv0dZWVa98w2o42KK8tZePiDfKxUZQ+JXJT7mPspAkA6Z?=
 =?us-ascii?Q?er1K4iOIt03U0PxTqQ/87zbRmMi54QpcutP/Akx8404aqE4WGPs/9wovmps2?=
 =?us-ascii?Q?9mnP7lPTHS1nFL2ym/inkLxLSAKi//3b0d1gyvY9+29a5SKh5KRfIt96KXnG?=
 =?us-ascii?Q?2nasgTmoZYhFDgLpqrpUrqyz5X5wZeO0u6ok69nPxyxvVARsxAB0KtTPWQcR?=
 =?us-ascii?Q?pOd/57yk+JXqxlMS5+fVDaTR1gm31nf6Ht6v9/qBS8wmUkuG6wS3xKuCsxhY?=
 =?us-ascii?Q?OhKE3GbqDsmRXtvlbOc531ok2dtIx3PbJfCj6fripHZmKmW2fGs1WLNpHq6z?=
 =?us-ascii?Q?z7MIzZ0lAxE+rj746fcuX5B0d0TVfD0LPoEAvZ0Rx6fpC6xrg/R7ehZbHUP9?=
 =?us-ascii?Q?8Z0ZlOGHQOM3wg0V7NT0U9e4rrRToo72P9661dFd5l1VefK8kxuzDrST/ngF?=
 =?us-ascii?Q?NK8KG44EcX0QYqqW+t5/xEj7eiMuBnIVXMTukEJ6RdScp3QF+99F+ZmFPkZw?=
 =?us-ascii?Q?adCnSpr1uJ3MmIytAbgjyisSyfB7bw9B5tt8OpUi?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d35c8ff9-251a-42be-0f89-08dd0ae7eaec
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 11:22:15.3376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XsU3pKbz5NiNHpfOZBNg9m8XWZAWseNck+xCS1aBJq2AhAZ1xojYBpN769hub1saWMso5Jp+eCYzXSw6BrGrtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6299
X-Proofpoint-ORIG-GUID: OGQVUU45vMztqkAWVt4fuXSlYAQPpRUj
X-Proofpoint-GUID: OGQVUU45vMztqkAWVt4fuXSlYAQPpRUj
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=6740696a cx=c_pps a=tyvwN2z/Y66O58r8mq/nTQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=PYnjg3YJAAAA:8
 a=yaAG3qJ-AAAA:8 a=t7CeM3EgAAAA:8 a=xvHWRMd5xRLSVjcULC4A:9 a=GFfUI7B0NGUA:10 a=oLVlbjkABFOu4cUI0CGI:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-22_04,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411220096
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 11:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113997

CVE-2023-52160:
The implementation of PEAP in wpa_supplicant through 2.10 allows
authentication bypass. For a successful attack, wpa_supplicant must be
configured to not verify the network's TLS certificate during Phase 1
authentication, and an eap_peap_decrypt vulnerability can then be abused
to skip Phase 2 authentication. The attack vector is sending an EAP-TLV
Success packet instead of starting Phase 2. This allows an adversary to
impersonate Enterprise Wi-Fi networks.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-52160

Patch from:
https://w1.fi/cgit/hostap/commit/?id=8e6485a1bcb0baffdea9e55255a81270b768439c

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../hostapd/hostapd/CVE-2023-52160.patch      | 198 ++++++++++++++++++
 .../hostapd/hostapd_2.10.bb                   |   1 +
 2 files changed, 199 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2023-52160.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2023-52160.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2023-52160.patch
new file mode 100644
index 000000000..7f46ea84c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2023-52160.patch
@@ -0,0 +1,198 @@
+From 6c81c2d98dc5a8a6296820bd9f083faae2c788c3 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 8 Jul 2023 19:55:32 +0300
+Subject: [PATCH] PEAP client: Update Phase 2 authentication requirements
+
+The previous PEAP client behavior allowed the server to skip Phase 2
+authentication with the expectation that the server was authenticated
+during Phase 1 through TLS server certificate validation. Various PEAP
+specifications are not exactly clear on what the behavior on this front
+is supposed to be and as such, this ended up being more flexible than
+the TTLS/FAST/TEAP cases. However, this is not really ideal when
+unfortunately common misconfiguration of PEAP is used in deployed
+devices where the server trust root (ca_cert) is not configured or the
+user has an easy option for allowing this validation step to be skipped.
+
+Change the default PEAP client behavior to be to require Phase 2
+authentication to be successfully completed for cases where TLS session
+resumption is not used and the client certificate has not been
+configured. Those two exceptions are the main cases where a deployed
+authentication server might skip Phase 2 and as such, where a more
+strict default behavior could result in undesired interoperability
+issues. Requiring Phase 2 authentication will end up disabling TLS
+session resumption automatically to avoid interoperability issues.
+
+Allow Phase 2 authentication behavior to be configured with a new phase1
+configuration parameter option:
+'phase2_auth' option can be used to control Phase 2 (i.e., within TLS
+tunnel) behavior for PEAP:
+ * 0 = do not require Phase 2 authentication
+ * 1 = require Phase 2 authentication when client certificate
+   (private_key/client_cert) is no used and TLS session resumption was
+   not used (default)
+ * 2 = require Phase 2 authentication in all cases
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+CVE: CVE-2023-52160
+
+Upstream-Status: Backport
+[https://w1.fi/cgit/hostap/commit/?id=8e6485a1bcb0baffdea9e55255a81270b768439c]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/eap_peer/eap_config.h     |  8 +++++++
+ src/eap_peer/eap_peap.c       | 40 ++++++++++++++++++++++++++++++++---
+ src/eap_peer/eap_tls_common.c |  6 ++++++
+ src/eap_peer/eap_tls_common.h |  5 +++++
+ 4 files changed, 56 insertions(+), 3 deletions(-)
+
+diff --git a/src/eap_peer/eap_config.h b/src/eap_peer/eap_config.h
+index 3238f74..047eec2 100644
+--- a/src/eap_peer/eap_config.h
++++ b/src/eap_peer/eap_config.h
+@@ -469,6 +469,14 @@ struct eap_peer_config {
+ 	 * 1 = use cryptobinding if server supports it
+ 	 * 2 = require cryptobinding
+ 	 *
++	 * phase2_auth option can be used to control Phase 2 (i.e., within TLS
++	 * tunnel) behavior for PEAP:
++	 * 0 = do not require Phase 2 authentication
++	 * 1 = require Phase 2 authentication when client certificate
++	 *  (private_key/client_cert) is no used and TLS session resumption was
++	 *  not used (default)
++	 * 2 = require Phase 2 authentication in all cases
++	 *
+ 	 * EAP-WSC (WPS) uses following options: pin=Device_Password and
+ 	 * uuid=Device_UUID
+ 	 *
+diff --git a/src/eap_peer/eap_peap.c b/src/eap_peer/eap_peap.c
+index 12e30df..6080697 100644
+--- a/src/eap_peer/eap_peap.c
++++ b/src/eap_peer/eap_peap.c
+@@ -67,6 +67,7 @@ struct eap_peap_data {
+ 	u8 cmk[20];
+ 	int soh; /* Whether IF-TNCCS-SOH (Statement of Health; Microsoft NAP)
+ 		  * is enabled. */
++	enum { NO_AUTH, FOR_INITIAL, ALWAYS } phase2_auth;
+ };
+ 
+ 
+@@ -114,6 +115,19 @@ static void eap_peap_parse_phase1(struct eap_peap_data *data,
+ 		wpa_printf(MSG_DEBUG, "EAP-PEAP: Require cryptobinding");
+ 	}
+ 
++	if (os_strstr(phase1, "phase2_auth=0")) {
++		data->phase2_auth = NO_AUTH;
++		wpa_printf(MSG_DEBUG,
++			   "EAP-PEAP: Do not require Phase 2 authentication");
++	} else if (os_strstr(phase1, "phase2_auth=1")) {
++		data->phase2_auth = FOR_INITIAL;
++		wpa_printf(MSG_DEBUG,
++			   "EAP-PEAP: Require Phase 2 authentication for initial connection");
++	} else if (os_strstr(phase1, "phase2_auth=2")) {
++		data->phase2_auth = ALWAYS;
++		wpa_printf(MSG_DEBUG,
++			   "EAP-PEAP: Require Phase 2 authentication for all cases");
++	}
+ #ifdef EAP_TNC
+ 	if (os_strstr(phase1, "tnc=soh2")) {
+ 		data->soh = 2;
+@@ -142,6 +156,7 @@ static void * eap_peap_init(struct eap_sm *sm)
+ 	data->force_peap_version = -1;
+ 	data->peap_outer_success = 2;
+ 	data->crypto_binding = OPTIONAL_BINDING;
++	data->phase2_auth = FOR_INITIAL;
+ 
+ 	if (config && config->phase1)
+ 		eap_peap_parse_phase1(data, config->phase1);
+@@ -454,6 +469,20 @@ static int eap_tlv_validate_cryptobinding(struct eap_sm *sm,
+ }
+ 
+ 
++static bool peap_phase2_sufficient(struct eap_sm *sm,
++				   struct eap_peap_data *data)
++{
++	if ((data->phase2_auth == ALWAYS ||
++	     (data->phase2_auth == FOR_INITIAL &&
++	      !tls_connection_resumed(sm->ssl_ctx, data->ssl.conn) &&
++	      !data->ssl.client_cert_conf) ||
++	     data->phase2_eap_started) &&
++	    !data->phase2_eap_success)
++		return false;
++	return true;
++}
++
++
+ /**
+  * eap_tlv_process - Process a received EAP-TLV message and generate a response
+  * @sm: Pointer to EAP state machine allocated with eap_peer_sm_init()
+@@ -568,6 +597,11 @@ static int eap_tlv_process(struct eap_sm *sm, struct eap_peap_data *data,
+ 					   " - force failed Phase 2");
+ 				resp_status = EAP_TLV_RESULT_FAILURE;
+ 				ret->decision = DECISION_FAIL;
++			} else if (!peap_phase2_sufficient(sm, data)) {
++				wpa_printf(MSG_INFO,
++					   "EAP-PEAP: Server indicated Phase 2 success, but sufficient Phase 2 authentication has not been completed");
++				resp_status = EAP_TLV_RESULT_FAILURE;
++				ret->decision = DECISION_FAIL;
+ 			} else {
+ 				resp_status = EAP_TLV_RESULT_SUCCESS;
+ 				ret->decision = DECISION_UNCOND_SUCC;
+@@ -887,8 +921,7 @@ continue_req:
+ 			/* EAP-Success within TLS tunnel is used to indicate
+ 			 * shutdown of the TLS channel. The authentication has
+ 			 * been completed. */
+-			if (data->phase2_eap_started &&
+-			    !data->phase2_eap_success) {
++			if (!peap_phase2_sufficient(sm, data)) {
+ 				wpa_printf(MSG_DEBUG, "EAP-PEAP: Phase 2 "
+ 					   "Success used to indicate success, "
+ 					   "but Phase 2 EAP was not yet "
+@@ -1199,8 +1232,9 @@ static struct wpabuf * eap_peap_process(struct eap_sm *sm, void *priv,
+ static bool eap_peap_has_reauth_data(struct eap_sm *sm, void *priv)
+ {
+ 	struct eap_peap_data *data = priv;
++
+ 	return tls_connection_established(sm->ssl_ctx, data->ssl.conn) &&
+-		data->phase2_success;
++		data->phase2_success && data->phase2_auth != ALWAYS;
+ }
+ 
+ 
+diff --git a/src/eap_peer/eap_tls_common.c b/src/eap_peer/eap_tls_common.c
+index c1837db..a53eeb1 100644
+--- a/src/eap_peer/eap_tls_common.c
++++ b/src/eap_peer/eap_tls_common.c
+@@ -239,6 +239,12 @@ static int eap_tls_params_from_conf(struct eap_sm *sm,
+ 
+ 	sm->ext_cert_check = !!(params->flags & TLS_CONN_EXT_CERT_CHECK);
+ 
++	if (!phase2)
++		data->client_cert_conf = params->client_cert ||
++			params->client_cert_blob ||
++			params->private_key ||
++			params->private_key_blob;
++
+ 	return 0;
+ }
+ 
+diff --git a/src/eap_peer/eap_tls_common.h b/src/eap_peer/eap_tls_common.h
+index 9ac0012..3348634 100644
+--- a/src/eap_peer/eap_tls_common.h
++++ b/src/eap_peer/eap_tls_common.h
+@@ -79,6 +79,11 @@ struct eap_ssl_data {
+ 	 * tls_v13 - Whether TLS v1.3 or newer is used
+ 	 */
+ 	int tls_v13;
++
++	/**
++	 * client_cert_conf: Whether client certificate has been configured
++	 */
++	bool client_cert_conf;
+ };
+ 
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
index dbdc5c1bd..039847efb 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
@@ -11,6 +11,7 @@ SRC_URI = " \
     file://defconfig \
     file://init \
     file://hostapd.service \
+    file://CVE-2023-52160.patch \
 "
 
 
-- 
2.25.1


