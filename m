Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A84C61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 18:53:42 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1787.1787856812482800774
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 11:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=xmHaKx7b;
 spf=pass (domain: est.tech, ip: 52.101.70.46, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aeh25BOsn9hnWW9SfO3SQ5fhveqUv3nmIRVMYU8RglS/tPvF53lYB3Im5ljjwp9Um6pt7MNL058dHNTtORNVzCAPCiR1EPntxsFdKkEUBcluqLwVYVqeCoGErox/LLYfBltq8UWu/SfHraxl+szI/SwtFZcWXAywAo7eJOK4stZLrhqmq3YaC7Mjsu8wqa8jrLZHTFJVziQQSYKL/fhoGXVfBrsVEJ8QTYEPIF9AOB9yIHIAnLwCVccl6wZH850ZzkiLJOe0mWqZEnWr5vzuB8RvUYxmWXb+rTzKSxYmINZrtgTIcTxPaMnrUiLXD1yXrGBwp36Ph+XTTv2acWPbIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcY6QZQEDqGRfv4Hevg8QrsNdSC0MPKS8mS6ziAbKzQ=;
 b=CcOcw2th2DaULDedgLglabzW2hy3jkdAPiIsyUAuahCzI4XT1tFy/bRnFdCGd8atXBV4kJjDKJnfC8dxMp57Jou2HTL7rEoHURSPnmCan4jaLz0gm9Z6xmZ6NnnMSftb3io6HteVGX02HGRirKT+5akM5GGJDC4iLAwUxEP6ys+0kjI3/wOUajWMJ+kAkqrym+e4ixfhK46ZiZ/7aKZgsEsSOCWiI8sDL6y6nn4TOStmVesh6kkfJevOV182nWvnf+7kssKHvEBrjNsjI4CQfiv0Rbm/cHepTuBEEW29xb8fUl6T5YXpoH7tYciIPSLm6WjWSZcP3OiVzvPcj+FiMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcY6QZQEDqGRfv4Hevg8QrsNdSC0MPKS8mS6ziAbKzQ=;
 b=xmHaKx7bPvFEroLB/VgumeZe+0z+euF1pYFSoKSZBSGiWkpTh8fGZj7gESwmh2qnL7AvB5Ovav/9c1E1KV/9e9wN/PIq0ByL1ChRV/3M6WafXyjJY5XhGHotWYWvv7ASPz0TCrvLfeT7JN6HlEA2Ojjd4sOUuGsw4JI2n76NAWm7O2Dcc03OYo8k0u+GSWXZv6kZozMRBeFmlaUGzhdOGRqPGRtm810sdqYfW1z9mHAon5ONGstIMv1Yca0gV0KbAT7bFWyGFTiD7XUP45FpRkBtWdV0RyZAIGrW/rgr0A6jluzYYlJE2PGD5ImrVXHX9ZoreTusTN42TKCrszUr/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA2P189MB2706.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:424::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:53:27 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:53:27 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-oe][RFC 00/20] Fix OpenSSL 4.0.1 build failures across meta-openembedded
