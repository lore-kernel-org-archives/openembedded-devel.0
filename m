Return-Path: <ra43240@vinca.am.freescale.net>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0068.outbound.protection.outlook.com [157.56.110.68])
	by mail.openembedded.org (Postfix) with ESMTP id 90EF56012C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 May 2016 22:04:31 +0000 (UTC)
Received: from BN3PR0301CA0015.namprd03.prod.outlook.com (10.160.180.153) by
	BY1PR0301MB1221.namprd03.prod.outlook.com (10.161.203.17) with
	Microsoft SMTP
	Server (TLS) id 15.1.485.9; Wed, 4 May 2016 22:04:31 +0000
Received: from BN1BFFO11FD043.protection.gbl (2a01:111:f400:7c10::1:176) by
	BN3PR0301CA0015.outlook.office365.com (2a01:111:e400:4000::25) with
	Microsoft
	SMTP Server (TLS) id 15.1.485.9 via Frontend Transport; Wed, 4 May 2016
	22:04:30 +0000
Authentication-Results: spf=none (sender IP is 192.88.168.50)
	smtp.mailfrom=vinca.am.freescale.net; nxp.com;
	dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received-SPF: None (protection.outlook.com: vinca.am.freescale.net does not
	designate permitted sender hosts)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD043.mail.protection.outlook.com (10.58.144.106) with
	Microsoft
	SMTP Server (TLS) id 15.1.485.4 via Frontend Transport; Wed, 4 May 2016
	22:04:30 +0000
Received: from vinca.am.freescale.net (vinca.am.freescale.net [10.81.16.111])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u44M4TSc024960; Wed, 4 May 2016 15:04:29 -0700
Received: from vinca.am.freescale.net (localhost [127.0.0.1])
	by vinca.am.freescale.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP
	id u44M3llc012571; Wed, 4 May 2016 17:03:47 -0500
Received: (from ra43240@localhost)
	by vinca.am.freescale.net (8.14.4/8.14.4/Submit) id u44M3kE1012570;
	Wed, 4 May 2016 17:03:46 -0500
