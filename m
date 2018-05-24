Return-Path: <prvs=675771d81=Alistair.Francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id C2DB374BA7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 17:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1527182883; x=1558718883;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=swyxIP7BFWzy9ZfdwjFQhDLYM0nVRZEx6UsqPur2Kks=;
	b=NEJwcSvcG7FdfPDwC/X6hWu/jyQ3MLA4nqXfDpm1PcIlq+Bjc14dJK9o
	xdDCHKsOldAH4GohWZG5Z8+DGvLzIaBTTYVL3MSr+xYWEMv3KIPiBOIiZ
	VWAYdeQRSMU+XJYz38lvXIb30OSrdlMg4Eniy+WLcKmok5G0fc1+NYpZw
	wNbtfMRgMzcZ8ByhHCQ9prB0yO96qAF25TFXeLMZfN3Szw5oj2DX0HhsF
	ljQfHUlWaiIBNpKeRiJTGFIboV4VKobQMG1i5pLBg/bTg2g0medr7qlJK
	BE4R39R6/PoKxY5WN2eA9H3ibl2NjQro868JFTdVbW4FwofanBkwBJF85 g==;
X-IronPort-AV: E=Sophos;i="5.49,436,1520870400"; d="scan'208";a="80635389"
Received: from mail-sn1nam01lp0114.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([207.46.163.114])
	by ob1.hgst.iphmx.com with ESMTP; 25 May 2018 01:18:31 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6xqu0I7WTe5hLOo62atrQ4awJ/tSPUa9Kw/Tc0qedSw=;
	b=fo/6L8PJuIqjz88Rrq1W+MlZzzMfDeA/IELJspbP303r3jLninQDcjwqml41zRgrJ235J1Oh9XL82X08TXoFbWOLdKbzNlUWTJ0aNfkbYq2o6PYgYzb4P6nONKdlzIQzWeR4LrvaYbnpD9WNH3iWiAKn9nsjQ16ikhmfFJhWHgY=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	BN6PR04MB0387.namprd04.prod.outlook.com (2603:10b6:404:91::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.797.11; Thu, 24 May 2018 17:18:27 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 10:18:12 -0700
Message-Id: <20180524171812.63182-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: CO2PR06CA0059.namprd06.prod.outlook.com
	(2603:10b6:104:3::17) To BN6PR04MB0387.namprd04.prod.outlook.com
	(2603:10b6:404:91::16)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(48565401081)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR04MB0387; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0387;
	3:fDqrfyGcVqbS3BWw89KjauKi81njgCzkE0OMQhyHVbHZx3o1wukuhSZQg29FxNB4BcDrT9fQcIAdRDelZr4Q/A0CHFu/9pD2ML/CPG9Rjbo4C+R+CZwLSe7ndvLC6tcg7it+04gkAdQ4RlEjvc9EUpg0MlStGPzAIJW//j4q7U5rSUmd40HhTEDQgotU+psQ/ANJof9ueDwYB7RkkYNxeJ60DP4EkePiv8JguUDysO5CXws3t1CYXX3kn/zpqCcA;
	25:npREihZro8GfzH7mGENeS0q2r4F5MAaMplYfthLJ38BI4wIekkqqgNckDqt+8N2kju71nQbWMi+Jm80rIXNnbaaXPPKWQ7mVwQ48gnOFyqTve7QD5UfglQWqNT5fURy+R+QR+jJF2793GGdQQRfbPhg/o8+3yAFnDxOTGtRUfIIxHeMRgTnaUUrPVa+p6e0Dbqk4fpEMlGlCRlI75n7vJ0SdybtebkIQk/BL3FZ6iE83rDKQTBon82EsXfezWGJ3TKMlN/3HAd8OiTt3m1eNlxuUn4Dskkcu3UBlutYYIZdzRRE/tNMoCUae+mArAuwlcwz/EzBnSVtiEJroQjjvYA==;
	31:CF+cr37DM2GyTAfhHwDrocbpGpzmSpTsjvAtQjJI5SQww8D0HBrz6lgLVSaUjDisz8k8S/mPz+WPhUxR8gzXbkFQPFijFxp5d12sFMafw/AoLhjn+c3/ndAZcKCeucMAi0lJlAwkWABcCu0RybSPuslXzrTmatt8UDkNiHL8/8TD79GhKmEgZc7fOQsPKi1K6qn3Utu/ebyHWOhu4NMtL2TbcvvLvjPJVos/PUo9rCI=
X-MS-TrafficTypeDiagnostic: BN6PR04MB0387:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0387;
	20:3qsvzckpDhuvSBxBZTUFi7OOHte2JeyNTlikBJdf1bHa39fYVv3Zgpc1Gahfxiu0/M6kb31d9qcc6lJhSEjrSX5MZlOUCki0KJuJ6Cpg0BtKt6kF4G1ESQpfVoG/RLlu84u/o2dDebVE7Xgq4AR/Cm5G61deXk93qMDKZDST4yKXU6o5odHxb+rFTcc0D6NqKPqO0Gpm/OpTUisAhvLOQVcASKM+exYQLyB2FJ1hZGXX7cBT/hPk4aYutN3y3LfZFcqGrY0a3OUI8e/tHrfyhEEKShTjiW+17T+RIfM0rw98f9VqHWTaPZ0B3BV2A1K1ql5N0a/BDP329pZ6+lsj1okvgmjx1Z6yAAgDcckLjKn/fmAxCzUDvDvJNmHSI/udysdm/XPoTSIdS3Ab2kVfPO5LVybNpGQV2CQTvJBYxXHaFi3IrphSR5E5q9pmV2HBaqKfbsWaqf7k3EknIDO9nePCnGSsCohWhj7s6s+CRW/l/MYt62SR3A9/khPeRmR3
X-Microsoft-Antispam-PRVS: <BN6PR04MB0387EFC76459D0C840136366906A0@BN6PR04MB0387.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863)(72170088055959)(166708455590820)(209352067349851)(192374486261705)(131327999870524)(35073007944872)(85827821059158)(788757137089)(21532816269658);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(10201501046)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123564045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:BN6PR04MB0387; BCL:0; PCL:0; RULEID:; SRVR:BN6PR04MB0387; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0387;
	4:a32J47lyBq0yCCuX79HAneEOIBh8uqM1eCbtDTnZMhUteP4FeC4HM41XhkZbtCB3HO2rd7DKwmK3RWRaIFWb8oktvx13eGz95Rq9nkwkI279obcJGgKs7A3/FqBCvdSIw3Kt+0gm0rGtMTeg+RqNDvQYVgP9gCjnDRMxUdRV1NfcBFfs4VrUfVDf3GzPw45IfHKrQGF0H1VbaISQEdsp3ixOZyG4Y7W4xsfkb0ZS5PTuxgKbJyshiGYwkLdE2ZHoIs7S+a6mWrEIN3Ov/7op+Q751WtKN6DJumACtTLvRTu0UQ7aZeHuPSkPrahCpkzPonRwAdVvxaDakB3JXQC/q5RRXTP/Plg2Z/5XEJgscl0tB5sDtUcVZWEU4Ic8bwCFV8N4nOOTEkuDl8ufVknizvJW4Z1NX5tzu8/wJOmPyp7YV5ZSlsFXl+yUKys4GSCBXEMtvhjioKHCJ/KSMMZf/OddWhA5eVIED983lPcov7Ix2qjRolEaVyd8kOGgI0y4lALmpa/Im6C6qSI++bx8rVvKAjZEshcTd3xSOjRRD9ythpjsjuxLKSPWqY1e7ghzefv17TraDyeBqz9t1tJWgDCPcoOO2ircMEJ3u2j9DRo=
