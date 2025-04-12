Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5ACC369A1
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 09:57:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7848.1744451829499543504
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Apr 2025 02:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61970a395c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53C9t20F027124
	for <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 09:57:08 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ydd1g9sq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 09:57:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v05fSYnLlzB6LgChkRXGHwwrMkKiUTd7AS8hHujKBBIqXol+VrUJgOoqbpMn1L6UCCe1mCLH4v5rmrJi4q7aeHaMWVUbAy179VpgfaUSU/Z36TvPAgWuX462uvCESq5a+YAj/KS2ttSYna/kRZfI+EVA7EdrKWR59f1DDveg86XvKIL4bUG2FyKWIwVACCRzF8NKP62BAPuGTFxsEy0J3FwKwRI997oC/QkC6gFFSKlkko0gx0+S3l+mH23l0oqlvfzhhzOnixccCTQ7wuUkMHBHper/Sk2DoaJeNSIu1oVWsmLpx8k3jMYuYesmxsHekvi72l97vHH6H9PqfSarpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/09BPvDcPY0ZDJ75g/YoUx1Q4/UpzZZD7kJ338Ch7b8=;
 b=HQ+qd/KijvdmjgDyp6lyNhi6haS4hBCZRi0HbKJK348hR0doHIKPfrhfWrCR0l8+PeMdRm54M5kMZjCVVSymaN5uucRvOQ4lN1glorzdO7m5acE/R+0UtmsUwzAh+0XS9wpmEe+H30AMHa+4lTmuZ62iOTDyM+ZNC7lpXownBbZsjY3FK9HnVYDwwy5IgNWx/r/wotdCAVKMXyj5F94DNozF5/qV4uSGvETznFj5nS/JXmNldqQusHMXssJoy3gykszBl36p2m5TSB9nvM7qoyYGWlkXW0ifLv3fBWYlMv6/txGH4n0smYhqJA/OLy1QtNcks1K0zmo9Nf1KpXIEqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB7926.namprd11.prod.outlook.com (2603:10b6:8:f9::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.35; Sat, 12 Apr 2025 09:57:07 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8632.030; Sat, 12 Apr 2025
 09:57:06 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] ntp: set UPSTREAM_CHECK_REGEX
