Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A3DD2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 15:14:17 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8687.1768922012738664792
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 07:13:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=huOo3NFu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=2480a5fa71=andreas.schulz2@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K2qNYo3215381
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 15:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S-DKIM-20210427; bh=0B7wYwC2wbfVTijZ
	YyRosa6RpnGiqmrvjoxo7eri2Y4=; b=huOo3NFuSrGoxTcaPj+348q3i3cBp05O
	Zl3/UV7A5opNRGUkdf/kUzpuFFcgjkZ/IlmGNhwpy/2fhm1yMxTjAsnotu3kqpCE
	cENerCcK/bY2dZ/u2vv/yB5JizRkPd9vi5L9fNv87KiTrZnw8EzvY96N1e8OsnAK
	1SJyxYhPqLCvqcQEvrH+Ic38CyUPewfhI1R9JuRjHZAjeq7TvUcHHaCN/e1Pi2iW
	/l89ulvZIT5LCJBISenPCYCzcRfh2Q+z9g8QD5LHdTOjzFnE/IDUgGEPw/Q/pN+a
	gJ7Fy8wr+f1CxKIvL3CAJCB6qscT5blmGGV6ukE7FH18zvYZ3SUeWQ==
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11013039.outbound.protection.outlook.com [40.107.162.39])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4bspw93k5w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 15:13:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dThDqzt1nrBFJJaTbz4xYhkvfJK2BFdvUMzRYWzs8UBE6dtxqOWd68f2DCpvGEwn80XDysYi1gos2uCmarxlRNZd5pELA5cCk02AyHt+MK6DoBf7gdIOpxO5b+HNdWBRpH75Qs5cSby1owI5DgDz9IBnUT7plOBvODSePEfcA89lhnJfOvK+HFgzwrXjId3sV4rHl437F30iBABKOO0oxw0eOjoOPRHa0NX5N5ou2pXrqQAU29QH/mX4BoZLQueA4ZjyvCnatHMRxFj4OIbKmFvIjJA3AdEpAfnEkFgxo0ngApe8Jos/Tr9+y/QZG3O31xAstqRbmNAEI3R3/2yitg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0B7wYwC2wbfVTijZYyRosa6RpnGiqmrvjoxo7eri2Y4=;
 b=olS2zjmgvdk53QzT9BDpBrAAnOxkOp09lqVwu6WE2UThVwjrhc1nt3oWPksfjJonaLCcecR+9AeoGDNmjid/+/q7ILw6ivxvC3XLrs8NVn3lQwP7/o6ZRXTQmQG9ZilszUDbTMJXOJoHrPnk9FsbQmqCdFl9cbk8reeY+OHtNLVlILxgBgP9BYbmC7LscgU4OKN9CXF42LXI+eq4S07KZyEO4Gh8Yre6lR9bHrZLjzhFDS1jHfsaHqtF3qqx1oXrWzJ5+AywzNcfDOzYM7qv9SRgsx6hwJzILm9k8WJqwQAQzD+siv7BxRl4olIGsT94FDLxZ4Z9Q4v0h/RhMc7X9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=karlstorz.com; dmarc=pass action=none
 header.from=karlstorz.com; dkim=pass header.d=karlstorz.com; arc=none
Received: from DU5PR01MB10487.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:51d::7) by GV1PR01MB10890.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:213::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 15:13:24 +0000
Received: from DU5PR01MB10487.eurprd01.prod.exchangelabs.com
 ([fe80::ae47:895c:bbc9:e50a]) by
 DU5PR01MB10487.eurprd01.prod.exchangelabs.com ([fe80::ae47:895c:bbc9:e50a%4])
 with mapi id 15.20.9520.006; Tue, 20 Jan 2026 15:13:24 +0000
From: "Schulz, Andreas - Enabler & Imaging Software"
	<Andreas.Schulz2@karlstorz.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH v2] tumbler: Split plugins into own packages
Thread-Topic: [meta-xfce][PATCH v2] tumbler: Split plugins into own packages
Thread-Index: AQHcih8bswlnSNXKbkmk1SKSdAl0tw==
Date: Tue, 20 Jan 2026 15:13:24 +0000
Message-ID: 
 <DU5PR01MB104877480EADF2A2CB26F10B3A889A@DU5PR01MB10487.eurprd01.prod.exchangelabs.com>
