Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A850C54791
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 01:25:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.51686.1710120334193825550
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Mar 2024 18:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=d8U/+kDR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3800741b93=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42B0o3Jv015578
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 01:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=VaRm7aiO8TtZmDjyrQ
	CPig2RC7/AvaVM3H34y1kfUsk=; b=d8U/+kDRLKrKpHKSmVh78EvwMz8gdXl0VD
	2sZuCFi4+zkRucWpk7WJ+bPul7JcryX3W9438H1PpD8RhyMYORralM24d+xfD/BB
	RC4T8rEkC86bSlba0fxJ/1vd73emmT020dZGlctlhdZop+/vstkEiLc1Uqdeuj9+
	dGMNJyiYg/vedMUcbep6mZEYg46HsbVrCNCM16rbc0Z3IPC70HgKdUIsInsBMHI3
	ZkwjsyeB6T8gzOYKre+dr6WgFfbVtktfT7B/S4tBUAMbYzEcyYePse1evhxOvaXk
	RuG9b/Up0VbWhpxkc7uglbwKg1dxpyWzH605pWHriJA30SicwKoQ==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wrer6976s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 01:25:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Av6w6jfiTM8jQcQXTjJ/VdR2ZZq73LjTHwwLr/jKbaBneCGIsdHG5EJnZOMpDujEqURAsTWHFjr34OnqBt+vxa0qzs18oTcP/NflTjda3KDWWY1WobRWhTJxMXsj2qeNnGA3Y3bESLMPysU+ZZjVggRpNtjFDWuTCUMWauReOG9F/i1sjip8fmHfFAan5d3HO00CDoDqfHEhjOlve172YMLd3K4bkmwLO+5QxYzgU5OEvh8H/Jx3nisOVAcXVi0uqU+0g3ja0yGRuvT3ADEOXyRoQXlqB+Vh/duSNRhQicnsVnCU6TyqBlC6gREh78JVurVpSQVhC5EVELYNvxjQpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VaRm7aiO8TtZmDjyrQCPig2RC7/AvaVM3H34y1kfUsk=;
 b=Ihbp9LaJUjUs34WzlB3nCyQ8yTonozDigPMuEPF95gd8vb7otkMSesih0tebGkTgwnD8YMtTdpigPIWmXhl43rzQ421BZnRdH1To0dTdlCyGwu07KZ1EROnPTI+wyvty/xw2E3DAkYW5M1mhWCPeYZbTkn+OGsb7UJ9csUVFTAVmLfkFzj5CE9KSOfzgBMpmNAgn0Z4Zsl7pzxlfhFZYOSf1JJlsa21BZEHTbU8JzxX/kim78W+1vzPb75gWSKcCHb+4kFyb8upnBHRQN5G0lDt0lzC+AyGgcWDkSr0kp5aXto1Lsm2EiXXW8Khlh2unTHaKe87vgAwd4iO2mWVCfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by PH7PR11MB6401.namprd11.prod.outlook.com (2603:10b6:510:1fb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.14; Mon, 11 Mar
 2024 01:25:31 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%6]) with mapi id 15.20.7386.014; Mon, 11 Mar 2024
 01:25:31 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] cryptsetup: upgrade 2.7.0 -> 2.7.1