Date: Thu, 27 Aug 2026 20:53:04 +0200
Message-ID: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO0P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::15) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA2P189MB2706:EE_
X-MS-Office365-Filtering-Correlation-Id: c389679b-9b71-415b-7616-08df046c7abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|10070799003|23010399003|366016|6133799003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	q+ykKnrdzZis2WV3sv2zAmMNIO7O5SfhDN+2nK8UIN8HISbJbGnhEx+OtjEruvVuOLj8Pe5HsjCPshS3WUs4Ohd/L1s+nH8VT2ryf2PDkLT9xKOzSIh7AAfbGv0Yl4dKFDxyfWoO5JrLD+ZhuMNGke5g6+8PBStuEDpYY3YSmkdxUQaDuMSVYiFLiH71MycBeSwSKUqPp3FVTA8X9x5eZi4i5ChJs1GE5jUXQb96r4tK0M1Wd+s6u9VR+uUjbuFTCdad1sK1FlEbhHXXquo8LBUgp0nMHyUuKb0+J6TNB+hwLfsFeAmLLVB6PSCjtpnXDIrRwnx4AH7QVZJROLkPRcp17Q7pha0pPVwJjQFRr+x+Wb9kfNp2jHUhu8XTXU9n8DLJ8wlZqSa5seAMyf7pp1TYQRnOMdHU+VPhwGOK7lKD3RZFR8VNXsVc15DFU93Eber9VjlLPMSifnrvUm3eZRY2WG6Rilay23XSiN7w0Cn8jvEm7Zo9U8luN+5nL98zQ17uVQmhoIxhnRVrtM5wy4WTDFqfNl56wKYzHUdEyvvViTR34vbkS6VtwgkGBBExrlEo2ofi6EaPQVlKnaAkHRy2McIlEFvJ7AwRQnVNb09tZm8CuZjqnIPfs/4q7PFunUbKMKmvRvw/Zh9j92q01nDPUOJfergoZMyqQ6KsPZw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fHKuJQLKHe8ofpYh6WNqyW9AJ+E0mGiid/O37jNew0sGOrorFE/aWXeRHbmT?=
 =?us-ascii?Q?96PIu0KgJtF9f9qdxQVmYwQoEcQErZxlYIOTdvHsj19ZEW92X2HmmUu7kGJU?=
 =?us-ascii?Q?jR2WU5NCk/mff1IkBmU/aMxpoRiUzOeab1cVf65ENncBerUKiyTmjlWZyouY?=
 =?us-ascii?Q?zN9hX50vFJoUt12xhpi/pSoDUuVXccAm2hxJTqNMnXJagdVzs82vVDagKBXZ?=
 =?us-ascii?Q?Cgni3kCG02yJzaB3Rpa0dT0aYyAjABY4SUASb41UBSKQKYk0w6nGOYtPMPQk?=
 =?us-ascii?Q?6TJF4Ldo2kx8k1zBk/IbRcjvB/sFjyPoWmoXSFrqsxdPpf3Bpwefv+IAd9LM?=
 =?us-ascii?Q?0dU5ivgE94dboqrdwk9Ycs7yrx7VqgUjh8vIBdw+O09NvcxSuScJUaXDu1UQ?=
 =?us-ascii?Q?j/fRhk5YOlwhiQ7IdQh8AkyTG/bCX7ObS/Cxtne2FNcSjol5IffwFS5AIEq7?=
 =?us-ascii?Q?Xm/aySCt7mZ47GlUAmTdwVMNCK8dvTI6ptPkbgHVxNaO02eETdj1HIShpXk4?=
 =?us-ascii?Q?eRbAEH4AZwuiCfHuTRZ+r0ulWXksx7kpUYoN8Nr8hc4N/dwuXZSYWOuRRwN3?=
 =?us-ascii?Q?TFlc2jOipZcp3f/G1Fxt/9XiAr1291ZxLs5su3goIA0EuQS8U6ilKEa7sgCJ?=
 =?us-ascii?Q?tOrx+bAgf1PXULAjbV10zC9jDlzFG7OGlt2ZktLSu7ziUjPlo0YTEsNfrd5O?=
 =?us-ascii?Q?O3S2ewTpm774QcXmYyhKF3SeWNC905SMnzUuqpjBBrlzY59HGmh91JNUyHe2?=
 =?us-ascii?Q?JPYsZld/8l7leehJomUfktwlOTbKlGduO2wZCxCKcMae3ub0mnvXI10wmuFA?=
 =?us-ascii?Q?LZQeQEKQdS99ZN75qakOCbDwZIyWz8SmYvwOcZSR6FIi2n7WvRrgllIw3HlI?=
 =?us-ascii?Q?uyVQtI+f167rjVjFO+FRQjGNznMllUM+9RTzahBKBDx2j64lsgHBJKGOZ+h3?=
 =?us-ascii?Q?x72HNw07DPFknHfk9F5r+r1vhsd+8rE6tdY3u5mAvdI8XRlJfnFUvfJVM8nB?=
 =?us-ascii?Q?Y7N+vi6R72Tn+FZizVkt30EPoR7Eies7ycLUMxub1TrP3RV9BkjcIFDa2WtH?=
 =?us-ascii?Q?JzE+y04K5AF2K5QQdOC2m1ypMIp9ZUFci9JRZ8BLOD6MCnIX0yTBNs6UBixk?=
 =?us-ascii?Q?a8Scj1fxaHy8+Bu4wUT2jFqSSeNLtF2ZbG/REcKwqqySOmnGVACTyUGoQfKV?=
 =?us-ascii?Q?XhqQkm9fUAyilZ9N5CcHmivvS3Wavrnebr/XH5t/A+WczWcscJlnrPgu4gA0?=
 =?us-ascii?Q?rrdn8SJ6VJOojziAkWOonrknFPYsrLjFoXYHluQPUCiNs3bYjMELa1dDXD+R?=
 =?us-ascii?Q?EPDV+lekuat2e4KZNkvbhGG4XvK+0f1mRzxNGMvMpGYtCSdtRz+cVTjFMN4I?=
 =?us-ascii?Q?RNsgcVbNOnTyxjcu2CLijAx4gt59/U/trcmBNLaM8pxg4JUppj5rkZjOz3Fh?=
 =?us-ascii?Q?LPd/pzWgdMxewhuKgciaElMvK9K1syBa9tDA3TFYIvAt2SKfTCW6ils8l8ne?=
 =?us-ascii?Q?KpNB92KGPTeW7nyHHnAqlAEP4n6MH/rgCLkbNEBH8zOXSluorDz/v77Mlqs0?=
 =?us-ascii?Q?5+svLzcWF3tkktidHGOdlTyJoR77jepFbyVgBPK+aWkGxY/0BIpmUzRCAW8g?=
 =?us-ascii?Q?xuhgQp1Rk5/r7QMHyZGkZ/0cXeo/FVRWBHDTDTZh/mdJ3+6GkDFjv9j4DyT5?=
 =?us-ascii?Q?KtynFwIEso3d8Dk6oML7IK8h8Sy4k179f9+KRIU9w1xpYzCrj/4CyZ75JRfC?=
 =?us-ascii?Q?jlXwfOXr7WM8MA1tE5X16hfjSqMwWhy7+l6h7Kb+ZB1b9EltEyKzKa8OJyAe?=
