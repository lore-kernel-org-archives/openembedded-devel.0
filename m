Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC394C43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 15:13:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.7159.1655133189003720651
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 08:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RIzsROC3;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=3163934f72=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25DClJBK015919
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 08:13:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=5+J+VoP6MLafFTBsM/OudtS3HLiwxT3eS0pSzL0dn1I=;
 b=RIzsROC3ljYxv6Xv4+T7JeNpMA77wpu7MY66bsVidv0H39TwhiUMBVwt1A6Sh/BELnY9
 CjkD5uNSMGbEk0hDCRGNoq4TesT+PWFdgUaopuhBRxqQBwXfHQJixFs68Q9y4vMomi1j
 PA+C59FIsiSJhaT6IFq0fkpNFxlH2DAYR7V5rDlLSy9pbOftYbgzoKAgDawE1ghNWxg1
 SrAOkounsT4hFDS/YMiBMMpoAZXcLlm/vtb4IwJsCKpvQUD03cEYNNp/A8hgVDN13UfL
 lZYAqGbssggudB2TsK5vXhZb7JUDKUFARUg41CNS7xenbqHXkHEVHVVE/KC6+MU3hW1W dA==
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2042.outbound.protection.outlook.com [104.47.73.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmtjkhc3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 08:13:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdtaHa7+Ld223SfRGiXdutIKCPG/RxtMMDalHW49jlsz4y6nWo5PwEKLWK5bO77fAnlEoeMjkQ1J34ojnTq+HHXggI8J/nfMH9Li70I4tCTgYABMfzNks+ElsJVSUm1kcChvZkO8pwwOcxzZqxDko18nnZqXmXiRdxP8NTyr9SyC32usG7WF0KrrHAAfIEN13fhlv7fcBwq2O88R3phd5GsJ3JwqMzy82LymaeBpuK0nPAe13tccX7EKnB/UPxjitF0cZE1pvVg+cwukL291O8ZvFF1iZl//mUzmGFhCjxE0YUakCBnxXWbA//q6zmNxRifjI9rYquQdeb49SZ5a9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+J+VoP6MLafFTBsM/OudtS3HLiwxT3eS0pSzL0dn1I=;
 b=AZLisf5l1cu5+c8wilobCpqte2wzSVd5MHDJxsDFaq8H6prPKw44ASvhqhB0rHQeRwISKVabaaxaW6FaeLrqYl/S1Dtg0ENZBAJ3Wc6twSI4Ivot4zgG12059v+IjpNpq5O9d/0p8Z2P8qSbch6CjyK2+AdhFZTdkpnTtht8Bg6R+grma1dyiOizGg3MGvuK+eQzUSiEWkIG0Vqm8ppZFfN8J94n/M9AH+qp5EOilZnWBV3LxdTczTkpIu6pYPbdjquU9HH8x12Q2xKlJVo+AhRwCKSOGV02HgtewubR81u3CnaHLs1Q+AHb7E+Fiw/qPmB3i/5Gc8vIRsbYVfanQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
 by MN2PR11MB4173.namprd11.prod.outlook.com (2603:10b6:208:137::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Mon, 13 Jun
 2022 15:13:05 +0000
Received: from SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::a8e3:9407:2650:5a17]) by SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::a8e3:9407:2650:5a17%5]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 15:13:05 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] openvpn: eliminate build path from openvpn
 --version option
Date: Mon, 13 Jun 2022 23:12:53 +0800
Message-Id: <20220613151253.459930-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0200.apcprd06.prod.outlook.com (2603:1096:4:1::32)
 To SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5404f1ed-563b-471f-f18a-08da4d4f3752
