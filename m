Received: from NAM02-DM3-obe.outbound.protection.outlook.com (NAM02-DM3-obe.outbound.protection.outlook.com [40.107.95.46])
 by mx.groups.io with SMTP id smtpd.web12.9017.1617973946672959679
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Apr 2021 06:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dLNbuTp9;
 spf=pass (domain: windriver.com, ip: 40.107.95.46, mailfrom: stefan.ghinea@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsrUnuM4uI+k8mQs0wDbOB0HCLcsD0xRk6zsh7wzMkEesubsxZ/vH+B/wO2LpQ3CGsihlO8qOOKxAsynVFKPVyo7CZkrhS6kxMOg3GvpQRnbRIECGlXrimsYN7iI6bPyUaqtcjrgeRXnZFGOnh9ybyT28FRLV/OaMVGWd6tEZaXDDFigVfaMg3LsFTMPOoHT3Oi2xGf8rDyxnFmoggY4yhJyd6JwiEU8Jvs+snMW2G3MsX5E4hOTLkABwmbHS9mg/870InTAn2oBoE9mheuymJmitSzkuXGENQhPDx8Z/mmwqwdd3akrWCZMshVEmG3u5UF7zVLDFnU0SPokTWQyGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbV0J9Oz7Qi4jIj2qpCP0M02jGAk+tRAd0ogB0sOYO8=;
 b=gfWDkfBNI+aXH+r6Qb80dy+JsL4s7EdXZG1UigAFXpl+SkMZgtpD4kSLCci6vQFqU4poiZ1CO9AWg21ZjaUNZqiP/5fh9VTbyJjJMHqS8DyhDg+EDrsg7+gDWDK8jB+QouLKT0IsEGnCodwE0Z2USFDYLBlUb8v2bQqH1jwwMHz9D/oBMh3zrrWP1muWlsZ19ErarXSFqR9vDU6UXQNujiBsrcBTd1lqr85XZdHLasLddBktKTvjQzy3ZDbxlWawQZ2i2Srdki0C4DkWT+dFFCrVaWwcZbcRpYILzDz9Enl/f1gTIs5OY4mUUn3wQ9Clxli35wc+hHc2CPksI0hhKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbV0J9Oz7Qi4jIj2qpCP0M02jGAk+tRAd0ogB0sOYO8=;
 b=dLNbuTp9++DPR4VkvPfozA4QPZLEXVgjJH2jE5Xuml/VXCcK8GmPPA4yAmQkSkKzKmNNyTFSAiy7AJZVzUSp6AVYp/mqmuVdGe6LfZnkA9GTc34BWyL+wM0J2Rx1KkKkKfFF+mGnohxUv55b2oBipM47Vy5MER6MIwvHJGtme7o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 by BYAPR11MB2648.namprd11.prod.outlook.com (2603:10b6:a02:c7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Fri, 9 Apr
 2021 13:12:23 +0000
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::31f5:2e4:c15a:6df0]) by SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::31f5:2e4:c15a:6df0%6]) with mapi id 15.20.3999.036; Fri, 9 Apr 2021
 13:12:23 +0000
From: "Stefan Ghinea" <stefan.ghinea@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH V2] [OE-devel] [meta-openembedded] hostapd: fix CVE-2021-30004
Date: Fri,  9 Apr 2021 16:12:08 +0300
Message-Id: <20210409131208.1512-1-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.137.231.29]
X-ClientProxiedBy: VI1PR04CA0073.eurprd04.prod.outlook.com
 (2603:10a6:802:2::44) To SJ0PR11MB4989.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::22)
