Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E846DC433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 19:07:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.2210.1635448029276571425
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Oct 2021 12:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HsqWbmky;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6935163033=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SETjC1019753
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Oct 2021 12:07:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=HGnktinhFKM46iNEw7CVN1hNoanDIkj5aCOu893bOhk=;
 b=HsqWbmkyP/UMapoePysHO1soBT21/H8QyAwQCJ6ApILgpTjZC4KM4xBFKKG25cZn1pUS
 sMxx33qdNM63ih5YI2FDbJhxGKaU3fmRqMkQA64tuV5HqupH9IJJtqSFZ5jd+ZA6inG0
 0+1NKDOdl4qLSRr3m0D8TZWhhPE59MgWQZ6IkS6WW3VngB/20zwawgzqSB9SfSATCafT
 wO6E6/vh2FLO+kTSj/nsbC1ky0GslRLDcbXPSepFb4HkygwhIqX/eb+hEsh11PDB7DLF
 M6suGNBcBYalb+IGNYWzSxkbTC9tU+qxqaorNJzl2dHcwa77cPNZuz5i2wSEmcGP/8r9 Og==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
	by mx0a-0064b401.pphosted.com with ESMTP id 3by9r1h54w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Oct 2021 12:07:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbgQq/H8WQg7a0MChU5iDFygs+wjE45jj6YTbN7A6E4Ks6Dm1iRdDlWybWJuIegtmOsHJLfRq5eOsErhCbaT9xPzDkjFfCuZLXXZXxzl9dI9lXgOzAZfCguIMiQSdjqmrOMBbck4LbTTyGAEns9pgnekeauS1tUGZubSmUawN+9/tZHz5UXgtVsYbl/5XDBJFbubmVxiJpOA1zWqdfw74iIaQhSOl8mACSNXoS1kuEoEOBuFTk5wqki6yZ0L5v9PVLjf0Fks4Nx8bYbDkSq+CXAKKH9DMzlUOJw34LjeGyoADw5sgwwILTeMRysMhycGZllfkscAAjLW7Cdz40wfXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGnktinhFKM46iNEw7CVN1hNoanDIkj5aCOu893bOhk=;
 b=U0hyhze+ZFzpYXS3szWHr9Y2ZhQrdF5184p8uSKAhvKvqDtElkG3Ns6B8O7SQJuU41z8+On0ePxiVH4ZAm2XDIEZKfcqt5WjVmODH9bi1TPLcqUjHkQL/fjgF+WFM8xtdu4Eae+uXTxBlUP4Jo/LPl5yVMgXAfoNxvouYaWeYss+Z2eBPiRbKRxBzyJ8tHu6Up4QWIkl3rAriUTJ5L9UT9bRoIFAjiSjS1uHJURD6oeLnurabzNrngtDQrgJ+tG2aIh5b8oxbu5no/leLWF4m+4Aj5T3urOwqCEUiWKB/Tgc43jkPqEpsgaYPlIZYYr28azpPfJKTlI7/oEoR2zEfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4928.namprd11.prod.outlook.com (2603:10b6:a03:2d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 28 Oct
 2021 19:07:06 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440%3]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 19:07:05 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-pycparser: RSUGGESTS cpp and
 cpp-symlinks
