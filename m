Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0874C433FE
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 07:38:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.35899.1640677126424877091
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lzThXMXE;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=7996075b3e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BS7aqd6030366
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 07:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=OTILbqO94Ri9Z6XqF8YZGeAu9SgZDf2583EbUrvFxa8=;
 b=lzThXMXEK15hC8XwVKarpOgr4+KEBjVsnLQtQNs30N/qN67x4oWMNJrUnTY4wAEqniKW
 jwLt4UounemOL1Z+oSFcKe862ZY85eiEYHulzq7EqOLXYU/lWHrceMQBuKAdwx9eAk1o
 hqxgBi++jCcxzQGdqTj/NBfhlnBhqQcZZaAG6QuhdTVSJzAdJdXu2FRoaNS/obgJvq1J
 rrg0SdmMbgATSsooHVRbILCfuUatjPbQ83jE7etI3654rfXXIsjYte5VIy+C+/INzLjQ
 c4LJMZUhjsOcXUCx0LVU+BvAne0Z6jHGBtZoSrLBnnlg4BBwr5sYfwfxPQMGAcq2X95j tw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7f230dyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 07:38:45 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BS7ci2L002231
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 07:38:44 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7f230dyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Dec 2021 07:38:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDEFJ6ctf5/Egj6cLlvxvWisjC7B3/MDAQrAZQVEHxEbFswojN00i3PY+bwQUQLMg5egWeHAKjQuHK7iLEnCABIxsec8H94iwIb/jTSuYMnvl8va2n5wls4FwcEDHT0gbrOctoVufxU6xIITPRUWjkcuYUbUQJvDVyJPQJ7iGilcbO9s23zpUPbBvg/MHy9yvqsOxdqcHrX7ZF869MDyAe7vce0Bf3xANPIh1BGyMFDNNAg+qDg1ejoGxvk8oQa9Toxhwdwq+hRXTsPh+tEqkg8selt/Q+ateN9f9XYiOpJwUn9Dqgz8wcFZ0P9J0BA/gLNCnDmLidt9GuCYAbZ9OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTILbqO94Ri9Z6XqF8YZGeAu9SgZDf2583EbUrvFxa8=;
 b=RrX7FTz6kvh1nOA2HPMiqY+fia/uJT+1WWAIa3SNEXHhRQrxbTXqtCmNEHx+r0+C1J1/BvRC4nXWDEYbGQ4+EqyX+rgA6ErrFNsPZVRdjHwce0yCJ8Us1vTwPuByadRk4pZrL5c/ddi1a8+SNxJpWyIG7vRaPk/3YZTUopO83y453MbbQFdwaRF828i++e7y8IFI3HqOqqZ++YzCwactRLQWGi1qd7PfiVSfB814N2wd/WTrTi/hDKcoL/pY/uVuwMl1w2W+N7aOH1tdvP5DfyJiZW8yFHJ5A2HUkTNCm3WBEnqYYywk/BkToh2F24yeS0iTkcInMbeBx9vxW0lXCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1584.namprd11.prod.outlook.com (2603:10b6:301:e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Tue, 28 Dec
 2021 07:38:42 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 07:38:42 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [meta-networking][hardknott][PATCH 18/19] samba: update cross-answers
 files
Date: Tue, 28 Dec 2021 15:38:05 +0800
Message-Id: <20211228073806.868759-19-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228073806.868759-1-yi.zhao@windriver.com>
References: <20211228073806.868759-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 641f2f28-688f-4e41-2b8e-08d9c9d51240
X-MS-TrafficTypeDiagnostic: MWHPR11MB1584:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB158466D905C0FB1D8202C0E2F9439@MWHPR11MB1584.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y59rh2pgfB/gFipJJDrtZZx3GVKjJ/rGPufkf7os7nFK/cdhS8+2Jj0tYt3vICp+0iB3E6mdF6rpLak417Hm4km8ZK14ThcYQLfRA46hHHVGKAlSfj5mPDe4JrYWVQav+KP9vzZKGQoveeibiBAueQpSHc/IiDW7oqs7gFEMvW+oew/ACRqolkepHRz6pvTix+gWNMRL2ekbwvJm4xNtiOroC8qZ9gDDBMzW1OGPdu9SyiV0S8zbbTLyRpxPb4/qoU/+yTaj3zBNG2sxUl2sNjrM19MoytlN3EUAwyKffh6jt1heTZ68ca4IrQHtu69I1VE7tlwIRYboNm1944auWNceJzA/QXNxhok6C4y+6GGkWQ5J8NMm+vihm0n/8BpyR38o5wbKBFy+I9Gguk+IKmDzzzhCvIOd5MZDkfdvdLBMbMotTsqjZ9qRASrlV6a1Y0Ujej6PnLJJZGZhsRLH7V4SNGG9DBYDfOUNLZY8Ic+ctVXcqd8P9TUXFANAWawc7efqNKmUsZYLK7hrzYgyeUvJxwnjjErrSI0NRwodi+Y4N776yQ7NU9PNQuybf67t9LyUAkBYE4UkV/61+k4JCMKaW5SF0vMiyt1DOGGx93MR+yZGXJI3wzSJp+v1SY2GbQY57O0YOkDy+YlH/AJ9+wIfTLVTawLLZCQh9l+hBwpfsLrnzXEDrq4o+bzDQ5I7zIiLYznZ9suGd9Ye0doYmw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(66476007)(66556008)(8936002)(508600001)(83380400001)(2616005)(44832011)(36756003)(30864003)(1076003)(6666004)(8676002)(5660300002)(52116002)(186003)(38350700002)(38100700002)(6506007)(6486002)(6512007)(2906002)(86362001)(316002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CHZNp6YIrvUb/+AzEFN1FQE3JCkuarcYV5UJodu0KI1vns89A6i08rEJswn3?=
 =?us-ascii?Q?hqCckWixaW2JUgTJWEI4dHKYRdusaBzO/nham2y4y4FTbcm2t4+UHKRGgQCZ?=
 =?us-ascii?Q?Y29CrZiZMnyxbrTC17enK+De1qfDqqVa4I/LZF4RuJCBun/N5eMipgW41Ev1?=
 =?us-ascii?Q?RSi1LIsV+7mY3hjTrOCiE0wDlwIY7k7sCAHoVRxy3zfF1zmJcuU7uFx4x3KK?=
 =?us-ascii?Q?Blb+Dy8lEo6q410P2Ok1d3YjGVnUqCUuQjp1DC0uJCUip0eaUuvcxVWc/CBW?=
 =?us-ascii?Q?OHIKiV+tZt6yAOuZYoYVx9Uj+0W24w0qqBzVVfwdDmrziEEObiTNE/FzkbTA?=
 =?us-ascii?Q?lvNancEiCGWxu7v4s1rKpvNNFo1wLUi4EbuH6Kl9DczdS2ez8S6Itop9yKLg?=
 =?us-ascii?Q?IcaElwt5aiJHjFrPhrcuYTwFov9gLPxJzoPLhTq1uPhAebfAmNp6uR1hJl6Q?=
 =?us-ascii?Q?T9CDCIUC6SS/n/C3guImfsbzrvlGTVIFb6SW45F9mpV8ZZlZE2jeX+mBnW8N?=
 =?us-ascii?Q?5O51rqnBV22KVu8Pf1MFR/j2fPObG8H/gM5oHnqYLh22PTnZRMFX/3v9qap7?=
 =?us-ascii?Q?Po4P5+C70DIYzMGlFFqMAojWWKugQ50kzOb0VfcgQ+dWajkX6iqWtqdOwLa8?=
 =?us-ascii?Q?U8+yaSWNOrzOoW4hxlot2AgnJf+YlCvXOn8/8VBtWjXnDKEKKY6jDeHRWdJ3?=
 =?us-ascii?Q?Uycj0xp3GSUpJuD46r5ayaAE2PChzFuGxJEYKj5tXaTMkHM0x3s4ujEOLWci?=
 =?us-ascii?Q?5mEyURFp2txOoQEXZ5XKFrH3EmNLvh2NBDhd2seD/18GIn1vPJ+rGwh8sruO?=
 =?us-ascii?Q?8ysrBju4amoU2guTcXpdmAW9h0bI6w9HQO5/TQR+P3u+wva2XiQXLBB5vXur?=
 =?us-ascii?Q?sxOE63zjGbBZTRp+a4Db4xHMUki06ZaII5csQU58pd7uI3EMGeNbMSdoeMZ8?=
 =?us-ascii?Q?jHx4UEB8/yuHSyLl0wUXyeL7D6uCjnh9beky5y6ZBqfJWdxEdobbRJF0lM7k?=
 =?us-ascii?Q?+4AlSHxVCUBkp1I6iHARLr1PbcI2emSjeFxSsHjNetyJFuN2Dy3WboiLoI4L?=
 =?us-ascii?Q?K+bKqE8VwAXUbmWvluxLNOTUDO55uiqMeZxoQyhINiBwkjtd51AV1hM5S9Hy?=
 =?us-ascii?Q?be4BEa5+oZbLbHsD6/FiiA+/KQMVmwg/oYlYCHIdYbzmV96DYB8gV2AmO8aF?=
 =?us-ascii?Q?qEoUXYmArcJiFs+60SZeXm8++PmjnR/RZN7Y2Q3hO/pMJxb1tvnD+tWNv5Cy?=
 =?us-ascii?Q?PyV8yAmnNt50PKn0/Y8mP6CRo3bhdPZWh9GQ0shnns8ux05/kSBwIgEteGuG?=
 =?us-ascii?Q?chSszSckX4KtGgAeZ1lXJCMVBjshnjJhE1ylACpIm/MlqFkAfd7y60Wol8CE?=
 =?us-ascii?Q?vZ+Spk0bS0uTSpoZeM7hE5zwj8PAaIwvVvxsAkIDPCVRARNtA1pqJjMawlXd?=
 =?us-ascii?Q?96pPgG5AjKRa++e6NfUQT7H4cl3U6NmgNFBNs3zJYzuI88Mc++DIUFllkrtD?=
 =?us-ascii?Q?nTfcCRY3BO6bAXx85YTSZ6PZyPqyvxidAyhnM3qw4BB4R4YOZak0PzFHwXSb?=
 =?us-ascii?Q?NTAe9XVkdRSWrhZCJs2098KOh/DgNlNqsaAl8RXpZ/vwyT/yIoRm6gkfw8Lf?=
 =?us-ascii?Q?34KT/ZXDMiTgwAjVEgyruxU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 641f2f28-688f-4e41-2b8e-08d9c9d51240
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 07:38:42.4234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kh68l+xrXSYIVPBNPIo4NpJAebXS4UXDvTpYfg00m4jBVFRBMm2Dl/PaJLK7uNZ9eLbXLR7eZfn2utO8RECVCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1584
X-Proofpoint-ORIG-GUID: 3APSBlTigteqrlYh4l_h_I6jbwXrzJNP
X-Proofpoint-GUID: k6yCqZUpZga7NR29jCldfQuhEArJqHyg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_04,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112280033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 07:38:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94545

Replace the configure tests UNKNOWN answers with the correct answers.
Then drop the related patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../cross-answers-aarch64.txt                 |  5 +
 .../cross-answers-aarch64_be.txt              |  5 +
 .../waf-cross-answers/cross-answers-arm.txt   |  5 +
 .../waf-cross-answers/cross-answers-armeb.txt |  5 +
 .../waf-cross-answers/cross-answers-i586.txt  |  5 +
 .../waf-cross-answers/cross-answers-i686.txt  |  5 +
 .../waf-cross-answers/cross-answers-mips.txt  |  5 +
 .../cross-answers-mips64.txt                  |  5 +
 .../cross-answers-mips64el.txt                |  5 +
 .../cross-answers-mipsel.txt                  |  5 +
 .../cross-answers-powerpc.txt                 |  5 +
 .../cross-answers-powerpc64.txt               |  5 +
 .../cross-answers-powerpc64le.txt             |  5 +
 .../cross-answers-riscv32.txt                 |  5 +
 .../cross-answers-riscv64.txt                 |  5 +
 .../cross-answers-x86_64.txt                  |  5 +
 .../samba/0006-samba-defeat-iconv-test.patch  | 39 --------
 ...e_system_gnutls-disable-check-gnutls.patch | 39 --------
 ...cript-disable-check-fcntl-F_OWNER_EX.patch | 79 ----------------
 ...wscript-disable-check-fcntl-RW_HINTS.patch | 92 -------------------
 .../samba/samba_4.14.10.bb                    |  4 -
 21 files changed, 80 insertions(+), 253 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0006-samba-defeat-iconv-test.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0007-wscript_configure_system_gnutls-disable-check-gnutls.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0008-source3-wscript-disable-check-fcntl-F_OWNER_EX.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0009-source3-wscript-disable-check-fcntl-RW_HINTS.patch

diff --git a/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt b/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
index fc0400dfd..a89d9b358 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
@@ -38,3 +38,8 @@ Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
 Checking for a 64-bit host to support lmdb: OK
+Checking errno of iconv for illegal multibyte sequence: NO
+Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
+Checking value of GNUTLS_MAC_AES_CMAC_128: OK
+Checking whether fcntl supports flags to send direct I/O availability signals: NO
+Checking whether fcntl supports setting/geting hints: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt b/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
index fc0400dfd..a89d9b358 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
@@ -38,3 +38,8 @@ Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
 Checking for a 64-bit host to support lmdb: OK
+Checking errno of iconv for illegal multibyte sequence: NO
+Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
+Checking value of GNUTLS_MAC_AES_CMAC_128: OK
+Checking whether fcntl supports flags to send direct I/O availability signals: NO
+Checking whether fcntl supports setting/geting hints: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-arm.txt b/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
index 759afe8f9..b32967539 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
@@ -39,3 +39,8 @@ Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
 Checking for a 64-bit host to support lmdb: NO
+Checking errno of iconv for illegal multibyte sequence: NO
+Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
+Checking value of GNUTLS_MAC_AES_CMAC_128: OK
+Checking whether fcntl supports flags to send direct I/O availability signals: NO
+Checking whether fcntl supports setting/geting hints: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt b/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
index 759afe8f9..b32967539 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
@@ -39,3 +39,8 @@ Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
 Checking for a 64-bit host to support lmdb: NO
+Checking errno of iconv for illegal multibyte sequence: NO
+Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
+Checking value of GNUTLS_MAC_AES_CMAC_128: OK
+Checking whether fcntl supports flags to send direct I/O availability signals: NO
+Checking whether fcntl supports setting/geting hints: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-i586.txt b/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
index 759afe8f9..b32967539 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
@@ -39,3 +39,8 @@ Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
 Checking for a 64-bit host to support lmdb: NO
+Checking errno of iconv for illegal multibyte sequence: NO
+Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
+Checking value of GNUTLS_MAC_AES_CMAC_128: OK
+Checking whether fcntl supports flags to send direct I/O availability signals: NO
+Checking whether fcntl supports setting/geting hints: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-i686.txt b/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
index 759afe8f9..b32967539 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
@@ -39,3 +39,8 @@ Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
 Checking for a 64-bit host to support lmdb: NO
+Checking errno of iconv for illegal multibyte sequence: NO
+Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
+Checking value of GNUTLS_MAC_AES_CMAC_128: OK
+Checking whether fcntl supports flags to send direct I/O availability signals: NO
+Checking whether fcntl supports setting/geting hints: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
index c989f270b..e8844981e 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
@@ -39,3 +39,8 @@ Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
 Checking for a 64-bit host to support lmdb: NO
+Checking errno of iconv for illegal multibyte sequence: NO
+Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
+Checking value of GNUTLS_MAC_AES_CMAC_128: OK
+Checking whether fcntl supports flags to send direct I/O availability signals: NO
+Checking whether fcntl supports setting/geting hints: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
index 215f57483..e78761de6 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
@@ -38,3 +38,8 @@ Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
 Checking for a 64-bit host to support lmdb: OK
+Checking errno of iconv for illegal multibyte sequence: NO
+Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
+Checking value of GNUTLS_MAC_AES_CMAC_128: OK
+Checking whether fcntl supports flags to send direct I/O availability signals: NO
+Checking whether fcntl supports setting/geting hints: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
index 215f57483..e78761de6 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
@@ -38,3 +38,8 @@ Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
 Checking for a 64-bit host to support lmdb: OK
+Checking errno of iconv for illegal multibyte sequence: NO
+Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
+Checking value of GNUTLS_MAC_AES_CMAC_128: OK
+Checking whether fcntl supports flags to send direct I/O availability signals: NO
+Checking whether fcntl supports setting/geting hints: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
index c989f270b..e8844981e 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
@@ -39,3 +39,8 @@ Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
 Checking for a 64-bit host to support lmdb: NO
+Checking errno of iconv for illegal multibyte sequence: NO
+Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
+Checking value of GNUTLS_MAC_AES_CMAC_128: OK
+Checking whether fcntl supports flags to send direct I/O availability signals: NO
+Checking whether fcntl supports setting/geting hints: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
index f1079749e..4d2726139 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
@@ -39,3 +39,8 @@ Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
 Checking for a 64-bit host to support lmdb: NO
+Checking errno of iconv for illegal multibyte sequence: NO
+Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
+Checking value of GNUTLS_MAC_AES_CMAC_128: OK
+Checking whether fcntl supports flags to send direct I/O availability signals: NO
+Checking whether fcntl supports setting/geting hints: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
index 7a443cc01..b32d30b34 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
@@ -39,3 +39,8 @@ Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
 Checking for a 64-bit host to support lmdb: OK
+Checking errno of iconv for illegal multibyte sequence: NO
+Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
+Checking value of GNUTLS_MAC_AES_CMAC_128: OK
+Checking whether fcntl supports flags to send direct I/O availability signals: NO
+Checking whether fcntl supports setting/geting hints: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt
index 7a443cc01..b32d30b34 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt
@@ -39,3 +39,8 @@ Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
 Checking for a 64-bit host to support lmdb: OK
+Checking errno of iconv for illegal multibyte sequence: NO
+Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
+Checking value of GNUTLS_MAC_AES_CMAC_128: OK
+Checking whether fcntl supports flags to send direct I/O availability signals: NO
+Checking whether fcntl supports setting/geting hints: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt b/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
index 759afe8f9..b32967539 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
@@ -39,3 +39,8 @@ Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
 Checking for a 64-bit host to support lmdb: NO
+Checking errno of iconv for illegal multibyte sequence: NO
+Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
+Checking value of GNUTLS_MAC_AES_CMAC_128: OK
+Checking whether fcntl supports flags to send direct I/O availability signals: NO
+Checking whether fcntl supports setting/geting hints: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt b/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
index fc0400dfd..a89d9b358 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
@@ -38,3 +38,8 @@ Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
 Checking for a 64-bit host to support lmdb: OK
+Checking errno of iconv for illegal multibyte sequence: NO
+Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
+Checking value of GNUTLS_MAC_AES_CMAC_128: OK
+Checking whether fcntl supports flags to send direct I/O availability signals: NO
+Checking whether fcntl supports setting/geting hints: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt b/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
index fc0400dfd..a89d9b358 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
@@ -38,3 +38,8 @@ Checking whether blkcnt_t is 32 bit: NO
 Checking whether blkcnt_t is 64 bit: OK
 Checking whether fcntl lock supports open file description locks: OK
 Checking for a 64-bit host to support lmdb: OK
+Checking errno of iconv for illegal multibyte sequence: NO
+Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
+Checking value of GNUTLS_MAC_AES_CMAC_128: OK
+Checking whether fcntl supports flags to send direct I/O availability signals: NO
+Checking whether fcntl supports setting/geting hints: NO
diff --git a/meta-networking/recipes-connectivity/samba/samba/0006-samba-defeat-iconv-test.patch b/meta-networking/recipes-connectivity/samba/samba/0006-samba-defeat-iconv-test.patch
deleted file mode 100644
index 00b692b58..000000000
--- a/meta-networking/recipes-connectivity/samba/samba/0006-samba-defeat-iconv-test.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 59f7098bfbd63f9b3c19d7d297a8f90870a1893d Mon Sep 17 00:00:00 2001
-From: Joe Slater <joe.slater@windriver.com>
-Date: Mon, 31 May 2021 14:50:38 +0800
-Subject: [PATCH] samba: defeat iconv test
-
-A test was added when configuring samba which requires target code
-to be executed.  In general, this will not work, so we eliminate it.
-
-Upstream-Status: Pending
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
----
- lib/util/charset/wscript_configure | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/lib/util/charset/wscript_configure b/lib/util/charset/wscript_configure
-index 9c27fc6..845eb36 100644
---- a/lib/util/charset/wscript_configure
-+++ b/lib/util/charset/wscript_configure
-@@ -17,6 +17,8 @@ if (conf.CHECK_FUNCS_IN('iconv_open', 'iconv', checklibc=False, headers='iconv.h
-     
-     conf.DEFINE('HAVE_NATIVE_ICONV', 1)
- 
-+"""
-+[added for 4.7.0, but breaks cross-compilation]
- conf.CHECK_CODE('''
-                 uint8_t inbuf[2] = { 0x30, 0xdf };
-                 uint8_t outbuf[4] = { 0 };
-@@ -36,6 +38,7 @@ conf.CHECK_CODE('''
-                 msg='Checking errno of iconv for illegal multibyte sequence',
-                 lib='iconv',
-                 headers='errno.h iconv.h')
-+"""
- 
- if conf.CHECK_CFG(package='icu-i18n',
-                args='--cflags --libs',
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-connectivity/samba/samba/0007-wscript_configure_system_gnutls-disable-check-gnutls.patch b/meta-networking/recipes-connectivity/samba/samba/0007-wscript_configure_system_gnutls-disable-check-gnutls.patch
deleted file mode 100644
index 0f843af20..000000000
--- a/meta-networking/recipes-connectivity/samba/samba/0007-wscript_configure_system_gnutls-disable-check-gnutls.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From a31a014c5d98501074fde1acb5c00162c927c361 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Mon, 31 May 2021 15:47:58 +0800
-Subject: [PATCH] wscript_configure_system_gnutls: disable check gnutls
- AES_CFB8/AES_CMAC
-
-The CHECK_VALUEOF() can not work on cross-compilation.
-
-Fixes configure error:
-  Checking value of GNUTLS_CIPHER_AES_128_CFB8: UNKNOWN
-  Checking value of GNUTLS_MAC_AES_CMAC_128: UNKNOWN
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- wscript_configure_system_gnutls | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/wscript_configure_system_gnutls b/wscript_configure_system_gnutls
-index 2ec217f..cd91b55 100644
---- a/wscript_configure_system_gnutls
-+++ b/wscript_configure_system_gnutls
-@@ -39,6 +39,7 @@ if (parse_version(gnutls_version) > parse_version('3.6.14')):
- if conf.CHECK_FUNCS_IN('gnutls_get_system_config_file', 'gnutls'):
-     conf.DEFINE('HAVE_GNUTLS_CRYPTO_POLICIES', 1)
- 
-+"""
- if conf.CHECK_VALUEOF('GNUTLS_CIPHER_AES_128_CFB8', headers='gnutls/gnutls.h'):
-     conf.DEFINE('HAVE_GNUTLS_AES_CFB8', 1)
- else:
-@@ -48,3 +49,4 @@ if conf.CHECK_VALUEOF('GNUTLS_MAC_AES_CMAC_128', headers='gnutls/gnutls.h'):
-     conf.DEFINE('HAVE_GNUTLS_AES_CMAC', 1)
- else:
-     Logs.warn('No gnutls support for AES CMAC')
-+"""
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-connectivity/samba/samba/0008-source3-wscript-disable-check-fcntl-F_OWNER_EX.patch b/meta-networking/recipes-connectivity/samba/samba/0008-source3-wscript-disable-check-fcntl-F_OWNER_EX.patch
deleted file mode 100644
index d4ceb5ce9..000000000
--- a/meta-networking/recipes-connectivity/samba/samba/0008-source3-wscript-disable-check-fcntl-F_OWNER_EX.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From ba6bc5459cf148dd617fd9cd38dd50c3a9b5d706 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Mon, 31 May 2021 15:50:48 +0800
-Subject: [PATCH] source3/wscript: disable check fcntl F_OWNER_EX
-
-It fails on cross-compilation.
-
-Fixes configure error:
-  Checking whether fcntl supports flags to send direct I/O availability signals: UNKNOWN
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- source3/wscript | 48 ------------------------------------------------
- 1 file changed, 48 deletions(-)
-
-diff --git a/source3/wscript b/source3/wscript
-index adc31ce..f6de0a6 100644
---- a/source3/wscript
-+++ b/source3/wscript
-@@ -1168,54 +1168,6 @@ err:
- #include <fcntl.h>
- #include <unistd.h>
- #include <stdlib.h>
--#include <sys/socket.h>
--
--int main(void)
--{
--        int sockfd, ret;
--        struct f_owner_ex owner, get_owner;
--
--        sockfd = socket(AF_UNIX, SOCK_STREAM, 0);
--        if (sockfd == -1) {
--            goto err;
--        }
--
--        owner.type = F_OWNER_PID;
--        owner.pid = getpid();
--
--        ret = fcntl(sockfd, F_SETOWN_EX, &owner);
--        if (ret == -1) {
--            goto err;
--        }
--
--        ret = fcntl(sockfd, F_GETOWN_EX, &get_owner);
--        if (ret == -1) {
--            goto err;
--        }
--
--        if (get_owner.type != F_OWNER_PID) {
--            goto err;
--        }
--
--        if (get_owner.pid != getpid()) {
--            goto err;
--        }
--
--        close(sockfd);
--        exit(0);
--err:
--        close(sockfd);
--        exit(1);
--}''',
--            'HAVE_F_OWNER_EX',
--            addmain=False,
--            execute=True,
--            msg="Checking whether fcntl supports flags to send direct I/O availability signals")
--
--    conf.CHECK_CODE('''
--#include <fcntl.h>
--#include <unistd.h>
--#include <stdlib.h>
- #include <stdint.h>
- 
- #define DATA "hinttest.fcntl"
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-connectivity/samba/samba/0009-source3-wscript-disable-check-fcntl-RW_HINTS.patch b/meta-networking/recipes-connectivity/samba/samba/0009-source3-wscript-disable-check-fcntl-RW_HINTS.patch
deleted file mode 100644
index a0b751034..000000000
--- a/meta-networking/recipes-connectivity/samba/samba/0009-source3-wscript-disable-check-fcntl-RW_HINTS.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 9942bca2e276c7b4c7696a08594258430c4c5bb5 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Thu, 3 Jun 2021 09:39:56 +0800
-Subject: [PATCH] source3/wscript: disable check fcntl RW_HINTS
-
-It fails on cross-compilation for musl.
-
-Fixes configure error:
-  Checking whether fcntl supports setting/geting hints: UNKNOWN
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- source3/wscript | 61 -------------------------------------------------
- 1 file changed, 61 deletions(-)
-
-diff --git a/source3/wscript b/source3/wscript
-index f6de0a6..3e260c1 100644
---- a/source3/wscript
-+++ b/source3/wscript
-@@ -1164,67 +1164,6 @@ err:
-             execute=True,
-             msg="Checking whether fcntl lock supports open file description locks")
- 
--    conf.CHECK_CODE('''
--#include <fcntl.h>
--#include <unistd.h>
--#include <stdlib.h>
--#include <stdint.h>
--
--#define DATA "hinttest.fcntl"
--
--int main(void)
--{
--        uint64_t hint, get_hint;
--        int fd;
--
--        fd = open(DATA, O_RDONLY | O_CREAT | O_EXCL);
--        if (fd == -1) {
--            goto err;
--        }
--
--        hint = RWH_WRITE_LIFE_SHORT;
--        int ret = fcntl(fd, F_SET_RW_HINT, &hint);
--        if (ret == -1) {
--            goto err;
--        }
--
--        ret = fcntl(fd, F_GET_RW_HINT, &get_hint);
--        if (ret == -1) {
--            goto err;
--        }
--
--        if (get_hint != RWH_WRITE_LIFE_SHORT) {
--            goto err;
--        }
--
--        hint = RWH_WRITE_LIFE_EXTREME;
--        ret = fcntl(fd, F_SET_FILE_RW_HINT, &hint);
--        if (ret == -1) {
--            goto err;
--        }
--
--        ret = fcntl(fd, F_GET_FILE_RW_HINT, &get_hint);
--        if (ret == -1) {
--            goto err;
--        }
--
--        if (get_hint != RWH_WRITE_LIFE_EXTREME) {
--            goto err;
--        }
--
--        close(fd);
--        unlink(DATA);
--        exit(0);
--err:
--        close(fd);
--        unlink(DATA);
--        exit(1);
--}''',
--            'HAVE_RW_HINTS',
--            addmain=False,
--            execute=True,
--            msg="Checking whether fcntl supports setting/geting hints")
--
-     conf.CHECK_STRUCTURE_MEMBER('struct stat', 'st_mtim.tv_nsec',
-                                 define='HAVE_STRUCT_STAT_ST_MTIM_TV_NSEC') # Linux, Solaris
-     conf.CHECK_STRUCTURE_MEMBER('struct stat', 'st_mtimensec',
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb
index fb23a68f7..98baad71a 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb
@@ -20,10 +20,6 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0003-Add-config-option-without-valgrind.patch \
            file://0004-Add-options-to-configure-the-use-of-libbsd.patch \
            file://0005-samba-build-dnsserver_common-code.patch \
-           file://0006-samba-defeat-iconv-test.patch \
-           file://0007-wscript_configure_system_gnutls-disable-check-gnutls.patch \
-           file://0008-source3-wscript-disable-check-fcntl-F_OWNER_EX.patch \
-           file://0009-source3-wscript-disable-check-fcntl-RW_HINTS.patch \
            "
 
 SRC_URI_append_libc-musl = " \
-- 
2.25.1


