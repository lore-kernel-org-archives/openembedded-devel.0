Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8333ECE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 10:09:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6332.1763374179928252396
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 02:09:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NieS1zbV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34167910e3=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4JBqN3173304
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 10:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Jjvh4+AfNVyPgvEBXyO+mUHc69BlrTezfwxOoNXi5ho=; b=NieS1zbV9e3y
	4CjYuXoEPpYZNTH+jhXFwkCNEEr1OhbgeajLXaGVJaWGTpr9+akduixCfHKZCM5d
	8OUcSutAosgBPWPVO06IHXgYeCytfxiqsEWYGH4c9fx+KO4atqYA0x321Iq2ynnm
	CzxotytaiPU47cidW0+hU+ZXeg32jE0DDTnvvhUeMC2x+Y0x+m7NYdSTNuCqvGol
	wNTz1Q2pURN8oyaaBPj+M9gweB6fsCdhK16maRdrFSkHed5ng9ngcTJic744LwaB
	IZxuN+gFGBJq/+Z55jeBDKIKN/dtsd72h0yYLs8MGCtPDyq4pDIyWF1g18k1e99O
	6KC3c0KF+Q==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010014.outbound.protection.outlook.com [52.101.46.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeeqwhshy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 10:09:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iS+OGm/sKroGXYWQs5PEw5Q3j1QC6U/hobBvJwvMJzCbGypdw3y2YSfJZ6lVQpeqBPp5jh7d+bXGzwD6UOudthihu116hY/yMu30vge7GIQXuefhiEXoIn49+eBtrxlRCR63VO4dwfMXcmTv9BjgR6GxmWNqhbjOd3FPM0rrRImaYRFfhu0UXXxVB5cynyOMmitpoXUkBeI0haVpzg+kWBZS5w+LxgZx04fXSbZAC5+yayjnTpLYBVZRDqWZYD+DUrSdAAbYVs2NJoDE7T8yQXJFPnGY1k6MMSBjkcYJMXZ3l6xn7UUkbk+waPbq+8HM7exUjq5Xqi6oz5C7bnVItg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jjvh4+AfNVyPgvEBXyO+mUHc69BlrTezfwxOoNXi5ho=;
 b=s2fEHYCDvc3rYNmfaC0sBtd8n7I9/PSKFSNUEuEVohuPp1wETpLul78tfS5ETaivMwAi3lbNQ0kQM5cdx/1z32ZFWi7TNgGSZCFn4K6n9uon4o459eMna+ATV5lOaHPTcQ2itrBhBnSlFFUud7BEvexwTnlYl+W/eH6oXR2Y7vkryRIEGXmliiP2gNYhCQgxGM+wLq2OKVnLbBEMpxgU7MuWzR1P7XLaIw6jVcNv5YIAo9k0OhTkkFWrSJsg1/IcLT51R2x7FYNZ+pjibvLGP9EWomqgRhOVxGjCMJ6xxWXiobXASLSrwcQICNqQ8HJxDLskfw09JOK0nDBbGuxbLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB8296.namprd11.prod.outlook.com (2603:10b6:a03:47a::12)
 by DS0PR11MB6397.namprd11.prod.outlook.com (2603:10b6:8:ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 10:09:34 +0000
Received: from SJ0PR11MB8296.namprd11.prod.outlook.com
 ([fe80::4b77:8603:59d9:7b58]) by SJ0PR11MB8296.namprd11.prod.outlook.com
 ([fe80::4b77:8603:59d9:7b58%5]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 10:09:33 +0000
From: "Kadambathur Subramaniyam, Saravanan"
	<Saravanan.KadambathurSubramaniyam@windriver.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: fix
 CVE-2024-27351
Thread-Topic: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: fix
 CVE-2024-27351
Thread-Index: AQHcV5p55zzJg15n9UqIi48lOeHHZrT2pSR1
Date: Mon, 17 Nov 2025 10:09:33 +0000
Message-ID: 
 <SJ0PR11MB82962F772F6FC58DD0A33C67F1C9A@SJ0PR11MB8296.namprd11.prod.outlook.com>
References: 
 <20251114120343.4109634-1-saravanan.kadambathursubramaniyam@windriver.com>
 <ec309346-e8a9-4996-8e0e-6d5dfb7d4267@gmail.com>
In-Reply-To: <ec309346-e8a9-4996-8e0e-6d5dfb7d4267@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-11-17T10:11:20.463Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB8296:EE_|DS0PR11MB6397:EE_
x-ms-office365-filtering-correlation-id: e656ea79-393c-4d8c-08bd-08de25c1680a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 =?windows-1255?Q?4WJGF+ddKRXFZ07hJ7lCC/8PF2BgW3QHSUOGyo0CuzIK1hOaaqBRy78N?=
 =?windows-1255?Q?8fGtHm4vaQekDErKfrXa3dhDAuDDM6PPrQp8xbfKKc7tnNgV3ntX6Nwe?=
 =?windows-1255?Q?TyerXiPMNlRePbAdkH/7PSRqCm2cCB2evhTDBguc1Rps6pSJ1FcBaduO?=
 =?windows-1255?Q?94C/sdIz8PT6LlSFCJga5IpkGReoOdaax4VRGm0ny4TpssVYmfEX5yNa?=
 =?windows-1255?Q?uSJFUqsbnAqUV8iED3ABcW/PGZj3oCG0eytvePNmzmIEKGFVqfJErDup?=
 =?windows-1255?Q?0wS/roUm5Fz6fscf9nSJjvN6jy0G9x8omDZTJ9RGzAjKaB1KQ29hCbPR?=
 =?windows-1255?Q?e/RtHR1DKuX9kq+JhIPTx32yeQo5WHrNRk1OHWEOKYXUptDNa4T57/1w?=
 =?windows-1255?Q?vC2am50Z4RqJgyKW9bWEu1eI7vT5J9hVatrtyD+KGa2jzamwKJr5fRnN?=
 =?windows-1255?Q?iR4vMONrVrfyMGi2MHXxzdL61cSO0eUoFCtnKwFoZg8MiH9SgUHvMsnJ?=
 =?windows-1255?Q?ndt4wYkGlxdLCPTth/AFnt9taxL5vtZCilXcycliPgK5tTHO9KAkTP1O?=
 =?windows-1255?Q?byPIGuri82UHPyrYeM4fzJPK+ZyuGTiSx1GozMcaFPwkx0ItD7VUM/mr?=
 =?windows-1255?Q?SiIcdGFl30ZVVqfq19By/tL0YAUi4TS2xlqH77bVGYLgR5Cz1OGxhJNd?=
 =?windows-1255?Q?9LtPXLLRoT4YLSW8YAzNKubpEBtgwX00og6h3rfBOzzXsntG3hwI6i9M?=
 =?windows-1255?Q?aHkYHXOtbQjkFTm7Cle90IZ1AV4qTWvVDwWPsDiBDkFGPgRvCaN/xWUq?=
 =?windows-1255?Q?SgUP8vsQF/k9xohNZVKtVB1NqXLPIPIK+zmdb1ur9gqSYNN6AM3y3Mgx?=
 =?windows-1255?Q?+fskNTInwl9rWbPQ3V1LkmUdtUD+pUu6G4BUSC4hOIjIFmxNWGE6xa7j?=
 =?windows-1255?Q?bVuwWSbYENaraHGLqxK46mNLSkhcYOQh4grHzCnjEDIinOuI+8VPkkTY?=
 =?windows-1255?Q?e93fDTdl7eaICBRTdwVjAH3y76dqOYgx+s7fkiifQ7ugUkiZEAWCEaLY?=
 =?windows-1255?Q?9qUfw1GQVFRS1CQKNuT+YoAciu+EfaADFVaHJ7dWVmnQ5/Kn3UT4QYsn?=
 =?windows-1255?Q?8JugDkBuybWWbSZtaF4CEH11y4HUJBlHKlNCleV8VZntQqUOHmP5t7y1?=
 =?windows-1255?Q?eT6gySBkVk2p7i/cOy/POgIBiaaatGmuoxxfHbYufsq2TlfEzi+riQyt?=
 =?windows-1255?Q?zsKZkAd59JzCRFLA5JFaRD1MzjABUa5Rfu8FQh/5NzxRpullTza3cwEP?=
 =?windows-1255?Q?4PXqiKb5qqrqDdGM9y2CZPexS1GxN6LSRAirK9YtR2zs+VS8h/JSS8AU?=
 =?windows-1255?Q?7a+THwyosJGhGBVPd/nIDaDpqan29JlG3HzVlKvGyTDQ8Yjd2MsQDfRP?=
 =?windows-1255?Q?fk3MAIj5/l2j42EPdcKZGSi+jiw7TthRCKvJLNIGPtI+bpfLBnLltc6b?=
 =?windows-1255?Q?k2E39MUf0RFcwzDzFPJUWCi2LvhEclomz0NIfYK3undNUnUcWKcf7ROl?=
 =?windows-1255?Q?Gw8H1GznmV4zhKYcyG6xjbJrF7hlxZirihdZ7GEhC8enfw3JVtHCdLk0?=
 =?windows-1255?Q?WAPe+asE5FOQ/lL5leSJ1KJ8HzO/dYKHDhpCLuRNj22/tA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB8296.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?windows-1255?Q?KUkBgsqCrG6kusc/gwfY11oaHaRRIje8IH2Tmw5aWMUpcNYy1I50NzcN?=
 =?windows-1255?Q?lX4Msd+GszkJt2g/h124Tg1IxzMUXB6M53isSnVVSc8Ujh0huXTzxKTW?=
 =?windows-1255?Q?G71FzvlqYY4Fxtv1oegzr0NRaVm4+EJ9wc4dXQ3rfqcBmle4JGLZyk2z?=
 =?windows-1255?Q?JrEVIqRmPUippMSibmhqpLAOK3lhHFmjqVolFBJvcvE2okRAotoAfBlw?=
 =?windows-1255?Q?finHxq5G9Gg/LEBKubwllMiNw0HWI5fDASd4UuFEFU0a0NIlcdv/Uumt?=
 =?windows-1255?Q?TjxIJj6im58Zq4aJrRb1/mpbUMrJJKEa4JdrmcLYTdLt/WlkqgTOiWGE?=
 =?windows-1255?Q?DjSdday/AguuR4kOKP1vBfOUvZu4vUHfDLfPlwSfN7oDX0+0e6sMdojc?=
 =?windows-1255?Q?gqF+GkXf+flxs3DYZKRhjXxy0wB3bXBsQkU3IisLaGosj8FGjNIUYgDM?=
 =?windows-1255?Q?6f3wibWG3+ZiJX/sN+VMjepSmY3kOVoIE+avmGC6iNlrg9eiDAEq8lKW?=
 =?windows-1255?Q?d8YmWurCHkNTfTREoxeOBQgsZtI7nMCmBInX/djUKeTeoKuMqBGm6QXg?=
 =?windows-1255?Q?LaUv21rjS49nSv73IBsFEfuuRu5SZ0tjJhCqnmAhvwOXBx/tHhtL9sMO?=
 =?windows-1255?Q?nb0/jau/4ch+4l4fW4cWwt7qifN0xQKp4aE3I21+/UJg0kZ6yPpH4ViX?=
 =?windows-1255?Q?Xj6G+dMmGA53obtZzPwlvMZ5xUhiemhjg9jb94lRKWoMRl7AeyOmAn6M?=
 =?windows-1255?Q?l8iwAWdbMw3qDXjySnqm3OaEStMAgoRvmJC+3E5/iu02JxUCuaEkHPKP?=
 =?windows-1255?Q?TzUHxIxbIMLq7MXGDjbAbG3BmMSKjEXB5ULrurH3uSmr/n3efXVdCxoB?=
 =?windows-1255?Q?mU8r7i0q/qfweNo6KR8zag6xZ0WIYqSH6UOJkRJlmgdKzRQbq9vfZ/zO?=
 =?windows-1255?Q?fOBMut8/Rd2ARy+UvnuAq/O260qrhFgjwGqIdtJuzZ46+qn2YLaYavRh?=
 =?windows-1255?Q?H1vVkxXmCCHo2vVA6WglFDJq24zvQ9gw9qubL3Umx25Bowp+uwAjqDZV?=
 =?windows-1255?Q?a7i97RbKX0unpmuVCMSbhx+wZyiWJ8MHIXfoHotawAaK9sDpK2qX0qwZ?=
 =?windows-1255?Q?zfCf4e0khn3z781L66nQaT7qzqaaQYhmf7Sw+g+NGQKkdoZDXIOR0KhV?=
 =?windows-1255?Q?mui9RX+imZLDJh8VSgS2LZTLk3tIST4tiJXNHkYuetX+pXWYPDsYrIkR?=
 =?windows-1255?Q?Yh8mujliorvuCJx4rDQ0h0GjlQ19J/T2G0hOfve0uVM4P3VBe1OxpRYX?=
 =?windows-1255?Q?H/+L2uufUyRPv8qUxXhkpwsNLRPFilDycpN52M9Jw6wMWlmYkz2xg7RF?=
 =?windows-1255?Q?gM+Wr42/HDJHnFsr9r7FVI7wSXMbxndL1VpOKYBloVx6NMHxAYJBXmcH?=
 =?windows-1255?Q?yFiM3UDTBzq6NEMaISSZyIZ21gWFaQzVhstnFXk1GPdCGP7SdAX5YiAq?=
 =?windows-1255?Q?Rq8GAxdaOXqrJcDvLq9iVOA4n10qlyq87ErQEYKQaJVbrUg5SolKfj6m?=
 =?windows-1255?Q?gHzHuIlamtBrb+l9L0edcoqk9s4JoPaTgUTd0U+GXsjjFu3o99ts7cLo?=
 =?windows-1255?Q?JbzrVru0WnPmagWo1zqlYMb/77XQKqTohRWHK2xjRvy9IZRTFol0mTAi?=
 =?windows-1255?Q?Se35/K+fcNbpoCk9mdgYaEFbNJLMxEYvdZjxqOgs0IuKeH/Yg2v0Bwhw?=
 =?windows-1255?Q?0q4UGF4bjALb9UIDxfjRkc8GWwtW11hi0phY33+V?=
Content-Type: text/plain; charset="windows-1255"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB8296.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e656ea79-393c-4d8c-08bd-08de25c1680a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 10:09:33.7459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 300PStRUbqi4e58ZDLkEN0/etXsdA7lYfBKtLS2sUA7mtSEJF9i3UwcOMX6Kwvvw85xU7zMAfkw82kUHpFvSRZrIB38BEScVyVu/DYkS+h8UckjujOj6I/KCojScC+wTWEo6L4pQUK38HETaEmpBKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6397
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA4NSBTYWx0ZWRfXwxC/o8mtvglg
 B1T8V8JyS9c09ftbXyfxmUpOsfKF9k4ERUKzCFQBlVQb9kQ/I+K29QmIPfjjOz5GoX2Ls5FrJTW
 CRHjRRU3uVUwGPOXonqIxaepJRglrJj4wacjAuUbtMl/+nJHiwrZ13ybCFod8vX9aesJ/Oaa44W
 XiUUC9AZfhdWWkaXj9F/fiXsivlYApZAxl3u+PXEdydKsfo5tuzWoBezB0MjWI5f3xGD/G8JLhx
 vXacAmYi5O4JbUFjvB9EJx47fgBdRXK0Wg6bMBRBF31L42SlqOpgnOVLWEId+7+cTZB+smFaltY
 OfCH9+W1WKbUyDDeUhZtynohmaJ7d+hlXNhAWVn4FEACPLjad93tA32m79nGQFODvnMrK2hoUE1
 5oB317cME9srBVNkbfZ9ScRTyiE9Hg==
X-Proofpoint-GUID: 8CCtMlddf6XiLQtrUKZQQ5GpkTiTQbhr
X-Authority-Analysis: v=2.4 cv=OuxCCi/t c=1 sm=1 tr=0 ts=691af462 cx=c_pps
 a=f5Tl6ILaYY6UHEJdjUIuFA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=lNGk4Rm3YwcA:10
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=JUY6PVayAAAA:8 a=pGLkceISAAAA:8
 a=ABa_c-Bno4ORd1YPjVkA:9 a=F99EeyZzka0A:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=32l4pQc4xq9dSJlKNEIc:22
X-Proofpoint-ORIG-GUID: WBrzo_uZnpUbh8ZiVGYPA565ZbE0lQSa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170085
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 10:09:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121776

>I think for the 3.2.x recipe it could be just updated to 3.2.25, which=0A=
>contains this patch (and has some other fixes too).=0A=
Sure, will upgrade to 3.2.25.=0A=
=0A=
On 11/14/25 13:03, Kadambathur Subramaniyam, Saravanan via=0A=
lists.openembedded.org wrote:=0A=
> Reference:=0A=
> https://nvd.nist.gov/vuln/detail/CVE-2024-27351=0A=
>=0A=
> Upstream-patch:=0A=
> https://github.com/django/django/commit/072963e4c4d0b3a7a8c5412bc0c7d27d1=
a9c3521=0A=
>=0A=
> Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com=
>=0A=
> ---=0A=
>  .../CVE-2024-27351.patch                      | 149 ++++++++++++++++++=
=0A=
>  .../CVE-2024-27351.patch                      | 145 +++++++++++++++++=0A=
>  .../python/python3-django_2.2.28.bb           |   1 +=0A=
>  .../python/python3-django_3.2.23.bb           |   1 +=0A=
>  4 files changed, 296 insertions(+)=0A=
>  create mode 100644 meta-python/recipes-devtools/python/python3-django-2.=
2.28/CVE-2024-27351.patch=0A=
>  create mode 100644 meta-python/recipes-devtools/python/python3-django-3.=
2.23/CVE-2024-27351.patch=0A=
>=0A=
> diff --git a/meta-python/recipes-devtools/python/python3-django-2.2.28/CV=
E-2024-27351.patch b/meta-python/recipes-devtools/python/python3-django-2.2=
.28/CVE-2024-27351.patch=0A=
> new file mode 100644=0A=
> index 0000000000..f240b0852e=0A=
> --- /dev/null=0A=
> +++ b/meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2024-=
27351.patch=0A=
> @@ -0,0 +1,149 @@=0A=
> +From 072963e4c4d0b3a7a8c5412bc0c7d27d1a9c3521 Mon Sep 17 00:00:00 2001=
=0A=
> +From: Shai Berger <shai@platonix.com>=0A=
> +Date: Mon, 19 Feb 2024 13:56:37 +0100=0A=
> +Subject: [PATCH] Fixed CVE-2024-27351 -- Prevented potential ReDoS in=0A=
> + Truncator.words().=0A=
> +=0A=
> +Thanks Seokchan Yoon for the report.=0A=
> +=0A=
> +CVE: CVE-2024-27351=0A=
> +=0A=
> +Upstream-Status: Backport=0A=
> +https://github.com/django/django/commit/072963e4c4d0b3a7a8c5412bc0c7d27d=
1a9c3521=0A=
> +=0A=
> +Signed-off-by: Shai Berger <shai@platonix.com>=0A=
> +Co-Authored-By: Mariusz Felisiak <felisiak.mariusz@gmail.com>=0A=
> +Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.co=
m>=0A=
> +---=0A=
> + django/utils/text.py           | 57 ++++++++++++++++++++++++++++++++--=
=0A=
> + docs/releases/2.2.28.txt       |  8 +++++=0A=
> + tests/utils_tests/test_text.py | 26 ++++++++++++++++=0A=
> + 3 files changed, 89 insertions(+), 2 deletions(-)=0A=
> +=0A=
> +diff --git a/django/utils/text.py b/django/utils/text.py=0A=
> +index 06a377b..2c4040e 100644=0A=
> +--- a/django/utils/text.py=0A=
> ++++ b/django/utils/text.py=0A=
> +@@ -15,8 +15,61 @@ def capfirst(x):=0A=
> +     return x and str(x)[0].upper() + str(x)[1:]=0A=
> +=0A=
> +=0A=
> +-# Set up regular expressions=0A=
> +-re_words =3D re.compile(r'<[^>]+?>|([^<>\s]+)', re.S)=0A=
> ++# ----- Begin security-related performance workaround -----=0A=
> ++=0A=
> ++# We used to have, below=0A=
> ++#=0A=
> ++# re_words =3D _lazy_re_compile(r"<[^>]+?>|([^<>\s]+)", re.S)=0A=
> ++#=0A=
> ++# But it was shown that this regex, in the way we use it here, has some=
=0A=
> ++# catastrophic edge-case performance features. Namely, when it is appli=
ed to=0A=
> ++# text with only open brackets "<<<...". The class below provides the s=
ervices=0A=
> ++# and correct answers for the use cases, but in these edge cases does i=
t much=0A=
> ++# faster.=0A=
> ++re_notag =3D _lazy_re_compile(r"([^<>\s]+)", re.S)=0A=
> ++re_prt =3D _lazy_re_compile(r"<|([^<>\s]+)", re.S)=0A=
> ++=0A=
> ++=0A=
> ++class WordsRegex:=0A=
> ++    @staticmethod=0A=
> ++    def search(text, pos):=0A=
> ++        # Look for "<" or a non-tag word.=0A=
> ++        partial =3D re_prt.search(text, pos)=0A=
> ++        if partial is None or partial[1] is not None:=0A=
> ++            return partial=0A=
> ++=0A=
> ++        # "<" was found, look for a closing ">".=0A=
> ++        end =3D text.find(">", partial.end(0))=0A=
> ++        if end < 0:=0A=
> ++            # ">" cannot be found, look for a word.=0A=
> ++            return re_notag.search(text, pos + 1)=0A=
> ++        else:=0A=
> ++            # "<" followed by a ">" was found -- fake a match.=0A=
> ++            end +=3D 1=0A=
> ++            return FakeMatch(text[partial.start(0): end], end)=0A=
> ++=0A=
> ++=0A=
> ++class FakeMatch:=0A=
> ++    __slots__ =3D ["_text", "_end"]=0A=
> ++=0A=
> ++    def end(self, group=3D0):=0A=
> ++        assert group =3D=3D 0, "This specific object takes only group=
=3D0"=0A=
> ++        return self._end=0A=
> ++=0A=
> ++    def __getitem__(self, group):=0A=
> ++        if group =3D=3D 1:=0A=
> ++            return None=0A=
> ++        assert group =3D=3D 0, "This specific object takes only group i=
n {0,1}"=0A=
> ++        return self._text=0A=
> ++=0A=
> ++    def __init__(self, text, end):=0A=
> ++        self._text, self._end =3D text, end=0A=
> ++=0A=
> ++=0A=
> ++# ----- End security-related performance workaround -----=0A=
> ++=0A=
> ++# Set up regular expressions.=0A=
> ++re_words =3D WordsRegex=0A=
> + re_chars =3D re.compile(r'<[^>]+?>|(.)', re.S)=0A=
> + re_tag =3D re.compile(r'<(/)?(\S+?)(?:(\s*/)|\s.*?)?>', re.S)=0A=
> + re_newlines =3D re.compile(r'\r\n|\r')  # Used in normalize_newlines=0A=
> +diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt=0A=
> +index c653cb6..8f79fd0 100644=0A=
> +--- a/docs/releases/2.2.28.txt=0A=
> ++++ b/docs/releases/2.2.28.txt=0A=
> +@@ -6,6 +6,14 @@ Django 2.2.28 release notes=0A=
> +=0A=
> + Django 2.2.28 fixes two security issues with severity "high" in 2.2.27.=
=0A=
> +=0A=
> ++CVE-2024-27351: Potential regular expression denial-of-service in ``dja=
ngo.utils.text.Truncator.words()``=0A=
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=0A=
> ++=0A=
> ++``django.utils.text.Truncator.words()`` method (with ``html=3DTrue``) a=
nd=0A=
> ++:tfilter:`truncatewords_html` template filter were subject to a potenti=
al=0A=
> ++regular expression denial-of-service attack using a suitably crafted st=
ring=0A=
> ++(follow up to :cve:`2019-14232` and :cve:`2023-43665`).=0A=
> ++=0A=
> + CVE-2022-28346: Potential SQL injection in ``QuerySet.annotate()``, ``a=
ggregate()``, and ``extra()``=0A=
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=0A=
> +=0A=
> +diff --git a/tests/utils_tests/test_text.py b/tests/utils_tests/test_tex=
t.py=0A=
> +index cb3063d..7e9f2b3 100644=0A=
> +--- a/tests/utils_tests/test_text.py=0A=
> ++++ b/tests/utils_tests/test_text.py=0A=
> +@@ -156,6 +156,32 @@ class TestUtilsText(SimpleTestCase):=0A=
> +         truncator =3D text.Truncator('<p>I &lt;3 python, what about you=
?</p>')=0A=
> +         self.assertEqual('<p>I &lt;3 python,=85</p>', truncator.words(3=
, html=3DTrue))=0A=
> +=0A=
> ++        # Only open brackets.=0A=
> ++        test =3D "<" * 60_000=0A=
> ++        truncator =3D text.Truncator(test)=0A=
> ++        self.assertEqual(truncator.words(1, html=3DTrue), test)=0A=
> ++=0A=
> ++        # Tags with special chars in attrs.=0A=
> ++        truncator =3D text.Truncator(=0A=
> ++            """<i style=3D"margin: 5%; font: *;">Hello, my dear lady!</=
i>"""=0A=
> ++        )=0A=
> ++        self.assertEqual(=0A=
> ++            """<i style=3D"margin: 5%; font: *;">Hello, my dear=85</i>"=
"",=0A=
> ++            truncator.words(3, html=3DTrue),=0A=
> ++        )=0A=
> ++=0A=
> ++        # Tags with special non-latin chars in attrs.=0A=
> ++        truncator =3D text.Truncator("""<p data-x=3D"=E0">Hello, my dea=
r lady!</p>""")=0A=
> ++        self.assertEqual(=0A=
> ++            """<p data-x=3D"=E0">Hello, my dear=85</p>""",=0A=
> ++            truncator.words(3, html=3DTrue),=0A=
> ++        )=0A=
> ++=0A=
> ++        # Misplaced brackets.=0A=
> ++        truncator =3D text.Truncator("hello >< world")=0A=
> ++        self.assertEqual(truncator.words(1, html=3DTrue), "hello=85")=
=0A=
> ++        self.assertEqual(truncator.words(2, html=3DTrue), "hello >< wor=
ld")=0A=
> ++=0A=
> +     @patch("django.utils.text.Truncator.MAX_LENGTH_HTML", 10_000)=0A=
> +     def test_truncate_words_html_size_limit(self):=0A=
> +         max_len =3D text.Truncator.MAX_LENGTH_HTML=0A=
> +--=0A=
> +2.35.5=0A=
> +=0A=
> diff --git a/meta-python/recipes-devtools/python/python3-django-3.2.23/CV=
E-2024-27351.patch b/meta-python/recipes-devtools/python/python3-django-3.2=
.23/CVE-2024-27351.patch=0A=
> new file mode 100644=0A=
> index 0000000000..1251a41bb5=0A=
> --- /dev/null=0A=
> +++ b/meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2024-=
27351.patch=0A=
> @@ -0,0 +1,145 @@=0A=
> +From 072963e4c4d0b3a7a8c5412bc0c7d27d1a9c3521 Mon Sep 17 00:00:00 2001=
=0A=
> +From: Shai Berger <shai@platonix.com>=0A=
> +Date: Mon, 19 Feb 2024 13:56:37 +0100=0A=
> +Subject: [PATCH] Fixed CVE-2024-27351 -- Prevented potential ReDoS in=0A=
> + Truncator.words().=0A=
> +=0A=
> +Thanks Seokchan Yoon for the report.=0A=
> +=0A=
> +CVE: CVE-2024-27351=0A=
> +=0A=
> +Upstream-Status: Backport=0A=
> +https://github.com/django/django/commit/072963e4c4d0b3a7a8c5412bc0c7d27d=
1a9c3521=0A=
> +=0A=
> +Signed-off-by: Shai Berger <shai@platonix.com>=0A=
> +Co-Authored-By: Mariusz Felisiak <felisiak.mariusz@gmail.com>=0A=
> +Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.co=
m>=0A=
> +---=0A=
> + django/utils/text.py           | 57 ++++++++++++++++++++++++++++++++--=
=0A=
> + docs/releases/3.2.23.txt       |  8 +++++=0A=
> + tests/utils_tests/test_text.py | 26 ++++++++++++++++=0A=
> + 3 files changed, 89 insertions(+), 2 deletions(-)=0A=
> +=0A=
> +diff --git a/django/utils/text.py b/django/utils/text.py=0A=
> +index 83e258f..88da9a2 100644=0A=
> +--- a/django/utils/text.py=0A=
> ++++ b/django/utils/text.py=0A=
> +@@ -18,8 +18,61 @@ def capfirst(x):=0A=
> +     return x and str(x)[0].upper() + str(x)[1:]=0A=
> +=0A=
> +=0A=
> +-# Set up regular expressions=0A=
> +-re_words =3D _lazy_re_compile(r'<[^>]+?>|([^<>\s]+)', re.S)=0A=
> ++# ----- Begin security-related performance workaround -----=0A=
> ++=0A=
> ++# We used to have, below=0A=
> ++#=0A=
> ++# re_words =3D _lazy_re_compile(r"<[^>]+?>|([^<>\s]+)", re.S)=0A=
> ++#=0A=
> ++# But it was shown that this regex, in the way we use it here, has some=
=0A=
> ++# catastrophic edge-case performance features. Namely, when it is appli=
ed to=0A=
> ++# text with only open brackets "<<<...". The class below provides the s=
ervices=0A=
> ++# and correct answers for the use cases, but in these edge cases does i=
t much=0A=
> ++# faster.=0A=
> ++re_notag =3D _lazy_re_compile(r"([^<>\s]+)", re.S)=0A=
> ++re_prt =3D _lazy_re_compile(r"<|([^<>\s]+)", re.S)=0A=
> ++=0A=
> ++=0A=
> ++class WordsRegex:=0A=
> ++    @staticmethod=0A=
> ++    def search(text, pos):=0A=
> ++        # Look for "<" or a non-tag word.=0A=
> ++        partial =3D re_prt.search(text, pos)=0A=
> ++        if partial is None or partial[1] is not None:=0A=
> ++            return partial=0A=
> ++=0A=
> ++        # "<" was found, look for a closing ">".=0A=
> ++        end =3D text.find(">", partial.end(0))=0A=
> ++        if end < 0:=0A=
> ++            # ">" cannot be found, look for a word.=0A=
> ++            return re_notag.search(text, pos + 1)=0A=
> ++        else:=0A=
> ++            # "<" followed by a ">" was found -- fake a match.=0A=
> ++            end +=3D 1=0A=
> ++            return FakeMatch(text[partial.start(0): end], end)=0A=
> ++=0A=
> ++=0A=
> ++class FakeMatch:=0A=
> ++    __slots__ =3D ["_text", "_end"]=0A=
> ++=0A=
> ++    def end(self, group=3D0):=0A=
> ++        assert group =3D=3D 0, "This specific object takes only group=
=3D0"=0A=
> ++        return self._end=0A=
> ++=0A=
> ++    def __getitem__(self, group):=0A=
> ++        if group =3D=3D 1:=0A=
> ++            return None=0A=
> ++        assert group =3D=3D 0, "This specific object takes only group i=
n {0,1}"=0A=
> ++        return self._text=0A=
> ++=0A=
> ++    def __init__(self, text, end):=0A=
> ++        self._text, self._end =3D text, end=0A=
> ++=0A=
> ++=0A=
> ++# ----- End security-related performance workaround -----=0A=
> ++=0A=
> ++# Set up regular expressions.=0A=
> ++re_words =3D WordsRegex=0A=
> + re_chars =3D _lazy_re_compile(r'<[^>]+?>|(.)', re.S)=0A=
> + re_tag =3D _lazy_re_compile(r'<(/)?(\S+?)(?:(\s*/)|\s.*?)?>', re.S)=0A=
> + re_newlines =3D _lazy_re_compile(r'\r\n|\r')  # Used in normalize_newli=
nes=0A=
> +diff --git a/docs/releases/3.2.23.txt b/docs/releases/3.2.23.txt=0A=
> +index ba23d11..dd9d68a 100644=0A=
> +--- a/docs/releases/3.2.23.txt=0A=
> ++++ b/docs/releases/3.2.23.txt=0A=
> +@@ -17,3 +17,11 @@ large number of Unicode characters.=0A=
> + In order to avoid the vulnerability, invalid values longer than=0A=
> + ``UsernameField.max_length`` are no longer normalized, since they canno=
t pass=0A=
> + validation anyway.=0A=
> ++=0A=
> ++CVE-2024-27351: Potential regular expression denial-of-service in ``dja=
ngo.utils.text.Truncator.words()``=0A=
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=0A=
> ++=0A=
> ++``django.utils.text.Truncator.words()`` method (with ``html=3DTrue``) a=
nd=0A=
> ++:tfilter:`truncatewords_html` template filter were subject to a potenti=
al=0A=
> ++regular expression denial-of-service attack using a suitably crafted st=
ring=0A=
> ++(follow up to :cve:`2019-14232` and :cve:`2023-43665`).=0A=
> +diff --git a/tests/utils_tests/test_text.py b/tests/utils_tests/test_tex=
t.py=0A=
> +index 0a6f0bc..758919c 100644=0A=
> +--- a/tests/utils_tests/test_text.py=0A=
> ++++ b/tests/utils_tests/test_text.py=0A=
> +@@ -159,6 +159,32 @@ class TestUtilsText(SimpleTestCase):=0A=
> +         truncator =3D text.Truncator('<p>I &lt;3 python, what about you=
?</p>')=0A=
> +         self.assertEqual('<p>I &lt;3 python,=85</p>', truncator.words(3=
, html=3DTrue))=0A=
> +=0A=
> ++        # Only open brackets.=0A=
> ++        test =3D "<" * 60_000=0A=
> ++        truncator =3D text.Truncator(test)=0A=
> ++        self.assertEqual(truncator.words(1, html=3DTrue), test)=0A=
> ++=0A=
> ++        # Tags with special chars in attrs.=0A=
> ++        truncator =3D text.Truncator(=0A=
> ++            """<i style=3D"margin: 5%; font: *;">Hello, my dear lady!</=
i>"""=0A=
> ++        )=0A=
> ++        self.assertEqual(=0A=
> ++            """<i style=3D"margin: 5%; font: *;">Hello, my dear=85</i>"=
"",=0A=
> ++            truncator.words(3, html=3DTrue),=0A=
> ++        )=0A=
> ++=0A=
> ++        # Tags with special non-latin chars in attrs.=0A=
> ++        truncator =3D text.Truncator("""<p data-x=3D"=E0">Hello, my dea=
r lady!</p>""")=0A=
> ++        self.assertEqual(=0A=
> ++            """<p data-x=3D"=E0">Hello, my dear=85</p>""",=0A=
> ++            truncator.words(3, html=3DTrue),=0A=
> ++        )=0A=
> ++=0A=
> ++        # Misplaced brackets.=0A=
> ++        truncator =3D text.Truncator("hello >< world")=0A=
> ++        self.assertEqual(truncator.words(1, html=3DTrue), "hello=85")=
=0A=
> ++        self.assertEqual(truncator.words(2, html=3DTrue), "hello >< wor=
ld")=0A=
> ++=0A=
> +     @patch("django.utils.text.Truncator.MAX_LENGTH_HTML", 10_000)=0A=
> +     def test_truncate_words_html_size_limit(self):=0A=
> +         max_len =3D text.Truncator.MAX_LENGTH_HTML=0A=
> +--=0A=
> +2.35.5=0A=
> diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb=
 b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb=0A=
> index 0478fd3883..f394397453 100644=0A=
> --- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb=0A=
> +++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb=0A=
> @@ -24,6 +24,7 @@ SRC_URI +=3D "file://CVE-2023-31047.patch \=0A=
>              file://CVE-2024-45230.patch \=0A=
>              file://CVE-2024-45231.patch \=0A=
>              file://CVE-2024-53907.patch \=0A=
> +            file://CVE-2024-27351.patch \=0A=
>             "=0A=
>=0A=
>  SRC_URI[sha256sum] =3D "0200b657afbf1bc08003845ddda053c7641b9b24951e52ac=
d51f6abda33a7413"=0A=
> diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.23.bb=
 b/meta-python/recipes-devtools/python/python3-django_3.2.23.bb=0A=
> index beecaa607c..e049b6552c 100644=0A=
> --- a/meta-python/recipes-devtools/python/python3-django_3.2.23.bb=0A=
> +++ b/meta-python/recipes-devtools/python/python3-django_3.2.23.bb=0A=
> @@ -6,6 +6,7 @@ SRC_URI[sha256sum] =3D "82968f3640e29ef4a773af2c28448f5f7=
a08d001c6ac05b32d02aeee65=0A=
>  RDEPENDS:${PN} +=3D "\=0A=
>      ${PYTHON_PN}-sqlparse \=0A=
>  "=0A=
> +SRC_URI +=3D "file://CVE-2024-27351.patch"=0A=
>=0A=
>  # Set DEFAULT_PREFERENCE so that the LTS version of django is built by=
=0A=
>  # default. To build the 3.x branch,=0A=
>=0A=
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=0A=
> Links: You receive all messages sent to this group.=0A=
> View/Reply Online (#121707): https://lists.openembedded.org/g/openembedde=
d-devel/message/121707=0A=
> Mute This Topic: https://lists.openembedded.org/mt/116290447/6084445=0A=
> Group Owner: openembedded-devel+owner@lists.openembedded.org=0A=
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [s=
kandigraun@gmail.com]=0A=
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=0A=
>=0A=
=0A=

