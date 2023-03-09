Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70CEC742A7
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 06:03:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7087.1678341825134080944
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 22:03:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=OzLPhy7m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2432b735dc=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3294RJbI021654
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Mar 2023 06:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=idocP7Eh84FhptHd9KYHJp+QJVxb2ZuWZwbuf3UUO6I=;
 b=OzLPhy7mMLa3mo6ZZUx+OcuaQ2KtucL8df7OLTzoExk1h7txtjlm4Kx2S7aclsKjZ1aY
 T4bh0WVzWyblk2UtOxc+Y2INPdc6YmGab9eno2yDwNmUuLCR5TmXs1RhDDW2SFvzcqNF
 ki3gWigzrvPOLWJmDw0uJg0cd1BeJS65U5ZTzE3QnrpGd/X86+hI4pKEhae9oDt/wubt
 QkT1BOvqJRh4lcKqJ4nNeP68xxdgDRYt+NeVfZxp155CR11KG5sJ++XSYzvutNcBZCbJ
 QFsgIGAQHk8Bs89iv1xK0DI/jH2p/UPNsGkd1fIQnfsKa8/X5hSg/2k9cQ0nJ94rTi3a 4w== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p76amr48c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 06:03:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcUofkP/0l5qYI8dsyd2Vlc2sv5XKOKimx9CL7gPhcdZ6amiIlmXBMpikiz/+lcUCpQ2KlABtRG+vubCpK3xv8MicWxePPi+rov1UsP19GQ8wwpMHtT3C6x6gY/bnN6vCj0ZPRKEcdEReROApe/P2dVuKCFdWKmN9fe+X4hJ4A9za0Jc4FwXhfKx8otezkZz8MVHY1cwJM9Ks4TbaQxEDCxvfCabAmlX4KgMBTgBn0IH6+tyMtO3Q0OfinRIenr7QRx7izFsDFjids8ZI2eB71PxiXYNMDa8oRFpg8Un5v+/MCcZFqiIGz+88WbkUOy0ZMk4k3jaeNe6JHbvaqUpKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idocP7Eh84FhptHd9KYHJp+QJVxb2ZuWZwbuf3UUO6I=;
 b=oQxlng48xgpNNUcyhJrB7obBDQcnlTa67bdBkgbL9FlSBk3mHJy/O4PpjNBrNoiNqIcDJqOYdJ05seRgzDdqEmd9SI6wWLuNNoG0OY5LMe2KCZKolyLbYKIkeLk/QqwYWCtcUOWG+P8JBGaIryOHlbeLVPGgEx+Zu3qSmHFMhkqjSuBLIiM1UJz/m4y8cJRkwXRdQftQgtQLHP76aujAHqm/JvJ+Ra3U18bhclZbzfw2JHeLiIwcMvsayhVW8ndqG99nK0+hfTH9Dlcb+Ml4au+kJdNx/0LfH441c3B1fnicya/v7Y3fztdRebU01ge/ITxj69rUs0MGZ8Brd69sbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by IA0PR11MB7863.namprd11.prod.outlook.com (2603:10b6:208:40c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Thu, 9 Mar
 2023 06:03:38 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3%5]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 06:03:38 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] packagegroup-meta-oe: enable build libyang on riscv32/64
Date: Thu,  9 Mar 2023 14:03:23 +0800
Message-Id: <20230309060324.1860660-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::21)
 To CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|IA0PR11MB7863:EE_
