Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F6EC4706F
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 07:50:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1319.1704095414464403567
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 23:50:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AdcvWNXW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17302f783c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4017naQa013571
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Jan 2024 07:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=0Kj8lIiOLuoyqDG2AC
	qoRE6Ie31EOjz/U2pABGXWwTQ=; b=AdcvWNXWbt6P8xOM1v2ybZHHLMOWKwszbq
	ekmS+WZjH9Y+6KRSduUKN0iFX8N9YjQta1yXB8iIoILho276QbCH6n9L9aoO9DNW
	ej2sAs2aqz23lrQaQl6oV3CvF5uQRrg4N/9XM9kSrF8snWWYe/QbMAp8ArdA+KHl
	U7jKjFERJtKYYxA/U6BBpZjUGsotYyD12dz9f8kLmGMk2+3mhAdsqOoEXZYsi2v1
	rRAZ22JZK+XcdG+LdEhxtl7tDAgUaPwcve7XLz0D/YVPk/32h/l7dBS8Xri8xRPe
	0FP2ee3fRcjn5RS9YUAUGBl5h9bF5rLmPV1ZCF0U0ueueSAa87gA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vaa661pjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jan 2024 07:50:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdwPTfYhzCesD87lHXgSjoiXfaeeczApg5gzizIg2h/EP1B2COtJWrZsdHTWRB+XG7kqbEhOByBkV9BpA6cefTe2Q4QfivtHYePHjjoVJkLh8fX2PUaY4FWE3oWPsvnuSpg9cSp5kLInEsAFlPZhoHNkar6saDoFnvQmx2EECpBmAFu9tnJm25V45NL4rKRiaghtRSVzhlCYKoiEFjLjO/UkXsjDQvfWoIyrx5KODiU0in/975kPiBAIIU0pFC/TEdIiJVHRjcW9Wlt1pg6UH11KZ3BuWjImeHr+SBVJj2LWHeFZH2jFcmfIKl4WmF3qc0AGRMtLE6FwexDg4s1P+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Kj8lIiOLuoyqDG2ACqoRE6Ie31EOjz/U2pABGXWwTQ=;
 b=H3cy7n5hvaAyUmNaQ7LzhmH5m8c2RQLpYd2G1YN4OrJVCq4sYn4taJVkVlnOM+lwqosSTalMYyaUiJLu1i/f3vnpnEGNQiqty83nlhmMs7UEdIEX7U8esUj4krT2FlM0Rujm4tS397bMom+XNKrS/pp2iaCwPVznpAFlVQZ4A3+UZPweoO4MIs5eqE+KRufxI/TcKD6fs3LpH9L/wQPKAcDt7wylyquzIjAlvZQU6kcezVe8Qw9nnZJqpeZs3GhkPo9uyG44TkLpyDnEcWMlOSYWMjHz688cwRPCyuaOlhDndpaOZXXxIMbM2xDBDEQhbN79x8WYKvZsPR+uhIYlNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by IA0PR11MB7814.namprd11.prod.outlook.com (2603:10b6:208:408::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.24; Mon, 1 Jan
 2024 07:50:09 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3%3]) with mapi id 15.20.7135.023; Mon, 1 Jan 2024
 07:50:09 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/5] libtdb: upgrade 1.4.8 -> 1.4.9
