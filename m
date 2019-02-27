Return-Path: <danc@opengear.com>
X-Greylist: delayed 47514 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 27 Feb 2019 19:09:48 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-eopbgr750084.outbound.protection.outlook.com [40.107.75.84])
	by mail.openembedded.org (Postfix) with ESMTP id 393707CC05
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 19:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rwoWLGrGFY1+Pw3+/uKP7TC1lUECooR29IuiXjVF7+I=;
	b=fxMCFyxayRcPZFSxlLYVSQFq/ZxBKzBnou4xT6IfHJCUovlr4IZn8yd/6qn8Dun3/JpXhyk46gE4ym3keN+ohQKY1ZKkkQrptxdQNvAI5t9zKUIegq+lk8XY+DW78jOKyMVAKvBIw/Rnz2P6Rz+AnqfxVkEscpaizE+3nI2u3e0=
Received: from DM5PR15MB1338.namprd15.prod.outlook.com (2603:10b6:3:b4::16) by
	DM5PR15MB1338.namprd15.prod.outlook.com (2603:10b6:3:b4::16) with
	TransportReplication id Version 15.20 (Build 1643.15); Wed, 27 Feb 2019
	13:35:01 +0000
Received: from BL0PR1501CA0024.namprd15.prod.outlook.com
	(2603:10b6:207:17::37) by CY4PR15MB1335.namprd15.prod.outlook.com
	(2603:10b6:903:10f::13) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.16;
	Wed, 27 Feb 2019 05:39:42 +0000
