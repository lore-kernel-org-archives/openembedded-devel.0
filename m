Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD72C4708E
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 09:02:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.59789.1672736559703530576
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 01:02:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=FQMWf6B8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=036779a716=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3038wMSS005130
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Jan 2023 09:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=tBD/N/+5CY4qyUKDaM8cOLCCnHwgtqHmWPPJH3RKDQw=;
 b=FQMWf6B8JZ/CrCwXJJZzuHayu0pIovZ5AcJKTwXRSpx7wtENABNAG6KBNAOVwMFgE+m0
 nwzil0l2CMB8Ub/W3Jp3914aGg3d4Lf5BoWxsonZ7QPQXplDNf97geh1ykTfoTPKLnmu
 ouUYb5/LMcaRrzShGiODOTGU2BTNB6mHxNZ0HC8F2X4kb2zHTF9rsxeUG48fGPSNxw1P
 iaIgZxlxpg5FaClHOkNAiBD1bLfz7oOWJ6Hc9xfeqLKfjYZwBdahOV6JgpClj9Ef3T/1
 54Lp9dSYon89XMawKgYI3fPZi6RqDL2seU3y74e+uDNa0b5H2BfTPsm27+yQdqWk2rK6 vA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mtaa2hjar-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 09:02:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=euz4xtcoSfOBwZ/dPMBSLrhha4t7cEsg2wLYBT6UTxD9Wy+FDcF4Yhte62+om7Ec2CxBt7kOv4sz6OJTr/XjqiYMMrqPsbwn+bYUskUmf+e0TZiBY0x0YtmGKLXuoD87TU13CFdYK6wSIeBMIurtXSMahnmY4IWkoQT/mEJ0K70SbSK7rmU/ivd+VhikrOArw0+tvjbPuqjEBphkCBswBf7rMpFMlhvgPGWhTzv2w1Z2dtecxCylcqIHsZpYNyjXR36I9MeOUJkBvNhgcocwqqr+brKnXqmjwrbzJjCOF7FeOKrYLQiq6WBhO4ju66xLJKU6UhDRwmATUGMJoz5QHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBD/N/+5CY4qyUKDaM8cOLCCnHwgtqHmWPPJH3RKDQw=;
 b=OKjiymwNl2as0mVe9/TxFoQGJEM6aOjYbDu0KXhA6lQpKQkS86CLHbLozzC4PPYj/joz4OaUmF/m4Oo+IQpma/hQpfUCWANmdS1KCnjsZMUs2sSAY8kPI+lkgAReAh3j19L825BpreDDiyBjFWqLAID1uKnr/THp/C5kfwdd93GOhYqyHFci7NofAx/bWI9zJ2Q4ipe4v6cl7Z9zNAoDovgizYBFG0tjOu3ji37WdPDoXK7ufgUe7+ebeViMgf2Np+Rfz/+1wn0ItaahQtCD6eFoChbD2mkEgnaLJ3+fuhcS7n39fHQdxKPnMdBMo74toO9tKSoR17ohTThHa4iuGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CY8PR11MB6866.namprd11.prod.outlook.com (2603:10b6:930:5e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 09:02:37 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::eb7b:3a04:80bb:4a5f]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::eb7b:3a04:80bb:4a5f%4]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 09:02:37 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-initramfs][PATCH 2/2] grubby: drop version 8.40