Date: Mon,  1 Jan 2024 15:49:54 +0800
Message-Id: <20240101074958.2782143-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0368.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::19) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|IA0PR11MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 96dacca8-fe3e-4ceb-eb97-08dc0a9e46b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fQMMUXoyUpFbciR1MQYKbiHzjS8z9FE5LyGCFaKQT5ZP6+O+0/xbyxzjF7FmYUEM3OCYGZi8g+46gDUtmXFqa4zhPgf8Zc48GWaf3NGmhIIIZlOwgUDgc4MyQ6ZlRjYy49yYCS7Hv27sbRQ+jSbhYcQyOqlK3Wu7iasG8Goioys3IZNCv8XPFw4DxR+EID1v4+FFzZ9IJE90KJChpb96Da+yeWmf3pgHCqlwiAYCePWZyp0oh7NY1Krfo+R3Oa6v4TYWOl1SzzVZ+KWC+GAolTDk5W1gPi4JfQSkND8LG+FmObeXEAIvPiYrEbNIWt+juMRjwCqhS1OkgGtiwbxR17PdYaffl/IpMEaqPZJMWB0PmWGkccq3BmtgTx/clSCTPmn0jp30NyBJeDQ4XfNvF356UUTqBCljwcR7xWm8yuVM4x1kPvyIiDOU4nFaBGchhXur7na+xs5FvPH6HyfnW1AtV7lPQGbJPLks1TOYLRNVfdK2TUPu0Lt6y2G4DTnsEFanXO+Ffzz7qQs4NvCr2wNlQh7xyKDk5c9QIwDcqseMjSUoUmKxdu35t4ahsaiEal60nNADNmTF35EeS7gHt/2yd0bGPjR4gh/l1QM9FxU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(136003)(39840400004)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(1076003)(26005)(83380400001)(2616005)(6666004)(6506007)(6512007)(53546011)(5660300002)(44832011)(41300700001)(2906002)(478600001)(6486002)(316002)(8676002)(8936002)(66946007)(6916009)(66476007)(66556008)(86362001)(36756003)(38100700002)(38350700005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3MUVZXKuTjQTpMfGEXTjNrFp7sClCtiMbvqFrfGE8jpA3oswKjIS4xZBWWSP?=
 =?us-ascii?Q?UgXG2CzyFgSduANUIQdF2ZOZAV/dVGcRq5q0eaXo2ofivf73Cx571q248uj7?=
 =?us-ascii?Q?OkJ5Sy1DxmNUhJuipFzGp/y3MSrJ/8SbIly8J3uVK94xrdz38wRuSkTWzsEu?=
 =?us-ascii?Q?ye9/Cdyn/2wtXdUcJmJXD37TNaDyKlr+iZaho85aB3hYH0aYOF5FiSd8uwXz?=
 =?us-ascii?Q?7RyLBra/2JXISWX6NAHFXcHb0kw03aPDCta9v48PmG67l/Fff4Fk7vxoJyIc?=
 =?us-ascii?Q?q+QEBT5Wzm7ZQ5Y8Yl5QJQvkOy3wXsPLum3d/7JrpTuQGEtI96vmiJFOZGJW?=
 =?us-ascii?Q?RG5EaGG0mQjJ8kKda98YFojbFjxzu5sclSLUdDKlA7vvPC1z7t53WEHTaQ6i?=
 =?us-ascii?Q?zKCkbBfpwGGH8vtamYK5CcKdLJhoktT5E1qWSfN4PjjPIXISOVKLaTpopPpN?=
 =?us-ascii?Q?aOvGtlU16LJDzA3jAeU5tb8RHdLXE+jYMTPj2m5ES5iQVNxbjK8AmZnyeHrw?=
 =?us-ascii?Q?7qhUkvQy5q+vNTi1BzcQCnSlbkbFhpR9MivplTS4hwxKBQ9b1vQ81E0noQOD?=
 =?us-ascii?Q?wp61g2lc9Zefo115CDNzNEmXE4loNh5lrZJtW8GQ0u8xZ2euxGg2eb4M6OfZ?=
 =?us-ascii?Q?QVaBGf+6+sHjglYdcakIHqFFoSc1i7Mt45yyBuUGsZWOnqp7tLAIQT9+YnSc?=
 =?us-ascii?Q?h9ayqJHTld0QsXbEb7T3tOrynrPG2yisRNFqUR4vgwe3xA1K8I1jsnAiSoeq?=
 =?us-ascii?Q?jHVKma+jONg3NiHt6xoC8emiuNNUinUIB0cOCCOSHt3G7j+PU97vaXIeu9Ci?=
 =?us-ascii?Q?ruw5SqaR+yLWFaypqw0nScALDPErhwe/NgB1Toy4aD+jHFkhkxu9+QJRJxAl?=
 =?us-ascii?Q?45/bAqJ0mVJYLpBJ8xq4S23fyLxeziLpT4pCj+Gvk0PJhJ65+rhsDjX2H/XZ?=
 =?us-ascii?Q?Wair/aR1Z7nputakNelWb0ecc8SsBOJxIrNOvDG9IpzHV/M5EjKuI8egbKFN?=
 =?us-ascii?Q?gR9elKnvBZdADXGbXuDk7384CK6rZY7NuG7pyDY6gcPU4loGpY4yWG5XKJbB?=
 =?us-ascii?Q?0lt0ElTXThkgOsYM6b7QunDXtxkKl4High4OM3VNazKuhHHNdeVgJsipKhIY?=
 =?us-ascii?Q?OdwG4iwYBohvcbv1AVOZFfGJg35pcJlIgjkTxGgfbAo1n9Tw9la4J0Swycka?=
 =?us-ascii?Q?ecDQfNjFQFFFDAWYj4azZ/Q4oipZm7AwGLtHsIBDURZUB1SHXzKD2XsCQ5BF?=
 =?us-ascii?Q?5ydXHRnprew+D62sDJA66VOC1QIlyU0YbJWV73SgbkeUn1bzxTRhmIacYPec?=
 =?us-ascii?Q?EtYbf95/4fXAPTsmzGPK+i4OhBiEOfHyv/+D3Bi0phFo/xWsaBRsvxS7SVRW?=
 =?us-ascii?Q?A+tYT/dhzTu8y7ubzcmZISk+uYhnd9SqGN5NRHu1151Upycuj3aWpEnyG7Ur?=
 =?us-ascii?Q?PcPtkSe7WbwaHdCbpOSQnb+QT0PTthr9yMJHXRpe4SCwa/CyTeRNIMYH3LXN?=
 =?us-ascii?Q?vr2mWJlZUU7GZNspvPKSJ99VS1xpdU8QJvaTV5+0m0s9kBunX1iOtRd4Bfig?=
 =?us-ascii?Q?QNyrXvgt2iIrs6IQJwe0LPj/bFP4Xv8QzkKCR5K6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96dacca8-fe3e-4ceb-eb97-08dc0a9e46b5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2024 07:50:08.9792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EyADk0TK6JzxEd1JHjKcC5PSor7kxXnxdudN7vDX18MaB32UKTnVn0p3Ly7R/6rqOvZF6didjVZ/ekOpY+xVwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7814
X-Proofpoint-GUID: pKyq2n2-2hFljBzPp4CoguMr22KaNFFh
X-Proofpoint-ORIG-GUID: pKyq2n2-2hFljBzPp4CoguMr22KaNFFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401010063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jan 2024 07:50:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107978

* Remove PACKAGECONFIG[libaio] as libaio is no longer required by
  libtdb.
* Add ptest.
* Refresh patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...b-Add-configure-options-for-packages.patch | 48 ++++++++-----------
 ...-pyext_PATTERN-for-cross-compilation.patch |  6 +--
 .../recipes-support/libtdb/libtdb/run-ptest   | 17 +++++++
 .../{libtdb_1.4.8.bb => libtdb_1.4.9.bb}      | 19 ++++++--
 4 files changed, 53 insertions(+), 37 deletions(-)
 create mode 100644 meta-networking/recipes-support/libtdb/libtdb/run-ptest
 rename meta-networking/recipes-support/libtdb/{libtdb_1.4.8.bb => libtdb_1.4.9.bb} (71%)

diff --git a/meta-networking/recipes-support/libtdb/libtdb/0001-tdb-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libtdb/libtdb/0001-tdb-Add-configure-options-for-packages.patch
index 93a85e854..477b1cec7 100644
--- a/meta-networking/recipes-support/libtdb/libtdb/0001-tdb-Add-configure-options-for-packages.patch
+++ b/meta-networking/recipes-support/libtdb/libtdb/0001-tdb-Add-configure-options-for-packages.patch
@@ -1,4 +1,4 @@
-From d3b1d23e01e323b9610843ab6bef096512f6c244 Mon Sep 17 00:00:00 2001
+From 613cfb43622f0138edfcf3ad7a8fecc568e17db4 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 19 Jun 2019 17:53:34 +0800
 Subject: [PATCH] tdb: Add configure options for packages
@@ -6,7 +6,6 @@ Subject: [PATCH] tdb: Add configure options for packages
 Add configure options for the following packages:
  - acl
  - attr
- - libaio
  - libbsd
  - libcap
  - valgrind
@@ -18,16 +17,20 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 Update to 1.4.0
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Rebase to 1.4.9
+Remove libaio option
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- lib/replace/wscript | 92 ++++++++++++++++++++++++++++++++++-----------
- wscript             |  6 +++
- 2 files changed, 77 insertions(+), 21 deletions(-)
+ lib/replace/wscript | 79 +++++++++++++++++++++++++++++++++------------
+ wscript             |  6 ++++
+ 2 files changed, 65 insertions(+), 20 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 827d74f..70cde6f 100644
+index 199e636..cb13b62 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -25,6 +25,41 @@ def options(opt):
+@@ -25,6 +25,34 @@ def options(opt):
      opt.PRIVATE_EXTENSION_DEFAULT('')
      opt.RECURSE('buildtools/wafsamba')
  
@@ -45,13 +48,6 @@ index 827d74f..70cde6f 100644
 +                   help=("Disable use of attr"),
 +                   action="store_false", dest='enable_attr', default=False)
 +