X-MS-Exchange-AntiSpam-MessageData-1: 54X6JzPrNr0iU+qDgeJ0ZJmVy0X0xsOCSO4=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c389679b-9b71-415b-7616-08df046c7abb
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:53:27.3363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wI5OLUs6D8vL53Nx9fiho9lz4Nwq2eALucpcZi82N6NHsr6xn6vZC6EuxUm8iaT5DRn93OEsaXxwsKhNY5D9qMOwdU8vta4W6NRQix4Y4LA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2P189MB2706
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 18:53:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129535

OpenSSL 4.0.1 upgrade in OE-Core (RFC v4 series on openembedded-core ML)
introduces several breaking API changes that affect recipes across
meta-openembedded:

- ENGINE API removed entirely
- ASN1_STRING, ASN1_TIME, ASN1_OCTET_STRING made opaque
- const qualifiers added to X509 getter return types
- Per-version TLS method functions removed
- ASN1_STRING_data() and ERR_remove_state() removed

This series fixes 20 recipes across meta-oe, meta-networking,
meta-python, meta-perl, and meta-multimedia. All patches have
upstream references =E2=80=94 either backports from merged commits or
submitted PRs.

Tested with bitbake world -k on qemux86-64.

Known remaining failures (not addressed in this series):

ENGINE API dependent (needs Provider API rewrite):
- imx-cst: NXP proprietary, no public upstream
- extract-cert: needs Provider API migration

Dead/unmaintained upstream:
- wvstreams/wvdial: archived 2018
- ntp (classic): EOL 2023, recommend chrony
- loudmouth: last activity 2019

