Return-Path: <roman.alyautdin@rtsoft.de>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0114.outbound.protection.outlook.com [104.47.2.114])
	by mail.openembedded.org (Postfix) with ESMTP id 29B666014F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Sep 2016 01:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=5031003890.onmicrosoft.com; s=selector1-rtsoft-de;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Nh71eDhUGN/dU46/l2vAerqK8tLXr6x7gT5u55YzBZo=;
	b=bwA6MH7pY5QR5rHy9wA4Ln8ynNDkXK2gcIgOY2zp2++CyDJPOaVcRi3vlygEW68xSsdh2Ok1kgd3nHawsJO3x/zv5Qa4uOzwTteUIQXTCdDqpXlV7Z3P49UIhq+ZY9r6ozs51UibjMJ1D+89AyFCvXfNMGkSWTFgRrTWYhlq9Yk=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=roman.alyautdin@rtsoft.de; 
Received: from romanpc.dev.rtsoft.ru (213.79.90.226) by
	AM3PR06MB353.eurprd06.prod.outlook.com (2a01:111:e400:881c::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.629.8;
	Fri, 23 Sep 2016 16:08:12 +0000
From: Roman Alyautdin <roman.alyautdin@rtsoft.de>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Sep 2016 19:07:49 +0300
Message-ID: <1474646869-6967-1-git-send-email-roman.alyautdin@rtsoft.de>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [213.79.90.226]
X-ClientProxiedBy: AMSPR02CA0021.eurprd02.prod.outlook.com
	(2a01:111:e400:8028::21) To AM3PR06MB353.eurprd06.prod.outlook.com
	(2a01:111:e400:881c::14)
X-MS-Office365-Filtering-Correlation-Id: 94f39f25-5aad-4c5e-bb20-08d3e3cbd1a8
X-Microsoft-Exchange-Diagnostics: 1; AM3PR06MB353;
	2:eS0D89u8SgnrTmZLtjDMHaaP1j2hlkWBUfuC+TQCh4IyG2/SZlsj9MiRAbpq2FKel8PO8+JfgtbQT1l400zz4wLyghg9krCleJJvzGoxmMSJj/txkkkLggbpLf3p8iZvs5IdvE7kjZ3fUJizvSY0lWtm2SQuaNoGZgaYxzPVMFonDcZCMrvfch2x7UwBpMbR;
	3:OrYv0O6N4HE6L7bCGQJLHsYJaLPrzhUc7H35AOsriUGjbwdYLfM2lp64pa9Zk+Ru958FAmOtIs7n+73QCQYAji2HZxck9ShBQDg89GVI1wAdcULq/xKY0WR4YFD5zzFs;
	25:X4Z+ubnMU5epu2gG77TkvFFPzl9vVuvb/1Tnns9JExdM5RQF7G8YahTap7yxJ0E96l8Mz2FYTn0YwfBhDhFz0SIicKPhjyrM0HB0SQSx+5MUkTIjmFj4GU5rJeJkmO7Yr46BdGJI3jMQJD6fTu16RTgEeUuGbaMig+YZ2KXon8DYwExkchjaivLj5FBHpM8cJoYQ0MtGfCyosPeb08rzjFjW+dkuZBGgPtFU4NtZaij30iriYouA0H1bRKnFdas5heB/YZJSny0ryzNjb2dbKKQGPQhvjTZoD7YflFTuzcmaJQNzaO0z4Ujur1xCtgXoUPfj37ZdoiN2cPyVRbKF2FBXPF6M/D4cptIiEZyuEbHaz/8gS6yAlB0Aoh58IhNQg39GKS0jPJ7TlrasN6t6LMDEFtVDJIOGeS2w7eUMJEs=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR06MB353;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR06MB353;
	31:3w8V6xmevP7xq4oLcfp0eGi5Oya/yBu/O9GKag3rA4GClewE5OVBb/dITrEZhCHrYLUVYV7SV3BXyVIGoIIHN+44TW88cCCkbQjFRF7b62HqiqqtL5mxS+VU5m0/jPQseJIvA4hmtlD0/DpbkTVlUyLxUwoAZL2GmZwGrW/zcdoOzBVOsnusNiI7tJG1aqI74K4Mf6TySHU29myOoHM5XNiIOBW8fyF0xIKPQ7zu3uY=;
	20:mQIiqtC1BTHdNrk0ce4/oQxsd2H4aZrrqeanJN7m5QPE/3AD+3A4Uhpwwi63/yoTwNV40+5E7XfI2Rz+iVIczoLshfglT9KyCTjzIVABMLmqFVc31RaTV7hQYXZVHMOhuMWpV7t1im34AIpOsQnQH9vnM0CqMDyoXIHD9292V8cNz5ybZNC60k7DTdR6zezTG8csmzuwlkqi3r9umEgap739E+SFcfup06ragQgAZroCTnur8BGL/Qnuw/qckEkqQYIjHOjNnNFS+qfJGxYcPlxiR+J5iko6ohQZJrt7dphvgy9tVhoBUKI6GXRvkLnAf6IUkSO9K8NUiT3TVExEZA==
X-Microsoft-Antispam-PRVS: <AM3PR06MB353767C529CEA660481A7E0FBC80@AM3PR06MB353.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6042046)(6043046);
	SRVR:AM3PR06MB353; BCL:0; PCL:0; RULEID:; SRVR:AM3PR06MB353; 
