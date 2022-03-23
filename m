Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD956C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 19:45:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1794.1648064750783792003
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 12:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=FMy/DyGS;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=00811796c1=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22NIgL45018336
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 19:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=OGCYNJfStE0LVMuWvNt4LIBfEWfTEy409wPXcHz+AGQ=;
 b=FMy/DyGSPShy16jjnf2p2jWESslTsQ97kNAE4QJkDGuJ0E30Ja5AtV7ugfXcoIic3gFk
 O+eFXvv4zGoOBipLlMIBtRS41UzrdzOo8DZWoLpv4XReZqh5DCFHXCCXjaXqxGikNEx9
 00ZO9jnjzKLYM+gXesrG6+BOZSGJz7d/vsCh0iakS8DknaHWv+z0MbuyS2E82QJMadEw
 IqNSn5qB0Q/0EXBE7FReZqiV4WT2pnQxtbVqs/66ni+z7Eerq87vabRdEOqVHCJYg8K1
 HKY8I3omG6ixvPFriEK3ur1LeKqfiqgvVf3GRQZrrqWvE36jrENkryqLfLJotYR1SXeg Hw==
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ew657bsgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 19:45:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/GUiHrtucVhzYeluZsR75SJQTzq+xr5PT4IVMP8YRS8waFse+QMXipOYTa3B++Ze88y2wU1E4pzPVrubjLxppOZsLMIvixdNiJP8q8CXRxIDribqCLItYd0Jq1E9kbqUN0xTy/2tWdYIs91x/7IvIkxWxm1t0K0aLRXn2fKAPjDPMqcZAXNcPX+b6Y81Ti8X5bdmD6pIZNAf+UzA71To8STkSRbSSXDNFserYbTltuD4JsZHfYrf8kzbGE1ql2AB8czuPbgCr5pH4m/UT9GQT3hx3yqFvncUnPD6yc6yegtYIeiVKgYbEJFnt/P8nu0THtF+HPDG3nGmbvMXI1E+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGCYNJfStE0LVMuWvNt4LIBfEWfTEy409wPXcHz+AGQ=;
 b=OC5a9Ybn2Uq6Q4NLHI3RF7NxXmpQYEX07Cx37LZjNk7do7xuwhEnxnJwbCVRqkaYLrxhSWn8uT7wcGZgShS7OONeILSDjP46mosy/W2ksnOkZ53vSa3L58O9Rouybx8KWW2lV3mUPfVZz+z1UPHrBt88tdg4JbdtG4l/PY9PfAfsjlWvmJLdkXpPvFz0Ur/yYKe5VYsoG3b6DC0IiIV6G2/lGm/q6bP4aNPa9viFkgzvGUmOIuGqCZ0QrI4t6yICuYLM6H+Gn8msQ2vgjkbc/DTYllZlP2ss59xnvnk3Me0nIYE+7Zecica380F6lGja/1luFKPPcO0ocSRD58rBUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BN6PR1101MB2308.namprd11.prod.outlook.com (2603:10b6:405:54::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 23 Mar
 2022 19:45:47 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc%3]) with mapi id 15.20.5081.023; Wed, 23 Mar 2022
 19:45:47 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] grpc: upgrade 1.41.1 -> 1.45.0
