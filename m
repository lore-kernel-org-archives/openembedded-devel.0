Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F9CC433FE
	for <webhook@archiver.kernel.org>; Sun, 30 Jan 2022 14:39:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.19451.1643553580420974488
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jan 2022 06:39:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kMCNIgd1;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=90298cce89=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20UETMJN002529
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jan 2022 14:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=K/PJEv1AYWy7br12O53BUqk4If61nV4EPhfV+frw1R8=;
 b=kMCNIgd1u8K+M3fcmGQZeLMkEcxtLxuY6iKNoyYHNDVgjZPQiks5Pl4YeevKqtzHYb/r
 1CFuMe5ufNV1EHA24YHDeGTi2tYdjvbhqW3q+e+WwO8FCOJ3xpYyrgt/VlNKksAnyZTU
 kQY1PY1FFH7KC87LtUJLVd3RmPdDsKEWaMnoDezYxds01gi7/RMqGe3b3eRLGXhXEmVF
 WPDEub/XgPKi6jHF7SaN/v9iKv5ySD0nh0iuQx8BtY/IooAm02xMQ3xZ+vUvEn+I1/HW
 cfM0fQilR2qoF+1JSXLkaYvZHv9XW5weYF7YnZ9BUzaKYrowG+e2EnkFJ81tg7KzDh+A sQ==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dvvj6rr75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jan 2022 14:39:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUldJnk0FTPh/ZC8uD86ukJhOl4cnWyO+YRkrC0/zSbZBSrF4pQEBkFyiBw7hsAvxKwlHlSeq0fMwvRk+jxCSrSlz8FJI8CcIPcuv+JtUzzYjoA6Fenv7xymitVLJPUz2DATDSz5jussvvTC48PrH/y+/i2qupelsXK4pE+IMQ7YxyebMxxPX3r5LIRAsNV5tzbYC1cbZyfNawQZFoyI+U8R4gfYcssfi8Bc1ND42ilw5yUQGTPuDaTYQWJ7sDHx/P8jX+2h2H9YyXQ+ODGKT4+5zf/NRKJWIIbBZbUNKXNn/FkrEMUtGrkRJ1udO3RJL5czP0gyl8UFPK5XbKmyYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/PJEv1AYWy7br12O53BUqk4If61nV4EPhfV+frw1R8=;
 b=ApQsnH8DsZQ74iYZ5V+qtXwyZRKqTbRwnPoPt6O0Z9T5Z6IsinXkfeTXsXywWr0B4BDMy05hdHp33KCQYmoLyFoX6QIaH2f0mC87rMeX6wdAFCXzIY6UdgLYgxTaYgs4smgCWPG68CZb2el/vjdMumVzSKgB0UMsDkVLv2Q+d0SlQWO14EcYdI5IoBtR1YAprvR+fZ+yqNql3NwwhtUebqhsjmYdLSriAZaqfVYWinIdv6WbvzlXNBhh2kdFMfNytsUgb7n7M9kN1FT8Efm3WQOggYxbTUedIepfVBbqeD9DFBUzEDYfk5r2Uy8oW242ubjYfbLDaUP0IqyCYqlfuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by BYAPR11MB3256.namprd11.prod.outlook.com (2603:10b6:a03:76::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Sun, 30 Jan
 2022 14:39:36 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1446:8499:7fbb:a706]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1446:8499:7fbb:a706%7]) with mapi id 15.20.4930.021; Sun, 30 Jan 2022
 14:39:35 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] tcpdump: upgrade 4.99.0 -> 4.99.1
Date: Sun, 30 Jan 2022 22:39:23 +0800
Message-Id: <20220130143924.44775-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR03CA0104.apcprd03.prod.outlook.com
 (2603:1096:203:b0::20) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6c87b19-c39e-4ca4-e656-08d9e3fe5601
