Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B238C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 14:13:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11175.1720102434057900693
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jul 2024 07:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7915550ee8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4645Rlh4003823
	for <openembedded-devel@lists.openembedded.org>; Thu, 4 Jul 2024 07:13:53 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 405jp1gjcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 04 Jul 2024 07:13:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DW+dWN5h6yapaVYhdI7DyK3wpru8RvwEUuNOjobxkPr1q4IFoavf/bFJh/vwD0qmMeRfrv64an2yYZEeF4muONAe0xkuCxLL6j93VnhHmB7hO7J8ac0nz0/vX7WXAsg5T7fgUT2IU7YzzlBGenJIojtzltMEt+A2MowLynPt5lhEc6BC8TMGCEbmjp87BJRp3Z4dic+PqlEAAVrZbzckwAMmCWpt/LycG6fFdKkz4k49272lhcheV43Dpa+EzeNv4weHgxgidO6M/W/bn9igPSWpdZDfCRVyuGaW4qlDoW+iVVIclni4sf2gX6ODAvS+Id0XeFsYD8aXOUt1/ujpXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myFtByToxYIbr19Z6TVTu+/kYNDSBZlzqLb7YMCjzIY=;
 b=ABCRiIDnm85sS+EGE64nl0ORbiurennGXG8iGXXIZcuIzQAHj4P8oiQe5rYFk6QJ63nio/cvOEhG1vu9OS7q+osOZpe/aosC5elm7U72jiLX8Q3sTIpe4ujRhGb6vVT/ML8icjw436Wr719I6RacyXM5HCfAlIS8JnnjgLnSLMa4rF0coRKXQS07XbJcj2NzTTXWteRSYz3w0beoIIdAV5gA1wJVDkNOKOaYcn26Rv2ezDIaeO60smmbhrmMPLH1DrzdF/FsKeqqPFSfj0uR1WAk3noGHhXb6YVxpc++gV/VJnFHTOUK9G8EV+oJBtu9i1yddoevHfpYt3pETaPSIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CH0PR11MB5220.namprd11.prod.outlook.com (2603:10b6:610:e3::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.26; Thu, 4 Jul 2024 14:13:51 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.7719.029; Thu, 4 Jul 2024
 14:13:51 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] lastlog2: specify correct pamlibdir
