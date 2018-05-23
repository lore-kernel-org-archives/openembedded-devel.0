Return-Path: <Martin.Hundeboll@prevas.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0068.outbound.protection.outlook.com [104.47.2.68])
	by mail.openembedded.org (Postfix) with ESMTP id 576AC603FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 23:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=TzM6zvNlDL0MU1QHRV3B9ltHs5A3eEjEmz/KPv3LgO8=;
	b=HTUEAEpY3yyb5IxSlpeFhZhBkvibHu8WtWAFLR38FfSy6Mjpazs6scGCzIC9RE0B6v5Fuc/Rkt/VT0sT4vDmTvs6Nn7UwD1gvxZOf1cmnrEYr0PE/DpaXEwUyeZE/DQJ+VTJVzPV+eECBwnfiylh0s38UqBIubD9OIp9+20CIMI=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Hundeboll@prevas.se; 
Received: from mnhu.aaad.autarch.net (85.184.147.232) by
	AM4PR1001MB1426.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:9a::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.797.11;
	Wed, 23 May 2018 18:23:41 +0000
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <mnhu@prevas.dk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 May 2018 20:23:30 +0200
Message-Id: <20180523182331.23083-1-mnhu@prevas.dk>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-Originating-IP: [85.184.147.232]
X-ClientProxiedBy: AM6PR0102CA0033.eurprd01.prod.exchangelabs.com
	(2603:10a6:209:14::46) To AM4PR1001MB1426.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:200:9a::10)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:AM4PR1001MB1426; 
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1426;
	3:FgwEI3tzwBs33VQQEjiUhohMJiG75RzvEfxM5AP3aQMkUsZ3fbfA4VAfW3wJ3YAjKiaHBfPDe+DPn146cCCYKx7Arp8biF/xZpbr7qf/Zm7fvmHrK5CYaAMEVOT04fo/lsEELSEfpsEd/co02D3js1yWDlRu7x+ZYIR526C+grmZGu/AbXsDsqg1B9UXpJaw94BFC7SwJ0VtMYwlGjupSQmgBfyyY7bgqNEkhFVJDasEMe3b6qlYbiuIkT8QGCZh;
	25:z1YAMIJ3Q5pUQcj6NBaCs43kHov2RU6rB0yRIzTk5ZzBgi8E9DgO0oPaUUAfdXpsjj1s9IDy/XoLIiiUU0yKnJhVyCrb6yVVL8VEXWhMikVM+VnDYaqrtcx+QCwS3nrKogXkG2La43uS4yGCbi/eb7dTx2/SHx7zt8SZ8jl7eJbh4NmX4rIaY5wifGL5MHzN5TxajfS2Da4APHgA/nshxv7NcRPVQ46cyCnT2ye/atS0vD5i2D7SNHfPQEvRf7yVzq3SU+H9eTIAc0FO7NUTIfQ9BcAundiCbv4+ErzTZP5r3svGDCui4zcTv0mjRi+/QM0jWh6iEJTgzXFdsbhQdw==;
	31:bunpFJ9O3O3HVrGS51/t+N7Nn12Yi3D1SqHohkj4o9zYQiB4reS2RlFqz4kvkhmyxR17iLGnrm4sUYnvLQAjfb/GjHKpzQQ7agF26+K+k9U3tQoWUTW3Zt3E73TKlifokiosFwzSIkfvJU2d72Gm/K+pWFBFY4Km2UFChfVeRjMmRWBNr0IgncqN7VHBGoI5lcuYbKtU6o4RyVeTEgJka80l/SNELbuTgRKsmvAjc2Q=
X-MS-TrafficTypeDiagnostic: AM4PR1001MB1426:
X-Microsoft-Antispam-PRVS: <AM4PR1001MB1426E18BF5FDF08F2C083A879D6B0@AM4PR1001MB1426.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(3231254)(944501410)(52105095)(10201501046)(93006095)(149027)(150027)(6041310)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:AM4PR1001MB1426; BCL:0; PCL:0; RULEID:;
	SRVR:AM4PR1001MB1426; 
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1426;
	4:0jo6PxUt0qfVV3kgp/L/+WlpB0xbyAJlfINuZc/RWdyAr2hKh/UKo18TAHgjwb+EK/ae9RR9rZPfIGu0cxZlmheR5mskM4Lz2kjyjObwYXXu4KsSwwiA3CRHHN+KGgmzFiPCc2t7nNAG4EcquuOVf4KApkvb179l3cnlPyY94SK8nGb+QSiQRAGluQn1Ik+5/i7seMiBWnaKZh8nybbNATFJnaDEW7HBkC9B/KvVH+PR2fWpEgSBhJuzQHCHBue5rTDCzFexZ3wrX6jZjki9qA==
