Return-Path: <roman.alyautdin@rtsoft.de>
X-Greylist: delayed 38333 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 24 Sep 2016 11:19:19 UTC
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr00132.outbound.protection.outlook.com [40.107.0.132])
	by mail.openembedded.org (Postfix) with ESMTP id 34BEF60079
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Sep 2016 11:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=5031003890.onmicrosoft.com; s=selector1-rtsoft-de;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Nh71eDhUGN/dU46/l2vAerqK8tLXr6x7gT5u55YzBZo=;
	b=JJKYxAPqHZ31F6Ncz2w9DtrnZNgXoNnoCpyUNFSCVcPUZHkE7n/AyQ/9KMW4AtQ23NM0AKs/RrWmWcXnFPKCFUyu2MEbrvRDSxQ+toOerVYN/ChmNldIkMDycIanCHwe9vDjoFbV1Fj8v8vJPM7ap5taxoyrjghmtcWYSi2DY00=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=roman.alyautdin@rtsoft.de; 
Received: from romanpc.dev.rtsoft.ru (213.79.90.226) by
	AM3PR06MB356.eurprd06.prod.outlook.com (2a01:111:e400:881c::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.629.8;
	Fri, 23 Sep 2016 16:44:04 +0000
From: Roman Alyautdin <roman.alyautdin@rtsoft.de>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Sep 2016 19:43:36 +0300
Message-ID: <1474649016-7314-1-git-send-email-roman.alyautdin@rtsoft.de>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [213.79.90.226]
X-ClientProxiedBy: HE1PR0801CA0030.eurprd08.prod.outlook.com
	(2603:10a6:3:6::40) To AM3PR06MB356.eurprd06.prod.outlook.com
	(2a01:111:e400:881c::21)
X-MS-Office365-Filtering-Correlation-Id: 3a91bff3-9fc5-4bad-41d2-08d3e3d0d4b2
X-Microsoft-Exchange-Diagnostics: 1; AM3PR06MB356;
	2:bsHshVaaaEwfHrQG8C435WcMVJCEsQ0R4Hhv0GGgfPqqGmdE90oisIglrJ4GvHMemKpMXkriQ45xgGYKyOYJIyoGW3NKADIH7DEMP6sRl8Vr5nX1tQxwNyt0MJBLk7Fg+sYZqXoOUcM6Z56mj7TBL9fRRiximQxu7J4ji1def/DrLOYLFXEafvFkZe+jQMza;
	3:gcpjqOBkrTMk4ZqoDHvFcuA4gJIrIJ5UibyA+OQlhZn1djzC0ZTm7jgW43TDncCUxu9Pkp2WCBb5M1Cnldue2qzPWBnf87gL8yxR9MqGr0+I7WGG3DlmPnTGeRwmwmqz
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR06MB356;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR06MB356;
	25:iugLzXsXp6J/4Asmn3LWyKQYGqeFC82HcsdCuF5osRB8AZY1LS0WeIj9PpYuJXQWblVzfyUq+peeWiAvfHL0WBuxLK8GHr0NlIw82z2gHOkt/GAZDmOzQrNBC52b9uahiLBDR1gq5KIH38sz8ZpEfl0BrOa1N37M5r+EsOS6MNz/xDoJUx8maZaVG4XvAB6/PWWh4SAGo3sEocH1Atu4ZuoiHG34AJzbbH6uV1qyor3lk/kVDC1zdySuKwYO7gsfkbJwLXJigFqvdIL1qwviRTMEGcO93D50cZmtabtc8okllyB3A44KmFSTEDnJiQ9Xy4WUqSCA2Eg505ilYgd+7NBekg0eZvsEURXy4R9LCKtvVp0Mlo+Mcu2Bq6BqmyC9fK7bOIJIsS8tUfbRmf6gUkgDpVjPWjzuAJAFMP3LFtgLUAESUS9goKy2T2hJcHc/4INt777P6lA7d1dw9ni0hR+ES/RqkNO52qQ/SfQ5pDthPUZlcTF5F+hdOsQRZZaC47pj11Pel3b8kmxjemx/vXYwj3Po/N4qAHf6x89Tn8eQSgjFYwZXTFEK2DhXqqTJwh80NxUk2FvoBCoa4RhyNV5xZTOLusH764Jwc5Nig5T2AxHxQ1sdE5o1X2rg509Pbknb4pTGKq8z+QyDbg8iQDYxzWrzN0ukIQiJ9Ozq8P6z84+wBujyo8k2436LNIPEE/NUKClvE2TEoECwwNpBks46Yd7Xek3OKCToxoNm3t6TzcqiwJ3TKUTVwbab7mAx/ArJ8xKuxiR/qEHyCSRRnhuP4+6ehKLx8xwdo/Mj3B/6O8FUatB1gTptKQtkblL53qq+Igo5Pj4QQnaScQd4tQ==
X-Microsoft-Exchange-Diagnostics: 1; AM3PR06MB356;
	31:cAZM+p76dbvKgfLKzhrYt0zK5KcENBTD8VtYjssYNADOUnqehVAZ7olcpBC9RB5VJdFk0GTPWTbl+1vtlcJRxgzB2WR4C/3mSYfU/PlembqWUyJsBTbpoMeSfeF5yYkR6GQXliUKo9dlNYB0Ra5/punGuOZck9/mb1hlCB4gmsmLjiipyVwFLGZX8pfkg09KH4G50Qci+go3jshpdNaI10cb3lQqbu2HC3x9UT0ZADk=;
	20:KEQ2fxeUQx4WdErR9r/0lcx2PqpCyYd7RmwahccZ0mgV7SqCfTkKK+OrfecWVqXycrClPWeKXF+EjTkiGMxJGjawSZQHJjVocTphRUE12zlG1KOg0yDKmxt2ClaF0W4lazTn5mJlivlFes5EQ7PMFuH+LKy+smqXjliZnzDQMaGkRSD9LELIUPSLZFYcDxd292AO7U6e8T8Y/jETj+Fc00hKICjWuOHX0IObNMIr9VGFJ2mccvIpuJHFaYm5LyKo8vg0SAG3wUpld1BYFSexaOvURPSfcwG17O0LJUE5zScV0Y76jZnZ23JarizwsWNRqNa2ijOLvvZjuZsKFhXmDw==
X-Microsoft-Antispam-PRVS: <AM3PR06MB3567F68308AF0EBAFAE36F8FBC80@AM3PR06MB356.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6043046)(6042046);
	SRVR:AM3PR06MB356; BCL:0; PCL:0; RULEID:; SRVR:AM3PR06MB356; 