Date: Thu, 28 Oct 2021 15:06:51 -0400
Message-Id: <20211028190651.168901-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN6PR19CA0082.namprd19.prod.outlook.com
 (2603:10b6:404:133::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0::60cb) by
 BN6PR19CA0082.namprd19.prod.outlook.com (2603:10b6:404:133::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Thu, 28 Oct 2021 19:07:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03a7ffe9-5df9-4376-58c8-08d99a46219c
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4928:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4928A2B54EC3B2F87CAF2F359F869@SJ0PR11MB4928.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2Ya62fYZVGY4ReoZGF8+CnPauqqc5ykIugPL54bDgjhfXFDKgLtgeGCquRcrYfc8/hOfZFK5lao4wN/atRF/j6PMTJfWYfpVzjeMAmERAixz1X2hUUm4U6MiSt7+qD9c0ggSmbMCzx2XZhZ7C36fs6DVsNbjMqgm5RhMfYWpSKb3faldsH6O0jPb+XdgEOLanRc0Yi/Ez3oQYgCIXOGsuIRUX3FYCXVaNKfEeEn0ZZnBmPETi+AL96OHUYSjoIQNzjudzNWl1Ti9EaD/a6tu5DrZL/nUOgweFiBWenE06aK2aeIyv5EtiX1e2k2iUYT1l5TZb1yIXlri4Q3NJBIi6fi66U70lFTcWo8v9tpKrDXA49mNFMfhq9SuMUzwFwKRQ1XxT4r8pmy6ZQhshky4s1u1DCRucElRuDLiT3Wu1kciKPnnS+IukcxMNCY9yJwBLg1BXe+zN4KVIHRWFagHVzK7fnksSPEWMnhg26gnNTpe33U6EW4+VmIC/yzSjI+lIY8BuBKKinUem/AK+5syy2HvMHoFwojsXbg5t4cQ1DMFjar31/Quohsyz2dUhs8J6lebPLbE1CAGxVFoYNfGCx1d/ia/Qeixi/ceIY6PS/sKsbkk1berSawiYMES6sHTTny4O4VAOeTv6kTZ57sDP6E8qwVtD1OlqAwLUi2DiYm46cHUwQR1LlgHUPE838DI59GK0FGT2fc9YrDVV3iWNT3B9QTLW2Jmm6Gn3kUk6Xw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(44832011)(5660300002)(186003)(6916009)(2906002)(36756003)(316002)(8676002)(6486002)(52116002)(38100700002)(6666004)(66946007)(66476007)(66556008)(86362001)(508600001)(1076003)(6506007)(6512007)(966005)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y9T678b2JLU0pjbZYW9kDP8vJb7r1ydvrIAt7lsXNgBLCwcKujVuwy3hfpIu?=
 =?us-ascii?Q?uqOqky+ES3O3qRC++66WxSOktyVapouAmWWk6hLsWxBCkA1H4e/QG9KtNyH7?=
 =?us-ascii?Q?gDlPDHqSayL0EhcneA2Udey28vJp6zlmUgI9Est8uIwxbqvrGFSS62NaIjcN?=
 =?us-ascii?Q?jABq6ufK5dnE5FF10GCIwljX4vXj1EnNOVgRjIaRQTl4BcEGNsRtxa1yTVQj?=
 =?us-ascii?Q?TIyHhkMYEgfTbbFrhyGmOy1dzA/X8qJmZ9d0eZ2iX7I3xA21bU+zlcVSibV+?=
 =?us-ascii?Q?Rl5bST4XnEayDqJb7QjwXiSV80OXjVdMAn1vkXGs4g2HFeblx27IK5GIyXzd?=
 =?us-ascii?Q?EEIMquEtyyHDv1iroFl/lqAnPuNF7vmIFZY4R1bg7xrOVGR35POnVs2r0nab?=
 =?us-ascii?Q?Sc2BcEI3sNKXPzC6iUivPlAbmGSvbb/NS2aKaBNCz75IY5HJEcM+xGVhJUuC?=
 =?us-ascii?Q?vV76b+Cuu2BOwnFWVu9LqM9gAoNR/pLgWowIdLvN+Ty7lJtc36otrmeXCiv3?=
 =?us-ascii?Q?uDQcaPkmCIH/xpYyxdtAg0dr/6e8uoyDKePvfDPI2p3p/ENKz9GYTStzDCdt?=
 =?us-ascii?Q?jsptn+KkZfWW4UV6wZYzhNhL3P+pLuDZtI21odM8bwGdL2D/bhIc01LB6I1r?=
 =?us-ascii?Q?oxzSEQ50W0PLDha5sSY+kp+2fwJQlmY7gnonPVTSSHwVSLfWWRrGdFOXW3lG?=
 =?us-ascii?Q?/4cMtH3JsTzFXRSHFmuuQch5F0a+99JOQbyZvBKtg3STQ7MYpcGhn2tcfhN7?=
 =?us-ascii?Q?vchHtNZQKicdJ3xu9GBoFRKZRc1aHUjqD8prXCwgfXKqnoBkbbfQqBKzWKwf?=
 =?us-ascii?Q?yH9ZWigwUN7ysWuZjY7roKLmkE+MgZejmBxDlw6owDWujvyK+RQht7+PfuFN?=
 =?us-ascii?Q?6LNmK6mVeC1vG6xMQ/oJIifE4v2iuec3VpVnBqXOpUjq0tFDLVR3XTJsFkud?=
 =?us-ascii?Q?GZfz0kWyoRCY3imYHPOIkW030MkjqdqMAHqLAbLVHxQnIMaMQSjQR3bmj4d5?=
 =?us-ascii?Q?+Vc/cOAzeLnGggFLAAAqBR9+FRLVxdkRIBQF3MCz4PbdyuljXlVvVNTmMrSm?=
 =?us-ascii?Q?BK9l2THTOh3NoaPwyc+0Wsd8+3Vu3H6N+dIISQiwXXh9BMAEORBzJF6q2QwW?=
 =?us-ascii?Q?UxrwLm3IzN7uxFPORaq/x+9YvSn0BkHTBsGjD6yiPMSglA+YyOnFIYOPsgM4?=
 =?us-ascii?Q?RL1hnekPs4joKxCigfmaFcID+xN/oQs/Dn9uJ/4lyCLQqSUBDciyZLhLq872?=
 =?us-ascii?Q?POwiKz81qERxneCDLtWphsZGB9Kwul0nnUg2/JnODnJxZxJl7K5YBrkTAroH?=
 =?us-ascii?Q?yRv3t7W/o1YlXUkDetkI/fvMefeSS3eSlGSmaMFUwxTgOqNO7vWf3RdoN11L?=
 =?us-ascii?Q?uEfhBDZZN5AplCaCGYhoobrtPfeVDoSCyupN8a1Alx82dEdaBJV1iHCUozLU?=
 =?us-ascii?Q?bJxacFzdFdNzcoTSfzOuplIjWVmaEmec89M5xSF03pVgrjaaA81n4j9/k3d5?=
 =?us-ascii?Q?d7FuaHsbatjNMhuWeWQpthzrOf6r1VXCpb2/fDbuYEP/8ZPakHmKxlXEcWV8?=
 =?us-ascii?Q?pyWBHfk+CGWsLuQ5z4zthHJ8jzP3wdYRRRm6Vkss4aVMeJ73nh9EE87W1v69?=
 =?us-ascii?Q?H61dewG9c6WSclnxrv5kNwFPK37nbI546+SBPKoqJo6SH4vJ2sJ6EE4v4G8I?=
 =?us-ascii?Q?cKEltJ1t6e8VAjSxLFfPW8hGZQkxwAfLHssCH6PEABVf/pmr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 03a7ffe9-5df9-4376-58c8-08d99a46219c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 19:07:05.4846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CAB4+L4MZnuaRz5k0Z8mOLbSSibsud4mLKu+eitLSMbSZlukMDHmyb5DjVNCeLl1hEkwqIoMoLFwXUnQQfiKiyr6XwwtJr+sj+Ao6SP4368=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4928
X-Proofpoint-GUID: sk0jsxr6YtlLu4-H7boxql-AQU3n2-96
X-Proofpoint-ORIG-GUID: sk0jsxr6YtlLu4-H7boxql-AQU3n2-96
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_05,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=988 malwarescore=0 mlxscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2110280101
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Oct 2021 19:07:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93640

cpp and cpp-symlinks aren't actually required for python3-pycparser to
be built or installed, but because they are in the RDEPENDS list for
targets they will be included when building other recipes that may need
python3-pycparser but not those packages (such as python3-cffi).
Instead, list cpp and cpp-symlinks as part of RSUGGESTS for target.

For reference, a previous discussion from the mailing list:
https://www.mail-archive.com/yocto@lists.yoctoproject.org/msg04784.html

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pycparser_2.20.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pycparser_2.20.bb b/meta-python/recipes-devtools/python/python3-pycparser_2.20.bb
index 845a9fa0c..fde868a70 100644
--- a/meta-python/recipes-devtools/python/python3-pycparser_2.20.bb
+++ b/meta-python/recipes-devtools/python/python3-pycparser_2.20.bb
@@ -14,6 +14,9 @@ RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-ply \
     ${PYTHON_PN}-pprint \
+    "
+
+RSUGGESTS:${PN}:class-target += "\
     cpp \
     cpp-symlinks \
     "
-- 
2.31.1