X-MS-Office365-Filtering-Correlation-Id: 32bf6f37-be00-4fb3-2e8f-08db2064068c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bEzYH+rsHYavHWUalhYzHceizMmim2tG55wFwga8Zrp8eAg5R1piN7na3XyEfPf+dUV4ZenVzMRthsR5AUYcsBvwJ398bnN6Q8oXfUlJe1/RhxvJMUEQe3s07iUGV+wt48AlYW+e8YJ1fonHteV3vgpFp503LeN3uvdJM1eN5F2/GvH0PFsdwPvXPFV0AwGa8gyaAGzUR4QpLU2mhEz92qixoDQhOIGNKQwwdTpMtycIKb7hCK0734SKxi1bNH+nt2F8shxcesiMwzgQIhrzsajV4X/r918QVs7IVC6DQIG8RmCyrDwDVXogpT6a8A50/1srtxsbFk+iRRjscpS/QiindRQjLeiOYyN8NS2+ESC4GBoaApM/upvvl5k8TUWjV42eHghK2WyOQug1PdBHxmTSlnxAhi3J+aLP1giscYqLALt9dQs2ilXtLZ9TPFBSlxz/Yt31Zqlvunt1HrikjjoG221klmdUe+/Z0NQxO0Eh2MN1r+lCFI7uGpxHfGSe7l9g+jcGoMlNvQzE3CbxCyTPCBDJLvD65SUbIvIDuXSfRg+FxZrb2aWA9d/usVUndB8RSrR/tu4pqTl1HDL7tSnO8If6h19CyR9EkrOtBHcs3P1Hxes1/Hlpczhfld2qBQadLoAtv8Ip5aOMOoA0ShMKO4+iZGv1kkXXj6seiwb4NUh378f7n+2fmqyMvAQ3Qh039tesDHzEdy54YUlfaQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(366004)(39850400004)(136003)(396003)(451199018)(36756003)(83380400001)(6506007)(186003)(6666004)(52116002)(2616005)(26005)(6486002)(6512007)(66946007)(8936002)(41300700001)(66476007)(86362001)(66556008)(8676002)(6916009)(2906002)(5660300002)(44832011)(478600001)(1076003)(38100700002)(38350700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JcEBxX5J8uIFHZZ4MzX7qe8hWeFwDv9mWOOB4ZmcJV+kpUg0oNAsBlummxGo?=
 =?us-ascii?Q?FD8nkEUgt0MNimZmIucGd1/79GAOoybhhMlfdrv/JxquyRjrx6uJlMFRtnsF?=
 =?us-ascii?Q?4J22g7OD1snKr8Y7GED9UL41jAf98KyqqkBebUKWsPsOMBzY+xxrb7Bwbglh?=
 =?us-ascii?Q?eutyhsyGXU4Hb+Rc70AQ1unkAcSkyCGjiuczWx2ZMVdhLqnES6nMmdAQ2ZKW?=
 =?us-ascii?Q?zFTO1eq8UrX3BSd2LbPPdkSw3Taff5NCxA7ByZVvramPFbRfiOOTVLtttXQk?=
 =?us-ascii?Q?ZbwaDVkwGhAa/JFbphOMuf2r08B9PzJbbBUmTMp+tlakLojk5w907T051Qdr?=
 =?us-ascii?Q?hvfMwwMYrY7iN1sBNDX8b4WWzqwjgbQTxGjtbvMUP1itGwxNOUh7U9/IXZUn?=
 =?us-ascii?Q?VhS6gWUSkOLqzbOcS88afgeGlwm2srIwViLXf2dtAlm6MNyhssa+SmIZuYtD?=
 =?us-ascii?Q?/7w61GnD2zIv9Zk4BtfyK27NnSpW/tKAMxPfPEbR4/VktATGz1ROVhQfLHyR?=
 =?us-ascii?Q?j9gjUTbpWEZFjcImBUf7kUL/ERu6R4Y333gEnABJ8xcCZ3zPQWfJRXtGq78j?=
 =?us-ascii?Q?CnKObd1ykCmWvko6L9pMGywQ6r97JnbTeUZQuOOiP8VFGWHlJ8Atvdn0FVAl?=
 =?us-ascii?Q?70DL0oMx/Qqv8fUwlFIiXo456ZSrCLy25wxvM5I/lE0QvFescMZlcjHGy9p4?=
 =?us-ascii?Q?t3tn2LoDZUog6hzl0ZsVvQlWXTkwg9Vzy2TSd1MipKuq5eUENdEQNsAsGcpw?=
 =?us-ascii?Q?nQ47x9OAxFZi76JSn3fxhM6VsYs5Y6O4fTSaUdZ5AMC9/vpYAN1hdsteCBPT?=
 =?us-ascii?Q?bBkAGbaSBDEbraveEzT4oS4N1QwuDvpGjErdcHfONGqheDH8qO+VdrtzUSUa?=
 =?us-ascii?Q?medvw1SM24kbtrfoqzBzZ2BPU6qlgWbJgmkV2R57ddVEpTPazpFL7rpkCIJl?=
 =?us-ascii?Q?pRnEB97cJKHoBeDtow3SnTwqo2kEscyUkPbDUV/cdyWbBXrleNnPD03tE/O+?=
 =?us-ascii?Q?UkqbygVbUdmFJZraE3BR2J83v6OV/NpLbYySU8BBVk6SqHAG0NDVElP9gIlL?=
 =?us-ascii?Q?0iFbqfI5PKVWSdcnDA3o9vvkvKtNCnQVQ0crO/j6rzZzM7+u4WuuP8aUCWFd?=
 =?us-ascii?Q?U38HoWV4Xe8mA6xQ+RFOfdHaPKpES7SBurC5Z3WlZnbx3JgnabBkC7+ZmUP2?=
 =?us-ascii?Q?PB4mZcvTm8MMuwL3fdb3bw7BXqiCTuS/45EBMES8LVE2nblXa+vZoLK1zj02?=
 =?us-ascii?Q?AgbVCU2te/J425Qd5qzlfunuEBeDVXV9FGIKqTjGT8kr1fOirEePIEotAnnm?=
 =?us-ascii?Q?ONBKrxiqcPYQQfcy1/i/02Jh6qnzanWQKL3Qq8qblyNPw0WFaYcHZe59xmOR?=
 =?us-ascii?Q?K6h5zr1evYBmKa98oOLJy3exSDS+HJleGjvO9hZD3IlT8Lo4AVWu2p7JUXCl?=
 =?us-ascii?Q?EkaTAuE1QNTd0zl8laTvFH0SeOTYOB77ZTnfipKHGjsmMlVHga+y4k1/hpW5?=
 =?us-ascii?Q?yOvaL0tUN5YccCbr4z8hxd9EeaJzPEYxtIEcHF9QlkKm0EYSQzVhzHqXBJHN?=
 =?us-ascii?Q?LvwpDVQlfSQ/5xDLxC0eQZG7X9rHGKyyZJWLdXG5ckrHHlH7iGXEM90BUaBe?=
 =?us-ascii?Q?rQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32bf6f37-be00-4fb3-2e8f-08db2064068c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 06:03:38.3757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kWXonijyyh2rjYEMu1/u1jhsvOXGTVi+K9o3ByWEcnXQ04UPmHiJpjYBVMyXIOLi5gAvQ4YL/B0jwlU0Uc2Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7863
X-Proofpoint-GUID: KSp0HGnu1bUjpjhF_BXJC-xylevrMWHO
X-Proofpoint-ORIG-GUID: KSp0HGnu1bUjpjhF_BXJC-xylevrMWHO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_02,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=462 clxscore=1015 lowpriorityscore=0 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 06:03:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101432

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 73465def0..318872512 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -448,8 +448,8 @@ RDEPENDS:packagegroup-meta-oe-extended:remove:mips = "sysdig"
 RDEPENDS:packagegroup-meta-oe-extended:remove:powerpc = "upm mraa minifi-cpp"
 RDEPENDS:packagegroup-meta-oe-extended:remove:powerpc64 = "upm mraa minifi-cpp"
 RDEPENDS:packagegroup-meta-oe-extended:remove:powerpc64le = "upm mraa sysdig"
-RDEPENDS:packagegroup-meta-oe-extended:remove:riscv64 = "upm libleak libyang mraa sysdig tiptop"
-RDEPENDS:packagegroup-meta-oe-extended:remove:riscv32 = "upm libleak libyang mraa sysdig tiptop"
+RDEPENDS:packagegroup-meta-oe-extended:remove:riscv64 = "upm libleak mraa sysdig tiptop"
+RDEPENDS:packagegroup-meta-oe-extended:remove:riscv32 = "upm libleak mraa sysdig tiptop"
 
 RDEPENDS:packagegroup-meta-oe-extended-python2 ="\
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'openlmi-tools', '', d), "", d)} \
-- 
2.25.1