From: Ann Thornton <ann.thornton@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 May 2016 17:03:41 -0500
Message-ID: <1462399421-12532-1-git-send-email-ann.thornton@nxp.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131068730702059182;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(428002)(189002)(199003)(33646002)(101416001)(19580395003)(92566002)(50986999)(2906002)(50226002)(586003)(230783001)(5008740100001)(11100500001)(960300001)(48376002)(19580405001)(50466002)(47776003)(105586002)(6806005)(36756003)(42186005)(106466001)(87936001)(2351001)(81166005)(5003940100001)(1220700001)(4326007)(229853001)(110136002)(8936002)(189998001)(7059030)(42882005)(87636001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR0301MB1221;
	H:tx30smr01.am.freescale.net; FPR:; SPF:None; MLV:sfv; MX:1; A:0;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD043;
	1:JLVVr0wEBzXGSeGiGyZ0xSTUOBHM8DH05n6FO0UB2gO3rilybigXmWzarFY9zYqDmhnbEEPK0MkQb1aU3fxC6pTOKxeajMvljXyrhjHygYM0BNII4vGn9SxYvVn3+KFjAhUuyX+SItk3USaUfd7KhN02eWK4AtsMySOF3GvS4vu0Dd2yAz2juJlzcrawZyuTNPk92fSjmosEDh40592k3Csl65sIqT9Sr+w1F1/2LPrxmE5sCJUxySL6uz6gZzCy2c3h+FOHFmIhtIWb054GdiSn010ivie4slDRe3zwUymOwLhskgYGPDT2hlzmv2aiyjTtY4NUYCXEU+WYxFUwkcumIyGDpo4gr4+gKimFsGieBKIYJ3DZ+SXzmyrZcYqcbh0ihSePBOHGpOWsi2o8Z5M2OZgzOnibD+afrv5ZiTm1VRQpuNB1nhIO+RBYfTQD9fCayeqITFuqZlf581CQ/ueY35k+VEHTELmCNRNmoklk2YBa7i4RnW2+Tel5TKXZQ+eRmLsn/1aUMDHqZLhIGwPPWXeIi4qukGsbX9+PdjHHd1A5t+xGS65RMw1N4kaLdJETOgB5sxqBmRyv5rvbw+2j9GQQMgKyFu0vnbIcQZOMI7eKj88A4n57gNJABr9D9R96cTAVDaLNCoyyTlEFUNwMxjQ1Ptl0q42RBfyzb4gnXbK59KC0MlMGnpZbSbwMMEVNVg+mwgPh5EWbPAbPahII3K5gxNEe7tQo2xqDaVE=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 3a7d6f3a-1c56-4a39-56ae-08d37468111f
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1221;
	2:Vr3zftLB3ZNn8W8hQ4+oGm18YOHZs3SBWEHs0/kLdh3AeXXeZuPbgJpE5sqcCjnFghQNLVAXaeL9btgrpdtkxt+KnPZMYNvH4zCFu70/t6hbqNfhzPMwvCSWBrWIN8l5Tb77BZWCHD1kiZ6xXnOQf049bPDHn5dAZ4Y95xHWyk3WvdbR/z8lv1tf0/XADEVG;
	3:jCuyvuICEd7d60I2w6D6m3OPwv6Z+lwT88v0KEI4oL+JVmAEhfWZhUo61Kf5aZhx3mX238bt4jAtnZLaWZACaw47/YHdQ6wUsgHpE52FNFReIuGlREKxN639WWKAVTp2WjyhFpJgGj0ulpCFXKoeZWwGbVKtYKe9xmte1HZP3cWc+pUUnhL4oMxJftmoIOKiN78sAI/XuRa1Hl6MgVcN7I3eBz96fRo3t/WN98SpjxQ=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0301MB1221;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1221;
	25:JgW3bupUnnf2VXsZfaD4dcBjAqH7zV3K79sp+4RC8W+JvyOuuZI+SxvUcDJ5FsTgx/4YpdtSuIbLHJwaSEjqHdRCi53Y+1J/12/6HkV++c6P8CE2MSgfh9CKUt3qGJHpMTSP35JuArYccZ3taG8kMXcmsaLhdwm8fyno5aszCUPsg/URPjj32KzDV8wmTMxGcUTZALgMxYr+NT9Cvd+upLHmZnn/5kuYkxAJ4hlWk3br/y5Mn+RUhZVnHJD/VJiQMJas2EJw9jfNZAzYYvzj/jF9Al6Z5yQa9et2SdQ6Tjc2FT2ObzmFtB8O1LnZnZRNyns0d3T0gWAKDWsEjvR7urHsVHll0xA74XUod0aLfgj0PQZj7cKcWG/1rFYVDy+pFv/B86R+3hHDYtCIl+1G2Y28y9edoWkypvn6hKOs0rAPdSh3c21+7gQ4Yy8qGkmQY2/NMEseRkexsTwyT3VEFZS+FvHBsxd5nt376a47LIbhdp4rTTpzeYYI+g+im3gn5bUfcEtgPSB3QSBHtOTptjvM0fhWHkYvxRmvhwVOCqDCXLVDYnsBhvWacjx4ci8TA74dNV18KjWL7QoTDWTsMoqeG80WTpNHZH3ZojhN7WHB87h78khfeDE739xXXhThGDb7TCCDifZwSrmQlByhfwHpzIUNkafswmMm691aQJzx0e9xrZHatNvVXN4Ax0eaAP80vuPuVDGQj/dubY6YsAtXCJ6aEjevAQBD5t/JAO+mAH8KcrNvzltMKIl+wQ6cUM3JdRwXYaE60YzOCPa9+5CJ+6T454uyGpb1Ta5fHfTWb3KMaFgYUeOuLBaOj2xx
X-Microsoft-Antispam-PRVS: <BY1PR0301MB122149B8A426ADCEEA2F249A9A7B0@BY1PR0301MB1221.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13018025)(8121501046)(5005006)(13024025)(13017025)(13015025)(13023025)(3002001)(10201501046)(6055026);
	SRVR:BY1PR0301MB1221; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BY1PR0301MB1221; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1221;
	4:DEtoPsXqqnL9AxxHrJvhVrXlxTmPVxGw7iksWoMqjv8v2ZPrbnWUSeAhHqWIR8ydKbw8iUf7qWyLjxjcZ5jdrRFBvpHsFCOupcl9blM0dW+f5DIHNJTVsEH90H/626Q/24pKStCR70DnSemXIFPqB7+s1GeUNNgKe33GIHH0vW8o+jwDpfeK3lsxZc6L1l5e3CPmRxPN5fvsQVWvQpVHr9o43rmeX5AAkhn3z8in4vsN90TtgwqxuOxpu/8/DFaYEzHncEMt3l85vgYrZ+TRH2J6fF+ySLM9SD/qipJT0OxnqGyoE2+08Jg2yWBPTOoDED/hpVTo8AsMGZlBsRsfduRQ1YenVltaXpe6Etmp2BfVTyO4sH8Nmm25mu/OqUJMZrg78maRVgQ9ojPwL2BXuzFt31xQ79UsFGqoKHb/e36uZgDJWuP9bw4WVCWPyKuQPRXBWtQuXAJNNxYW1IZlSdha+7yGKqvIWheZQJoD5mE=
