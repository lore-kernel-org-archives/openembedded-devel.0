Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FD5C64ED8
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 12:41:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9447.1677156065562825680
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 04:41:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RTNdDYGF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=141849fe7d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31NCWe0P007352
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 12:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=WRiYvNUGaDMPg76T76Ewfgo1zBPY3paS1ijnX7mUlLk=;
 b=RTNdDYGF2E0EhmHuGOXTbKqNyYUwWkqA1XVkZb8LRX5W2kOpHAObvJpAAb6jIsc5CRe3
 5lANGJR7Zqs/V8BOzMa3ZgTphA+ozZiFassO0MYgsXovPbIAFu+E2w7g9TMP777+79mJ
 gOY6KDYEDLhGAXF/FNm1ECJrOclaE4kxZd6zeqZEaivPSIA4aKYQfJEOnN4A7bb/k/+J
 M476Na6Gun2JNyqoDEiB/hMbMhpc3Pxsci97CWZsFJwjwqLNcObmgJXVHdRLbkD0bZrs
 cDXGeDvPYZgJlyQgHkwfElJcW8PFS0ql/ybcZ8fKA2fzq6G1oW869MbAnieYxBzXlj6G Uw== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpd3vqxb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 12:41:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MD48BflX3wvaGSwCgHFgCsf1giPw/p/dSIGAduxKgt9nteatR9Dwmy7lsdTCaZWmVJ4o9zTtkAvmfqA1wGmARjwS/p9Z0p0F4RB8IUJMpfd3NOb17MuJHIdMDcx41chkHdggS0IcyUKPlPvdIdH/0TXsR53AdrzX5R3gn0YvNSt6ajjIz4Ln2eWPmSSDJnJdQC/xJzbcEHpch1NEgHZ0l/jyXvrzcbX801CBDW+i8i/COHnZjp39LDHKW9+PIRbLf+txJVqYlBXPZdvG8eBxq7KD1Hwer6l43KmdyLCqZ0e1wo5nI/iwLw9ASsipGM+kQCcFqfsVNI0cY7TfkpKoXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRiYvNUGaDMPg76T76Ewfgo1zBPY3paS1ijnX7mUlLk=;
 b=S7FYTWfju9iU73PE0i2maNoU9OlyFemTCMx0+TrlKrCBYGFoYpVhKhkHeJQX3tbyHpKudJg4cvjuFtY/3r57y9CEZCC5I7Ns41NFG6MnjMEWvSQSLeZSH65UJ8SezOpNwpA5OXMHLU997womcygxn+H2iDhhvqXfa3WL/k4aatwVK5YSZVqy//KV/UWukcu3B8oqiMuQhsssVlut6SE0HL7Mm5iA/ojX9/6xxar6cdjuI9vVTVnkad8rwNXUhqlMavJrXkqupdL6IXLYwFiUST3pt5opk/ALUiFF72/3Kjh/+YBLW6heHnrxHOluyz8r5ReEOXdR5twBBkkmihw1vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DM4PR11MB7278.namprd11.prod.outlook.com (2603:10b6:8:10a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Thu, 23 Feb
 2023 12:41:01 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 12:41:01 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] meta-networking: fix Upstream-Status format