-+    opt.add_option('--with-libaio',
-+                   help=("Enable use of libaio"),
-+                   action="store_true", dest='enable_libaio')
-+    opt.add_option('--without-libaio',
-+                   help=("Disable use of libaio"),
-+                   action="store_false", dest='enable_libaio', default=False)
-+
 +    opt.add_option('--with-libbsd',
 +                   help=("Enable use of libbsd"),
 +                   action="store_true", dest='enable_libbsd')
@@ -69,51 +65,45 @@ index 827d74f..70cde6f 100644
  @Utils.run_once
  def configure(conf):
      conf.RECURSE('buildtools/wafsamba')
-@@ -35,12 +70,25 @@ def configure(conf):
+@@ -38,12 +66,21 @@ def configure(conf):
      conf.DEFINE('HAVE_LIBREPLACE', 1)
      conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
  
 -    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h acl/libacl.h compat.h')
 -    conf.CHECK_HEADERS('acl/libacl.h attr/xattr.h compat.h ctype.h dustat.h')
 +    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h compat.h')
-+    conf.CHECK_HEADERS('attr/xattr.h compat.h ctype.h dustat.h')
++    conf.CHECK_HEADERS('compat.h ctype.h dustat.h')
      conf.CHECK_HEADERS('fcntl.h fnmatch.h glob.h history.h krb5.h langinfo.h')
      conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
 -    conf.CHECK_HEADERS('shadow.h sys/acl.h')
 -    conf.CHECK_HEADERS('sys/attributes.h attr/attributes.h sys/capability.h sys/dir.h sys/epoll.h')
 +    conf.CHECK_HEADERS('shadow.h')
 +    conf.CHECK_HEADERS('sys/attributes.h sys/dir.h sys/epoll.h')
