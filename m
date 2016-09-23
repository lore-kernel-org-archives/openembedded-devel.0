Return-Path: <roman.alyautdin@rtsoft.de>
X-Greylist: delayed 22075 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 24 Sep 2016 00:26:38 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0106.outbound.protection.outlook.com [104.47.2.106])
	by mail.openembedded.org (Postfix) with ESMTP id 60E2960268
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Sep 2016 00:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=5031003890.onmicrosoft.com; s=selector1-rtsoft-de;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Nh71eDhUGN/dU46/l2vAerqK8tLXr6x7gT5u55YzBZo=;
	b=iRNAt5m2aZdWwJLaAtUmdCZRXIa1qiC92iqYmvYqRp7qD3COTpzQDZQWjhYjQcgjhyCMb9Fjv+7OIh55egHYFWq4t4cMSrwFH3OlT2XK3drXZhAUM+1ATJFUSctiLLuAzhsGvxlTggdSIXYrw4grZp/WEAMDJy/r74iCqIDKIHA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=roman.alyautdin@rtsoft.de; 
Received: from romanpc.dev.rtsoft.ru (213.79.90.226) by
	DBXPR06MB365.eurprd06.prod.outlook.com (10.141.13.12) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.639.5; Fri, 23 Sep 2016 15:52:10 +0000
From: Roman Alyautdin <roman.alyautdin@rtsoft.de>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Sep 2016 18:51:50 +0300
Message-ID: <1474645910-6778-1-git-send-email-roman.alyautdin@rtsoft.de>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [213.79.90.226]
X-ClientProxiedBy: AM5PR0601CA0034.eurprd06.prod.outlook.com (10.173.86.148)
	To DBXPR06MB365.eurprd06.prod.outlook.com (10.141.13.12)
X-MS-Office365-Filtering-Correlation-Id: 8b500675-3552-4deb-a9b4-08d3e3c99428
X-Microsoft-Exchange-Diagnostics: 1; DBXPR06MB365;
	2:/kR6dfqlVbdxo+naV/a9wbdI8W7YaKImHr+IryiDUbgBn/Wd8I5UXhwmjZNXvnwkH5oleOEIYAey8X+xjqT9aKuXc4btusSUxLBg2D2IbRE65y0HfvurCYB53D4vm1JD0Z2yPOP4Q/0CsEoxDGIkbxrICC+0JVolh3fT+l96xC0R6jM1GYd6E8jM2VBoeZoP;
	3:7rL9772o7Kb71Tuij7ee7tRMa81CXZr1huMUNY+yD2OQWq71fdWM1u2j+YM/38SxU7rHJYiMVhx6c+r1lvMMK4PHfv1fjsR0sj7c2+Gk+1JQ2SUN1NwCzSs7sd7PIFdj;
	25:iWVXBSWATGZrUsK6jaDYNtY8NlfA0ck+GsBZrsBKVIkq5njhaHjjWSsXbCDHumLzl0EUfcomj5Citq0INZP2YxiKA3LzWei80ATKJd6OrrguqOa8Y8CTD+mD5/RowsAu4cAeMBh0bsjhGL3Xzq6CK4zhxFQcHfNhmUSSAKWtVCRRagCXs5Aj44kcMKARzxRxhSSkNZt43WEHv7ZimLi9/40EfVpvoJio7cDU/D1AlqERD6C3w/92TnrMD+LHmTeZ9OnfIdIMGqOSd56dkk4HGNQ2hmM3stStCuDqK8IMB8ovz2D94Osgwo/QF8i+MhAVfvRIY4liSNd0HIgtYL4H0yf/Qk+VPBSXMoINpTh5BB5kEsCiPO3d9szh7UNNgKYtdPzZj5GXAS1/yE0LtD0dM8ggPCFeNxtrIiLEya7V1zM=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DBXPR06MB365;
X-Microsoft-Exchange-Diagnostics: 1; DBXPR06MB365;
	31:OeG8y+J1QZ+KHCnOhNnvNaym5PnAleyEQllAMA2azHdeFl2cRVRqYUmLm+rRJ+kV8UN2uVrF9KnCNCmr9Gl5T0Dl6jkpaKugaqDQG/DVqgrA15+XAoFnljyYyxVb64wBkgMZsAlHStaCDapjJvdkPItKVfveKcg63SXqsswYsgxUq8AQr9IaAqDDK1wcUfzM4MQG9FAUt174aBIMoic77Vgt9UtufdNTDtcVKNx0F1g=;
	20:o1eqVnOUCtUvcYek0grVLLtmtbk61PrlM/a2MA9/9YSfPtSS+L+JXaRLRrSLXQtTe7yqEdNAqVojDvGKxbgZ/3UGGeuzojVJG9h663XCZi9e65Bk4wKzW8ihHDb58uQ3oAPpPTGzp11pNOVv6Vq+MGK9g8kwzsIFCDRGWYmFrLJvXb34OeGWfR+LIs42kK+zfvZ+/vUjRO+j/mluoiwB6ZhpK5cogyroyghFIpNM6WsS3aQ02RFSYsvoJ5fXicgxE5L/ER4TS4eu+/HWIi3wfhGwDatfvY/edpksWzzP283gjJAvWihIA86kAlpsx5vJVvgiR+BJSsOTv5z0ZT3KOg==