Date: Thu, 23 Feb 2023 20:40:48 +0800
Message-Id: <20230223124050.2282580-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230223124050.2282580-1-yi.zhao@windriver.com>
References: <20230223124050.2282580-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:a03:255::27) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|DM4PR11MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ffd04c6-7ec6-4338-c4f2-08db159b387b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4xrmXP5flJt/zWIyXyP9gzNg/nv6dGgs06HxF3xuDYVgEpxX8Jzo8LTTLGQdL1a7RVyXFyL59RhnMkJOEOCBfODjZIIeiaxfXkwgRFQ+Pp+OtdocPhRjU0dY82w5iOfA1atTiSXKxcl+8ZWLjYu45FtJI5hJTgRDdpRrht1Ze95qH8qO3HFNXLPo/hy+1qt4X2/u+v+q/UxYC9+ehfXTei6ctNAIh1j5HoM1jWk+bN3ByakcM29d1LtiJxscOyXtEXH+M8aXINvwkyZt2bP0R5UyPQWZtXcYMldX9BnQqh/ipObQVlz6xlXmU8vaRq9TBnLq+ltgTawzalHaISNZT+F93nfZf89sbVITLBC9gMWuBmuxOi43uOBm2VbqrqgTbgVOzd6CQ2OiPOIu2FftaJA2FotwsOdmqUcOLFe5fUdnQjwk/ko25i8n8HyXiTrzKcSEta1yw3EOZjoueNpRTPyTtI9wA6cFM7rmqQA13tyc12X0lrJjuiVr9FoLP6EQKqj10F7TAMKeTRxsPRLyODmpQX6TZmHYZzNiY67AgWGA9segZKZ4oApb8USIuVfLp1P48355WbQRNfdgFH8ESslgLXPF8/YDLHXn45pDcnM1M5NuRr7V5a7FjapP2MzmLiRdjvlreWCMAYsmx75HlL8g9rxcj7qnKk0P3an9jJ5K8pUm8sw7/obEIQcSJaru
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(366004)(39850400004)(346002)(376002)(451199018)(38350700002)(36756003)(38100700002)(966005)(2616005)(66556008)(26005)(6506007)(52116002)(1076003)(316002)(6916009)(6486002)(6512007)(478600001)(2906002)(66946007)(6666004)(66476007)(8676002)(83380400001)(5660300002)(8936002)(186003)(86362001)(44832011)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AOKGntlN8BwwW10OPt2WhcEwEOhSERV68u9/Z83vM0CICG0yxQyFRaHtizVL?=
 =?us-ascii?Q?lcpZIXEgUmVRnYqmlqNd6z83g/8cFax504DR4EXTDoNSYFmSGWW9RpQwnOEB?=
 =?us-ascii?Q?O5pWQonXk967i6GDyXbywPg2qzPUp+h0ONjfxRN2bo/wduSTBeto9/bMWLfp?=
 =?us-ascii?Q?a/UPfFCnkYE8Dz+ZY5SXHHYeJWNOETfMGkv/SbHetiX4Ya0t+h/3H0sPzFZK?=
 =?us-ascii?Q?I5EtflRW6mcPtxhuMefiA4smnOqc3oN6Ei4X/gUDMpyT/b4f7g/mP+HjxbuV?=
 =?us-ascii?Q?E4yhYVOktk0LEhkSO4G+nOUhPtCEB+ABo3HgDPZ5PBnJK2iW1Davyl5EPQLI?=
 =?us-ascii?Q?4CerVzo35TBNjK0nZHXIUYp4H4Tcko4J7FzS892zwfS7rsnMy8kks1Se7kzK?=
 =?us-ascii?Q?I1fFWnTIfBpW3t1eOk4NoI0ZaiqQSBhqiFrGtqr3tA44rpx8wdkPGfEvbdQq?=
 =?us-ascii?Q?OFMUx8+N2vJTJrGCbPGfOie4Ni5dtSKrhXjIkrMYkiYNcZhnYOdKK83uY/RE?=
 =?us-ascii?Q?YZMD0wl4Qse3FlztgdDm8BpJ9/3E3LHE+Y3Csu6OjgVqTLgDQSNDXGUVZ40Y?=
 =?us-ascii?Q?wSUZIoA3tDkMrqRibTtnOwCifrXK+nvD6+Bl4mdaCFnst3ZbBzhCxOtJLib5?=
 =?us-ascii?Q?Cm2j6rk3tFvFmW59/6PPsObLEzw320UTxhVOUufinI43//W8V4oq0hcZM1LF?=
 =?us-ascii?Q?X6Ic+ZykSASznvawL990wOfOvBZACUQA/pJHogqdlUbs4nzbLzprfALrxcLK?=
 =?us-ascii?Q?1ISdmzCStlpdJ+X4MIPXwBp4Ytc5ziHrzlYQWjOTNEe/hxEA9N9o2YvnlyNP?=
 =?us-ascii?Q?2ZSs9c7jl7YOLltpplARANhMml9nzzL191fQRBpiBiAwesdXS/abytP9teyL?=
 =?us-ascii?Q?tEGPSrbaz51yUf17Wvxg3jsIjkGBig1l5S3JgYEAA44vIr9h+xCMV6HH4VKJ?=
 =?us-ascii?Q?2F84km8wvS5TcPaGhem6BLO6VME2Pha5TlbAGg+XbRq0ehsF6D2Uiy69qM3M?=
 =?us-ascii?Q?9LzSS4o+MFWXutksBDCEs++6lEyaoewgE6bk1azEhOG1JFjpEn1KOJXTAtLM?=
 =?us-ascii?Q?377boYJfr/3z/Gl5yM+7u4dg4XHWpF8vaq09fhYP93lSKW43ZiYG6W6BDRV3?=
 =?us-ascii?Q?yxGyTU8e5iFTvwvi+C3OZm7de/ui5fh51oXwbCdoDESz6tPn3nFXKmpDIXcI?=
 =?us-ascii?Q?bbLQYWRMXuivWZFlORmnSLgDQ5U+sxs1F4mloTsCSAtFSo6vm2XsYthSaFVR?=
 =?us-ascii?Q?MCoP4Z3FCRLPUsR69G4ktFydPy+smU/6GZweMFxwhyFDRcYdWZ+r3NBxJh4C?=
 =?us-ascii?Q?vnfDeq+dyB+CnzC14jgCMqdH703u4/GijoBukAF9HDlNCzupZQOEDhgHxfbY?=
 =?us-ascii?Q?CS9Erjv+i1ZP1j7uwj9An8X37hUe8jovvTjQu8BmCsOOERAJ8GPlnNJ7a0yK?=
 =?us-ascii?Q?86l+BaeXkYk9PO8nUiRnMqB8EsQYQ858490SYOdQAiR+twBkb0/U4wctnd6H?=
 =?us-ascii?Q?BePumfYY9sP1OaHDf131Ku1FHds88W3+BZ66Bb9+JdITRszBXalcmQN+qt40?=
 =?us-ascii?Q?h74an2bhZPmAXNeWWRkJxkW1524UEoV+EZ1bMn3kPvrL5NdhfAz2VHigFD67?=
 =?us-ascii?Q?1w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ffd04c6-7ec6-4338-c4f2-08db159b387b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 12:41:01.7774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQgc0Z0D6rMDs83RRPm9lJuZx80n+I9mtlr4tvF3t/JB9gUJOlqC8tTjX9tbhpnby862EQXdSXBgVlyuA5QCWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7278
