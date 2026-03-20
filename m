Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E55109317A
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 05:52:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6438.1773985953987560325
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 22:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O/hVY2AN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=753931f270=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K574g2731053
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 22:52:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=oUu4W7DjQ1KHfIEMrrBD
	O7HzfHKvMVCjDMiLo51f6Jc=; b=O/hVY2ANjyoJjdU4+r+qb98s5Ls77rQIFAB2
	2MqiQUj/xnWvNEZJgoCpzJHEutUTHHdAp6z2d0XFjJxvLq1rnCBHAvOLiFWFJV2g
	qil2/DXiyT2dte3iqGzDaGS1rAH6H8wpL146PeeO5e5O5z+OoOejxePK45z00ZYF
	B+gBC9Sai59YaJFwsJjME98l1Zwn5QJ6UHrj6ByU0YHrHsvy8PFwFfBCL6flQQGd
	gA9T7tDFDsjzJL5JiD+AteUKNp/rfxVxxfwE2mO2GeZ/u0RV5XytJvkKzhpc598W
	hZF6iVbgUWCI9GZNfKo1f4AA0sn57QhkGD05lsl3QRVGw0cG0A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013044.outbound.protection.outlook.com [40.93.201.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw76dyeat-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 22:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLYzwBZpmE7vEB0iqc5eK9DjuiTPSVTJkCKph2y4ZCcMdFAZVMqO+62jb+bOMasPIHx+B8LneSND3Gont6ymC+uWksJisqg1c1pYXSTgtJMjO9Irw5fUenMh81oSSPDSpug/Xnpi8KlkOfvISwaRo3W87Z1WuzR7ezJEseSnQHqV22qD6LCTYfs1WKVgVMdCjn1SQDzaDiYRO5cYxDHdCZjtef0WfWib1G7wsicsR64xuTQj3aFqPzrD2kcF3V6b4ODCsiqdm+d8wf5kAM8m1xG3N42LMKvZG3UQZjbIwHO92UFumeTdBD983bkjy6oOL9byDG/l+jv0Otdf5GR5wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUu4W7DjQ1KHfIEMrrBDO7HzfHKvMVCjDMiLo51f6Jc=;
 b=fb5bFJVEvCd9PTVPPpLCcOfLjVjnVW+2WZALJbZsS1t4UDuq4gwd6BAgiVfyoD6UjrVoEpDIdpLDsug1eCDGo8mVGlWz7uqzvqD/xqxIWJmYFxgeAurvJ9PnHouGWM4t5PvRP7ZOsAfh0J9jgsMggEfLQn+rCz/BCdzhM26vH+f3jbh3q++gSk0ijOGorfFRtJkfWzX65zw2SyfhHNmms9U4GmriPOVdzvygBBLmCL7lnt8n5bllTgnbL42mbvtheOgt4TiqP7fFePPkLHKXC+Amu9nZ8TmoFszXOqHwGnxayhqcnXrCmg1t7S7zhVvifQ1erohcRNQuE82LQr+AyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by IA1PR11MB7725.namprd11.prod.outlook.com (2603:10b6:208:3fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 05:52:30 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6%4]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 05:52:30 +0000
From: guocai.he.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-oe][kirkstone][PATCH] postgresql: upgrade 14.20 -> 14.21
Date: Fri, 20 Mar 2026 13:52:12 +0800
Message-Id: <20260320055212.1821470-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|IA1PR11MB7725:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b06f13e-7043-431d-0a09-08de8644dfc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|56012099003|18002099003|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	+V0LETV0g9aoyvr2xP88HvYl14+pMi4oUqvNIu8vV/JR6PJggHhgHMrb4Woq/Hq3T1yVxIFUK3pZK8XOY6DWpGPJ1DoZ5zvIEve/lso67gppRTSofzy4p+47qUUOV9q3etqvFZ5AeFJjyEge9eMZcAh3f3PBLfLBV/fQkQkPf+8zzZkwgt/QlKQuVXfnNzHX22KB4cgByY1TdSqFqDnOrSkFFcTyM0yoxOiJNx9pWgNS4tqSIS5qg+eRMqEt4JJc7HbcndV+91eb8JG8OvhjE+51noMqPwpUXJp0TH/G3nBGvtMT3H2XdWUC8GzfSk0EsHOh5WnHz6zCkRDuPnrFyrmYZqK014LhGz6Urpjz5ziyrRS96dWVrBj16T/L5Neq1lalnylBzvRbX+z5fOjFetIGaXwXFEYJ4IAhKtlgl5MmORQxht/LjEKx+Jmjsu3zkzyOl1oTCWNEjeQBvgBrucNHDWqdzon0l/CQbw0rtO9HqBbexdL840s5Yw/MOtoXlMA0M54hqcXGqJUcmTfNJesVPl1HdtdFxXMjKVXlW4sSI4QZaHO+TisZY9YEymTv0Po5Nr0226tVqWjVXs0W7l4uLrETdNEnmfzA2NN464GDLgecywA575jY4SVugOJb92hb6DlxojF6GdRGSqjP8rqNtyodBxHE9aVXVLpHBR+aIplc4TH2Mbl+lUDD57vs0R2pjtzNh+j0Jxv4+LsVNSqq1CbCJNQVIx3jOT5TvpnYBMnohH1wZZgE0j+O7mcP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(56012099003)(18002099003)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hkSUGAWjCwIvqAjrLucDlav3+ztfsl1R3WjSqUJawZhH5vNZAVshXNI47+CJ?=
 =?us-ascii?Q?4f89YXjBtfECEtDFlKzfw2MSfWGjn2U5yFrKXm+5P53bVY0M3aFXVfosicNh?=
 =?us-ascii?Q?F19lH7/6o9sIkFFDTkzdvmg2chQknr+lujcsiPihsPFYiRPClXPz7UGGGkmO?=
 =?us-ascii?Q?r++28k/HBMA47q3AauY9LFiHmrKvbadl7KuVYR4oLuXUNWFpnT28p1tJrFnH?=
 =?us-ascii?Q?gmcWtH5fodEK8F/fjdzgcHxQl0yahDHOhmEvCftTMba3F7TxV16EXXSWgVbh?=
 =?us-ascii?Q?XmXQshGvT1kHCKsOZsj8nml8k8kr4BGK1qLrUAMLsaCB+u7MtN4q+PZSQSFm?=
 =?us-ascii?Q?J7aqGDvyGYG9JiLZxqcXFAP8OtUdUVvuxPc2jtKyBgFYHAnktbWFLkttRIKr?=
 =?us-ascii?Q?qgC5oxe0r6u6j4R1FJwQ1NLjU0lMTw2MDdJOg4VLSv+VlXaYaSZ1HDqPjSkb?=
 =?us-ascii?Q?/TwQWCw0de/Enp13PZWMMMI2cDGlDp1hbqIZ6y8Kf4FgIif8du1VbJZ24C08?=
 =?us-ascii?Q?veE2riGAA3ZnJ/uM1d3IbZVEA0IwE9HAjWgQaUUEuscuanKlwYINKN6791tZ?=
 =?us-ascii?Q?gs2wPegkczFlZsxgqCbX/Z9TbIHjYgZg89nM8ArPiI0IOda/m/PWxyE6uOem?=
 =?us-ascii?Q?BWDjNhiPZKwtVZx0UWG33YjD04q6Z4vMuHcMtD46wifa4dTuVcja7grxfn23?=
 =?us-ascii?Q?rGQ3qt41BT61MGBJ/fs9GbhjMGQgK5nKbjSdKN5BRjQBG/i2Qaje9SzPO0Ph?=
 =?us-ascii?Q?dS1EbSmihyY4xOQ+PAcXeuu0rxGxwrcqrMl7TyYpnyJHq6wgujEuRzWWtbHw?=
 =?us-ascii?Q?GZAXayVicjD6EJGWvQ03y60jGRKVKNXqG1+Qv36pfU3gqUCim0Pb+ofPt+75?=
 =?us-ascii?Q?BYjwSJim+Z4R2Bt6yshUus1bfEm+R+Nt6Ds7rxRTwK+KtrfZP+Lc4RKshmOn?=
 =?us-ascii?Q?cd+rY33KiUMMJjffTibyWGdAdi8G//n3qgFVw2nSGQaB3bAUYFsdYBFXFKkw?=
 =?us-ascii?Q?jp/tWKjY7bREBYTmFL+/uhFIX56R1VrdAdpm0uidJAFs2JAk/W2zZ6pNkmMx?=
 =?us-ascii?Q?a1qa7fDXPkt8qcbR4jewvSa1k8a5CnUwIqKZLGfkHz/VtQSKN8BHS3GuuNwj?=
 =?us-ascii?Q?y9HJtiFqTXW0yQM2knT4ggkI51Rv3gDg7nxLCvvqLEv1ysHQnb5WSPePLEvH?=
 =?us-ascii?Q?XWNq+u1ogFSIrl92bF8MFPJLov8twknC+ybT1oh3rXazZxspHwO6FBEU7JOw?=
 =?us-ascii?Q?m1keX76Ji3dpOpCnR1mTBoU5N3AkCIZd+G/vgEKshavI/g5jtIsjIPqecm+5?=
 =?us-ascii?Q?ZbxsXRc9P1feZHEnlyV2MAQ088tqqdPVKFTty+3qnJEPLiGscmeBDxQvYJOv?=
 =?us-ascii?Q?23oDcvV3tN5JXnj1BwHRvFCf37FGk7cLWDfX2BvF1H1qxKv0xJO0avqvvpgx?=
 =?us-ascii?Q?QfUd39Gva2UhByXnnpGuAr4Zns+AP1ixuwdIy5ZrOMMQ48hUU8Rbf77ki4RF?=
 =?us-ascii?Q?LVqGd7LqonUx7EF0g9tuMbRYbJce7IQjxy8cIf+6xSGDM8RCvJYfiF2zn+oD?=
 =?us-ascii?Q?KvIxT8rDOkVUoPwbuw+Ql5VPog16nyknLUmXZ56IDpBcixdNmDjXXq4IbpqA?=
 =?us-ascii?Q?+aMOZwOkHy87HQAdt7f4IUc7/IySj/WSFjW9qp6231ANB87qiLEI6TGN6LHg?=
 =?us-ascii?Q?gQLP+zzWRfHsOLv3bWqzxi/0K96CArTMI5y3R66XX8xDWqj3RAGSm+V5Skwd?=
 =?us-ascii?Q?d7HAVrRTVsyINYfTObKyx7tglujsi7s=3D?=
