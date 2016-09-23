Return-Path: <roman.alyautdin@rtsoft.de>
X-Greylist: delayed 22242 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 Sep 2016 22:18:09 UTC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01on0104.outbound.protection.outlook.com [104.47.1.104])
	by mail.openembedded.org (Postfix) with ESMTP id 5098D60403
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2016 22:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=5031003890.onmicrosoft.com; s=selector1-rtsoft-de;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Nh71eDhUGN/dU46/l2vAerqK8tLXr6x7gT5u55YzBZo=;
	b=m0eyWYdSOiTtusgVGzI+DLkDvQu+sEDHtRKmqv1QVyuzupaSPYmB5StTx1ZXHziPL27mQYKqMkE9ffB6sdgJKd66VQTAJR7dNCeJYCwqBYYBtdIrvaXJvjSt1WuDk4pufUXjMJG1Udm0q1etFe8VKNslZ2Gj1dHa4u2uS1P8IGo=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=roman.alyautdin@rtsoft.de; 
Received: from romanpc.dev.rtsoft.ru (213.79.90.226) by
	AM3PR06MB353.eurprd06.prod.outlook.com (2a01:111:e400:881c::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.629.8;
	Fri, 23 Sep 2016 16:46:22 +0000
From: Roman Alyautdin <roman.alyautdin@rtsoft.de>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Sep 2016 19:46:04 +0300
Message-ID: <1474649164-7513-1-git-send-email-roman.alyautdin@rtsoft.de>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [213.79.90.226]
X-ClientProxiedBy: VI1PR06CA0035.eurprd06.prod.outlook.com
	(2a01:111:e400:587c::45) To AM3PR06MB353.eurprd06.prod.outlook.com
	(2a01:111:e400:881c::14)
X-MS-Office365-Filtering-Correlation-Id: 278ffe45-c783-4422-d4c4-08d3e3d1271d
X-Microsoft-Exchange-Diagnostics: 1; AM3PR06MB353;
	2:DAbrDY5d3G8jKXsNw+yoHLlhgfc9NZDWfHww/4uNDGzRtMJuP0T/b8PxWArzqn2Fn3JVZf2MYA1/2fc6CmcQVbQWKGEiMhR26+nt1NOAK6a6hagcenudME5SOHQ+iagKfuoKkSC8cn6hJ7RGeiPTviK3OKakWe3W4Qwr1YgAd8WibloDrjhYpCNfdLPZ0YEp;
	3:tOjAkOKemL1FClNocuUI4K33Qkh6DO4QWnfpV2pa2DwMx1JSiDpsgPnh6W11k8z4nIp3TKXeup5uZtB7RFkANI3sDZlCPO4zwmBc6XaVHziKIypCrG8uCWD+SIVeBlVL;
	25:9bagN3gFHxKR3vK8m2siQGOkeUNEaC6i2kqHUC5SMGBPGO+QVaFa5Rjyca1ZihEkzkbG6aCeSPNmZIcsb0TwVgeEQDnkFVOQAwcCY1qWFdjlEYk4e5kCp4p1OgB8vqQ67kFpcl0ka0Y5Uh317R1S+JyzmDQikg+Dxpy9sPWSWczAJAW+gXeWRFP72jb4jl8wPKGFYE7mnTJapmCd4hdtrkwXXAGp+lCkl0ztqnSz1jK0lBzI3ELOe39btBNeSNGdO1RYmfFLXoGUA7bSZ+wzpUtQv3mYNApS4K6VXRUnJhINEJm0NuIojWdTmkdSPGQ1TiYXVMhfCpsU1VyQXaUtPK5InQZhyK8tPe02jpcJXqFb5+tPiTaKOvfI3QonyhJaj/XoiwldAwskAeVUVxeMD8VDE0PBeGjVZ02KN9YU6do=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR06MB353;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR06MB353;
	31:kDNeVBB+qPwfSPM4jR0AcHTnXfNVe4B4l5G0AIfSJT0GwH3bLd/lAYzz6gC3c2S84hRuMdHp/qMwweNl8tYpnqb9dx9zPn9wYfUv+3XGsJE0zvvf8PKcqdXniv+BxQVzLrCbxraBCzkY77BZoKFs+/8BVjOgry3XVaA6mJnhlQkSODWjEn/nqRheFooF9zi+L60SFzWJAGCRUcuhtRelLRBS1naKebA9DDLIZWFe86A=;
	20:TvhF4j8j44ZzELi8T/G6Xrp4thwjtAPxaR3qlBmK6We4rd3G2ltxD3mNBP4mKx0Au1NGgjOYsQn6UNc+d6Ixp0JTmPv/Jm0b2VUEkvx80c23599cvUxSDV/d/EH+zOU7j9300nRjhZQZKDR/ouIlBvhM97noqvg4JnSru7uKHosvGaqpWMfCTmZy23CV6lvuyKAVtV0/dK/CAE9XiXLIUQod24aQ1anB+1w+hxp2K3g4IDwATh/UAKlbDi00n+t4cIFU7P1q4oR+jS7PwtuaCPl99phJCWan+oY9ddbAfS+s71VCqOkARftWpCiVhzxa7yt3GYQiaoZ+j1lWVobW3Q==
X-Microsoft-Antispam-PRVS: <AM3PR06MB353EC03FFE4BC09358582AEFBC80@AM3PR06MB353.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6042046)(6043046);
	SRVR:AM3PR06MB353; BCL:0; PCL:0; RULEID:; SRVR:AM3PR06MB353; 