Date: Mon, 11 Mar 2024 09:25:19 +0800
Message-Id: <20240311012520.1516794-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0133.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::13) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|PH7PR11MB6401:EE_
X-MS-Office365-Filtering-Correlation-Id: 32c1a981-edac-475f-ea13-08dc416a245c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oPzZdRbjeTKzeoy1Mv8ryV3GkM9jz2NDp5AGQ6NserZGvWPmQarfN+sHaUMqE8bUKqGRtiCdmMKYHlkADaN2eG7IMlrUDH69TGRzZDOZeEtkxoTRXkBO4GJJbH9/yKKbR/xcZFYA3ylCZ9Y1i4O9cbvpyE/06EDb8zzjEaWxg4efZ3uqBcOi8hiPMHy8aelZPgdgt/voSwJLCjztkza3p4z2aCrvzOwESY1EQgmEExPUsSP1jM0aElom9AebhbHqG5t9tn8CPhy9v60SMf20nZTI+JAXRYBZ5AH7WWr2/2zgE89ol33ztQGoeoKcmxqHRuxydtquELrvJu9bwBNHxTg8qmBCiKGS33eV+yzvDcyHH37X/Ptit0KGnBpdpA1pewY+4YOhu9I6EV6Y03eSADftEL4FBtCzOA3zd7mJqRIkY6Lk6nL2h6+3+7weUFus1Byi3w3WR7xDcxCMsgfQYrGiuFDyUkdfobkeoSbiu8tkSMlG7X1H6l9Q/imNzzC2eHoKt4/1Oecdj8ZHXAbbZrE7eu16/TxoPnGjORzs/ncqRj/4LE2mr9fmdD2OEuAHpv6q7xyAXsPHIdtgKus3Nb3xdjUOgYJFUlitu3tyVu9vlHAGFSduKW/t+EEXx2d7IZgWa8IfMQSUeQEjC+8elnS+oMuoa32TCDHl1D/DavTUv7htnuVHdXJuptTGDprnGi+eKH/EJucAwyGVjH/5sg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wIxd0LBLIFLFBjX4mSXlMfpMN5UGt9phmMdiQJtBOJ+NFoWnh3hZGP4P/5FN?=
 =?us-ascii?Q?eABAG/dsC/5EVxq8q7+be1HNbQr1kJMHKzPtYQTI235o/hZyb7TyMmyraC7z?=
 =?us-ascii?Q?9fiJbVs55NaJrwSqbj1Kj9iHq/z43LluHKpa1P/UVw2rMwkHynu/dvvRY14g?=
 =?us-ascii?Q?ZvTHprYJKgueYB7UmDUDTj59Qru+VrNLJd2B58x2wgO4zpWJgmA1BBsl7YiJ?=
 =?us-ascii?Q?uMqeTd6t/LpVybMXW9VOZ3ZWwNqPmB7C9gbzTZi7d6OMN9JacqRKnzXJ1tQF?=
 =?us-ascii?Q?h/j7RBtFgC+D+EBfYttoCfS/jjazBLsjdJXhv+Cja2R+f9Kc/6Bw/Jhsazbr?=
 =?us-ascii?Q?Mt16zATWVj/S1ZUCNziZp6sEnK29jf/MCQ4r/Am4rKDrsRLhs8ZDDu00Xx2i?=
 =?us-ascii?Q?R/z3ZPjekBgkuUYLX0Iv2PI/ZuHxBer7f8jGNaNKDCu+KHy7u0yScAMvBQU2?=
 =?us-ascii?Q?nwXr2DXglXIe4Bs5pXCqmUXB9Hafe9Ed5F9zp8YTSdqKjI0GLu0WLeIKSHxq?=
 =?us-ascii?Q?0pmD+7LCOQdlhX/8t4OEkOAIURZxuNXNJKEgyYO7dSp3LosEd1IB3IEPjd/R?=
 =?us-ascii?Q?UPYyOiAo3Sn+5z7OmSAR8YxoTEl0xCeg+7Le9l2gznkOSaCA8bDni7mNN1io?=
 =?us-ascii?Q?4yGikNmlMve4XcktxCEMOisSE9RkaYH9pG/Xa3o5NuTba9AWN6aTC+pwqs0N?=
 =?us-ascii?Q?DTc77j1ER6vfiCoimqbf4SfpdLkKagnBCkc0gibZBtnM2HPBk2XYlChAE49R?=
 =?us-ascii?Q?lsKlnny0O3fUGFu2rXTItfCKx+rYXQfvn+segd1D94VIy2QVH3zpOolOHM2g?=
 =?us-ascii?Q?DYs/2ZF79X0FVlu1HMI8luAuTPybqJSQNZy65U+2spHyeWBdvdWdYZGT/fhx?=
 =?us-ascii?Q?Gng86xcJV9lfce3Teab7Ka6zJlUagz+ygMdUX83Hd+yEGzns63AQPQNbOYv7?=
 =?us-ascii?Q?MdMUY+5mhfHnEc83DOKchnVLzE5cGlEJj/rHqeuwSLJ98dxyiXKeo4cle86+?=
 =?us-ascii?Q?aF1gs6yEPAhX5HWgaiwDykpZbzJrszO92nmoA7qAFxsmQ/21zG4MPBnPm9d9?=
 =?us-ascii?Q?pKWXvdD6np5X77IXzUHIkVROld2M3twRbRHQLlFqPHXL+GlDscVPTwbz/b/3?=
 =?us-ascii?Q?T78z5+XR0Hy1qYKiZO4hMICgZzcOOlTcgH3cwA8Emd5q2hkdb6y/ePsPuTA6?=
 =?us-ascii?Q?xoPO/YbVrAWAmNr2FeYuZHhexOF9orq0/DaWNOJy3QUWCXnqq5GrA1fTnvme?=
 =?us-ascii?Q?2uhq2Bfs1Y41SqOwaIF4lM5/CCnrTR5i2xRPtvTRVgExPv+vXTDkHSJQfmvF?=
 =?us-ascii?Q?zFIqyhXSL4PKrz/N7OsmK7v4k+Koq0Em0Qw75jwh4DWrBWB+9hrwuEGHt5pS?=
 =?us-ascii?Q?7EDiR7ScYnqF7WrlgPj1zFmPsbY7Tw0XuCcS9sH34qBJ6XwtTQvEDgxQI0q8?=
 =?us-ascii?Q?Glh5j8v+IGSXxPYrTLsYc8fo6rv1dU6hJTuzszcCSjr1w5cs4lZn/C1kVvZG?=
 =?us-ascii?Q?upCrYS6Oh6tpsjS/QBhcBeuMhbg4Sde34oax55QDzSSIhDkWdlWK/qvYRXcc?=
 =?us-ascii?Q?Hu3XNxPzPCvUyMmGSmfXVQsBz84xgLOAro7jVg+Q?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c1a981-edac-475f-ea13-08dc416a245c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 01:25:31.4111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNZ9yiBlAXcyrbbtdAtnh9w46kNj14kMbdVPoSw1zjEj3iG+D1jPFbaTtomKZqunU1aodv7I+x76fdelDKyMpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6401