X-Microsoft-Antispam-PRVS: <DBXPR06MB36529E742FACCE46E7187C0FBC80@DBXPR06MB365.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6042046)(6043046);
	SRVR:DBXPR06MB365; BCL:0; PCL:0; RULEID:; SRVR:DBXPR06MB365; 
X-Microsoft-Exchange-Diagnostics: 1; DBXPR06MB365;
	4:hA38Omys5ltnLQ4FzjrxRe5msRbdKQjAVIxnxdhP486jeYASpxn1gVJ0cFx0WoPwAtjOZ0j+IfNrK5Q2kZxAQ0aFFGaknqERek+OD86iSmwDEhBqea9FOehZAemR/l7XAGXFSjyqzoKDFpZiYTmJhL9bbd1pSYJ73hE5wFec2L6O89J1g+vC6HoLTMvfOqac/NTCOavUCQNeZzSnzqB5ybu1Bp/AsfmERA73IeOBVlrh2WX5ANOB1Lrbc4xIEuffi5bDk6ztNATUT0X/4n0N6B+S0PEFqfTgaQIrxZMrswre/kXmXGKqOP783ybbcqHfA6sewkFkJ1OeakXflkGSG45l2EQHmt3wTVUEt4fjj8B6Ql5mvObxGdvR46fh7H7wTftH2fctfGDTzEUvanj055M+SWz+rD+Nx5altyvs5NC9inoem9ZfFbOck4e5Yp3lJP91YKW1LvXKAkgYCv4qsw==
