Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6219C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 07:38:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.36237.1640677111173101635
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XV/xQ1il;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7996075b3e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BS7XYB3024643
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=lmgnzKpK8sTr+tBls150QJmxLUekskQUkZ1uKeYJdZ8=;
 b=XV/xQ1il9Qb1Kzp82lM0ZpOn8es/TrIKg+Cly3+ns4o5WZAlcqbB2Fet6M0lTMRkulNL
 7v3tgh9NohKt5307WGzu7c15DZXytmmyfOaqmp0WOJqjJt/FqV5+LYW1jORv/8Voyi3k
 iDSKGEI/Yn7OSafvzFKDP/2AGjp8D14SReYI8UdxaJzETMCxYTarEMG5Lzff5MQn1YET
 mBSTc2vHzJO0aOnCzugpPQyJ9w7nbKQNQxB2GusAnX0yxgXarIIF5bu20qPqlMsbjo2L
 kMaA6cNVaRb3TBsB+QYxHw65pebdQUDwJPgx6Vix6gJT7ykv93iJaujCgHpwZ2asJizR WA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw88nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:30 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BS7cU2o001285
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:30 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw88n8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Dec 2021 23:38:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJtCWLFT3eJHbxaZ5ED2J+HRzWgxF4dodbKaLKOK0AmwXPZnpqLa9+4VFBqcRyaUwxhlQFUUsZ3dpuLJa15Nm6/Dg/cySyx2b6ltApeSdMgohd84WZRXcuRoyJOz9M/Ph5OoKdMQSMSr9dJ8vUspbamvvlf9MV1qssOiEsmxAwihiV1DnzwnXK0mUTTGEvGnsTXhE7l/0t/SCE3q4BbKlWJWU3dR5wsqj65evlvh2yFk4mvZgxIA98gjB/vVOghpfRBiA/TP1wg0ha0t2ptdyt3REB2d1eij7KtmzMz3tOOn/nGGEf026sQ6ziXDqWR0EmhGb7/hUmaw7HBL8uIJqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmgnzKpK8sTr+tBls150QJmxLUekskQUkZ1uKeYJdZ8=;
 b=LTWxytdvpNCeRpPAJVqgWxA2s4+oJWHEsL0az0ecGFZx2NuD1cTtg7RKENOui4+E+bPQHrpzX0HoP6NB9EdtHZUITIrlJNYSU05ZSD3QNJgRnZfYSNmdeLv7kL7j0CRYFmDCiqopjU+9HQ8GO+Aud6wFaQa3xdvZkBDy933VmUmou+iZ3olV6UibqxUWI+Q5rcc8zl67aVeAbyYf8+AeWeOSVk+ljlZpP9s1wNQ1LCv8T9GJu3EUfbgbeQEta1QSx/Jq2rlZMebJYD2XMmFhu/jtI0VVA7EIiNNgl8PslwyWDVQaoA/OjuQParZPknh4R0LVwkSTabMunJubPD8TSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1584.namprd11.prod.outlook.com (2603:10b6:301:e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Tue, 28 Dec
 2021 07:38:29 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 07:38:29 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [meta-networking][hardknott][PATCH 08/19] samba: Don't guess dirs for
 perllocal.pod removing
Date: Tue, 28 Dec 2021 15:37:55 +0800
Message-Id: <20211228073806.868759-9-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228073806.868759-1-yi.zhao@windriver.com>
References: <20211228073806.868759-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3158e8b0-4744-454c-dae7-08d9c9d50a50
X-MS-TrafficTypeDiagnostic: MWHPR11MB1584:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB158492778EA11DA50B8945EAF9439@MWHPR11MB1584.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KxFgvGzl+U9x5TmrXwabG2OaZ511AKc5LpnyyveEcF4DdFfH3EfqUMESTgqulMYG+/f67dnnz9fy+ZkplkLgPi0Qdw8rdAYy3/zkWsjiy4Nq9f4zZTelC2eoY5tWL/B9r6/JizakrvZMR9jO8YY80RgPNJY/tyTfXBGN5iQrrqVktPPyNrdOHHxD9nvEaFtuRyhcXUQ358KHDK4xOBFdIhYGh+YJ1TOiKfmNYotaKEW/grvFICkwgDl6y7TslNGOz49X0e44bkuXyUNTWVlQIIZB0+FCpGA7Gg0WvblFT2izoJZ8wlpOh1A7xRaoD1c4RIlP+czVCwbn26ncaNmgoeXOvpGjVALbw2T4kMCBnKZ08zl96wFpmoYY2FxGkGc2b0S4qxu+LUgDuxyx3fV1y7s1+9MC5H1hs2zijAZqCy3Jug6cYzFdQC1tUD1Ze06tkPNF2Qf52Fzk1pmDtyvEHosep5JaPDwJwENDDFQaKQX1MZ4XJCAEiY4hZmn7uQplBn8IC+yPmQewGDkhQnB4UWqiQk8xazoKERXnMs5EkhLShCN+ltnmkWSHHxfXtWtg+kMwlua0GCkTAt/8C0/ZZcCY4owbpEJnjptX/joEdPyhOl5s/oFCcrsL6q2Vk+CJylJDf8W71/hlKt2s7Yr4N6j4eBnC+ONraE1CJjsT6NhJNCzXdIVzh7BbUfxxnDxxkmgRHhsgpRw8o41Sh/sybA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(66476007)(66556008)(8936002)(508600001)(83380400001)(2616005)(44832011)(36756003)(1076003)(6666004)(8676002)(5660300002)(52116002)(186003)(38350700002)(38100700002)(6506007)(6486002)(6512007)(2906002)(86362001)(316002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n7dwfB7xSaLIqb5PxuBgNtOH3bWegTqnf1BXcOWlEnwjyVRixQY2RODsJjur?=
 =?us-ascii?Q?R/RXXlGoWFqJed8dZTQMlh5BUhtmfq8hFD5Cum9mL6D26yOB4AlGjR/lO3eS?=
 =?us-ascii?Q?5hqD8zG8dgN+J82XY+w53K3C4QUcczWMGX4t3hYfyunYPP5VHloEAvZb9YIQ?=
 =?us-ascii?Q?9xzi5LFAY+ZlIFix5TUzKiY4T8W0qTWpvt5lUmqd/AsK8XSecQeJZR5ZcNTI?=
 =?us-ascii?Q?a/k3izgwc4AggpPC28ZY+OkT69LsaJ2kgT3HYS7R4IjVz207/OF2lpwWJsYk?=
 =?us-ascii?Q?lYCuBTK4vURB0ZNHlXtdpTyLMCxbQCDHxgCocCDmpyw/XxybbdSIYmEgOYzz?=
 =?us-ascii?Q?0AeCt9m0emj3VOrFhcYQhzVKvkp1kf77Kiapp/WVz9wwH1WCFnNhP/NmGWoi?=
 =?us-ascii?Q?Hdt9Y3dZvXDuf4t0qbke7JIgk3yWCp/aWQ+DUhTI5YoN2kURdnbXm8ZoDYk7?=
 =?us-ascii?Q?gxckIcspPgmOPxNLXmnuW7BhmYDIxZhu0C852iVIKrVbhwNUnVjy8BD4l+xU?=
 =?us-ascii?Q?IFwHHVboHpHp+keRcxPISL4guBlneCh5RxlxsRYhoJR+6ReJCFGajghtuGFh?=
 =?us-ascii?Q?3vK+sHEs60EIAyTbI7qXRkVcDOkUqVZ/O554Hn+THdfporkqOl7nHa2sm0pn?=
 =?us-ascii?Q?zL8hqJelfvXpy2PTjCB8/Nk8xy1qur27bUYUToCY3mpN1xCYpKvO9G+/Ix0O?=
 =?us-ascii?Q?O6jFsXIbFdetKNhKS52Fb3KXs/SzxtvSHHKHSZSIjoTAl88VJklC9fM8i8sx?=
 =?us-ascii?Q?4wjQEqW6xjvSzNZVBY2UPZ9v/pqwNaawXUrj6FPD/OA8RdgEUHSQ7gXAzIkG?=
 =?us-ascii?Q?uslDVSn9nEWEazPV3jUEU0aGkQvObwuiFlBIYrLJLao7eK0y62ecXdTjNPZq?=
 =?us-ascii?Q?F+pBIzpdfkKIMsiWEDkVNo93i61nRbgQ2Y0MOj4ogN1+BiK7vRNRw8Y3GTLm?=
 =?us-ascii?Q?CsT8+vU6m50H3vvTCmYCQCBhPxEdK2wK6Ico1Di8WGyr9zx9w/4vrS+lW30w?=
 =?us-ascii?Q?/dw/8D4ipvXnB/2uOPz+6VRbfN8vKF57EfnTC8xd/jpvu1K/pEg8hKTbGTtU?=
 =?us-ascii?Q?e1IbSte3+Wo9zhoV+1TiI3itSl8imm2lhCJOyfAE19UBbNuP3rp9kVXnrk1y?=
 =?us-ascii?Q?kNrA4bwVpeuuVaUlSOMlbXzRy73dIYoTNN8bxywX/FWVNKGIcmQpPZL804GQ?=
 =?us-ascii?Q?KJoe9nZnRqUZbkCdVOhx4wCcwJGTlfKwn6XpTXbVJsXtao5j7SWDM+7qQFVa?=
 =?us-ascii?Q?LEIsawm/px2UA3itxb0ttNYIfsXgq/LlMczmpHx5owwYAUvivJE02uiCOMwj?=
 =?us-ascii?Q?McfRyp9lHuRulnQRUN1tipC1PFrFjCw1gbDlFlsnEKf4JHieP5L/V8gzDnRR?=
 =?us-ascii?Q?ogESNlz9J4wpvdg9XfKZAJCW2q7TB55vJw9tZdJLe5k+JswcQHall0bC6k60?=
 =?us-ascii?Q?r4AMqArJ+59gXrAw1EWS+Q/f/erDYwGq9MPd0J/FrdyBKHHw8e2mujcHNcvw?=
 =?us-ascii?Q?AIQFL6UY4I3jQN0cyuVFbUBeLOIryRks2G9bUpn2EiDejHzs0PNqC+JARxZ1?=
 =?us-ascii?Q?UPFkh9bojnszTKS+SbIDptWi7Cn1uWllwl5DUYgCAThwqZV/OFuG3xm2Z+j9?=
 =?us-ascii?Q?8NY4RHWhANLlcwxCN1VVsJU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3158e8b0-4744-454c-dae7-08d9c9d50a50
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 07:38:29.1040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 iDSRmhRWbaCVoaDiCoAmQEqJTU+18qLYCOCaD7AHqgKtoZMy5W8fFVd+DEcNIpoIcgoOidzYsal8T/5opRnOJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1584
X-Proofpoint-ORIG-GUID: frE_Sud8f9ZgQqgtXAlAGCZNajNHuv7E
X-Proofpoint-GUID: myb1S4xNuI8PAtbQnabUs5pBsCApzpM0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_04,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112280033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 07:38:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94535

From: Persian Prince <persianpros@yahoo.com>

We're not living in a perfect world so avoid build failures like:

ERROR: samba-4.14.5-r0 do_package_qa: QA Issue: samba-pidl contains perllocal.pod (/usr/lib/perl5/5.34.0/x86_64-linux/perllocal.pod), should not be installed [perllocalpod]
ERROR: samba-4.14.5-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.14.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
index 82108842f..018bbf163 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
@@ -209,7 +209,7 @@ do_install_append() {
     fi
 
     oe_runmake -C ${S}/pidl DESTDIR=${D} install_vendor
-    rm -rf ${D}${libdir}/perl5/${PERLVERSION}/${BUILD_SYS}/perllocal.pod
+    find ${D}${libdir}/ -type f -name "perllocal.pod" | xargs rm -f
     rm -rf ${D}${libdir}/perl5/vendor_perl/${PERLVERSION}/${BUILD_SYS}/auto/Parse/Pidl/.packlist
     
 }
-- 
2.25.1


