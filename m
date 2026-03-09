Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D9DEF36FE
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 07:59:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9159.1773043183573432959
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 00:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LSz/IwPf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75289530f7=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6293oNCw1920084
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Mar 2026 00:59:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=3Kdp8m1ZAEavla61wpXj
	T9GTsjAUO0NsxaUTq1i6YG4=; b=LSz/IwPfMSvovDJqkS7uzMC2NG9XBxaTCsR7
	kj3nY2Om4NVgmRUUvNmDHixUn8xZMWQfpBvMBjmF0DGAgcHf+s1qNrUtm+rel2X3
	PJHuwGeKhTtMx8r3LPLfiLMcO+Flqk68Ym46dNBqyjgH5osJEm2J8pl3BZXaKfBx
	4wmsw2zTBGWXTX+1u7Eu9Ves2pThcW9YjwJddtEQoxrySgPf/aZA24B2pG7fndR8
	C/i4zT0zFZ7R/qcMCEWWVzZiWVxISwRHmqq4ULkRxNPMcAKoaHBMFtv/N24tFL8/
	rZR89cPPIlJB1NhB2hNf6G4mT+vVq12B/CRrpSO4bKtJLf/VIQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013025.outbound.protection.outlook.com [40.107.201.25])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crg62hcky-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 00:59:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENVjPu7xDGJB7hlMbaAFamc9lJ3Znj/Xqbvmb/Qlr/8PCARRG02VLCK8yUY76GziJaN5ia0C9rkeUruMQXf4lTkCnAJuI5Gb8CqZPcPgWPKEDdPU20Nm4VQZnIsRNkYBQqF6QAyxvZVcx+N8MiFU9lmrf3UVD5xqpfKqwP/UxjeMM1LvdPRaz8OqFWNQlE+q9vL6w4Xjfzp3/HvldxuCJDTDK8WwZ65Et7eglwzAEXtVwNf0FNngMjrtyecaMNKQeRCSqsZ1hiIym78u5WrwCb1lDQXBeF2JOox3yaaL7Q9c6QU2+T0DANifvSPqOWOjGX4QyKj+MolpdIiaEYEZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Kdp8m1ZAEavla61wpXjT9GTsjAUO0NsxaUTq1i6YG4=;
 b=NF+fn/vK1skrOqsT+30U7wWemCsuZ8otXxqEheuu6eqeGFuZmWOqqFhMshu/f9YdtwpOJ55QPgFKfN3d4QuuxTB0dgYTe4JpiLM6wZ2Atfoz9MpnZv7+xYHH5UVzmvo1+aSTqsPIUZhwmuvw+OQ2o9QaVlzx+aI6ehuHLlKTICgkeGRdpW0DLr/4Io/bBmqAPyDAM77WrngfT+EWvPZFL4O8rHvESFbupUOUds7+m7+mkTkSTjIXM9G38Aa8UXfaQual0KvheT/PbL7shiAOmPY9bFNZDoV0DPEyL4hbLaGGhFs83agOxmHA/GYtw5sVj+FdwfVoHAis8v+KnRbpug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS0PR11MB7630.namprd11.prod.outlook.com (2603:10b6:8:149::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 07:59:41 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 07:59:41 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][master][PATCH] gvfs: upgrade 1.58.1 -> 1.58.2
