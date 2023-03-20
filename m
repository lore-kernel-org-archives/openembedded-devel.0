Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A78C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 08:56:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9276.1679302590971983239
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Mar 2023 01:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=UMDcTSZ5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=24432e4bc3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32K7p2Gx019809
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 08:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=FTOQS/SAKuN6s9tZqTsLqNTKvej7K1CfwsLzJeH6NCw=;
 b=UMDcTSZ5Bf7sD2fEFJPL2fBS/X/fm+gangsJg6Z7/au5fKiNI0QPjo06y1F/64dueY9f
 bFoPGrMEJkQeCDcta3nMefm6LOi7vkeojdVm8Nyth9im43Xs25Y6InjePUwjQ8OOXIWQ
 27WJNz8Vf7BviGgYRGP/OO51ewkeHiblsF6x6GjKZ+YP+4n4YI4tmD6gxoeT5qah4wAH
 swDym0RgCTnCR0ddMSY5w+bApibWCjINkUKlJP8lMaR5TaTQtqf0BF7UXmB9N1uQVw+3
 ClcpC07Efb1V+0ZjWPxYCYbm7kaqcWHbJybfcBNol8wHgJoR3T9pQl/w+iMA75fm3CQq RQ== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pd49asnqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 08:56:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOo3oiQfnTvaLz/eD7kuDvr6dZu/6r378aZePnFwU30uNRlH9adKEDZp6iAFgLh0/ENKQur9gfan4Uj9JMocKYdQ9A+wGVWqDY8DvQNxdbKhQLA+rxNNNovGqNyetZZWcn7ehsbDiRCB/LYLyLaJO4o7R0YGcg6httUFKJuSDlT0InuSXFzLrbXZA2ver9rbsB2NAHQFcF6XjBaoarptJ+//9lEpJqH+BQUMGZ8MYVTWA8bxNUIrmJsQ/V4aP/Y1cPf71IBAVW0z986phYb/Iqwae2G0rRj/z4VZwpgrXw7tbHZkYAbtvp9Jg9WC+ielmsE2kTUKj82lowuDbiNPHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTOQS/SAKuN6s9tZqTsLqNTKvej7K1CfwsLzJeH6NCw=;
 b=d7r5JbtKJe8hMPO4oenzQkko8wagQ7yPmXdMuI5gsehbaNLl5aw8YHtQaOjrwFogZgr4upQTkbOtaw1uTRciSS/pc7CaelYXuegz2it0cveuVb7BF/rFCtPrGd2YkswAp1Stuwd5kspw6ofBGlPki0ed78uES8Swap3aLrZxwTGf91IwyV5GmyR8EOsY5wngcjytLbun0JA36BR24E57lXL9X9Q7iPfVbJVXXoRYLoglfIoIj7CZYFK0FKsfZOYibkq8PJ54HPDDF9aa2DrWW9mliYi0zWHoJKH7LIieNVnxj73z2XhvwY/5vvTuFlfs5gNOi9Mh32WMt41g30UChw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SA3PR11MB7553.namprd11.prod.outlook.com (2603:10b6:806:316::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 08:56:22 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 08:56:26 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] mbedtls: add ptest
