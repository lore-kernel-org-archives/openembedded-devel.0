Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C496CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 11:56:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9278.1697111791301847616
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Oct 2023 04:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZZzTK2ZW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=86490ded89=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39CBBcCC013736
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 04:56:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=nJ+H85RmMaDW9gv6Zv
	zSSR+REnKK1yWFx0vlVoQxGIY=; b=ZZzTK2ZWTkNKPbmBS5JjrBd3Q3FtNJHnTo
	K8oc3ZrFdCyjpjfC7i31d3KHK4zLfP9Q090RdHmm7x9Ovcqe6dbaY5yZTyIA+dhN
	vfFqVweMVofhCsfevZ0Yh7cqsQZnCNbAZARlCjnnq8RekAgnwKx7UBNobWWBNsFU
	kt7DniKzQpb65FOuRtBSG/1M1wG5hxyGobpuqVNtI7Pu6PgUXwY586g5DfpLefLP
	vJ5zrRnaR/z4P/Fuk1Z/IUw1qbp0H+AVimM25SAqAq/WXcOhJzfOG6Bai1Q+VcnB
	fZNYC31U4i+gXJZz1v7zpoWa98cKVQ6smRQPEzibzHbtwieTwwSg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tnhq4scca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 04:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhVeJAGx28u8/DxPJc02mzEwzBMwNqqtRjTm33EXJP6Awbur8cCuF/tQs9eNsNilyml2BPufG82a7G7IRWsVjrgNUce8QlkOrArJx8JbN+c0jD98Gom774RX8VZFClXQBI83YFFvPexhIqQ6q3Jj/++QVyQWYTqc1RLwRdybRtknaJHsKqLNJW2ZMFq5JXv1OkErpytmvBGLdBWVeCLwpg6IKTGcz2eKTdVP8jET6iqk+qAw9xAlPj+AAIzrQmZaT2YPGQvd8rNau3w24RtjHAphjJkzSKLFAyfL70N7GhQ2EHDNBnQwyclrrnqGBAEfde24HcE0NCTybWEqiy98lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJ+H85RmMaDW9gv6ZvzSSR+REnKK1yWFx0vlVoQxGIY=;
 b=fKXCmVWcRyCudwve5EhCtYFFrBxRgnfNyLEImcPaPgfUcybruVl2rlVNQ8hlQXvO4FyCJmDJ0cht5EdLmmu1ga9Ff9dR6ji9LbXfCiVcqEAvdxJrhizjoGvX5BtDTdkqRQdwEz/ZLZKFAUtzzrdYfio8Pr5DZVT7AFXg88rSqu2NzDdeDX6h3r5sg9Z6OkSfwUptpviv1ABZxhYFy55vxAUt9Upt/F5A+nwMPry/H7tAo9JQj3/MWYSbEbTMjtSQ7N7zIGXsWg2JmHNUlI5y0RLYaAd9sJKHjvqEESOygMxZeOXNDzjm/wvYtuqrov5QZJ+5bsDOVB13UItJqtlSrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MN0PR11MB5964.namprd11.prod.outlook.com (2603:10b6:208:373::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 11:56:28 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::96db:9814:2d71:a957]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::96db:9814:2d71:a957%6]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 11:56:28 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/4] samba: upgrade 4.18.6 -> 4.18.8