Date: Thu,  4 Jul 2024 22:13:39 +0800
Message-Id: <20240704141340.659529-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0194.apcprd04.prod.outlook.com
 (2603:1096:4:14::32) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CH0PR11MB5220:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f819e7-7b44-4e14-c96f-08dc9c3387b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qP6HqDRM2iJQlO5F1TrEWnO/UP4afw+bnEUqHaOFB4iMDwDivM5cToQ6gYfc?=
 =?us-ascii?Q?Q/ovby6ImK0LHylwiFHapXEisXHk4Yp0u5rkrB1xN0/XDdloYjiOxONxXRHS?=
 =?us-ascii?Q?IAl1Aga97Qu+RHYq/8OwjmetPDHZJ14f2kGQfVEfIviTQsJVQtvSBr6MKe/V?=
 =?us-ascii?Q?8nP5Wmq91uNGKppXCQVinAC72UhBzpI6F+LowJB/TtGF5r2mMxOa2K15hZko?=
 =?us-ascii?Q?Spz+29nz6UC+nQ0vqGPnCsj4pfqiFccRPHyFW3fWO6u861iJIz71b/0SwUxl?=
 =?us-ascii?Q?ZVgELmM9SOVasb7PrDl8o5z8jBMmoUXDBF18DvYQC6PUWYNA9g79WgbTIXK9?=
 =?us-ascii?Q?9bMfJpA6ucspJS/Bcl6wHsQ46+XGYeF7vTGY9RwhFt2AkmftusilDV10C3A4?=
 =?us-ascii?Q?o1oWR4AYdFi1NNCIzF5+7hYxynP8qn5c9plx1AUmOP1O1z+wYkck0YtrMHn4?=
 =?us-ascii?Q?0J57/UbMrP5IwCw8NMh4BE8AcGx7n8CKlN12B7iqr/TkcgvmwRPnQThvtJCG?=
 =?us-ascii?Q?uLH1RObj9YTgm8PQTN/enBKJdwnoaXHDECsLpIJhHNaiRoo42D8AZhq908Ld?=
 =?us-ascii?Q?hR/NKjLbXtOMDd7+nGl3k4sbgNvOejmHsgaau5wQlfihqd863LUqZFAcJeNk?=
 =?us-ascii?Q?pvuDFJTl3X1DdT0xNk0l2j9qXlFocEIUmUcvKqHaBhcYaJA3Xz2rAbnezRNL?=
 =?us-ascii?Q?EweIwABs5WHV/sb0tsNJtf6wpfG3hqxpcjEt9cUFOXxbXpeTFCOOVHTm65Se?=
 =?us-ascii?Q?00eNyDHLxjifIbhvmMMBtgDS9IQxrlOPOWHvuqxpFzoKEQlUEGn0ffjE1oaU?=
 =?us-ascii?Q?3lgW/iH/KBgXpSu/G+dZLGep4SxMvsCxRNvEgxIE7JLMjmq7prv5vLb2Nx8h?=
 =?us-ascii?Q?Awtwc+WJXPJRooDX2n/VQfjSHgSlNjOAzDhVr+bcOZif5JeCqo6Jkz1JzqbK?=
 =?us-ascii?Q?sTCX29PP924/4jlkOzgQk9gWBYGxDmwcz719APANUfhaMUZwEqSRcGSveA/f?=
 =?us-ascii?Q?B4iFHcU3PXYVoU0Gcz+EYypcYDBfK1ZUy7ZWJZIx/1Y03em6kZsWDxrmiZOB?=
 =?us-ascii?Q?r/r1EG1tZnoBYQPW78YqHBrY+NkNTceiBMe2ei7ia3prmAgg9xZK6CvPnM6a?=
 =?us-ascii?Q?c+yLMO7zq80v7N5NXYV4eFDvForCGtz9iqQPrY97DORrP/8+Ryda77TGRUP/?=
 =?us-ascii?Q?crIWh6lLrPmGYIl2elURK2Pte4sbEu6EH0Oix9M4y5NUi/vRymJIraKnNUmm?=
 =?us-ascii?Q?riQ+W/03OvEndC2aSFtDn/uHratxLTMlHev+rNn3xHLSyiygclhRYBo4i0Pm?=
 =?us-ascii?Q?ztD46foOhhguo/camP+wXiUFZ/v7BPKuqKOgIcbeT+vwjLJ4K88JH425WZNR?=
 =?us-ascii?Q?1SjSKYp099dejtMTMYyKFWV6geSg/yJSDRWqNF0JjEXHq/mn7w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ow0h3KkHqpnquUnVd21YmTOeOmDrk+2k9cG+MKnw96rHu29o5bMR97AkOsXq?=
 =?us-ascii?Q?kOscQylLjr6BxiX7dHKHjIZmb87Lc1g0X+hBdh6F72gzTuc4c4M3oekOUkuu?=
 =?us-ascii?Q?loUwoxcTSBjXB22LYSSfulEBvQ8XVMhAxwiY+x6YVLT167coWzL3Ka5BnTBM?=
 =?us-ascii?Q?UU73wARlkBysSyQw/W8fNJ9jyoke0FM6telVkdAKEMOPKFA3oEeV+eZ9jHFC?=
 =?us-ascii?Q?QyxZMgurkwdUCfyKkE4GMsS4jKU/mScpxPjp+76FnnVTtDfAI0p5CiMYV29k?=
 =?us-ascii?Q?nie0OIDpbe76sXDGYivnlrgdJbOkIgM6MEsOoHAUA4w6nhth/AwfJAFtETCY?=
 =?us-ascii?Q?uVWmXoZSEF1PgEihbNNGddAJb9vDfgbrMXEhmiIz0hmWibotp5qwXcgsf6tx?=
 =?us-ascii?Q?3n0KQfrkh4/mLdfZHA4Kik6LCL4SwZAh5+l8vskBjbBEsUiZa7hVdrCgV92l?=
 =?us-ascii?Q?Nf3yDCaItQ4GUEeUe58oFkQnwg48TCe+PJvVOekQ3/sM9Mi/ryJ+5RTrIBBV?=
 =?us-ascii?Q?LbSvSqdRUSllvd3UflJ2MPyuDPqBYYX0fDxnz0rVtlkl97jJKMrlyRLRtIn6?=
 =?us-ascii?Q?qcUzroNYepBjPTLWqhs2RUhPud6UkC1DTpSDTyEL1axTXhgrovYHUpQTY60c?=
 =?us-ascii?Q?1x25TibllvvfeDQg+LPo4h8jDoHObNErqlwD+KGKWuvcWuq0CM2KNiMrgzIL?=
 =?us-ascii?Q?pd+vZ5tkhwN/s2lrcfprEMOfPufgBt1FJdFk+wKdgNBnaAgkzMsc2N4EPG48?=
 =?us-ascii?Q?o6PwsIZdHHYULCfUX+Ny/cKwpCFd3JxgglevgSRYqSUbwySe/TjBGFSGaWCY?=
 =?us-ascii?Q?io2EOwR3k/989eNkStGWSquWEhdvzEtgayMpDQm6OwzQechxxgHdWlHruehJ?=
 =?us-ascii?Q?Ft/D47QDhKuZs8TiXJrnqt7XRDYqItncxNeLXyz6JPzsMNGDBYoJOdY24vs1?=
 =?us-ascii?Q?QWr3iS4Tt8mjSC8kV8bYfoAcyw6IH37hoLyei8mbNuQ0xaj5CnYw6Y9tN8M7?=
 =?us-ascii?Q?N9EcxZZc7cmEYlOqNlues+6mefMYtdHMtmPp/m2fMyqmgiC8Pgz9xMeQn1eW?=
 =?us-ascii?Q?A2T6bGMtz6aXVJIbWs+y8uGBcCLe3KqKEcRtVuAneXMcluga0mus/T2tImYG?=
 =?us-ascii?Q?8+g8c7O/MmOzEe6+1/mmZLizjXk0ejd7/BTCtcXHkMFQnXBynNi27OG/ADmE?=
 =?us-ascii?Q?3+a39fKA4/9YFyJt3w/028HCsBMYdv5mZIB2ubT5hvB/GBliarPR6fQr/AnS?=
 =?us-ascii?Q?jgbIfcaop/uQyy17Hjxljavb75GC82BcPhv1rXRRpPQGmwh81CrapzdfYRRU?=
 =?us-ascii?Q?+7mNenakmvvS9MGII+gvnXvm8K4Lk54q9HOO7oPBewuXLciEll4gRTFbyajW?=
 =?us-ascii?Q?P/VALPyacBoZey5nU+WnxJ4IsmCSjzu/1+mjCzsxUa99aah4szlCnelaOUly?=
 =?us-ascii?Q?H/xrzqF9ZZMxY21cWuQse90iai7UuLuGHMfo0lqq8YoF18KwFJ/u/czqv4mn?=
 =?us-ascii?Q?P4tVYZ8/pUye4uHwpy9gpFukQLdvORqFWY2SBtz5tCtvLh9klORdLxfloWNO?=
 =?us-ascii?Q?ypfTE2AOzZuk5YABh7zh9/2VI49PB3ZN4sDOXZJW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f819e7-7b44-4e14-c96f-08dc9c3387b3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 14:13:51.6670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ccdk4NlCd1jfmrM4ieP4cs4AWyoVvBLNymzNCi/X7B0rs9atjZxDK47J6kug7R2xxQ3bpFNgXKpLgyLJ/VEegw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5220
