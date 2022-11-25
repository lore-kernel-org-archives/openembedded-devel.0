Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA83C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 06:00:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.40874.1669356038732822347
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Nov 2022 22:00:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=afXhVFf+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8328293407=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AP5wfAc000387
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 06:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=tpz+ReCK6KCSNcEHIHoEnLIhpUuwyXzs/bO3rUeffYw=;
 b=afXhVFf+kxuEmIsipKZTEq2T3cNO+saXlr7S3qEbssjzuU7CSFIGIU5otGJ1cZQDL8U7
 PMxGKErqR0nxGdBdLzL+miODPa/WBVM8Gg/uve7g3UUIqL0J3acZQ5N3JOlSB5C/eRc0
 4tjudfk4iQskR/Mo759K42tL79L0rd2pJnToAc8WCAiTA8sF8y1ukJHdfIrH8cU0hKws
 sW6UsZQBgyMXLEWOXhktuz19XblXMRuw7VH+ikwklHiVQksJtHyTCp2BfQVtIAA6EhN2
 vLJBYKusJyCBPQfN5L2KMebvUIYUR0FgeSTaGqbbTRYBrQUWj4yuInnvYkyjhRpgQ0FQ Sg== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2045.outbound.protection.outlook.com [104.47.73.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxnxj4rs6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 06:00:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7OmMf89w/jrPSRSYYST/Ylmasl6WbRt/urMtfj4Hr51skidUOd6HCy/saPQvTxSABINZ4//BKu1bWlDrU/BtvvStsX/guEE+ddIi/K1Sm7QQIPT4Yd7nqU8BTl/qcffRzmNqrI7uIEWPWGZEJSCm79GQUOVznArRZxUIUWgVVXiSWDWy/apcePqTLn4p7roY5Atji5zHv7qX6UsTXxl31VvRkcuEXh5kv145h7qUMvrI7g5TJ4kCw6xW/HqrxiZLO7+LJINSIar0x2Q/QI0dSvuD9gyhAHXO4bMrWX/B/mgv71PfF8Qx4HWcMXenKl6hupJnPq7femF71TooZzrQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpz+ReCK6KCSNcEHIHoEnLIhpUuwyXzs/bO3rUeffYw=;
 b=mjZyODXSrRcn1Vqe3B0+lgWnGvQICfjMGynRJmWnXcDwlNA7OWNa2cK0zB1JNvkbEaTMaRffdb5bP2F72eiVpAQJt6sbYXXK0OuBCVwE1az5uPIcjXRDGBgOKLBmq5wF+Vc/+7b3CiHFU4CDOd8CkxY2LPsh47kHZhIpx1dkLiTYlaiS60Wv9loDCfviA45p/0YN18jgDjI+nISqQOQXUJ6P3y1s+TIgFcHeenZbcNrZLYOw8cbY2wISDLvuWDNUhWe1BXZM9XlWhvxBnhzYD6QyfznbmVQpl5vEtmBdjN10wMHYuzG9nqZI5B+vneftUpJa9oQm1nv5qH+aRmnFJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.18; Fri, 25 Nov
 2022 06:00:35 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ebd:1e92:dbb2:1fe5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ebd:1e92:dbb2:1fe5%9]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 06:00:35 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] ostree: fix selinux policy rebuild error on first deployment