Date: Mon,  9 Mar 2026 15:59:28 +0800
Message-ID: <20260309075928.3166172-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:3:18::27) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS0PR11MB7630:EE_
X-MS-Office365-Filtering-Correlation-Id: ba55354b-92f0-4752-0914-08de7db1d150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	M93dh/sm+/rs9h4eb7zG02cV8qscvy6FKAe3PPq3o9EJgRx0b3BoYF7tGRUgyD8DlcRDBlA9TWtjXIC6/P2c0GV3yC/UcWp4mqJ/vQdNy2y43Osy34+OOVfZnsS30+8C7QqlWldZdvIZH3shveh/EhukjIqDPJBnbU/Bm7/yNf/UWeZ3fXJHHIdguBtuZ6zyFJMGhIM3tzrJuFyDUd1FeVNE0oZF8rNzmD4d+PP49/5D0J4140PprfNPqmYYzxotR6ljfpZVLZY6RG62ZHdo2bivgEcQ/EZkrOR+F6BP2QHBFcIy6UjiGbAYzwdyxDhGq0oBvPfwIWYMP0SfKSgPJsDvePWy28+yOKxH/gvkHVpfdsS1LQh1ZpBh+leo6cXtnHGLB/4m2j2Zv3EtitbyDElpjAuq3D4dKUjIQthV4iLAmsExoVLiu+tDdoOaa1DevIonWqZUt7PCGxmV2yFsL8++YG+fCcCO97xpJw87UUMSgg/WHUnJJCrO0isrx8rAVXLqMGNJhrtbDJCuxmP6YtERNax3Jr6+ohLnfv30K8SUpDgKqYjT7/b3ET6OpfIhiycF57ltqKEtiylLQkwrv3Acl/GFEVjR2VVYRfzHRYAjbxPe1rH/rMQgQxQ/MHWp5RldqbAN1mCReN8dL9imIatLGEtjJf8ncydAh0iacTzUGJCVuv9JLfTKPaafRRrLpz37kuDWQQBqpX+X8ub9JXGAENzGun4mA/ju/BpsWHk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SWANk2XPwRx1C42nuY+IaZHDig6Sje2NoQTkSCpoQR9VSNpW4iKPBTZzKU/M?=
 =?us-ascii?Q?tRL9F1nrPG1JCWwdjWawz0RVdWiDmEuWvQYwJeEDnf7PVgATXYFbx6xMudN0?=
 =?us-ascii?Q?Dp7omi3fB2+rEh4x+gnni9pA2E0g0+yJKA+/UyAj3Ra0FG7n4YohAoS5s45g?=
 =?us-ascii?Q?LrnYnXKQ+rErU7HFhd1lWhjOysZ3BuqpHxYWIyRmgmnxZ4AX65lMwIFB9C+U?=
 =?us-ascii?Q?i/2/eQlMVie72azfoxWEVbq8OTIjz9R5D3kgSnACGxfcaKlaKcq77sjcLslB?=
 =?us-ascii?Q?kpHjzl54HVYLX6XnSHF4E7HIkAVID0rrSYM/+sDf7XgUQ3obhS7R0jsbcsnf?=
 =?us-ascii?Q?DwxwdLOdzvgZr6DeIL48gFKNtXoknbCIqYQZmYb9HAEi9LUVDwCJxVqn6FNL?=
 =?us-ascii?Q?tCMmZIOeD7auLQwrTDvQtbDK3v+sIcQBtcOVdNCky5ly9/W5mnDEO9Xt1SRH?=
 =?us-ascii?Q?gkSxvqmE9LSFtcl2gJ2rQEFFOPBgnBTJ9Hwzq7PwZ+sk++TQ6GlHwpN4dvy5?=
 =?us-ascii?Q?vIQjmiX2Dd8mlYiiZX899M3z7a1Dm9Um5VZR3nBodzhKL9HGXcfSRpvfMh5L?=
 =?us-ascii?Q?oxjO3/3tEvGMciQjOOJ2i/xDNbe1rk+gC8k4syjGNt1xAYlk58skVaBgHPW0?=
 =?us-ascii?Q?YZB7YH3xq3ZQlN8rtra6/xOsG7DCT3g9wVv9lIHQD3pjjDOLAHM72l2uGkyY?=
 =?us-ascii?Q?wv7KLYtZ9TDZ8nHQxU+EqY6TramoK0VRumuMfvgLAoYmrVsvHYesudOCgEDC?=
 =?us-ascii?Q?v77h8X3pV6qft3ytBDRVSF5RxSsaAZe/s1zFCrBU1scydbu8uTI6sdy6bDtW?=
 =?us-ascii?Q?Bq2BcoVEbiArY8txkytUKWmzpjO425FC3vFzeldUNCl+glkL9irJfkwBjbc4?=
 =?us-ascii?Q?xd0TAuG/TWlWEIETS86LsdhE6xBddOLloz3szZjLb5WHOrI3E6EUZ66/QUbJ?=
 =?us-ascii?Q?JfgSZh8w7R54tqPGaFjflLgXvDVMM5IF3jH4rIH7yLUXjhwK1Pi+UtOpGz6X?=
 =?us-ascii?Q?Elqlpjiow8ZoQ18vKDawbfZTRHWVDupKBQ+v9O87akSCaeCvMZDGd8QmqCxM?=
 =?us-ascii?Q?/Sxxn2RgEeb73u7D5FaftZWyI65MNbq1O47lAf5YhRWrrcHzovF4/1X1vv9W?=
 =?us-ascii?Q?YKb1QvMsb10OFh4dhmSUa7JqfiMOfV+mrszynEzUeeFTROoBXFPo55XV1dd6?=
 =?us-ascii?Q?gyjgPT5V36bvJcBDHXVbuWaXrPQN+N/t+ZEUkPspnWDpTEc8Mt7WTdauBTFu?=
 =?us-ascii?Q?YXtQMSfQz+9fQ+BsuiiCdGwJY0jmGQQKP8NMfLIk2IZ0ErtlOy+FUlxDIBsQ?=
 =?us-ascii?Q?i1CtvD0NXk+IZNX2Q+kcY6w/XcVA8s5vGv3h5RUIbrsAtcp76jy6z8Sas0hU?=
 =?us-ascii?Q?myOeQPg2IXXt4Kgv7tTVeG/7P96Xrj42mNYgBFKtqUcEAlvZaGgWnl3greq+?=
 =?us-ascii?Q?a6XeqqVMD11lhi1tbh6lnwORjRKbK7OzzW2gxvYwPesK3RctvxU1GcY16u5Y?=
 =?us-ascii?Q?w8STwCYB64PGq8nxkaHhA8nR1DabMFkOIsSL4O8LQEgTn0K/K8akgqn4DmJv?=
 =?us-ascii?Q?D+eAetne/Y5udP1gszc6C+1BI9R0JTtsW/rUg6RSCn8rLCgc6AUbMEjpddZo?=
 =?us-ascii?Q?Goig31cX5NTM1WUA8l0VlxawUBmtL+rNV8MAdaveK+FqwGGetEBsf7Z8rfBY?=
 =?us-ascii?Q?VN0wxKHraRFDtmcWQMzBYhXzSWsKrKnwouqYxn5VmUDSxWBkZwhTr3ADQo2e?=
 =?us-ascii?Q?teFIvBH5/NHHbBFufJfoCDhG4kv1b2s=3D?=