Return-Path: stefan.ghinea@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (89.137.231.29) by VI1PR04CA0073.eurprd04.prod.outlook.com (2603:10a6:802:2::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend Transport; Fri, 9 Apr 2021 13:12:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 486564c1-7239-4c65-5015-08d8fb591cbb
X-MS-TrafficTypeDiagnostic: BYAPR11MB2648:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB26488C6B8B2AF7E584612F48F2739@BYAPR11MB2648.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bg9+aiX1MIUzVVPIMlTVWN/KugboO1LrwzBReTmtq2Q0+rWxku3RrvCXW05xtoXzY1dwu50LH/AZgM2Wj1cZW5gdDA6qOHOzR3CYvU0TE2ZPC3Sxd2MGkYpYCNtZj2nfM+hNBsBN8o8bXbUpMghpxR/RQCSdZeTyT8DPoM3uSpFnWyM7sniMtlcv5kgGnMjbKBIrsleO3vG9bn7savgoDYZhh8DJL+JYsAAfIY2q79lYnMzs/eBeJen7pqqISVzPC3hRuKeYQL4lqY8iir1bTFkE/YmUdQgp0FV6nU7NwaslFie9iUeAjvS8BKC0vGdt4ZOqIJIWGiODk1RbE+868AbLZFYxgcNaMmwKCRH0vDDC7+Ml0gaRb1xw5Lz8yG1S4mFJdpMgsB58hljyOVzUzCaofn3I+LlgEpJD9QxoSWsOQVnxpK7Whd5mBFcnkCK6uW1hR4JJGBOHrY+HHTY2bPzd9vAK0MDlHfSy/tTWDFWNZI8/VOWLhYkc/FFcOVUAFeFnFOmiUPotk+No3QgWv0B/qGAFTSBQGiIyZ9ij8mm7/wDIzEvGikALX3zYlZ6fbdgcnYRm4rc1YsXYMbnraofN7KpnPszaXehkuS6VXsxZ6gS9fcJFbVeAXGLTxlmUgm6N5s/wafXnxlTQvOmF20CTllnJd522sHNeppDksJ9EJEb5BXLvgGj59cp4PTF0heOS264tBQPpBZcGIIOjzphnUr/IzMyDGTRMDDOWUhGhgZ0QDNI/VMSivz/lvAkBlUi18HXd45H6xavd/85foOHCfQnf5z3SlK0MvPOplf0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4989.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(39850400004)(346002)(136003)(6666004)(966005)(38350700001)(66946007)(83380400001)(66476007)(16526019)(44832011)(6512007)(38100700001)(36756003)(956004)(186003)(6916009)(1076003)(478600001)(86362001)(26005)(5660300002)(2906002)(8676002)(316002)(52116002)(66556008)(69590400012)(6486002)(8936002)(2616005)(19627235002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?gaYYMJXZIaKepTf3aIqGkTCrtWwHTneLuizYTrGBeYcphxX9UUVquncjFxs9?=
 =?us-ascii?Q?YwRYGH/0f1+g5z1rF8NDMThLQ+OAzW7fns49iKVNejAI4UE6cN20jtPwWAoX?=
 =?us-ascii?Q?IKOostOJMP14Zej/nvXcPvhwY5Fm7/BrRajcIcgk8JQxBbsITXYxkjRRIYQY?=
 =?us-ascii?Q?M8L/EXMd1W5KR4zsZPBEeAFAeaM7ZVK5YxmMWHuQSWxYBBHvcd3qhyjRrCrd?=
 =?us-ascii?Q?Xy73hz3saLlqbFEjurrP5wogVPg6OtiUf65oeYK52MBfInospEfTZdWI87al?=
 =?us-ascii?Q?quG8FnDlFx40w5wzke/m2qsnU8aD1DzeVDqjTb74W41MW7Dc42APigrTE4cF?=
 =?us-ascii?Q?7UJoX3umPU9CaBMI82jOrAuxVxdBg36U99sMs5SytWomok8jABpiVZvd6yyv?=
 =?us-ascii?Q?vx2WkSfIL9L3RlfSCd/TStswcdRE49416VEFPenmFlT+QPyk2SftJqasKZcQ?=
 =?us-ascii?Q?bcfBfCez3pNEzOLtkoJfFvwWiOw7kjsL9W7PeXhOCHV9axjh3C2C57EVqlK2?=
 =?us-ascii?Q?Er1ynjkobNI5wkOFGuPO8leEfbGooEVJNBaVk9uElmCPyRcBGwTi5fzAxsLU?=
 =?us-ascii?Q?GJ3vv4e/XWdVYhwwxDxhTqzE9NFrybL7R45K0zk7Yk8846+Cu7fVv1DPUnxk?=
 =?us-ascii?Q?p1AJ/U7HTiJPFlk36pTbnDJ8OGeYJ8VlciXqJaRzMmXIuTX33bg3s0kuzRzG?=
 =?us-ascii?Q?o8QZ3BTmeIOaxTAbRvR+WtkQacrPotFqzD5x0DqpDKh4j5rZSadILCh/9ekp?=
 =?us-ascii?Q?poir+5y6FiiZ3GYlvB4yXW2ze0G13WLIG5y1BLD5X2RrOmuw2L5JwPLKVt1f?=
 =?us-ascii?Q?z037MN4hoL7/oKGulcu51eP+pFpMySSl986jNCMLiFqtO50Gf5EIs495ab/9?=
 =?us-ascii?Q?6PhTPG70zejBhA5lg8A6m/FUCVPNHPty2nwiN31cVwv1G85cJerYLVOOcLIY?=
 =?us-ascii?Q?OwxTOb8/FMNV3mgmBHOqxBnoH4NfQhl/85Jo1+sh8orhN2XK13Tutmjpo3l0?=
 =?us-ascii?Q?brj7WKfDb6dyIzacOt+ml7uYiItfZA6bMaQObRAaS0zmLbpCP2VwKAW1O+AE?=
 =?us-ascii?Q?kJ6p5NHsauAbgx6su/AfzQOc6wA6KLLkZctJgKDpUlrn2H+7qJnLt1aGDVpl?=
 =?us-ascii?Q?mjQ9sVOfsLXzhN/yLS5L1mYL8LxwrA3nCDkBHewcEQDKJsyc+5wyQapL+kU9?=
 =?us-ascii?Q?HwGF5H36ISn7+Gjt2iQD7y9zYX/aF6D6qX0Q0V49EKg6TRAGuka/nJOD2LpO?=
 =?us-ascii?Q?Ae91EnVazsXBzit5ZnYGzJCvdFC5o/FW2jAo+LDVR4zbmClGYZKlWjL1Kw11?=
 =?us-ascii?Q?5Po4yxhRXma2rR6gJ8WGP/Ow?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 486564c1-7239-4c65-5015-08d8fb591cbb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 13:12:22.8561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6/rl/b21BPS2FOJ3jNdw6R1lUwGdAI+QPocuWHHEvnGYiokWISv4/TZxLBNuGN5hdq2fosErMxs9EwNdINgGGvZYxUhC2RFB12Bhc2ATn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2648
Content-Type: text/plain

In wpa_supplicant and hostapd 2.9, forging attacks may occur because
AlgorithmIdentifier parameters are mishandled in tls/pkcs1.c and
tls/x509v3.c.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-30004

Upstream patches:
https://w1.fi/cgit/hostap/commit/?id=a0541334a6394f8237a4393b7372693cd7e96f15

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
---
 .../hostapd/hostapd/CVE-2021-30004.patch      | 123 ++++++++++++++++++
 .../hostapd/hostapd_2.9.bb                    |   1 +
 2 files changed, 124 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch
new file mode 100644
index 000000000..e2540fc26
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch
@@ -0,0 +1,123 @@
+From a0541334a6394f8237a4393b7372693cd7e96f15 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 13 Mar 2021 18:19:31 +0200
+Subject: [PATCH] ASN.1: Validate DigestAlgorithmIdentifier parameters
+
+The supported hash algorithms do not use AlgorithmIdentifier parameters.
+However, there are implementations that include NULL parameters in
+addition to ones that omit the parameters. Previous implementation did
+not check the parameters value at all which supported both these cases,
+but did not reject any other unexpected information.
+
+Use strict validation of digest algorithm parameters and reject any
+unexpected value when validating a signature. This is needed to prevent
+potential forging attacks.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+Upstream-Status: Backport
+CVE: CVE-2021-30004
+
+Reference to upstream patch:
+[https://w1.fi/cgit/hostap/commit/?id=a0541334a6394f8237a4393b7372693cd7e96f15]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ src/tls/pkcs1.c  | 21 +++++++++++++++++++++
+ src/tls/x509v3.c | 20 ++++++++++++++++++++
+ 2 files changed, 41 insertions(+)
+
+diff --git a/src/tls/pkcs1.c b/src/tls/pkcs1.c
+index 141ac50..e09db07 100644
+--- a/src/tls/pkcs1.c
++++ b/src/tls/pkcs1.c
+@@ -240,6 +240,8 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
+ 		os_free(decrypted);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: DigestInfo",
++		    hdr.payload, hdr.length);
+ 
+ 	pos = hdr.payload;
+ 	end = pos + hdr.length;
+@@ -261,6 +263,8 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
+ 		os_free(decrypted);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: DigestAlgorithmIdentifier",
++		    hdr.payload, hdr.length);
+ 	da_end = hdr.payload + hdr.length;
+ 
+ 	if (asn1_get_oid(hdr.payload, hdr.length, &oid, &next)) {
+@@ -269,6 +273,23 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
+ 		os_free(decrypted);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: Digest algorithm parameters",
++		    next, da_end - next);
++
++	/*
++	 * RFC 5754: The correct encoding for the SHA2 algorithms would be to
++	 * omit the parameters, but there are implementation that encode these
++	 * as a NULL element. Allow these two cases and reject anything else.
++	 */
++	if (da_end > next &&
++	    (asn1_get_next(next, da_end - next, &hdr) < 0 ||
++	     !asn1_is_null(&hdr) ||
++	     hdr.payload + hdr.length != da_end)) {
++		wpa_printf(MSG_DEBUG,
++			   "PKCS #1: Unexpected digest algorithm parameters");
++		os_free(decrypted);
++		return -1;
++	}
+ 
+ 	if (!asn1_oid_equal(&oid, hash_alg)) {
+ 		char txt[100], txt2[100];
+diff --git a/src/tls/x509v3.c b/src/tls/x509v3.c
+index 1bd5aa0..bf2289f 100644
+--- a/src/tls/x509v3.c
++++ b/src/tls/x509v3.c
+@@ -1834,6 +1834,7 @@ int x509_check_signature(struct x509_certificate *issuer,
+ 		os_free(data);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "X509: DigestInfo", hdr.payload, hdr.length);
+ 
+ 	pos = hdr.payload;
+ 	end = pos + hdr.length;
+@@ -1855,6 +1856,8 @@ int x509_check_signature(struct x509_certificate *issuer,
+ 		os_free(data);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "X509: DigestAlgorithmIdentifier",
++		    hdr.payload, hdr.length);
+ 	da_end = hdr.payload + hdr.length;
+ 
+ 	if (asn1_get_oid(hdr.payload, hdr.length, &oid, &next)) {
+@@ -1862,6 +1865,23 @@ int x509_check_signature(struct x509_certificate *issuer,
+ 		os_free(data);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "X509: Digest algorithm parameters",
++		    next, da_end - next);
++
++	/*
++	 * RFC 5754: The correct encoding for the SHA2 algorithms would be to
++	 * omit the parameters, but there are implementation that encode these
++	 * as a NULL element. Allow these two cases and reject anything else.
++	 */
++	if (da_end > next &&
++	    (asn1_get_next(next, da_end - next, &hdr) < 0 ||
++	     !asn1_is_null(&hdr) ||
++	     hdr.payload + hdr.length != da_end)) {
++		wpa_printf(MSG_DEBUG,
++			   "X509: Unexpected digest algorithm parameters");
++		os_free(data);
++		return -1;
++	}
+ 
+ 	if (x509_sha1_oid(&oid)) {
+ 		if (signature->oid.oid[6] != 5 /* sha-1WithRSAEncryption */) {
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
index 87899f3da..e58601868 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
     file://CVE-2019-5061.patch \
     file://CVE-2021-0326.patch \
     file://CVE-2021-27803.patch \
+    file://CVE-2021-30004.patch \
 "
 
 SRC_URI[md5sum] = "f188fc53a495fe7af3b6d77d3c31dee8"
-- 
2.17.1