Date: Mon, 20 Mar 2023 16:56:15 +0800
Message-Id: <20230320085615.535596-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0161.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::17) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SA3PR11MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: 12cf0bf5-702b-4ab0-b7f9-08db2920fce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	D0gErC6lGWff/qJ6EOAqFV0NikYhGpaAyQ10h5nr7FPtJvaQaob89+Jy1VZ+oKD3VRiBXgu+KbFguRGp2yBLKhCiZx5DU6Pe+GLJyNW2IQJbp/Un4WDnkKJ+XAiiqAxQAICWU4Wg+WjHIZ7yI9jZXJT7wR26IarKUQaRKoNFWUOQ8X1gALOtfU2gq7JrpQ07wc2rTWb0ZskxxEi1K8l+daANvYIpKWtgoWGlAtLwbL0pLrQoB9gd+bNyxkQR+zmkOJx7W5UXtOYhsP6XpFsp/+wBeroIpPN0jQfzlfrCVnFv2BjPp0dOTNTOrjkyc2ImleSLvLVR9nh9KC11smvhQCRddw1H3kkIdDOayLyVbCCnUzjiPc57Yu/uaajw/9BMXArwCvuIeGXFiM4munvfWV/yJcrCEvNGc9905imrPXPyGLjINtw145XhMmbyI8TZvIVs9FYU8GlsCASryOoHcip81WScIXi9uvhTifEfqL6b9U7Nd1SZo9VM3hti00EhM8ua7iytZ2jKJemyGs3YJH2DGA2QWL3Z4dCXDUK+94ZHYuFwv5iuZnCv7kwDU8rJTG7hIDxwcV0JX9PYyfvXmxizkiKf72L2a/sLbaL/j8VOITf+/fdl9g+xUuV1HOpn3kkvBPhGNccdAFBz1QmEH+M0yekebvMowSMUDfYRPCKo0rfkFV3oCwZLVg1wd70i
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39850400004)(346002)(366004)(376002)(451199018)(2616005)(52116002)(186003)(6486002)(966005)(478600001)(6666004)(83380400001)(316002)(66476007)(6916009)(66556008)(66946007)(8676002)(6512007)(6506007)(1076003)(26005)(41300700001)(5660300002)(8936002)(44832011)(38100700002)(38350700002)(2906002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Bh9iy1ijqMadAOGvyUohq82ovUlziEyXuDSrgcj2uUlgQhckhrdxdUB9iC6e?=
 =?us-ascii?Q?DR47ynG/9M5EHajce6YOZuatc17O0G19Jos2KDx4hNhfuJFcdfSbEVVTCiqP?=
 =?us-ascii?Q?0YbYI+FO7UpBXK4xAYb37fdwX97fTc8jLOjttxayPFzDyw0HqCe/4SzRLIDG?=
 =?us-ascii?Q?lDJ6uiSfhRPUQF6eRtOVSjrZjZDscRpHKUmLd0+9xrHXhzOUodPnDhI3mKIm?=
 =?us-ascii?Q?5Tn2o8Xztt2wbPASfDVu060rSv9BzTYPhgqzfZckt6Zxa78TBPdts7mmFDyG?=
 =?us-ascii?Q?YSomcXB/h5zbiDOQeZI18bjBiSr5b6/8YpKF/XH+IMSQe6abEPcnMohHXeuP?=
 =?us-ascii?Q?uA2rHOqmhy/y0nSswzqxPkYoqudzb1GJ8m3ns4WnjvdGV0ryMPHWxdPAPH9s?=
 =?us-ascii?Q?HULc9HboImAVkbgGnKoKperF4bAIjFQcr8FSxI5GhEK2D80GCzlmMyI2jTOG?=
 =?us-ascii?Q?P+T7aUVBsQF8YJa9b/No5PLg/6stvR8ea4c8y7SoLPs85KMzt48o5ICASI3W?=
 =?us-ascii?Q?5R/DwGoB6Rw1wx/HV/oAuF5XuIluNYrWM9cdA7n30nFuEpnl7i/wPSQAxkaN?=
 =?us-ascii?Q?ybil34ysHHToHLkczMp8IGF2PJoJpfDS8ruw8MA7b7Gw9cQKZSM4ax4Ajqaq?=
 =?us-ascii?Q?Jo5k4o/AEFoRAAnG85VEHt+gTlCb3BCuk50W5aIbguqAL0gZt6vI0D7Ra1OY?=
 =?us-ascii?Q?OsCwzqfl38VjYiZe6XDPa4RrIuRGITxt3WFdJ5PSh4Aha0tIssfreQik2sd7?=
 =?us-ascii?Q?JMvO6RK9GE8l9vnYYvPM3pF85QLb12xY2RTNVOgwfREM8GIKAracz+WRZGIA?=
 =?us-ascii?Q?kGpRD9/nNoNG454RsMBy5LZaC4ALSx6xujyi9WdFqja1DWXqyIszPW7X+awR?=
 =?us-ascii?Q?jSdmCEmOC4TY0E24/HK6+/d2aVy/N/bxBJzQeYd++ySpCGUmuNoClWabLwz0?=
 =?us-ascii?Q?RLdHCSmfWEavXqqhx15ukCGiOQTgpYu2UAaquZSDW6Nqzg+G0RYrHxBKqFpL?=
 =?us-ascii?Q?bk9+dVyOXQ6TApCKETX46YXZ3N9DAuWmxSYnP9q4zX9B65ZerivjJHqosYNh?=
 =?us-ascii?Q?72SDS5+/I2zk1nWopZgiF9bFJBSYX3veJDn86wszkBGGEzoM6ZJ71qnLWtNU?=
 =?us-ascii?Q?KcW0pffhkgpYcuN5tBxg+DMxgh9yrpiWnmOJ/etAMsHOpXacsEzysdN58LpR?=
 =?us-ascii?Q?tFy3Asm1CHF7uLf0bj3y66U0y7EYsY5FcmLlsIfD+sO4q2BOKf71SiQ/JW5Y?=
 =?us-ascii?Q?i57/xN6OA5Cs9vayqUoqj87RZQIaSYonNIatvaZM2Moza5rU6Qis+BFOKoni?=
 =?us-ascii?Q?KJENejh8Vpv9ncKoOHywqaJW/k6kVnxr2ZIhAt2MxPTXSWAupUzdtnWYkwzL?=
 =?us-ascii?Q?n8s9nQHjiSym8KMMh3/2x2IkKaCyXeYGn6xjZI8zybTWz0jPuEl7O+/IqcRU?=
 =?us-ascii?Q?npxHu5Tbk0BXEZazKzfaccu+q0FDeQeT6U06u23RO8prChaYcZWOgMpOIx+e?=
 =?us-ascii?Q?rcxupiFPs6gRCLL2DPwpW83QIUbvWnUObnW6ES+X3B4RjLB41xZEXIEGM3J4?=
 =?us-ascii?Q?6chymStYyShytfaZiGOt/yIAnS+Q1sDklNzbOwLP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12cf0bf5-702b-4ab0-b7f9-08db2920fce9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 08:56:26.4893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: akNTGUIaEKwOT50AZSH0ledhK/7K0u10Am5JGOz9Uo72yP3/BcCmQ42AEK3ri4CpU91XwUXpM81b7IVgQOxtQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7553
X-Proofpoint-ORIG-GUID: P1AYjMPNz6JHW5YMEqfr5Kjx8NWIf67Y
X-Proofpoint-GUID: P1AYjMPNz6JHW5YMEqfr5Kjx8NWIf67Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_04,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303200075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 08:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101605

Results:
$ ptest-runner mbedtls
START: ptest-runner
2023-03-20T08:11
BEGIN: /usr/lib/mbedtls/ptest
PASS: test_suite_aes.cbc
PASS: test_suite_aes.cfb
PASS: test_suite_aes.ecb
PASS: test_suite_aes.ofb
PASS: test_suite_aes.rest
PASS: test_suite_aes.xts
PASS: test_suite_arc4
PASS: test_suite_aria
PASS: test_suite_asn1parse
PASS: test_suite_asn1write
PASS: test_suite_base64
PASS: test_suite_bignum.generated
PASS: test_suite_bignum.misc
PASS: test_suite_blowfish
PASS: test_suite_camellia
PASS: test_suite_ccm
PASS: test_suite_chacha20
PASS: test_suite_chachapoly
PASS: test_suite_cipher.aes
PASS: test_suite_cipher.arc4
PASS: test_suite_cipher.aria
PASS: test_suite_cipher.blowfish
PASS: test_suite_cipher.camellia
PASS: test_suite_cipher.ccm
PASS: test_suite_cipher.chacha20
PASS: test_suite_cipher.chachapoly
PASS: test_suite_cipher.des
PASS: test_suite_cipher.gcm
PASS: test_suite_cipher.misc
PASS: test_suite_cipher.nist_kw
PASS: test_suite_cipher.null
PASS: test_suite_cipher.padding
PASS: test_suite_cmac
PASS: test_suite_constant_time
PASS: test_suite_constant_time_hmac
PASS: test_suite_ctr_drbg
PASS: test_suite_debug
PASS: test_suite_des
PASS: test_suite_dhm
PASS: test_suite_ecdh
PASS: test_suite_ecdsa
PASS: test_suite_ecjpake
PASS: test_suite_ecp
PASS: test_suite_entropy
PASS: test_suite_error
PASS: test_suite_gcm.aes128_de
PASS: test_suite_gcm.aes128_en
PASS: test_suite_gcm.aes192_de
PASS: test_suite_gcm.aes192_en
PASS: test_suite_gcm.aes256_de
PASS: test_suite_gcm.aes256_en
PASS: test_suite_gcm.camellia
PASS: test_suite_gcm.misc
PASS: test_suite_hkdf
PASS: test_suite_hmac_drbg.misc
PASS: test_suite_hmac_drbg.nopr
PASS: test_suite_hmac_drbg.no_reseed
PASS: test_suite_hmac_drbg.pr
PASS: test_suite_md
PASS: test_suite_mdx
PASS: test_suite_memory_buffer_alloc
PASS: test_suite_mps
PASS: test_suite_net
PASS: test_suite_nist_kw
PASS: test_suite_oid
PASS: test_suite_pem
PASS: test_suite_pk
PASS: test_suite_pkcs12
PASS: test_suite_pkcs1_v15
PASS: test_suite_pkcs1_v21
PASS: test_suite_pkcs5
PASS: test_suite_pkparse
PASS: test_suite_pkwrite
PASS: test_suite_poly1305
PASS: test_suite_psa_crypto
PASS: test_suite_psa_crypto_attributes
PASS: test_suite_psa_crypto_driver_wrappers
PASS: test_suite_psa_crypto_entropy
PASS: test_suite_psa_crypto_generate_key.generated
PASS: test_suite_psa_crypto_hash
PASS: test_suite_psa_crypto_init
PASS: test_suite_psa_crypto_metadata
PASS: test_suite_psa_crypto_not_supported.generated
PASS: test_suite_psa_crypto_not_supported.misc
PASS: test_suite_psa_crypto_op_fail.generated
PASS: test_suite_psa_crypto_op_fail.misc
PASS: test_suite_psa_crypto_persistent_key
PASS: test_suite_psa_crypto_se_driver_hal
PASS: test_suite_psa_crypto_se_driver_hal_mocks
PASS: test_suite_psa_crypto_slot_management
PASS: test_suite_psa_crypto_storage_format.current
PASS: test_suite_psa_crypto_storage_format.misc
PASS: test_suite_psa_crypto_storage_format.v0
PASS: test_suite_psa_its
PASS: test_suite_random
PASS: test_suite_rsa
PASS: test_suite_shax
PASS: test_suite_ssl
PASS: test_suite_timing
PASS: test_suite_version
PASS: test_suite_x509parse
PASS: test_suite_x509write
PASS: test_suite_xtea
DURATION: 83
END: /usr/lib/mbedtls/ptest
2023-03-20T08:13
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../mbedtls/mbedtls/run-ptest                 | 124 ++++++++++++++++++
 .../mbedtls/mbedtls_2.28.2.bb                 |  18 ++-
 2 files changed, 138 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest b/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
new file mode 100644
index 000000000..9d815fcd0
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
@@ -0,0 +1,124 @@
+#!/bin/sh
+
+# Valid tests to run
+tests="test_suite_aes.cbc \
+       test_suite_aes.cfb \
+       test_suite_aes.ecb \
+       test_suite_aes.ofb \
+       test_suite_aes.rest \
+       test_suite_aes.xts \
+       test_suite_arc4 \
+       test_suite_aria \
+       test_suite_asn1parse \
+       test_suite_asn1write \
+       test_suite_base64 \
+       test_suite_bignum.generated \
+       test_suite_bignum.misc \
+       test_suite_blowfish \
+       test_suite_camellia \
+       test_suite_ccm \
+       test_suite_chacha20 \
+       test_suite_chachapoly \
+       test_suite_cipher.aes \
+       test_suite_cipher.arc4 \
+       test_suite_cipher.aria \
+       test_suite_cipher.blowfish \
+       test_suite_cipher.camellia \
+       test_suite_cipher.ccm \
+       test_suite_cipher.chacha20 \
+       test_suite_cipher.chachapoly \
+       test_suite_cipher.des \
+       test_suite_cipher.gcm \
+       test_suite_cipher.misc \
+       test_suite_cipher.nist_kw \
+       test_suite_cipher.null \
+       test_suite_cipher.padding \
+       test_suite_cmac \
+       test_suite_constant_time \
+       test_suite_constant_time_hmac \
+       test_suite_ctr_drbg \
+       test_suite_debug \
+       test_suite_des \
+       test_suite_dhm \
+       test_suite_ecdh \
+       test_suite_ecdsa \
+       test_suite_ecjpake \
+       test_suite_ecp \
+       test_suite_entropy \
+       test_suite_error \
+       test_suite_gcm.aes128_de \
+       test_suite_gcm.aes128_en \
+       test_suite_gcm.aes192_de \
+       test_suite_gcm.aes192_en \
+       test_suite_gcm.aes256_de \
+       test_suite_gcm.aes256_en \
+       test_suite_gcm.camellia \
+       test_suite_gcm.misc \
+       test_suite_hkdf \
+       test_suite_hmac_drbg.misc \
+       test_suite_hmac_drbg.nopr \
+       test_suite_hmac_drbg.no_reseed \
+       test_suite_hmac_drbg.pr \
+       test_suite_md \
+       test_suite_mdx \
+       test_suite_memory_buffer_alloc \
+       test_suite_mps \
+       test_suite_net \
+       test_suite_nist_kw \
+       test_suite_oid \
+       test_suite_pem \
+       test_suite_pk \
+       test_suite_pkcs12 \
+       test_suite_pkcs1_v15 \
+       test_suite_pkcs1_v21 \
+       test_suite_pkcs5 \
+       test_suite_pkparse \
+       test_suite_pkwrite \
+       test_suite_poly1305 \
+       test_suite_psa_crypto \
+       test_suite_psa_crypto_attributes \
+       test_suite_psa_crypto_driver_wrappers \
+       test_suite_psa_crypto_entropy \
+       test_suite_psa_crypto_generate_key.generated \
+       test_suite_psa_crypto_hash \
+       test_suite_psa_crypto_init \
+       test_suite_psa_crypto_metadata \
+       test_suite_psa_crypto_not_supported.generated \
+       test_suite_psa_crypto_not_supported.misc \
+       test_suite_psa_crypto_op_fail.generated \
+       test_suite_psa_crypto_op_fail.misc \
+       test_suite_psa_crypto_persistent_key \
+       test_suite_psa_crypto_se_driver_hal \
+       test_suite_psa_crypto_se_driver_hal_mocks \
+       test_suite_psa_crypto_slot_management \
+       test_suite_psa_crypto_storage_format.current \
+       test_suite_psa_crypto_storage_format.misc \
+       test_suite_psa_crypto_storage_format.v0 \
+       test_suite_psa_its \
+       test_suite_random \
+       test_suite_rsa \
+       test_suite_shax \
+       test_suite_ssl \
+       test_suite_timing \
+       test_suite_version \
+       test_suite_x509parse \
+       test_suite_x509write \
+       test_suite_xtea \
+      "
+
+ptestdir=$(dirname "$(readlink -f "$0")")
+cd "$ptestdir"/tests || exit
+
+# Run specified tests
+for f in $tests
+do
+    if test -e ./"$f"; then
+        if ./"$f" > ./"$f".out 2> ./"$f".err; then
+            echo "PASS: $f"
+        else
+            echo "FAIL: $f"
+        fi
+    else
+        echo "SKIP: $f"
+    fi
+done
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
index e19587ca0..dc77ba0bf 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
@@ -24,19 +24,22 @@ SECTION = "libs"
 
 S = "${WORKDIR}/git"
 SRCREV = "89f040a5c938985c5f30728baed21e49d0846a53"
-SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=mbedtls-2.28"
+SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=mbedtls-2.28 \
+           file://run-ptest \
+          "
 
-inherit cmake update-alternatives
+inherit cmake update-alternatives ptest
 
-PACKAGECONFIG ??= "shared-libs programs"
+PACKAGECONFIG ??= "shared-libs programs ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[shared-libs] = "-DUSE_SHARED_MBEDTLS_LIBRARY=ON,-DUSE_SHARED_MBEDTLS_LIBRARY=OFF"
 PACKAGECONFIG[programs] = "-DENABLE_PROGRAMS=ON,-DENABLE_PROGRAMS=OFF"
 PACKAGECONFIG[werror] = "-DMBEDTLS_FATAL_WARNINGS=ON,-DMBEDTLS_FATAL_WARNINGS=OFF"
 # Make X.509 and TLS calls use PSA
 # https://github.com/Mbed-TLS/mbedtls/blob/development/docs/use-psa-crypto.md
 PACKAGECONFIG[psa] = ""
+PACKAGECONFIG[tests] = "-DENABLE_TESTING=ON,-DENABLE_TESTING=OFF"
 
-EXTRA_OECMAKE = "-DENABLE_TESTING=OFF -DLIB_INSTALL_DIR:STRING=${libdir}"
+EXTRA_OECMAKE = "-DLIB_INSTALL_DIR:STRING=${libdir}"
 
 # For now the only way to enable PSA is to explicitly pass a -D via CFLAGS
 CFLAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'psa', ' -DMBEDTLS_USE_PSA_CRYPTO', '', d)}"
@@ -64,3 +67,10 @@ sysroot_stage_all:append() {
 	sysroot_stage_dir "${S}/library" "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/library"
 	sysroot_stage_dir "${S}/include" "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/include"
 }
+
+do_install_ptest () {
+	install -d ${D}${PTEST_PATH}/tests
+	install ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
+	find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
+	cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/tests/
+}
-- 
2.25.1