X-Microsoft-Exchange-Diagnostics: 1; AM3PR06MB356;
	4:t2fI4AZFmtOhD9zxXDXktnDTiCtXHjheCdXG58VjEF1re/NCrkNqiw4+iqRcYKIdEQe0VrJSHypdxiZbhrFaMV36IN1Ymrua9O2eF0rOw1WNZBlJNrA46ZogH0NJrQ/JGSS7QXZd+hBe37eUSOkz0Nv5Y+wiyGL61hfQYSAWBgt/KS7x07Wn4U9Qvs87qfhR/dmishWhkkJJApBT3FLtV3FTBC5i32YW4n7fZR7H4IVQplj98EoLeX08i+mTgs3z4tWxFTklOqBmmKlnmWSL+pgXvqyJRpe/1k4Sf6W3Q1FsoiH3+SJcJvzMMYX+YMGtvrfg7wlgO9lkVuehNjriXybml6qjzg329xOASCtf15aIpqdo88I8CfqBtQ4lTYFFuXJ4spQyAtZEbywuRI7B/xnyBhfHO7rBs6sNhoA3eBtltIB60ReuCDpxmRSurLACNJyc6wr2hwzFT+HWWeCiWDlESqZFiKHU9a+Q371Svtc=
X-Forefront-PRVS: 0074BBE012
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(7916002)(199003)(189002)(105586002)(19580395003)(2351001)(74482002)(81156014)(75402003)(107886002)(19580405001)(92566002)(97736004)(50226002)(8676002)(33646002)(110136003)(4001430100002)(81166006)(450100001)(66066001)(68736007)(7736002)(5660300001)(47776003)(36756003)(42186005)(229853001)(106356001)(189998001)(101416001)(50466002)(7846002)(6116002)(48376002)(2906002)(4326007)(305945005)(5003940100001)(575784001)(3846002)(15975445007)(50986999)(86362001)(586003)(6916009)(142923001)(4720700001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR06MB356;
	H:romanpc.dev.rtsoft.ru; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: rtsoft.de does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM3PR06MB356;
	23:pluoxppep9gIT8+DEe05GykQLJwAIWz4imJDlZChas?=
	=?us-ascii?Q?toQr4D1HisjRiGhTYmYBXPlt0k3ptNCWr0P/ZXztSpyga0/oKBjwrxHP91jM?=
	=?us-ascii?Q?pxuEbqNt/Vk7CxRe1kYYdFel+Pz06yUacsK4ZnLjpvSjQSUUamQ3DfKD4jEa?=
	=?us-ascii?Q?0TA39q5PrPV7MHB3YBaPyY8aD+soitvxqxflmfELK21xaRcJApuCsMz8ggoH?=
	=?us-ascii?Q?Qo6O5DKuh4RmqgpsPbTAgd8LG/bFHfqKuVz3tvXVXs2H7MMtj8cmDScIlQj+?=
	=?us-ascii?Q?/U/Y2cptqoXlUYQWSVI8dZH7wU3ji8rQkJv4tLlot8jYSf74ESlhYAvQu4xr?=
	=?us-ascii?Q?6BWlqIZ6nRLL3RIR5OkKj0/L87jhv2VBD9Yh/sQj9dER9qDz0HyKxHJZn3Wf?=
	=?us-ascii?Q?8nUnYwNThptPRxJRjf4o1Vh9n7uJ26GHZ2z0UYAsYXdNynCXtzERfz6+egTC?=
	=?us-ascii?Q?24EMnyeLJ/GxGrxWnh9dZMFQlMQHbzM1Pd5GmATq5pg4uQ6SH8F+4eGN1qvG?=
	=?us-ascii?Q?LUilu6FMT6K2b5Q9Ic0pOAl75p2wCVFyK++YlO4cUG5JGLoLB8UTRsyOf6OH?=
	=?us-ascii?Q?qWKihA/yOMdQMKHad0yaJtmrGSmiX0BMGjQZxpfkB8DHlVIFJWTR4LnB0yz0?=
	=?us-ascii?Q?qy2fuTTcJq+Aq0f2BPYG1YPtkdeftJVi4fFp38d4hppRABRuDheelZCiBeXy?=
	=?us-ascii?Q?cfsLlCIn9R3r6Pdndtn+VJslBiOsu2+4PL4nM82CBTPIDSxr2bg3gMBZVl4A?=
	=?us-ascii?Q?jPFWwQRnJSQGKbhIONqjKmppXdVOzMRwOWxPGwg8ytF7RP1oBpqD69hn/XZV?=
	=?us-ascii?Q?azD2l7XQxe2umcoSnmO4V7e16kKZeGQi1A67yHpM2aEF926tQrHHdpJMZzjb?=
	=?us-ascii?Q?dH6a1wIqpfbv3CF7PJa1gXyAyLbKq0WY4/d3jQnzwmCr9fg02w70WsGE8rhd?=
	=?us-ascii?Q?ZzjoMUEYA9PfI51ed3cqMdzoXNEVeAp9NcZl0WdE6baJWq3h7Y8SrO2WO1US?=
	=?us-ascii?Q?g20bLkgKG5DbZ9nozxKpi9aFG4pORj1Z48xOz7dLrq3c/mrk+kXZchUyhL35?=
	=?us-ascii?Q?wsqnLPDDzW01y1HRH0x9hZ9UkBaMpH1ey+p6c/GxgAVfHlhXn/giTC2iXjzj?=
	=?us-ascii?Q?NMctSJ3NkhBLhplvwawmQq480upCnBtma52nJhUrRebwthb2hEFyHqBsufDz?=
	=?us-ascii?Q?flRRFaP8Mzn30avP8Pm+fSDVAbO7ivzxjQ8JcMwqrC0Q+erKrPlPoOC5wHNH?=
	=?us-ascii?Q?MxmcJwDg9jeMTzpSoBntGi3e3Ov6jbKOvrUKpP?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR06MB356;
	6:PcUUMrrAHQL1S7ie8Wleq0WTLoM6So49MN0UXq20Cm8qXaIkeFcKNlxTcu8uDmXNIu0rgy3TULUoiuyxE+X3fi2hEI9hZWl6DkXAIO2kpsKjXMMrhKJq/iVH0thuc1fTyj43nXWoR+50KYbykmfeuB0KIPr6HlISsu12rBEh68gLCbtWFQK4+D7DaVZrIA8oI7Em0/XJlDZqzs/o7OF5qx8ZrrU9PYaQSD6jdZlIFpb/jbu0BTeHuTB7muLCXwOlYlQ7dcZJJSG0W1Pav/uOpUX9fC9SfGmdfKylU4IglT1VE32QWk2pYNhxN0zaGoGT;
	5:P9hVz6rCr4Qe2mfZMHyT4k3QRVXuf93RG30r9YsaCrUiLrBbH7fYGqiZCqk/BDHXrAHji7gljXfr9r30BJMP6OKT+VUVFeRBYZLRd30bp1FV9n/WVj+qjL/YqWa05rVRJPzMbR3/ZekXtFPsocfOYA==;
	24:fVhx9HZKEC+vrzKssjnFe/R78FK3Z677IMEV+OdCwx6W97z7pjbtqDoCSTzeM9x0Z8vpEruOM/MMBjTB1/CMggK4S7AJyirVY4IkgaeD7es=;
	7:rJRKthgNhvGA+13H6HY1OHjzU6CU3Pyi2jCjFz08ezN/xYP8m4U07PXtF8ni9bZ2Y2YOFW4De56tmlqIsGB7fNDBtz3wgspXTEHL52xDAWEa350N2At14cEXe3eo3m8XmktLcZNjTV147GqqWzznzag8/hkVpaFFM5EYJcxEcHrkZw/JtvoIdc7wAPSxvEAfS0QNNL/y7ZtoEUP3I9/p76ooPWFAT9aHiHcA3nardfN+q9v3+v+RgHepJlKpIEUDaqS+x5hCFwdku4WJ8WN3ReG8fKZM4YoELeWm8DkeZf0X+vyWN2mXhzV+w7jFVAv7
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: rtsoft.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2016 16:44:04.6553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR06MB356
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
X-List-Received-Date: Sat, 24 Sep 2016 11:19:21 -0000
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


