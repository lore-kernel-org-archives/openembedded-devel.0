Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE056C6FA8E
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 07:27:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4988.1678001225999338252
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 23:27:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hAiv5e2F;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=24288e7293=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3257OoJQ023694
	for <openembedded-devel@lists.openembedded.org>; Sun, 5 Mar 2023 07:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=St4SnS0KQab/ptpYiok+3mk8QneH47SyXKtIsXD+aa8=;
 b=hAiv5e2FumWbXykP5eDVC2vi+5VHKeF6mDcozgYOdnQIIAVxtGf7KgHiNIsk2FbUY+je
 5CBZHD4ShbzhPn2eLKnU6hJSsMJdNDpxxfH25kVmPm21Th79E+Zp/Apj8iosLyVh9Ten
 XSZniJUjnB7lpJWXZO9zJDEKvlamuTuCG4ENDIGiMqa1n7obd4Cq040ln+M5NWC8ZCK2
 O9E1K/LCHjMkQMLSFkc0YkTcga1nR5uxTUAWN/9DJuL30Zikwr27ORjrHfhZXA1SIqRk
 kX3oFXLmvg8/8sI4yFY1h+x0K7B8CUlyBOXj6/9pWxP14QH+jeTSvPl9YWEMI1/4SCvS Eg== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2044.outbound.protection.outlook.com [104.47.57.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p3u72h2fs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 05 Mar 2023 07:27:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSfshImsY9dJr6mVKnwc4qBa1+SLFCaaXNbuJsp86WDGlfII+at9pChSa3sau8SQ+l8HCDhJegcQFVt3tXsxO9o46g9CV6ylCZ9ZQxSvbNL8yGo29vg9/fHV4x3tOr6VCwzk4cseJ/XKRlCD+Upz29iiiwTj9UGEItWR2qHRKLHf0aaXRAZwp5etaZX5aixfRn+D5uIh3LV3dpzaoRH2vwnJT0AoqoKNj2tPCC2VsJtXaOnebGSLABRCo7tzzszW2/hdqKdUZG0WLcKszZsugIDfLlIPMPORJ5EDp2mE4ZWCRikmkThlFvLi2Ftkb9kW8uYl72Zm5v7aIIJgRz9n1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=St4SnS0KQab/ptpYiok+3mk8QneH47SyXKtIsXD+aa8=;
 b=OmFNqMQA89CnIWGSmWKgRgNs8aZPKvtXlsfoxQxdGShrk/sjf5OF2VE0g1R9MNY1utQhng+02DnNPUqaE8gVRUkABQRraFre/iBUePFDMe0rHHsRu1TIowDiR0hjx5MXYPngmcPk9SLsZJmDcdjYVt8WC+OCzJFtnqqLZkU4N9lXN4G+yZUgH39WqlPseOnC7IRUmHAQG0qlaO5I39LBbZE5jAtKd14WhDxObjpvbMXtPePvp6bAiBZFDaWN8Pc6jYw0SjHN1S6kw6tiGBLjq7ejj5nOC9GcrM0YqpeuPNflbmb3uN8uRgURUFXyZ+zypbyeAltjO1xyee5HEvkQvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CH3PR11MB7866.namprd11.prod.outlook.com (2603:10b6:610:124::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.25; Sun, 5 Mar
 2023 07:26:58 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6156.027; Sun, 5 Mar 2023
 07:26:58 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] quagga: drop recipe
Date: Sun,  5 Mar 2023 15:26:48 +0800
Message-Id: <20230305072648.2432656-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230305072648.2432656-1-yi.zhao@windriver.com>
References: <20230305072648.2432656-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::14) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|CH3PR11MB7866:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d08f70d-5fc8-41be-be3b-08db1d4b013c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AFZTFp/K9BWwnPASOq63JyMU1iYcRNEMGkH1j0lEs0yO8dSXmMk8r8pvFXiB0gqwqjuH0dUz+e8OHWtp80a3Vib5f/3su8oQ6PeXgrC4HrmTOZ/aSGfkNQEIFF6AQXSOHb6El+NMtf8EdlKiDdj+IYt80i7Ub7ccRdxrDeM6EwaVMro97uLYVnVMQLQSVgsG4z4TS4cux3aXeUOHJ4TWm+nV8+FB0HkaIBSCziXyTLoSSmBq6SxS9oq3/hOjJKBOWMvyumqfVUatPOkg1Tasd3GIRe+jNryT72HfDUR+fclivzOwOlGIeCarR1uWruspgj92Zq2MuOQqDzFCqanqIzaqDcCRtdKZzrVZe4wJwzOcRboDJx5tjsv5tqK9I5IpD/1ZQYQ/Gu8qmmc1rj2O+tyNUrnGpir8vA+M4sY2jJ/d/pbkE13/O9I89KfvZBM3LhLSip2RRvT1hR410mY17+tnZyugf2lJ8k21wKOOQ1LKQ8+NG778U2FhfYEp59dJMmVNq9/8NdNJP3/ceruEXHFo7gCd48uYkCT6wCbURpTYtLC1EiAezx7p3JX9hB3zZ0TIvETynXqX0mzv76jp70spiR92iKrog9SV0pwHS8ly0GN9mqNNs3BFOxqmQRop2pc3JPzYa2AwBgix9PICrG6rM3l0qKySJro9PWE950l0h+29E1ThySd69RNFtOyWzEN67uWUm9stzLIAywpbctHSA3akXBBZ+p/kUlNmR4w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(376002)(346002)(366004)(39850400004)(451199018)(478600001)(83380400001)(6666004)(36756003)(316002)(38350700002)(38100700002)(6506007)(186003)(2616005)(6512007)(1076003)(52116002)(26005)(6486002)(966005)(5660300002)(86362001)(30864003)(44832011)(8676002)(66476007)(66946007)(2906002)(41300700001)(6916009)(8936002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9kQZwH/UL7qCsegmLImS+cR/2FurrtxRdGiz6K9qDfkkzJo4FqzIu++51FeH?=
 =?us-ascii?Q?cr/zydeVg/Hd9Ke3owdcEznKFlq0FoiSLFHZDdWwamGCRp7m8v3wACH9ROaU?=
 =?us-ascii?Q?LIypUBaDdgUh0cu0SfJoeMtzJYNbT10ngFupHCq0imVWNj56eKvyDNUHh3cf?=
 =?us-ascii?Q?nYnR1HunLT2fXrnAqjIoT0qu7bEh6oVhHCkyP6mtPGKa0W9sCndEa0kD3rB9?=
 =?us-ascii?Q?9iJvdi1TC/1nsKS3s/s08ekrGToDKvPBlmoOTrdOnqie9gKrBsDHe6Q0ty1Y?=
 =?us-ascii?Q?VXD8cLT5C3Lcmiig27XKgvQ3xruqixr6tM1bIeEaG6ab5nshDkM4B1l3UdrW?=
 =?us-ascii?Q?T7e2VXeDq9VB8ZEEPmjztvzW29GCry4h5k/PLIrdhbad5CLnRx/NCdWKSm9Y?=
 =?us-ascii?Q?B/Y+IoYmnKuyhGCKDE3qEODlHtnO9yudp52hY6leulDNAvV2SU4ed6nTzWL3?=
 =?us-ascii?Q?9EgUQ9pY8cNIiMIQstrfnGGDbnCMBce4S0WMZGqfmUamMkJVQ2GCxnvdVC38?=
 =?us-ascii?Q?qHFADpM4hUNV8IbK/zFYtFOvSYuyL4by1VoaBEExr9XGgEErmiHd3U9P+ARf?=
 =?us-ascii?Q?OHWXLka8rnisQuvxY4Cw7SsLyYNMvf+Q5rZXB6cuMyfD7b3OxEiLOagfdA3w?=
 =?us-ascii?Q?+5L2tea1Lw75mR+aKToyyzX2dneLbQdyxIGlhMa8+NEn1Wdc5h5W40wyaWtX?=
 =?us-ascii?Q?8zk5S6oiWjw5gjKo+yec8WmT306ZNgIFPkiCXDpjVCAfaG4Oglmci88ZYNXj?=
 =?us-ascii?Q?jfwGBzkYKI29u/EWTRf3S5MDiu0o3105cjQZlxHPhZJTw1hF7uiZm2X24aZl?=
 =?us-ascii?Q?QOa7hePFIN6U+zI4qOy4QPvrAI5aOuaAI1Vc3ONFrNH6tJptXozp7Tf66+nX?=
 =?us-ascii?Q?EGHaig7P1d322I71OSxTnursQ2m7Thjm4lPqjUUhrS4MUS7B2KRjudzlY2nL?=
 =?us-ascii?Q?APvaIEj3JRLKgBuamr2CJG1f7Ledlpa31j/X79EUw9ggoqJpwusSV2tu5ysr?=
 =?us-ascii?Q?FGzJgfBAmlHgzdv8206WAMM7uaPbrfda0LuabRZPiYESEB2LixxhoLccj9GW?=
 =?us-ascii?Q?8jkK1TLZhyue7aw4z37zt8xOmUvug1GhOmoQExeC33L4RtIG/1qZHC8O4Ysl?=
 =?us-ascii?Q?aTxtco+fvIhPUdZkPQDWsFalYvOES9Ze1u9K1BxzSU4S1aklzi+xRfOgjfwL?=
 =?us-ascii?Q?z2TU2oYnLffSht9xWp/x5fKJJXohuymUFu0HxTX2XpvdBclQn7cRcjpURBbh?=
 =?us-ascii?Q?UuxdLCVQqBW7xhG+wWIh8lXASTW6CVXjOxthyB9CA+C5JYMaFTn+f1Fbku/1?=
 =?us-ascii?Q?roTLsrha2+OqPMUzkHt2Z6TWqw8cV44kenpmgwqTX5FgQLdBjPPuUzTFMlhK?=
 =?us-ascii?Q?gPE0o0raBUWEREfAlrrA58s/tLJzOCsZH1jEs615ca1O7CNWUqmq8X9moOj5?=
 =?us-ascii?Q?2hNoa19rUORa9jyYPN15hzwYpU0cQM72ECUvGIDqOv16hlnoBjGcw7Tbxg/f?=
 =?us-ascii?Q?zgMWP060rwhhUft9jyq2GTap8c8Z/WoBprHp+vwV15SFSdXYkQa674ZbZKYG?=
 =?us-ascii?Q?np3UvEMIyz27KIfTrM6/gB2YVA72O2tsxGFnvSTl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d08f70d-5fc8-41be-be3b-08db1d4b013c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2023 07:26:58.8097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrpxAimcN6beJoOt26HfB4pFrZWSnu9pxJhTdiyhuiN53CVtNh3Wrzcw9ebCIrqBO74ISWmfor4EuYtWRil2LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7866
X-Proofpoint-ORIG-GUID: 04hGAvMjB5YiNMcQygKVtlfbJT2vgNy4
X-Proofpoint-GUID: 04hGAvMjB5YiNMcQygKVtlfbJT2vgNy4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-04_14,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=999 phishscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303050061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Mar 2023 07:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101383

Quagga is no longer maintained since 2018[1]. Its official repository is
not even available[2].
As an alternative, users can use FRRouting[3] which has been added to
meta-networking[4].

[1] https://github.com/Quagga/quagga
[2] https://git.savannah.gnu.org/cgit/quagga.git
[3] https://frrouting.org
[4] https://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes-protocols/frr

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../packagegroup-meta-networking.bb           |   1 -
 ...for-readline-instead-of-main-in-libr.patch |  32 ---
 .../quagga/files/bgpd.service                 |  15 --
 .../quagga/files/isisd.service                |  14 -
 .../quagga/files/ospf6d.service               |  15 --
 .../quagga/files/ospfd.service                |  15 --
 .../quagga/files/quagga.default               |  12 -
 .../quagga/files/quagga.init                  | 200 --------------
 .../recipes-protocols/quagga/files/quagga.pam |  13 -
 .../quagga/files/ripd.service                 |  15 --
 .../quagga/files/ripngd.service               |  15 --
 .../quagga/files/volatiles.03_quagga          |   3 -
 .../quagga/files/watchquagga.default          |  12 -
 .../quagga/files/watchquagga.init             |  64 -----
 .../quagga/files/zebra.service                |  16 --
 .../recipes-protocols/quagga/quagga.inc       | 243 ------------------
 .../recipes-protocols/quagga/quagga_1.2.4.bb  |  10 -
 17 files changed, 695 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/0001-configure-Check-for-readline-instead-of-main-in-libr.patch
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/bgpd.service
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/isisd.service
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/ospf6d.service
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/ospfd.service
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/quagga.default
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/quagga.init
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/quagga.pam
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/ripd.service
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/ripngd.service
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/volatiles.03_quagga
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/watchquagga.default
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/watchquagga.init
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/zebra.service
 delete mode 100644 meta-networking/recipes-protocols/quagga/quagga.inc
 delete mode 100644 meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 11437e223..b681031c5 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -158,7 +158,6 @@ RDEPENDS:packagegroup-meta-networking-protocols = "\
     openl2tp \
     mdns \
     nopoll \
-    quagga \
     radiusclient-ng \
     tsocks \
     openlldp \
diff --git a/meta-networking/recipes-protocols/quagga/files/0001-configure-Check-for-readline-instead-of-main-in-libr.patch b/meta-networking/recipes-protocols/quagga/files/0001-configure-Check-for-readline-instead-of-main-in-libr.patch
deleted file mode 100644
index 776c0958f..000000000
--- a/meta-networking/recipes-protocols/quagga/files/0001-configure-Check-for-readline-instead-of-main-in-libr.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 675b35b7ed416c837267e493b157167319e8f5fa Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 1 Sep 2022 11:01:53 -0700
-Subject: [PATCH] configure: Check for readline() instead of main() in
- libreadline
-
-while checking for presense of libreadline, poke for a function which is
-provided by libreadline, main is not provided by it, so modern compiler
-toolchains may complain about it.
-
-Upstream-Status: Submitted [https://github.com/Quagga/quagga/pull/9]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index ed279f48..d444ab4a 100755
---- a/configure.ac
-+++ b/configure.ac
-@@ -754,7 +754,7 @@ dnl	 [TODO] on Linux, and in [TODO] on Solaris.
- 	      )]
- 	    )]
- 	  )
--         AC_CHECK_LIB(readline, main, LIBREADLINE="-lreadline $LIBREADLINE",,
-+         AC_CHECK_LIB(readline, readline, LIBREADLINE="-lreadline $LIBREADLINE",,
-                       "$LIBREADLINE")
-          if test $ac_cv_lib_readline_main = no; then
-            AC_MSG_ERROR([vtysh needs libreadline but was not found and usable on your system.])
--- 
-2.37.3
-
diff --git a/meta-networking/recipes-protocols/quagga/files/bgpd.service b/meta-networking/recipes-protocols/quagga/files/bgpd.service
deleted file mode 100644
index 818b59cb2..000000000
--- a/meta-networking/recipes-protocols/quagga/files/bgpd.service
+++ /dev/null
@@ -1,15 +0,0 @@
-[Unit]
-Description=BGP routing daemon
-BindTo=zebra.service
-After=zebra.service
-ConditionPathExists=@SYSCONFDIR@/quagga/bgpd.conf
-
-[Service]
-Type=forking
-EnvironmentFile=-@SYSCONFDIR@/default/quagga
-ExecStart=@SBINDIR@/bgpd -d $bgpd_options -f @SYSCONFDIR@/quagga/bgpd.conf
-ExecStopPost=@base_bindir@/rm -rf /run/quagga/bgpd.pid
-Restart=on-abort
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-networking/recipes-protocols/quagga/files/isisd.service b/meta-networking/recipes-protocols/quagga/files/isisd.service
deleted file mode 100644
index 9bfe7b65e..000000000
--- a/meta-networking/recipes-protocols/quagga/files/isisd.service
+++ /dev/null
@@ -1,14 +0,0 @@
-[Unit]
-Description=IS-IS routing daemon
-BindTo=zebra.service
-After=zebra.service
-ConditionPathExists=@SYSCONFDIR@/quagga/isisd.conf
-
-[Service]
-Type=forking
-EnvironmentFile=-@SYSCONFDIR@/default/quagga
-ExecStart=@SBINDIR@/isisd -d $isisd_options -f /etc/quagga/isisd.conf
-Restart=on-abort
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-networking/recipes-protocols/quagga/files/ospf6d.service b/meta-networking/recipes-protocols/quagga/files/ospf6d.service
deleted file mode 100644
index 50645fe2a..000000000
--- a/meta-networking/recipes-protocols/quagga/files/ospf6d.service
+++ /dev/null
@@ -1,15 +0,0 @@
-[Unit]
-Description=OSPF routing daemon for IPv6
-BindTo=zebra.service
-After=zebra.service
-ConditionPathExists=@SYSCONFDIR@/quagga/ospf6d.conf
-
-[Service]
-Type=forking
-EnvironmentFile=-@SYSCONFDIR@/default/quagga
-ExecStart=@SBINDIR@/ospf6d -d $ospf6d_options -f @SYSCONFDIR@/quagga/ospf6d.conf
-ExecStopPost=@base_bindir@/rm -rf /run/quagga/ospf6d.pid
-Restart=on-abort
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-networking/recipes-protocols/quagga/files/ospfd.service b/meta-networking/recipes-protocols/quagga/files/ospfd.service
deleted file mode 100644
index 2cab1cd14..000000000
--- a/meta-networking/recipes-protocols/quagga/files/ospfd.service
+++ /dev/null
@@ -1,15 +0,0 @@
-[Unit]
-Description=OSPF routing daemon
-BindTo=zebra.service
-After=zebra.service
-ConditionPathExists=@SYSCONFDIR@/quagga/ospfd.conf
-
-[Service]
-Type=forking
-EnvironmentFile=-@SYSCONFDIR@/default/quagga
-ExecStart=@SBINDIR@/ospfd -d $ospfd_options -f @SYSCONFDIR@/quagga/ospfd.conf
-ExecStopPost=@base_bindir@/rm -rf /run/quagga/ospfd.pid
-Restart=on-abort
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-networking/recipes-protocols/quagga/files/quagga.default b/meta-networking/recipes-protocols/quagga/files/quagga.default
deleted file mode 100644
index 4c4bc2307..000000000
--- a/meta-networking/recipes-protocols/quagga/files/quagga.default
+++ /dev/null
@@ -1,12 +0,0 @@
-# If this option is set the /etc/init.d/quagga script automatically loads
-# the config via "vtysh -b" when the servers are started.
-vtysh_enable=yes
-
-# Bind all daemons to loopback only by default
-zebra_options=" --daemon -A 127.0.0.1"
-bgpd_options="  --daemon -A 127.0.0.1"
-ospfd_options=" --daemon -A 127.0.0.1"
-ospf6d_options="--daemon -A ::1"
-ripd_options="  --daemon -A 127.0.0.1"
-ripngd_options="--daemon -A ::1"
-isisd_options=" --daemon -A 127.0.0.1"
diff --git a/meta-networking/recipes-protocols/quagga/files/quagga.init b/meta-networking/recipes-protocols/quagga/files/quagga.init
deleted file mode 100644
index df1beb712..000000000
--- a/meta-networking/recipes-protocols/quagga/files/quagga.init
+++ /dev/null
@@ -1,200 +0,0 @@
-#!/bin/sh
-#
-# /etc/init.d/quagga -- start/stop the Quagga routing daemons
-#
-# Based on debian version by Endre Hirling <endre@mail.elte.hu> and 
-# Christian Hammers <ch@debian.org>.
-#
-
-### BEGIN INIT INFO
-# Provides: quagga
-# Required-Start: $local_fs $network $remote_fs $syslog
-# Required-Stop: $local_fs $network $remote_fs $syslog
-# Default-Start:  2 3 4 5
-# Default-Stop: 0 1 6
-# Short-Description: start and stop the Quagga routing suite
-# Description: Quagga is a routing suite for IP routing protocols like 
-#              BGP, OSPF, RIP and others. This script contols the main 
-#              daemon "quagga" as well as the individual protocol daemons.
-### END INIT INFO
-
-# NOTE: sbin must be before bin so we get the iproute2 ip and not the
-# busybox ip command. The busybox one flushes all routes instead of just
-# the dynamic routes
-PATH=/sbin:/usr/sbin:/bin:/usr/bin:/sbin
-D_PATH=/usr/sbin
-C_PATH=/etc/quagga
-
-# Keep zebra first and do not list watchquagga!
-DAEMONS="zebra bgpd ripd ripngd ospfd ospf6d isisd"
-
-# Print the name of the pidfile.
-pidfile()
-{
-	echo "/var/run/quagga/$1.pid"
-}
-
-# Check if daemon is started by using the pidfile.
-started()
-{
-	[ -e `pidfile $1` ] && kill -0 `cat \`pidfile $1\`` 2> /dev/null && return 0
-	return 1
-}
-
-# Loads the config via vtysh -b if configured to do so.
-vtysh_b ()
-{
-	# Rember, that all variables have been incremented by 1 in convert_daemon_prios()
-	if [ "$vtysh_enable" = 2 -a -f $C_PATH/Quagga.conf ]; then
-		/usr/bin/vtysh -b
-	fi
-}
-
-# Check if the daemon is activated and if its executable and config files 
-# are in place.
-# params: 	daemon name
-# returns:	0=ok, 1=error
-check_daemon()
-{
-	# If the integrated config file is used the others are not checked.
-	if [ -r "$C_PATH/Quagga.conf" ]; then
-	  return 0
-	fi 
-
-	# check for config file		  
-	if [ ! -r "$C_PATH/$1.conf" ]; then
-	  return 1
-	fi
-	return 0
-}
-
-# Starts the server if it's not alrady running according to the pid file.
-# The Quagga daemons creates the pidfile when starting.
-start()
-{
-	if ! check_daemon $1; then echo -n " (!$1)"; return; fi
-	echo -n " $1"
-	start-stop-daemon \
-		--start \
-		--pidfile=`pidfile $1` \
-		--exec "$D_PATH/$1" \
-		-- \
-		`eval echo "$""$1""_options"`
-		
-}
-
-# Stop the daemon given in the parameter, printing its name to the terminal.
-stop()
-{
-    if ! started "$1" ; then
-	echo -n " (!$1)"
-	return 0
-    else
-	PIDFILE=`pidfile $1`
-	PID=`cat $PIDFILE 2>/dev/null`
-	start-stop-daemon --stop --quiet --exec "$D_PATH/$1"
-	#
-	#       Now we have to wait until $DAEMON has _really_ stopped.
-	#
-	if test -n "$PID" && kill -0 $PID 2>/dev/null; then
-	    echo -n " (waiting) ."
-	    cnt=0
-	    while kill -0 $PID 2>/dev/null; do
-		cnt=`expr $cnt + 1`
-		if [ $cnt -gt 60 ]; then
-		    # Waited 120 secs now, fail.
-		    echo -n "Failed.. "
-		    break
-		fi
-		sleep 2
-		echo -n "."
-		done
-	    fi
-	echo -n " $1"
-	rm -f `pidfile $1`
-    fi
-}
-
-stop_all() 
-{
-	local daemon_list
-	daemon_list=${1:-$DAEMONS}
-
-	echo -n "Stopping Quagga daemons:"
-	for daemon_name in $daemon_list; do
-		stop "$daemon_name"
-	done
-	echo "."
-}
-
-start_all()
-{
-	local daemon_list
-	daemon_list=${1:-$DAEMONS}
-
-	echo -n "Starting Quagga daemons:"
-	for daemon_name in $daemon_list; do
-		start "$daemon_name"
-	done
-	echo "."
-}
-
-status_all() 
-{
-	local daemon_list
-	daemon_list=${1:-$DAEMONS}
-	res=1
-
-	echo -n "quagga: "
-	for daemon_name in $daemon_list; do
-	    if started "$daemon_name" ; then
-		id=`cat \`pidfile $daemon_name\``
-		echo -n "$daemon_name (pid $id) "
-		res=0
-	    fi
-	done
-	if [ $res -eq 0 ]; then
-	    echo "is running..."
-	else
-	    echo "is stopped..."
-	fi
-	exit $res
-}
-
-#########################################################
-# 		Main program 				#
-#########################################################
-
-# Load configuration
-test -f /etc/default/quagga && . /etc/default/quagga
-
-case "$1" in
-    start)
-	cd $C_PATH/
-	start_all $2
-	vtysh_b
-    	;;
-	
-    stop)
-  	stop_all $2
-	echo "Removing all routes made by zebra."
-	ip route flush proto zebra
-   	;;
-
-    status)
-  	status_all $2
-   	;;
-
-    restart|force-reload)
-	$0 stop $2
-	sleep 1
-	$0 start $2
-	;;
-
-    *)
-    	echo "Usage: /etc/init.d/quagga {start|stop|restart|status|force-reload} [daemon]"
-	exit 1
-	;;
-esac
-
-exit 0
diff --git a/meta-networking/recipes-protocols/quagga/files/quagga.pam b/meta-networking/recipes-protocols/quagga/files/quagga.pam
deleted file mode 100644
index 3541a975a..000000000
--- a/meta-networking/recipes-protocols/quagga/files/quagga.pam
+++ /dev/null
@@ -1,13 +0,0 @@
-#
-# The PAM configuration file for the quagga `vtysh' service
-#
-
-# This allows root to change user infomation without being
-# prompted for a password
-auth		sufficient	pam_rootok.so
-
-# The standard Unix authentication modules, used with
-# NIS (man nsswitch) as well as normal /etc/passwd and
-# /etc/shadow entries.
-auth       include      common-auth
-
diff --git a/meta-networking/recipes-protocols/quagga/files/ripd.service b/meta-networking/recipes-protocols/quagga/files/ripd.service
deleted file mode 100644
index 2c824318a..000000000
--- a/meta-networking/recipes-protocols/quagga/files/ripd.service
+++ /dev/null
@@ -1,15 +0,0 @@
-[Unit]
-Description=RIP routing daemon
-BindTo=zebra.service
-After=zebra.service
-ConditionPathExists=@SYSCONFDIR@/quagga/ripd.conf
-
-[Service]
-Type=forking
-EnvironmentFile=-@SYSCONFDIR@/default/quagga
-ExecStart=@SBINDIR@/ripd -d $ripd_options -f @SYSCONFDIR@/quagga/ripd.conf
-ExecStopPost=@base_bindir@/rm -rf /run/quagga/ripd.pid
-Restart=on-abort
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-networking/recipes-protocols/quagga/files/ripngd.service b/meta-networking/recipes-protocols/quagga/files/ripngd.service
deleted file mode 100644
index c3555b345..000000000
--- a/meta-networking/recipes-protocols/quagga/files/ripngd.service
+++ /dev/null
@@ -1,15 +0,0 @@
-[Unit]
-Description=RIP routing daemon for IPv6
-BindTo=zebra.service
-After=zebra.service
-ConditionPathExists=@SYSCONFDIR@/quagga/ripngd.conf
-
-[Service]
-Type=forking
-EnvironmentFile=-@SYSCONFDIR@/default/quagga
-ExecStart=@SBINDIR@/ripngd -d $ripngd_options -f @SYSCONFDIR@/quagga/ripngd.conf
-ExecStopPost=@base_bindir@/rm -rf /run/quagga/ripngd.pid
-Restart=on-abort
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-networking/recipes-protocols/quagga/files/volatiles.03_quagga b/meta-networking/recipes-protocols/quagga/files/volatiles.03_quagga
deleted file mode 100644
index 1f28c0b24..000000000
--- a/meta-networking/recipes-protocols/quagga/files/volatiles.03_quagga
+++ /dev/null
@@ -1,3 +0,0 @@
-# <type> <owner> <group> <mode> <path> <linksource>
-d quagga quagga 0755 /var/run/quagga none
-d quagga quagga 0755 /var/log/quagga none
diff --git a/meta-networking/recipes-protocols/quagga/files/watchquagga.default b/meta-networking/recipes-protocols/quagga/files/watchquagga.default
deleted file mode 100644
index 2d601ec97..000000000
--- a/meta-networking/recipes-protocols/quagga/files/watchquagga.default
+++ /dev/null
@@ -1,12 +0,0 @@
-# Watchquagga configuration
-#watch_daemons="zebra bgpd ospfd ospf6d ripd ripngd"
-watch_daemons="zebra"
-
-# To enable restarts when multiple daemons are being used, uncomment this line (but first be sure to edit
-# the WATCH_DAEMONS line to reflect the daemons you are actually using):
-#watch_options="-Az -b_ -r/etc/init.d/quagga_restart_%s -s/etc/init.d/quagga_start_%s -k/etc/init.d/quagga_stop_%s"
-
-# Since we are using one quagga daemon for now, use the following line. If using
-# multiple daemons, comment the line below and uncoment the line mentioned
-# above.
-watch_options="-z -b_ -r/etc/init.d/quagga_restart_%s"
diff --git a/meta-networking/recipes-protocols/quagga/files/watchquagga.init b/meta-networking/recipes-protocols/quagga/files/watchquagga.init
deleted file mode 100644
index 5ddd94a3d..000000000
--- a/meta-networking/recipes-protocols/quagga/files/watchquagga.init
+++ /dev/null
@@ -1,64 +0,0 @@
-#!/bin/sh
-#
-### BEGIN INIT INFO
-# Provides: watchquagga
-# Required-Start: $local_fs $network $remote_fs $syslog
-# Required-Stop: $local_fs $network $remote_fs $syslog
-# Default-Start:  2 3 4 5
-# Default-Stop: 0 1 6
-# Short-Description: start and stop the Quagga watchdog
-### END INIT INFO
-
-PATH=/bin:/usr/bin:/sbin:/usr/sbin
-
-# Load configuration
-test -f /etc/default/watchquagga && . /etc/default/watchquagga
-
-# Check that there are daemons to be monitored.
-[ -z "$watch_daemons" ] && exit 0
-
-pidfile="/var/run/quagga/watchquagga.pid"
-
-case "$1" in
-    start)
-	echo -n "Starting quagga watchdog daemon: watchquagga"
-	start-stop-daemon --start \
-		--pidfile $pidfile \
-		--exec /usr/sbin/watchquagga \
-		-- -d $watch_options $watch_daemons
-	echo "."
-    	;;
-	
-    stop)
-	echo -n "Stopping quagga watchdog daemon: watchquagga"
-	start-stop-daemon --stop --quiet \
-		--pidfile $pidfile
-	echo "."
-	;;
-
-    status)
-	echo -n "watchquagga "
-	res=1
-	[ -e $pidfile ] && kill -0 `cat $pidfile` 2> /dev/null
-	if [ $? -eq 0 ]; then
-	    echo "(pid `cat $pidfile`) is running..."
-	    res=0
-	else
-	    echo "is stopped..."
-	fi
-	exit $res
-	;;
-
-    restart|force-reload)
-	$0 stop $2
-	sleep 1
-	$0 start $2
-	;;
-
-    *)
-	echo "Usage: /etc/init.d/watchquagga {start|stop|restart|force-reload}"
-	exit 1
-	;;
-esac
-
-exit 0
diff --git a/meta-networking/recipes-protocols/quagga/files/zebra.service b/meta-networking/recipes-protocols/quagga/files/zebra.service
deleted file mode 100644
index 9186041ae..000000000
--- a/meta-networking/recipes-protocols/quagga/files/zebra.service
+++ /dev/null
@@ -1,16 +0,0 @@
-[Unit]
-Description=GNU Zebra routing manager
-Wants=network.target
-Before=network.target
-ConditionPathExists=@SYSCONFDIR@/quagga/zebra.conf
-
-[Service]
-Type=forking
-EnvironmentFile=-@SYSCONFDIR@/default/quagga
-ExecStartPre=@BASE_SBINDIR@/ip route flush proto zebra
-ExecStart=@SBINDIR@/zebra -d $zebra_options -f @SYSCONFDIR@/quagga/zebra.conf
-ExecStopPost=@base_bindir@/rm -rf /run/quagga/zebra.pid
-Restart=on-abort
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
deleted file mode 100644
index d368311d1..000000000
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ /dev/null
@@ -1,243 +0,0 @@
-SUMMARY = "BGP/OSPF/RIP routing daemon"
-DESCRIPTION = "Quagga is a routing software suite, providing \
-implementations of OSPFv2, OSPFv3, RIP v1 and v2, RIPv3 and BGPv4 for \
-Unix platforms, particularly FreeBSD, Linux, Solaris and NetBSD. \
-Quagga is a fork of GNU Zebra which was developed by Kunihiro \
-Ishiguro. The Quagga tree aims to build a more involved community \
-around Quagga than the current centralised model of GNU Zebra."
-HOMEPAGE = "http://www.nongnu.org/quagga/"
-SECTION = "net"
-
-
-LICENSE = "GPL-2.0-only & LGPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=81bcece21748c91ba9992349a91ec11d \
-                    file://COPYING.LIB;md5=01ef24401ded36cd8e5d18bfe947240c"
-
-DEPENDS = "readline ncurses perl-native c-ares"
-DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'snmp', 'net-snmp', '', d)}"
-SNMP_CONF="${@bb.utils.contains('DISTRO_FEATURES', 'snmp', '--enable-snmp', '', d)}"
-
-# the "ip" command from busybox is not sufficient (flush by protocol flushes all routes)
-RDEPENDS:${PN} += "iproute2"
-
-SRC_URI = "https://github.com/Quagga/quagga/releases/download/quagga-${PV}/quagga-${PV}.tar.gz \
-           file://quagga.init \
-           file://quagga.default \
-           file://watchquagga.init \
-           file://watchquagga.default \
-           file://volatiles.03_quagga \
-           file://quagga.pam \
-           file://bgpd.service \
-           file://isisd.service \
-           file://ospf6d.service \
-           file://ospfd.service \
-           file://ripd.service \
-           file://ripngd.service \
-           file://zebra.service \
-          "
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
-PACKAGECONFIG[cap] = "--enable-capabilities,--disable-capabilities,libcap"
-PACKAGECONFIG[pam] = "--with-libpam, --without-libpam, libpam"
-
-inherit autotools update-rc.d useradd systemd pkgconfig multilib_header update-alternatives
-
-CFLAGS += "-fcommon"
-
-SYSTEMD_PACKAGES = "${PN} ${PN}-bgpd ${PN}-isisd ${PN}-ospf6d ${PN}-ospfd ${PN}-ripd ${PN}-ripngd"
-SYSTEMD_SERVICE:${PN}-bgpd = "bgpd.service"
-SYSTEMD_SERVICE:${PN}-isisd = "isisd.service"
-SYSTEMD_SERVICE:${PN}-ospf6d = "ospf6d.service"
-SYSTEMD_SERVICE:${PN}-ospfd = "ospfd.service"
-SYSTEMD_SERVICE:${PN}-ripd = "ripd.service"
-SYSTEMD_SERVICE:${PN}-ripngd = "ripngd.service"
-SYSTEMD_SERVICE:${PN} = "zebra.service"
-
-EXTRA_OECONF = "--sysconfdir=${sysconfdir}/quagga \
-                --localstatedir=${localstatedir}/run/quagga \
-                --enable-exampledir=${docdir}/quagga/examples/ \
-                --enable-vtysh \
-                --enable-isisd \
-                ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '--enable-watchquagga', '--disable-watchquagga', d)} \
-                --enable-ospfclient=yes \
-                --enable-multipath=64 \
-                --enable-user=quagga \
-                --enable-group=quagga \
-                --enable-vty-group=quaggavty \
-                --enable-configfile-mask=0640 \
-                --enable-logfile-mask=0640 \
-                --enable-rtadv \
-                --enable-linux24-tcp-md5 \
-                ap_cv_cc_pie=no \
-                ${SNMP_CONF}"
-
-CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
-
-do_install () {
-    # Install init script and default settings
-    install -m 0755 -d ${D}${sysconfdir}/default ${D}${sysconfdir}/init.d \
-    ${D}${sysconfdir}/quagga ${D}${sysconfdir}/default/volatiles
-    install -m 0644 ${WORKDIR}/quagga.default ${D}${sysconfdir}/default/quagga
-    install -m 0644 ${WORKDIR}/watchquagga.default ${D}${sysconfdir}/default/watchquagga
-    install -m 0755 ${WORKDIR}/quagga.init ${D}${sysconfdir}/init.d/quagga
-    install -m 0755 ${WORKDIR}/watchquagga.init ${D}${sysconfdir}/init.d/watchquagga
-    install -m 0644 ${WORKDIR}/volatiles.03_quagga  ${D}${sysconfdir}/default/volatiles/03_quagga
-
-    # Install sample configurations for the daemons
-    for f in bgpd vtysh isisd ospfd ripngd zebra ripd ospf6d; do
-        install -m 0640 ${S}/$f/$f.conf.sample ${D}${sysconfdir}/quagga/$f.conf.sample
-    done
-
-    for f in bgpd vtysh isisd ospfd ripngd zebra ripd ospf6d; do
-        touch ${D}${sysconfdir}/quagga/$f.conf
-    done
-    chown quagga:quaggavty ${D}${sysconfdir}/quagga
-    chown quagga:quagga ${D}${sysconfdir}/quagga/*.conf
-    chmod 750 ${D}${sysconfdir}/quagga
-    chmod 640 ${D}${sysconfdir}/quagga/*.conf
-
-    # Install quagga
-    oe_runmake install DESTDIR=${D} prefix=${prefix} \
-            sbindir=${sbindir} \
-            sysconfdir=${sysconfdir}/quagga \
-            localstatedir=${localstatedir}/run/quagga
-
-    # Fix hardcoded paths
-    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/*
-    sed -i 's!/usr/bin/!${bindir}/!g' ${D}${sysconfdir}/init.d/quagga
-    sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/watchquagga
-    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/volatiles/03_quagga
-    sed -i 's!^PATH=.*!PATH=${base_sbindir}:${sbindir}:${base_bindir}:${bindir}!' ${D}${sysconfdir}/init.d/*
-    sed -i 's!--with-libtool-sysroot=[^ "]*!!' ${D}${includedir}/quagga/version.h
-
-    oe_multilib_header quagga/version.h
-
-    # For PAM
-    for feature in ${DISTRO_FEATURES}; do
-        if [ "$feature" = "pam" ]; then
-            install -D -m 644 ${WORKDIR}/quagga.pam ${D}/${sysconfdir}/pam.d/quagga
-            break
-        fi
-    done
-
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        install -d ${D}${nonarch_libdir}/tmpfiles.d
-        echo "d /run/quagga 0755 quagga quagga -" \
-        > ${D}${nonarch_libdir}/tmpfiles.d/${BPN}.conf
-    fi
-
-    # Remove sysinit script if sysvinit is not in DISTRO_FEATURES
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}; then
-        rm -rf ${D}${sysconfdir}/init.d/
-        rm -f ${D}${sysconfdir}/default/watchquagga
-    fi
-
-    install -d ${D}${systemd_unitdir}/system
-    for i in bgpd isisd ospf6d ospfd ripd ripngd zebra; do
-        install -m 0644 ${WORKDIR}/$i.service ${D}${systemd_unitdir}/system
-    done
-    sed -e 's,@BASE_SBINDIR@,${base_sbindir},g' \
-        -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-        -e 's,@SBINDIR@,${sbindir},g' \
-        -e 's,@base_bindir@,${base_bindir},g' \
-        -e 's,@localstatedir@,${localstatedir},g' \
-        -i ${D}${systemd_unitdir}/system/*.service
-}
-
-DEPENDS:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-systemctl-native', '', d)}"
-pkg_postinst:${PN} () {
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd sysvinit', 'true', 'false', d)}; then
-        if [ -n "$D" ]; then
-            OPTS="--root=$D"
-        fi
-        systemctl $OPTS mask quagga.service
-    fi
-}
-
-# Split into a main package and separate per-protocol packages
-PACKAGE_BEFORE_PN = "${PN}-ospfd ${PN}-ospf6d ${PN}-bgpd \
-                     ${PN}-ripd ${PN}-ripngd ${PN}-isisd \
-                     ${PN}-ospfclient ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${PN}-watchquagga', '', d)}"
-
-RDEPENDS:${PN} += "${PN}-bgpd ${PN}-isisd ${PN}-ospf6d ${PN}-ospfd ${PN}-ripd ${PN}-ripngd"
-
-FILES:${PN}-ospfd       = "${sbindir}/ospfd ${libdir}/libospf.so.*"
-FILES:${PN}-ospf6d      = "${sbindir}/ospf6d"
-FILES:${PN}-bgpd        = "${sbindir}/bgpd"
-FILES:${PN}-ripd        = "${sbindir}/ripd"
-FILES:${PN}-ripngd      = "${sbindir}/ripngd"
-FILES:${PN}-isisd       = "${sbindir}/isisd"
-FILES:${PN}-ospfclient  = "${sbindir}/ospfclient ${libdir}/libospfapiclient.so.*"
-FILES:${PN}-watchquagga = "${sbindir}/watchquagga ${sysconfdir}/default/watchquagga \
-                           ${sysconfdir}/init.d/watchquagga"
-
-FILES:${PN} += "${nonarch_libdir}/tmpfiles.d/*.conf"
-
-# Indicate that the default files are configuration files
-CONFFILES:${PN} = "${sysconfdir}/default/quagga \
-                   ${sysconfdir}/quagga/bgpd.conf \
-                   ${sysconfdir}/quagga/vtysh.conf \
-                   ${sysconfdir}/quagga/isisd.conf \
-                   ${sysconfdir}/quagga/ospfd.conf \
-                   ${sysconfdir}/quagga/ripngd.conf \
-                   ${sysconfdir}/quagga/zebra.conf \
-                   ${sysconfdir}/quagga/ripd.conf \
-                   ${sysconfdir}/quagga/ospf6d.conf \
-                  "
-CONFFILES:${PN}-watchquagga = "${sysconfdir}/default/watchquagga"
-
-# Stop the names being rewritten due to the internal shared libraries
-DEBIAN_NOAUTONAME:${PN}-ospfd = "1"
-DEBIAN_NOAUTONAME:${PN}-ospfclient = "1"
-
-# Main init script starts all deamons
-# Seperate init script for watchquagga
-INITSCRIPT_PACKAGES                     = "${PN} ${PN}-watchquagga"
-INITSCRIPT_NAME:${PN}                   = "quagga"
-INITSCRIPT_PARAMS:${PN}                 = "defaults 15 85"
-INITSCRIPT_NAME:${PN}-watchquagga       = "watchquagga"
-INITSCRIPT_PARAMS:${PN}-watchquagga     = "defaults 90 10"
-
-# Add quagga's user and group
-USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM:${PN} = "--system quagga ; --system quaggavty"
-USERADD_PARAM:${PN} = "--system --home ${localstatedir}/run/quagga/ -M -g quagga -G quaggavty --shell /bin/false quagga"
-
-pkg_postinst:${PN} () {
-    if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
-        ${sysconfdir}/init.d/populate-volatile.sh update
-    fi
-}
-
-# Stop apps before uninstall
-pkg_prerm:${PN} () {
-    ${sysconfdir}/init.d/quagga stop
-}
-
-pkg_prerm:${PN}-ospfd () {
-    ${sysconfdir}/init.d/quagga stop ospfd
-}
-
-pkg_prerm:${PN}-ospf6d () {
-    ${sysconfdir}/init.d/quagga stop ospf6d
-}
-
-pkg_prerm:${PN}-bgpd () {
-    ${sysconfdir}/init.d/quagga stop bgpd
-}
-
-pkg_prerm:${PN}-ripd () {
-    ${sysconfdir}/init.d/quagga stop ripd
-}
-
-pkg_prerm:${PN}-ripngd () {
-    ${sysconfdir}/init.d/quagga stop ripngd
-}
-
-pkg_prerm:${PN}-isisd () {
-    ${sysconfdir}/init.d/quagga stop isisd
-}
-
-ALTERNATIVE:${PN} = "pimd"
-ALTERNATIVE_LINK_NAME[pimd] = "${sbindir}/pimd"
-
diff --git a/meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb b/meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb
deleted file mode 100644
index 37cfc131c..000000000
--- a/meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require quagga.inc
-
-SRC_URI += "file://0001-configure-Check-for-readline-instead-of-main-in-libr.patch"
-
-SRC_URI[md5sum] = "eced21b054d71c9e1b7c6ac43286a166"
-SRC_URI[sha256sum] = "e364c082c3309910e1eb7b068bf39ee298e2f2f3f31a6431a5c115193bd653d3"
-
-CVE_CHECK_IGNORE += "\
-    CVE-2016-4049 \
-"
-- 
2.25.1