X-Proofpoint-ORIG-GUID: WokM-bFTHua6og7tORmgIyzhdDiXpcRI
X-Proofpoint-GUID: WokM-bFTHua6og7tORmgIyzhdDiXpcRI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-10_16,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403110009
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 01:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109260

Cryptsetup 2.7.1 Release Notes
==============================
Stable bug-fix release with minor extensions.

Changes since version 2.7.0
* Fix interrupted LUKS1 decryption resume.
  With the replacement of the cryptsetup-reencrypt tool by the cryptsetup
  reencrypt command, resuming the interrupted LUKS1 decryption operation
  could fail. LUKS2 was not affected.

* Allow --link-vk-to-keyring with --test-passphrase option.
  This option allows uploading the volume key in a user-specified kernel
  keyring without activating the device.

* Fix crash when --active-name was used in decryption initialization.

* Updates and changes to man pages, including indentation, sorting options
  alphabetically, fixing mistakes in crypt_set_keyring_to_link, and
  fixing some typos.

* Fix compilation with libargon2 when --disable-internal-argon2 was used.

* Do not require installed argon2.h header and never compile internal
  libargon2 code if the crypto library directly supports Argon2.

* Fixes to regression tests to support older Linux distributions.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../cryptsetup/{cryptsetup_2.7.0.bb => cryptsetup_2.7.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.7.0.bb => cryptsetup_2.7.1.bb} (98%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.0.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.1.bb
similarity index 98%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.0.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.1.bb
index c5e84b1f0..53162cb94 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.0.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.1.bb
@@ -20,7 +20,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "94003a00cd5a81944f45e8dc529e0cfd2a6ff629bd2cd21cf5e574e465daf795"
+SRC_URI[sha256sum] = "da5d1419e2a86e01aa32fd79582cd54d208857cb541bca2fd426a5ff1aaabbc3"
 
 inherit autotools gettext pkgconfig
 
-- 
2.25.1