Accept-Language: de-CH, de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
received-spf: Fail (protection.outlook.com: domain of karlstorz.com does not
 designate 62.134.76.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=62.134.76.232; helo=autodiscover.karlstorz.com;
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
x-ms-traffictypediagnostic: DU5PR01MB10487:EE_|GV1PR01MB10890:EE_
x-ms-office365-filtering-correlation-id: 6f52d111-a187-4605-6bd9-08de583674d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?zqrtRLDb3jcSrcLg8/I+i/bWPq2PaOkCoWNPSw8fTChOhEw5F2m2C1hAjUw8?=
 =?us-ascii?Q?KsZMd0ftTsqYEmN0lIzpJq1QE2/fmjKYL7KilaDCDLIG4E/8KUjIiUJVYSOo?=
 =?us-ascii?Q?Wbit1F+rZlY9ecl5/t8U2l7/fXIbEAsnv1StoTUgDhhCtZ3GORo+A7RnT/rg?=
 =?us-ascii?Q?p/7MT05jkfMjfQTnJ0dZaWSQZ4P2vs5dqyYTlmSVZmRo2tDiCziG8OgTL3ZA?=
 =?us-ascii?Q?rntpU15Mw43QBVIUSL7Gt9+dLiBhnafEeTdt4IehcwfORnbiJTXED9kmc+Eh?=
 =?us-ascii?Q?diKI9PM5vjGIOISXpAJ36asWcDIY93FbKSL0mTuBVVh8FEXL0RAjaFuH2M80?=
 =?us-ascii?Q?cg16UNTWp7MvJQ4VyR0ddrhkoMbP2e1Uuw2F8hlHI4lpu4yCjFNNnx3eenqq?=
 =?us-ascii?Q?hmKP5ubi6zcS9Giz0E/XKBkfFOjDxmfGqJxGjpCub14v1IL2ST1L23GBoTOn?=
 =?us-ascii?Q?2mKBDCRs9J/nqXfDbsyB7q44/0FIBcxunzRcEeAFQJa+H0TXXhM9/jadfFGW?=
 =?us-ascii?Q?xc2cnABc0/HgxDh1RbMgYWW+nwrZO/yAxhmNuLrgLgfo5/xBu9SH8ju1E1O/?=
 =?us-ascii?Q?RHEKjmqrJ69R/zm/nYzAU+txgW+U5R7J4QwbQxluobsqeLvJUOxPjdW2sTDV?=
 =?us-ascii?Q?O2oXT1FzmyBGWDMEyd8pI4+jeOHIDlMS+Bp44G6XRkGN1sZjFHC67x9lza7e?=
 =?us-ascii?Q?73BvyxBOu6LFoyggQD2TSEdQywj5SV+tssPUI4Jv+RT6QQ5PHzZjD1nRlBZO?=
 =?us-ascii?Q?FGulI+hQ7YwQbFT+krzwGoWhdHFYlee0sETVnXlApiu39YkBkhCVES8e+arc?=
 =?us-ascii?Q?RUzdV+1zeIayy4awXOn8c7sNkJUTdUj3bg+/epVsPRtljM4+jny4kh+lBGGT?=
 =?us-ascii?Q?0UUIQ9i1JCyvl8rJML21cTyT3xki8xpKV1kYng2ixYFjjm9xXqK4sZf+aIUN?=
 =?us-ascii?Q?Wqb/AQnWPHNuSvyii2xcTqYs87vHYMxd9lr1miwkS0pzXM4AVFaSCnJZCRZf?=
 =?us-ascii?Q?hG4pmGiGFqxe4YtBpOKCinv4GRMjcCwrLuUAN2tYdhJKjUqOHilWPD+3REOL?=
 =?us-ascii?Q?04qioqH2CJw5PVPa2rGYWGkFVqHsxIgcfSko+HuRSmlwapM/1oTub4sgC2aa?=
 =?us-ascii?Q?BJcTx0VR6cceL0C8kO2nmzEWpEA4qcX0X5sd7KCI7+9Cw4iU02b8aCy+2K88?=
 =?us-ascii?Q?EfEiZfRqBhU6pqE5k4Cb6dyeL9v9o57bWi01Lf3Q/+2X8Bj8LbZSZdPFUEs9?=
 =?us-ascii?Q?qGxQEvqfZ+R30vtgXfqndALIhjl1Gamlth1AMZURXyTc7EZqbNPjJhYsVv4u?=
 =?us-ascii?Q?0wEVuEjHi2L0ImVtKqVHBIjFlEyrXdGjdNkqY6L6SXI14UKj0DoNFBXoePWb?=
 =?us-ascii?Q?6Kz8wPEU32gpfWOK+YSMLenkitdfekTCAAllqDXA9eJbd3tt7wMIkMYUjX2V?=
 =?us-ascii?Q?B3ONa6dtAGnKmAz6XqK6ZBZ4SfZl0tDEmi5G4zoR0R6abf2LWJ8GMa4sfz4D?=
 =?us-ascii?Q?gv2lIfuhq0AjFvlE3egq5G1gaQuYo27fJP/9PZnh+oiHyZa+IAV2CMF28cdO?=
 =?us-ascii?Q?XTQunSZ4KRUVEmy+qK4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR01MB10487.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?hLNjl4DK3xCfQL81QIj5vyhsux8LLOsqIaTbeIlxqcPsTF40AreF1g9sIuwc?=
 =?us-ascii?Q?xtUjdPQSPx3kkmIsvweBlYgrnn5A7Xy62J/eRXECl6oV8a6sBMZkrIxLZ73T?=
 =?us-ascii?Q?RUOYqD4ufaWjqsQ8GwrTzYmVOmN1MkqTfLJQgy47JGjXJMTbuJdyXwN1XKpt?=
 =?us-ascii?Q?n6+577lJzPwvQ66j828lGMdeLcPu/5esxR8qlmm4aK2tl4N3nN0vgBVPaGt5?=
 =?us-ascii?Q?HJKd/+sRSP2cf9PX+BazYx9JXv/NvRNXVuS6dKcgZ0OQPcfEW+UStTlLBVdW?=
 =?us-ascii?Q?CuUl+wwmW4drcfXc0UTmpS7bXGnP7q1nNPV34QjMNb5w5FzsMbxSr4zBmXRg?=
 =?us-ascii?Q?U5Pe4g1XbbZ1BHRF/qIhmS+yR6wrNC2WDA0Tu47yPgnSjyrJdlfYkIEimXeW?=
 =?us-ascii?Q?Rimk1r/7pw0ksGV/4RVfBKOD3z5fmrYyYUzbp8PZlG5ye7AqoBfqzxIxFrEF?=
 =?us-ascii?Q?sXijj4n3n7FjeZKBm+4lTFFNkkqEIBAy1uXeuD93Z1WhP4bWl0Oy9s91WGf+?=
 =?us-ascii?Q?588OFruX52hOdHjVTraZD3awzCqMNcP5uenrVBzQv1ODzCWojz7hx7hlhEmK?=
 =?us-ascii?Q?wHSfMAQF8DIgEjjUrXUBHTM3X8zlONZ1tNOkz3jWX96UVuO4BZJqxlqSjn11?=
 =?us-ascii?Q?y6z2wrViIiIN8c6k1vJA2QslSoqwXWyQKJ+KWIEUDm3/nK6AyOqsTjxvX9e+?=
 =?us-ascii?Q?Nhf0L8HH/gYKsZpuGgBQlTN/1mq/rIakkzhv3RMTFRTA34T965+hBcL4dBUe?=
 =?us-ascii?Q?JzSPmdbXRDj5d80uG+g/vWdJh6pozhMMWbsJwzAAjkMTDNP2zy3GoW8x0IWJ?=
 =?us-ascii?Q?/fJNjrboor/tgnikE8mGwlygSiglpAdCxGiylYZp7vqFEPmMcJVTiUL4Wfe0?=
 =?us-ascii?Q?ZH5NKPGDQywFi3jJ8Zopwtu1yPuwHNeUJVpSkA6qPxS8h8jOqSVK6yH/I2VW?=
 =?us-ascii?Q?frGLTftxvjiSuUWeboufPUdvoLs8ZMTEHzrFcxSzE898Q8tYOvy2VLTTugj5?=
 =?us-ascii?Q?ELGr2LxQZ0oRnL9aL14ZqvhY3TlAwu7yejLcYYfD30t4NQVvzqiLVThDgQv4?=
 =?us-ascii?Q?2tfkF3BQ5LqJ5DPn0hR5lWGEMa3kScdPk6eMhJfeo1WT+10WDw0plm8zwbG6?=
 =?us-ascii?Q?Giv1DcMn71fCmzS+NXnVC6dFlca1qU9O0nQ8ysIXfBbux7Eue7RNxQKtbwn8?=
 =?us-ascii?Q?ehlahm5HwzS+nI2Gv+9kola1T+3IVWnosQAAqEVKvS/H6JNEEOmzKKbqrHqC?=
 =?us-ascii?Q?Oal/vmcHJeISIxSebf7pHGVgGbfkpObVlSy3J3QPV12mYzROrwvy3Y7SSCK/?=
 =?us-ascii?Q?74rGfsJElvjChLkJMBczZoAAAJl1f0MXH5zx+Z9kzbHH5BLsv/da7vKtIlEm?=
 =?us-ascii?Q?T/Bze5zkK+2nGyFTstf1nRVkQKatk0pGwFmjHFuUxFEhMKdWTFJvawiZ9poJ?=
 =?us-ascii?Q?yLcuHmG4J8rej/QmQwsgmRUVRy2hFWNvRy/BuBGpEO4tka6LAeuVeQPZCIWw?=
 =?us-ascii?Q?qxb0eTgEY+8xwvHxRvQW4vlXZbQBj9HssBdSA39wy0KCK9qby7dA73vN/Rcb?=
 =?us-ascii?Q?zhaWcehT22ptp7tZYVdUECyL4U/it+CZD/dTvfatk8x3D2ruVWAeN5sqq9TK?=
 =?us-ascii?Q?o959tk4VzdSujHg0/yfoF8oiBeP5ICvA1vIZ6YOBbpWqZyGY0FizLOQlBI/B?=
 =?us-ascii?Q?nyn9fZMDkY74aIWMfn97j+j0HwF5XDGPjwfPdIvvCWdcY71cERKcVJ0ZwQeY?=
 =?us-ascii?Q?ES1Wzj+kIHI2Ej0s+gKcYbxvn+zSuGg=3D?=
X-Microsoft-Antispam-Mailbox-Delivery: 
 ucf:0;jmr:0;auth:0;dest:I;ENG:(910005)(944506478)(944626604)(920097)(425001)(930201)(20251009114)(140003);
X-Microsoft-Antispam-Message-Info: 
 GNEUoz8Aai/Fgs5DJDFWVWMXwMK1awk9K6nyI1TbuSi7pvLqP+QAHhCrTKHDMgYX90UpX96nb74BCpik6iTpbOnF3TNW1PVNKulsXvce+1YrdBbQNeQDHg62p/7LlDr30A4JUc4/34QiQQO5DRY3Ug2Vcl3F86tKE7btheH6osYZ/wUVt4DuJmOfcRs4mm11l7B240/dBlaDmEID3gy3/W/FQeoV3LNOTmZh/CpUCec1w1bspou4dGOOMzNmsPPvVUkGBN8orajIr09vTM0+2c+wPdSOaHtVraQbTN6CSDdZ+xwNjZdXbf4QZKAcJS+QUGaaF/JyUDuiTbfoFFsbSxczzBFB5yAV0mg8ZS6d20hC435JXVLo3M+TXgWktyY+vxfaHTsrlo90reRCU1670XuXQ2VecAu7RD+kyXC9mMzSw+XR/1ZR90aAnPK2fpPTgIljhXGbXswWj7tjaDGnDFiMmqGydxulTqIXbK6+L+EEaFBFgmHWfvNrLsegy6iWK5cNbTexnoTz1CzngHgV9if6H2tat7wqR8xviDhpMw09hTdFE8B83j0Tcm4fFMYQgkq19pw8HSfBIviMJ/psJgH0o21T7ipgB2cCMn5BBtQj5JFjBDvlQeobEtQliNAEVddWAIJ/XK98bVBvapbizZSA4WquJOPoufC28GEvNWW5pArfJF2bpsVQAvUdPqPQeQCysSWqszJgpR1P18JBodGzRF7/HnDVeJDC+8/no/sbsdgIHLoRF4qf849nIctRYyCp0iQKzfT+/lqH7nguaIev6JYnRUeEiinNEgiOM44gbAZ2AamXbY+M7KbGc8xMSzuv6yBiaYK9iHaZra/WJA==
MIME-Version: 1.0
X-OriginatorOrg: karlstorz.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TUT-EX01-PV.KSTG.corp
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f52d111-a187-4605-6bd9-08de583674d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 15:13:24.4211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4a0b6f21-e6e1-4ed6-9dcf-e60e7190f648
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FmA9NAMqvUNZcAGUPP2biYlOZvzxiWYkGYYhLFE947BIj27rOgmeV/aUyh7M0YB3ByP7Gs8yXu/FzszadiW943nUwru24jc/LTLL3Lol/aU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR01MB10890
X-Authority-Analysis: v=2.4 cv=W/w1lBWk c=1 sm=1 tr=0 ts=696f9b9a cx=c_pps
 a=6PCtUV3SjW4dSF/fw/j/Nw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=O24Aq5uEAAAA:8
 a=_HOMnFX3k-EYYw7S9VEA:9 a=CjuIK1q_8ugA:10 a=SYBONWESK5muIIdMMRMZ:22
X-Proofpoint-ORIG-GUID: aUiY7KfTAdQ6h17yTRU8aXM6vbEbTbaB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDEyNiBTYWx0ZWRfXwgVw3qm0D1Vg
 ZCZQpKUcWzxhHONPggBEhN+pBIRshmxTWMt4poncPrgEvw/A9FCTcAu1aWg8QHiKnOWApPqFtbs
 E52aoMVxlihCChCXd88vR6fC/XPUhC5jbaBzdon41Xp/cK5+44avmppn3WlTZwLfdNWvMm9bVb7
 9K1tYOuVRgyFP1BqopyN5UDAAiBWQ6lBtPQuG8Tssek21Gqac3sXC+GZRPUiQ/emndCFwk+Fd97
 rJmbGkPqcVDUv9f5OCUuyuVvAG58F16HGWFCXhkG3tWLrQzrRZJ4bCMKVYAUEI9mG87nIQijWSO
 0U6PiixIEXE/uhFRlFhjIEyJSvtyLpIpUGLqfQ7nFKTeNcSPv7CxHHYdEFusJVZVZ+dbTw/qghm
 T1mJEGLGPWxoQWwnJFlerjy1qRqTLgkiCMxDFW2iLLXLlyAXPFxTpeE2S+pEsZHv6KwxJU7LV5k
 GVOA0fN6nLTV5hIfXUg==
X-Proofpoint-GUID: aUiY7KfTAdQ6h17yTRU8aXM6vbEbTbaB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 15:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123672

---
 .../recipes-xfce/tumbler/tumbler_4.20.1.bb    | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb b/meta-xfce/r=
ecipes-xfce/tumbler/tumbler_4.20.1.bb
index c18d719c36..7a01882d57 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://docs.xfce.org/xfce/tumbler/start"
 SECTION =3D "x11/libs"
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"
-DEPENDS =3D "freetype gdk-pixbuf poppler curl xfce4-dev-tools-native libxm=
l2 libgsf libxfce4util"
+DEPENDS =3D "xfce4-dev-tools-native libxfce4util"
=20
 inherit xfce gtk-doc systemd
=20
@@ -12,7 +12,14 @@ SRC_URI[sha256sum] =3D "87b90df8f30144a292d70889e710c861=
9d8b8803f0e1db3280a4293367
 INSANE_SKIP:${PN} =3D "dev-so"
=20
 PACKAGECONFIG ??=3D ""
+PACKAGECONFIG[cover-thumbnailer] =3D "--enable-cover-thumbnailer,--disable=
-cover-thumbnailer,curl gdk-pixbuf"
+PACKAGECONFIG[desktop-thumbnailer] =3D "--enable-desktop-thumbnailer,--dis=
able-desktop-thumbnailer,gdk-pixbuf"
+PACKAGECONFIG[font-thumbnailer] =3D "--enable-font-thumbnailer,--disable-f=
ont-thumbnailer,freetype gdk-pixbuf"
 PACKAGECONFIG[gstreamer-thumbnailer] =3D "--enable-gstreamer-thumbnailer,-=
-disable-gstreamer-thumbnailer,gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[jpeg-thumbnailer] =3D "--enable-jpeg-thumbnailer,--disable-j=
peg-thumbnailer,gdk-pixbuf"
+PACKAGECONFIG[odf-thumbnailer] =3D "--enable-odf-thumbnailer,--disable-odf=
-thumbnailer,gdk-pixbuf libxml2 libgsf"
+PACKAGECONFIG[pixbuf-thumbnailer] =3D "--enable-pixbuf-thumbnailer,--disab=
le-pixbuf-thumbnailer,gdk-pixbuf"
+PACKAGECONFIG[poppler-thumbnailer] =3D "--enable-poppler-thumbnailer,--dis=
able-poppler-thumbnailer,gdk-pixbuf poppler"
=20
 EXTRA_OECONF =3D "GDBUS_CODEGEN=3D${STAGING_BINDIR_NATIVE}/gdbus-codegen"
=20
@@ -22,6 +29,17 @@ do_install:append() {
     ln -sf tumbler-xdg-cache.so ${D}${libdir}/tumbler-1/plugins/cache/tumb=
ler-cache-plugin.so
 }
=20
+PACKAGE_BEFORE_PN +=3D "\
+    ${PN}-cover-thumbnailer \
+    ${PN}-desktop-thumbnailer \
+    ${PN}-font-thumbnailer \
+    ${PN}-gstreamer-thumbnailer \
+    ${PN}-jpeg-thumbnailer \
+    ${PN}-odf-thumbnailer \
+    ${PN}-pixbuf-thumbnailer \
+    ${PN}-poppler-thumbnailer \
+"
+
 FILES:${PN} +=3D "${datadir}/dbus-1/services \
                 ${libdir}/tumbler-1/tumblerd \
                 ${libdir}/tumbler-1/plugins/*.so \
@@ -29,6 +47,15 @@ FILES:${PN} +=3D "${datadir}/dbus-1/services \
                 ${systemd_user_unitdir}/tumblerd.service \
 "
=20
+FILES:${PN}-cover-thumbnailer +=3D "${libdir}/tumbler-1/plugins/tumbler-co=
ver-thumbnailer.so"
+FILES:${PN}-desktop-thumbnailer +=3D "${libdir}/tumbler-1/plugins/tumbler-=
desktop-thumbnailer.so"
+FILES:${PN}-font-thumbnailer +=3D "${libdir}/tumbler-1/plugins/tumbler-fon=
t-thumbnailer.so"
+FILES:${PN}-gstreamer-thumbnailer +=3D "${libdir}/tumbler-1/plugins/tumble=
r-gst-thumbnailer.so"
+FILES:${PN}-jpeg-thumbnailer +=3D "${libdir}/tumbler-1/plugins/tumbler-jpe=
g-thumbnailer.so"
+FILES:${PN}-odf-thumbnailer +=3D "${libdir}/tumbler-1/plugins/tumbler-odf-=
thumbnailer.so"
+FILES:${PN}-pixbuf-thumbnailer +=3D "${libdir}/tumbler-1/plugins/tumbler-p=
ixbuf-thumbnailer.so"
+FILES:${PN}-poppler-thumbnailer +=3D "${libdir}/tumbler-1/plugins/tumbler-=
poppler-thumbnailer.so"
+
 FILES:${PN}-dev +=3D "${libdir}/tumbler-1/plugins/*.la \
                     ${libdir}/tumbler-1/plugins/cache/*.la \
 "
--=20
2.52.0