X-Exchange-RoutingPolicyChecked: 
	Yxw7elVYz7VdCoCPmFdLV3EKy+SEQ8dHntyMzRzObZ6Gb1yzwwSLvRnM4370mSpcQMjNdQkNeFjtNBswgVdaQQcVQcs79GIUuNzkRIMrPh4RMYw7SL9CryrHOj3EWismDhd3G0+9IqIPAJzzuZV1QxkDOcX2ocdwOu8tZSGRZmbJsTLw+ElAmc7LJrf28UCIvR4wnfuNpoJiIpG0hDmUmNvRdLXqoQQAIwCh8yuTF36LbmjqcUW2G9UMepr9vydERtM9dH6tZVM5Cxe3uQTniyv13ZkklusyVjGVeOLTojzXGC+lq5ccU3/umYOPdW2XI4h12fygr3uR6sfJc9FFsg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba55354b-92f0-4752-0914-08de7db1d150
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 07:59:40.9398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wfVAieADCKDGhht2M+KqiUu93OsPKAR0aJtVDwGhgECQ5tJQ/WGEH4qOE+A7zpy75QovjIhgDtOFlmJ92GHcS1a1aeje+sA+7rckS6A0UE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7630
X-Authority-Analysis: v=2.4 cv=f4FFxeyM c=1 sm=1 tr=0 ts=69ae7dee cx=c_pps
 a=aGwn47qLKbf7B3DwPvQeXg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Z5getJ8MAAAA:20
 a=t7CeM3EgAAAA:8 a=GBRnRPhfadhqpMn68MMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA3MyBTYWx0ZWRfX4mBQ1RKpoveS
 5DtpdD4aEP4p4hVuRH8pB91JkcWLzRWdnc899KbuHJg91JX3R5ujvPNH2wYOJG+jPeGBkJ4aixz
 oELqdNykbi837EOk5y4pTAkX4ShEwWbiu9XRjCaiP0io0k2CLAdgR1FgnRfBg0R9nv5vmThbPq0
 bxpoiAlBeGKD9nrrooAclH1e8xOBRLS9zFv5qDfvT6Fdfxcjq1ssqSC8tqL4kMQjCiBOnWV0WVz
 Zv+gfDBApkw9yBZBqdrd3YaEUBqAT8S6L+ZjxrqpRO7qwvddGOSVf2t2658JUcDIMJga2sOTVzO
 KgOwVF6Kqqy4Sy405kORziRHv0ikh0vullGFU3b8f4pMzYAYCNB9w6QxPIISH9VLEHyYJoHs8RV
 X4eDiMWbszVspvE+fb5WSXXIk72zRF3Phe6WrJv4JiCvDdZEixV98fzdIOjMaGVOGUr7B6onFJL
 HA7ci9NTAKs0pKMPOZA==
X-Proofpoint-ORIG-GUID: ObSSuPdxaMvZ3pMCHL2Z4g6RE0PjrHjQ
X-Proofpoint-GUID: ObSSuPdxaMvZ3pMCHL2Z4g6RE0PjrHjQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 07:59:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124956

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Major changes in 1.58.2
=======================
* client: Fix use-after-free when creating async proxy failed (Ondrej Holy)
* daemon: Fix race on subscribers list when on thread (Ondrej Holy)
* ftp: Validate fe_size when parsing symlink target (Ondrej Holy)
* ftp: Check localtime() return value before use (Ondrej Holy)
* CVE-2026-28295: ftp: Use control connection address for PASV data (Ondrej Holy)
* CVE-2026-28296: ftp: Reject paths containing CR/LF characters (Ondrej Holy)
* gphoto2: Use g_try_realloc() instead of g_realloc() (Ondrej Holy)
* cdda: Reject path traversal in mount URI host (Ondrej Holy)
* client: Fail when URI has invalid UTF-8 chars (Ondrej Holy)
* Some other fixes (correctmost, Ondrej Holy)

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../recipes-gnome/gvfs/{gvfs_1.58.1.bb => gvfs_1.58.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.58.1.bb => gvfs_1.58.2.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.2.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.58.1.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.58.2.bb
index 6dfed59d86..e3b90950d6 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.2.bb
@@ -18,7 +18,7 @@ DEPENDS += "\
 RDEPENDS:${PN} += "gsettings-desktop-schemas"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
-SRC_URI[archive.sha256sum] = "fc537d6bbab1ffa76972df7d4a1819b0c0fe19ebd1dfe82421d1f32e14b5dc3b"
+SRC_URI[archive.sha256sum] = "ad9d5bf0b45caf232520df0adee51eb650200b0370680f80a350ead9d1d61ddf"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.50.0


