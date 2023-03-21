Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C4BC6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 03:15:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4660.1679368493520793085
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Mar 2023 20:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=PTARlLUD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2444130f12=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32L3EefV019165
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 03:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=T53VxzjztSMq5j3CNo5J3zzRk40ERHHqEl3eYQPxL6s=;
 b=PTARlLUDw2PkPl5KEY5uaPgZPKKIk8F3/tkDaU7sPUX1fWwQuuOlIv72CP7AJ7DSVr5L
 v3y441KbrpdjsUZC2TKSOQWiW+9fJGmNpPxRQs2kCphdXBETvBK14ApwklPdnFfV1gA/
 WXWLEtfndQT+UUC5uLMWZTtVgM3N9EuTLIY7+RyTxPz1BQwvcRwDSrnNXcHWwDf9ktS2
 eos7ts48sovjZ6SqnfwkYKC/69NjAvvkYVnEJzbg05QRWjOUoKxwSYuYNk8fvKW4ZAyM
 HroF4twXUMhM073yHQ2l/f4H/LogW6sVOT9SYyyL0oUPwnxxUgKyNwqrfjFmQ1wue1dZ Ng== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2049.outbound.protection.outlook.com [104.47.74.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pd2h3amt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 03:14:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8OjDsVUq245rpiwYl6UE6zW1W5HasGQdOE72pcva+u6DbAP5fRA2iYI2l/pRBUw3KtPs3n7jO90k19TAsBZS/nC8aNpzYwuAFnxpzc9kixpSotwTBwCAF+3jpYUyaqp2H0WqInZ2XqPlXvIt/20BICAV3XLEpOYLyqqjSFCK7nVJPwKcvw4TDlC4Bf7ir64bp+qkMiyscZJOCk766kAG7DixXDEIIAW7W8TJY+hcjvPHLEM9Yca506NQQ8UV3I/CoQsbwU13Txod9QuSc1T0nNIwxuIAkyP8cg/vi+QLoKlbhopfovWp4RUCg0/FVIhoU3aWwKFP/S0NNwxO13CDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T53VxzjztSMq5j3CNo5J3zzRk40ERHHqEl3eYQPxL6s=;
 b=dNml93LQKTdgtkGoSofNwJOx8kBvqhfqMr/rjVPgn1ska+FfWlfA5cuI1O8Gv61qMsU0jEqxGo8yYwaAitPNjYBKmvo3m+Ix9ZCI67VebF9g8DpgWmBpVu9pC0TSPUbM2rjrAjUTBXYKcanmp4f7f+AyDuvbcYaAgCohPPmPKpvg5m34WXcg6lF16ujjywRhl1s1aCtwgVy9bN2D/0JjSpc9MoMbmVPNcqekQTZAIXljxJ39yysE2JmF3cXsWYEFptOoKsXE/y17IYXSLQPBmJMxrtNk6y5I3bYoegyE3tjCmanydzII52/9rhFPCNj8m/4n+f/WFBL2JHeojKjXLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SA0PR11MB4543.namprd11.prod.outlook.com (2603:10b6:806:99::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 03:14:49 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 03:14:49 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH V2] mbedtls: add ptest
Date: Tue, 21 Mar 2023 11:14:36 +0800
Message-Id: <20230321031436.1763260-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0007.apcprd06.prod.outlook.com
 (2603:1096:4:186::9) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SA0PR11MB4543:EE_
X-MS-Office365-Filtering-Correlation-Id: 90e70a7d-76e5-48ff-85c1-08db29ba6dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pjX9fqq7ve72HNbNF8cRzXXirpkIukih4h5cMhdoRfqlWsirEoK3VZ3oBCYJhe9D67HWQBnwSIzOiObnFHqllQeCOOZ7LW+ubYvBM2mEXYxI3ryx7EQ/cRfki9yIXFsFlEx0OSjhX34nNZ+Yls/3+JgmTGPFO6KuUIb59jSDc2NJUXANR1q+O3w1PmLWmUSGxst4PD/vOA2ffZPjJRr18/BRu4M+qZ8LoCgvRr4UAaKJyFQdhYo4jHoFPYsREX6z/HpleZEI1oroMwE+OlGX/0Ep2w0kI8nqZA9uwkz3C0Q5BMTlFit+Ip/gUNLwkfxgBG+azGKKdspq6o2aPJpUrs39JE1KVUx6cIGjpQ7xzGi5dNRnMwk9so1CJ6inm4708LWEvk4Dont3gSCaNnSssclig/7daIl4lfJpsru5EeUEjl+TNW7s6dLvkjdsphFZbJSvsbLCQcOjVhjYDkkLDXXBrQH5GAYrvPwepSIpfZ+vWHkNt1LXbnFE9UGyw3UL0NjNBbcXVrnQcnq4t2Bpn/qdZkZPaOlBvfuRMfYk9uAmnj1qd4eGhSSONVX8D2fBLKJMwtbQLWqhjn0oHGF/N/TYnsSOkZ+OIlVi4IcjaOdwjAkx3/0EWlD699QDEe41k5pckMty0fX7aozBFVgxHotQ9uxU57dnQECCkL7cXZGPukClgoQKF/Nu2/nB1yh7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(39850400004)(376002)(366004)(396003)(451199018)(52116002)(2616005)(6666004)(186003)(966005)(6486002)(83380400001)(478600001)(316002)(66476007)(66556008)(66946007)(6916009)(8676002)(26005)(6506007)(1076003)(6512007)(44832011)(41300700001)(8936002)(5660300002)(38100700002)(38350700002)(2906002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HTgOd+93IU7VW0gBfny4bFalDJ3ZhrRixessI25U4Kc8zCJs0LosJGHMMATv?=
 =?us-ascii?Q?5O66S1excGOsvPObscOHXCcPsSWUZcMZeIAhuMTT2y2+hR6JF1xcFAo0jwa+?=
 =?us-ascii?Q?JQ/SqyPv1VrT4jr2sTBGYsleD7CmG04o/ZpItKYXK1f1XX7qPLk54LmiYemw?=
 =?us-ascii?Q?t69hm4UZlj3slOmr0ZRBMCWLXEK/hQAssA5mli5viNju+KKC9QX5NooZDHcm?=
 =?us-ascii?Q?X4F8blDYKxh4mc5IrMEeqARVjNroY1XW6/7oSRIhe6yyp1jpdHtb1ntdweka?=
 =?us-ascii?Q?AgXK/fquIK5jHD6t/Peojiac/WLVvkK5T8jjT/Uv9ClZS6hpYFrCePc6ejUM?=
 =?us-ascii?Q?sQgQymlBSjKIa82q0IyDGTfVP9pzr0dd9XYrZ4Mfooy66uydd0VfrKKSYTaZ?=
 =?us-ascii?Q?11P8dbe4X0KGtjJE3CNZE6Xx9XvBOymJCttPHVvEVho0IjAZ3A2wEJ/pkRrm?=
 =?us-ascii?Q?iKSF8VEfYcjz2kcv/eu40wkbD60Lkp2h8xxrSr2Px7xYHhZR/xt0j6bKsZat?=
 =?us-ascii?Q?T//dtzm23K3hYjIJlP8P7D8HhVVFML4AK8DX3CKqCZv2FFtwDLGCHgFCvJ6x?=
 =?us-ascii?Q?CEiV79ntBv2ajMN0VsPu14lCgDvuBNdIYee6bIwP86VbxruM3A4qrN/Db1r0?=
 =?us-ascii?Q?L4coq22FiWPWLmYhn558PFVFJH2lajGwEXwErL38nGtavcRaMinVCmaTHr9+?=
 =?us-ascii?Q?Gerf1n0lvG+iDyCaQpBnDZIEXuq6Gq/S7LNZnXEx2j5iyT8GQOE6GpIn4p5r?=
 =?us-ascii?Q?N3IwkC2fAJoyOykDkl/TrLPoUmI8CbWgcipQc0ljOjeQfwR5GnYOPfJ6mG+Y?=
 =?us-ascii?Q?sCJer2mXMUU86c/qtslHqhOwE0P6zXE9xtfgc4N0J2qvKli9w0iJdnFmyBjM?=
 =?us-ascii?Q?VQGO0065WtH3NsYvas6weSdqmdkB0/uh/jLm56lg5zVyXJ54JzjtOr2PS6bT?=
 =?us-ascii?Q?F7BjBUZKHbojwNMgifGybNQeBhguHv3FlzA0Ph2SUOccoX9ULCCopDxFlB/g?=
 =?us-ascii?Q?cEGmVcJx6jVQdQD6RYn0ZRcxRGB3kEsZtl0/TohRJs0Gni9Gen6mAWwIZ+l6?=
 =?us-ascii?Q?MCqLfyiQcGa+9b9RO603lzHtZR+s740b/NfO4yWBVGa6o8wqvXJDDb3I6B/G?=
 =?us-ascii?Q?jMTxK1Qhi3gdatCdAjVTp+PJMMwKBO0sVvCc2/OKZp3tH7kfwTZhqndFhO/A?=
 =?us-ascii?Q?6r5VEDOAnC7IIQbmaUOY9hib4dibtNa3C8mT5IOOC7XjEKIHC47Ph3yUeEFX?=
 =?us-ascii?Q?l/1hSCa9kUEVyLPa0xgKgb5OEzLaHjbx/94ozOTaFR7K5fRqefvNRWwAsuGe?=
 =?us-ascii?Q?9N45IPJuqSjMqi2WvHvrCpHWlWuYfZyftNUxd3FMTXoTFZf/dhjhHXDXzeD2?=
 =?us-ascii?Q?iTn4mb+VQ1oYTMw3ZjiZXcPHJ4bvVFblTkULR0EJbPbmmK5y123LD1qfjkGF?=
 =?us-ascii?Q?RDbwRAoYNspMV2f55lyiGFqD60i4r1Xn+PB82kfSlWHiSS8J16ySJuN9CyyQ?=
 =?us-ascii?Q?FlaQzAS1LNpBylowGCXQLQHqSaDk0Ub0GG2QU4lhvRi4p9eY6WpnczT4ZFtN?=
 =?us-ascii?Q?YoLqN27QZTTRBloapJVVkD5ySJNEgHkbROSLbkbzeJXhpcqbQ7eRkG/JEqjE?=
 =?us-ascii?Q?IQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e70a7d-76e5-48ff-85c1-08db29ba6dfd
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 03:14:49.0778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5lxchxQxBKg+gvwLvwPK8Go6RfCtbz5UIZD1evsvwMAQqrD7krMEQzc2ds/ih/PVllNqed8lHDGx0GS+pmtfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4543
X-Proofpoint-GUID: Whm2zMzXdidKwNrJnw3Bqsm-Nh63pjul
X-Proofpoint-ORIG-GUID: Whm2zMzXdidKwNrJnw3Bqsm-Nh63pjul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_18,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303150002 definitions=main-2303210024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 03:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101615

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
V2 Change: Generate test cases list dynamically

 .../mbedtls/mbedtls/run-ptest                  | 17 +++++++++++++++++
 .../mbedtls/mbedtls_2.28.2.bb                  | 18 ++++++++++++++----
 2 files changed, 31 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest b/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
new file mode 100644
index 000000000..059ab4ecb
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+ptestdir=$(dirname "$(readlink -f "$0")")
+cd "$ptestdir"/tests || exit
+
+tests=$(find * -type f -name 'test_suite_*')
+
+for f in $tests
+do
+    if test -x ./"$f"; then
+        if ./"$f" > ./"$f".out 2> ./"$f".err; then
+            echo "PASS: $f"
+        else
+            echo "FAIL: $f"
+        fi
+    fi
+done
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
index e19587ca0..242495e94 100644
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
+	cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
+	find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
+	cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/tests/
+}
-- 
2.25.1


