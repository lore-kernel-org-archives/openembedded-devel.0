Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0393BC352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 11:40:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13076.1670413228096874875
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 03:40:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HY2aK5Xb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93402ee8fe=zhe.he@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B7BRnhT018588
	for <openembedded-devel@lists.openembedded.org>; Wed, 7 Dec 2022 11:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=Nd94rjxlQAOyfH0Ey4OapXF+uYEjhZgmU6TedXOL3bM=;
 b=HY2aK5XbyJ1wvo9AfzkGMlwAtODgB0bhVoc8G8hgR4+nOxJwhElPca5ho8D5fDXdhBdp
 gFj/3/Mxh7nbIAAwdCfiZRTY/6J3/G2HXeDhfY4wakZ3oqSgRPWVNgxmy5nMxak71zhv
 wX5kgeuC849lDeK3fZfRvjK7yDTMJJd0MwVGaCzASoU/J39EHz8tFKMWlTDw1wOv6Lu9
 gnSTNkGgabzfjy67gHOPhw9HIiLNTcSp6GpXulh2j4CSMW27IZlnv5o183aqLfZC0xRD
 ZJc/K8h4Np1eZZzUvFi8eSJNWqQ1FmNbKgoQErB5vFOA6ZvoU2auY5LkOk4Ia7eyzAb0 Tg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m7we93cgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 11:40:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDkeWp1tF8pFLkEdZgS8sZDI4x4EcZdlCXf0Fdjt4yfQQZUKye9a6YH+sN9Tv3U2HimsCYd8QD9+LTeywbosj4nV9u+M6XuLlvkUnj1PxdzLJjzQU+k0Jfbo25x8oihH815LumdJs+bOgMRUYajBplhDsgPpyguKr21HUMoLkel916/vH2izfcrSmysL4tp1JRe89j/IrBqdl2ex04SGzJYe4rk+3XcEWs3xTOcuTr21o4hwNJJYWEZFoPVmZeHkclvda9zBjV9zm+brq/G30Z8vzgZhtZ4wKd5I0dF19jHE64KxqfsOFmAGrvsZnfh87f3VU2jsVyIINGI0KLSdEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nd94rjxlQAOyfH0Ey4OapXF+uYEjhZgmU6TedXOL3bM=;
 b=QNFbgbZZcnEhDx7JhfpgK/qOutK90Ao4zF6ZX8n4msS/shKJHrbP4rcIR2ZscjLMzltCSWVc8Jrfbsud2/ieQema9AsK+QNbEh3IZSJeqSlUT54FGflSPPWeFML0ASEFLiyEExraN8SD/KbwXQW6JAwJL4jIbbOhQDL7XRhTulzaHzkAkL10CUkknfUru6T1aRxup+6ETb6EqAH0w3fj8kum1DCPo13z6Hu9y5YtUJiQE9dMOJbhfTBH51OOMeu/crFAgtlyHCc1gCQcdim6WBTLrc4G6bnkj94/hK5IawzLsan+EHHFXjiS2oEFBa7u6edc665eenDgzlpMD/wXgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by SJ0PR11MB6742.namprd11.prod.outlook.com (2603:10b6:a03:47b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 11:40:25 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::dfdc:1e8b:daa4:455c]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::dfdc:1e8b:daa4:455c%3]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 11:40:25 +0000
