Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E5C0C43217
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 02:45:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7547.1637808310909478107
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 18:45:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=L4aNegE3;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6963faa46c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AP2ix26016953
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Nov 2021 02:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=ywBWBQ+AG9e7lOX+CGnzG4pbUnI8H+tGT/LLqUtwWI4=;
 b=L4aNegE3rB2fTUHnajfWyDIivzXcXYaqedKf8Vj40DtXaW2P4vwBqXgwX5iuGNM/4iEJ
 7oFt+S22N3tbsZN5zY2R148gFPLiA62c6+8T22MNJr2BTLBZpt/zFzYIW1ww2K074KUo
 PxaVk0QNw5q4qDopKwStPbQwlC78cnMfbiUP05id+sUC2Rr/GDruBaAG4DJHVQXqxqk8
 eun3DuzWDbGINIj5ZbY7fxKn0WBxqDpUzWN42IQlbRsm4ZKPe2kjiaIdr7zaw6WwldZt
 F5c9ip2Ia3jKyt8vp9nxVzIG7G3gjiNpyaNlsdZ39XxNZMezdK+YN3bbqrOgfJB2fLIY 7Q==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3chce58yxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Nov 2021 02:45:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXxqug+zZh7rPTNKZEmBmnxyrR3bv0zSh7Q5NPZQztXbxQ/B8SQUdO0mLdRnHCF63+HA3DmnL/fQinGkBzC4bX3CiAL8bXJyE1Fn5rb0UQh9rDQiTAMAQWGYCtCzqGldWxNAa3ITiFGI08flVKqYyh1dVV6YSkwTvzi7G0ZTtCCHHw+dWVjY1xyiehgXi0mSf9s1d/rh3ZGxT+ubh30nATr0MnmqQzYt2E6xANM7jXzya+5++3SY7IgmA+BqWhL5hvYXA7oB83QomVjl6/LCVwTzu+R/T+YVEKdBJ8XJIs7KNvWLEdaPKKRjf33lbdr2tZKpWfqeg9QF0+g8qH2BGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywBWBQ+AG9e7lOX+CGnzG4pbUnI8H+tGT/LLqUtwWI4=;
 b=ffVOiLxRlAvCtv6Y5ZE2WM9onPRVX/nyu9uM+TLoCfe7bJp4HIODHbomGu77jlyAAt7kdgWbfNjBWGvWkpl55w24fp3TpjAuZ6ARNuS/Oj2bRsUyqo8IYt715qr84pz893OShdlY2aZXr+nhYHJBZhA0jwmFPlxTCUIdZXhdAv6KhY/Jc04/FE6p6wIT3y0NjIindFLOg6ggqx6Eul1mXtxFCBhoFMcwN9+kXwKeO5YGlSqRzBE6O+wnDMVK4244WVQ/O9/e4CcLGeIHavjcbOFiiWj7ovtFMgyFh1zw+2ecPoQo/ks1U2c5qRsD7s/zR+b7xuYIjL9O9YJz5jungw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4803.namprd11.prod.outlook.com (2603:10b6:303:90::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 25 Nov
 2021 02:45:07 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4713.022; Thu, 25 Nov 2021
 02:45:07 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 7/7] samba: update cross-answers files
Date: Thu, 25 Nov 2021 10:44:50 +0800
Message-Id: <20211125024450.143364-7-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125024450.143364-1-yi.zhao@windriver.com>
References: <20211125024450.143364-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0062.apcprd04.prod.outlook.com
 (2603:1096:202:14::30) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK2PR04CA0062.apcprd04.prod.outlook.com (2603:1096:202:14::30) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Thu, 25 Nov 2021 02:45:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18cd0ffd-2dd1-4309-d67c-08d9afbd9766
