Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE789C021A4
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 16:19:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.93588.1740413960158997059
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Feb 2025 08:19:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41502d4960=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O6j4qB011965
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Feb 2025 16:19:19 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44y5j8ag0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Feb 2025 16:19:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NnaHBi3VCumszKgDWL677/m1eE7sQDrcglaZ2TPNXTrOf2aNnBGl0razCs8gUFxfrF8AEkMRWqhtXm5O//0UVjvuE+PIGkXjgUkjSPXXkeLGS80pHsMevPKog4QZBhREhQp3jwm6/W05Ha7ZGV0yrVUYn9BQelX4Oq8VzeBB3XLqEPDBJOZZoa3US8FXFhs8QQa1kzJMIn8O1b5CtbDt54diraA/3aNunVQk/TUxV2rMsLeM+5AEG0pqKpiXiRrw4gq9jfBkfgrWczl1oZGtsX1Pd3NBDpP6HoZHOC256ELmcw6TQPGA1uzYGdALajyLNwlCetLDVrqFyl25dzhJWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQdRZ03xwMU+7klD/nXG44MK/lmgbX1SFeII0Ij8AVU=;
 b=o1VAA5F31MyCkwvap7cS4gzT9xK8m+TVXk2qSXzSWVbgLrNXCyGYl4dbINJVRD5P/Vme7Y4xWF9ZU7AqId84QVTAWA0MZGgmvTOAzc3kwZRojdDUO0Cu02gbmEg5lrQpp8RsBy+RhaH8QJqz4t+xWoLhqWhOQesfLxTAgjphtI5VGxDV2YlTRTbneOnpkMKEpTYbOz/6ChHw3LhsHQlh7QpzMX9NfOvSD4eYsze59grAj5SIjt5iTiywB3YKU9rqfuZo7v6X+ow3flqd3b9IxAEcO/ZZyvOBhWrfXEl1gsJotPdKL530l2a/L0o9kI9+/PT8M200pq8R3jhWiV/QBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH8PR11MB7989.namprd11.prod.outlook.com (2603:10b6:510:258::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 16:18:53 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 16:18:53 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] audit: remove empty directory