From: He Zhe <zhe.he@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][kirkstone][PATCH] protobuf: upgrade 3.19.4 -> 3.19.6
Date: Wed,  7 Dec 2022 19:40:11 +0800
Message-Id: <20221207114011.28123-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0184.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::8) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1358:EE_|SJ0PR11MB6742:EE_
X-MS-Office365-Filtering-Correlation-Id: cbeb92c5-9bfe-4c6b-85f4-08dad847d4c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YHZVlColS81dEyub6GBCzKrlHWeGQW5PIrOGkvYUPv+GehYKnO47oX50EcF3eHsOiX3iboEcusCL0dJB6GsXZhaTqRijx0EPv+uq4Was/9oZy5oYKVclO952HEjfQaqFgExDIcKNV0zXTpMKAg+RL/wg6gx9USHlY57EUlr1/GTRrQWsg0vufLINste3bXObgPdNI5H4FPhN5g+5nhXSoQsEDz2+sZ/YXy5wymuyyuPXBe6KZoFloPjVBAmymttpwHkY4QVnBWORutLCDuirtbC5uBEnFJ2hASCZugsZI+5Wdquy7HrAChLpES+w4sl5yMUGkju5oxgM2l3H3z2u1R0oISK1g4Mhv7J6EDX/LX3JDLvRdtQJO33VCTQhmqMnW5ORjULVMVrDdBym4QMDIQsVZE6Ur1bWi37RDy6pZGHOe2gOdQAO9j4xeuzf8Wwa5E0ebbjy7venSLEX9oSjnq002mzNJiBrmD1nHl3wITd81ou5XpU5+Aug86GzyRuSUPJ55p01n4xujOGKbVS4dag+GIcPndfEkzZKUuv4DTboHZGmVIrDMlef3a0gPQvdd6Uw5IeCtfu1bOhSYuGz1/pVcWiLQr81CYnBTmKU3m6E3wH2fB/eKnaTrfUIBYioV5eHWliXQ9DfwJCDdFoz1HZEttEghzsVVneeIK6uuoxuhm44JOCnsWizqWD2CwJk7MhdkNKKz1dLZjq8tD5SXA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(39850400004)(136003)(396003)(376002)(451199015)(8936002)(83380400001)(5660300002)(41300700001)(66946007)(66476007)(66556008)(8676002)(2616005)(36756003)(38350700002)(38100700002)(2906002)(6666004)(1076003)(26005)(6512007)(86362001)(52116002)(6506007)(186003)(6486002)(316002)(478600001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ROfR+/df8ve6wVMHelZPtcm8wQ3EKn0ryRw9T47GK99kb6w5eaGVoM39OQuQ?=
 =?us-ascii?Q?X6cwNXZpLt8cv4fFOdyFF6+3e5/WjwAU4khcjLd2WOxatmJYlr5JeKQWQXLo?=
 =?us-ascii?Q?2lf/Malo11KQEwNN7eFZ+NUpvdUEA/5a9KhkF9JjjfZbixrPI1RDLpVSLuus?=
 =?us-ascii?Q?365DKqY1NUjxybnnUCxTg//Wh6XRppvlR22ueLQb4UtoRAfwKNK1kSKv5LDS?=
 =?us-ascii?Q?0SWk7Air56VVkOM5498D6NK4ekP4qwvgUqQBSGqTKSy4IAi7VFG4XVIdFfDQ?=
 =?us-ascii?Q?mhF3IAWkJr25i7s+AP/hJdc7mwHsNQKPR4Xl/I5QN7H+lNUnwh7bttxZ5NlD?=
 =?us-ascii?Q?4etqkO099CGvd4O/UALkC4tfIhG/l04j9l6il1kdFn4dMnI0iho1Z6m72InI?=
 =?us-ascii?Q?/1qQ9w++Sp/5li5YUW3E6Hijq8StUNdadxrp1NkEj05CnnUyToxcqE96AW1N?=
 =?us-ascii?Q?Kn//YbxEQchbl4NPfZBmrEO0PZqKtQagHHmkK+soj9UkTrXbyg8Vgxpmnc41?=
 =?us-ascii?Q?WT0HxSjIHSYvIE/S577MNuhpBfcCMWdihycSe3z4lfbL/IHyBLG3JCNbxnKX?=
 =?us-ascii?Q?5MKQ9JGvwm6Mhbr40bDe/PYm2mRnQfxefolB1CQVwYAdUamMcLa4GVaH+a1u?=
 =?us-ascii?Q?vyUJygDzu+PgpLVK7Dz3L8nu8eoytA1eDAzXhGxbIf9+Rz0IRNsocbbD/639?=
 =?us-ascii?Q?4j9Pjm7KANaVdnj0uknyIh+YNlZfQ4kQ4PqNilIawNeEJsJEhXFGYBucnRoE?=
 =?us-ascii?Q?tmhgXv1iJ9NmOSGSSe1gHoEFRRQnsHaJSlGuVRzVg/V+EFzjdvsp18WQApgZ?=
 =?us-ascii?Q?EZvCK8swkBAPHhPcfmpg70cqm56FB3erwIhKsK0d2sQTMJP137sySCbudL3N?=
 =?us-ascii?Q?fGxR5JsSvMgVpvXZoRX4729yawoYkCw/7l1I80mFvkaTqwiHPaup26N7Nsn5?=
 =?us-ascii?Q?9fi8427mvPDcyLpBDUuHMINtUoVUbyy0E41B+OP4wp4Q5qPxpFAMEUsaCmo0?=
 =?us-ascii?Q?w+Uth0zP9ssPkAzucxaasJvzcKk58O8pbynWTgYbWniT5DOuzzDbH5Ho5AZP?=
 =?us-ascii?Q?u+HJy/J6SjcSBDWb0rZ4mofwx7wiDULrrHoiv+wOtSHRVdbWMIYU+L89iFW8?=
 =?us-ascii?Q?OXIpSBhRM7BaeNwZTV00ke0o8FG3cy+8D9tQDj9AIRB2aWMj8BN/Om2uTRqW?=
 =?us-ascii?Q?cT41X+2x2CbKhBUifHdkNkHHCGwP+8U+wvTwiej0jH3JURj+VyiqCJe60pUu?=
 =?us-ascii?Q?uEvQNJJ9FdCBdHOsRlzrBGETORmyt58pG/vkkq0kBePuyubK6/mEja9PwHua?=
 =?us-ascii?Q?a4jTquXe9E0FYq0mQbFtPaBbFfSpoPaO+Fws9HmFTMTc4vO5sfEjqxPtuWBH?=
 =?us-ascii?Q?1KUwEYkl0A2pxAI6N3T3uPzn2qZ7uZ22k2Dc1ZpTOGSZ1EEadLcNxVDT1fvd?=
 =?us-ascii?Q?FRtGlGJYc7beeDNGsWYFToRHvd/U/nOKbsftUTX/LM0OXAw5kILJNHwUbmwt?=
 =?us-ascii?Q?TpXYW0hL68dN2DPW9MGltDPe8bspWIMdf2KQp/+VQEfEA9Lx8Oio7pwKJoID?=
 =?us-ascii?Q?ppB+uISWC13gSgtG00tiggwj4t7T0cFueZnacO8x?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbeb92c5-9bfe-4c6b-85f4-08dad847d4c2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 11:40:25.3423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1f1c3rFnrNihpoulU3cWf9ezStG9u1s34hyyonGjgKA2s+IvFYNglw6zkfcTTRD5lfFUc+3u9WwBsFs/gvKaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6742
X-Proofpoint-GUID: uxdxYTOt1bv8nl2e85LWUl87xcTbJXEb
X-Proofpoint-ORIG-GUID: uxdxYTOt1bv8nl2e85LWUl87xcTbJXEb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_05,2022-12-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=667 mlxscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212070100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 11:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99974

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 .../protobuf/{protobuf_3.19.4.bb => protobuf_3.19.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.19.4.bb => protobuf_3.19.6.bb} (98%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb
similarity index 98%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.19.4.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb
index 566233084..8e5005471 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.4.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "22d0e265de7d2b3d2e9a00d071313502e7d4cccf"
+SRCREV = "c9297981b7c35ad9c2bf258e7c8d786a04d13378"
 
 SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=3.19.x;protocol=https \
            file://run-ptest \
-- 
2.17.1


