Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.85])
 by mx.groups.io with SMTP id smtpd.web12.413.1617900283922769044
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=I7vDxUvv;
 spf=pass (domain: windriver.com, ip: 40.107.220.85, mailfrom: stefan.ghinea@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Du0SHb6z1/DJuphMebcPMY5uab0sfAzfGt4yD8FoUG3e7t+d/sv+m0fFIwWz1XZTa95s7UXuN4BsQccVn69ObRynwEBj39H6m4atS7SrHfSSOQ7WtvC5MjgnNy0GiL391OF/dsL8mHdMeYEcneQ42lliqBwPLLQfvXD1kawgx6LtpGGb7NNPdQ3Z2Arjc3/0DCu/lXaP0G/B860ARNVQSbgy+aZGE3BMAAYZH/wdPXRZg/72L/hcAG8PiO58xb6GVcly6tTK+fx54uLGd5M0WQAE8NNJzZQIvubk6+wkcmkuIEY5eRcQMcLs45c9aXQi92syG55xBSUAR85njYeYdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rn4T1H9dNtdO2buPW2id6CzpeWIo/KJB4O8sQe2bY3I=;
 b=gg1GSNSJgHfyzjIZp1+3TZ5qDJQAXGSX5rWhoXR8j7m60pgQzLMkxnzI/aS1+FTOgRCRY/lbaUrxu8CAt9Ya6cWWZT3nlhpEPuXKANRLMyHM/qg46zz4kLBiN1mI89415q1KU2lAWs9+EUqx/67u4BJCcJUTZlhWQikuUN7HNhc9DF0cmizvwwvZlIgfZ8OnS1sOIOONEVn+jiJlNgzfuQNdJr4GYYQH366P0LMPA1qqWFd5rkXC5kR1gPecZ++tshcbCQGqnStmhJ3NMD1+BKXUTGJ8lRrWYntIYz8yPTNqlQ5Awnk0y1aoHervNbgOaKsx9z0cQVWRQ/lzjBN3HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rn4T1H9dNtdO2buPW2id6CzpeWIo/KJB4O8sQe2bY3I=;
 b=I7vDxUvvoche9jSKLpqyrnpm/SRLo8w8Zo70HbU7wlJPQt8S7d+YZ3JeJ+PbIl5MPYf6eZ7luNYN791F/IyMQZa4Y+05WHFYIJJHPA0md+zf1wticHFwp4/x/sB3nKcE2ObiOIo5CS0guTKXyx6mcvBWYzPZPTPO3KSLZqAPBro=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 by BYAPR11MB3750.namprd11.prod.outlook.com (2603:10b6:a03:f9::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 8 Apr
 2021 16:44:42 +0000
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::31f5:2e4:c15a:6df0]) by SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::31f5:2e4:c15a:6df0%6]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 16:44:42 +0000
From: "Stefan Ghinea" <stefan.ghinea@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] [OE-devel] [meta-openembedded] hostapd: fix CVE-2021-30004
Date: Thu,  8 Apr 2021 19:44:21 +0300
Message-Id: <20210408164421.21956-1-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.137.231.29]
X-ClientProxiedBy: VI1PR0302CA0010.eurprd03.prod.outlook.com
 (2603:10a6:800:e9::20) To SJ0PR11MB4989.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::22)