X-MS-TrafficTypeDiagnostic: MN2PR11MB4173:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB417360A17A82E548EE052F1FF9AB9@MN2PR11MB4173.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	60INuX8ERgJVcNdSCpA6PiyuQxnMSeadbECEstbD/uBsgDnzyd+28c4Izew3X1gCwtSSqZHJQKhnar46AXVcsLS8flwVDQhEJNGwMmTNNGgqICddSw49vjpXwz/OT2r9syEQmchvE6UtWBv9rMC0l6JrYCIvvgyvJoRg5xhBiQUGQgCm5xh4hZLCyj7oiaTLihKSROwIudmbpK9bz6D6YABgE4UaDiXvPR7/Cn5g5bdhA6khSp0PtPeX3PKQ6Ny0oo4Evk+BgYl9F8BiPesRJK9auXfeTM0W0ktCWBAtiWlD2Xup8Vu2Gh05l2EepKI0t/DkAW6/W2mO44fikC1XeL2PVVvj5skJqKXvBqHx/y/ZsdhFalqnyy7g77s+t/FWzyaUQOEmm46I+5kAJeqolNHx9kJJXgOI/JJ057sBN88Dcx1cpQprP6pc+EaVGUh4j0uYJdIVkIt8n+SND4ipp9Y7Q5tSiqU5IitwtBmCz/EQUejbcvx38qqZPx+gHB/0YPqbbjty2/WvtlUuQKxQ/+p3kUplP4w1KvVOQdOE70TnyyR2mAE5TMWGZ8kPjxMDQsRt5J0lEd6OGcifiq86dIp/iAF8ieT29lqp2EIA56/qyXi3qmblonBPnEc04gKw27Tr/mwhw8MElf3GKQxaIFcq95AIi5BFnptvu9a8ny44CO2lpWf7q+07nkm5Pan8mxUvWTLZtqxxnJSVeh0BHoKx0va/w+qnB2oUySJAszWS2Nj27rs3foAxwggMQ0XsnWBtkAhk4mvTzJkPiGh1bfVXHGG2UcD1F3uHXNnQELY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4875.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(8936002)(6486002)(6512007)(2906002)(38100700002)(8676002)(6666004)(66556008)(86362001)(508600001)(6506007)(1076003)(38350700002)(52116002)(186003)(5660300002)(26005)(2616005)(83380400001)(44832011)(36756003)(6916009)(316002)(66946007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UL05QMf1uDb4kQWuES5uZe9qI9wReKA/k2PH7EX6xMfldYAWld3nKS55Z/C8?=
 =?us-ascii?Q?St5RxiThfXS7aqRRBBHJNofLMyjHU/+iydsqyxOM5SPu9FZDyRz8Rc4miUs4?=
 =?us-ascii?Q?CJ7AvFACNK2etqnTiHcSbSFpAn8OunxK++1zL0nk9V7iz+Ng6OhgzYbzFJBz?=
 =?us-ascii?Q?kyhQoR4SwD0ni7gEJrBkrkCyDAeUBKI49kPLrOp1+5ClaAZj3+M4VWT6rOdo?=
 =?us-ascii?Q?2MPkSjiPUlIC+VTL08mPMjHKXjpge/3lz3x1NLh/I8mjD3bBf30u0BHZ3Y2J?=
 =?us-ascii?Q?NAnLYlx+ZARlnucEsds8Lr/OsrvqTQ8Fr3ASQEoX46IXdWPm71gwzv7eXSFE?=
 =?us-ascii?Q?zTmeXdNPHE3r0VBlnzKAzQdYbN4W3GvYsCgjnX0ndOfTiwwtoP5GxgRCP6Um?=
 =?us-ascii?Q?ZvAC0KFJA/YWPIFEGtFc7s4IZ2w/tabaNwN2Zl6ekFluMVcMjkAVbMEk+kY2?=
 =?us-ascii?Q?O2RpKAbppnF77TmlpC/hH5syXM1CMQzLxfkQrgJADUA1si4j6N9/HHGspTf2?=
 =?us-ascii?Q?v4hqiuFaahIgp9UbSLTyhZIBhn9XyluddjNDVYdp9w37DzTSpO19B1jCsG3E?=
 =?us-ascii?Q?inuNfYUfXnIkqiOQsHZyDITMYNnd+cNXYc7WVghoIpCpFmqIK7qI3Ta7xv2M?=
 =?us-ascii?Q?N8EI+kdD8HrEjXNiOCh1JGvT/8SQIGNsjoyCpKbSO5AP1imekvZrWWujtjbh?=
 =?us-ascii?Q?FVHvOXndY51GY3Ndu+lurQXygmPx+4Bsm4ZyaRy2CiJIE/j5Nui//IFtrxkm?=
 =?us-ascii?Q?Ae7DlCkT0cTVUzrGc1mVNIxroh68mnkodDnwzf9jSYeEGCCEl7lhdoITXVtc?=
 =?us-ascii?Q?/Hf6x/r29PYKoir8YzVOtUz8x+sLIyI8+McwbSLqqhphQ3AYx0Xw25SbuwPo?=
 =?us-ascii?Q?6wYtuAVzabJVWS8UvVdoFsrtao/EuD8y6pl+JRZdAUjoomweThcV8hRW8hnC?=
 =?us-ascii?Q?AT5ERFyZbzAdNGHEmpG1XweR77mMiWI0RQpQBAFyoBg6lkwiD9kgiQiJzLF1?=
 =?us-ascii?Q?KtKBF9b3pAJ694IxhNVf8QxAFRFzAVtOAlDmy+3IUyWQgIrOWtcagU+C6AlO?=
 =?us-ascii?Q?9Wem/xfJBbZjp+UdWLtRZxrv3U+EIRVKRmX3usAQ6bYvMvENpke7dopSQtcv?=
 =?us-ascii?Q?S15Dh9m7BhjjRT1zuceavX5Y4wWWis4MekBdea/MOkKCcruTcigMqu9dgHKL?=
 =?us-ascii?Q?vuQWi5z9jyCSERTO4lSlgn+uffIEZdvm7HXzTItFawtvu+e1JQ2ua9/lZnnS?=
 =?us-ascii?Q?GTrhlkRukq0BZGdCDfLAvFkhZ7Boe1ck8LBa+xFdUgSe+hj9jpjtvkRnLgOV?=
 =?us-ascii?Q?OzukgDrr53XWnM4s2BMigCxL/f6A8TeT8WAt5YaWTgRpB0fs+1+AI0vkcq89?=
 =?us-ascii?Q?Pw0z5df5YBeIwFYqoQQIcVUIo0+8hWrh2yFM3L86fkAq1W7P2el391VD3LW1?=
 =?us-ascii?Q?YFB4GL0kUsToo2rfv9SQjPMaAZPxuPiIoQ99xYsc9Zcn+lN2b9y0SM6vVuD6?=
 =?us-ascii?Q?dG4ZLsghL+0HnwhBTSkXHVz6mup2TBRVKGrh4hC+faWnD1xIQQzlqLupj9Ow?=
 =?us-ascii?Q?xZqVWIdAavuPIbGtJ0OO9dM95dMEAcNQk5hL5gGqdJXdcFDkZ96HJmqIenIt?=
 =?us-ascii?Q?YzHcY6XrO9jWFTpRobBOm2AjZTqRIiZy0t4frz4AZXyjbfJEcXK46KOm7PsW?=
 =?us-ascii?Q?IaFJ1QhsMrRGfT/JWTKD5YGd2ENmlNFPirnscSw6Pf3MY2aXW+lUjd3wB2Aw?=
 =?us-ascii?Q?hw46NM9xTA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5404f1ed-563b-471f-f18a-08da4d4f3752
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4875.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 15:13:05.3846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tLZe2pUZc3TtuJA0t+hmZs0dFAUTI/VenekZbHKSfHAePEBR2vGs6qpJMSh91qnh4EJhYT6T55jmc6rR7Zq2DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4173
X-Proofpoint-GUID: POSZ2hrHPZEWy1HN8X-B7WtZGvsVfW-l
X-Proofpoint-ORIG-GUID: POSZ2hrHPZEWy1HN8X-B7WtZGvsVfW-l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_06,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 adultscore=0 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206130068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jun 2022 15:13:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97490

Before the patch:
$ openvpn  --version
OpenVPN 2.5.7 x86_64-poky-linux-gnu [SSL (OpenSSL)] [LZO] [LZ4] [EPOLL]
[snip]
Compile time defines: enable_async_push=no enable_comp_stub=no
[snip]
with_crypto_library=openssl with_gnu_ld=yes
with_libtool_sysroot=/buildarea/build/tmp/work/core2-64-poky-linux/openvpn/2.5.7-r0/recipe-sysroot
with_mem_check=no with_openssl_engine=auto

After the patch:
$ openvpn  --version
OpenVPN 2.5.7 x86_64-poky-linux-gnu [SSL (OpenSSL)] [LZO] [LZ4] [EPOLL]
[snip]
Compile time defines: enable_async_push=no enable_comp_stub=no
[snip]
with_crypto_library=openssl with_gnu_ld=yes with_mem_check=no
with_openssl_engine=auto

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...minate-build-path-from-openvpn-versi.patch | 48 +++++++++++++++++++
 .../recipes-support/openvpn/openvpn_2.5.7.bb  |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch

diff --git a/meta-networking/recipes-support/openvpn/openvpn/0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch b/meta-networking/recipes-support/openvpn/openvpn/0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch
new file mode 100644
index 000000000..03b454d62
--- /dev/null
+++ b/meta-networking/recipes-support/openvpn/openvpn/0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch
@@ -0,0 +1,48 @@
+From ea179d83b0aa62719d90748cd1fb260f40055f15 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Mon, 13 Jun 2022 22:44:28 +0800
+Subject: [PATCH] configure.ac: eliminate build path from openvpn --version
+ option
+
+Before the patch:
+$ openvpn  --version
+OpenVPN 2.5.7 x86_64-poky-linux-gnu [SSL (OpenSSL)] [LZO] [LZ4] [EPOLL]
+[snip]
+Compile time defines: enable_async_push=no enable_comp_stub=no
+[snip]
+with_crypto_library=openssl with_gnu_ld=yes
+with_libtool_sysroot=/buildarea/build/tmp/work/core2-64-poky-linux/openvpn/2.5.7-r0/recipe-sysroot
+with_mem_check=no with_openssl_engine=auto
+
+After the patch:
+$ openvpn  --version
+OpenVPN 2.5.7 x86_64-poky-linux-gnu [SSL (OpenSSL)] [LZO] [LZ4] [EPOLL]
+[snip]
+Compile time defines: enable_async_push=no enable_comp_stub=no
+[snip]
+with_crypto_library=openssl with_gnu_ld=yes with_mem_check=no
+with_openssl_engine=auto
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2f5f6bc..eddcbc5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1377,7 +1377,7 @@ if test "${enable_async_push}" = "yes"; then
+ 	esac
+ fi
+ 
+-CONFIGURE_DEFINES="`set | grep '^enable_.*=' ; set | grep '^with_.*='`"
++CONFIGURE_DEFINES="`set | grep '^enable_.*=' ; set | grep '^with_.*=' | grep -v 'libtool_sysroot'`"
+ AC_DEFINE_UNQUOTED([CONFIGURE_DEFINES], ["`echo ${CONFIGURE_DEFINES}`"], [Configuration settings])
+ 
+ TAP_WIN_COMPONENT_ID="PRODUCT_TAP_WIN_COMPONENT_ID"
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb
index 3ed90a7c8..f9998aaa8 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb
@@ -8,6 +8,7 @@ DEPENDS = "lzo openssl iproute2 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '
 inherit autotools systemd update-rc.d
 
 SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
+           file://0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch \
            file://openvpn \
            file://openvpn@.service \
            file://openvpn-volatile.conf"
-- 
2.25.1