X-Proofpoint-GUID: Unj5jmFz5s8rMYQEyhicFelBwptf6LU-
X-Proofpoint-ORIG-GUID: Unj5jmFz5s8rMYQEyhicFelBwptf6LU-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_06,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0
 mlxlogscore=868 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230102
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 12:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101225

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../dibbler/0001-port-linux-Re-order-header-includes.patch      | 2 +-
 .../recipes-connectivity/vlan/vlan-1.9/no-HOME-includes.patch   | 2 +-
 meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/gcc4.patch | 2 +-
 .../0001-replace-__pure__-with-compiler-attribute-pure.patch    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler/0001-port-linux-Re-order-header-includes.patch b/meta-networking/recipes-connectivity/dibbler/dibbler/0001-port-linux-Re-order-header-includes.patch
index 27a562bf2..884be404b 100644
--- a/meta-networking/recipes-connectivity/dibbler/dibbler/0001-port-linux-Re-order-header-includes.patch
+++ b/meta-networking/recipes-connectivity/dibbler/dibbler/0001-port-linux-Re-order-header-includes.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] port-linux: Re-order header includes
 
 linux/if.h when included before net/if.h casues duplicate definitions
 
-Upstream-Status: Iappropriate [Upstream is Dead] 
+Upstream-Status: Inappropriate [Upstream is Dead]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  Port-linux/interface.c | 2 +-
diff --git a/meta-networking/recipes-connectivity/vlan/vlan-1.9/no-HOME-includes.patch b/meta-networking/recipes-connectivity/vlan/vlan-1.9/no-HOME-includes.patch
index b7ab7d97c..fd7a14adc 100644
--- a/meta-networking/recipes-connectivity/vlan/vlan-1.9/no-HOME-includes.patch
+++ b/meta-networking/recipes-connectivity/vlan/vlan-1.9/no-HOME-includes.patch
@@ -5,7 +5,7 @@ Subject: vlan: do not include ${HOME}/linux/include dir
 in front of sanitized kernel headers in OE chroot. Drop this include
 option.
 
-Upstream-Status: not-applicable
+Upstream-Status: Inappropriate [embedded specific]
 
 Index: vlan/MakeInclude
 ===================================================================
diff --git a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/gcc4.patch b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/gcc4.patch
index 089156a7a..83bcc4b49 100644
--- a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/gcc4.patch
+++ b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/gcc4.patch
@@ -2,7 +2,7 @@ This fixes an issue when building with gcc 4.x
 
 https://github.com/openembedded/openembedded/tree/master/recipes/netkit-rpc/netkit-rpc
 
-Upstream-Status: Backported
+Upstream-Status: Backport
 
 Signed-off-by: Armin Kuster <akuster808@gmail.com>
 
diff --git a/meta-networking/recipes-support/ncp/libowfat/0001-replace-__pure__-with-compiler-attribute-pure.patch b/meta-networking/recipes-support/ncp/libowfat/0001-replace-__pure__-with-compiler-attribute-pure.patch
index 3ad3b4aa8..880d80b10 100644
--- a/meta-networking/recipes-support/ncp/libowfat/0001-replace-__pure__-with-compiler-attribute-pure.patch
+++ b/meta-networking/recipes-support/ncp/libowfat/0001-replace-__pure__-with-compiler-attribute-pure.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] replace __pure__ with compiler attribute 'pure'
 
 Remove defining __deprecated__
 
-Upstream-Status: OE-Specific [Untested with dietlibc]
+Upstream-Status: Inappropriate [Untested with dietlibc]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  byte.h     |  22 ++++++----
-- 
2.25.1