X-Exchange-RoutingPolicyChecked: 
	Nbloa6qvSQsL+22+8tRtcd7sOVtcfuJoqY/kjrg56FixmNBezqD77GEIpqbqHo917xVKaiQQW0UhQizpkKNc8BwIYVqiHj4Bu2YdPD1K99f6r5/L1ZQ+8CMOPx5rQ0iXVueLc70GEBq7gzX6z8wFPuRV9/MsZTxgB4QjnQ86JyvSBWZ8rqh7nzhVt9cnWMuGwy6I1l/b10yqTiWkSmB1gncSizS1IL0j95nO/YNzMzsDB7dVFjnbfM31uaacIP3UPRdv6WI3UkFTS+AXn5XobaTnNTyXpCbPVhEdQ/22jNz/JeFF+YDcPXNfMAOmT+0EximEPxJNIDVNnqlLNUtGjA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b06f13e-7043-431d-0a09-08de8644dfc1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 05:52:30.6459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: icpeAi19Ph+Kh51XEcqVNTO3Enfl5AtVx9to+yCnq+oTckEv7JdYGbKQRBDKM4WdYQtU+9FpqVR2LUBULp8LlhwLD6OruPDTOHuEOwM6tZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7725
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69bce0a1 cx=c_pps
 a=fVVZRgaqDuj868rfKEvgUg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=epTmVMiNAAAA:8
 a=t7CeM3EgAAAA:8 a=VdJxyN7lVYxgHUX6UD8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA0MSBTYWx0ZWRfX186dnGW0df66
 N9iFXuwTTphu+UZX7zWHDebz4TWKOt9rId9hWg9tZWlY3vMXjRCAWsDPgTl6uw9mRM0xR/ZOXq6
 nPfQwtvdEnGMZnFA+KjvBuVPvYGUJ8PDPYtw/Cwa7uoecDix0NQa1MTfOe/+LU1s1oDlSWUthVA
 CEUdcfZh5rvIGp1JUhsDBqZvpg0L5wnw2I3oaYXDBri0rD/zOcSC8E6Cefr7XfHtfORtHg3P2gx
 Cye3aw+wJeWV1jkpV8AtpB0kCy5JXljQx7PCHC5Huu0isLcmRJrqUdJwQBzJ3UJA/JtdJ60Qz4g
 kC2LM/Bd/B9W4Zw0ny11MsG/1ad89ST/veBY7ISOtE4AaMj7MwvoxybAZWTefZk8TpLSaFARW/K
 wx5eqg6+b84xMP9jXnh33qD0ioHWRTgCypePXBT/6+XPZTdLwxheciTNENWhbDkZdo/dhe0/SM4
 hasLdaZ+Hpd9/63dZ3g==