No upstream fix available:
- ldns: heavy deprecated API usage (issue #243 since 2024)
- unbound: upstream PR #1437 attempted, closed
- softhsm: upstream PR #882 in progress
- ipmiutil, synergy, spdm-emu: no upstream fix

Indirect:
- mercurial: Python 3.14 + OpenSSL 4.0 reports TLS 1.2 as
  unavailable (upstream CPython limitation, only Python 3.15
  officially supports OpenSSL 4.0)

3 upstream PRs submitted by us: ntopng (merged), thrift, snort3

Jaipaul Cheernam (20):
  freediameter: remove openssl-engines from RDEPENDS
  krb5: fix build with OpenSSL 4.0
  libnet-ssleay-perl: fix build with OpenSSL 4.0
  libtorrent-rasterbar: fix build with OpenSSL 4.0
  pkcs11-helper: fix build with OpenSSL 4.0
  opensc: fix build with OpenSSL 4.0
  grpc: fix build with OpenSSL 4.0
  python3-grpcio: fix build with OpenSSL 4.0
  thrift: fix build with OpenSSL 4.0
  boinc-client: fix build with OpenSSL 4.0
  imapfilter: fix build with OpenSSL 4.0
  lftp: fix build with OpenSSL 4.0
  civetweb: fix build with OpenSSL 4.0
  freeradius: fix build with OpenSSL 4.0
  snort3: fix build with OpenSSL 4.0
  znc: fix build with OpenSSL 4.0
  libesmtp: fix build with OpenSSL 4.0
  ntopng: fix build with OpenSSL 4.0
  libcoap: fix build with OpenSSL 4.0
  pjproject: fix build with OpenSSL 4.0

 ...k_ossl-fix-OpenSSL-4.0-compatibility.patch |  40 ++
 .../pjproject/pjproject_2.17.bb               |   4 +-
 .../0001-Fix-compilation-with-openssl-4.patch |  27 +
 .../civetweb/civetweb_1.16.bb                 |   1 +
 ...ING-functions-for-OpenSSL-4.0-compat.patch |  78 +++
 .../freeradius/freeradius_3.2.10.bb           |   1 +
 .../0001-allow-build-with-OpenSSL-4.x.patch   |  55 ++
 .../recipes-connectivity/lftp/lftp_4.9.3.bb   |   1 +
 ...fix-const-qualifiers-for-OpenSSL-4.0.patch |  53 ++
 .../snort/snort3_3.12.2.0.bb                  |   1 +
 ...OpenSSL-Support-4.0-and-later-builds.patch | 507 ++++++++++++++
 .../libcoap/libcoap_4.3.5b.bb                 |   1 +
 .../0001-Fix-build-error-with-OpenSSL-4.patch |  51 ++
 meta-networking/recipes-irc/znc/znc_1.10.2.bb |   4 +-
 .../freediameter/freediameter_1.6.0.bb        |   2 +-
 ...-with-OpenSSL-4.0-opaque-ASN1_STRING.patch |  31 +
 .../libesmtp/libesmtp_1.1.0.bb                |   4 +-
 .../0001-Fix-build-with-OpenSSL-4.0.patch     |  42 ++
 .../recipes-support/ntopng/ntopng_6.6.bb      |   1 +
 ...Improve-future-OpenSSL-compatibility.patch | 285 ++++++++
 .../0002-Remove-OpenSSL-1.0-support.patch     | 627 ++++++++++++++++++
 ...ing-const-qualifiers-for-OpenSSL-4.0.patch |  67 ++
 .../recipes-connectivity/krb5/krb5_1.22.2.bb  |   3 +
 .../0001-Add-support-for-OpenSSL-4.0.patch    |  61 ++
 .../libtorrent-rasterbar_2.0.12.bb            |   4 +-
 ...SSLSocket-fix-build-with-OpenSSL-4.0.patch | 113 ++++
 .../thrift/thrift_0.24.0.bb                   |   1 +
 ...1-crypto-openssl-use-ASN1_TIME_to_tm.patch |  45 ++
 .../pkcs11-helper/pkcs11-helper_1.31.0.bb     |   4 +-
 ...ls-Fix-OpenSSL-3.0-4.0-compatibility.patch |  85 +++
 ...L-4.0-const-and-opaque-compatibility.patch |  61 ++
 ...sport_security_utils-for-OpenSSL-4.0.patch |  63 ++
 ...ing-const-qualifiers-for-OpenSSL-4.0.patch |  49 ++
 meta-oe/recipes-devtools/grpc/grpc_1.83.0.bb  |   4 +
 .../0001-Fix-build-with-OpenSSL-4.0.patch     |  41 ++
 .../boinc/boinc-client_8.2.15.bb              |   1 +
 ...NG-accessors-for-opaque-ASN1_INTEGER.patch |  45 ++
 .../imapfilter/imapfilter_2.8.5.bb            |   1 +
 .../0001-Changes-for-OpenSSL-4.0.0.patch      | 331 +++++++++
 .../recipes-support/opensc/opensc_0.27.1.bb   |   4 +-
 .../0001-Fix-SSLv3-in-OpenSSL-4.0.0.patch     |  34 +
 ...emove-support-for-some-TLS-functions.patch | 192 ++++++
 ...SSLeay-to-support-opaque-ASN1_STRING.patch | 175 +++++
 .../libnet/libnet-ssleay-perl_1.96.bb         |   6 +-
 .../0001-Fix-OpenSSL-4.0-compatibility.patch  | 140 ++++
 .../python/python3-grpcio_1.78.0.bb           |   1 +
 46 files changed, 3339 insertions(+), 8 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/=
0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility.patch
 create mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb/=
0001-Fix-compilation-with-openssl-4.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/freerad=
ius/0001-Use-ASN1_STRING-functions-for-OpenSSL-4.0-compat.patch
 create mode 100644 meta-networking/recipes-connectivity/lftp/lftp/0001-all=
ow-build-with-OpenSSL-4.x.patch
 create mode 100644 meta-networking/recipes-connectivity/snort/snort3/0001-=
ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch
 create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/0001-O=
penSSL-Support-4.0-and-later-builds.patch
 create mode 100644 meta-networking/recipes-irc/znc/znc/0001-Fix-build-erro=
r-with-OpenSSL-4.patch
 create mode 100644 meta-networking/recipes-support/libesmtp/libesmtp/0001-=
Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
 create mode 100644 meta-networking/recipes-support/ntopng/ntopng/0001-Fix-=
build-with-OpenSSL-4.0.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0001-Improve-fut=
ure-OpenSSL-compatibility.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0002-Remove-Open=
SSL-1.0-support.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0003-k5tls-fix-r=
emaining-const-qualifiers-for-OpenSSL-4.0.patch
 create mode 100644 meta-oe/recipes-connectivity/libtorrent-rasterbar/libto=
rrent-rasterbar/0001-Add-support-for-OpenSSL-4.0.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/0001-TSSLSoc=
ket-fix-build-with-OpenSSL-4.0.patch
 create mode 100644 meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper/0001=
-crypto-openssl-use-ASN1_TIME_to_tm.patch
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-credentials-Fix=
-OpenSSL-3.0-4.0-compatibility.patch
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0002-tsi-fix-OpenSSL=
-4.0-const-and-opaque-compatibility.patch
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0003-tsi-fix-ssl_tra=
nsport_security_utils-for-OpenSSL-4.0.patch
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0004-tsi-fix-remaini=
ng-const-qualifiers-for-OpenSSL-4.0.patch
 create mode 100644 meta-oe/recipes-extended/boinc/boinc-client/0001-Fix-bu=
ild-with-OpenSSL-4.0.patch
 create mode 100644 meta-oe/recipes-support/imapfilter/imapfilter/0001-Use-=
ASN1_STRING-accessors-for-opaque-ASN1_INTEGER.patch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/0001-Changes-for-=
OpenSSL-4.0.0.patch
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0001-F=
ix-SSLv3-in-OpenSSL-4.0.0.patch
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0002-O=
penSSL-4.0.0-remove-support-for-some-TLS-functions.patch
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0003-F=
ix-Net-SSLeay-to-support-opaque-ASN1_STRING.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001=
-Fix-OpenSSL-4.0-compatibility.patch