X-Forefront-PRVS: 093290AD39
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB1221;
	23:HDpzzvRN8LjXEfC4SE2PMlClQMHsZ0EU4mExpIa?=
	=?us-ascii?Q?bZy4UXxYQ9v6ZTjFeFpBq/+WrDMDXTlIt5f4mA/WASWTXk5vrDI0USdd6P6S?=
	=?us-ascii?Q?VBXJ9X/hq54Sac7/aHFnACguHExfttFQtw3pF8XqyIx98357uw+kMZ4yu8R4?=
	=?us-ascii?Q?WekTW3i/bR9DrtXmL0dMLgLB0NNiJOMZ9WxQpXabpRDVTlyTYEx94z57R2pN?=
	=?us-ascii?Q?j06mFlZmgOF+jARytsq0Jw+O9fMSBJiCYYEkKDsaly7a7lyS3QmZvB/EiT2B?=
	=?us-ascii?Q?pEq/8XyCv32YshXz1r+SaXd111n9doG/0ug57MnO9OfO0AMchLnZ016Cq2pF?=
	=?us-ascii?Q?Pof3l1bpgjP67ePlNpIWKV1TsgUMb2drWJ9no3Hn/IdGzRMMCCDRXoFwacTs?=
	=?us-ascii?Q?zXz/dQY+ZlMNJ2AT2uqtCL5t5tigE7J9/ik+3TYMiKvwwn+QmHXYw7UO60QB?=
	=?us-ascii?Q?vWUaDiVcf52aLnS3GMi49xPu/cddTu5mcvUd+tTKafiWv0UkjsmKc7eLme53?=
	=?us-ascii?Q?Ga07I9MFBJJlgP9k8OoKHs9/EFUWtXLSddkBc1vYmYdlgY9WTv7Nhoc0GhdS?=
	=?us-ascii?Q?M/B187VwAca3ZtRHoEjGDsHYufvOf5vqjGimHXRItdYubXm+dcEFxu0fHd85?=
	=?us-ascii?Q?H8xWW0edWMtkClbift8jn9foMWpNULR6o7pASe1KJBiKkVXR9h/Z3wi2Ja3i?=
	=?us-ascii?Q?3tV2y4dqOXdb/Np37ZQN4BHAM8FvBLK2rSGHoohhZA3WouFKBi236xCFNrSk?=
	=?us-ascii?Q?9Kv+8wCGJAGF/lMQUGtlppdV3pNmMAceqpbve5/g6NIC2LETi3vevWLy5PSe?=
	=?us-ascii?Q?nuD3Ttf56+Fn1yeyvvuBCLb9mbgD9GaF0dT4/7Fofp+zVLKddMAi1z8TX+6D?=
	=?us-ascii?Q?uoOg2EmCG3m2cpo4scT1tthv+rcdyGf+B/bD9jHBGns/voDgqzZPPEjgGlbk?=
	=?us-ascii?Q?qZy+9/OdJFsWvnQvWnvAZeUOpH9nKvpjetdIOxNnq/8C4WCGl5Dk6kpj2NdD?=
	=?us-ascii?Q?dIPjrrmJwyluku/HgarnQGnmR?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1221;
	5:sQqYQtsvDRiziVIq8Jg9ncyFtBK11deVl6W4HZizlDs3dRSrTyiVV4iFXMtg3ObUh2SrlevU1dwMNVycBUJdXc9lYUvVnmeZMTQFR0YzWtPtD914V/azQa6V5hwHPwhqQrtJ/yFbF5vrVoZByBqrUtPkg80x83OQYU/zRgi0QjM=;
	24:sFPcDrQbqEXZ2BBPfrw1rmxlz0B9gMB2TIy3HMfJzlzqrxIL6ukycLSlInY/9PZCm/4J+5DFcTuZYh8JuDJT9k47TyoRAUQMP6DGq7207zI=;
	7:GphvJGXlYOIik3+Id0L5pUr45HDQr124guzVmAufNn8jy/P+Q7m1grFID0QyYJT6f20P1gN3ygWEGHmkFuIxkOrpKE1wIgQSm3yXrNsI0v7RpEpp7YhNp9DybObEkNZg1PY/i3ykW8dCCqSsmm2z+X1zbhHsEknA9Ij7vyNmpD5RHat90G88fyCO2mxteQWd
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2016 22:04:30.0187 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1221
Subject: [meta-oe][PATCH v2] packagegroup-tools-bluetooth.bb: Selects the tools appropriate for the version of bluez being used.
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
X-List-Received-Date: Wed, 04 May 2016 22:04:33 -0000
Content-Type: text/plain