X-Microsoft-Exchange-Diagnostics: 1; AM3PR06MB353;
	4:PaaTJUbbbNLpZXIsnm0IQDp8r7D1imBG6/24Z/+A7R1cpCSDszdupsnmkLwfiBr37rQ4+TS2haEvdaGyp0kkBSjPXI//BbLdJfI4f9WKIydOHFQJP/XRHb3SccEUsJsAfL8rNFDvbj6Qi7S4XWBFEad86GKIfceN3ucLKqeY+r4jDP6XqHTBMOrq3Rg/v3fAcYV+sHnwziy2c/FE3CdfXWvZkAdQjGb0f8kUqU0/0e578dBE+uqFu1Oa2cq+o7t9m14GALrz86hbAmqk0Ew8VguXLV+btFiGKcDbNHGzdBCjFsv4RcuP5Vil0YXrr1L/FdNKxYc8qO4e4Ln7Jw7ofmkbDMy5JeRCTFDeL0pOdANaFREemvoYxU0RB05E6mZ6aNjZZoqn1SHbZQXEO+V32wpZphTF6EaFUltBb2HDOiSniqToFxjEK6zmXhpg76GVknDntqfDjuI2/kxrglPVXw==
X-Forefront-PRVS: 0074BBE012
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(7916002)(189002)(199003)(575784001)(107886002)(50986999)(189998001)(101416001)(106356001)(86362001)(4001430100002)(97736004)(33646002)(36756003)(6916009)(15975445007)(5003940100001)(48376002)(105586002)(50466002)(81166006)(586003)(3846002)(305945005)(450100001)(6116002)(75402003)(4326007)(7846002)(42186005)(2906002)(92566002)(81156014)(50226002)(7736002)(66066001)(229853001)(74482002)(47776003)(5660300001)(8676002)(2351001)(19580395003)(110136003)(68736007)(19580405001)(142923001)(4720700001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR06MB353;
	H:romanpc.dev.rtsoft.ru; FPR:; SPF:None; PTR:InfoNoRecords; MX:1;
	A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: rtsoft.de does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM3PR06MB353;
	23:l53MNjNujES2R7lyXiHbXu2jml5maNpRJ8KsscEiD2?=
	=?us-ascii?Q?1FnWltPN711iBjDt7xR/6RWf0mXcBK9e6xQrWPMhs8JwXppcKebWAkDDAk7F?=
	=?us-ascii?Q?xinT3fnm3KcqcX8KY2xZUyQrTQuvZqGoiscyurDZi3ki5RWSigaoTHqukO6i?=
	=?us-ascii?Q?lND0rwNIaFt1IUUUDdl2ZOiEX3ieAhwqw1dQZslA0syd2UfLAqRVEFWf6TGN?=
	=?us-ascii?Q?PtgA9M+LSAQEGu3LFYP61EbQktGBKbculre3OfR8jl7Ce9lJ0ph+NZZSDQV3?=
	=?us-ascii?Q?vtM/WTjQuw6hbkH6UI5uiE4tkePEgR/+bUgBhBQkqYLhawFYgQ6UXkZwsPb7?=
	=?us-ascii?Q?6h5UGSRAqynttzui9+a3ieGkmT/HIiP5eWbXvyYRGYLh+9UjssuwubKNQh7p?=
	=?us-ascii?Q?W8oD85W/+F9yWCkDhQqkJmCsVSzIqo/3spWcEkAv4CFcxxlZvT0FT2vRpvuX?=
	=?us-ascii?Q?26kCJ+vGYQIfQM89PNngLaZ++qvZQf/WhxTG+QVGx1tG7ebDMVqOls6Kis1+?=
	=?us-ascii?Q?E8FnAzuzNJqedJjApLu5LXLs22/YYd/92aGlLKvHDh51k4VWbevgOn9m6t1j?=
	=?us-ascii?Q?yQ2juRJGTg5B/2jzY4Le5DOzTBmLepdI+M9Iq3v+S/bLs8+yUAHaNh9D6xAM?=
	=?us-ascii?Q?+hLFowXmly+H79QnSBIUlQNkGQB8AdKya7U4YTwd+P1ZhZkJ2n/j/qfNTphG?=
	=?us-ascii?Q?/E4P0hj+52qNk8q7NFN6tYK+2iYB5nqqQJIRy5wVdu4YIImD2KAcbNlm6uEE?=
	=?us-ascii?Q?06fOlihqrLGYDBYV99DdyOQwgK9rI67SxYiJAPzY4VrLT1CqVxNsvq83xjTk?=
	=?us-ascii?Q?tvul4Ox3uY4LWyZHiHVdMsHtnLKvH/4yCGvRZUh3Peg8qd4cjHlBik4ampyN?=
	=?us-ascii?Q?Z7QkoQxk+SI9r0wOumbJUq8444OdtSEhUJEfROtWi/I6S8NAQRnSi+79FD+c?=
	=?us-ascii?Q?HIydK74moMRAPDUtKvBgoGl1Cx6E9Nebi6iK4Nn5b8lE4nyyBjcIJP1Kl5g+?=
	=?us-ascii?Q?p1rrzeVIUHbblkmU7PbX/KTIhKBq/C+o+D32GDGwOsrm65a4qKu7GcaK+R9f?=
	=?us-ascii?Q?3CvyEwo/tjYT/tBNqJ3KTD9j4yU4UGlAY1Dz+i1O9jLyMtn6ZgonPPwTFAXz?=
	=?us-ascii?Q?4B2M+y8owH2oUvbczzzCR5Y6vN1puJUoj3zu0KKR1YMnrPbLGA1RZghPAX/k?=
	=?us-ascii?Q?+Q2aropi3ursIc01komxPKmT8wLyI9bQKuGfuX74YvD4hBwGSDkHijph6tFe?=
	=?us-ascii?Q?PUccEbq+BQG+bUL3xHPOyPF64hrpFs5EM1OHGD?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR06MB353;
	6:dTtNrgQRokFIdhS2rLqwQUoM8wiSWUXbEBNoSi9gn0M/sXAI7XOy0A9MFN9gIT6dczshx1vMRLOeOJ1tBSMduq0/yNSfuQOLcHvPTgf5ZSUCSBYRYPhCr3e2GNFmCMq7Rm/7Tv+6PWTJu8T+K2ChCkBAmE6Ni9fgAxHFu4TXzPxLKy+NLloRhP0iFBnOS5H/fEalys0g7W3LPHql1eKooA4Cb8U0QncB/T6vYm+2oFH/Brh/hm5ZkU+5bCp2aqqFkPN/z7ZBUdXkmd7mbNZO/YH9sEtINAbuvYDUTkXlhPogbi33Sh3Nc/B5q4lnWZFO;
	5:47q1Vx2EuqFe7sB0R32DltBC/pJ9r/EKeiAPWxDRRlODmkJyufcVpB1q/3UKoULvPsStYId+twAvac1pinkjl6Gu5A1LIg8XMC6uiN6F1yWgpU7vAJO1W6DWnytM6w5K6uyoxSFOQBjc0CDhnBdiTw==;
	24:9TSUGAqpAIF7bEzDYm2flzXtSMQbxs3x6yDvFcG+MhVMv1B0cMdVQTT523M64JlI2pLtfDwiR/V7xvAjWeEUcMj0H5WVn8X7t9PjaF/1hqg=;
	7:ORpFn/znWZmoUqcFjnQGxzYDVu4mi99hbfqloTcNy9nBBWOQ+FH1SJx3P2IAyDSRWk2IXTb45eIJ33ruWyI/o8v2m9pR2NzxDzZpSEiXl9FBCOLzxE9ioTZ0lTLGKqsYzmtyFSjcrKXn+E4ocovpuJRhKaUd1LHa5XY0jzPxryZoe5elaWnapZfMoqzx6dQSZJWdLR3jeLHVYGSnbd6u87fHEFM7U24JzX03RBR1jLu70GaznFBcSiC0xk8608KmKPPC1+e+cm6Bi7pP/PAd2gyE8Mz+BB2nBIhLV2743SGOFaWLH6paWPFdl/pkjBLf
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: rtsoft.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2016 16:08:12.2242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR06MB353
Subject: [meta-networking][PATCH] mbedtls: separate general .inc and version-specific recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 24 Sep 2016 01:39:59 -0000
Content-Type: text/plain

The patch proposes to separate general part of mbedtls recipe into .inc
and introduces mbedtls_1.3.10.bb that requires mbedtls.inc. This will
help to add another versions without duplication of general stuff

Signed-off-by: Roman Alyautdin <roman.alyautdin@rtsoft.de>
---
 .../recipes-connectivity/mbedtls/mbedtls.inc       |   35 ++++++++++++++++++++
 .../recipes-connectivity/mbedtls/mbedtls_1.3.10.bb |   35 +-------------------
 2 files changed, 36 insertions(+), 34 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls.inc

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls.inc b/meta-networking/recipes-connectivity/mbedtls/mbedtls.inc
new file mode 100644
index 0000000..8bb6855
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls.inc
@@ -0,0 +1,35 @@
+SUMMARY = "Lightweight crypto and SSL/TLS library"
+DESCRIPTION = "mbedtls is a lean open source crypto library          \
+for providing SSL and TLS support in your programs. It offers        \
+an intuitive API and documented header files, so you can actually    \
+understand what the code does. It features:                          \
+                                                                     \
+ - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,  \
+   Camellia and XTEA                                                 \
+ - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5            \
+ - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG   \
+ - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \
+   ECDSA and ECDH                                                    \
+ - SSL v3 and TLS 1.0, 1.1 and 1.2                                   \
+ - Abstraction layers for ciphers, hashes, public key operations,    \
+   platform abstraction and threading                                \
+"
+
+HOMEPAGE = "https://polarssl.org"
+BUGTRACKER = "https://github.com/polarssl/polarssl/issues"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
+
+SECTION = "libdevel"
+
+SRC_URI = "https://tls.mbed.org/download/mbedtls-${PV}-gpl.tgz"
+
+
+DEPENDS = "openssl"
+RDEPENDS_${PN} += "libcrypto"
+PROVIDES += "polarssl"
+RPROVIDES_${PN} = "polarssl"
+EXTRA_OECMAKE = "-DUSE_SHARED_POLARSSL_LIBRARY=on -DLIB_INSTALL_DIR=${baselib}"
+
+inherit cmake
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.10.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.10.bb
index d5c7afe..3f1c1fe 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.10.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.10.bb
@@ -1,37 +1,4 @@
-SUMMARY = "Lightweight crypto and SSL/TLS library"
-DESCRIPTION = "mbedtls is a lean open source crypto library          \
-for providing SSL and TLS support in your programs. It offers        \
-an intuitive API and documented header files, so you can actually    \
-understand what the code does. It features:                          \
-                                                                     \
- - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,  \
-   Camellia and XTEA                                                 \
- - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5            \
- - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG   \
- - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \
-   ECDSA and ECDH                                                    \
- - SSL v3 and TLS 1.0, 1.1 and 1.2                                   \
- - Abstraction layers for ciphers, hashes, public key operations,    \
-   platform abstraction and threading                                \
-"
-
-HOMEPAGE = "https://polarssl.org"
-BUGTRACKER = "https://github.com/polarssl/polarssl/issues"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
-
-SECTION = "libdevel"
-
-SRC_URI = "https://tls.mbed.org/download/mbedtls-${PV}-gpl.tgz"
+require mbedtls.inc
 
 SRC_URI[md5sum] = "19ebbc96feceb430ad958dfe89cb633f"
 SRC_URI[sha256sum] = "746fd88e0c6623691fc56c4eed52e40a57b2da0ac80f6dd8995094aa6adb407e"
-
-DEPENDS = "openssl"
-RDEPENDS_${PN} += "libcrypto"
-PROVIDES += "polarssl"
-RPROVIDES_${PN} = "polarssl"
-EXTRA_OECMAKE = "-DUSE_SHARED_POLARSSL_LIBRARY=on -DLIB_INSTALL_DIR=${baselib}"
-
-inherit cmake
-- 
1.7.9.5