Date: Tue,  3 Jan 2023 17:02:22 +0800
Message-Id: <20230103090222.3369744-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230103090222.3369744-1-yi.zhao@windriver.com>
References: <20230103090222.3369744-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0189.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::15) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|CY8PR11MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: 703c3443-4433-4469-f426-08daed694283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GOb0bzAp+/mFvYHH6Blb7G1X2f/O0hl7qTjzReXPWki4dnnUdH729bkfK0guoSYMuKAQUBp9NMYMpKqdP0f2icXvH3NoEuZeVV0UdNHBot7z3j/0Fmx90UawL/fG+94Oz1GxTRfplDunBPosDBJbOd7VM/S47JFwOfw3LEObQk/lkU33Fhg4vPxgLAbNWiRTwAbmBEMa0bKLXtz/+7lr/3/cPgqFA991wjpzyEBq9SZj4s+trjbJkr9BJh0/NIZ8PqWDXmpsGa5i7a6hYdkSb/gXAIMuE/NipODn3MclVOYdLHDkhhNXl6LsjcnFtx9EQKGpI5/qcLmdv8Ljw9jw0FNx85ZdQvbCXNILr5T1fjEBvadkAZkxcDQgkCdtJ9h+zdXBO6OwMwEeiSdZdy+2srvclCA3Sl9G9FPW4f/6gPc20dKxsVEErwW1LLdAnCdGEJtVLlo40urbsm6eMcTepmRoNguTTvGGCz2ZMmsaAZm7liYzkTGLUNz/J1CVpWjFGgaM7RFdXxxQzyNero19lLlBqPMRjbLQRja+QGKWE95Y3WXSVhiGmalgW3XbQ2FtPeorHj77atC8PYsuyejUVpE2dQXZX4kkbAvv5VRq6fF69b34xk0d+sv9YT8K+OlWDfJsLQR7suF2bmUhc17kotZyFbnLIIf5eaaEUVSn2ltEtShherNYgTEFnK/p5zH6uzjFNTZpjtnZ/rAV5jobvRgpDAl8h65CUlmRxHl8m9a4CK71IqgB9M1wqghwFYAo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(396003)(376002)(136003)(346002)(451199015)(5660300002)(2906002)(44832011)(8936002)(8676002)(41300700001)(66476007)(66946007)(66556008)(6916009)(316002)(478600001)(6486002)(52116002)(2616005)(1076003)(26005)(186003)(6512007)(83380400001)(6666004)(6506007)(38100700002)(38350700002)(86362001)(36756003)(22166006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?92LX2YKOMak4+yDu4ZWnK28EL1xgwOgA2hM5eHqSxI2gNlLcJKIrpLvHNxk8?=
 =?us-ascii?Q?p6u0FwQCNnVhhpDO5iZJ6dO/IhUWRccYvC9l8uiuyKo/9mkJADkvLUymDbG9?=
 =?us-ascii?Q?mbI7qfZ2Nr+gcf5Fs0fEpO+kXifRSS2XZ0Xt7wNIzg+DgaEp5uDnRqTOKMUB?=
 =?us-ascii?Q?hm30kGmt4D57k+qAEoUsEq4epsyFw8qbemTcc4liRB0ny9cCDQBXueDnFs96?=
 =?us-ascii?Q?WMkekqKLZyBEjq7LVEBgZUo8NsS/4+WaA/WpnrbkZQ2wjogmpTTNDK+bm8TZ?=
 =?us-ascii?Q?ka8EwcO4UbDAQBoCtvSCarHB5ZvDNsRtQPqyD3WWouwOdZjnQd9KyX4b5am9?=
 =?us-ascii?Q?HRuW8DdNn382/n4xp3mQh2TiwBHxZPi+UiuM/RBRK9Q6E80eWq78zXoCKdq9?=
 =?us-ascii?Q?rtJ7t4726g6st/5YsCppF/SDxe9d8GkySfJDBeOx1Pp0XC3wb3WBfk+xoVGy?=
 =?us-ascii?Q?nArSqiRtC+4WOde1KHKwnaJe3LVA5Ii/EPxKtuU60iCWF77GpahDHHXlbTFR?=
 =?us-ascii?Q?2mhohRdG6HDj7+2yV4/LuoJty/gbZhW35/GHnC3t8KUUrtLDtUh0Xdl1l6Kl?=
 =?us-ascii?Q?60F2/lU6ThCcklWtJVZYW359Zh9SshbTrV5jLx8hbehvjNJKBQB4CKtfE0q4?=
 =?us-ascii?Q?dOTu6MKn1D1osLwNPx5sEN3WwGQk/D1+EwxnNnuKTtKu2xY3VFN2OOxmqfuj?=
 =?us-ascii?Q?f7nkF5IpatJC0XNzQFawslxSKan9NwukLmiYdlmKVlVDPmXqEnji/jtG36Hn?=
 =?us-ascii?Q?3QKDzNbsyHDH+es13hcHVci9W5mG1q5JxaRVqIiJ2ckECBDbnY/8RPx0J+u4?=
 =?us-ascii?Q?ySCYxHFK6EHhV2m123e2qmrbWWqn5agf2g10gD0PKzMsKCnVXZ+joekdXTXP?=
 =?us-ascii?Q?ymGettGSLZ96mVxBE2s9PgArX9lWaGpxuaYkG0UF++DOeaK5p2VliEnpy7Bz?=
 =?us-ascii?Q?WesEmiECIB3x0hy7UKxbCr0bxvqwWj5qTgQyaT1mIbVvvx5E+xA29PqjH9PG?=
 =?us-ascii?Q?qT+yHbQ+/O2E8aiVacx7cQUXiR+uIzYTlhlGCNQV1cGx5TTRNLdRZqw5WhYS?=
 =?us-ascii?Q?KtVAN5CdTb51IFGWZybe/yKHKrFtYcecsu+F84vBXMAnf4lbNN5jxaaH0Vup?=
 =?us-ascii?Q?YPwtDSP3OhhC+cvTXbXCrZHIJcJhUBvOIM0MUA6IZvWWJtNFs4/14OS/9NpY?=
 =?us-ascii?Q?AWArGyrQLuUcTaoTGemm1aPickKD+2UKpryKR+pw94zzDiF//ri+G0/yP2db?=
 =?us-ascii?Q?mR2LY55uulLoLq/Tr95+c3eAR4lAwERryIxlSSMJHnjXvIxv066KA26raNhQ?=
 =?us-ascii?Q?AzXCOHvg4eyUTHMP+J49cOlYZU0VQ6WKMHD4Cu+IiNRxZVMa7QwG/FR0DYc0?=
 =?us-ascii?Q?Ngmu1QXrj5LnpgZddjsTIjklBD7GZX/cNnYxRyPzVWQg5DS+9oHBi2N7x6km?=
 =?us-ascii?Q?da7jVzR/SLNAOYmay7EU9wTFROPKf7NHV1CvBikE0xPTG7l8yjGzsr6EgxsV?=
 =?us-ascii?Q?trz8vbQv5Zwm08Q0CD8clfM6bgttNoDR97/rHPkiysdBtVC0ivHA6BjpVHpO?=
 =?us-ascii?Q?jB4zqMmxhMgVxk0wYlTJKudPMxkuxSmAAvzMtJGR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 703c3443-4433-4469-f426-08daed694283
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 09:02:37.1201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iNtX6Dpyp7VhBS0XNCv+4TvfUc6fpEhLIJzxpabNqZUHU+Y04ozmyp4aZdekD+lrSFgYcIM2XJJFJjtdh9PfcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6866
X-Proofpoint-ORIG-GUID: UBSUEX9pZsMw41Sxlic66qqd44Au2REz
X-Proofpoint-GUID: UBSUEX9pZsMw41Sxlic66qqd44Au2REz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-02_14,2023-01-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 mlxlogscore=881 impostorscore=0 spamscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301030079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 09:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100357

This version is obsolete. Drop it and only keep the git version.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-devtools/grubby/grubby_8.40.bb    | 41 -------------------
 1 file changed, 41 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb

diff --git a/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb b/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
deleted file mode 100644
index 307c0e85d..000000000
--- a/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "A command line tool for updating and displaying info about boot loaders"
-DESCRIPTION = "grubby is a command line tool for updating and displaying information \
-about the configuration files for the grub, lilo, elilo (ia64), yaboot (powerpc) and \
-zipl (s390) boot loaders. It is primarily designed to be used from scripts which install \
-new kernels and need to find information about the current boot environment. \
-"
-HOMEPAGE = "https://github.com/rhboot/grubby"
-LICENSE = "GPL-2.0-or-later"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
-
-DEPENDS = "popt util-linux"
-DEPENDS:append:libc-musl = " libexecinfo"
-
-S = "${WORKDIR}/git"
-SRCREV = "79c5cfa02c567efdc5bb18cdd584789e2e35aa23"
-SRC_URI = "git://github.com/rhboot/grubby.git;protocol=https;;branch=master \
-           file://grubby-rename-grub2-editenv-to-grub-editenv.patch \
-           file://run-ptest \
-           file://0001-Add-another-variable-LIBS-to-provides-libraries-from.patch \
-           file://0002-include-paths.h-for-_PATH_MOUNTED.patch \
-           "
-
-RDEPENDS:${PN} += "dracut"
-
-inherit autotools-brokensep ptest
-
-EXTRA_OEMAKE = "-e 'CC=${CC}' 'LDFLAGS=${LDFLAGS}' LIBS='${LIBS}'"
-
-LIBS:libc-musl = "-lexecinfo"
-LIBS ?= ""
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}
-    cp -r ${S}/test ${S}/test.sh ${D}${PTEST_PATH}
-    sed -i 's|./grubby|grubby|' ${D}${PTEST_PATH}/test.sh
-}
-
-RDEPENDS:${PN} += "bash"
-RDEPENDS:${PN}-ptest = "util-linux-getopt bash"
-
-COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
-- 
2.25.1