Date: Fri, 25 Nov 2022 14:00:23 +0800
Message-Id: <20221125060023.1329416-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0164.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::27) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|PH7PR11MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: dd849aea-95a3-447e-69a5-08daceaa5e9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/kxdkMBEFfzIcHN4QwqLaHgCxMbXzWGHgQr4nGJJfRbiw5tBNepZW8viGhq8x94k+Tc3oEJ2uy0uEoO2kwWMf/V0GG+meEEebf5RiqfzawhADcGJUxhS/4YvIhNgH7o14saO4A/cNjT6lfc1Fr8whVfu5f9zC5/6sbKEUFQUFzgp+URS8qLREVyIAPmYNnTPXjiBj3qNUyhw2pbA1Dfm6sPmiKdqPNQ0Z+iUcigeoCtUmkMwGHICkLWspuMV7YtwckMJ/Lrcxj8ACAg2tgdZOxQhIG0htLHP9+Rgfh/T7z5fTBZiaf8DyPddmun5wPrZfXlbdzxYMjEtJV+hLn+b213sh04Y72rwzvgdEceXsFV5nTgUsg5cZCRZP4OXuu0FahOV51A4Fg8u11zd6ZuivQWISPBwxKAA5uJKm/JtmN67smBXNCFk6sFo4WtlQjHd13pmtRaEeu1g9fmjmecTo6XlK7rM/Kut1MWf5iwHYEij0u2URek4W1cVyZRnToVch5IeLxLlx6rMEyScXYDtceskNwZcdyahrZi3dxWS/wIkPqb2emZLzgrFUKZJSFc/k+GEw1pHwIK/x742z4acdbjFza7bKh0FcqtQo6iRRhySgdqkPxeHn2SsFj0yx+dLzg+FHXhUOwmHtDgUpabVbuPqvw0iSpyIGmRDssIQOjO4C1UYEPM81yibgiXRvoD3QGN6psSFcTmnzuUsBR9LAPGdOsqMfeCtmC4jx91jL4QT6/IPt9BmpW4EOpCnoJILAFJYI2R7Jpd6LAzbyG8lDw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39850400004)(396003)(346002)(366004)(136003)(451199015)(36756003)(38100700002)(8676002)(86362001)(2906002)(38350700002)(44832011)(8936002)(83380400001)(66476007)(316002)(1076003)(2616005)(186003)(6486002)(966005)(6916009)(478600001)(66556008)(66946007)(5660300002)(41300700001)(6512007)(6506007)(26005)(52116002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Z/YdfQs726VM0BD4388XEo8HcjJlwCMoziXnpsxW4ypZslpjXn5ZAv39f0F8?=
 =?us-ascii?Q?INUdLJmVlFqQScAQc0YEZav2KydvxZszHhUgVgV8NosA8FgrKFvqEnFfe4de?=
 =?us-ascii?Q?nxmfHx8fktX2OlMbsnR2xz9ReEUG00XCTY9u5vbmTT166QObWxBcxsEjSBJF?=
 =?us-ascii?Q?Htg/R5RUMnswqmvFTlC8EQ9b0kkck4wiTUkaMjdldhqFUOxF/RTkk9yjdHB4?=
 =?us-ascii?Q?Cuy/aNHXtq4h83YVT5eFLUS2oOyeg0EPnfKGqHK2R8S+bv7SmOAsj7/djcXr?=
 =?us-ascii?Q?jEXlDKHQkUI8M+mwLBMbPTAdtJsF800m0iOuURdqhyaK7Wc5lrh3J5adUQAG?=
 =?us-ascii?Q?EnzC1/as7h+NdFyBWLhNG/3ZAvXbS0ivWpKrNNIwWcNth8ZnsNs7SQ+lTbHd?=
 =?us-ascii?Q?crL1nZQ67Y+LpXscrB8uYAQ0lGfC3XsA0R620bIRaV8WOQ9bxdg4azw6PUkD?=
 =?us-ascii?Q?Mo5HQaYkCR1xDqGtwdd7pXB7DnqQb6AkEkf1ZD2lriqKu+iwtU3rm9Q1J+IH?=
 =?us-ascii?Q?kjOqafTKH9Dz8wfw5/SSdhXNPtOtcmPwXcZZmnju7+U9Ul9bHSOIzNnga215?=
 =?us-ascii?Q?1giG5k/G0/hsuR4sOiYC2lShwNekyh6G2xg92PzkJuLX5mFLI3nbvm+hMq8w?=
 =?us-ascii?Q?fW5f9UvdOPEOjIDnxL5Nu+FzriOpSbcWPFTGMXaxOEVQQ6jSPQ0C/jc2hhRb?=
 =?us-ascii?Q?BZAlfbwgFaPZS42471piFs9gL2EMlf846Jpf3Ede8yVB2esENSfdxwCd0GIh?=
 =?us-ascii?Q?v0x8taEtJ9rET8L5k82E6TORzi5fm5v6pz6XdDMYu+Z3r1X+KNobO1WDCwyM?=
 =?us-ascii?Q?qYPsAjqEDVtAEj68C2THiFtnkg1Z4fnIjDDYOhM10wrUPSS0Qi7iBxu/Xidv?=
 =?us-ascii?Q?jZa+PRyCA3XRICNkETdHJPa67V27F1TaUCyw/G6yOpZxW8xs3+aUnOhfYT58?=
 =?us-ascii?Q?/QZK9J6YjxdParfgD2bqlOv162mNcfKsCQ49+ZARBri2570wtVf7aJEYkjFd?=
 =?us-ascii?Q?yZeJ0eIk+FxzXwyUEBUiV+FTq4XbZd2OM3imYsojzhohj9R7wod7kZmGDxZa?=
 =?us-ascii?Q?FDIQD3ix8XOZQ05f4hLs70+tJCd6BKzWyu46D9U1pJC9JeF4TvFM+gVFpsHu?=
 =?us-ascii?Q?ISr5lUE6B+mlv3Lr+pd807dpFXNkguIBnxdl58TLHihS4aLbvSjLDUXtlrJm?=
 =?us-ascii?Q?bogySkZdgbBIf4VMgKe15LcQD5CC1H11fHSffSYXLfTbyccQThm40mhS/9ap?=
 =?us-ascii?Q?YVFX7dACgshH0hUDlXINpzxw9B0+A/n7CoIWsvyiWbSsWUBsZmdyRWoBH7rh?=
 =?us-ascii?Q?tEjSv2u1+GaIqr++twzC8RVf66hz6x2frFdrXRAlnFymydgLdBLVkYm13sJf?=
 =?us-ascii?Q?Ocwl+7TIXOeqfaIab5YG4uj2PNT8cYonNtCEXPq/kJh90DBv2kGhAqgJe98O?=
 =?us-ascii?Q?OipV5xsLw5rbksgfXVPrjJO2lXz9EmxDS99SRzcMNY/waX8IR7v3MlAzgGUx?=
 =?us-ascii?Q?eOJyzPjL9VSONymghWwA2KZ5LjUtiv/wmnWl9rRugoYmCiI66hmbSN4khZd+?=
 =?us-ascii?Q?t7LVhb2H9azQcOVYbUq8/X8Vnt7XsiBJvj3v9vOm?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd849aea-95a3-447e-69a5-08daceaa5e9a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 06:00:35.6254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bNTWlsh8B2Iylupzx8DuD/WRF60zC2S7fgOk1ImdMZzIkQGN4ORSNMD84RjPm2fssT2JatWxd40swKcoMaWe9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6053
X-Proofpoint-GUID: HP7bIK6-lgXkZFBVl7CX9JWqBEV4_DFw
X-Proofpoint-ORIG-GUID: HP7bIK6-lgXkZFBVl7CX9JWqBEV4_DFw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-25_02,2022-11-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211250048
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 06:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99724

Backport a patch to fix selinux policy rebuild error on first
deployment.
See: https://github.com/ostreedev/ostree/issues/2758

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...uild-selinux-policy-on-first-deploym.patch | 44 +++++++++++++++++++
 .../recipes-extended/ostree/ostree_2022.5.bb  |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.patch

diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.patch b/meta-oe/recipes-extended/ostree/ostree/0001-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.patch
new file mode 100644
index 000000000..248dcf49b
--- /dev/null
+++ b/meta-oe/recipes-extended/ostree/ostree/0001-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.patch
@@ -0,0 +1,44 @@
+From bd325061dc9585886f7e60e58d9fc0c8b37e71db Mon Sep 17 00:00:00 2001
+From: Colin Walters <walters@verbum.org>
+Date: Wed, 9 Nov 2022 11:18:36 -0500
+Subject: [PATCH] deploy: Don't rebuild selinux policy on first deployment
+
+Basically, it should not be necessary - the policy should be
+up-to-date.  We don't want to force on continual policy rebuilds.
+
+Even trying to run bwrap when we're *not* in a booted
+root can cause failures in nested containerization scenarios.
+
+Closes: https://github.com/ostreedev/ostree/issues/2758
+
+Upstream-Status: Backport
+[https://github.com/ostreedev/ostree/commit/bd325061dc9585886f7e60e58d9fc0c8b37e71db]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/libostree/ostree-sysroot-deploy.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/libostree/ostree-sysroot-deploy.c b/src/libostree/ostree-sysroot-deploy.c
+index f27ae0e1..26b07080 100644
+--- a/src/libostree/ostree-sysroot-deploy.c
++++ b/src/libostree/ostree-sysroot-deploy.c
+@@ -2987,12 +2987,12 @@ sysroot_finalize_deployment (OstreeSysroot     *self,
+       if (!merge_configuration_from (self, merge_deployment, deployment, deployment_dfd,
+                                      cancellable, error))
+         return FALSE;
+-    }
+ 
+ #ifdef HAVE_SELINUX
+-  if (!sysroot_finalize_selinux_policy(deployment_dfd, error))
+-    return FALSE;
++      if (!sysroot_finalize_selinux_policy (deployment_dfd, error))
++        return FALSE;
+ #endif /* HAVE_SELINUX */
++    }
+ 
+   const char *osdeploypath = glnx_strjoina ("ostree/deploy/", ostree_deployment_get_osname (deployment));
+   glnx_autofd int os_deploy_dfd = -1;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/ostree/ostree_2022.5.bb b/meta-oe/recipes-extended/ostree/ostree_2022.5.bb
index 699b693d2..1a0987361 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2022.5.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2022.5.bb
@@ -22,6 +22,7 @@ SRC_URI = " \
     file://0001-Remove-unused-linux-fs.h-includes.patch \
     file://0001-libostree-Remove-including-sys-mount.h.patch \
     file://0001-s390x-se-luks-gencpio-There-is-no-bashism.patch \
+    file://0001-deploy-Don-t-rebuild-selinux-policy-on-first-deploym.patch \
     file://run-ptest \
 "
 SRCREV = "15740d042c9c5258a1c082b5e228cf6f115edbb0"
-- 
2.25.1