Return-Path: stefan.ghinea@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (89.137.231.29) by VI1PR0302CA0010.eurprd03.prod.outlook.com (2603:10a6:800:e9::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 16:44:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42df46f8-d4ac-4e03-c48b-08d8faad9bdd
X-MS-TrafficTypeDiagnostic: BYAPR11MB3750:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3750DF170500BC25A8EC05F0F2749@BYAPR11MB3750.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tLMdAsXGObLXbg7NrVZnpLH42VcTefzgak4MS2GbTQKBEcOrqiO1r20JWYM7Wda58SrjuGmxC9wQvYJhLsJvj0P+cYchmn4E5DSGdljHjsYaypfYQsHm6CaM/xro2dOvmGzaJnhrJAdgEk8WKDvTBdVUitLReaICggm+R95H0l5v2jgzcHBVh4HHVVFJfTPTPv+PhGlQYtVPKDtmNbxWOkOFfW04F1btlpdHXFG68kFnoSK1SolX/n1SxikFh+QoYvv7vq6xpyfpB6SzKePGp8OddqDAB6gv25kIC/ffeq+A0xDEyy5xsUoz+Z6EYpT0mcXrCozX92ylIvaT/4Gp0YK6ctpDITgE/W3few3g5jRout/v9dVd6GS026mvAcINGx/hvi0Udz//PGdE+3bp8jP2EZRs8ZJ+rK7y7a9c2guBJcwiMb9IlXHRSPIt3andLOq8MUbIu9npHcnln0gZtESu8v1HYfB5Xzk+tQLXSlwDHtggRAlI3mGc+uKBK0kYcnla0fVu9GEISTq9gwuBmrk6PHKQuc20JYrvoc2vFV74Epa3oiSE7mO+Dssq4CK8f50oU5W1ZTOc+wlW4jVdbPvz4aMlNXucENECyQ40jiuTr5p3hf82Au79NpRN03MtvclxuDCuoo9C3tlGQhzwdyDtbhVklT5ixvzc3BGzHMp7dmPSCrXgeR4MOFBjMf0MgpffTe5MAjwHnxx/ioifboIDBsyZYjADDtPvMofZCq7EiFiyL6OyTUnNJ+l4sBU4v918skRXP6yNwL9xBdAhkcJkIH1dZqApMZGSjPKQ7tE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4989.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39850400004)(346002)(366004)(396003)(8676002)(86362001)(478600001)(6506007)(6666004)(5660300002)(36756003)(6916009)(38350700001)(8936002)(2906002)(26005)(66556008)(69590400012)(66946007)(66476007)(38100700001)(16526019)(6512007)(186003)(52116002)(956004)(44832011)(19627235002)(966005)(316002)(6486002)(1076003)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?/yaXT/ghpLtFOxOahoB1EG6Z0XmsKvsGPFypKCphoo6lWB3by0c/GNNUbknE?=
 =?us-ascii?Q?dCj9j7eBoMalv7CgVQmEsM1vc/DsP7Bg6psyWDMrGx1o5Mnz4crFAJqpTEs2?=
 =?us-ascii?Q?olwlU/gRDdOE9zRJwkQIwlVUXNoruCMG7EXYQP9rRokRkqTO6hJIQJG5FecD?=
 =?us-ascii?Q?uzwNANpMLqokkoRte+4OaVDBEbRYDhyffF3QpRojnL7IYW3dmPDQdcO1rwhE?=
 =?us-ascii?Q?kIpHM0aE3HkRl9auXGM4F8LZ456UMRzKYBlOrvjVNmtESGBPuZL35HxRewmg?=
 =?us-ascii?Q?Omkw1xnp9ftv/ybR/ULU22kcNfHy7HlQpjtOFymM43kJ7sFh32ppEjiMSUR5?=
 =?us-ascii?Q?ozx0bbSQo2GKwTZhhE7wjQcGGr55WUIlCFp9GwVzsEASRF4hoiP3m++l6bVr?=
 =?us-ascii?Q?OraMtu31cV7M49eoVL0mRDimAQump18ymxAhM8KI/uGP3xO2hhrIrfH5IDe3?=
 =?us-ascii?Q?yUtnwNhMBJYsGl5oIqynEg+SjAc8KLv3iewT0yGbHBfqLBHhSOYTx/+4ubYi?=
 =?us-ascii?Q?1e9lyyf7Z/w7PRIObrv3IZVzWfGDi3HVtJrc86gMJIJyKe8Fj5WDoEOelf2m?=
 =?us-ascii?Q?Ax9aqa9DV3ozZImkJ0Zoj+gEzInRE/O006Ue4XVRUDUUAk1BYuf1kIAPLm8Q?=
 =?us-ascii?Q?GctW5IYQOUpbq1DqVnsOjNKlxsgq9gEP/uCSZ+y79PUojtHlSYK+3Q3XMDda?=
 =?us-ascii?Q?NB5rJDxtrLUu0tiJkeWOQyz6tgsi4zeq/8SdWEq9yuTCCB4QitBKLnyEHoKM?=
 =?us-ascii?Q?jegrtXBZSIsbKKe9OIM5dQILso4tZ5R6rETkcjbPsCzi9rM2Sh7vNLWiptAx?=
 =?us-ascii?Q?wcG7n5xbEK8rkcXA4yOBcfdibujf2dgLe6km6igcVZIVOCeEhYMEFRjOeGF0?=
 =?us-ascii?Q?uYbwbTBoUvv0B8mJWyYmIR/pLMqJXkdyG3vfD4ZrQpUzPGpktLLJ5L5t2aqz?=
 =?us-ascii?Q?hXaL3IR6AJhxTmgZICulXhDA99JslQMzRLDz/2jtuSXUE6ZSJU6E/N62girX?=
 =?us-ascii?Q?8csLNGeZZdG3y4IAFDKjgqlsJsScoyO5xO/QDGdkir5PCh7Hb37UF5EAKICq?=
 =?us-ascii?Q?OOiOJ8kwLJGdvXaVFIagWd01qGx1QvbWMIQAH6d8GZJMY7jZzaGG5QasOuFd?=
 =?us-ascii?Q?j/2KM1mEg6+ZNJzuTZDUykn+vtrJAyPCFbIAh8yU7LwExTDx1TmBE3eIo807?=
 =?us-ascii?Q?/nj5v2A6EnBxKBNKPTy50MqwyKxv8JMxPerTPuey3zPTaNWj00CXmJoGodlx?=
 =?us-ascii?Q?T4sUTFAtTzOlMtG64uOI7aa/wYvbvzbhsW/CByNGAGk6mqHdwdSwK8eMuYJt?=
 =?us-ascii?Q?PyTHccnprseDqVE7FF1YcU+s?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42df46f8-d4ac-4e03-c48b-08d8faad9bdd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 16:44:42.5746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rFA3XvQ/+wPMyOAXiUKE429u+Uc2K2R0ex+JgI4aFol6/HAL1e7PsyCn/oK8Pitt2Na0NOf0J3pbavC9El8iSXYQ2Vn0gvcNpcowah7pHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3750
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
index 1f38eee0f..16a75bc21 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
@@ -13,6 +13,7 @@ SRC_URI = " \
     file://hostapd.service \
     file://CVE-2019-16275.patch \
     file://CVE-2019-5061.patch \
+    file://CVE-2021-30004.patch \
 "
 
 SRC_URI[md5sum] = "f188fc53a495fe7af3b6d77d3c31dee8"
-- 
2.17.1