X-Forefront-PRVS: 0682FC00E8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(376002)(39380400002)(39860400002)(346002)(396003)(366004)(377424004)(55674003)(189003)(199004)(15594002)(2616005)(10000500002)(956004)(486006)(186003)(476003)(386003)(6506007)(5660300001)(105586002)(26005)(1720100001)(36756003)(6116002)(7110500001)(2361001)(51416003)(1076002)(3846002)(97736004)(44832011)(16526019)(59450400001)(1857600001)(52116002)(2351001)(19273905006)(316002)(48376002)(8936002)(10750500005)(10710500007)(6666003)(2906002)(15650500001)(2420400007)(50226002)(6916009)(86362001)(575784001)(47776003)(50466002)(16586007)(72206003)(66066001)(966005)(551544002)(68736007)(478600001)(6486002)(106356001)(4326008)(39060400002)(53366004)(53376002)(305945005)(53386004)(25786009)(7736002)(5890100001)(53936002)(16200700003)(53946003)(8676002)(81156014)(6306002)(81166006)(6512007)(46800400004)(559001)(569006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR04MB0387;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR04MB0387;
	23:ly18wiBjJ4/PV9jrfUqqdu6zErrAk4xUlNvkVugtc?=
	=?us-ascii?Q?G4mPdQ1fnQph5cVxeHQcpnFZbQhsAoTu8cttt+tbGruGt6IAC5xd1o2rDCW/?=
	=?us-ascii?Q?n5rXsbkVy/aMQlQot5iLNpw+iKd2QusRAtxMHi2QqdI3XufExYWGnZXhTT6Q?=
	=?us-ascii?Q?YgCc1Iksagqany+B30MFBiNSPs8JHJNL8Y3p/ps4vFiqjWSOjHLkotsF3R7M?=
	=?us-ascii?Q?dA60+5RSEv3rPjGIY2di8ds12U8f+izlVKjC7EQ7Wlu73g5DaZFfVlZfMiG1?=
	=?us-ascii?Q?mZFgS8rdzRLOFbDlm0VvH4GJoenu9KrFxBoinHRzUKk6juZHCkwCmodzWmsZ?=
	=?us-ascii?Q?R8S87TdwaYd+QGjd9p3xjjXl7tE5OdBIiVxyx/2I7TDrQ+rAUCMFmsdec11a?=
	=?us-ascii?Q?HfOZ1O2bpC8QmiEV7kLdBMNgFQR6HItvDAKgau82UsmtVnWYy/C5YE/g6zD9?=
	=?us-ascii?Q?Mhl0hXWeSwQiUV9X4tbPECrulrQgNh//mwkVJ+21D5/Ud8mldisHB6EvIyAy?=
	=?us-ascii?Q?+hN4X4+xkL/XZRaTEYc5NIssgjw8tOT6XP7Qi5cSqoeravX/Vqg/7LpHX4Jm?=
	=?us-ascii?Q?mrW76frYef5NgT8+7lBW4YI2CTt7vElxYL9XLO/oBnCD+US5zmpkq109PLiI?=
	=?us-ascii?Q?CKdjdIUO6Zt+Qz378dcERh2cMaHA88GqGzFRSy3RllCwGyzN3m87s36K52X8?=
	=?us-ascii?Q?z7VTNPmsCvDQ7o3ZSqhNfbQ+w63z/leYzV4p+JS+DEIW1GtcWa0SfUvhHv3/?=
	=?us-ascii?Q?Yk5igaS2GPYlZVSY5b2ux4VknoHrhz5EcBBa6xL5uEbQiZhG9o/JhCPuxgH9?=
	=?us-ascii?Q?ShBRppX599nnOy02vGx8/2cSpOb9078hMSZ610dzKUps+BsTLec5rsq+n3Kx?=
	=?us-ascii?Q?dCtrc5tJjQULXcLaToOjFAiOp49NFl2Hy8C6H3P2ud2+OT5bjub+x50Ju7dW?=
	=?us-ascii?Q?zoTrpQLlh6px1NjJr7CZyM7lFx7dXkAhthyrZObdE1dnHqZiKSUkliAtBjYX?=
	=?us-ascii?Q?4hL1eVeBUnPuUdTEMlEjRosSHOeygafl1G/1Wn4qnphDY2za23787OCiSevu?=
	=?us-ascii?Q?n/Ri2W4lkvHBKsIYNVHrkY+Mkn+zAWx6g31XfhTkC22AEyCDTvV7TNs0tXrI?=
	=?us-ascii?Q?b+KEUjDI213OnlUyhXidzxTVwmnr2qjR8sTM6m6B0OOZ5wwfMG1UTXeAGWer?=
	=?us-ascii?Q?Vz9jLMIScvLy9wJ0W847eSN7r3Dm16DLhnJDX9W6jga+bMPSUaAoJlpptfRB?=
	=?us-ascii?Q?OyZQUQGKNoMoQ7spvqEobBq1z1DgaFojPLfcgiHM8MJwa3BRMtaQ07S/TgDU?=
	=?us-ascii?Q?VPlSWrqw/MnFULw0zyESM7SqCyc0+eV1TsoaZm9c4FwXOMGXebraCpCebA4I?=
	=?us-ascii?Q?m7/aHrDrB7yeD3+HzO1dQgYcI4Gv0AV8f4AosgrxxZYT0SYeWmiRfAnhNdpn?=
	=?us-ascii?Q?C/FDI8UZtl34QN1r9CytS+O+qgkJjdalIkux5dZHn+fLWqwy4uE+WiJ0qR35?=
	=?us-ascii?Q?3abSIlTxWt7jb/Nftz8EG9gRwTyk4R1x5sBGkC1EfkosQm+zNGxk5d4hvO4Z?=
	=?us-ascii?Q?lmK2jh+M/t5806TbcbeykrBfLOvUy93pzkfGanaeRehTNlJTPEq17pV5BQIq?=
	=?us-ascii?Q?O2pmAt7WAYKE4ElkwjNbGSKtJqTGpnY825+6YAntEaG9EuogZvpxyqxx96BU?=
	=?us-ascii?Q?bfCSmhBkjYc6gMt1VPEKnHxoePdZU6aHo3uwBfP1ebT6kKbC0sfwQVCRdFP1?=
	=?us-ascii?Q?Sruoe6fdcoCcpo098X1frzTB3bwm4N0d7HtTOOMU5ZAVcY+ucPrjJc0T1mmg?=
	=?us-ascii?Q?wJmNbS3E9nj0lmZFIP3PzFUaQ5l18SuYIKaDvfLMh4+S34Q0xU8P/reCQD5/?=
	=?us-ascii?Q?d6dydzsKt3bDV4B?=
X-Microsoft-Antispam-Message-Info: wy21D3KYVuiNsVNST2SRrgJ7ugztIR+RFBc0C3XogDa/wjHcZxAqUM7UNRlpwXha0IM+occo6PknOXdEyhCdxBERBunJNePINbI9xAt72uzl4wGYstc2h8dc8j6G9qlhuXsmjENysbBlVavmmMhZtuqjAGXx2v8ArinVGH4pFHAuN46emUj9iZpEb7n3czPC
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0387;
	6:3YtUgV8lV3dgk53Akw8ZWPLkNjl6oR+ZehWZBvZpIvAEit5ghCEp8u+J5a3RdOTNFwny3mzPCzGxNF/PpWkEQFJLCWMw5Is0XqdeBYB37jtx11OKqgDl4ChorweeUa9MGjs3BF1Z5YMcKfQGTEjVwbNtEl9wwC7T22yu7ZJ9WIZzXckMS99qyE3mWJ6YhHXswqun8/QKI4qXlobvK2mUhs6oT5T3rGkuX1pBbu3g0KeYqijOWnI22tQUhnx2tzPZKOHgRFysXKRJJGrpqIzX0n3YsYG3/Q0dPP/c+mJbP5+W4fuB4aB81FfjmlpiTlnXlTk1HbJJ5halQW8wEjhE/wjF14vyMH9z1nxCpzcv9MIWt67Y07O8+vck5KOAWdgyXqjSa6dDMhd+7bjy1LbpHFHpRlDWI3aPmN+iKwAq+sZOiuCQ+MvfZ987b7P4YI5iutvcw3yhJ6Fu5dCtT7KpvA==;
	5:r/+x118MYzgUr4ZHPxgtqnPH3kL+kVWD7pbL894l3h16WaKx8qXq7AldtwN6HHyfrKBlXfSoJJFW+9fy5v/Mq+HZJPiCjuzQ9VbCZHcXiTvXa6DVqrUksCTnsSDX2K/zRRfK0yXYM9wxDoANmdVfo8UB4+gk6YrOSoyEY7Nv3vc=;
	24:z8S0EB7ZA1Yk59XrGEUYcdJCOF9eKSKXBBCNt43Gcedv4C4+XNdIugf7bNmt3vamt40DaKXThPiDWNdKG+Xre27pyD25MbBnxcY2dnmG68E=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0387;
	7:lV7h1huh1wUGg8UM8u9n2eLDAYSP937ostWwjyLTV0SC5SAiRQ7YWEPvp1dr6krxCN82bvB8xeu95uToSZKqjnZN+Abf2EmqvvQAlLp83otMVpw4spTgEt2v/faz3WkYBWBcgVyQbF7795LKIazMZrfET1v6BGPdsG4k1y0ROZtqXM5uAWCceDAjl70oyfWrEC7KMoIURf2ygpy0evw8J573v5eU273Cd17/+MO8FDn41fJhdr+AboJr9ICMVNHN;
	20:EmdZ+GMOBpc5P7LKtFXi5SNYBHZhexpCcdJhOujAtZLDm60bf9OLC2FfCklbO53XUfLDUbZI49AI3c8DxhXyHwfVZODKm/K9SnBCu2hSXE+aULYFvCAZnQO6NyyKqZxFfhQ1bYn0/jOk1VrXNAYXLODqkCUH2ULLGX0VSh4fSGI=
X-MS-Office365-Filtering-Correlation-Id: afcffd4c-2d91-4f05-0c17-08d5c19a5d96
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2018 17:18:27.6875 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afcffd4c-2d91-4f05-0c17-08d5c19a5d96
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0387
Cc: alistair23@gmail.com
Subject: [meta-oe] [PATCH V2] redis: Update to 4.0.8
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
X-List-Received-Date: Thu, 24 May 2018 17:28:01 -0000
Content-Type: text/plain

Update redis to the latest 4.0.8 release. This also involves updating
the redis.conf while maintaining some OE specific config options.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
V2:
 - Fix MIPS build failure

 ...Makefile-to-add-symbols-to-staticlib.patch |  19 -
 .../hiredis-use-default-CC-if-it-is-set.patch |  12 +-
 .../redis/redis/oe-use-libc-malloc.patch      |  10 +-
 .../recipes-extended/redis/redis/redis.conf   | 974 ++++++++++++++++--
 .../redis/redis/remove-atomics.patch          |  72 ++
 .../redis/{redis_3.0.2.bb => redis_4.0.8.bb}  |   7 +-
 6 files changed, 956 insertions(+), 138 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/redis/redis/hiredis-update-Makefile-to-add-symbols-to-staticlib.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis/remove-atomics.patch
 rename meta-oe/recipes-extended/redis/{redis_3.0.2.bb => redis_4.0.8.bb} (89%)

diff --git a/meta-oe/recipes-extended/redis/redis/hiredis-update-Makefile-to-add-symbols-to-staticlib.patch b/meta-oe/recipes-extended/redis/redis/hiredis-update-Makefile-to-add-symbols-to-staticlib.patch
deleted file mode 100644
index 2b3b58793..000000000
--- a/meta-oe/recipes-extended/redis/redis/hiredis-update-Makefile-to-add-symbols-to-staticlib.patch
+++ /dev/null
@@ -1,19 +0,0 @@
---- redis-3.0.2/deps/hiredis/Makefile.orig	2016-05-06 19:36:26.179003036 -0700
-+++ redis-3.0.2/deps/hiredis/Makefile	2016-05-06 19:40:15.341340736 -0700
-@@ -25,7 +25,7 @@
- 
- # Fallback to gcc when $CC is not in $PATH.
- CC?=$(shell sh -c 'type $(CC) >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
--OPTIMIZATION?=-O3
-+OPTIMIZATION?=-O2
- WARNINGS=-Wall -W -Wstrict-prototypes -Wwrite-strings
- DEBUG?= -g -ggdb
- REAL_CFLAGS=$(OPTIMIZATION) -fPIC $(CFLAGS) $(WARNINGS) $(DEBUG) $(ARCH)
-@@ -68,6 +68,7 @@
- 
- $(STLIBNAME): $(OBJ)
- 	$(STLIB_MAKE_CMD) $(OBJ)
-+	$(RANLIB) $@
- 
- dynamic: $(DYLIBNAME)
- static: $(STLIBNAME)
diff --git a/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch
index f9f1c0dbd..421f306de 100644
--- a/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch
+++ b/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch
@@ -8,23 +8,23 @@ as CC has spaces in it, just skip it if one was already passed in.
 
 Signed-off-by: Venture Research <tech@ventureresearch.com>
 
-Update to work with 3.0.x
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
+Update to work with 4.0.8
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
 
 ---
  deps/hiredis/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: deps/hiredis/Makefile
-===================================================================
+diff --git a/deps/hiredis/Makefile b/deps/hiredis/Makefile
+index 9a4de836..271c06ba 100644
 --- a/deps/hiredis/Makefile
 +++ b/deps/hiredis/Makefile
-@@ -24,7 +24,7 @@ endef
+@@ -36,7 +36,7 @@ endef
  export REDIS_TEST_CONFIG
  
  # Fallback to gcc when $CC is not in $PATH.
 -CC:=$(shell sh -c 'type $(CC) >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
 +CC?=$(shell sh -c 'type $(CC) >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
+ CXX:=$(shell sh -c 'type $(CXX) >/dev/null 2>/dev/null && echo $(CXX) || echo g++')
  OPTIMIZATION?=-O3
  WARNINGS=-Wall -W -Wstrict-prototypes -Wwrite-strings
- DEBUG?= -g -ggdb
diff --git a/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
index b768a7749..6745f3d0e 100644
--- a/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
+++ b/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
@@ -11,15 +11,15 @@ jemalloc wasn't building correctly.
 
 Signed-off-by: Venture Research <tech@ventureresearch.com>
 
-Update to work with 3.0.x
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
+Update to work with 4.0.8
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
 
 ---
  src/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: src/Makefile
-===================================================================
+diff --git a/src/Makefile b/src/Makefile
+index 86e0b3fe..a810180b 100644
 --- a/src/Makefile
 +++ b/src/Makefile
 @@ -13,7 +13,8 @@
@@ -29,6 +29,6 @@ Index: src/Makefile
 -uname_S := $(shell sh -c 'uname -s 2>/dev/null || echo not')
 +# use fake uname option to force use of generic libc
 +uname_S := "USE_LIBC_MALLOC"
+ uname_M := $(shell sh -c 'uname -m 2>/dev/null || echo not')
  OPTIMIZATION?=-O2
  DEPENDENCY_TARGETS=hiredis linenoise lua
- 
diff --git a/meta-oe/recipes-extended/redis/redis/redis.conf b/meta-oe/recipes-extended/redis/redis/redis.conf
index ab024ad85..75037d6dc 100644
--- a/meta-oe/recipes-extended/redis/redis/redis.conf
+++ b/meta-oe/recipes-extended/redis/redis/redis.conf
@@ -1,4 +1,9 @@
-# Redis configuration file example
+# Redis configuration file example.
+#
+# Note that in order to read the configuration file, Redis must be
+# started with the file path as first argument:
+#
+# ./redis-server /path/to/redis.conf
 
 # Note on units: when memory size is needed, it is possible to specify
 # it in the usual form of 1k 5GB 4M and so forth:
@@ -12,48 +17,160 @@
 #
 # units are case insensitive so 1GB 1Gb 1gB are all the same.
 
-# By default Redis does not run as a daemon. Use 'yes' if you need it.
-# Note that Redis will write a pid file in /var/run/redis.pid when daemonized.
+################################## INCLUDES ###################################
+
+# Include one or more other config files here.  This is useful if you
+# have a standard template that goes to all Redis servers but also need
+# to customize a few per-server settings.  Include files can include
+# other files, so use this wisely.
 #
-# OE: run as a daemon.
+# Notice option "include" won't be rewritten by command "CONFIG REWRITE"
+# from admin or Redis Sentinel. Since Redis always uses the last processed
+# line as value of a configuration directive, you'd better put includes
+# at the beginning of this file to avoid overwriting config change at runtime.
 #
-daemonize yes
+# If instead you are interested in using includes to override configuration
+# options, it is better to use include as the last line.
+#
+# include /path/to/local.conf
+# include /path/to/other.conf
 
-# When running daemonized, Redis writes a pid file in /var/run/redis.pid by
-# default. You can specify a custom pid file location here.
-pidfile /var/run/redis.pid
+################################## MODULES #####################################
+
+# Load modules at startup. If the server is not able to load modules
+# it will abort. It is possible to use multiple loadmodule directives.
+#
+# loadmodule /path/to/my_module.so
+# loadmodule /path/to/other_module.so
+
+################################## NETWORK #####################################
 
-# Accept connections on the specified port, default is 6379.
+# By default, if no "bind" configuration directive is specified, Redis listens
+# for connections from all the network interfaces available on the server.
+# It is possible to listen to just one or multiple selected interfaces using
+# the "bind" configuration directive, followed by one or more IP addresses.
+#
+# Examples:
+#
+# bind 192.168.1.100 10.0.0.1
+# bind 127.0.0.1 ::1
+#
+# ~~~ WARNING ~~~ If the computer running Redis is directly exposed to the
+# internet, binding to all the interfaces is dangerous and will expose the
+# instance to everybody on the internet. So by default we uncomment the
+# following bind directive, that will force Redis to listen only into
+# the IPv4 lookback interface address (this means Redis will be able to
+# accept connections only from clients running into the same computer it
+# is running).
+#
+# IF YOU ARE SURE YOU WANT YOUR INSTANCE TO LISTEN TO ALL THE INTERFACES
+# JUST COMMENT THE FOLLOWING LINE.
+# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+bind 127.0.0.1
+
+# Protected mode is a layer of security protection, in order to avoid that
+# Redis instances left open on the internet are accessed and exploited.
+#
+# When protected mode is on and if:
+#
+# 1) The server is not binding explicitly to a set of addresses using the
+#    "bind" directive.
+# 2) No password is configured.
+#
+# The server only accepts connections from clients connecting from the
+# IPv4 and IPv6 loopback addresses 127.0.0.1 and ::1, and from Unix domain
+# sockets.
+#
+# By default protected mode is enabled. You should disable it only if
+# you are sure you want clients from other hosts to connect to Redis
+# even if no authentication is configured, nor a specific set of interfaces
+# are explicitly listed using the "bind" directive.
+protected-mode yes
+
+# Accept connections on the specified port, default is 6379 (IANA #815344).
 # If port 0 is specified Redis will not listen on a TCP socket.
 port 6379
 
-# If you want you can bind a single interface, if the bind option is not
-# specified all the interfaces will listen for incoming connections.
-#
-bind 127.0.0.1
+# TCP listen() backlog.
+#
+# In high requests-per-second environments you need an high backlog in order
+# to avoid slow clients connections issues. Note that the Linux kernel
+# will silently truncate it to the value of /proc/sys/net/core/somaxconn so
+# make sure to raise both the value of somaxconn and tcp_max_syn_backlog
+# in order to get the desired effect.
+tcp-backlog 511
 
-# Specify the path for the unix socket that will be used to listen for
+# Unix socket.
+#
+# Specify the path for the Unix socket that will be used to listen for
 # incoming connections. There is no default, so Redis will not listen
 # on a unix socket when not specified.
 #
 # unixsocket /tmp/redis.sock
-# unixsocketperm 755
+# unixsocketperm 700
 
 # Close the connection after a client is idle for N seconds (0 to disable)
 timeout 0
 
-# Set server verbosity to 'debug'
-# it can be one of:
+# TCP keepalive.
+#
+# If non-zero, use SO_KEEPALIVE to send TCP ACKs to clients in absence
+# of communication. This is useful for two reasons:
+#
+# 1) Detect dead peers.
+# 2) Take the connection alive from the point of view of network
+#    equipment in the middle.
+#
+# On Linux, the specified value (in seconds) is the period used to send ACKs.
+# Note that to close the connection the double of the time is needed.
+# On other kernels the period depends on the kernel configuration.
+#
+# A reasonable value for this option is 300 seconds, which is the new
+# Redis default starting with Redis 3.2.1.
+tcp-keepalive 300
+
+################################# GENERAL #####################################
+
+# OE: run as a daemon.
+daemonize yes
+
+# If you run Redis from upstart or systemd, Redis can interact with your
+# supervision tree. Options:
+#   supervised no      - no supervision interaction
+#   supervised upstart - signal upstart by putting Redis into SIGSTOP mode
+#   supervised systemd - signal systemd by writing READY=1 to $NOTIFY_SOCKET
+#   supervised auto    - detect upstart or systemd method based on
+#                        UPSTART_JOB or NOTIFY_SOCKET environment variables
+# Note: these supervision methods only signal "process is ready."
+#       They do not enable continuous liveness pings back to your supervisor.
+supervised no
+
+# If a pid file is specified, Redis writes it where specified at startup
+# and removes it at exit.
+#
+# When the server runs non daemonized, no pid file is created if none is
+# specified in the configuration. When the server is daemonized, the pid file
+# is used even if not specified, defaulting to "/var/run/redis.pid".
+#
+# Creating a pid file is best effort: if Redis is not able to create it
+# nothing bad happens, the server will start and run normally.
+
+# When running daemonized, Redis writes a pid file in /var/run/redis.pid by
+# default. You can specify a custom pid file location here.
+pidfile /var/run/redis.pid
+
+# Specify the server verbosity level.
+# This can be one of:
 # debug (a lot of information, useful for development/testing)
 # verbose (many rarely useful info, but not a mess like the debug level)
 # notice (moderately verbose, what you want in production probably)
 # warning (only very important / critical messages are logged)
 loglevel notice
 
-# Specify the log file name. Also 'stdout' can be used to force
+# Specify the log file name. Also the empty string can be used to force
 # Redis to log on the standard output. Note that if you use standard
 # output for logging but daemonize, logs will be sent to /dev/null
-# logfile /var/log/redis.log
+logfile ""
 
 # To enable logging to the system logger, just set 'syslog-enabled' to yes,
 # and optionally update the other syslog parameters to suit your needs.
@@ -62,7 +179,7 @@ syslog-enabled yes
 # Specify the syslog identity.
 syslog-ident redis
 
-# Specify the syslog facility.  Must be USER or between LOCAL0-LOCAL7.
+# Specify the syslog facility. Must be USER or between LOCAL0-LOCAL7.
 # syslog-facility local0
 
 # Set the number of databases. The default database is DB 0, you can select
@@ -70,7 +187,15 @@ syslog-ident redis
 # dbid is a number between 0 and 'databases'-1
 databases 16
 
-################################ SNAPSHOTTING  #################################
+# By default Redis shows an ASCII art logo only when started to log to the
+# standard output and if the standard output is a TTY. Basically this means
+# that normally a logo is displayed only in interactive sessions.
+#
+# However it is possible to force the pre-4.0 behavior and always show a
+# ASCII art logo in startup logs by setting the following option to yes.
+always-show-logo yes
+
+################################ SNAPSHOTTING  ################################
 #
 # Save the DB on disk:
 #
@@ -84,7 +209,7 @@ databases 16
 #   after 300 sec (5 min) if at least 10 keys changed
 #   after 60 sec if at least 10000 keys changed
 #
-#   Note: you can disable saving at all commenting all the "save" lines.
+#   Note: you can disable saving completely by commenting out all "save" lines.
 #
 #   It is also possible to remove all the previously configured save
 #   points by adding a save directive with a single empty string argument
@@ -103,16 +228,16 @@ save 30 1000
 
 # By default Redis will stop accepting writes if RDB snapshots are enabled
 # (at least one save point) and the latest background save failed.
-# This will make the user aware (in an hard way) that data is not persisting
+# This will make the user aware (in a hard way) that data is not persisting
 # on disk properly, otherwise chances are that no one will notice and some
-# distater will happen.
+# disaster will happen.
 #
 # If the background saving process will start working again Redis will
 # automatically allow writes again.
 #
 # However if you have setup your proper monitoring of the Redis server
 # and persistence, you may want to disable this feature so that Redis will
-# continue to work as usually even if there are problems with disk,
+# continue to work as usual even if there are problems with disk,
 # permissions, and so forth.
 stop-writes-on-bgsave-error yes
 
@@ -122,7 +247,7 @@ stop-writes-on-bgsave-error yes
 # the dataset will likely be bigger if you have compressible values or keys.
 rdbcompression yes
 
-# Since verison 5 of RDB a CRC64 checksum is placed at the end of the file.
+# Since version 5 of RDB a CRC64 checksum is placed at the end of the file.
 # This makes the format more resistant to corruption but there is a performance
 # hit to pay (around 10%) when saving and loading RDB files, so you can disable it
 # for maximum performances.
@@ -138,18 +263,27 @@ dbfilename dump.rdb
 #
 # The DB will be written inside this directory, with the filename specified
 # above using the 'dbfilename' configuration directive.
-# 
-# Also the Append Only File will be created inside this directory.
-# 
+#
+# The Append Only File will also be created inside this directory.
+#
 # Note that you must specify a directory here, not a file name.
 dir /var/lib/redis/
 
 ################################# REPLICATION #################################
 
 # Master-Slave replication. Use slaveof to make a Redis instance a copy of
-# another Redis server. Note that the configuration is local to the slave
-# so for example it is possible to configure the slave to save the DB with a
-# different interval, or to listen to another port, and so on.
+# another Redis server. A few things to understand ASAP about Redis replication.
+#
+# 1) Redis replication is asynchronous, but you can configure a master to
+#    stop accepting writes if it appears to be not connected with at least
+#    a given number of slaves.
+# 2) Redis slaves are able to perform a partial resynchronization with the
+#    master if the replication link is lost for a relatively small amount of
+#    time. You may want to configure the replication backlog size (see the next
+#    sections of this file) with a sensible value depending on your needs.
+# 3) Replication is automatic and does not need user intervention. After a
+#    network partition slaves automatically try to reconnect to masters
+#    and resynchronize with them.
 #
 # slaveof <masterip> <masterport>
 
@@ -160,14 +294,14 @@ dir /var/lib/redis/
 #
 # masterauth <master-password>
 
-# When a slave lost the connection with the master, or when the replication
+# When a slave loses its connection with the master, or when the replication
 # is still in progress, the slave can act in two different ways:
 #
 # 1) if slave-serve-stale-data is set to 'yes' (the default) the slave will
 #    still reply to client requests, possibly with out of date data, or the
 #    data set may just be empty if this is the first synchronization.
 #
-# 2) if slave-serve-stale data is set to 'no' the slave will reply with
+# 2) if slave-serve-stale-data is set to 'no' the slave will reply with
 #    an error "SYNC with master in progress" to all the kind of commands
 #    but to INFO and SLAVEOF.
 #
@@ -184,19 +318,65 @@ slave-serve-stale-data yes
 # Note: read only slaves are not designed to be exposed to untrusted clients
 # on the internet. It's just a protection layer against misuse of the instance.
 # Still a read only slave exports by default all the administrative commands
-# such as CONFIG, DEBUG, and so forth. To a limited extend you can improve
+# such as CONFIG, DEBUG, and so forth. To a limited extent you can improve
 # security of read only slaves using 'rename-command' to shadow all the
 # administrative / dangerous commands.
 slave-read-only yes
 
+# Replication SYNC strategy: disk or socket.
+#
+# -------------------------------------------------------
+# WARNING: DISKLESS REPLICATION IS EXPERIMENTAL CURRENTLY
+# -------------------------------------------------------
+#
+# New slaves and reconnecting slaves that are not able to continue the replication
+# process just receiving differences, need to do what is called a "full
+# synchronization". An RDB file is transmitted from the master to the slaves.
+# The transmission can happen in two different ways:
+#
+# 1) Disk-backed: The Redis master creates a new process that writes the RDB
+#                 file on disk. Later the file is transferred by the parent
+#                 process to the slaves incrementally.
+# 2) Diskless: The Redis master creates a new process that directly writes the
+#              RDB file to slave sockets, without touching the disk at all.
+#
+# With disk-backed replication, while the RDB file is generated, more slaves
+# can be queued and served with the RDB file as soon as the current child producing
+# the RDB file finishes its work. With diskless replication instead once
+# the transfer starts, new slaves arriving will be queued and a new transfer
+# will start when the current one terminates.
+#
+# When diskless replication is used, the master waits a configurable amount of
+# time (in seconds) before starting the transfer in the hope that multiple slaves
+# will arrive and the transfer can be parallelized.
+#
+# With slow disks and fast (large bandwidth) networks, diskless replication
+# works better.
+repl-diskless-sync no
+
+# When diskless replication is enabled, it is possible to configure the delay
+# the server waits in order to spawn the child that transfers the RDB via socket
+# to the slaves.
+#
+# This is important since once the transfer starts, it is not possible to serve
+# new slaves arriving, that will be queued for the next RDB transfer, so the server
+# waits a delay in order to let more slaves arrive.
+#
+# The delay is specified in seconds, and by default is 5 seconds. To disable
+# it entirely just set it to 0 seconds and the transfer will start ASAP.
+repl-diskless-sync-delay 5
+
 # Slaves send PINGs to server in a predefined interval. It's possible to change
 # this interval with the repl_ping_slave_period option. The default value is 10
 # seconds.
 #
 # repl-ping-slave-period 10
 
-# The following option sets a timeout for both Bulk transfer I/O timeout and
-# master data or ping response timeout. The default value is 60 seconds.
+# The following option sets the replication timeout for:
+#
+# 1) Bulk transfer I/O during SYNC, from the point of view of slave.
+# 2) Master timeout from the point of view of slaves (data, pings).
+# 3) Slave timeout from the point of view of masters (REPLCONF ACK pings).
 #
 # It is important to make sure that this value is greater than the value
 # specified for repl-ping-slave-period otherwise a timeout will be detected
@@ -204,13 +384,54 @@ slave-read-only yes
 #
 # repl-timeout 60
 
+# Disable TCP_NODELAY on the slave socket after SYNC?
+#
+# If you select "yes" Redis will use a smaller number of TCP packets and
+# less bandwidth to send data to slaves. But this can add a delay for
+# the data to appear on the slave side, up to 40 milliseconds with
+# Linux kernels using a default configuration.
+#
+# If you select "no" the delay for data to appear on the slave side will
+# be reduced but more bandwidth will be used for replication.
+#
+# By default we optimize for low latency, but in very high traffic conditions
+# or when the master and slaves are many hops away, turning this to "yes" may
+# be a good idea.
+repl-disable-tcp-nodelay no
+
+# Set the replication backlog size. The backlog is a buffer that accumulates
+# slave data when slaves are disconnected for some time, so that when a slave
+# wants to reconnect again, often a full resync is not needed, but a partial
+# resync is enough, just passing the portion of data the slave missed while
+# disconnected.
+#
+# The bigger the replication backlog, the longer the time the slave can be
+# disconnected and later be able to perform a partial resynchronization.
+#
+# The backlog is only allocated once there is at least a slave connected.
+#
+# repl-backlog-size 1mb
+
+# After a master has no longer connected slaves for some time, the backlog
+# will be freed. The following option configures the amount of seconds that
+# need to elapse, starting from the time the last slave disconnected, for
+# the backlog buffer to be freed.
+#
+# Note that slaves never free the backlog for timeout, since they may be
+# promoted to masters later, and should be able to correctly "partially
+# resynchronize" with the slaves: hence they should always accumulate backlog.
+#
+# A value of 0 means to never release the backlog.
+#
+# repl-backlog-ttl 3600
+
 # The slave priority is an integer number published by Redis in the INFO output.
 # It is used by Redis Sentinel in order to select a slave to promote into a
 # master if the master is no longer working correctly.
 #
 # A slave with a low priority number is considered better for promotion, so
 # for instance if there are three slaves with priority 10, 100, 25 Sentinel will
-# pick the one wtih priority 10, that is the lowest.
+# pick the one with priority 10, that is the lowest.
 #
 # However a special priority of 0 marks the slave as not able to perform the
 # role of master, so a slave with priority of 0 will never be selected by
@@ -219,6 +440,57 @@ slave-read-only yes
 # By default the priority is 100.
 slave-priority 100
 
+# It is possible for a master to stop accepting writes if there are less than
+# N slaves connected, having a lag less or equal than M seconds.
+#
+# The N slaves need to be in "online" state.
+#
+# The lag in seconds, that must be <= the specified value, is calculated from
+# the last ping received from the slave, that is usually sent every second.
+#
+# This option does not GUARANTEE that N replicas will accept the write, but
+# will limit the window of exposure for lost writes in case not enough slaves
+# are available, to the specified number of seconds.
+#
+# For example to require at least 3 slaves with a lag <= 10 seconds use:
+#
+# min-slaves-to-write 3
+# min-slaves-max-lag 10
+#
+# Setting one or the other to 0 disables the feature.
+#
+# By default min-slaves-to-write is set to 0 (feature disabled) and
+# min-slaves-max-lag is set to 10.
+
+# A Redis master is able to list the address and port of the attached
+# slaves in different ways. For example the "INFO replication" section
+# offers this information, which is used, among other tools, by
+# Redis Sentinel in order to discover slave instances.
+# Another place where this info is available is in the output of the
+# "ROLE" command of a master.
+#
+# The listed IP and address normally reported by a slave is obtained
+# in the following way:
+#
+#   IP: The address is auto detected by checking the peer address
+#   of the socket used by the slave to connect with the master.
+#
+#   Port: The port is communicated by the slave during the replication
+#   handshake, and is normally the port that the slave is using to
+#   list for connections.
+#
+# However when port forwarding or Network Address Translation (NAT) is
+# used, the slave may be actually reachable via different IP and port
+# pairs. The following two options can be used by a slave in order to
+# report to its master a specific set of IP and port, so that both INFO
+# and ROLE will report those values.
+#
+# There is no need to use both the options if you need to override just
+# the port or the IP address.
+#
+# slave-announce-ip 5.5.5.5
+# slave-announce-port 1234
+
 ################################## SECURITY ###################################
 
 # Require clients to issue AUTH <PASSWORD> before processing any other
@@ -227,7 +499,7 @@ slave-priority 100
 #
 # This should stay commented out for backward compatibility and because most
 # people do not need auth (e.g. they run their own servers).
-# 
+#
 # Warning: since Redis is pretty fast an outside user can try up to
 # 150k passwords per second against a good box. This means that you should
 # use a very strong password otherwise it will be very easy to break.
@@ -238,23 +510,26 @@ slave-priority 100
 #
 # It is possible to change the name of dangerous commands in a shared
 # environment. For instance the CONFIG command may be renamed into something
-# of hard to guess so that it will be still available for internal-use
-# tools but not available for general clients.
+# hard to guess so that it will still be available for internal-use tools
+# but not available for general clients.
 #
 # Example:
 #
 # rename-command CONFIG b840fc02d524045429941cc15f59e41cb7be6c52
 #
-# It is also possible to completely kill a command renaming it into
+# It is also possible to completely kill a command by renaming it into
 # an empty string:
 #
 # rename-command CONFIG ""
+#
+# Please note that changing the name of commands that are logged into the
+# AOF file or transmitted to slaves may cause problems.
 
-################################### LIMITS ####################################
+################################### CLIENTS ####################################
 
 # Set the max number of connected clients at the same time. By default
 # this limit is set to 10000 clients, however if the Redis server is not
-# able ot configure the process file limit to allow for the specified limit
+# able to configure the process file limit to allow for the specified limit
 # the max number of allowed clients is set to the current file limit
 # minus 32 (as Redis reserves a few file descriptors for internal uses).
 #
@@ -263,17 +538,19 @@ slave-priority 100
 #
 # maxclients 10000
 
-# Don't use more memory than the specified amount of bytes.
+############################## MEMORY MANAGEMENT ################################
+
+# Set a memory usage limit to the specified amount of bytes.
 # When the memory limit is reached Redis will try to remove keys
-# accordingly to the eviction policy selected (see maxmemmory-policy).
+# according to the eviction policy selected (see maxmemory-policy).
 #
 # If Redis can't remove keys according to the policy, or if the policy is
 # set to 'noeviction', Redis will start to reply with errors to commands
 # that would use more memory, like SET, LPUSH, and so on, and will continue
 # to reply to read-only commands like GET.
 #
-# This option is usually useful when using Redis as an LRU cache, or to set
-# an hard memory limit for an instance (using the 'noeviction' policy).
+# This option is usually useful when using Redis as an LRU or LFU cache, or to
+# set a hard memory limit for an instance (using the 'noeviction' policy).
 #
 # WARNING: If you have slaves attached to an instance with maxmemory on,
 # the size of the output buffers needed to feed the slaves are subtracted
@@ -289,19 +566,27 @@ slave-priority 100
 # maxmemory <bytes>
 
 # MAXMEMORY POLICY: how Redis will select what to remove when maxmemory
-# is reached? You can select among five behavior:
-# 
-# volatile-lru -> remove the key with an expire set using an LRU algorithm
-# allkeys-lru -> remove any key accordingly to the LRU algorithm
-# volatile-random -> remove a random key with an expire set
-# allkeys-random -> remove a random key, any key
-# volatile-ttl -> remove the key with the nearest expire time (minor TTL)
-# noeviction -> don't expire at all, just return an error on write operations
-# 
-# Note: with all the kind of policies, Redis will return an error on write
-#       operations, when there are not suitable keys for eviction.
-#
-#       At the date of writing this commands are: set setnx setex append
+# is reached. You can select among five behaviors:
+#
+# volatile-lru -> Evict using approximated LRU among the keys with an expire set.
+# allkeys-lru -> Evict any key using approximated LRU.
+# volatile-lfu -> Evict using approximated LFU among the keys with an expire set.
+# allkeys-lfu -> Evict any key using approximated LFU.
+# volatile-random -> Remove a random key among the ones with an expire set.
+# allkeys-random -> Remove a random key, any key.
+# volatile-ttl -> Remove the key with the nearest expire time (minor TTL)
+# noeviction -> Don't evict anything, just return an error on write operations.
+#
+# LRU means Least Recently Used
+# LFU means Least Frequently Used
+#
+# Both LRU, LFU and volatile-ttl are implemented using approximated
+# randomized algorithms.
+#
+# Note: with any of the above policies, Redis will return an error on write
+#       operations, when there are no suitable keys for eviction.
+#
+#       At the date of writing these commands are: set setnx setex append
 #       incr decr rpush lpush rpushx lpushx linsert lset rpoplpush sadd
 #       sinter sinterstore sunion sunionstore sdiff sdiffstore zadd zincrby
 #       zunionstore zinterstore hset hsetnx hmset hincrby incrby decrby
@@ -309,15 +594,67 @@ slave-priority 100
 #
 # The default is:
 #
-# maxmemory-policy volatile-lru
+# maxmemory-policy noeviction
 
-# LRU and minimal TTL algorithms are not precise algorithms but approximated
-# algorithms (in order to save memory), so you can select as well the sample
-# size to check. For instance for default Redis will check three keys and
-# pick the one that was used less recently, you can change the sample size
-# using the following configuration directive.
+# LRU, LFU and minimal TTL algorithms are not precise algorithms but approximated
+# algorithms (in order to save memory), so you can tune it for speed or
+# accuracy. For default Redis will check five keys and pick the one that was
+# used less recently, you can change the sample size using the following
+# configuration directive.
+#
+# The default of 5 produces good enough results. 10 Approximates very closely
+# true LRU but costs more CPU. 3 is faster but not very accurate.
 #
-# maxmemory-samples 3
+# maxmemory-samples 5
+
+############################# LAZY FREEING ####################################
+
+# Redis has two primitives to delete keys. One is called DEL and is a blocking
+# deletion of the object. It means that the server stops processing new commands
+# in order to reclaim all the memory associated with an object in a synchronous
+# way. If the key deleted is associated with a small object, the time needed
+# in order to execute the DEL command is very small and comparable to most other
+# O(1) or O(log_N) commands in Redis. However if the key is associated with an
+# aggregated value containing millions of elements, the server can block for
+# a long time (even seconds) in order to complete the operation.
+#
+# For the above reasons Redis also offers non blocking deletion primitives
+# such as UNLINK (non blocking DEL) and the ASYNC option of FLUSHALL and
+# FLUSHDB commands, in order to reclaim memory in background. Those commands
+# are executed in constant time. Another thread will incrementally free the
+# object in the background as fast as possible.
+#
+# DEL, UNLINK and ASYNC option of FLUSHALL and FLUSHDB are user-controlled.
+# It's up to the design of the application to understand when it is a good
+# idea to use one or the other. However the Redis server sometimes has to
+# delete keys or flush the whole database as a side effect of other operations.
+# Specifically Redis deletes objects independently of a user call in the
+# following scenarios:
+#
+# 1) On eviction, because of the maxmemory and maxmemory policy configurations,
+#    in order to make room for new data, without going over the specified
+#    memory limit.
+# 2) Because of expire: when a key with an associated time to live (see the
+#    EXPIRE command) must be deleted from memory.
+# 3) Because of a side effect of a command that stores data on a key that may
+#    already exist. For example the RENAME command may delete the old key
+#    content when it is replaced with another one. Similarly SUNIONSTORE
+#    or SORT with STORE option may delete existing keys. The SET command
+#    itself removes any old content of the specified key in order to replace
+#    it with the specified string.
+# 4) During replication, when a slave performs a full resynchronization with
+#    its master, the content of the whole database is removed in order to
+#    load the RDB file just transfered.
+#
+# In all the above cases the default is to delete objects in a blocking way,
+# like if DEL was called. However you can configure each case specifically
+# in order to instead release memory in a non-blocking way like if UNLINK
+# was called, using the following configuration directives:
+
+lazyfree-lazy-eviction no
+lazyfree-lazy-expire no
+lazyfree-lazy-server-del no
+slave-lazy-flush no
 
 ############################## APPEND ONLY MODE ###############################
 
@@ -339,24 +676,24 @@ slave-priority 100
 #
 # Please check http://redis.io/topics/persistence for more information.
 
-#
 # OE: changed default to enable this
 appendonly yes
 
 # The name of the append only file (default: "appendonly.aof")
-# appendfilename appendonly.aof
+
+appendfilename "appendonly.aof"
 
 # The fsync() call tells the Operating System to actually write data on disk
-# instead to wait for more data in the output buffer. Some OS will really flush 
+# instead of waiting for more data in the output buffer. Some OS will really flush
 # data on disk, some other OS will just try to do it ASAP.
 #
 # Redis supports three different modes:
 #
 # no: don't fsync, just let the OS flush the data when it wants. Faster.
-# always: fsync after every write to the append only log . Slow, Safest.
+# always: fsync after every write to the append only log. Slow, Safest.
 # everysec: fsync only one time every second. Compromise.
 #
-# The default is "everysec" that's usually the right compromise between
+# The default is "everysec", as that's usually the right compromise between
 # speed and data safety. It's up to you to understand if you can relax this to
 # "no" that will let the operating system flush the output buffer when
 # it wants, for better performances (but if you can live with the idea of
@@ -384,21 +721,22 @@ appendfsync everysec
 # that will prevent fsync() from being called in the main process while a
 # BGSAVE or BGREWRITEAOF is in progress.
 #
-# This means that while another child is saving the durability of Redis is
-# the same as "appendfsync none", that in practical terms means that it is
-# possible to lost up to 30 seconds of log in the worst scenario (with the
+# This means that while another child is saving, the durability of Redis is
+# the same as "appendfsync none". In practical terms, this means that it is
+# possible to lose up to 30 seconds of log in the worst scenario (with the
 # default Linux settings).
-# 
+#
 # If you have latency problems turn this to "yes". Otherwise leave it as
 # "no" that is the safest pick from the point of view of durability.
+
 no-appendfsync-on-rewrite no
 
 # Automatic rewrite of the append only file.
 # Redis is able to automatically rewrite the log file implicitly calling
-# BGREWRITEAOF when the AOF log size will growth by the specified percentage.
-# 
+# BGREWRITEAOF when the AOF log size grows by the specified percentage.
+#
 # This is how it works: Redis remembers the size of the AOF file after the
-# latest rewrite (or if no rewrite happened since the restart, the size of
+# latest rewrite (if no rewrite has happened since the restart, the size of
 # the AOF at startup is used).
 #
 # This base size is compared to the current size. If the current size is
@@ -413,6 +751,44 @@ no-appendfsync-on-rewrite no
 auto-aof-rewrite-percentage 100
 auto-aof-rewrite-min-size 64mb
 
+# An AOF file may be found to be truncated at the end during the Redis
+# startup process, when the AOF data gets loaded back into memory.
+# This may happen when the system where Redis is running
+# crashes, especially when an ext4 filesystem is mounted without the
+# data=ordered option (however this can't happen when Redis itself
+# crashes or aborts but the operating system still works correctly).
+#
+# Redis can either exit with an error when this happens, or load as much
+# data as possible (the default now) and start if the AOF file is found
+# to be truncated at the end. The following option controls this behavior.
+#
+# If aof-load-truncated is set to yes, a truncated AOF file is loaded and
+# the Redis server starts emitting a log to inform the user of the event.
+# Otherwise if the option is set to no, the server aborts with an error
+# and refuses to start. When the option is set to no, the user requires
+# to fix the AOF file using the "redis-check-aof" utility before to restart
+# the server.
+#
+# Note that if the AOF file will be found to be corrupted in the middle
+# the server will still exit with an error. This option only applies when
+# Redis will try to read more data from the AOF file but not enough bytes
+# will be found.
+aof-load-truncated yes
+
+# When rewriting the AOF file, Redis is able to use an RDB preamble in the
+# AOF file for faster rewrites and recoveries. When this option is turned
+# on the rewritten AOF file is composed of two different stanzas:
+#
+#   [RDB file][AOF tail]
+#
+# When loading Redis recognizes that the AOF file starts with the "REDIS"
+# string and loads the prefixed RDB file, and continues loading the AOF
+# tail.
+#
+# This is currently turned off by default in order to avoid the surprise
+# of a format change, but will at some point be used as the default.
+aof-use-rdb-preamble no
+
 ################################ LUA SCRIPTING  ###############################
 
 # Max execution time of a Lua script in milliseconds.
@@ -421,16 +797,157 @@ auto-aof-rewrite-min-size 64mb
 # still in execution after the maximum allowed time and will start to
 # reply to queries with an error.
 #
-# When a long running script exceed the maximum execution time only the
+# When a long running script exceeds the maximum execution time only the
 # SCRIPT KILL and SHUTDOWN NOSAVE commands are available. The first can be
 # used to stop a script that did not yet called write commands. The second
-# is the only way to shut down the server in the case a write commands was
-# already issue by the script but the user don't want to wait for the natural
+# is the only way to shut down the server in the case a write command was
+# already issued by the script but the user doesn't want to wait for the natural
 # termination of the script.
 #
 # Set it to 0 or a negative value for unlimited execution without warnings.
 lua-time-limit 5000
 
+################################ REDIS CLUSTER  ###############################
+#
+# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+# WARNING EXPERIMENTAL: Redis Cluster is considered to be stable code, however
+# in order to mark it as "mature" we need to wait for a non trivial percentage
+# of users to deploy it in production.
+# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+#
+# Normal Redis instances can't be part of a Redis Cluster; only nodes that are
+# started as cluster nodes can. In order to start a Redis instance as a
+# cluster node enable the cluster support uncommenting the following:
+#
+# cluster-enabled yes
+
+# Every cluster node has a cluster configuration file. This file is not
+# intended to be edited by hand. It is created and updated by Redis nodes.
+# Every Redis Cluster node requires a different cluster configuration file.
+# Make sure that instances running in the same system do not have
+# overlapping cluster configuration file names.
+#
+# cluster-config-file nodes-6379.conf
+
+# Cluster node timeout is the amount of milliseconds a node must be unreachable
+# for it to be considered in failure state.
+# Most other internal time limits are multiple of the node timeout.
+#
+# cluster-node-timeout 15000
+
+# A slave of a failing master will avoid to start a failover if its data
+# looks too old.
+#
+# There is no simple way for a slave to actually have an exact measure of
+# its "data age", so the following two checks are performed:
+#
+# 1) If there are multiple slaves able to failover, they exchange messages
+#    in order to try to give an advantage to the slave with the best
+#    replication offset (more data from the master processed).
+#    Slaves will try to get their rank by offset, and apply to the start
+#    of the failover a delay proportional to their rank.
+#
+# 2) Every single slave computes the time of the last interaction with
+#    its master. This can be the last ping or command received (if the master
+#    is still in the "connected" state), or the time that elapsed since the
+#    disconnection with the master (if the replication link is currently down).
+#    If the last interaction is too old, the slave will not try to failover
+#    at all.
+#
+# The point "2" can be tuned by user. Specifically a slave will not perform
+# the failover if, since the last interaction with the master, the time
+# elapsed is greater than:
+#
+#   (node-timeout * slave-validity-factor) + repl-ping-slave-period
+#
+# So for example if node-timeout is 30 seconds, and the slave-validity-factor
+# is 10, and assuming a default repl-ping-slave-period of 10 seconds, the
+# slave will not try to failover if it was not able to talk with the master
+# for longer than 310 seconds.
+#
+# A large slave-validity-factor may allow slaves with too old data to failover
+# a master, while a too small value may prevent the cluster from being able to
+# elect a slave at all.
+#
+# For maximum availability, it is possible to set the slave-validity-factor
+# to a value of 0, which means, that slaves will always try to failover the
+# master regardless of the last time they interacted with the master.
+# (However they'll always try to apply a delay proportional to their
+# offset rank).
+#
+# Zero is the only value able to guarantee that when all the partitions heal
+# the cluster will always be able to continue.
+#
+# cluster-slave-validity-factor 10
+
+# Cluster slaves are able to migrate to orphaned masters, that are masters
+# that are left without working slaves. This improves the cluster ability
+# to resist to failures as otherwise an orphaned master can't be failed over
+# in case of failure if it has no working slaves.
+#
+# Slaves migrate to orphaned masters only if there are still at least a
+# given number of other working slaves for their old master. This number
+# is the "migration barrier". A migration barrier of 1 means that a slave
+# will migrate only if there is at least 1 other working slave for its master
+# and so forth. It usually reflects the number of slaves you want for every
+# master in your cluster.
+#
+# Default is 1 (slaves migrate only if their masters remain with at least
+# one slave). To disable migration just set it to a very large value.
+# A value of 0 can be set but is useful only for debugging and dangerous
+# in production.
+#
+# cluster-migration-barrier 1
+
+# By default Redis Cluster nodes stop accepting queries if they detect there
+# is at least an hash slot uncovered (no available node is serving it).
+# This way if the cluster is partially down (for example a range of hash slots
+# are no longer covered) all the cluster becomes, eventually, unavailable.
+# It automatically returns available as soon as all the slots are covered again.
+#
+# However sometimes you want the subset of the cluster which is working,
+# to continue to accept queries for the part of the key space that is still
+# covered. In order to do so, just set the cluster-require-full-coverage
+# option to no.
+#
+# cluster-require-full-coverage yes
+
+# In order to setup your cluster make sure to read the documentation
+# available at http://redis.io web site.
+
+########################## CLUSTER DOCKER/NAT support  ########################
+
+# In certain deployments, Redis Cluster nodes address discovery fails, because
+# addresses are NAT-ted or because ports are forwarded (the typical case is
+# Docker and other containers).
+#
+# In order to make Redis Cluster working in such environments, a static
+# configuration where each node knows its public address is needed. The
+# following two options are used for this scope, and are:
+#
+# * cluster-announce-ip
+# * cluster-announce-port
+# * cluster-announce-bus-port
+#
+# Each instruct the node about its address, client port, and cluster message
+# bus port. The information is then published in the header of the bus packets
+# so that other nodes will be able to correctly map the address of the node
+# publishing the information.
+#
+# If the above options are not used, the normal Redis Cluster auto-detection
+# will be used instead.
+#
+# Note that when remapped, the bus port may not be at the fixed offset of
+# clients port + 10000, so you can specify any port and bus-port depending
+# on how they get remapped. If the bus-port is not set, a fixed offset of
+# 10000 will be used as usually.
+#
+# Example:
+#
+# cluster-announce-ip 10.1.1.5
+# cluster-announce-port 6379
+# cluster-announce-bus-port 6380
+
 ################################## SLOW LOG ###################################
 
 # The Redis Slow Log is a system to log queries that exceeded a specified
@@ -439,7 +956,7 @@ lua-time-limit 5000
 # but just the time needed to actually execute the command (this is the only
 # stage of command execution where the thread is blocked and can not serve
 # other requests in the meantime).
-# 
+#
 # You can configure the slow log with two parameters: one tells Redis
 # what is the execution time, in microseconds, to exceed in order for the
 # command to get logged, and the other parameter is the length of the
@@ -455,6 +972,73 @@ slowlog-log-slower-than 10000
 # You can reclaim memory used by the slow log with SLOWLOG RESET.
 slowlog-max-len 128
 
+################################ LATENCY MONITOR ##############################
+
+# The Redis latency monitoring subsystem samples different operations
+# at runtime in order to collect data related to possible sources of
+# latency of a Redis instance.
+#
+# Via the LATENCY command this information is available to the user that can
+# print graphs and obtain reports.
+#
+# The system only logs operations that were performed in a time equal or
+# greater than the amount of milliseconds specified via the
+# latency-monitor-threshold configuration directive. When its value is set
+# to zero, the latency monitor is turned off.
+#
+# By default latency monitoring is disabled since it is mostly not needed
+# if you don't have latency issues, and collecting data has a performance
+# impact, that while very small, can be measured under big load. Latency
+# monitoring can easily be enabled at runtime using the command
+# "CONFIG SET latency-monitor-threshold <milliseconds>" if needed.
+latency-monitor-threshold 0
+
+############################# EVENT NOTIFICATION ##############################
+
+# Redis can notify Pub/Sub clients about events happening in the key space.
+# This feature is documented at http://redis.io/topics/notifications
+#
+# For instance if keyspace events notification is enabled, and a client
+# performs a DEL operation on key "foo" stored in the Database 0, two
+# messages will be published via Pub/Sub:
+#
+# PUBLISH __keyspace@0__:foo del
+# PUBLISH __keyevent@0__:del foo
+#
+# It is possible to select the events that Redis will notify among a set
+# of classes. Every class is identified by a single character:
+#
+#  K     Keyspace events, published with __keyspace@<db>__ prefix.
+#  E     Keyevent events, published with __keyevent@<db>__ prefix.
+#  g     Generic commands (non-type specific) like DEL, EXPIRE, RENAME, ...
+#  $     String commands
+#  l     List commands
+#  s     Set commands
+#  h     Hash commands
+#  z     Sorted set commands
+#  x     Expired events (events generated every time a key expires)
+#  e     Evicted events (events generated when a key is evicted for maxmemory)
+#  A     Alias for g$lshzxe, so that the "AKE" string means all the events.
+#
+#  The "notify-keyspace-events" takes as argument a string that is composed
+#  of zero or multiple characters. The empty string means that notifications
+#  are disabled.
+#
+#  Example: to enable list and generic events, from the point of view of the
+#           event name, use:
+#
+#  notify-keyspace-events Elg
+#
+#  Example 2: to get the stream of the expired keys subscribing to channel
+#             name __keyevent@0__:expired use:
+#
+#  notify-keyspace-events Ex
+#
+#  By default all notifications are disabled because most users don't need
+#  this feature and the feature has some overhead. Note that if you don't
+#  specify at least one of K or E, no events will be delivered.
+notify-keyspace-events ""
+
 ############################### ADVANCED CONFIG ###############################
 
 # Hashes are encoded using a memory efficient data structure when they have a
@@ -463,14 +1047,39 @@ slowlog-max-len 128
 hash-max-ziplist-entries 512
 hash-max-ziplist-value 64
 
-# Similarly to hashes, small lists are also encoded in a special way in order
-# to save a lot of space. The special representation is only used when
-# you are under the following limits:
-list-max-ziplist-entries 512
-list-max-ziplist-value 64
+# Lists are also encoded in a special way to save a lot of space.
+# The number of entries allowed per internal list node can be specified
+# as a fixed maximum size or a maximum number of elements.
+# For a fixed maximum size, use -5 through -1, meaning:
+# -5: max size: 64 Kb  <-- not recommended for normal workloads
+# -4: max size: 32 Kb  <-- not recommended
+# -3: max size: 16 Kb  <-- probably not recommended
+# -2: max size: 8 Kb   <-- good
+# -1: max size: 4 Kb   <-- good
+# Positive numbers mean store up to _exactly_ that number of elements
+# per list node.
+# The highest performing option is usually -2 (8 Kb size) or -1 (4 Kb size),
+# but if your use case is unique, adjust the settings as necessary.
+list-max-ziplist-size -2
+
+# Lists may also be compressed.
+# Compress depth is the number of quicklist ziplist nodes from *each* side of
+# the list to *exclude* from compression.  The head and tail of the list
+# are always uncompressed for fast push/pop operations.  Settings are:
+# 0: disable all list compression
+# 1: depth 1 means "don't start compressing until after 1 node into the list,
+#    going from either the head or tail"
+#    So: [head]->node->node->...->node->[tail]
+#    [head], [tail] will always be uncompressed; inner nodes will compress.
+# 2: [head]->[next]->node->node->...->node->[prev]->[tail]
+#    2 here means: don't compress head or head->next or tail->prev or tail,
+#    but compress all nodes between them.
+# 3: [head]->[next]->[next]->node->node->...->node->[prev]->[prev]->[tail]
+# etc.
+list-compress-depth 0
 
 # Sets have a special encoding in just one case: when a set is composed
-# of just strings that happens to be integers in radix 10 in the range
+# of just strings that happen to be integers in radix 10 in the range
 # of 64 bit signed integers.
 # The following configuration setting sets the limit in the size of the
 # set in order to use this special memory saving encoding.
@@ -482,20 +1091,34 @@ set-max-intset-entries 512
 zset-max-ziplist-entries 128
 zset-max-ziplist-value 64
 
+# HyperLogLog sparse representation bytes limit. The limit includes the
+# 16 bytes header. When an HyperLogLog using the sparse representation crosses
+# this limit, it is converted into the dense representation.
+#
+# A value greater than 16000 is totally useless, since at that point the
+# dense representation is more memory efficient.
+#
+# The suggested value is ~ 3000 in order to have the benefits of
+# the space efficient encoding without slowing down too much PFADD,
+# which is O(N) with the sparse encoding. The value can be raised to
+# ~ 10000 when CPU is not a concern, but space is, and the data set is
+# composed of many HyperLogLogs with cardinality in the 0 - 15000 range.
+hll-sparse-max-bytes 3000
+
 # Active rehashing uses 1 millisecond every 100 milliseconds of CPU time in
 # order to help rehashing the main Redis hash table (the one mapping top-level
 # keys to values). The hash table implementation Redis uses (see dict.c)
-# performs a lazy rehashing: the more operation you run into an hash table
+# performs a lazy rehashing: the more operation you run into a hash table
 # that is rehashing, the more rehashing "steps" are performed, so if the
 # server is idle the rehashing is never complete and some more memory is used
 # by the hash table.
-# 
+#
 # The default is to use this millisecond 10 times every second in order to
-# active rehashing the main dictionaries, freeing memory when possible.
+# actively rehash the main dictionaries, freeing memory when possible.
 #
 # If unsure:
 # use "activerehashing no" if you have hard latency requirements and it is
-# not a good thing in your environment that Redis can reply form time to time
+# not a good thing in your environment that Redis can reply from time to time
 # to queries with 2 milliseconds delay.
 #
 # use "activerehashing yes" if you don't have such hard requirements but
@@ -509,9 +1132,9 @@ activerehashing yes
 #
 # The limit can be set differently for the three different classes of clients:
 #
-# normal -> normal clients
-# slave  -> slave clients and MONITOR clients
-# pubsub -> clients subcribed to at least one pubsub channel or pattern
+# normal -> normal clients including MONITOR clients
+# slave  -> slave clients
+# pubsub -> clients subscribed to at least one pubsub channel or pattern
 #
 # The syntax of every client-output-buffer-limit directive is the following:
 #
@@ -534,17 +1157,158 @@ activerehashing yes
 # Instead there is a default limit for pubsub and slave clients, since
 # subscribers and slaves receive data in a push fashion.
 #
-# Both the hard or the soft limit can be disabled just setting it to zero.
+# Both the hard or the soft limit can be disabled by setting them to zero.
 client-output-buffer-limit normal 0 0 0
 client-output-buffer-limit slave 256mb 64mb 60
 client-output-buffer-limit pubsub 32mb 8mb 60
 
-################################## INCLUDES ###################################
+# Client query buffers accumulate new commands. They are limited to a fixed
+# amount by default in order to avoid that a protocol desynchronization (for
+# instance due to a bug in the client) will lead to unbound memory usage in
+# the query buffer. However you can configure it here if you have very special
+# needs, such us huge multi/exec requests or alike.
+#
+# client-query-buffer-limit 1gb
 
-# Include one or more other config files here.  This is useful if you
-# have a standard template that goes to all Redis server but also need
-# to customize a few per-server settings.  Include files can include
-# other files, so use this wisely.
+# In the Redis protocol, bulk requests, that are, elements representing single
+# strings, are normally limited ot 512 mb. However you can change this limit
+# here.
 #
-# include /path/to/local.conf
-# include /path/to/other.conf
+# proto-max-bulk-len 512mb
+
+# Redis calls an internal function to perform many background tasks, like
+# closing connections of clients in timeout, purging expired keys that are
+# never requested, and so forth.
+#
+# Not all tasks are performed with the same frequency, but Redis checks for
+# tasks to perform according to the specified "hz" value.
+#
+# By default "hz" is set to 10. Raising the value will use more CPU when
+# Redis is idle, but at the same time will make Redis more responsive when
+# there are many keys expiring at the same time, and timeouts may be
+# handled with more precision.
+#
+# The range is between 1 and 500, however a value over 100 is usually not
+# a good idea. Most users should use the default of 10 and raise this up to
+# 100 only in environments where very low latency is required.
+hz 10
+
+# When a child rewrites the AOF file, if the following option is enabled
+# the file will be fsync-ed every 32 MB of data generated. This is useful
+# in order to commit the file to the disk more incrementally and avoid
+# big latency spikes.
+aof-rewrite-incremental-fsync yes
+
+# Redis LFU eviction (see maxmemory setting) can be tuned. However it is a good
+# idea to start with the default settings and only change them after investigating
+# how to improve the performances and how the keys LFU change over time, which
+# is possible to inspect via the OBJECT FREQ command.
+#
+# There are two tunable parameters in the Redis LFU implementation: the
+# counter logarithm factor and the counter decay time. It is important to
+# understand what the two parameters mean before changing them.
+#
+# The LFU counter is just 8 bits per key, it's maximum value is 255, so Redis
+# uses a probabilistic increment with logarithmic behavior. Given the value
+# of the old counter, when a key is accessed, the counter is incremented in
+# this way:
+#
+# 1. A random number R between 0 and 1 is extracted.
+# 2. A probability P is calculated as 1/(old_value*lfu_log_factor+1).
+# 3. The counter is incremented only if R < P.
+#
+# The default lfu-log-factor is 10. This is a table of how the frequency
+# counter changes with a different number of accesses with different
+# logarithmic factors:
+#
+# +--------+------------+------------+------------+------------+------------+
+# | factor | 100 hits   | 1000 hits  | 100K hits  | 1M hits    | 10M hits   |
+# +--------+------------+------------+------------+------------+------------+
+# | 0      | 104        | 255        | 255        | 255        | 255        |
+# +--------+------------+------------+------------+------------+------------+
+# | 1      | 18         | 49         | 255        | 255        | 255        |
+# +--------+------------+------------+------------+------------+------------+
+# | 10     | 10         | 18         | 142        | 255        | 255        |
+# +--------+------------+------------+------------+------------+------------+
+# | 100    | 8          | 11         | 49         | 143        | 255        |
+# +--------+------------+------------+------------+------------+------------+
+#
+# NOTE: The above table was obtained by running the following commands:
+#
+#   redis-benchmark -n 1000000 incr foo
+#   redis-cli object freq foo
+#
+# NOTE 2: The counter initial value is 5 in order to give new objects a chance
+# to accumulate hits.
+#
+# The counter decay time is the time, in minutes, that must elapse in order
+# for the key counter to be divided by two (or decremented if it has a value
+# less <= 10).
+#
+# The default value for the lfu-decay-time is 1. A Special value of 0 means to
+# decay the counter every time it happens to be scanned.
+#
+# lfu-log-factor 10
+# lfu-decay-time 1
+
+########################### ACTIVE DEFRAGMENTATION #######################
+#
+# WARNING THIS FEATURE IS EXPERIMENTAL. However it was stress tested
+# even in production and manually tested by multiple engineers for some
+# time.
+#
+# What is active defragmentation?
+# -------------------------------
+#
+# Active (online) defragmentation allows a Redis server to compact the
+# spaces left between small allocations and deallocations of data in memory,
+# thus allowing to reclaim back memory.
+#
+# Fragmentation is a natural process that happens with every allocator (but
+# less so with Jemalloc, fortunately) and certain workloads. Normally a server
+# restart is needed in order to lower the fragmentation, or at least to flush
+# away all the data and create it again. However thanks to this feature
+# implemented by Oran Agra for Redis 4.0 this process can happen at runtime
+# in an "hot" way, while the server is running.
+#
+# Basically when the fragmentation is over a certain level (see the
+# configuration options below) Redis will start to create new copies of the
+# values in contiguous memory regions by exploiting certain specific Jemalloc
+# features (in order to understand if an allocation is causing fragmentation
+# and to allocate it in a better place), and at the same time, will release the
+# old copies of the data. This process, repeated incrementally for all the keys
+# will cause the fragmentation to drop back to normal values.
+#
+# Important things to understand:
+#
+# 1. This feature is disabled by default, and only works if you compiled Redis
+#    to use the copy of Jemalloc we ship with the source code of Redis.
+#    This is the default with Linux builds.
+#
+# 2. You never need to enable this feature if you don't have fragmentation
+#    issues.
+#
+# 3. Once you experience fragmentation, you can enable this feature when
+#    needed with the command "CONFIG SET activedefrag yes".
+#
+# The configuration parameters are able to fine tune the behavior of the
+# defragmentation process. If you are not sure about what they mean it is
+# a good idea to leave the defaults untouched.
+
+# Enabled active defragmentation
+# activedefrag yes
+
+# Minimum amount of fragmentation waste to start active defrag
+# active-defrag-ignore-bytes 100mb
+
+# Minimum percentage of fragmentation to start active defrag
+# active-defrag-threshold-lower 10
+
+# Maximum percentage of fragmentation at which we use maximum effort
+# active-defrag-threshold-upper 100
+
+# Minimal effort for defrag in CPU percentage
+# active-defrag-cycle-min 25
+
+# Maximal effort for defrag in CPU percentage
+# active-defrag-cycle-max 75
diff --git a/meta-oe/recipes-extended/redis/redis/remove-atomics.patch b/meta-oe/recipes-extended/redis/redis/remove-atomics.patch
new file mode 100644
index 000000000..23b2f2aaf
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/remove-atomics.patch
@@ -0,0 +1,72 @@
+From c486455e0691f9915018b9d8b133200a6c61a3c5 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Thu, 24 May 2018 09:58:42 -0700
+Subject: [PATCH] Remove atomics
+
+Based on this patch:
+https://github.com/patrikx3/lede-redis/blob/master/redis/patches/010-redis.patch
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+---
+ deps/jemalloc/src/pages.c | 22 +---------------------
+ src/atomicvar.h           |  4 ++--
+ 2 files changed, 3 insertions(+), 23 deletions(-)
+
+diff --git a/deps/jemalloc/src/pages.c b/deps/jemalloc/src/pages.c
+index 83a167f6..8e82c78d 100644
+--- a/deps/jemalloc/src/pages.c
++++ b/deps/jemalloc/src/pages.c
+@@ -147,27 +147,7 @@ pages_purge(void *addr, size_t size)
+ {
+ 	bool unzeroed;
+ 
+-#ifdef _WIN32
+-	VirtualAlloc(addr, size, MEM_RESET, PAGE_READWRITE);
+-	unzeroed = true;
+-#elif defined(JEMALLOC_HAVE_MADVISE)
+-#  ifdef JEMALLOC_PURGE_MADVISE_DONTNEED
+-#    define JEMALLOC_MADV_PURGE MADV_DONTNEED
+-#    define JEMALLOC_MADV_ZEROS true
+-#  elif defined(JEMALLOC_PURGE_MADVISE_FREE)
+-#    define JEMALLOC_MADV_PURGE MADV_FREE
+-#    define JEMALLOC_MADV_ZEROS false
+-#  else
+-#    error "No madvise(2) flag defined for purging unused dirty pages."
+-#  endif
+-	int err = madvise(addr, size, JEMALLOC_MADV_PURGE);
+-	unzeroed = (!JEMALLOC_MADV_ZEROS || err != 0);
+-#  undef JEMALLOC_MADV_PURGE
+-#  undef JEMALLOC_MADV_ZEROS
+-#else
+-	/* Last resort no-op. */
+-	unzeroed = true;
+-#endif
++	unzeroed = false;
+ 	return (unzeroed);
+ }
+ 
+diff --git a/src/atomicvar.h b/src/atomicvar.h
+index 84a5bbc5..f9b563c2 100644
+--- a/src/atomicvar.h
++++ b/src/atomicvar.h
+@@ -68,7 +68,7 @@
+  * is reported. */
+ // #define __ATOMIC_VAR_FORCE_SYNC_MACROS
+ 
+-#if !defined(__ATOMIC_VAR_FORCE_SYNC_MACROS) && defined(__ATOMIC_RELAXED) && !defined(__sun) && (!defined(__clang__) || !defined(__APPLE__) || __apple_build_version__ > 4210057)
++#if defined(CONFIG_EDAC_ATOMIC_SCRUB) &&  !defined(__ATOMIC_VAR_FORCE_SYNC_MACROS) && defined(__ATOMIC_RELAXED) && !defined(__sun) && (!defined(__clang__) || !defined(__APPLE__) || __apple_build_version__ > 4210057)
+ /* Implementation using __atomic macros. */
+ 
+ #define atomicIncr(var,count) __atomic_add_fetch(&var,(count),__ATOMIC_RELAXED)
+@@ -82,7 +82,7 @@
+ #define atomicSet(var,value) __atomic_store_n(&var,value,__ATOMIC_RELAXED)
+ #define REDIS_ATOMIC_API "atomic-builtin"
+ 
+-#elif defined(HAVE_ATOMIC)
++#elif defined(CONFIG_EDAC_ATOMIC_SCRUB) && defined(HAVE_ATOMIC)
+ /* Implementation using __sync macros. */
+ 
+ #define atomicIncr(var,count) __sync_add_and_fetch(&var,(count))
+-- 
+2.17.0
+
diff --git a/meta-oe/recipes-extended/redis/redis_3.0.2.bb b/meta-oe/recipes-extended/redis/redis_4.0.8.bb
similarity index 89%
rename from meta-oe/recipes-extended/redis/redis_3.0.2.bb
rename to meta-oe/recipes-extended/redis/redis_4.0.8.bb
index 9395b33b0..b6f37e9db 100644
--- a/meta-oe/recipes-extended/redis/redis_3.0.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_4.0.8.bb
@@ -13,11 +13,12 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://redis.conf \
            file://init-redis-server \
            file://redis.service \
-           file://hiredis-update-Makefile-to-add-symbols-to-staticlib.patch \
 "
 
-SRC_URI[md5sum] = "87be8867447f62524b584813e5a7bd14"
-SRC_URI[sha256sum] = "93e422c0d584623601f89b956045be158889ebe594478a2c24e1bf218495633f"
+SRC_URI_append_mips = " file://remove-atomics.patch"
+
+SRC_URI[md5sum] = "c75b11e4177e153e4dc1d8dd3a6174e4"
+SRC_URI[sha256sum] = "ff0c38b8c156319249fec61e5018cf5b5fe63a65b61690bec798f4c998c232ad"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.17.0