-+
 +    if Options.options.enable_acl:
 +        conf.CHECK_HEADERS('acl/libacl.h sys/acl.h')
 +
 +    if Options.options.enable_attr:
 +        conf.CHECK_HEADERS('attr/attributes.h attr/xattr.h')
 +
-+    if Options.options.enable_libaio:
-+        conf.CHECK_HEADERS('libaio.h')
-+
 +    if Options.options.enable_libcap:
 +        conf.CHECK_HEADERS('sys/capability.h')
 +
-     conf.CHECK_HEADERS('port.h')
      conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h')
      conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
-@@ -110,9 +158,10 @@ def configure(conf):
+     conf.CHECK_HEADERS('sys/resource.h sys/security.h sys/shm.h sys/statfs.h sys/statvfs.h sys/termio.h')
+@@ -113,8 +150,9 @@ def configure(conf):
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
 -    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h')
--    conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h')
--    conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
+-    conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h valgrind/callgrind.h')
 +    if Options.options.enable_valgrind:
 +        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h')
-+        conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h')
-+
++        conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h valgrind/callgrind.h')
+     conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-     conf.CHECK_HEADERS('syscall.h sys/syscall.h inttypes.h')
-@@ -431,20 +480,21 @@ def configure(conf):
+@@ -443,20 +481,21 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
@@ -150,7 +140,7 @@ index 827d74f..70cde6f 100644
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index 71ada31..10b16a7 100644
+index 5e6a928..5443b43 100644
 --- a/wscript
 +++ b/wscript
 @@ -69,6 +69,12 @@ def options(opt):