X-MS-TrafficTypeDiagnostic: BYAPR11MB3256:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB325697688D131DEE595E50E4F9249@BYAPR11MB3256.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gA2RzaQ+vtkjjosw7VheVmfArWyr9Q5bdOgCaeVvtp0j6trI/Yuk533OCT3l9hvaXZOxRfkWCroFukKxYEKTpj2WhjptaGdRcDo3TOueXN7PemQsWf1eCYk9veSuzciD5vzA0mWlmsudJgwu0kELjUrG75pwPd5StCQBre9Isn2K0FKYj2S5J9NeP480t36sfLAKxB5q0lgVjD/msOdQZFVaONnjQ1tICxvt2M8UXvbD72fPicuh7EJS0k3KquJEhRBgdSWT2VW1oJlvXlMhAu3iUdPk05yjM2dPnMV1S7x1zCjn3Idc6sq+aGZS9Z2H3kEhrD3yxKZXG/yjVqqHg9IguSkrMeB3qvoDAWTa1/CTlbnvVNWPGuRbDTr5PiduXFvF4djxmD/bkSUfJXiT2UJSA6V0Q6Ya+ESxERyZxJY3K9HUCaRu054wrV4GmB0czIH65/x/8lIl6ww0xUpKS7w7V2Z6KiqenGexheQBcV3hjg76RcdvOpyPh7jsMY72DNNbuE23a03oeDn5RM2lxS6F+HL34ci4Rs+RUd2Xr8z7lTBdSfWI+ELXd1QfGQDGSUvFEgoX2dQaSK4qaZkhXcK5veXSn/TR/wlICyzaFu1fJRv9I4peFk42qXMCIzOoXZJoX4wyb0EKxMroQEeABTk7jqZYePiIK/V33avxbPKj1mwyFtqfBJvmVuAwL0SbdW1MgwYZUzlzHwwa2MdIQ6DdfT3VeDHhG0HnukISymt0JDJl2HMdZidpkq7XJyKGeIpyQpSzQveN5SYpzjuJFN7qO7bKJKhWEU2z94Jf9Yg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(44832011)(2906002)(83380400001)(38350700002)(38100700002)(36756003)(2616005)(5660300002)(66556008)(966005)(6486002)(6512007)(26005)(1076003)(316002)(6916009)(52116002)(186003)(86362001)(6666004)(6506007)(508600001)(66946007)(8936002)(66476007)(8676002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pZolFzN6H2cCEpjwrkSxV03k9aAYc3TznOVARRh6Hch9U/wgqi7VlvMTbGN+?=
 =?us-ascii?Q?P6dOvbYOODHrJCgjNrunrw3Nm5ElQzxZRKxh10K9ArJ3Cq5uowg319FMb5oC?=
 =?us-ascii?Q?e9gyP4RJSe+1cdGwtO2nhTle9HngMoTTPSpiBPdf9R+/d0w9FCm8zf7Qhvni?=
 =?us-ascii?Q?tQzTh8FE8YbrTAKq8qsfti5oal96nvBh05TwdBpl+9Iak64+angOQjA9uVKc?=
 =?us-ascii?Q?cigu+6HFC4pouWdz+zW0RGdibx9TBkdz24Ea9AylfOfAeXawTZeUnuO0YjbB?=
 =?us-ascii?Q?bLhKt3ffty9v0zoAgiiiNJAK0h4XhqzOhZcI/lUsWEL4VZYzgbHMwbz4wv7Z?=
 =?us-ascii?Q?2L/I8ZxHxaarZGPDdtJ09eO22vvm2DHP0we5nGNMNXvlw5BpSZmDKAKwWvAZ?=
 =?us-ascii?Q?RwA7JbCaXZNbZwwJLNKDi3xKHL6VOTN+uywHDuufFMoHEXQ96NKicLXcMAce?=
 =?us-ascii?Q?6McCUjThHQBZQGHQmz74V+VR3gBI+AZCV8hEox1+WN8WBCf6gH3ilz5SApAd?=
 =?us-ascii?Q?MBdiOVeumKolCkmonGQz4mVZaVCpiNjPViiSeKQzltAJbTIEhbbnE8xGdG/j?=
 =?us-ascii?Q?pEsW0XTJ5qeN7XdHiymaUjSEhBP5BdrJkY/M33xU1ngrIRRcLzysvU80yGKV?=
 =?us-ascii?Q?1YEoPT6Hi3hRKBR6JX5yqASJFuYhTTrUeH4cPiYd1QqM6Flsq3k2dVKUmaMO?=
 =?us-ascii?Q?dWxNkEsl4RdwDAA4KVea5H+kAK/NdJdHs3J9UcQHY3OLkDKREnws2fTjArPe?=
 =?us-ascii?Q?ETv5hYnsBD2Pk2B7E+Ou6YtNRjr0gd9b0AbRlID0JILtRfMLWL16sEiFsHL0?=
 =?us-ascii?Q?dLbsTaPArWTuSlnkPhKTUBUvJecvxSueDhsMKPeI8IYJbhBA++YmA2thlfZC?=
 =?us-ascii?Q?XUHw9cchKue6YS/EfYlsARAgfIcqQqbvehUBec8H2COsQgxNdywQspPGFhDu?=
 =?us-ascii?Q?Yf/er9T4m+ty5gDswjlYDyv7gH+nW7drj/BxwII+IUo5CTmy0VLSzuAnZA/6?=
 =?us-ascii?Q?hpOj4L+MAo+dtXBu69/YbL7Q8qO1R0sU9gN57V+VBs8EsVHQrwm5ruVinhgX?=
 =?us-ascii?Q?2aObiKtZNientRPrtUcO7w5atoDvWu3z90PSbkMobuHoXyEqm3DC028xk/wW?=
 =?us-ascii?Q?nugeJQiGS5klZqoYv/l+k1e2dOPRwEForEu1B8GgwNsi5bAiO56y92HGHzol?=
 =?us-ascii?Q?pRn5+tPO64LQT2MOAxQG/3UgudsbObV991F+aQgspRxsgTLqnC1IpPmaSjqe?=
 =?us-ascii?Q?O7Nz14A16EyX29ZrfOn/+jnsEmLLFUaTH/Its9J9wHjw5H27RdMHB0+03/ZZ?=
 =?us-ascii?Q?htD24CDaPyGKAmAorJLiqrnr036A89vdNAm3yyyjl5khcvvlFAlR/UfPXqki?=
 =?us-ascii?Q?8FhdINrHvruSjOnavRRf4Y7gxsuI6C2UfikBzlSAmdOo+Gyv3kcKRGL4NKAF?=
 =?us-ascii?Q?R7K41UGsjrgTKfsbj1slpx2rDdGzPSv4HI6juQAtjQGuL8KUwat8hHuDoWvK?=
 =?us-ascii?Q?4JHiVlcg29KKdCParAvyUXrosaHdVdU/lbvyn83eoYQbCOER30x6PTdFOofk?=
 =?us-ascii?Q?VXfaObyrjGbpdAzTwFnu3vaBnMY0hDMuSJFLJsHsO8H2CESxCdtu0VxvUxo6?=
 =?us-ascii?Q?acQsnkZIvp9dVEAmaNkOb18=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b6c87b19-c39e-4ca4-e656-08d9e3fe5601
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2022 14:39:35.5205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WfjXWzLjlo3QVDTtqsKovbSVHwA260bfM2rOXYXYswkrWMatywI79g5vH9o42X5kgkJ/PJy5bh6/6iqwOgu98Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3256
X-Proofpoint-ORIG-GUID: -Zv2NZ59r5itr9dDYwutioUK-E7vqYfv
X-Proofpoint-GUID: -Zv2NZ59r5itr9dDYwutioUK-E7vqYfv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-30_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1011 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=646
 malwarescore=0 bulkscore=1 spamscore=0 suspectscore=0 lowpriorityscore=1
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201300105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Jan 2022 14:39:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95177

* Skip aclocal in do_configure
* Inherit pkgconfig then we can drop
  0001-aclocal.m4-Skip-checking-for-pcap-config.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...cal.m4-Skip-checking-for-pcap-config.patch | 33 -------------------
 .../{tcpdump_4.99.0.bb => tcpdump_4.99.1.bb}  | 18 +++-------
 2 files changed, 5 insertions(+), 46 deletions(-)
 delete mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/0001-aclocal.m4-Skip-checking-for-pcap-config.patch
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.99.0.bb => tcpdump_4.99.1.bb} (72%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/0001-aclocal.m4-Skip-checking-for-pcap-config.patch b/meta-networking/recipes-support/tcpdump/tcpdump/0001-aclocal.m4-Skip-checking-for-pcap-config.patch
deleted file mode 100644
index bb56c4d4c..000000000
--- a/meta-networking/recipes-support/tcpdump/tcpdump/0001-aclocal.m4-Skip-checking-for-pcap-config.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 867bf5c9d0fb64e1b4e64cb13b983674c270a6bf Mon Sep 17 00:00:00 2001
-From: Yi Fan Yu <yifan.yu@windriver.com>
-Date: Fri, 19 Feb 2021 00:52:35 -0500
-Subject: [PATCH] aclocal.m4: Skip checking for pcap-config
-
-Bitbake triggers an configure error
-saying we should look for pkg-config instead.
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
----
- aclocal.m4 | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/aclocal.m4 b/aclocal.m4
-index bd4e27a5..136cb8ca 100644
---- a/aclocal.m4
-+++ b/aclocal.m4
-@@ -584,8 +584,8 @@ AC_DEFUN(AC_LBL_LIBPCAP,
-             # No pkg-config
-             # Look for an installed pcap-config.
-             #
--            AC_PATH_TOOL(PCAP_CONFIG, pcap-config)
--            if test -n "$PCAP_CONFIG" ; then
-+            # AC_PATH_TOOL(PCAP_CONFIG, pcap-config)
-+            if false; then
-                 #
-                 # Found - use it to get the include flags for
-                 # libpcap and the flags to link with libpcap.
--- 
-2.29.2
-
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.0.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.1.bb
similarity index 72%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.99.0.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.99.1.bb
index 97a9027af..322a826f0 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.0.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.1.bb
@@ -24,15 +24,14 @@ SRC_URI = " \
     http://www.tcpdump.org/release/${BP}.tar.gz \
     file://add-ptest.patch \
     file://run-ptest \
-    file://0001-aclocal.m4-Skip-checking-for-pcap-config.patch \
 "
 
-SRC_URI[md5sum] = "b10aa2f497def7283bc060f626879ce5"
-SRC_URI[sha256sum] = "8cf2f17a9528774a7b41060323be8b73f76024f7778f59c34efa65d49d80b842"
+SRC_URI[md5sum] = "929a255c71a9933608bd7c31927760f7"
+SRC_URI[sha256sum] = "79b36985fb2703146618d87c4acde3e068b91c553fb93f021a337f175fd10ebe"
 
-UPSTREAM_CHECK_REGEX = "tcpdump-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
+UPSTREAM_CHECK_REGEX = "tcpdump-(?P<pver>\d+(\.\d+)+)\.tar"
 
-inherit autotools-brokensep ptest
+inherit autotools-brokensep pkgconfig ptest
 
 PACKAGECONFIG ?= "openssl"
 
@@ -42,14 +41,7 @@ PACKAGECONFIG[smi] = "--with-smi,--without-smi,libsmi"
 # Note: CVE-2018-10103 (SMB - partially fixed, but SMB printing disabled)
 PACKAGECONFIG[smb] = "--enable-smb,--disable-smb"
 
-EXTRA_AUTORECONF += "-I m4"
-
-do_configure:prepend() {
-    mkdir -p ${S}/m4
-    if [ -f aclocal.m4 ]; then
-        mv aclocal.m4 ${S}/m4
-    fi
-}
+EXTRA_AUTORECONF += "--exclude=aclocal"
 
 do_install:append() {
     # make install installs an unneeded extra copy of the tcpdump binary
-- 
2.25.1