Received: from BN3NAM04FT042.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4e::207) by BL0PR1501CA0024.outlook.office365.com
	(2603:10b6:207:17::37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.18 via
	Frontend Transport; Wed, 27 Feb 2019 05:39:42 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	BN3NAM04FT042.mail.protection.outlook.com (10.152.93.52) with Microsoft
	SMTP Server id 15.20.1643.11 via Frontend Transport;
	Wed, 27 Feb 2019 05:39:41 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id 0CB4EDFC4D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 15:39:40 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id E12AD4295AAF; Wed, 27 Feb 2019 15:39:39 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
In-Reply-To: <CAMKF1so7ONWosmZ8ZLoESHnb9tRiWqA2tBYq=SstnoXq9CP0mw@mail.gmail.com>
References: <20190225061757.24421-1-dan.callaghan@opengear.com>
	<CAMKF1so7ONWosmZ8ZLoESHnb9tRiWqA2tBYq=SstnoXq9CP0mw@mail.gmail.com>
Date: Wed, 27 Feb 2019 15:39:32 +1000
Message-ID: <1551245877-sup-2492@galangal.danc.bne.opengear.com>
User-Agent: Sup/0.22.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(136003)(39840400004)(396003)(376002)(2980300002)(448002)(189003)(199004)(316002)(8676002)(42186006)(58126008)(426003)(446003)(11346002)(486006)(106466001)(44832011)(8936002)(36906005)(33964004)(568964002)(21480400003)(476003)(305945005)(126002)(478600001)(7636002)(76176011)(5000100001)(26826003)(966005)(103686004)(26005)(6246003)(5024004)(52956003)(71190400001)(85326001)(84326002)(2906002)(186003)(235185007)(2870700001)(6306002)(336012)(5660300002)(6266002)(6916009)(90966002)(229853002)(356004)(6666004)(246002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR15MB1338;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f829cd3-9a73-41be-e17e-08d69c75f8e2
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
	SRVR:CY4PR15MB1335; 
X-MS-TrafficTypeDiagnostic: DM5PR15MB1338:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR15MB1338;
	20:UP46cC2FBbzWw1Q1ewP1phBThF13XS3qTK90eahmF46C1oPWOW+/jBwODqDBlsm9/IcBnmSDmtcz8sdnOPZORFAFvgZC0hXsvBwVIFdE+GGZ+/V3Wml5puFRLfa0CJToBdmARL0Yjg/NkAiNCOLknJ7582gKBxOxGC8Obr+dhiI=
X-Microsoft-Antispam-PRVS: <DM5PR15MB1338D632D5A0012E49AFEB94B8740@DM5PR15MB1338.namprd15.prod.outlook.com>
X-Forefront-PRVS: 0961DF5286
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjE1TUIxMzM4OzIzOk5uL1ZVV0JVZGRVMlVCT2pFOE0yTWNJc1Z3?=
	=?utf-8?B?Tk5heWZHcnlkd3lGOTg5ZUFBQlUva1RrV2xBVk9iNFJZNHNtWUFQRzJmeENk?=
	=?utf-8?B?SlhYOWt2T0xwMm9xdW9GdEw3SlhHcXl4dFdhUTBaMVJURG92OWxFRGd6T1ds?=
	=?utf-8?B?WVNUcUhkbEFReUt6STJveGxQNjFENy9mYkh1aXcxbkUzbU1rRStCaFdvQjFs?=
	=?utf-8?B?QndaRzFLQ295dm1FSG92cVhTWGpWWHBLOGtlZ3hpalFMOVJkM1RYby80QTlo?=
	=?utf-8?B?MFlOYmRUYWlMbEJWZnFVVXFrdCtCMmJKbTFzcjhmdUxiajRuOXJKR3BzNWdE?=
	=?utf-8?B?RlFjTDlnNVpVSUo0Ti9oSU4zL0Z3a0JqckNTYy8zTEVCTW5zNzVuYUN0aC9V?=
	=?utf-8?B?bVRNZ0dMMHZ1L3BQMzFEWUVHMVUwSjlkbEp2djdwSy9MalZkbUdVRG1rS0U4?=
	=?utf-8?B?MmZmc09WQSt3TlZFcFV2ZnQrNzdOY1VXTjExOWR1eEJEbVd4eFNDUytTN2R4?=
	=?utf-8?B?UUZkVWJpbEo4N3R6ZXNWNkE1UW9oNVZ4SXVSWjMrbUJYUFkvU3hsSjFTaS9W?=
	=?utf-8?B?WHZ4LzAvUmw0YlJwUHdKbS9vQ000eUdCdTltVWNQT1E0OTJJa3BWakt3VSt5?=
	=?utf-8?B?aDJlZjQ5aHB1WUtBM3o2K1lNTGEvVVErSWw4Y3ZtQm53RzMzV2tUbXNUL2lI?=
	=?utf-8?B?bE13MzY5Rnl2UUVuR0VkclF0RFlyanppQjB5VDlJeHhpVkt2N3BSUTcyeENK?=
	=?utf-8?B?ai9xU0JhcG5kMlBUcUhVOHd1NHdaZmVNaVBrVy84ZW9zbzY4elovb3J5OEVz?=
	=?utf-8?B?LzZSOHZwMk9TR0pkWmt3MFJqNmpEYUx4UVllR2FmaEdWRWh4UysrK2sxeFVk?=
	=?utf-8?B?UDdaYUJLc01VdGxNL3FkMFlSMHZEVEM3YVVvME43cWVzRUpwdVA1aTYvNHVE?=
	=?utf-8?B?TTJvZ2I0MlIybXNudHB2S1ZiLzZaczFPTzdPOHA3SnJkZ2YzMmNVNVk1bHVS?=
	=?utf-8?B?UmhhaGN6UHNIYjc0Y3lDNzhxQXVaUWlmbm5UWVJxSUJXRkRGT3VQaFVWbkVE?=
	=?utf-8?B?ak5DcW9HaUJJRTdudFJHSnVCUldRRUJBVVg4cGkxcFM2N0NTS2tmVXl6Y2xp?=
	=?utf-8?B?aW9tTWNxZERMdURyY09Va05LaVhjNkx0STRmYlBCUDJsVTdzQVFPd2o5NjFk?=
	=?utf-8?B?MVlTVktRRE01RXZKalhjOVYwcTZXZzVwRExibDd0cWhYMHNaZXZsVm9FdnVv?=
	=?utf-8?B?TVpFTE0yblVkVTZvZCtEUjJoSjc0NWVGMWpTUCtkcGlaTUh5QWprZWZKSW1y?=
	=?utf-8?B?aThqU0JoR1p0Q29IaktUb1ZVa0Eya0ErSDlRdHEzd3BOSHViL2J2MHpGMEho?=
	=?utf-8?B?U1E1MkpmZjlYbE15aE5US3dsV3pRNTRYNVZCUDlUbDJ4VEE4T3VINThieHF4?=
	=?utf-8?B?Q2pyQ2FZZEFXYjJZV0ZDYnBwdDBTbDFzS3UvN2VZY3FPNnB5SVRNOU9oMVZx?=
	=?utf-8?B?QTZ2TlBYMnVBM1NwVmt1VEgvd2U3T1R2dThSd0VRZnUvWmRvNDNkbkxJMWUz?=
	=?utf-8?B?aENSZ0ovMHJHNXp3bGdQRTdmdzhERTUxL3grRHRiblI4RnRYMGQ0dGR5Zmp5?=
	=?utf-8?B?N3ZVamlDVGc3TTQ5MEkrMUkzeTlGK2NrU1QvcWFMZVVZZGdJclNTQmVnPT0=?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: A1Susky9tERNIsESkAN7Tm5J6bRCpLGfzvY3t0ery9L4IoBbK/cimfNGoLM9fAPvqAeVHkBL/yqmMqNP3UReynw6e5XCcCyfcOKXv6mOgT8USJnM/7u12OF/mqJJx5xgbNN/nDWrw0oNkhfQwXu6SncJsAqPVAOVEJqAzUhDJgb+KdOq8RlqlSI8BFieY64WK6KGXcHxgnGc5LCcAZX5WT4SKQ7JztTVGs2liO1/ckgw2X7VdIifBKDaMBL68uTnJGp3Y8yMIz7Fvne9k+Ycxy7990BpYQtbNNVVAkDH9I3nNV7Pv+WQYUtDwkraK3/jOKPUAQnj2D4M9ti28JJElbTH2kIreGy16XNP4Wm+WSW5Z/ehvSHJ9Qz8qfw3XoM4GA+uViofjG8hkVx2XgliN6Kh0vKE1eIFqC8GFt8bP8I=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2019 05:39:41.5637 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f829cd3-9a73-41be-e17e-08d69c75f8e2
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR15MB1338
Subject: Re: [meta-networking][PATCH] firewalld: add new recipe
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
X-List-Received-Date: Wed, 27 Feb 2019 19:09:48 -0000
X-Groupsio-MsgNum: 76527
Content-Transfer-Encoding: 8bit
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha256; boundary="=-1551245979-882399-31621-8389-1-="

--=-1551245979-882399-31621-8389-1-=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Excerpts from Khem Raj's message of 2019-02-26 17:36:17 -08:00:
> Fails to build for mips
> https://errors.yoctoproject.org/Errors/Details/230515/

Ah yes. I realised that firewalld needs to be explicitly told the path =

of all the helper programs it wants to use (or told not to use them). =

I will post a v2 patch.

-- =

Dan Callaghan <dan.callaghan@opengear.com>
Software Engineer
Opengear <https://opengear.com/>

--=-1551245979-882399-31621-8389-1-=
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE8/IWiXUxKipVpVyoQuSr4gkXmaQFAlx2IpQACgkQQuSr4gkX
maQbIhAAle+XB8iqiQ3lBd2gwPpJ23zVMZaxZXuUMJkxxKWDmIbfVIB2jzRfyqqt
AgffIh4Os3d9bN7pGnt94WOzoIIJSqHIR3t+tWDB8q/LMx0lkuz8GMUGfOFBZVLP
RKTONbVbq8Z7e+NIa1xGHlQT410xwOWz7ntsHTSnniFKU0XJTrBBGYUWsXoAtXw0
/3AgurLCLEgptauzDuef+RxW6J0P1/3/1DYTO5Ah5z1Dg2nEIX18xks98xPkYC0e
R3pP9BMKvMgk5i6xdxILk63SKRdmnXX2C5hG5J8NNRT18H1zWprK7JCat7hGKl7Q
34WMAR8eiiuXwFXD6YpN8XaYxwlQY8O+VbV5cIfWZSBF7aTG/R2YQ0vy7bZDiLv9
rxMxSavSTo1G/suBetfX+iPbAfRjALpi0tU1iCCaUHWqrYda2qZ0mVF5RWAtlPv5
q8X/RbJrImwEJQrBTA46Oj8jmP8Y3u4gK82Yn/TZv4O6ULRJgzBq1KggCtL3c1iF
LK7WDgau8CdKESq8sUsL89D7l8AFe0ynV/FsLmzdgKYjJPe9IZWAp1KjwXyIY0++
MZNtrVkBT9ny/2tSjVzGzpNjLnaZCHzi/ayssic7rj3PWfb6Fy43TxxDExhTQB1C
+3ylNo9Yy++m3EW3eC/fI/Ncr/8vWNH5QtB5Jzr6GGAV5ZFyTJU=
=zVEU
-----END PGP SIGNATURE-----

--=-1551245979-882399-31621-8389-1-=--