Date: Thu, 12 Oct 2023 19:56:11 +0800
Message-Id: <20231012115614.3133797-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:3:17::14) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|MN0PR11MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: e8073e80-ede5-44b4-97d8-08dbcb1a4421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3LFrthiEReQ6src4pJxsqoCtAEac5tWMT6byJHw/nE1sAOMetoYqZxyCFHWgoGa+7NeZ8HWkEAaUXWgjwBPuEzh0mk23wD+8vhTU0ZSRyG4juYswtqtiKo4hGqo3zMeSwTi25fi/sQAyvVzgZ6fXYqLUeWDGoW5WbubI6ibGLbjguPZQJ2h3APwERyfeAFJPSTEuYKISBvegVQvucU776xhWQ6CV7sdX0ieoAJEkOZ+NP5LDjqD+X14SyXUZDmHiflH6x7P/GcgCeO3i3iyiWHtE9WdXAXWXBUxmtAb40A7i5MSu2K8ZPbGAYxrbKYdZeyGd4yacICKX5qH99Hj9A25Xi8rV6f1LH3MYjlag4PI+TtQoY2gwN3mcwXkgWykZfVUR+XAjmNHCHdhU3FUVZJWtnKqC8LsvkULwe1vnrcie4HKKNkZLxoJZLcrz5aNW/KEfbXW3GmbSEXFhQKx4MI7qGr2Ad02w1gBBA+C4QW3eP+/6C+C6ao9PTaLy0fh/NdRSmc4EqEoNDejuIVCoSLIxOm+mqthrFuMiUDPrPD4wGx3fWWtFMotC4d+farGIgMIwyfKfQsOBnrOIgVkSwx+Zm+e9JJkjvU8lqqJLTmk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(366004)(136003)(376002)(396003)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(1076003)(2616005)(83380400001)(26005)(6512007)(5660300002)(44832011)(66476007)(66556008)(316002)(38100700002)(6916009)(8936002)(8676002)(66946007)(2906002)(6666004)(41300700001)(38350700002)(478600001)(52116002)(6506007)(36756003)(86362001)(6486002)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZdtKdtcwOTUX2BzPr5tnweG/h9yMKZkDsn2zqOfPj6wA5dd79BB/dGc4hIoT?=
 =?us-ascii?Q?gUEgB4JS1U7xzB8AR4i+1HxK3FKwbHwriCW9Rk8eHidPR0AlgR2mbzd3LVqB?=
 =?us-ascii?Q?DqOQ09+8++ZO1968YlLkwySKDSuhRdlCLRKjYw/LKgKJ3E137lNyGKnpNoKi?=
 =?us-ascii?Q?5jVMboS4noxqxXBB03HDIJRV5loFPSBs51xSzs/ch3biH9KYI6hzMv1W1exn?=
 =?us-ascii?Q?5ypTWtooWSJvCK8lP7+X3Z02xnEz3CCymJ+GjAhvCWe++lATZEt5ZzAh/dZB?=
 =?us-ascii?Q?VGtCMiEpa7UH9oqUO7Fx4FRyyRAwxzY/y+JrBjtZnDx3w7nyYvXv8uKFzzqR?=
 =?us-ascii?Q?z6+RCo8abhOw+XQjVV03X59O1otU4GP5IF+wtGVa8urUlC6h6/IVNXiDk9VN?=
 =?us-ascii?Q?C60zJF2ugt7NFyZ/Y4jpjpxtjGBbRDE3s8e395hoaW0AL2220QdoCoGrnvpb?=
 =?us-ascii?Q?axbFGpSytYnoBhDIClgxckA1+bPg7cZ2dymg8ITuC05arLEmpaShZxCxifVX?=
 =?us-ascii?Q?mXKnVG5z6aToRSANecb87ELxLyMSjcZWxUaYxfa55RAJCj24sqDcUbfFPZdK?=
 =?us-ascii?Q?cnLTHczRxJTs5cIhlHranubPXaKFYxvMI0rjgL5ygfmMEMOOdYzzEKQViCYh?=
 =?us-ascii?Q?DznigEMoYxVeKsPheaUjFy9cVdS/Qxk533/uWjcvZZv7OlA7iaPMUFkHDStn?=
 =?us-ascii?Q?ImFyHQV+nQoSKDzEwSReW4aUkpsK+TnEYn6Ay9pTWYCTqPhngOz1xWRpsuH1?=
 =?us-ascii?Q?pcX7oFlA0g3XU/p0Gq6hEBk4tj3/SRScJhnY3DM+PSHmdbE+zk8sVnmoZy2f?=
 =?us-ascii?Q?gSxts01r0LxpQrZ2iEzWQA9VX/sJBFyd8ZFNt9rnk9qTrkGvztADZ/ozxNBX?=
 =?us-ascii?Q?KtygsASmffvvUvjgXiQZzJf3kh/tqrDftx3WduGtHrigVhGhlT2PDV/QYeBh?=
 =?us-ascii?Q?8P29NbQhP11AF55S17iJTYdvAsk8sm717eWwsyAJUnT7aiKpkgLUm2cvfqqo?=
 =?us-ascii?Q?EAyAqoSfQbssA8Wxs6my4ImC5+QdwXEmjpuiO9u9QRn6UHtHzxHwZny829vx?=
 =?us-ascii?Q?xA+eJjBK0xVuOR9dIb+Iig+75U0LlpV78+Y7djaDogBFUNQiLssWwuFi8GAI?=
 =?us-ascii?Q?jlpifZTeI4BwouypG8+9mSGCNNUyAoHYGlUR3L9oQLyEcrSz1Kz5P6dmYOjI?=
 =?us-ascii?Q?XaU+m0vHPcTuF5z/NRp810+df6XsNRSvcC8zuDbFWF0XIaxlp/FfRLx5N0pq?=
 =?us-ascii?Q?3TQX569EEjgVtZ8GokHmkjeM0VSjEyKRZCs6Dztd712C88XhTyTUbwNMLVp5?=
 =?us-ascii?Q?yZzBTOMdBhBbaAmtqkfWeC841/5+L+mRwZ9I76HwyfrrA+EO4yUZVwH47NU+?=
 =?us-ascii?Q?ieX9EwRVu3WA5gL67RJYMitqR2d8rBm4l4DvAPsYbz9FUfvRDuzEUdCmRF+i?=
 =?us-ascii?Q?sI4drfPFUqE7w9e2d3GfQhATl+J0BC4tMWXGtXLhuDheBSZojxe9SJ7pDp6Y?=
 =?us-ascii?Q?JDNg5QaDp/7nR8elpaI78r3auckpC7QT9g+UHj7ppyYnNHi82SmGvlopwRrC?=
 =?us-ascii?Q?bWOJgHqATs+W5yPxarvYTaSRISBlLrwYC40D2wxi?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8073e80-ede5-44b4-97d8-08dbcb1a4421
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 11:56:27.9878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FthETddwnHBtZ7YpFVEXYtsfF3FOcU2Q5hkCLc3iEk2kj1NJVOtR4nrNrZhix9WD+ViN/Og95x6NMvKHP/Owzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5964
X-Proofpoint-GUID: FTr0DJou22LQq6kKsJklEstIRm65cyPx
X-Proofpoint-ORIG-GUID: FTr0DJou22LQq6kKsJklEstIRm65cyPx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_05,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310120098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 11:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105445