Date: Tue, 25 Feb 2025 00:18:39 +0800
Message-Id: <20250224161839.3901793-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0175.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH8PR11MB7989:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a5dcfe6-a500-464b-7e65-08dd54eeedee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fx3tVDyhymGx8ogdu7R/FBOdFjnyNcnhWVArI0G4IwE8Ndvm/+JvD+6x1GMM?=
 =?us-ascii?Q?cjCQYkqgWeH7moBkdNDRQDc3lBu/v5rofEVU0032fDNkQGl8zZ028Isdatcn?=
 =?us-ascii?Q?pFWMrmH+6Qpc9Rq3XU3pOUUZEIuvUvifXm3j3b8glkbkDJYHaE9IGnaHB6Rm?=
 =?us-ascii?Q?tHL97RTdtNML7qqxFieqj7QE2QrhIjznNgOOgG5Mm1Hj5tKrGoyk0TKFNGmj?=
 =?us-ascii?Q?GmxXx9j4RVtDvKkkwAyvRzLyYEEk6l81chgTd/Ejrjg90KzgTN4v1xT3hPha?=
 =?us-ascii?Q?VXifRUH5q/ulpymjTDIjbI5eTn3qWIQHArF9LnWBB94eeyCfrnlXruTYTRc7?=
 =?us-ascii?Q?QkT4oQLLEaM7kSoReqP2L2i4tLkLlow9oljVVWdeRL/68x7C33X1L4y5pigm?=
 =?us-ascii?Q?w2a5GKd1ct32Qm5ia/KPPdm8Qi7+k8Tee6ve9oEChMioS2Ynlt8JTNZd56ua?=
 =?us-ascii?Q?ZyjuOuoL1F5HoYbWVNXA7lTwzmbBW7+Yt8ukPjNR48r5mNLU5w7K/UzB/+9i?=
 =?us-ascii?Q?dGzbH8gYENKaOp1ZhFmIsO2/ZqVuCeFZK/AysSTYIRAWtCMyj+UIPuKP+7+k?=
 =?us-ascii?Q?KPbFeFMsQ5aPGIxTFrygYqtTWJkgKBjZjOjVDMOwWwFJIDQLJHBBq+Xu2jVr?=
 =?us-ascii?Q?skgJEuqA1eNXvT59BPR3wwgvcCwJLAXjxQ6hfIlE6XyKjGVVF4Vc6I2UxkC1?=
 =?us-ascii?Q?kopTefqt+hWuX2EMTFT3bcCV1mLsi65cbB8bZnxBY1GeknNzLYKnqd3UI/gy?=
 =?us-ascii?Q?rwnInvAxl2hsb2QGyKAYFRQNDQwOYab39/y5N2kFBOtUPcWDlOsfxlTAMNtD?=
 =?us-ascii?Q?7kmRM+P2BWlN6HH/DSP5qdnlvnTPxxL2xXEDSTGP1qpdBrxIDg1w51Jyapkg?=
 =?us-ascii?Q?cHrgpRi5ZArlWqMBnpANIiodfn9op9zHZrYvfTESXGkU8UZf8RT6amnPI7Kg?=
 =?us-ascii?Q?ynm2wc1p31mDN1zNYhZnGh/cN+yr9nBIMgDXE5dquoRRMtyitNrk+dYCYjNV?=
 =?us-ascii?Q?EUj88eivlh2G3RuzT4PyiidCrPyYffJ0/gFjPGr6ly84aBP9TZEo5SEhjnPS?=
 =?us-ascii?Q?5rqIY+Tvn/csD9EJFfhGNvz9D+SCNrtws8yFD9wSmk+cSQRLumLsXsaReVFj?=
 =?us-ascii?Q?QfzSNhgX37PHBL2+RfXFJAdl780t03wKLilMLlZY+srZpLFgU8dddqc4dkKP?=
 =?us-ascii?Q?tfAABzkleQVg0fguewmy5P3DkoJNIMuwnxkdt7PdZWzFK1+htFr7Vlw6g+wS?=
 =?us-ascii?Q?zAih39E8318r/hdVsXPPlRcMZf3eTJ/nW7G2T7HFAMO5TDclct/izdVAczGl?=
 =?us-ascii?Q?RZj7/8IUJyfpIjP9iMqkD+Vymig7qb7EP0wznb3CZfYHkxXhQEmpJmG2Bdyj?=
 =?us-ascii?Q?JYkZea51NyxWrEDAPtTpAbKnpBieXynT5wij9TyMWTPIM9dRgXUdr6pHbosh?=
 =?us-ascii?Q?GblMgPmU/KwUIOnt/Tl4osvVME9X0bih?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?snnQP2anoQoVPawQcxHmTKq06Fvt+s1KSgkQVWNbJ1QfY8gRyBf55vChDgS/?=
 =?us-ascii?Q?CWRrNKElpVZuvMQDk3DeiHjqcBINRoiUZzPjr98KTaKfEUKcpeviH9RkvIEj?=
 =?us-ascii?Q?Jb0q1Qz9asBIpWtYa3Sj/JH7BcaoaJuj0UEPbWpAo+uu2owk8lPpRanlnZ97?=
 =?us-ascii?Q?ZHLJbTagNNgp5McIVOfgInyWika84ng5ALwahdcCGQl36NYDuVUREDPbHerd?=
 =?us-ascii?Q?pmUaXZRQqzf86g9qH/UyEboMw9xDU7WBXDURBbxDa/BxiQzR/vva5fJKVL8Q?=
 =?us-ascii?Q?GYNu5adgjvN74VFaa2Pw4ipOmZwMlmzNkCEPp+jku4QQuI8uq/lCJkIT0Xic?=
 =?us-ascii?Q?W9suHR36qLJD94THaosfAUxDlePlf0uE6lkAwp4hgPAARvaCx03NeEKQnLOY?=
 =?us-ascii?Q?Fbsme6VKDyLr1HHOvpSO2pMjg4MJyxs6wbWP8M4UOeebzuWlWM06Hwj0Fxp2?=
 =?us-ascii?Q?LH+GvcZ45RnSBL1nS91Ws6XHqf3/OysZaTiCPnKFcnkvXDaEwFErFUuR61sj?=
 =?us-ascii?Q?W+Ay4jdvVSTITXEke8JwxV5S9uU9yQdXb7UxGz1uIWFXU2YROBNDuLDbM4ZY?=
 =?us-ascii?Q?9+xtFXDpmVsifDSlk0b+YMN2g5nHvWfmtLzHcvJHCHnb+jfobSdLE7X2brmK?=
 =?us-ascii?Q?1s29yADvWOA/Cbdu4aBig0ABVArENhNmiUAmGqKmMfA/XEaY6ur2zpwLPN4C?=
 =?us-ascii?Q?tpgvVRjbg5VzBrWtcpndPRD6lc/Ptyf0GlUX4FN/HYs9o+P3tpUFr4BVNyMt?=
 =?us-ascii?Q?Y5c6O41ukzOMzvmSgFv/cP1jtgvd5m3yhopzOGi0dcDoDGLjAadCgb+/Sh/I?=
 =?us-ascii?Q?l8Dpk6v1C4TIw/pb1Fh3v5CYk6MIrFz3fMtVCA+bLS3dLIy/X+wurz/eTpzy?=
 =?us-ascii?Q?kLccwywcgZXxb6vu6srf2oEzJIgu0GDFgzSx3hcq6pCrB9DVVrte5vH782f/?=
 =?us-ascii?Q?ERlkFwRFmI2r1RNosdD5ucOcK1wxdWZdksm1ttvEZAyAwW5uEZf5w+8+2s6O?=
 =?us-ascii?Q?v+sZ8+GyQVCKwmyST27E25BbtIgKm2yZdNIYhTPZ4aKxt+PgIQ4803fw+LsQ?=
 =?us-ascii?Q?jlE3aY3JdQ1GdCVy4hEJP3pb0jGV96HH9H2IpIGRIcN9q8IpTtzh7JgMiMHA?=
 =?us-ascii?Q?9Q9A0puFv5PvrCvXTqBwWGeNRl++qiqmS0Rq5EhV0ITnQLqNZZTqsHM7y5Pt?=
 =?us-ascii?Q?xP3Up6YCwpAMjLd69hlnyNcwHzxlB3UDJgfbBe559QeaUgTeIqgvGiZ4HVs/?=
 =?us-ascii?Q?zJMktaKaUnjJe2FyXHThV0igMo6V8sIAPcLanIbw7+TvOjbUt3WfN+Zxz8xv?=
 =?us-ascii?Q?fgp0q1QBZU97T0cLo13jCf2YCzcfUFxYKzh3o9jrotmOXyOv8n+u3sJe3C1B?=
 =?us-ascii?Q?E0Hyt/Id+06GKfst+fjxaNuNG99eceG3CO/+wsYWbm3ZLwVKx+VClFeB7l0F?=
 =?us-ascii?Q?33qj1x5uuX77aExingoVArp7D3vEOjk6Mg8gcXU8+Qeqnicj+CaYLDZjx8kD?=
 =?us-ascii?Q?LVu+ZtxjVhbIlYsdirScNRwRuAMm6helissk9feA5o08Oc0WUHJ4Lf6idhTT?=
 =?us-ascii?Q?hYvapzVD8XaklGWtMeD/IZ63Xd053eWUME3dUdgi?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a5dcfe6-a500-464b-7e65-08dd54eeedee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 16:18:53.0222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qxy8BMRCxgEnYA4bqvpOl56/fy1ThLfSrALEMWOO7YCibVaxi93hL3UDSuhPbllEy8bTVSa03A57u5Sme053nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7989
