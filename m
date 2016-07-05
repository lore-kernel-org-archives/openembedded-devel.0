Return-Path: <zhenhua.luo@nxp.com>
X-Greylist: delayed 1942 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Jul 2016 10:50:01 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0052.outbound.protection.outlook.com [104.47.32.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4191960116
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jul 2016 10:50:01 +0000 (UTC)
Received: from BN3PR0301CA0038.namprd03.prod.outlook.com (10.160.180.176) by
	BL2PR03MB1889.namprd03.prod.outlook.com (10.164.115.29) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.534.8; Tue, 5 Jul 2016 10:17:39 +0000
Received: from BN1AFFO11FD047.protection.gbl (2a01:111:f400:7c10::120) by
	BN3PR0301CA0038.outlook.office365.com (2a01:111:e400:4000::48) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.528.16 via
	Frontend Transport; Tue, 5 Jul 2016 10:17:39 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD047.mail.protection.outlook.com (10.58.53.62) with Microsoft
	SMTP Server (TLS) id 15.1.523.9 via Frontend Transport;
	Tue, 5 Jul 2016 10:17:39 +0000
Received: from sweet.ap.freescale.net (sweet.ap.freescale.net [10.193.20.66])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id
	u65AHa3t017098; Tue, 5 Jul 2016 03:17:37 -0700
From: Zhenhua Luo <zhenhua.luo@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Jul 2016 18:17:26 +0800
Message-ID: <1467713846-6319-1-git-send-email-zhenhua.luo@nxp.com>
X-Mailer: git-send-email 2.7.4
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131121874595570241;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(77096005)(189998001)(19580405001)(85426001)(2351001)(6806005)(92566002)(5003940100001)(105606002)(69596002)(110136002)(19580395003)(48376002)(586003)(33646002)(50466002)(15975445007)(86362001)(575784001)(229853001)(106466001)(8936002)(2906002)(50226002)(97736004)(36756003)(8676002)(11100500001)(4326007)(68736007)(81166006)(81156014)(47776003)(8666005)(104016004)(305945005)(87936001)(50986999)(356003)(7846002)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR03MB1889;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD047;
	1:Ezx4RKwv5b5YmLZ7KlOBVgNao32w4ML6mhkDuqH8OXAVMtyIyX8YJ9xZaZg/FbXvZonGtykCwMGXOfqF1tR2gzyBk31Sn3meYTvvQrerA2BQkrks+DS+6THlJstOwZCRAU7qNY4wCv17AALd8qMhEPuyMc/bAz4RN0QPhnDWA7s4/AKrMvfOgdeMtiWmc8nWr1Ik2DNvOd95R3Em2iRIzf/FAXePqYZYr19ZAX6zu4vRG5jC8Ug5p0dA0jFPv5bZz45y+hDRnstP9LaxJgtvQ7pk6MHitC6yCyufo5DshUhXEDRxN4/efnPqhi9ummpeIVIzw+zyNAKotlSlWj6aTMaHTlbR+UQF5YTNmssapg6OVR7FavqJ58XFvQfdnBfbiYbFePCyI3x1mesRCjz/WIkFRWg7w4hQsvkpzZEy6iItyfDlNm1kQj6oHSQm75XDDO+oohE9hp1ZzYfDpYOsJIGK3fhqEdscHp9w9tAO8ousbFhHGSs+eKxSDlTF7hzxQ9Vl/kg0ZMdQji/mJpqJaN8E9dpK1VYZZ0fr3hoDUJ9kiU6AifNOIyL+VeMEXscIE/4QH9i1RnLT49BGXpOXyuibQlXSmppnDVD1jbSRgRz07a3f1MH6tXiG4RE8EAIDplyc3ccYGLKIqKNBGgDPnQrbaKaf2p3UTv5mt4dOF8aBNk7w7FPFonkPjlup0mhKJcsnBhz5VS1Vhol4OpAsufjhUPeTI1ddMBUCP3TwgGk=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 68b9c800-6a8b-4aec-00e3-08d3a4bd9802
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB1889;
	2:BzKUGFgt5FakZk6Dl7u4dDksL1xKJDiU3J/w8OPyfe7lWqk6SKVgCvQN7se1boczYOW7W5thOBFsVdIAkbFOlT4K+YF8znqVvIOzhs+7rzRS+/G/xh49IWajlEfWo51CBAu8DOg4Hu2UAapjX2WKxDZoD+xdUiPANfx9l5LW3ZSJEg76AW8/llH06i2nh3T2;
	3:Yn+DsUXO0RcIvthQKRJ/ZJEB1H0XXP9ZdwomJZTesj3WIDLU0LnTEjCx3qqUMTxcKV3w1GXI0ABVMieZQ1b8dc1wYmVtZg5HjV6RoK5gbs79yqyc229yR+nJA6e/7lVxOWWLvMvTxLR9Z5JO09StKSdKHYYmIg8PkApRRFUcgXYfCrYxmfb6cczr+ylRDgCPdXe9CaJbSRNfXwGP+VqJ/uuPi2Y61TNw9QDzjLVxVIk=;
	25:04s0B76V0ZRets+4FRLVnd5Jg5QNPwIUJ2xCTe66IWN5y3edWOI6z7zbfx1TvP0vRyK6cGpBk+kY4A2/FkI8aBoriTm5bW7FyofAaTKCO/DGkxZuSCtfO3Vz323xuu4xE+DB7z6+3Q75dGY9CViqys7uWu04L1vVLgwUuxWFzLD59N1pF5e2B/wrbPgMGdK5uPEplSpp+s2axGFZN+LIZGz2GFbtMlhuzSJPtqrBDABTA3s7SDeCW8/EpwXaiIJVlm8rY8w4/aWd2iWs7mzciPxoSKdMdCkpcawibDctt1eWUbl788oo++Cw40u79KMiQUjOHMmKCudzAa5FM02zm5rCzZcv8Jy4a/dWziMk4gbeZsayE7zw4qQEIhP/+nAKOUuaXlOfneb6QzafD2R5BjnirTLJ7ehD9wcVuy2z/lc=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2PR03MB1889;
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB1889;
	31:S5LBSUQIyFbe2iKLqzMtH96HHgJtlXo1TL1jfbT/Rdj4bGhRq6uLHSesz5RtIRRbRXtYPsJd/2xcbEqLzxloppwTPcQkQt+JEm7BUl+hDgI5fhA1B/VRMWlb2gvdoEXnYJYM7uGxdGtM8Kj/9hiFuB/d4fRwbynk6WCnFYoD81oegSGj6HfQhobIGzECNNATGa0sUe5XqAnTV/BA2AKRiw==;
	4:RWM9xgyrstmEpT7YBsmcdIPne+6iaCfxlzOAA9nRxlaZ5EqLiCGoAXKCGuRICgusOLbiJt0FA3Y16aKOBj7tyYhdQ/CQZ0AZ8Chv3r4RUJ+/0hrBmWdftx0WeqmXCUA5VtgkWNiObbzD/60PViGJaVX0CtjWO6zEsV7PdMr65VQKY2qwv1XRrg0oMQ6zL4niwLOj9+ZHur161EaFLF02mTlUaA1fErRlUK9hbYWl5FK2qz2qy9hmkvfNFFZXbOnT1Dr5F160mQr1Ukv+IefZB6QF3e14g3/B/QGFNI+8KunoOqsZmXjLI1TOrOjbJelZiZeuK990OHE8q7fp8iiKrQTm8ymuJdC1YM7m1SFdeTIU8cVVp7PJNBRorAwQEJGv4QFKJVo62V4OkxhpxWphP1zuBH796/2cAZwVZA8yo50OPOtaLMwCMkAGcftSQ2oUS9W8fnm0FhLGQSaju8AGc/5gwnfvssB6tsksA0cz904S91Dtd4MdqgX9MjFcEHEt+qSy3pezHysW6qZopeJVtrnT8JVHqHI0NHNv+OxvpZjuTKnjclQ5B5U8aixEdYri
X-Microsoft-Antispam-PRVS: <BL2PR03MB18891D9746C33B654C1E0F28EE390@BL2PR03MB1889.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(264703809997249);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13024025)(13023025)(13017025)(13015025)(13018025)(5005006)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:BL2PR03MB1889; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BL2PR03MB1889; 
X-Forefront-PRVS: 0994F5E0C5
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2PR03MB1889;
	23:qq8TPeiz9QrRrs8XiprehfMSSA0voDCAP7Q3jaJe3?=
	=?us-ascii?Q?0jiaEFwmM+4R6s9ObnXUterzK5EObSJDe3FdCd8czoW9ZzocEIlB20OAq/sG?=
	=?us-ascii?Q?OUwgg55pJNIjrcfxlniz1IR4WgnThFodnHL4Flh/+X6slNmzHGsdpxX2oRoU?=
	=?us-ascii?Q?ADqSYL9n2ww2a9/plE82GqHszxjKJKwj8MKtdCOZNqQVR9piDf3F103i6BKN?=
	=?us-ascii?Q?eoY1jz5DRCmCoUTjazLpy30Ha7drcHTaHCMHHH8QsqLTrChmRCL9o7nR5ugZ?=
	=?us-ascii?Q?oEZw1uR/NE4s+wAJDhWgvUMQVHtd+MtksujmqowArcqd6p5cKsjOZ5g87eGD?=
	=?us-ascii?Q?aXwcpTo1Nd8VLb6vHocP3jDf/RI7a/SVKt1fR2Hp7GUFPrsZe2fkZbMwQXe6?=
	=?us-ascii?Q?UalYF7wO48DemCY1QdNbBbwXOXFnNimGhPdMiyvSwB6R6mr1kKqk82tFeo7r?=
	=?us-ascii?Q?z82Kprjaw4bHlm/+oIfzvaujdiPMtxgPCUeRUGlviTh3rl9G8yvGMd04WLx2?=
	=?us-ascii?Q?YrnpVwtVM4JAZEA7Oc+DzssiANhDe4V85LnupGBaMJyd1JKt+jo8QyarAvdV?=
	=?us-ascii?Q?IEW8Ej9KdSBhsCTKocaDKZXRfe3MRKi6V8B8tCkHQFNtn+LnZgP28cvhp97f?=
	=?us-ascii?Q?HuqiFEbNeoc/zvkbmueR81kQ1ra+kowUSrLlTX9tbcOJ4gMPY3jUHyeD3IbY?=
	=?us-ascii?Q?wuO9TYO2/MZsP2F3IKAtt2G8jdaHe9S7hboNhYBXrqod4EBlBB7rN8FPLcJn?=
	=?us-ascii?Q?j6NY5XRok0ld0n2W4/BbR8bX+XOFLuAluBMXBFIRXlciJT14zbZJ6Z/xH3OA?=
	=?us-ascii?Q?uLhzxx/DKzOvUEwKCyqEXCJSdnNALIChoJoJnK1+ut0NrOF+GJ8b9HnNYYn7?=
	=?us-ascii?Q?Hy7HJejwi3b20Ffe68GvJ0jGc8FTNXUNZwrRndjcMPJI4iL+55zUyoCgYD0w?=
	=?us-ascii?Q?6kQaFykwkay/tb+o71dDJ+3MlCmq+wIPMxHBQpezUkJ93tlAs6KJGUR5kMXO?=
	=?us-ascii?Q?OSz5ZQ1739WGAbMtOTBOLutfZapPLqaoYjcLgcmFQd8lNdvkQcnKqlBqrnUY?=
	=?us-ascii?Q?NWSOhUmO66V1ITM1f8oig0YkOkvPK8QdfIA/HooLSUZ1wWUFSUYVW9Z6QQI2?=
	=?us-ascii?Q?06bKurstsXC63X4ouuILatHQymHewry9khQtieoukZ67NLF3zRicYC8rbDEx?=
	=?us-ascii?Q?yERuMuWSxF/ihg=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB1889;
	6:RFQe+B9g/Whyi8PXQe1oqb9KhONUSQNbGAWigpkRwac/8TBcuzussornCkKt9Y1jcIIbYEhu6cr1g3yXjcJPCHeXtJNUHCgA+tOrr4+cGq3rYnw0BYVsFut0l26hrX3EsVLkg6jVHxx1qBXNT7z2++k/b34HPqaev8XWuONa0GBv1MXA8A8xEkWJMLd7TLVRPGjwBkD/BQLNONXM0D986aXPufItG7BEXmtS+diqvfMb6fs3L1y5X31KkIf65688x91iNGd4u1c1T6Oc1od9LIeboYXKPMJraI4nmc8wUE8=;
	5:ypsPNtv7JaXB4ZXDYGsAuzDD4Tl2Rz2GcsdZv4WeVwF+XY4f4nogtTi0ek0+I2qNRZ7NrrhcSejSN20Wgk2diuXewkGba0Y5M774BUxgbv4ou+1cFcwtVGzU2x75F0sKjLQ20ReoTcSoL+YxqF5XsN7U2bfjYrP24Eib7PmBaeY=;
	24:SBqoyWfefxAczDk1yVkAhXgmMjFbtHOkRRbVorm8sztmyevvj7HPnqZ6+R0D/vrnxdZEg2HDbX1LJYdvpvnw7DgUg40XjkxXvVjTTykq7JA=;
	7:WdL44Wh7SMNX9M1PIinSp4UvSrLmo0VIvTDNif8WQZidKaEVepHoAjadF7WcmxxeCSL94VRuuU1sGXlnUPWw05rcNHDKJDpbNtkGbVYyXMQSYjsM2A79wLiwBZxBW7WoIY4oFPSZf0wDYvl2YV1xUTEs9yTaB417Q5XcFOCJRuLfQHt65mxS+luhw4j4eWm+a4FbBSEPVWmmfe7ou6CDpKhQMHDWZomVZauxkxQBgvWxWNYV37WBebfJnbDc9zNr
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2016 10:17:39.3230 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR03MB1889
Subject: [meta-oe][PATCH] postgresql: remove blacklist definition
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
X-List-Received-Date: Tue, 05 Jul 2016 10:50:04 -0000
Content-Type: text/plain

The following patch is submitted for tcl, remove the blacklist definition.
https://patchwork.openembedded.org/patch/126149/

Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
---
 meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb b/meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb
index 4a0296d..d0ac86f 100644
--- a/meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb
+++ b/meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb
@@ -11,6 +11,3 @@ SRC_URI += "\
 
 SRC_URI[md5sum] = "8b2e3472a8dc786649b4d02d02e039a0"
 SRC_URI[sha256sum] = "b87c50c66b6ea42a9712b5f6284794fabad0616e6ae420cf0f10523be6d94a39"
-
-# http://lists.openembedded.org/pipermail/openembedded-core/2016-May/122095.html
-PNBLACKLIST[postgresql] ?= "Depends on broken tcl"
-- 
2.7.4