Date: Wed, 23 Mar 2022 15:45:40 -0400
Message-Id: <20220323194540.4024812-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0201.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::7) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebae3ca1-0912-4aa3-5f87-08da0d05ba03
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2308:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR1101MB230851AA42FC168CB52755309F189@BN6PR1101MB2308.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	idpOu93L2VAUJAp33OXiJHH8Gps8se1EiMHYBMbif+r/bZXFsJ1BPskgXbc9bdNZ5i5rjEs8nMUBFPCs3syU5Fh/mh8J4qPO9jNzx0MLCOWhxIr1mrWRz/un72SaLFbxVjK205vLzwziATTfs2rBdqFr2+1xqTvHyHvTQ37lzOd+xI+DgS0LN4K02rXTmQPBoigIEbxcfv6AVNDFAzTK9JP+51diId5/cXTEi0Clx8nHfEFHtmiWlkb28kOWYdfIT7QOuiXBq9DblSsQ4tyR1UAXGXwUNkI+aIwemqOn0WsGOnPXSABHyDMdS9kR3x5+laZbuJCNEaTnApHCodA+sSSXdEWIIw81AgseC9x8JfBzWu7toMsdaqVsj0DdoQjwGjrJphJ2pJknYzBe9T/rHIOprecwdEx/nn21miJ/hflYpi97Rt/kmVBdvb4PzvcL/FgquVpoK822kMiPYwWJ6mQ4yc+xe47m16u/o2iXVhDQWtAQUFX7oVoDZFPNxTzUmg2KYDRxd0QvgkXodFcT77GtqvxZWm5rrG0Uf/dfUcCgWvpVrn10Gs3IWf530wzm+zfTSRvx+MAuPBrCRMM1Bs+iHOfG9yBT03BizbV21OQjc+qBKa14Em45/KPFlunl5vSAdLaPg/sIYfGaNr2q87rnNFMOK+i2T9cRxU7vimXK+33E84hAyq7ie4zsXz8Yah/uud1d2xrWXfbOyAVkB5WP0n/B4ju4uwriRmQuI/wQRuRskLwoPJDQ0HApqzXZUN7K+fC3JDPlVRzwMg6i2+aQNdq7TnZwRByai9KzP89YtaZ7jv8DpLhBDMpDPi4N
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6666004)(44832011)(2906002)(36756003)(26005)(186003)(508600001)(38100700002)(83380400001)(6506007)(966005)(38350700002)(6486002)(52116002)(86362001)(6512007)(5660300002)(66946007)(8676002)(66476007)(66556008)(8936002)(6916009)(316002)(1076003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0qGhh2ynMbxqQohcbLCgs9Jwk2CQJnZQd4jFz/NZ8qx8Exvyq8iaFHuIK974?=
 =?us-ascii?Q?E5NlhI1RtjMj3XFDMF9FHtXSlUEC0AbmoxWsxd2hFUxQmm+oj0URQJ3jEwTY?=
 =?us-ascii?Q?i9DFmiahmI5mJdPJ6IKOBgr5kUsNz7/WSKN7zvH8S2Yem+CAU62AgHdCnxTB?=
 =?us-ascii?Q?IC/qn/i77oBQLXfFBssxtanNoZsar5AGgHsg9ZEMdgTqUognFhK8I/OWgqIX?=
 =?us-ascii?Q?k6aKWcnMceocp756jUxA7NiSAGVG2dD6cJDUo1SmIEFoLTSiMQvYaLSjePCq?=
 =?us-ascii?Q?SOh/qxeXR7hUxDHGCabixaDu5XlXQGJX8zacF3rBIJWw+2wWsu+2NX5ZYZnz?=
 =?us-ascii?Q?bTfiA1AKtSb2xs72H8ANJsq8g5uLPuSxHawLjvTYp5jSP1DgMf05EKq/sy17?=
 =?us-ascii?Q?q1NhlnzX6kTsogj88N93h0BgZWGkr0Jwdh3GhjNFfZH0sPILvxuFvqTd6INS?=
 =?us-ascii?Q?75Dm7uhWqWD4dh2LGuLe2J1+Kw0T1GGzmrvxG4Gxrf0HZhcdL6uNEI8VHyS6?=
 =?us-ascii?Q?6qf++h+SrgdOvmDu84UBEBVwnZO5G1lVQGP4HYVEHaR+lfudLp4/ZMhS0kFl?=
 =?us-ascii?Q?hPAGuSeBcU2lMPH1nXQyQvJSt381Dy+OP9V65ekfg2FCvdd0wB0yZ7i+CFmT?=
 =?us-ascii?Q?8iT7uDSHhXe3ZPwDfK62YoguiNfx11kSQAuUoTxRDjzOBOZmXbBAADX3QpAA?=
 =?us-ascii?Q?WoSA9oe0ON3GWYKV9QILjZLtFG4Qkfk4Pt14uSo46UWb82yuUKKYudS3sz7F?=
 =?us-ascii?Q?gvEgsPcBXOZGod9XvSLUlP5m3pvjuX18bDwhe3u7myEKzLs+O24hyN3MB9NG?=
 =?us-ascii?Q?cKYyJyhpMf/netVHPQc2vfGLCRt1t2h7p4IvHYbheQjeyURQPl9A7Dpkgydm?=
 =?us-ascii?Q?K8hWVA+stH+1ttr79Hv0Pj3MOi1+qkELWkVLPvERQ7+IqILznKVenRIZRXxQ?=
 =?us-ascii?Q?9mWb/Y60IOmCjYEHpPC4jWTuUMxMlNI2stH0CRP/P7FaucHpKxPRatJTJ/DJ?=
 =?us-ascii?Q?/4PcjZrm4QU5P6CGsijC1FzSW60+DiWfvR+1t89uT1ibcktUDhk20kKte32J?=
 =?us-ascii?Q?1NJWqdsqbwjB/+sel44s+ASKxH0ELmcADzJeUND7VKi/k2MYXG9LOqLxQpHF?=
 =?us-ascii?Q?Gw86sD9q1C2QeqS1Wmskp3HAAXJzZ3tVMHpDK092rnhaY9rBTrlr8zvYyebV?=
 =?us-ascii?Q?1sW76msUxm+hIUYJf/HdyX0oqzt3/WC4e9Ykq746QR2iDBhbc2Ck/4GeN+wN?=
 =?us-ascii?Q?4iNQ1+zaedJc3oADUjtWSvjH2W7MZQ+hpwVWe4z/gAdqUtt86QQrzRGlVyJD?=
 =?us-ascii?Q?nm9BuIQry+tdyfXQb/EXJfOrmSF7xslQS7srcxvec51tVv7IrO9+PeTMqVoU?=
 =?us-ascii?Q?gQ08oe4bv2VxyuG9kjtPaaIvH15K6lqNNbLmatdzY7VdLuEqb97dmqMQd2o8?=
 =?us-ascii?Q?J/LHHzyGdKGHd4JDzRxELcj2j5vS32u3JqtA4IL0gGgHha2I+GyoWA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ebae3ca1-0912-4aa3-5f87-08da0d05ba03
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 19:45:47.5627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 T7H8Bat9n1bp9Yp9TQKWkxyUXFSdSuQxwsZ1VA4BaIbTFOAXPzQeDmJttH5JbdlS/bL91JVw7MryKCmku9qcyqaHWsOX1Mcm8Jm7Rwifhc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2308
X-Proofpoint-GUID: PEvn_sQUsbWrk1W5M6kUwvFXjr5SNOmC
X-Proofpoint-ORIG-GUID: PEvn_sQUsbWrk1W5M6kUwvFXjr5SNOmC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-23_08,2022-03-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=697
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203230102
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Mar 2022 19:45:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96165

The changes between these versions are too numerous to list here, but
can be found at https://github.com/grpc/grpc/releases/tag/v1.45.0

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../grpc/{grpc_1.41.1.bb => grpc_1.45.0.bb}                | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.41.1.bb => grpc_1.45.0.bb} (94%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.41.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb
similarity index 94%
rename from meta-oe/recipes-devtools/grpc/grpc_1.41.1.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb
index 3fe799310..8063f343a 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.41.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb
@@ -4,7 +4,7 @@ Provides gRPC libraries for multiple languages written on top of shared C core l
 HOMEPAGE = "https://github.com/grpc/grpc"
 SECTION = "libs"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6e4cf218112648d22420a84281b68b88"
 
 DEPENDS = "c-ares protobuf protobuf-native protobuf-c protobuf-c-native openssl libnsl2 abseil-cpp re2"
 DEPENDS:append:class-target = " googletest grpc-native "
@@ -20,10 +20,9 @@ RDEPENDS:${PN}-dev:class_native += "${PN}-compiler"
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "635693ce624f3b3a89e5a764f0664958ef08b2b9"
-BRANCH = "v1.41.x"
+SRCREV_grpc = "494b08ada4009ead0d0b70e44d354be72f9c283a"
+BRANCH = "v1.45.x"
 SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
-           file://0001-cmake-revert-db88fb0ee826e73323e06ac6166ac038ee71f6a.patch \
            file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch \
            "
 # Fixes build with older compilers 4.8 especially on ubuntu 14.04
-- 
2.35.1