X-Proofpoint-ORIG-GUID: GA0hu-Va2QuXfcbKlZM0RF8jT0aQ6DE8
X-Proofpoint-GUID: GA0hu-Va2QuXfcbKlZM0RF8jT0aQ6DE8
X-Authority-Analysis: v=2.4 cv=U+ZoDfru c=1 sm=1 tr=0 ts=67bc9c07 cx=c_pps a=LxkDbUgDkQmSfly3BTNqMw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=t7CeM3EgAAAA:8 a=934OOMuiypAVvcD_YvkA:9
 a=ZXulRonScM0A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_08,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 impostorscore=0 mlxlogscore=995 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502240113
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Feb 2025 16:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115552

Remove empty directory when enable multilib.

Fixes:
ERROR: audit-4.0.3-r0 do_package: QA Issue: audit: Files/directories
were installed but not shipped in any package:
 /usr/lib

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-security/audit/audit_4.0.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-security/audit/audit_4.0.3.bb b/meta-oe/recipes-security/audit/audit_4.0.3.bb
index 9501787e09..356ee6a84d 100644
--- a/meta-oe/recipes-security/audit/audit_4.0.3.bb
+++ b/meta-oe/recipes-security/audit/audit_4.0.3.bb
@@ -96,6 +96,9 @@ do_install:append() {
     if ! ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         rm -rf ${D}${nonarch_libdir}/systemd
         rm -rf ${D}${nonarch_libdir}/tmpfiles.d
+
+        # Remove empty directory when enable multilib
+        rmdir --ignore-fail-on-non-empty ${D}${nonarch_libdir}
     fi
 
     # Create /var/spool/audit directory for audisp-remote
-- 
2.25.1