X-Forefront-PRVS: 0074BBE012
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(7916002)(189002)(199003)(7736002)(48376002)(2351001)(5660300001)(47776003)(5003940100001)(15975445007)(305945005)(68736007)(450100001)(110136003)(36756003)(77096005)(81156014)(81166006)(50466002)(189998001)(6116002)(7846002)(3846002)(8676002)(92566002)(575784001)(86362001)(66066001)(107886002)(106356001)(101416001)(33646002)(229853001)(105586002)(586003)(50226002)(2906002)(74482002)(4001430100002)(19580395003)(19580405001)(4326007)(42186005)(50986999)(97736004)(75402003)(6916009)(142923001)(4720700001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DBXPR06MB365;
	H:romanpc.dev.rtsoft.ru; FPR:; SPF:None; PTR:InfoNoRecords; MX:1;
	A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: rtsoft.de does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DBXPR06MB365;
	23:4A1rfosPNtuzELtkFoVNpX2Iu3R1QNgU/hWSLZtUKl?=
	=?us-ascii?Q?1RNPrmS16NiLH/YRLwPNplRyuUnWa1A/xa2nFs7uXcIFBo8T8ThykApezezw?=
	=?us-ascii?Q?fAHLvqn6HlDQYajb/XcurWqaR4TEs9zoyVe3oUHqV+cVEz+RHmCHyaaLVvwb?=
	=?us-ascii?Q?IFTB1Ew0A/zKrxMWMXmS5EIU1AVzjlUHpBbR+b7JDSnKGji3Xfn80ONm0KFa?=
	=?us-ascii?Q?GgpWYpBznJMIG7GNjWQW1wDioCpOJ1z7CgOnKSOHBn4qitvjfxeBWjZFoAcb?=
	=?us-ascii?Q?kC8qCh0tARa1V/kolSCE2RCd9geXa5UG2cOvMPgjEi8ky2NXHYHkqIcNC2mm?=
	=?us-ascii?Q?MGmTd8BYDo5/aApHPJAqPaLNdigGWcv4GGt45C9jDRC9IQ2/vG+kJQwK25lB?=
	=?us-ascii?Q?R+yzdV2YGf1Ms7YF0WECU9kecm1imOe+yWTmfBQ+//xmPCAZS7ml8AMg+v9D?=
	=?us-ascii?Q?oyIn1ndOtrMZjYTHJ9tFLpDkxsRA/0xZowlKW80c5od/H4XY2oJmwEv1dn06?=
	=?us-ascii?Q?Iz6xUacx/QNvyCvQWjpWh8kgx07MPyVzh2gaFlFfe9cFqQiyzqJAyH0lKrjG?=
	=?us-ascii?Q?y1w9/XvpJLD0tiZlG1OByHrykLqbnnuMKoJZTm4L6oVgJx5Tv2Rka8WjHX8A?=
	=?us-ascii?Q?4s4azBfSagDiow1xG1cleEFMyoB6gxWP5VppMX89JcHo6+KcAmaZYPNbcYvf?=
	=?us-ascii?Q?1UG/JubHNy2+K4m4WxUGuSN0ej+/jWHdMM6psFlSPvc8Ww70vQ2chffn2CRr?=
	=?us-ascii?Q?avxQn9/W7A8cKQWAVgdelt7K6Ol3kq602/dHZct+SImuG2eXhxnnjl5nMMVN?=
	=?us-ascii?Q?kYz6FIldmEvExa4SgErb3GZrf1SDZlCBKqei/+wScLPsNuSsUKww4bEL9tQT?=
	=?us-ascii?Q?mOZwTwjfIKJ00WZMfsPujwrWRtWV9eHAxw3/Mw1Cpjtslzo94KBg7zkBwwFT?=
	=?us-ascii?Q?C9zzxfINhx40TzA6n81lfjBANbI6gpjPixj/YsvtU910CuO+sAc24Z6i3M0I?=
	=?us-ascii?Q?84wsakby6T+hzDR4KIuIumdRKiwY/jZVKEs/lsNwOXaTENMOYj6t5GUhN+Ud?=
	=?us-ascii?Q?A5bJf2ibc3s/QC/wgtyAJJHlOL3o1N3n+0oLmDbsv5CoQ+jH8krQok+mRFmI?=
	=?us-ascii?Q?Q+TjMHrS929jvdIFx0Dy2x4xmbEaaE8nOH54X7E3+w3yoYlpQmC/ZRp67qkO?=
	=?us-ascii?Q?q20T6U09XCzXb6rPMBV2O55MOAUm/ETVeoNJGe4AvNJ1bzuH0wPkLixWjbPA?=
	=?us-ascii?Q?lAt/Sd+3dogMo4mk68FCabKa4xaug0IlDYfWyALNUpfGWjztrFdv88MnV5fw?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DBXPR06MB365;
	6:ouj1+DkEJO/mYRXwcIxANwrPSuntO5kSwfrbiU0tjFHfDTp1U+K1UH4zW18i9troofmqjzfLXoei8nQLsQiYPPtudc9C+dQcLBCOXpQtEHN8cn59jB5ZY2fRC2BD1z8/LvHqQvGs6dfwQXjafT3N3Av/pA62BI1DmQEXNQ8YIlyVfByIi8fJTE6wecnbdnncaGcV9D55uXOHb+6y/W/8VRVjATkKn9ee2lvjYvx0VwEme6U5YvbhSXYE0I5jkt7kTxZ5s+o4iS9+xP+3p3TAkCfpqZWgTe0cINEKvvdWgfvj318UcYjzg+QM71gJO6eS;
	5:fm7GOP4yKIVQ0bzz0tUNSyjEgyXticgynPba06bpa3X4d5/lHcPBzK+LUm4UkEmFfeTrvtWxbehrL7Lc4va7QZHN12cwCXMqiJMug1RaPYTRP9DHBXnWCZ+vGUFFrsiCjOsNK5VFvQZKOhJYeXPY/w==;
	24:fiSuzD58YQnF98XRj+Yb4gFMNbXCCTviZZ8lcUjE0RRbWqMoAGqjlbsay8ekuxZGSjDthCW1FZ0Cjzl9CewQU8h7KAb2Wjt3QpMWAM3jfGw=;
	7:H9eHHxQdgoLYV2Spkj2Nie45DrGVfnnMsiNE3xYqspYPE1ohbgXqEby9ZNGtjC0gHEVw+YnzKeHaxaCISwS0lQwIb17PHQAzwcnbz+iVglyJ1QQTXFXEXP6ix+b3/waQmoetosy/ejfoVzeN8hcSzJKHxPpyo1HR8ZX6OgoGNKoaJbh48+bk5LdyUx66zxNU7JORvoej0QsJDfwQYEykQz1vP5xlxBHxNjK8+YX+f1fJGErPffdvgA2T7J3vWTBVvV+LVJAZ1rkQOUDWwBCHIVJ1MS3U54nAjGKE0HtLfUxaehHPNxmZeczmBZGXi/dp
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: rtsoft.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2016 15:52:10.0244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBXPR06MB365
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
X-List-Received-Date: Sat, 24 Sep 2016 00:26:40 -0000
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