This is a security release in order to address the following defects:

CVE-2023-3961:  Unsanitized pipe names allow SMB clients to connect as root to
                existing unix domain sockets on the file system.
                https://www.samba.org/samba/security/CVE-2023-3961.html

CVE-2023-4091:  SMB client can truncate files to 0 bytes by opening files with
                OVERWRITE disposition when using the acl_xattr Samba VFS
                module with the smb.conf setting
		"acl_xattr:ignore system acls = yes"
                https://www.samba.org/samba/security/CVE-2023-4091.html

CVE-2023-4154:  An RODC and a user with the GET_CHANGES right can view all
                attributes, including secrets and passwords.  Additionally,
                the access check fails open on error conditions.
                https://www.samba.org/samba/security/CVE-2023-4154.html

CVE-2023-42669: Calls to the rpcecho server on the AD DC can request that the
                server block for a user-defined amount of time, denying
                service.
                https://www.samba.org/samba/security/CVE-2023-42669.html

CVE-2023-42670: Samba can be made to start multiple incompatible RPC
                listeners, disrupting service on the AD DC.
                https://www.samba.org/samba/security/CVE-2023-42670.html

Release Notes:
https://www.samba.org/samba/history/samba-4.18.8.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.18.6.bb => samba_4.18.8.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.18.6.bb => samba_4.18.8.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.18.6.bb b/meta-networking/recipes-connectivity/samba/samba_4.18.8.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.18.6.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.18.8.bb
index c40e10224..1ded9fe5e 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.18.6.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.18.8.bb
@@ -32,7 +32,7 @@ SRC_URI:append:libc-musl = " \
            file://cmocka-uintptr_t.patch \
            "
 
-SRC_URI[sha256sum] = "284c8a994ce989c87cd6808c390fcb9d00c36b21a0dc1a8a75474b67c9e715e7"
+SRC_URI[sha256sum] = "4fb87bceaeb01d832a59046c197a044b7e8e8000581548b5d577a6cda03344d1"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.18(\.\d+)+).tar.gz"
 
-- 
2.25.1