X-Microsoft-Exchange-Diagnostics: 1; AM3PR06MB353;
	4:X7nqZm9gDM0Z/7XmASvdkl1xmLmsgMlSgKOP2Br/E93g2rvcUuBiUJnmGa8SaODj6oP2KoUrRAd9Yjie5gNsaE/LEVFZz3wPkbZU5RszDC+PlGkmWlM6AyvcBvNybW5vSssK2dO3oyn8H8nOWBwzSmGLl7+a7ZKJ1b7Edm+c/Ae5QTaWW5RB446DTNk0nhkOLdJIk5nm2MKN/Hvi4hVDT3lldzQu2H41ayULDMQ9+v7ZEoe5lXgbSXRa7eVEVoLXDzjlIOSzMGcjcPeDn1I8eC0d9ObFr3HNXPz7oJYDc1kerA6En/5B/N1k6BxvQfl/px8rgai7TB0kDw0qelT2w5HemkNPUrTBCZGggVSjdbbE/H0AVc3teSQXwRUbgZbYC3KOaztQWc0OM1XEJ6RHkLGjPlJMNnEPlZXsQTlIb1fttBCKc+Q0TCjhgOHf6yZTAARGcTQZ7aRLfkmUwbiq2b/VSra++Zku9yDyyKpzd+M=
