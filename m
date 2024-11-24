Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24A8E668B7
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 15:20:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.68468.1732461598395324586
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Nov 2024 07:19:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10583a7535=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOElPNS011827
	for <openembedded-devel@lists.openembedded.org>; Sun, 24 Nov 2024 07:19:58 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433feq0snj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 24 Nov 2024 07:19:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMkFN8J71qNLd9tQMWwUXlwzJx8LYVXzIGAmJipleU74tLjPXqqm1St00b3r4qNK6DtFUeOSpPzSPdOTRchTRz00RNJbENZUC2K3rAg2KRQNXvzt3roiDJJztbRUA3f592tkUMjsFM3fahXJHSVFLV7GTkVIAnFV6WRnJzSgzzeCzJdXeoOIuD6VsOO2Xm0UelZNLMBpIqqYn4I7IgMPpMJqe7i8BYXbCBFFL0CYiG0DosYVDFJFmJOd7bf6nwKtsAjcXSHuLakgchtVL83pxmJVpLDEfcBcWvbxJ75gVqQBJiI2XU3m1l918naQGTMiBlMJwXd9JQSUCQoZHOoCnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTp57AmorMwEeKPTu0DngjwtP1ErJMSLFSbkgvCpmNo=;
 b=P8h39k99YL1Ear/nFTNW1yw026MJiFAoa9k1+clrOgDL84qPycJsv2lACw8b0JYXLaajYmEHOl8mczCzbCBrgUMIANvMzBf4ojszqMa5sBIjmta6UTolTW+KAU5DZWDwEHjB9PEw3uih0K+tQL1Bixq6XrPbnllhgJxlCXChmdHtYGiWkSoXqsJJn9ZqtYqoG27Sx8Tuilt23Rszj2JMUC7kVBn7ZP+ZGT8YYJsXSU8d0X+KEnt5QTvpBmZyGIbvhtl+D0QOrLzvkqei4ZSXbKRFq2fZL+3uzBgPwIE02dlpRISHuNZh7OB9PRAD5H5ONMvcCWc/6TI9VsguDAxKUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CH3PR11MB8751.namprd11.prod.outlook.com (2603:10b6:610:1c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Sun, 24 Nov
 2024 15:19:55 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%6]) with mapi id 15.20.8182.018; Sun, 24 Nov 2024
 15:19:55 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] hostapd: Security fix for CVE-2023-52160