X-Forefront-PRVS: 06818431B9
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009001)(6009001)(428001)(199002)(189002)(20776003)(69226001)(63696002)(47776003)(74876001)(62966002)(74706001)(36756003)(77096001)(77156001)(23676002)(76786001)(76796001)(81542001)(42186004)(93136001)(76176001)(92566001)(46102001)(64706001)(81342001)(92726001)(77982001)(59766001)(56816005)(33646001)(80022001)(66066001)(76482001)(90146001)(89996001)(65816001)(87936001)(56776001)(88136002)(54316002)(74366001)(44376005)(87286001)(87266001)(50226001)(4396001)(47976001)(50986001)(95666003)(49866001)(47736001)(51856001)(50466002)(85306002)(79102001)(85852003)(83072002)(21056001)(97336001)(94946001)(93516002)(95416001)(94316002)(97186001)(80976001)(93916002)(575784001)(81686001)(83322001)(19580405001)(81816001)(31966008)(74662001)(19580395003)(53806001)(74482001)(74502001)(47446002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR1001MB1426;
	H:mnhu.aaad.autarch.net; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtBTTRQUjEwMDFNQjE0MjY7MjM6TTRibnZPbk16TytjMXlaSG1ZeDRuVFZF?=
	=?utf-8?B?QWtWTFlodTdoZGZNM1I0ajJlVmJMMVJlaUhia3VnUWt6WDRoWUpNVHJIdmRK?=
	=?utf-8?B?WTRZVHZSVDJ1VmR3RFRtbjVIZ0F2ZFBia3dZNkxFYkR4bTk1OEJONWZpdXM2?=
	=?utf-8?B?NzFIbjY0NjYrRnd3UzhTT1BSNXBLRFhOdlBxS0dZTXE0ck8yVGIwVGhXUmNt?=
	=?utf-8?B?QjdlL2RIa2dMaEIwRFFqdi95c29kMWY0TmJxc3djdkszbWRwSm42Yk1BMW8w?=
	=?utf-8?B?R1poREF6RGlPUWJjajFnSDZ4SC9WUDdxeWsxOWNFbktyalo4cWhFT0lrTVpT?=
	=?utf-8?B?OFF3RW1uYTBwM1hGUGVaWlhlSDVseFI0Zis3ektwaFE3ZE9sZ1B6MG1tRFU1?=
	=?utf-8?B?S2NtSS9QYmc5V1lLcUV5RXFET0RqOXJLWnZiZWFxOHZ3UUl1QzRETFhSU3Y4?=
	=?utf-8?B?UXNoMjBmZFgxaU9Yei81Q3RVdlVUejExekt6VDF2YTFWVjhHaDNSMVRPYmFr?=
	=?utf-8?B?OGg3UFljcytNUkhWNTU1MmhLSjRIQjlrdUxRZlJ3RUlBTUs3WVBzdFl3TWFV?=
	=?utf-8?B?cXZ1UW1xS05WcTFINmpnaE5MMWVRZHZCT01PTlZ1bmx3ZTFNMWpQRno0Yzl5?=
	=?utf-8?B?NFh2ZDFYMGx5MVp2czVGN2dYaFJFMDhpdlRXVm5zcmRXTGRtQnVrWGF5NFRt?=
	=?utf-8?B?MGhJODAyMytpVGV1Q0Y1YzR5WnpNb0FheUZpQU1PV3RaWVpZK0tUcGF6cWs3?=
	=?utf-8?B?M2JjUmJwdnpIWHZDTnlGVzFrSCtWZk1uN1lpNVhiMHVvWnZYSDRZYWMvbVc1?=
	=?utf-8?B?dHpGMGVzMFJtR3U1QzJXNk9YSVU3RFZxbXNuL1NMOXBZOU85RFVzTW5hOERV?=
	=?utf-8?B?KzNDRjdIWjJBaG44dnFmU1NjRVQyNWRkcFNmNWdkN3BnbTludHk4QVBYQU44?=
	=?utf-8?B?ekFFWWhrNnlWOUJ5K1A2ZHRZbmJ2RTR5aHVkY21JZFhzVDVTYlpYaXdWV0VM?=
	=?utf-8?B?RlMyckpVUFVEVjl1ZjJSQWxZU0tqVncxQUFwazRlZTQxS2NhSUlrVTZlY1Rr?=
	=?utf-8?B?aS9abW4rUjJvYkpqRDhydDNBYUV2cmlJaEFKaVRZb0JVU2NveVk5aitrN1ZD?=
	=?utf-8?B?ZkRiZUtLeE8xYzZxbVBFWnZrdmtyd3dCZDJmYkZ4NmR3WG4rMXE3RWdSOEh1?=
	=?utf-8?B?ajkweDJFcG5FTGZYdjdFTDk5YjJnMGFIRGFCbEdpdmJ0NGMvVFVVZVhlVUJh?=
	=?utf-8?B?WWtKVWcraDk1REE0VHFKTnBia1p1OVNZWld3REl4OVpEakFqdHAwZmQwK0pm?=
	=?utf-8?B?WDFpaW1WYTBTVVU4UERSRm5kQVpTVk4xczFzdU1zakhaT3l4bWZLcDVvS0c5?=
	=?utf-8?B?aXNaKzdsWTNIMGFxamEvZVBHQzBWUzdlSWJkRmwyb0ttT0RWODl6OVhJWlJ1?=
	=?utf-8?B?RTVmOURzUFVpbWNXRjlnSUF2d1A5alRGS3hNRllkdldNYVYvTjZ4cFNiQ1Yy?=
	=?utf-8?B?dEhrWVZrY2hhcHdESXpaNzRCSzBvcjRKNUZCbXAxVEg4VWd5clFCOVFjdXBU?=
	=?utf-8?B?Q1h2UnZYZzJadGtjQVFURzRkcytnRnBtQUVVa0NrcUYvUkdaTERkbHFmM29n?=
	=?utf-8?B?TlBJSm1CL0w4Z0tOY2xBZzc1MU5ib3R0TFkrZks4bHpkbG9MeEc5cERjRnd0?=
	=?utf-8?B?R0EzcHNsNTlxK3EvRXVoSXpBNEhISDdiRko0NmlyL3ozU1VYVnpwNFcwN2RR?=
	=?utf-8?B?RU4yVGVEWWhMbXJ2SlZZNU1EcXQ2aldqYWJNNDdwK0FJWU1ScDdmcFF0OWMv?=
	=?utf-8?B?cExvRlZHMGszMHlDMGtzbmpGOHJ1bjR6dnBPKzM3bHRLdnNwcmROKytlMlhS?=
	=?utf-8?B?Sjk5b1ZzVkpFYVliTXI5Ylk1bHBXbFJNR2RyOFBwVUlSbDhOUDZlYStGYmFt?=
	=?utf-8?B?cld0Um5Bc1FFUXFkZ2hiWjJEVDZjcGFycmhQWFZud1hTZ3puemVnS25PTFJo?=
	=?utf-8?B?NS9raHdyTkl0S0theTJJVStqR05McU1sMTRod21Tajh5RGk0czZac3hMSlN2?=
	=?utf-8?B?YUJ2SlRjanQrV1pQYWlHZ1k0QlBGOEdXZ0dlMi91WTcvSkp5TXF5Q1htNVZQ?=
	=?utf-8?B?ZGJjRWxLVlZDYlEzSXNQQ2YwRFVxUlRaaUZiRnl3T0ZLVlVHdFhWdkpvVlpB?=
	=?utf-8?B?ZWJTa2pFcFhvbEYrK0dIdGhUaFNIV2JaMy9WeG5EeGRlSDdvT3NvdnQ2VXpP?=
	=?utf-8?B?VkNCZUI2MmV6eW00SXRPMU8yc2pPRUtWM2x4VkV2MVcvWHJWblBDRElQRFlZ?=
	=?utf-8?B?ZjRGWE5hR3Q4dzcrMm9yZUlZTGsvT0Z6S2VJMzVpcUFNMXppMGs1OWRUV3JC?=
	=?utf-8?B?Y2ZtWFd5YWp0VTNrUmtSZVQzNlRFU2JleTBaVFRuRUtXWmIzUUtlN0w1S003?=
	=?utf-8?B?czYzZHZwVVc4Um1vU0I4NzdIK2NFSm9VY2VCUXBqNDVkOHc9PQ==?=
X-Microsoft-Antispam-Message-Info: MGhuDHv6AUhZG+bOaqHYq5t2TtL2pssH09dVY5hFzp22VVLk2Y/h9/zN0/3ZEQyUOTAGsiCZMMGA3fiqOEdA2utNtCvMXQPKmssA1uOVB5kKM/GDUY16/VFypqpWW2nB4hIBSS36ZJWtMpWSGHVrUDUNIXKDMDkILpnFoK31U6ggZI7G2QvdspPNcM4xFtBL
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1426;
	6:F05kFK8+h7bbSYRRx0dDxp3lqW4BbFdxrblFuf1xzggn/VTUS9diZLkBsk5Yt4IaUknCOUIYc/+Gf0jofI9F6e7K9BBmLQhWTzcItbg2U6hrJWxfm1vPLWqTbbhkYP7FNgHyPzgeNVr0wZz4t3F6l56bjvAT15rR+vjX8jkvyLccnuPtSVcmJnaoUS5WTVEMODXnhCVSL19ioDHb6XiSDcEk//pthRYH2tmlden+NkTK6FXuCDKcPWIfZDrqjmR3dtc6zuhVQ2ylwEg1IdZ0I9L845H4v9Lq+6ZbS2J/AUB7cZoICtXLVhrOV9PclL/Zo94o0mMzxm64jrJCwGUy4qz22P3i4fT0aB13aNuVrEYg0mpJfp6q78Sui/zmMf/v+BIXiq1IR9nDH50HFst9druAYpC9pEJicXHShNiDKR0GNBRlpZSbeMZPp7pJmUZKPgTdg3zL74EPKWw+q3fJoA==;
	5:TMQ63UEfSI782d+9KK0oDqdCWqlrVr5d6q4K7Msr5Ropz7mHe4DGU98iwx5plCQz7VX2xNHofnGg9NdOnLTp/81/Fc7lmAxdTJgCjQlKcL+FFFg2dFM0ZJDB3z9oQP17Tlrso1Tl5pyAkuw+hSaTdyFQeJ1Gy0ExL8YsDmiLDeY=;
	24:ksJY17UJGeKUBsmDWfbJvseNZZD71PSMgKu3QMIUOT6WazZJaBhP1pYrGkOmHvYurzF+4jKX/rAfdyxWkHWrc/aQOrcqcH0wIPgWXU86Dpk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1426;
	7:OugZnQcOho2H5LTPkQmBe+OPRe5WZJG6ZpjG9nSsrD4OJO9AM6/KZ/b3DUMR/Gvh5WbZIUQIvvDUnNh8yqvDmrBlNTrPOC6dWew0GyPUdWrIjiaI/4mGP308JAfPClL1X58w81992cTRyNjZ9Y+dRDiKKTSZTysgx0MVR+TckPqSMKYEApTXIaKq0kUawu1hqvH27L2ftCZaCdF0Z2cKjkZKb7vKMVbleIbpY0q0za19g6sWmL7BhERnKK3QtqXQ
X-MS-Office365-Filtering-Correlation-Id: 55677c2c-c8cd-4d02-88f8-08d5c0da4fe4
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2018 18:23:41.7022 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55677c2c-c8cd-4d02-88f8-08d5c0da4fe4
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1426
Subject: [meta-oe][PATCH 1/2] libgpiod: update to 1.1
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
X-List-Received-Date: Wed, 23 May 2018 23:57:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add native dependency on autoconf-archive as it is now used by the
libgpiod autotools.

Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.0.1.bb | 4 ----
 meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb   | 6 ++++++
 2 files changed, 6 insertions(+), 4 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_1.0.1.bb
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.0.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.0.1.bb
deleted file mode 100644
index 51499fd72..000000000
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.0.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require libgpiod.inc
-
-SRC_URI[md5sum] = "2ca0c3eb17d69e367b6f6a109ca86e41"
-SRC_URI[sha256sum] = "972924195367f5fb045c023d65340c4b7dfc8764499516be446553865208dedc"
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb
new file mode 100644
index 000000000..c2e11ad38
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb
@@ -0,0 +1,6 @@
+require libgpiod.inc
+
+DEPENDS += "autoconf-archive-native"
+
+SRC_URI[md5sum] = "80237a047a9d653a14c5d71e5ce9d641"
+SRC_URI[sha256sum] = "9758466468a7ef3f5e30c182c1303abef6241e665cda4d82a64328a7474838c1"
-- 
2.17.0