Signed-off-by: Ann Thornton <ann.thornton@nxp.com>
---
 .../packagegroups/packagegroup-tools-bluetooth.bb  | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb

diff --git a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
new file mode 100644
index 0000000..bb5f85c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
@@ -0,0 +1,37 @@
+# Copyright (C) 2014-2015 Freescale Semiconductor
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SUMMARY = "Set of Bluetooth related tools for inclusion in images"
+DESCRIPTION = "Includes bluetooth specific tools for this version of BlueZ.\
+These tools are used at runtime. \
+Supports BlueZ4 and BlueZ5."
+
+inherit packagegroup
+inherit bluetooth
+
+RDEPENDS_bluez4 = " \
+    obexftp \
+"
+
+RDEPENDS_bluez5 = " \
+     bluez5-noinst-tools \
+     bluez5-obex \
+     bluez5-testtools  \
+     libasound-module-bluez \
+     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', \
+                                    "pulseaudio-module-bluetooth-discover \
+                                     pulseaudio-module-bluetooth-policy \
+                                     pulseaudio-module-bluez5-discover \
+                                     pulseaudio-module-bluez5-device \
+                                     pulseaudio-module-switch-on-connect \
+                                     pulseaudio-module-loopback", \
+                          '', d)} \
+"
+
+# Install bluez4 tools or bluez5 tools depending on what is specified in the distro.  
+# Otherwise install nothing.
+RDEPENDS_${PN} = "${RDEPENDS_${BLUEZ}}" 
-- 
1.9.1