Date: Sun, 24 Nov 2024 23:19:40 +0800
Message-Id: <20241124151940.2030379-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::7) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CH3PR11MB8751:EE_
X-MS-Office365-Filtering-Correlation-Id: ea6e227d-2fc1-4239-9ba7-08dd0c9b7341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Q0Cg4+x7EbJhBLJL8xSbzqXyjap6LuzcPARLrL+k/WBQuMJsYbx/ZC4D4Teo?=
 =?us-ascii?Q?JVBEQ48rmEK/0R5Bc+rUpLXyiLZnKNDcd6e2T1FIAHGRouVXl5vWO9JachDI?=
 =?us-ascii?Q?OMcHhaHYFu4pKTqxIIrMffJDPweOCK7UNTHnybCnn5O5WjZKmVbHusKA9ccB?=
 =?us-ascii?Q?rvQGDmjXhVMGEymOce/9uepGE9QTJVGwNDFAIBPRt0XyI0W/x85ug94Znb+g?=
 =?us-ascii?Q?JE8rXfoFgMxnydjS5ozQQEW2e9DsoYtwWzax3BhFw9efJ4uQHZGqJCnakosG?=
 =?us-ascii?Q?Gn2WPgf0saT82Fcv7aLWAIG7ou08ntIr0N9R1F1xxrw6POIqIzLtxmdovtGJ?=
 =?us-ascii?Q?Dy4h22KBjPjwsCBEwWobVhOIah3+juimeqR8TFXigClxoo59Uu77IZ15Y4qY?=
 =?us-ascii?Q?1CBDEBAHulx02+hRqEYKbGUNDc5SXAtrMP1LKj5k4Z8H0tHCN1ymfO5GLPNQ?=
 =?us-ascii?Q?EGIC2CNwSd+FtzPeBzXKcQBvArKhHgiO3EzuXQJ3LSos+lt/89w6SY7xS0hI?=
 =?us-ascii?Q?UxQfSHx0xSpVB2WNuyRCIPFdnjKq4RxNk7CjBYqRJoBr+q884n6lnzBjDBXs?=
 =?us-ascii?Q?pW4sw8sELKKCcEOhnI3ouFDrULOcly9FkiCvQILvaVaaK1cAhtZ3iJOfK5oz?=
 =?us-ascii?Q?ERFQQjQb6FenTma6qlist+9yatq+DFYY3ZQY0HSMFkWgCD6m5mygnvfdLzyV?=
 =?us-ascii?Q?DG+crTq0p6yDfFWaiWRuEAVzjaoo0zmfsnAJrxtF1lY7t29jCXqO2GQV39OT?=
 =?us-ascii?Q?B+ges4EV09O9aJIi0Y8G/P0liVJ7ipUtMgMRzqbIIV6wDfRB+vAiLO1W5z6P?=
 =?us-ascii?Q?HSuH533pbvg0bpNzZ/tlUCnsQQBc0BX4ijMW77Vs1QEil7nHFiqS6RLC2QZN?=
 =?us-ascii?Q?JwYnRKhR2qYuttAr0BowGr7AR7BbYcoTolmQr44a35OW0VUwfJGDj/sx93TY?=
 =?us-ascii?Q?qOqB5q8etrwrFEEw0p7Kkhqg36foOFZ3CFoPWfjrpUkVBp/ITA0VTd2Nhb2b?=
 =?us-ascii?Q?UiXjbuhI1ItkMr9FM6JpDFZGmgvFdM9cHhTQ1I36EjzDOoZMi+mKOuZYLGfl?=
 =?us-ascii?Q?ieOBoWKgTasGIqUpTqDAbt+i69idnHeFR8/87HiE5kuWFj4La+/181LH0YiI?=
 =?us-ascii?Q?80OoldB0m3XLeBHfJqWFyMQ6EUnJC+ZJgk1dC4YW1zfW0AkkW1L2qHJop3hP?=
 =?us-ascii?Q?rUOD/WIDhROdBsew/W8IdUPuKx3jz6/dcZEsxEtP8/PYDbZlg57LMcTHJVGs?=
 =?us-ascii?Q?BZVaPU8obedbao6E3aOfXdDcY5jbSAq252A6H1X32AFTCfNuoPG7aB3QdEOZ?=
 =?us-ascii?Q?gWHrMhNtbfdzzYLi1eqaXoo+VxRaOJ0kqTcOTOkxSVG4Cv78RoEX6sjTRQX1?=
 =?us-ascii?Q?5gGgKqA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?k68po2N5kukw5ZM9OuT1sKuipq4zDKqurrbP2d7DTrg38YP5lZ0/6QB5jWlc?=
 =?us-ascii?Q?F8nR3kvYg1hGDvjOU0opr1fPr9L9AcYnDR9JxLNbB16DfYfG0OfZyJeUlv8E?=
 =?us-ascii?Q?tJDcM2RFm6MWVCY1cmHZ9t7mL7fybA1ie30Gqun+ysBaM8EdWlm+38uXOksn?=
 =?us-ascii?Q?qwZLiobblhVsw7HGkz0DF6ikXTiqSLR8ciioKBbhgXvWKFSaEzAsDFWFxR1B?=
 =?us-ascii?Q?K7UGtowNJOnEZHQYSqcjfb4vx5yFUhiS89QDgP0dhPFeoSwfP4nY0smqmeFR?=
 =?us-ascii?Q?/D4aeQhGoTjZOUktjSyVRm6AWoY7uo0B9cqF+I7tjrOa7KAKy99jedJ84KJJ?=
 =?us-ascii?Q?mEVZyGpXc+k4cB+A4AycjaK102oPWiaCQdSJF6Jk1GJ7MNuPJ2RebRVCe32P?=
 =?us-ascii?Q?RfAeGZhcSgiisQcDF77V/n5y5a69IWiavI6zA9ezNsSYkt9L6zeoCstRuYnG?=
 =?us-ascii?Q?KVEET8ersaw6EnXdDGCHS0wq4gPR+IT6fSabya/HExaYj4NRJOdzAId6z+o5?=
 =?us-ascii?Q?XG3sVxr2n9ivul+Ir3E9kI5sAjtLnFkAHi16nQ1Sz3ntDgwVAzUCK76BToqt?=
 =?us-ascii?Q?e1F4nKeNjnXCLbESArZAKpVzKOZfBbk/XZWvuRnbRUSAWahzdCAKgxRTrEC6?=
 =?us-ascii?Q?DlOOCQSKYH1T1JuIv3FhkP0pn6DsgI1UOF4BSdRyi8QjmBZ2Nk2QVupmuSKn?=
 =?us-ascii?Q?4C45PYkR1YA4Uamp3v/e24krG+fxTjJ3sy6BZB/GKSDM+NqMRP3LwhfKSbdF?=
 =?us-ascii?Q?64mB4UpERkRDrcMlX+E6TzEiJPpPTmqS0sgN7/5MnN7shtBZuQrb8zuJ/d8f?=
 =?us-ascii?Q?5Uj2484dlkwb0XSNhXViy7vk3MUeNNHOsa2ucOCh6QN48LdBn+R4orB6Zkv5?=
 =?us-ascii?Q?TTo+wT5cRIFMDFNxFtz10J82B5uDThBkUzERw77cJ4xJWIwcXPXAVPaQwi0l?=
 =?us-ascii?Q?p/OlS1jTrSDacn8d5DmH19xumaaHhC1qHyz5q8PNVqCL1fiQxDC+Gc1wsZYC?=
 =?us-ascii?Q?Cz+87xeSEy1Q45vbc1M4b2UKpSnZ4Y9ue1crqd3PsUEi0xffKQcefY7iGJ5Q?=
 =?us-ascii?Q?2AtDsR/Irrjzh53VXt1M5+KXigcryjhmJM6AnDBWNW73WIQxK0XvQ/zU09F1?=
 =?us-ascii?Q?tYCy8P98RDhtXhevJ8qlrLc8YzWgXLSafh8Pr5xw34bq6WQ5wTi5wgaqDMEJ?=
 =?us-ascii?Q?SgwZ352oOgJ6acwPJSWdqCFMliZ83pr2LgOvo4KBIUGriU5JUHrmO4PhCJLF?=
 =?us-ascii?Q?WMVU7Ign1/IHlz4x6M8JND54E+7s9/ezOZ414rhCa0Vv15i5LQ/54po7M/ts?=
 =?us-ascii?Q?fQzMlwe73yZ2FHAHhkT7NiJkouPakZce/no0knOUNnzkw93sepW3jiX+az/A?=
 =?us-ascii?Q?xx1uPvME+n6MiUhOVkiR8lF3AKUCsrdz81h1fjr09pN5HgU25L6oSkcTqNi+?=
 =?us-ascii?Q?DWftSxFT9yT9XoC9KNrKUhO3nR3zCICggwsl2a0xTsqjqaZVO7XWyDpJEZT/?=
 =?us-ascii?Q?LgLX/u7OrmTU/Nq/NdqO036XSUd3eTnh1C3aQ25ZdU6TSeNpF6cc6pqbSEou?=
 =?us-ascii?Q?4Uym1/aPJECQKokpuZiTIo9WG2RQLoo5svRxXIi1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea6e227d-2fc1-4239-9ba7-08dd0c9b7341
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2024 15:19:55.1311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vXB7+ZcGylU+cXzE2d3so1WburFFKyLe1vkF7+jC5u5EOZikkQ/MnlALzlb8mUzVj/Vltq8Jb5FLxDtOVBJ5AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8751
X-Authority-Analysis: v=2.4 cv=c+L5Qg9l c=1 sm=1 tr=0 ts=6743441d cx=c_pps a=98TgpmV4a5moxWevO5qy4g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=PYnjg3YJAAAA:8
 a=yaAG3qJ-AAAA:8 a=t7CeM3EgAAAA:8 a=xvHWRMd5xRLSVjcULC4A:9 a=GFfUI7B0NGUA:10 a=oLVlbjkABFOu4cUI0CGI:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: xMg8C-VnnQyB2r22UOJrKLKpXx48d7wd
X-Proofpoint-GUID: xMg8C-VnnQyB2r22UOJrKLKpXx48d7wd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-24_13,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411240133
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Nov 2024 15:20:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114029

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
index a745e7a40..5ef6ac64b 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
@@ -21,6 +21,7 @@ SRC_URI = " \
     file://CVE-2024-3596_08.patch \
     file://0001-SAE-Check-for-invalid-Rejected-Groups-element-length.patch \
     file://0003-SAE-Reject-invalid-Rejected-Groups-element-in-the-pa.patch \
+    file://CVE-2023-52160.patch \
 "
 
 
-- 
2.25.1