diff --git a/meta-networking/recipes-support/libtdb/libtdb/0002-Fix-pyext_PATTERN-for-cross-compilation.patch b/meta-networking/recipes-support/libtdb/libtdb/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
index 6bd118b53..00ec8a477 100644
--- a/meta-networking/recipes-support/libtdb/libtdb/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
+++ b/meta-networking/recipes-support/libtdb/libtdb/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From 10b4546edb194ede7a5e8bb5e4c9f5fdc67984eb Mon Sep 17 00:00:00 2001
+From de39c696a62894fd9c6626d3e2931e42e3407be5 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 24 Nov 2021 13:33:35 +0800
 Subject: [PATCH] Fix pyext_PATTERN for cross compilation
@@ -25,10 +25,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/third_party/waf/waflib/Tools/python.py b/third_party/waf/waflib/Tools/python.py
-index a23bd01..af202e0 100644
+index b2dd1a9..2bd3545 100644
 --- a/third_party/waf/waflib/Tools/python.py
 +++ b/third_party/waf/waflib/Tools/python.py
-@@ -328,7 +328,7 @@ def check_python_headers(conf, features='pyembed pyext'):
+@@ -339,7 +339,7 @@ def check_python_headers(conf, features='pyembed pyext'):
  	x = 'MACOSX_DEPLOYMENT_TARGET'
  	if dct[x]:
  		env[x] = conf.environ[x] = str(dct[x])
diff --git a/meta-networking/recipes-support/libtdb/libtdb/run-ptest b/meta-networking/recipes-support/libtdb/libtdb/run-ptest
new file mode 100644
index 000000000..7bc56f77c
--- /dev/null
+++ b/meta-networking/recipes-support/libtdb/libtdb/run-ptest
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+ptestdir=$(dirname "$(readlink -f "$0")")
+cd "$ptestdir"/tests || exit
+
+tests=$(find * -type f -name 'tdb1-*')
+
+for f in replace_testsuite $tests
+do
+    if test -x ./"$f"; then
+        if ./"$f" > ./"$f".out 2> ./"$f".err; then
+            echo "PASS: $f"
+        else
+            echo "FAIL: $f"
+        fi
+    fi
+done
diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.4.8.bb b/meta-networking/recipes-support/libtdb/libtdb_1.4.9.bb
similarity index 71%
rename from meta-networking/recipes-support/libtdb/libtdb_1.4.8.bb
rename to meta-networking/recipes-support/libtdb/libtdb_1.4.9.bb
index 5dc87bd91..248b72967 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.4.8.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.9.bb
@@ -11,9 +11,10 @@ export PYTHONHASHSEED="1"
 SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://0001-tdb-Add-configure-options-for-packages.patch \
            file://0002-Fix-pyext_PATTERN-for-cross-compilation.patch \
+           file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "8434c9c857d13ce3fa8466f75601f25c3693676b36919f159e0ad6121baf5ce8"
+SRC_URI[sha256sum] = "0ac226073e3a2db8648da7af744cb95f50766a52feeb001d558b2b321b74a765"
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
@@ -22,17 +23,16 @@ PACKAGECONFIG ??= "\
 
 PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
 PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
-PACKAGECONFIG[libaio] = "--with-libaio,--without-libaio,libaio"
 PACKAGECONFIG[libbsd] = "--with-libbsd,--without-libbsd,libbsd"
 PACKAGECONFIG[libcap] = "--with-libcap,--without-libcap,libcap"
 PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
 
 S = "${WORKDIR}/tdb-${PV}"
 
-inherit waf-samba
+inherit waf-samba pkgconfig ptest
 
-#cross_compile cannot use preforked process, since fork process earlier than point subproces.popen
-#to cross Popen
+# Cross_compile cannot use preforked process, since fork process earlier than point subproces.popen
+# to cross Popen
 export WAF_NO_PREFORK="yes"
 
 EXTRA_OECONF += "--disable-rpath \
@@ -42,6 +42,15 @@ EXTRA_OECONF += "--disable-rpath \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix}\
                 "
 
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    install -m 0755 ${B}/bin/tdb1-* ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/bin/replace_testsuite ${D}${PTEST_PATH}/tests/
+    install -d ${D}${PTEST_PATH}/tests/test
+    install -m 0644 ${B}/test/*.tdb ${D}${PTEST_PATH}/tests/test/
+    install -m 0644 ${B}/test/*.corrupt ${D}${PTEST_PATH}/tests/test/
+}
+
 PACKAGES += "tdb-tools python3-tdb"
 
 RPROVIDES:${PN}-dbg += "python3-tdb-dbg"
-- 
2.25.1