X-Forefront-PRVS: 0074BBE012
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(7916002)(199003)(189002)(42186005)(7846002)(92566002)(3846002)(2906002)(305945005)(81166006)(586003)(75402003)(6116002)(4326007)(450100001)(110136003)(68736007)(19580405001)(66066001)(81156014)(50226002)(7736002)(19580395003)(229853001)(2351001)(8676002)(74482002)(47776003)(5660300001)(106356001)(101416001)(86362001)(4001430100002)(107886002)(189998001)(50986999)(575784001)(5003940100001)(105586002)(50466002)(48376002)(33646002)(97736004)(36756003)(15975445007)(6916009)(142923001)(4720700001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR06MB353;
	H:romanpc.dev.rtsoft.ru; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: rtsoft.de does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM3PR06MB353;
	23:3e+r8Rg3C1+uUoJErKpt3LM5dvvtSnpPfSQyRya/5N?=
	=?us-ascii?Q?CTa7USb9imu6VC5YghE+1iXkq298MpCLgZQ1dQIFl1G/XGRSIexq36+g0NEA?=
	=?us-ascii?Q?1VG3Grse2N65QNSMfsZINmEsjb0Yeqy48uyhXMhCgKIqysWr7O566RGsOnjV?=
	=?us-ascii?Q?JOnjN1V5zOSn4lRngDIhItXDu/StEsr/qQImpJu/fjiWF0zjDIN96uLGvtSH?=
	=?us-ascii?Q?9pjMbuMNVIOJqXxkRWeITA/3f8SFGqTXSyqYm2g84+lmIJJU9iGfsmof61hl?=
	=?us-ascii?Q?Nl5uxwgYwFosUFMJnS+ykDnN60kEg1BxRggMt5KL6R3A+1OWkhOt+Im8LWRB?=
	=?us-ascii?Q?O4vkxYCbQ/QlutRw9jU9jJj8Gx7Cua41ou5tpEiAawJyqO9g7mfaN/5mdMXE?=
	=?us-ascii?Q?Durrry7/L5lMQS81YCRfYCAymB6I0iqHRDProxbJrtzGjZQRJiE7+CyXF5XD?=
	=?us-ascii?Q?DRSxcNDNyijsWmC1T+5ca7TYN2PQ6BiEniZ1wjkmwM4DZQuX/1NP3xnkcR3D?=
	=?us-ascii?Q?9f8CYUffPWdcdolbFw2Pup/UHc36sUnYAFLtyi3phkAXZP4zcH/mznmDtiyW?=
	=?us-ascii?Q?EB7JR6skEgPSKkRzQkHLtXy+uYgtjFpFFXD3qSMNTa+BdDd8OAFq/ytFlnna?=
	=?us-ascii?Q?ilPLuwjn189iO4J4/UdKJ4ghZ0JtNEGM26NHrUwv+BWs1lgsTEMEFoe91a/d?=
	=?us-ascii?Q?24D+5T2Xb6hoG87r1AcF1G993tP6JdGeGa97qAo9Id/ZahtIZDwdq29l9N0m?=
	=?us-ascii?Q?D9z1O8OlJ2RBv3G+4Lx49aK4i7GiAcx7c+7GWPaSzUtgJGIdAg+s4MhuFrby?=
	=?us-ascii?Q?s5sTCdAmOUVSQEbSR3K8AwLPnxYzPvePiHVVx5UEkK5gRBkqgMNxQuYjrnTE?=
	=?us-ascii?Q?qPC+JpcepsRdGB98rOnps6KKsDiPZHX9mejtLZkpPKNq6zy8ZXlv0JexNjIO?=
	=?us-ascii?Q?rvxMwfp52xavIkGCp2pyOSsTHUvJEYapsV48uNMAoLZM+bAr6Lr6yWkKlpyM?=
	=?us-ascii?Q?13H+IM+BpuxPmQX47swRz8zGm/E71uQ+9RZj5SPgCHLGYycuK20Kku7R0oja?=
	=?us-ascii?Q?yAI6QS4isTJMAQe1l+80OlXqgBfnAK23FPLAb7u7L3AcF9SSI0BrYxHC1M3a?=
	=?us-ascii?Q?Om0eQkdZWO/hRGQHsFkR8D4znR7Q9yUDUxTgdicF4g33i/LI4rD+CPd9ja22?=
	=?us-ascii?Q?R3zIkWVl44z43zlSFS7VXBFultdL9XL4OH89jp5MWsV8HnJQywuPCw1Cnsfk?=
	=?us-ascii?Q?iHG45mS7F6/wFQAyslx4fIo7qx0VOINVd2AqL2?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR06MB353;
	6:TqCvsSnk31bOcvcSWAP7n+KeQlQovKuzDcDZiVstQoNSMZzdYLG6o6PbgC+NWs4BsWMPl8ko7jdF4xpiYKcXnjkJXUjQFRFhy2egnI1YoJcb2zd+hccJEWdWVs2ZJ1qiugNe1ii4Y09EON11ShJ8xaVrMk/kf79qjoWTt1MyhLUoM0ZwbZf8VlqB3YV2aEQ1yaBCjOAZJ1KFRJaouMzuPNj8EI9SX1x4JcAF0Ex1GHbN1u06FgZAyKXBYzpFm5CLn6OnnGhhYFgnKt/ii3cNdwhcBPx4kLOLekFqJOAM9LkQo/52Hq2Iec34i8SJfDkI;
	5:obl+oFBUYyOv/adiT278kLwgtu5yl5ec0UVrhbuEFInha9ZsaUxGN50DxbvguFy0jnG8ZzL/2Snytk+2gcjSp2BRafk8DBNOgynTwXt96jwDLKN0zgDr+Db+hv5nbGpSkfl10w4Y0QBD1IQNkNiGmQ==;
	24:xhyE+7rOZTV2Kb8xuRkNS0Ownji1pv0HtXY4MzqNS4oPr+QUX/On8XM3hreJ1W0qgs+9AdBzI9dKWdzh3JZWUdry7QgL5jmUS4AiV3LM8kg=;
	7:CUpDTmKhjSz6CiPkzD89n9fWYKU7taciF/gyoEri0BzpeHtqy32AWv82yhLxbbKY0HeKqX1FcszVNfS6QFCObZ+fY+4zyKq73CFyjc2s1IQ/QWv/7lQy8zfyAPbWJOkgIm9VpnqmuHoPvw1uOHdDRtealnOyekssCtOMXmjN+EtuSQaxPRYy2JtXPhnn0Yft6Y5r2BzdMYv4G7Z70gngiyJIvtXMY2pwClK0TvH01c15+nwthi2Xk2UCA3D9mb9FZQkZVV5F02ZTjnQbu1OKa7s00+K15tEdZHO/jrMusikN8ekHcfY5amS0/XYnJ7FK
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: rtsoft.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2016 16:46:22.9855 (UTC)
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
X-List-Received-Date: Fri, 23 Sep 2016 22:18:13 -0000
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