X-MS-TrafficTypeDiagnostic: CO1PR11MB4803:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB48031DB3E4EF935711C2C60CF9629@CO1PR11MB4803.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dz/KjBGihetmRzHhdJA5PjazGvUK2NDiz3OzN3zQmAGzEQPxQaTsQ/u63XWlR/+r1SMu95rzVnEsNyHnkrRvga8suIjkE0yRLOIc0/c38YQAQOUqEshcdNTq1h0U1OCimGY0NlqG2p0CCZdRPoO3c56jSj2Ec7uyhndikKolH2JfbTT/QFbdfuRQu/vaO5ft7kkbcXN4NR/5lNk+3GzJ+BqKC2Svp/3eDQhBJrDfTjCU5yFOatrL6Vn7f335Z7xQ4zCL8qQvLqF5y4EhQMkXMdw8fD8OYzXeVRfr46tOKPifvYEiPrNQ6DnFdvOJWcwgOYSA1m5CC8MKH8mICXoxKV2qAo1NXObcNBym9zj7dXPGim0HlGGdlr4BX0+xKElMVCjzJZn5aKtgbjf0cSonGFNcepMah45hMtwVFQRdVozFhynlJsjxh+dVgJvKB4sLYunHRt6KnoKCGj/J8w1JNi3jit9tLS4qeYb6HONT2PLljuZzVQQCcNcUxJt/q0OLSK0q98tS5TzH2+pAOCtBCO4UpWlDbEpuqK8a1j/m3oWM81sz5LWS1lOYELn9LtHJCbOFfLbXQzdVOd8LKRwcszaTdS9PpGTVmyKi0Zr81NipEFHcrgGQwrG0jRX7dmZUUUVolhUHIrPW9nFhZuKyoczUcpaawcW78/4f7Jnpk4jLxWPI2rSxjChIfoQ6ToyKYcCm02E9Xb/nFHEJJuZRkQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(44832011)(186003)(6916009)(52116002)(26005)(6512007)(2906002)(5660300002)(6666004)(30864003)(2616005)(956004)(6506007)(508600001)(66946007)(36756003)(1076003)(66556008)(8676002)(86362001)(38350700002)(38100700002)(66476007)(316002)(6486002)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NpOt/dgqafSkBi5d/jBXDhW1rBy1jAyo3SWTF+sgZ0eDCkYq+38DgZBtHwMu?=
 =?us-ascii?Q?XlEHzNTLa6NNsiJTlco5rdwUfgrE0IeZy17xfiqP1cPfnU+wB5BjE1Rczkmc?=
 =?us-ascii?Q?jaVPilxDBS+IJTNZKS/NrSaomnzTZ9r0RCxF+Ca74e/gEKLXWMWGfwxpwuhM?=
 =?us-ascii?Q?XgRbLw5UfmRpz5IlcTfST+znK5CQa1CEm23ZXj26ejB63JQX6tazrOHuGnPs?=
 =?us-ascii?Q?rtSyVskAaBd2EX63ao+PyufTi+Eo1XNRHmx0K8+Fy1PIWlqwIXhmOCFYoba9?=
 =?us-ascii?Q?Q6FqbI+ofEqJC800gzDmTmIgFcVT3JUzljgpK+EQrBXQdyqq6gwHbwBc1Pun?=
 =?us-ascii?Q?ohAuI5qvMldBvZ62KDiqIbmQB0vwcvKh1vSfWrRfSKyLDZsWs4bvZD3FgWWO?=
 =?us-ascii?Q?/rrJkV1EJAnR/l+ZzkYAwmNHZhde2k2KQFAQBw/uQoqTN8iVzTwVTF6MPb5E?=
 =?us-ascii?Q?wiY6AzETfqO0aB6eizLfKzVdIU7KTLFot/laqs4zgtD4bErpRSN3JR6SKM9W?=
 =?us-ascii?Q?P474JOesjJwx6tKpxcrMCrZDKU1na7RSCdQLJHWB/dmon4efiN2jPiym33wk?=
 =?us-ascii?Q?94+T89MfgKY7aH5XQUnreUdajl1nT/DpeG2kPBaEW0prPn3T+lUNJRqzMU15?=
 =?us-ascii?Q?lzpBKamN1rzNYp4POVHv0gBZwsZfhbxYdQryWmloosP94m1zM68I+A/Adxiy?=
 =?us-ascii?Q?iWOmggP9v19vuoeM0gEclfJ5ULd/LfjY64D3JBO3nqmkoRJB7ebEsQxy5PE+?=
 =?us-ascii?Q?APdBYFPgSSrCgCASwgb9iboFZlF+1tiScC9jY7UlwNXXK61/Q7MSypI+nWBo?=
 =?us-ascii?Q?OitFGvCVKCF37WESDchEZ6JqnT1zxdQ3KQlWK25C7K3gg7P4Hdu8Y1Uro1b/?=
 =?us-ascii?Q?BqzTEylXDlynhv5OJTqtc9mbgv8vfH+qmDUmInEWl7uPAnjKJyJYuRGsmIPf?=
 =?us-ascii?Q?oPXzFoJgrmailBunnOk6pmJ4QpOjBNFzFEzvWFy4FxbRAC08jWPPu0CNH7iB?=
 =?us-ascii?Q?3YD7EI0iJHZFmnNvUyjGfp7X3RtqkhttAMXhdxqTmTw5pl9ehzOlpy4WB+AG?=
 =?us-ascii?Q?qcSlKBdrRKFTff8xiGw5oLDyXiElpu1mBqof8kq4MqbEwdu0deXgPAPtG6UL?=
 =?us-ascii?Q?vA8s+7C2ERqTnysl8OVuMZXISZp6DZxsYV7Q1RWNyknYBVhn8/d79z0YZ74i?=
 =?us-ascii?Q?tZix/N5sHP1+g9duTgRGn+px87h5FsfMq0HsIRpblZwWKavYBlECrCp18mJM?=
 =?us-ascii?Q?RxgAY61lkIphLRSKSxmHEmMIawFagUSPpkZJLT6+65lgNx/Raucf3p8ezx5E?=
 =?us-ascii?Q?j2FFYEaxm0Wb/vkisblDci0PL3evfRPtAsciPITCoHekroDgVX8OVxCwtKOA?=
 =?us-ascii?Q?hV8EQ97JFRe2/9pVLYqLl2GYWj0gir41xthvlB+iGCG4ChmlAmJkqMd9pX4D?=
 =?us-ascii?Q?VW6c+2aGPSWSdKd0qFWJN3Y2GJUbvfNZfTEcPHV1h9I4KeaGmeytKZzVgv+g?=
 =?us-ascii?Q?zhJNc2CsmRjoHPVNHQYtFgXkoRtfyierTHmUQDfVRVgkqOvsU+37kXGaDZ73?=
 =?us-ascii?Q?vGa/XxUvQuxWh6hsQEwKferd74ui8+2BghLuTnFzfAP9NX+LbNHMzLw1VOj9?=
 =?us-ascii?Q?PMtvKnO4asonn2rJFlh7AMc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 18cd0ffd-2dd1-4309-d67c-08d9afbd9766
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 02:45:07.7317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 12DM+IPyvZOvGFMqovI8ZGIEuY0gNfx2Q83Fs6QfqC73nyVL/kPzOjQ2ljx/pbaYmULKiBwWuJ/WELtlXl0Ktw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4803
X-Proofpoint-GUID: e0NZmtykKVUDH9G8nHymnh8GuUpDzUE5
X-Proofpoint-ORIG-GUID: e0NZmtykKVUDH9G8nHymnh8GuUpDzUE5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_06,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111250012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Nov 2021 02:45:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94122

Replace the configure tests UNKNOWN answers with the correct answers.
Then drop the related patches.

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
index 0a5dbe9c9..d51ec54d5 100644
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
            file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
            "
 
-- 
2.25.1