X-Proofpoint-ORIG-GUID: mFMoTiNYdT_YlotYKkul53_PlI_ruhTM
X-Proofpoint-GUID: mFMoTiNYdT_YlotYKkul53_PlI_ruhTM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200041
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 05:52:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125419

From: Guocai He <guocai.he.cn@windriver.com>

Beside other bugfixes, it contains fixes for CVE-2026-2003, CVE-2026-2004,
CVE-2026-2005 and CVE-2026-2006.

License-Update: Update copyright year to 2026

Release notes: https://www.postgresql.org/docs/release/14.21/

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 ...0001-configure.ac-bypass-autoconf-2.69-version-check.patch | 2 +-
 .../postgresql/{postgresql_14.20.bb => postgresql_14.21.bb}   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.20.bb => postgresql_14.21.bb} (71%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index 76363cd26d..9da1ace8a8 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -18,7 +18,7 @@ index bbbb204..0919d2b 100644
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [14.20], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [14.21], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.20.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.21.bb
similarity index 71%
rename from meta-oe/recipes-dbs/postgresql/postgresql_14.20.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_14.21.bb
index 04d8723f15..ba7a7bb03b 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.20.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.21.bb
@@ -1,6 +1,6 @@
 require postgresql.inc
 
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=08b6032a749e67f6e3de84ea8e466933"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=55760ee57ce4e51e4b57f0801ff032dd"
 
 SRC_URI += "\
    file://not-check-libperl.patch \
@@ -11,7 +11,7 @@ SRC_URI += "\
    file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "7527f10f1640761bc280ad97d105d286d0cf72e54d36d78cf68e5e5f752b646b"
+SRC_URI[sha256sum] = "5b30f19347efff32b6e09ed2cdff0b04e9aee913ec9bb7414de2b7c17b17f1f9"
 
 CVE_CHECK_IGNORE += "\
    CVE-2017-8806 \
-- 
2.34.1