Date: Sat, 12 Apr 2025 17:56:53 +0800
Message-Id: <20250412095653.2638693-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:404:56::36) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a20ddd6-781c-4940-bc8b-08dd79a86241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mEgEOXW7zChAhIsgHXzn4QgwHegcsNByqPTkJdPbISIr7zNNgfW4jTlZfaiq?=
 =?us-ascii?Q?Z5BdjlPeL8Tq474SA0FCoJFuspssYb2TneViymPAdSrYeJYzg+I2tyJeTG/N?=
 =?us-ascii?Q?QCF+a9EfHrPEbxZJ2UctoWKtWCPfVWbxv+8sJjCW6dHekqOWndkc6pDFhQ5S?=
 =?us-ascii?Q?Eb/qiAhy04jsFOLgMdMTrn7lulvi0M7GvYPSVaP3owV6xJfqBqKSzpYeZH7m?=
 =?us-ascii?Q?Y20pXzfpKHJXSSKtpWDZl6MF/xGC0teg/UvQWCx3QMaw3qaPotHC3Ye/sWKV?=
 =?us-ascii?Q?fQ1qdTxWQQloNXBY0DkpL9GGwzX7tVj5Pd6gN9xX25H4ZQYpG1jI+BVQbGlX?=
 =?us-ascii?Q?G2OwPY4dXtn+58aeBiIA2h1uzH7aVLjcksq/b4VfGljYfBKEDNKdUbHoAaTE?=
 =?us-ascii?Q?KGuuAjBvlI6iUhK3Vg+t5itHTs/7VHcsHIFJPkCBRGUGEpOWl2w2woKImROr?=
 =?us-ascii?Q?pJDnzLiuKajC2kWS2yjfand3vSX0lm/aWzQODUujKIFZ1HbftUqAxKNgErJF?=
 =?us-ascii?Q?MfsmilpR+o0a/q287YIG6K1L/vIRP0PKkIvpFjvV+Ti+AuOkJSmfqesZz1fS?=
 =?us-ascii?Q?yauRDCjfm0nhzAslhQoZhb6eWkPHq3vwR6sTs7Lnax1A3xX3RPII3DKe7XDX?=
 =?us-ascii?Q?wqlImYvzZ39/WQgUYZV/IPEM5JZ65zoi2E4ESRpFi0ADbZdNTYv7l773VNFG?=
 =?us-ascii?Q?NncjVb/UBwTiAhiCzlJSiellDf9ZIopq0lZrUVgWeQRwOi4OvDmiTkoE9czM?=
 =?us-ascii?Q?S1nhlGvqDdPG/OkjsDnS2hqLY80zmTxrPQeD6sPBvW7OMOCmm90VTnySI/fh?=
 =?us-ascii?Q?9qRh/wlqeAXs28tO8NDXZarjrSTtUTC1FHieTIBaLXVEWPqInnDIPZZvrnHa?=
 =?us-ascii?Q?sKGWjOV6lV3ryRqEa7bHBuG8j9hvCMNwoF4grX2Sz7UaX0o3MNhffTSFra0i?=
 =?us-ascii?Q?UxxpvhUgkxSeLcjeBnHAHm/WR+gIGbQcwdjEo2Lr46MND1/OIS0E0XK6JUy4?=
 =?us-ascii?Q?KobN5e+5+a3fVfnbqyIQ59E5R6gKRyfdJg8PLk88EPDRuF/tkyHE2U9KpGY7?=
 =?us-ascii?Q?z7A2dHsDqc4wQrzdsRqus4lTy6Ff+5LVbQfj5rjAVjtVzuo1KKwOKkZl3kpd?=
 =?us-ascii?Q?6tvSFmUYF5CPS+/SxWxOs5uihYUQKaEe1KxRF/IYOo1OsPuRlK4gdWK8nLLE?=
 =?us-ascii?Q?A614sxm0xblG14ZcfVKsE6+uQZNI3WkuiCiKSm6e7F9/P8fTfgjdM7MHldui?=
 =?us-ascii?Q?Krs2zqL2pMq8pS+iRZgdWmK55po+NGqyHyZPGi1ru060DTAHCgImzrvNpAc4?=
 =?us-ascii?Q?ZOAl86hIcy1jBm7noIv5pXKOtCYKp9iex+dWF+QfPQEjChI7eLQrEZ5JtHhV?=
 =?us-ascii?Q?lQPpwLtcU61h62eINewnXrCCwMXzhDAJnW3wr9QHuSgS9QjS9ZTmKD0dyRpf?=
 =?us-ascii?Q?0YIDg0V5MlA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FkVOlBeJpmyj8Mul8m/KksHkylx4bYGtc0Dng74BmMPviTPIbN9ExVl4XhM5?=
 =?us-ascii?Q?KQATLZ747NIRghElQBMso0iyH4NK0qI1nTXPV6XuNk2oiHF37luzZpoZwxTE?=
 =?us-ascii?Q?Oe2e02pYbFmz76+B2ykN6D3zHkMw1lOe2IqlYiGPIbHK44X3dcFRnMoDmQEq?=
 =?us-ascii?Q?h+P++iWS0pAvltIZCWNIutB1Go2aM644P8t1CjgQzs1Ji4PdLd6weN9kmU/6?=
 =?us-ascii?Q?SDiQK5qo+eWj54Dmi34qja+P3QwIq3dUFhAxOoIR9zP2dDFnSPqfyTpH59iP?=
 =?us-ascii?Q?CoQaic2OKsLjfgollGukt1Sm0LR03DSWmJNO0OMdDuydn9TOGLE2doA6CncD?=
 =?us-ascii?Q?J6VPm9lhRlclJRVBqynACiBjty8mRSm8eiGavpd4tkYQIH+0r2plEt5dNDxk?=
 =?us-ascii?Q?W/4jXPnvXrVbvyl/BJdFHY72+1sV1zaPDFMueVpBL8T76P2cPx49N8ipevPO?=
 =?us-ascii?Q?kcCi+Ac/LtheLXArFSQFiCKdYCJJKlrU2cAHefoOU2/8DVa19jveBlPqd9VE?=
 =?us-ascii?Q?XtFZbvTdR5o6wVBde1whpZP4Y0d74WLbRrxcBV8rYP9BYbK1+w1sxWJ4DS1h?=
 =?us-ascii?Q?duXvRl0bzqz1o/2aY9/O9zwq4ZjaAMJSWF19eKUFUi350CDdO11lonk5OI4p?=
 =?us-ascii?Q?laB559tRKUGFq1zdKQHMBWfFNFuPZpwkZm9DWFAE9viVzi/pCLBu/QGZLBGj?=
 =?us-ascii?Q?YBn7x5r+sEs2IoIHNgAgCZotv2Xp3ABZbq3jh0rzf2RmIgWvIdRkcH2kaTET?=
 =?us-ascii?Q?jldReCGVy4Aoz9OoUWEKJ3V7oyBkYpY3oQhfmHn++siHbansubNNupRfqv25?=
 =?us-ascii?Q?wDQxUrf/ED/dARoy3nPzrbJZyUZPb9Rn4eY3O+FjLhL778fgEhWCArV0YF2L?=
 =?us-ascii?Q?aH0YKdVE2l4Anpow2btzfqoMW4JHIvO+lNRLQtXNR7pOruUwaf0SveKXy0eq?=
 =?us-ascii?Q?yMZi+LTDI40mKJB7gPGuok+KvPD61sil0CWWGxPBy7uiUSun4w2ussIKLZhA?=
 =?us-ascii?Q?5pBvIZtKwuUu8McyHr7z02mbhpoW8KOu+zonmDlMYGy5e2UWBypkbhpiL5fM?=
 =?us-ascii?Q?8s/MQFlMYAPzoWYFcz4T2doCl5MO1Q0bwD1hrofZkap19jR+HGZiZ7qFOJIw?=
 =?us-ascii?Q?ZwpYNXGWmgvhd34N0tf2SY8QSUe1dvbbGLA2MPc+Ixzto2JhX0/EAP2ancTr?=
 =?us-ascii?Q?Fd8tudzvr4HSIkxOZzaenezrcPKlM+tHfcspJ5J0RwtVw+6IQP8UdxBKjF9S?=
 =?us-ascii?Q?lIjM4gaIXiAxwwfwPYbsabxl304qFWuEpLHgfykI2lH5DpXE+Z4LTEW8fC/Q?=
 =?us-ascii?Q?Iv1Rrg7oVg0nInxYV8+44QSkunyxz7CDyfe7Jbwjt0sey9jz5zNRd4Y6NpIg?=
 =?us-ascii?Q?Ot9XJN3l98bNZm9W3glLskE34Ef8w49kNFTt83mcFjoccXEm30DuExpu5xTm?=
 =?us-ascii?Q?Q95eLIDUa12FPzToaVYFcSBK1h2cdexga2eCtk8vDWNcBwIpk6nheG8xScH8?=
 =?us-ascii?Q?9ve6qzWLgVf+FuL98XP9Nu7vAGP2WvtNTi/8+Wke8FjAS339BDkvHNnWa+p9?=
 =?us-ascii?Q?LDCwLqCbkj4Cu8xoKDoC7e/6AGJxtRvIZVmfEV3z?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a20ddd6-781c-4940-bc8b-08dd79a86241
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2025 09:57:06.9112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vqWjFasO8kPOdDzCCXFoDvl+sobDcoWi13estR5t5n/8AI6jDqnD0A2g7U0I1rCRqju2bblyE0MQj7Arz8ZNGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7926
X-Proofpoint-ORIG-GUID: YbM2CP8XtOS-VNirBQAGTHSbNcaKzEXQ
X-Proofpoint-GUID: YbM2CP8XtOS-VNirBQAGTHSbNcaKzEXQ
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=67fa38f4 cx=c_pps a=joO5rFOndlhnht97C4Lqsw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=gCGlv7sVAAAA:8 a=t7CeM3EgAAAA:8 a=vs0_ZgANs9b88tTd9wcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504120072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 09:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116811

Set UPSTREAM_CHECK_REGEX to skip RC/beta version.

Before the fix:
$ devtool latest-version ntp
INFO: Current version: 4.2.8p18
INFO: Latest version: 4.2.8p18-RC1

After the fix:
$ devtool latest-version ntp
INFO: Current version: 4.2.8p18
INFO: Latest version: 4.2.8p18

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
index 6fae993482..33d19a696a 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
@@ -26,6 +26,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
 
 SRC_URI[sha256sum] = "cf84c5f3fb1a295284942624d823fffa634144e096cfc4f9969ac98ef5f468e5"
 
+UPSTREAM_CHECK_REGEX = "ntp-(?P<pver>(\d+(\.\d+)+)(p\d+)?)\.tar"
+
 CVE_STATUS[CVE-2016-9312] = "not-applicable-platform: Issue only applies on Windows"
 CVE_STATUS[CVE-2019-11331] = "upstream-wontfix: inherent to RFC 5905 and cannot be fixed without breaking compatibility"
 CVE_STATUS_GROUPS += "CVE_STATUS_NTP"
-- 
2.34.1