X-Proofpoint-GUID: BWpQlqz5RxWlQWTpIJtLrgK-DzqPBLK8
X-Proofpoint-ORIG-GUID: BWpQlqz5RxWlQWTpIJtLrgK-DzqPBLK8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_10,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=797 spamscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407040102
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jul 2024 14:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111253

Install pam_lastlog2.so to pam plugin directoy.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/lastlog2/lastlog2_1.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/lastlog2/lastlog2_1.2.0.bb b/meta-oe/recipes-extended/lastlog2/lastlog2_1.2.0.bb
index 43deac383..0b3ab1f82 100644
--- a/meta-oe/recipes-extended/lastlog2/lastlog2_1.2.0.bb
+++ b/meta-oe/recipes-extended/lastlog2/lastlog2_1.2.0.bb
@@ -20,7 +20,7 @@ REQUIRED_DISTRO_FEATURES = "pam"
 
 SYSTEMD_SERVICE:${PN} = "lastlog2-import.service"
 
-EXTRA_OEMESON = " -Dpamlibdir=${libdir}"
+EXTRA_OEMESON = " -Dpamlibdir=${base_libdir}/security"
 
 do_install:append () {
       if [ -d ${D}${prefix}/lib/systemd -a ${D}${prefix}/lib != `dirname ${D}${systemd_unitdir}` ]; then
-- 
2.25.1


