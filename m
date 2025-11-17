Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07C4CEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 13:18:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9074.1763385498240759957
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 05:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gnoQkJf9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34167910e3=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH8KUr31660699
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 05:18:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=pvLovpygx4odaNO/AxZz2cSQKGUvJNj9HF594mvaIdc=; b=gnoQkJf9iidZ
	0nvSagPmTB+Wzz3K/Y0RUvhZgPcHsuIIadju1VEl9qRqHO9JGvFNCp6YNjcGZA2E
	wC8wzXLRa9zVTJImEDbPgWUIen+myl2tZ/Mb2shPYgCMgtovzXVUh9d5BaWtUKA1
	kJIh/NpkWAQCsHWISKe9OxAJmQUGykfiQ00KWhNZXWenTtoNZQwtcdMCiTNjOU5p
	TVueSk71eFjYa0/PtJ3E6XU3aPWWdqJwhFogAi3f+ImHeHp8KcTbo9gA831eMn55
	q9hOvgVBSdyEHquGqhLAJ1qudX4kEz3MUCceXMZHbssHQSpQR+HtEZmRQsV1zh+a
	NWZab0HyYw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010019.outbound.protection.outlook.com [52.101.85.19])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aenp2ss2y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 05:18:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MlEHVn3zXfbHRF94lQCcfYogzf3LK2aNPYUCM7/p7RvmCC5j1S1e886UkeUujCmHTz3/kRr4eVrX+VQ1cdczqLUqhsWI5Tv/yeJTYMbjpxIfdxRwDVH3JY9NF/W34U4W5SZ7SbDw7WRQGZXpXtOe+OYzXyJeRIl2kokyXfxNgeR6QlnZsZ65Afn2UtwV//7Tkls6uVX+BKaosFfJxpV2y496k3mkW3FCku/yWRA0OtgVL3BMNklVUu4FhjzgYesHvtW3PloF6Dw06FBS1GXSdQ/iJ0QnYWxM55rVwXik0zwy5eqI4oXwApJ1S7VF17NXCjc1POE2eC+uQ861X2gLMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvLovpygx4odaNO/AxZz2cSQKGUvJNj9HF594mvaIdc=;
 b=xrfJuqXj4gT+sAg2iAKNpI29coyCeO54yrgLbNgpdt5hGyVTc/VagTdRpz8zzWUcYYN+hLCDaGU6+s+HGnNfSq0iWhs3zU1WFhxPSud+fH/AOT54xoHEUhA8kJHInzV7yktwqs2P7MuFQfvdgqfAfneh9HOYVUuGLDo1Y7S5MqPg3n0b3AFwWmABG6nmFyLZxd8d2fKbbGzj854dXdcL8jB6zM7au6pJoAKYxfT5EBNzgLEsNaMCPAxA/yoddAxi/pteAbSmfqQbeUGZCYMb1CtpFfJwMDXaGhipElaIGebnI/BHg1+vC38zELQky86/anRVbUnfk8PxJkzI5KdLIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB8296.namprd11.prod.outlook.com (2603:10b6:a03:47a::12)
 by SJ1PR11MB6203.namprd11.prod.outlook.com (2603:10b6:a03:45a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Mon, 17 Nov
 2025 13:18:13 +0000
Received: from SJ0PR11MB8296.namprd11.prod.outlook.com
 ([fe80::4b77:8603:59d9:7b58]) by SJ0PR11MB8296.namprd11.prod.outlook.com
 ([fe80::4b77:8603:59d9:7b58%5]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 13:18:13 +0000
From: "Kadambathur Subramaniyam, Saravanan"
	<Saravanan.KadambathurSubramaniyam@windriver.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: fix
 CVE-2024-56374
Thread-Topic: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: fix
 CVE-2024-56374
Thread-Index: AQHcV57BzyH8778SLESszG1FUQY9LrT2pU6J
Date: Mon, 17 Nov 2025 13:18:13 +0000
Message-ID: 
 <SJ0PR11MB82967F65C9F1171056549DB6F1C9A@SJ0PR11MB8296.namprd11.prod.outlook.com>
References: 
 <20251117032754.3885964-1-saravanan.kadambathursubramaniyam@windriver.com>
 <1099b052-a3ed-45de-b4ce-7b39b2f5afa4@gmail.com>
In-Reply-To: <1099b052-a3ed-45de-b4ce-7b39b2f5afa4@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-11-17T13:20:00.647Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB8296:EE_|SJ1PR11MB6203:EE_
x-ms-office365-filtering-correlation-id: 2bb54bac-e018-43a4-6180-08de25dbc352
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?hhNcK91zCxvqDWuhERuE8yuS7e8/qEU1d1KvIL008CeHxAYrX1DqyaOM/O?=
 =?iso-8859-1?Q?uA+mCzh8z2vzyctrhrrkJWCJezUJr+Yglr/IGZETBbxqFXXC+agDgd9kWN?=
 =?iso-8859-1?Q?43ebafn3Q+2OekoiMmPCC1mSou0E5P0dZgAUvxniu4iXw9y++f6F+UcSi8?=
 =?iso-8859-1?Q?eHlHfJD+UfVyeckhhtD8AmILYKMk9SIUZlmy2SLP6HvnpwmoIqSNhK1QX0?=
 =?iso-8859-1?Q?Fj/85silphy2b2udxwth/GKQHHWbeJ+romttBvGvLWIEf6mzTCRKoY8CBH?=
 =?iso-8859-1?Q?dorXe0CKgdugauXF4P658WRHz9ztlevuyD3YtqCP46foUXiWtCVrSqbI4U?=
 =?iso-8859-1?Q?4wFDo53HRWkMXjziuYmpJtin2mZC74sRmWzJwHVS0rdY8a9Rykl6F4KYpp?=
 =?iso-8859-1?Q?fvdrVasWrFEwzpmcNj07u8F8/DLGsquE+CiEBakGAiSzr7Jl90HSIuJ+jR?=
 =?iso-8859-1?Q?M1Ey6KU+sKrUzBu2APcOv0TBJ+Xkbpv0UKUTyGNsPJ+iLxHOQsWdu14Lyy?=
 =?iso-8859-1?Q?QNimpvbeQXSet1Onzd6VAmxuQ+dQNpQdE79O0cYwzifzP1paNLWmEPJBQq?=
 =?iso-8859-1?Q?tZ1vcqfw0Rg/6Eum1j5ggysRRdojgCn4mdeGP6Q6sKvqKI4N27J4TLw5bm?=
 =?iso-8859-1?Q?T97VDF91mdyjbqaKvxSb3uPax0jNT2dsFijPPH1qmsbGNKphsmgWr+WMCU?=
 =?iso-8859-1?Q?4UwObrkOTg0wxT6IAebuSOWJL/Cc5sCqPqZ/ud366QMyPtCev57W6FJxIL?=
 =?iso-8859-1?Q?7j28UijP5Iv6jP/0LHIAEHuUJ3fgGyyGKU3EWOX/cQnIqmVyqor57oGEjz?=
 =?iso-8859-1?Q?XlfMuq7L/UO4Wa+sbymflnxvJCDznLmdG/0PWcCNoPMghnSu7cZ4itAmWV?=
 =?iso-8859-1?Q?ZHGQMOv7mUtJuTG5LJoW6uT4aNE9A6Oas4/E9P2MTVdDC+QnMBJ3R9UXdO?=
 =?iso-8859-1?Q?t5Rfv/D4PmMB5A3Unqp6hQDYLFPiPiz7dM118RJSPZjg7BpDNCzPLC+WXZ?=
 =?iso-8859-1?Q?HG1rqEJLTjfu2B0pPBgms/csxf9rnmrvUYik65f1rIz7Rl7m/B8xPjdqG2?=
 =?iso-8859-1?Q?5ShoDVq91GqfiLAkvGAZH6qUksrwIpyES9tbKHZjQ8ST5ktdYLyMmNBW+i?=
 =?iso-8859-1?Q?hSoN6M2jfs8vKgieAj7cnOFHDQdC0jkPxl3uC3qdgWLXouaycGoAtiRcFj?=
 =?iso-8859-1?Q?b5TCPCsO/E3twqcJtJlcUnzhr4NbuY1nk2WXMUlGQLy1LHxaw63KRg54br?=
 =?iso-8859-1?Q?6I+IjoVFWw03PCScw3n3R9yOX+TTU6jUF5fAME38MfxwhcvkparunhXuHJ?=
 =?iso-8859-1?Q?RsMrejsiwIBFe4N0w5PQA8PrFTmNJmKnyY/+/ELo0MHrqvdYjKcQWt9yRC?=
 =?iso-8859-1?Q?jyBTutZZ0Q+ba+cwE0M8fM7trF/X+MQa+M8x9G/wREzbnU+7yQ/WpMkfLj?=
 =?iso-8859-1?Q?Tt2gu5kW1ZBnaxS+yv14CJ6J8U+jOD7qXpeEqOYgJ3O6PtME/HNYFb+x57?=
 =?iso-8859-1?Q?WqWlL8CwXVVNMrx4KPkjdGANQzqvfDs/nx9HU7peXQag=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB8296.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?/iHJaPKwTJMPi7cdePgE9Gw1mrYOSo8vOjtxauT+0UTTNG680KfVxksMD8?=
 =?iso-8859-1?Q?EK17Y71g/4movHwMtNp19PlDAXrlZbY5OsRtiHyKHAWoXyS9YsRmHzazTE?=
 =?iso-8859-1?Q?ohF7I++/q8DpkfFqQnUzzr5HsZq1/s1oXeHXAct8EzSrqml1X6cBLH218c?=
 =?iso-8859-1?Q?6LsSumq4TE+/obIzAvv3Ifwekhc+IXel+gRIC2O1gDsfJyFqQkGvrmVjxm?=
 =?iso-8859-1?Q?3MfSY2+PvwrN1D0udwsqipG8yQdqAzTbsCohV+gllgSjlR8mQ5WF3QekFs?=
 =?iso-8859-1?Q?pUozXOQ36sBZp8vzjvnQIChmdr1VX9Ia9i0nDtGOEdRyNgAOHS7sAC61m/?=
 =?iso-8859-1?Q?545WPmUDP7B7602fXaWmvAgVczT9F4n/UmI9QPkNNThRD7TUa26F2O4ZPU?=
 =?iso-8859-1?Q?mJZ3N1MVXqtjblY5/ZvDbNmuIxVHn0G9s+ORvCTp5OrVki++NtkOqQXwzH?=
 =?iso-8859-1?Q?ippsP9ZAS80VeaRsgODRJynYeIzGBnBpBUcksjnpYvgHRL+Gdv9+jNYIxF?=
 =?iso-8859-1?Q?10W9I+o7VLK9rDGjcb0JytTddZNIwjqeZu29S088m1ANBVfhIak0yPDwOx?=
 =?iso-8859-1?Q?NjUkDGq7QZStZgfNCrzfTv03eOPchPFs7YHwHeqFY3GJDNX8g4dUz/O1k4?=
 =?iso-8859-1?Q?cckN5FGv3XrQYXDY/zVStLJDZJakmoWIyhhLowRSngeYgyDaxEoWQ8i/4W?=
 =?iso-8859-1?Q?VQMODS22feiHI6c96olOh9+NYUMo1QhmT8cbqJN77VdXi/NlMGdXaQ638x?=
 =?iso-8859-1?Q?DUwj50V+VcqRDbaufGnWLg8mPwwrQxwiasXPwq2/u0L2rRUYraplAbdD1s?=
 =?iso-8859-1?Q?4h4qhQUHM+OwpfMX3vY8W1sWuJEOEfH9QTRoLNXvFCACJTo7kkB3SlWUxh?=
 =?iso-8859-1?Q?SCnJ9zsh0iIO4s54T0sYAPm3Qez3fZEXlm4WkD6xNVj0Wn6+VZH7cQ0Mkc?=
 =?iso-8859-1?Q?gJ/kk8s/zFDBwtL/OImGo/a7S3Pcf3Nx35ZNH7Ir81aD8I6ogXrygsDKYq?=
 =?iso-8859-1?Q?4t3U1nEFKsUGrcrvjnvvFYGj/EH6owzehStCHUp2sFvkdkmTxpijz3yoXU?=
 =?iso-8859-1?Q?wTIGTcOFi9cyzY35UdbP8UILH1Eg0AxEt61aGVPD3893j2Nm9ulogwUW7e?=
 =?iso-8859-1?Q?R4ktvGCV73tAKBc35ArzV4ZjQzyqP951RYx84+ISMo7a6wrq0kHtD7nwap?=
 =?iso-8859-1?Q?v06mUEraNH+Ai5nBqSOdAeae51nGWvQPewL4F1+0KJyFhCPgmv1Gl1UDP2?=
 =?iso-8859-1?Q?yE5IJ/t4AltahwZF9KUNuZLfYX7DGhw/HlI3P0nJP05bRqPPfN1m+XXR4n?=
 =?iso-8859-1?Q?r+6nQo7iZ0HHnziqsxSBOv5muLDmepdhzpWhOtJFMePSnPZ6u/kt/byVcR?=
 =?iso-8859-1?Q?+AOrWgPjTEo8VLD+fY3d5GfzjPaRuJKMakJkdZrLGwnfzQneURamPRJnFw?=
 =?iso-8859-1?Q?jl1sWUrEj+eQr/tqI3p37zehbVrWrAnuO3IjeWTbYIsqLL2RLmn0A+0lNR?=
 =?iso-8859-1?Q?hvX+gX5uxB6rFY2WkY0vP6szkSAVrjtWFIhzc+awB9yfqa+VRtOMI69JIs?=
 =?iso-8859-1?Q?0dpX//5Nc+ceoLBYSMxTr5go8t0rsXyCaFx77ngiX+ybqawLlicC4T9qRN?=
 =?iso-8859-1?Q?4cH1B6scfu8PzOR8VuoCbgyvfu6tU0YvQr6xXIi1N5i70qQtnbeb8A/iad?=
 =?iso-8859-1?Q?4WFsvricOlZNlxvF8zj+rRv5qT3ug7hFdKqVUyT2?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB8296.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb54bac-e018-43a4-6180-08de25dbc352
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 13:18:13.7797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 63IVxZHJ/ub2aJiSewkN0UEaryrEMZAMj++uKGOKYmI6VaU9bPiEBg7D4RDMqYYH5RDEcwqfedeF4gXzqQeTt/HbM+TFYSl/0jlY52tKX3rK7hkMzFbpAmsl9XX0YSdeTM24co9o5S+RSddBB3hyXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6203
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExMiBTYWx0ZWRfXyJn7Zou59rku
 JWMDTEKBFZF2fiOUcxFq96Vf47lZGnzekMaFLpH/GUZI5rGKYBYOzeNFyjVFF8kHNf+bFkpHiFk
 8xL8aOZqZAf614HtXmYg4YyUFsHqCB+OfPmzBRoES0MPqthOIXV/gN+qXSYawwiuQBlshPz2oJs
 OHXWE4BQjcAiqcXnWzdtSmy2V0wNCIDQOJtyOkQ0lr5MSRhHQpNxy/slT2UjUbX767opMNUmCY5
 wDcMDxU0DfeISwPrtf6xJAYjG2Gp1N2/dx4v7ZYJnUQAT3HppWyqBFh+CEf9oz8cn9KUpjT5s9Y
 wffzeligmsGnNkbdQlbWALGFgt4C+b2LVfZjPiuJHQRFajbQtkly9vJV1/HyO8TNrHTERY77EFI
 C3W9QljNHnVUSk4zkh7fAoJr743Dig==
X-Proofpoint-ORIG-GUID: p1ALrxwPbxXNqI_ljrB87KVS06pRQ923
X-Proofpoint-GUID: Kb2DNXCjnAt29H5EScUlt4ucVSG5nVls
X-Authority-Analysis: v=2.4 cv=Z6Xh3XRA c=1 sm=1 tr=0 ts=691b2099 cx=c_pps
 a=fdYRkKHAJehZsuGPaltaPA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=ArP49Si0AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=REyLQvUaBlC2p3xbNLMA:9 a=1-XXx92sLnUDa7cx:21 a=wPNLvfGTeEIA:10
 a=glZLBWN_5F3qvmUqPDV8:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170112
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 13:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121778

>Would like to add two notes/questions:=0A=
=0A=
>1. I think the 4.2.x recipe could be updated to the latest version in=0A=
>the series, which would have this patch=0A=
=0A=
Sure, will update 4.2.26 version=0A=
=0A=
>2. For the 2.2.28 recipe this patch modifies some files in=0A=
>the Django.egg-info folder, which is not clear for me. Could you please=0A=
>help with that, is that an accidental inclusion, or is it required for=0A=
>some reason?=0A=
yes that was accidental, but it was on 4.2.17 version, will upgrade and sen=
d out v2 patches.,=0A=
=0A=
On 11/17/25 04:27, Kadambathur Subramaniyam, Saravanan via=0A=
lists.openembedded.org wrote:=0A=
> Reference:=0A=
> https://nvd.nist.gov/vuln/detail/CVE-2024-56374=0A=
>=0A=
> Upstream-patch:=0A=
> https://github.com/django/django/commit/ad866a1ca3e7d60da888d25d27e46a8ad=
b2ed36e=0A=
>=0A=
> Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com=
>=0A=
> ---=0A=
>  .../CVE-2024-56374.patch                      | 315 ++++++++++++++++=0A=
>  .../CVE-2024-56374.patch                      | 306 +++++++++++++++=0A=
>  .../CVE-2024-56374.patch                      | 354 ++++++++++++++++++=
=0A=
>  .../python/python3-django_2.2.28.bb           |   1 +=0A=
>  .../python/python3-django_3.2.23.bb           |   1 +=0A=
>  .../python/python3-django_4.2.17.bb           |   5 +-=0A=
>  6 files changed, 981 insertions(+), 1 deletion(-)=0A=
>  create mode 100644 meta-python/recipes-devtools/python/python3-django-2.=
2.28/CVE-2024-56374.patch=0A=
>  create mode 100644 meta-python/recipes-devtools/python/python3-django-3.=
2.23/CVE-2024-56374.patch=0A=
>  create mode 100644 meta-python/recipes-devtools/python/python3-django-4.=
2.17/CVE-2024-56374.patch=0A=
>=0A=
> diff --git a/meta-python/recipes-devtools/python/python3-django-2.2.28/CV=
E-2024-56374.patch b/meta-python/recipes-devtools/python/python3-django-2.2=
.28/CVE-2024-56374.patch=0A=
> new file mode 100644=0A=
> index 0000000000..e6f1f7f419=0A=
> --- /dev/null=0A=
> +++ b/meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2024-=
56374.patch=0A=
> @@ -0,0 +1,315 @@=0A=
> +From 69094122141408d93590a7c22cb9ca8016143a5d Mon Sep 17 00:00:00 2001=
=0A=
> +From: Natalia <124304+nessita@users.noreply.github.com>=0A=
> +Date: Mon, 6 Jan 2025 15:51:45 -0300=0A=
> +Subject: [PATCH] Fixed CVE-2024-56374 -- Mitigated potential DoS in IPv6=
=0A=
> + validation.=0A=
> +=0A=
> +Thanks Saravana Kumar for the report, and Sarah Boyce and Mariusz=0A=
> +Felisiak for the reviews.=0A=
> +=0A=
> +CVE: CVE-2024-56374=0A=
> +=0A=
> +Upstream-Status: Backport=0A=
> +https://github.com/django/django/commit/ad866a1ca3e7d60da888d25d27e46a8a=
db2ed36e=0A=
> +=0A=
> +Signed-off-by: Natalia <124304+nessita@users.noreply.github.com>=0A=
> +Co-authored-by: Natalia <124304+nessita@users.noreply.github.com>=0A=
> +Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.co=
m>=0A=
> +---=0A=
> + django/db/models/fields/__init__.py           |  6 +--=0A=
> + django/forms/fields.py                        |  7 +++-=0A=
> + django/utils/ipv6.py                          | 22 ++++++++--=0A=
> + docs/ref/forms/fields.txt                     | 13 +++++-=0A=
> + docs/releases/2.2.28.txt                      | 12 ++++++=0A=
> + .../field_tests/test_genericipaddressfield.py | 35 +++++++++++++++-=0A=
> + tests/utils_tests/test_ipv6.py                | 40 +++++++++++++++++--=
=0A=
> + 7 files changed, 120 insertions(+), 15 deletions(-)=0A=
> +=0A=
> +diff --git a/django/db/models/fields/__init__.py b/django/db/models/fiel=
ds/__init__.py=0A=
> +index e2d1846..c77702f 100644=0A=
> +--- a/django/db/models/fields/__init__.py=0A=
> ++++ b/django/db/models/fields/__init__.py=0A=
> +@@ -26,7 +26,7 @@ from django.utils.dateparse import (=0A=
> + )=0A=
> + from django.utils.duration import duration_microseconds, duration_strin=
g=0A=
> + from django.utils.functional import Promise, cached_property=0A=
> +-from django.utils.ipv6 import clean_ipv6_address=0A=
> ++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH, clean_ipv6_addre=
ss=0A=
> + from django.utils.itercompat import is_iterable=0A=
> + from django.utils.text import capfirst=0A=
> + from django.utils.translation import gettext_lazy as _=0A=
> +@@ -1904,7 +1904,7 @@ class GenericIPAddressField(Field):=0A=
> +         self.default_validators, invalid_error_message =3D \=0A=
> +             validators.ip_address_validators(protocol, unpack_ipv4)=0A=
> +         self.default_error_messages['invalid'] =3D invalid_error_messag=
e=0A=
> +-        kwargs['max_length'] =3D 39=0A=
> ++        kwargs["max_length"] =3D MAX_IPV6_ADDRESS_LENGTH=0A=
> +         super().__init__(verbose_name, name, *args, **kwargs)=0A=
> +=0A=
> +     def check(self, **kwargs):=0A=
> +@@ -1931,7 +1931,7 @@ class GenericIPAddressField(Field):=0A=
> +             kwargs['unpack_ipv4'] =3D self.unpack_ipv4=0A=
> +         if self.protocol !=3D "both":=0A=
> +             kwargs['protocol'] =3D self.protocol=0A=
> +-        if kwargs.get("max_length") =3D=3D 39:=0A=
> ++        if kwargs.get("max_length") =3D=3D self.max_length:=0A=
> +             del kwargs['max_length']=0A=
> +         return name, path, args, kwargs=0A=
> +=0A=
> +diff --git a/django/forms/fields.py b/django/forms/fields.py=0A=
> +index f939338..b3156b9 100644=0A=
> +--- a/django/forms/fields.py=0A=
> ++++ b/django/forms/fields.py=0A=
> +@@ -29,7 +29,7 @@ from django.forms.widgets import (=0A=
> + from django.utils import formats=0A=
> + from django.utils.dateparse import parse_duration=0A=
> + from django.utils.duration import duration_string=0A=
> +-from django.utils.ipv6 import clean_ipv6_address=0A=
> ++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH, clean_ipv6_addre=
ss=0A=
> + from django.utils.translation import gettext_lazy as _, ngettext_lazy=
=0A=
> +=0A=
> + __all__ =3D (=0A=
> +@@ -1162,6 +1162,7 @@ class GenericIPAddressField(CharField):=0A=
> +     def __init__(self, *, protocol=3D'both', unpack_ipv4=3DFalse, **kwa=
rgs):=0A=
> +         self.unpack_ipv4 =3D unpack_ipv4=0A=
> +         self.default_validators =3D validators.ip_address_validators(pr=
otocol, unpack_ipv4)[0]=0A=
> ++        kwargs.setdefault("max_length", MAX_IPV6_ADDRESS_LENGTH)=0A=
> +         super().__init__(**kwargs)=0A=
> +=0A=
> +     def to_python(self, value):=0A=
> +@@ -1169,7 +1170,9 @@ class GenericIPAddressField(CharField):=0A=
> +             return ''=0A=
> +         value =3D value.strip()=0A=
> +         if value and ':' in value:=0A=
> +-            return clean_ipv6_address(value, self.unpack_ipv4)=0A=
> ++            return clean_ipv6_address(=0A=
> ++                value, self.unpack_ipv4, max_length=3Dself.max_length=
=0A=
> ++            )=0A=
> +         return value=0A=
> +=0A=
> +=0A=
> +diff --git a/django/utils/ipv6.py b/django/utils/ipv6.py=0A=
> +index ddb8c80..aed7902 100644=0A=
> +--- a/django/utils/ipv6.py=0A=
> ++++ b/django/utils/ipv6.py=0A=
> +@@ -3,9 +3,23 @@ import ipaddress=0A=
> + from django.core.exceptions import ValidationError=0A=
> + from django.utils.translation import gettext_lazy as _=0A=
> +=0A=
> ++MAX_IPV6_ADDRESS_LENGTH =3D 39=0A=
> +=0A=
> +-def clean_ipv6_address(ip_str, unpack_ipv4=3DFalse,=0A=
> +-                       error_message=3D_("This is not a valid IPv6 addr=
ess.")):=0A=
> ++=0A=
> ++def _ipv6_address_from_str(ip_str, max_length=3DMAX_IPV6_ADDRESS_LENGTH=
):=0A=
> ++    if len(ip_str) > max_length:=0A=
> ++        raise ValueError(=0A=
> ++            f"Unable to convert {ip_str} to an IPv6 address (value too =
long)."=0A=
> ++        )=0A=
> ++    return ipaddress.IPv6Address(int(ipaddress.IPv6Address(ip_str)))=0A=
> ++=0A=
> ++=0A=
> ++def clean_ipv6_address(=0A=
> ++    ip_str,=0A=
> ++    unpack_ipv4=3DFalse,=0A=
> ++    error_message=3D_("This is not a valid IPv6 address."),=0A=
> ++    max_length=3DMAX_IPV6_ADDRESS_LENGTH,=0A=
> ++    ):=0A=
> +     """=0A=
> +     Clean an IPv6 address string.=0A=
> +=0A=
> +@@ -23,7 +37,7 @@ def clean_ipv6_address(ip_str, unpack_ipv4=3DFalse,=0A=
> +     Return a compressed IPv6 address or the same value.=0A=
> +     """=0A=
> +     try:=0A=
> +-        addr =3D ipaddress.IPv6Address(int(ipaddress.IPv6Address(ip_str=
)))=0A=
> ++        addr =3D _ipv6_address_from_str(ip_str, max_length)=0A=
> +     except ValueError:=0A=
> +         raise ValidationError(error_message, code=3D'invalid')=0A=
> +=0A=
> +@@ -40,7 +54,7 @@ def is_valid_ipv6_address(ip_str):=0A=
> +     Return whether or not the `ip_str` string is a valid IPv6 address.=
=0A=
> +     """=0A=
> +     try:=0A=
> +-        ipaddress.IPv6Address(ip_str)=0A=
> ++        _ipv6_address_from_str(ip_str)=0A=
> +     except ValueError:=0A=
> +         return False=0A=
> +     return True=0A=
> +diff --git a/docs/ref/forms/fields.txt b/docs/ref/forms/fields.txt=0A=
> +index 3a888ef..688890a 100644=0A=
> +--- a/docs/ref/forms/fields.txt=0A=
> ++++ b/docs/ref/forms/fields.txt=0A=
> +@@ -791,7 +791,7 @@ For each field, we describe the default widget used =
if you don't specify=0A=
> +     * Empty value: ``''`` (an empty string)=0A=
> +     * Normalizes to: A string. IPv6 addresses are normalized as describ=
ed below.=0A=
> +     * Validates that the given value is a valid IP address.=0A=
> +-    * Error message keys: ``required``, ``invalid``=0A=
> ++    * Error message keys: ``required``, ``invalid``, ``max_length``=0A=
> +=0A=
> +     The IPv6 address normalization follows :rfc:`4291#section-2.2` sect=
ion 2.2,=0A=
> +     including using the IPv4 format suggested in paragraph 3 of that se=
ction, like=0A=
> +@@ -799,7 +799,7 @@ For each field, we describe the default widget used =
if you don't specify=0A=
> +     ``2001::1``, and ``::ffff:0a0a:0a0a`` to ``::ffff:10.10.10.10``. Al=
l characters=0A=
> +     are converted to lowercase.=0A=
> +=0A=
> +-    Takes two optional arguments:=0A=
> ++    Takes three optional arguments:=0A=
> +=0A=
> +     .. attribute:: protocol=0A=
> +=0A=
> +@@ -814,6 +814,15 @@ For each field, we describe the default widget used=
 if you don't specify=0A=
> +         ``192.0.2.1``. Default is disabled. Can only be used=0A=
> +         when ``protocol`` is set to ``'both'``.=0A=
> +=0A=
> ++    .. attribute:: max_length=0A=
> ++=0A=
> ++        Defaults to 39, and behaves the same way as it does for=0A=
> ++        :class:`CharField`.=0A=
> ++=0A=
> ++    .. versionchanged:: 4.2.18=0A=
> ++=0A=
> ++        The default value for ``max_length`` was set to 39 characters.=
=0A=
> ++=0A=
> + ``MultipleChoiceField``=0A=
> + -----------------------=0A=
> +=0A=
> +diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt=0A=
> +index 63877eb..9853d95 100644=0A=
> +--- a/docs/releases/2.2.28.txt=0A=
> ++++ b/docs/releases/2.2.28.txt=0A=
> +@@ -6,6 +6,18 @@ Django 2.2.28 release notes=0A=
> +=0A=
> + Django 2.2.28 fixes two security issues with severity "high" in 2.2.27.=
=0A=
> +=0A=
> ++CVE-2024-56374: Potential denial-of-service vulnerability in IPv6 valid=
ation=0A=
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=0A=
> ++=0A=
> ++Lack of upper bound limit enforcement in strings passed when performing=
 IPv6=0A=
> ++validation could lead to a potential denial-of-service attack. The undo=
cumented=0A=
> ++and private functions ``clean_ipv6_address`` and ``is_valid_ipv6_addres=
s`` were=0A=
> ++vulnerable, as was the  :class:`django.forms.GenericIPAddressField` for=
m field,=0A=
> ++which has now been updated to define a ``max_length`` of 39 characters.=
=0A=
> ++=0A=
> ++The :class:`django.db.models.GenericIPAddressField` model field was not=
=0A=
> ++affected.=0A=
> ++=0A=
> + CVE-2025-26699: Potential denial-of-service vulnerability in ``django.u=
tils.text.wrap()``=0A=
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
> +=0A=
> +diff --git a/tests/forms_tests/field_tests/test_genericipaddressfield.py=
 b/tests/forms_tests/field_tests/test_genericipaddressfield.py=0A=
> +index 97a83e3..4c79d78 100644=0A=
> +--- a/tests/forms_tests/field_tests/test_genericipaddressfield.py=0A=
> ++++ b/tests/forms_tests/field_tests/test_genericipaddressfield.py=0A=
> +@@ -1,5 +1,6 @@=0A=
> + from django.forms import GenericIPAddressField, ValidationError=0A=
> + from django.test import SimpleTestCase=0A=
> ++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH=0A=
> +=0A=
> +=0A=
> + class GenericIPAddressFieldTest(SimpleTestCase):=0A=
> +@@ -89,6 +90,35 @@ class GenericIPAddressFieldTest(SimpleTestCase):=0A=
> +         with self.assertRaisesMessage(ValidationError, "'This is not a =
valid IPv6 address.'"):=0A=
> +             f.clean('1:2')=0A=
> +=0A=
> ++    def test_generic_ipaddress_max_length_custom(self):=0A=
> ++        # Valid IPv4-mapped IPv6 address, len 45.=0A=
> ++        addr =3D "0000:0000:0000:0000:0000:ffff:192.168.100.228"=0A=
> ++        f =3D GenericIPAddressField(max_length=3Dlen(addr))=0A=
> ++        f.clean(addr)=0A=
> ++=0A=
> ++    def test_generic_ipaddress_max_length_validation_error(self):=0A=
> ++        # Valid IPv4-mapped IPv6 address, len 45.=0A=
> ++        addr =3D "0000:0000:0000:0000:0000:ffff:192.168.100.228"=0A=
> ++=0A=
> ++        cases =3D [=0A=
> ++            ({}, MAX_IPV6_ADDRESS_LENGTH),  # Default value.=0A=
> ++            ({"max_length": len(addr) - 1}, len(addr) - 1),=0A=
> ++        ]=0A=
> ++        for kwargs, max_length in cases:=0A=
> ++            max_length_plus_one =3D max_length + 1=0A=
> ++            msg =3D (=0A=
> ++                f"Ensure this value has at most {max_length} characters=
 (it has "=0A=
> ++                f"{max_length_plus_one}).'"=0A=
> ++            )=0A=
> ++            with self.subTest(max_length=3Dmax_length):=0A=
> ++                f =3D GenericIPAddressField(**kwargs)=0A=
> ++                with self.assertRaisesMessage(ValidationError, msg):=0A=
> ++                    f.clean("x" * max_length_plus_one)=0A=
> ++                with self.assertRaisesMessage(=0A=
> ++                    ValidationError, "This is not a valid IPv6 address.=
"=0A=
> ++                ):=0A=
> ++                    f.clean(addr)=0A=
> ++=0A=
> +     def test_generic_ipaddress_as_generic_not_required(self):=0A=
> +         f =3D GenericIPAddressField(required=3DFalse)=0A=
> +         self.assertEqual(f.clean(''), '')=0A=
> +@@ -103,7 +133,10 @@ class GenericIPAddressFieldTest(SimpleTestCase):=0A=
> +         with self.assertRaisesMessage(ValidationError, "'Enter a valid =
IPv4 or IPv6 address.'"):=0A=
> +             f.clean('256.125.1.5')=0A=
> +         self.assertEqual(f.clean(' fe80::223:6cff:fe8a:2e8a '), 'fe80::=
223:6cff:fe8a:2e8a')=0A=
> +-        self.assertEqual(f.clean(' 2a02::223:6cff:fe8a:2e8a '), '2a02::=
223:6cff:fe8a:2e8a')=0A=
> ++        self.assertEqual(=0A=
> ++            f.clean(" " * MAX_IPV6_ADDRESS_LENGTH + " 2a02::223:6cff:fe=
8a:2e8a "),=0A=
> ++            "2a02::223:6cff:fe8a:2e8a",=0A=
> ++            )=0A=
> +         with self.assertRaisesMessage(ValidationError, "'This is not a =
valid IPv6 address.'"):=0A=
> +             f.clean('12345:2:3:4')=0A=
> +         with self.assertRaisesMessage(ValidationError, "'This is not a =
valid IPv6 address.'"):=0A=
> +diff --git a/tests/utils_tests/test_ipv6.py b/tests/utils_tests/test_ipv=
6.py=0A=
> +index 4e434f3..1ac6763 100644=0A=
> +--- a/tests/utils_tests/test_ipv6.py=0A=
> ++++ b/tests/utils_tests/test_ipv6.py=0A=
> +@@ -1,9 +1,17 @@=0A=
> +-import unittest=0A=
> ++import traceback=0A=
> ++from io import StringIO=0A=
> +=0A=
> +-from django.utils.ipv6 import clean_ipv6_address, is_valid_ipv6_address=
=0A=
> ++from django.core.exceptions import ValidationError=0A=
> ++from django.test import SimpleTestCase=0A=
> ++from django.utils.ipv6 import (=0A=
> ++    MAX_IPV6_ADDRESS_LENGTH,=0A=
> ++    clean_ipv6_address,=0A=
> ++    is_valid_ipv6_address,=0A=
> ++)=0A=
> ++from django.utils.version import PY310=0A=
> +=0A=
> +=0A=
> +-class TestUtilsIPv6(unittest.TestCase):=0A=
> ++class TestUtilsIPv6(SimpleTestCase):=0A=
> +=0A=
> +     def test_validates_correct_plain_address(self):=0A=
> +         self.assertTrue(is_valid_ipv6_address('fe80::223:6cff:fe8a:2e8a=
'))=0A=
> +@@ -55,3 +63,29 @@ class TestUtilsIPv6(unittest.TestCase):=0A=
> +         self.assertEqual(clean_ipv6_address('::ffff:0a0a:0a0a', unpack_=
ipv4=3DTrue), '10.10.10.10')=0A=
> +         self.assertEqual(clean_ipv6_address('::ffff:1234:1234', unpack_=
ipv4=3DTrue), '18.52.18.52')=0A=
> +         self.assertEqual(clean_ipv6_address('::ffff:18.52.18.52', unpac=
k_ipv4=3DTrue), '18.52.18.52')=0A=
> ++=0A=
> ++    def test_address_too_long(self):=0A=
> ++        addresses =3D [=0A=
> ++            "0000:0000:0000:0000:0000:ffff:192.168.100.228",  # IPv4-ma=
pped IPv6 address=0A=
> ++            "0000:0000:0000:0000:0000:ffff:192.168.100.228%123456",  # =
% scope/zone=0A=
> ++            "fe80::223:6cff:fe8a:2e8a:1234:5678:00000",  # MAX_IPV6_ADD=
RESS_LENGTH + 1=0A=
> ++        ]=0A=
> ++        msg =3D "This is the error message."=0A=
> ++        value_error_msg =3D "Unable to convert %s to an IPv6 address (v=
alue too long)."=0A=
> ++        for addr in addresses:=0A=
> ++            with self.subTest(addr=3Daddr):=0A=
> ++                self.assertGreater(len(addr), MAX_IPV6_ADDRESS_LENGTH)=
=0A=
> ++                self.assertEqual(is_valid_ipv6_address(addr), False)=0A=
> ++                with self.assertRaisesMessage(ValidationError, msg) as =
ctx:=0A=
> ++                    clean_ipv6_address(addr, error_message=3Dmsg)=0A=
> ++                exception_traceback =3D StringIO()=0A=
> ++                if PY310:=0A=
> ++                    traceback.print_exception(ctx.exception, file=3Dexc=
eption_traceback)=0A=
> ++                else:=0A=
> ++                    traceback.print_exception(=0A=
> ++                        type(ctx.exception),=0A=
> ++                        value=3Dctx.exception,=0A=
> ++                        tb=3Dctx.exception.__traceback__,=0A=
> ++                        file=3Dexception_traceback,=0A=
> ++                    )=0A=
> ++                self.assertIn(value_error_msg % addr, exception_traceba=
ck.getvalue())=0A=
> +--=0A=
> +2.35.5=0A=
> diff --git a/meta-python/recipes-devtools/python/python3-django-3.2.23/CV=
E-2024-56374.patch b/meta-python/recipes-devtools/python/python3-django-3.2=
.23/CVE-2024-56374.patch=0A=
> new file mode 100644=0A=
> index 0000000000..acb9ae23c4=0A=
> --- /dev/null=0A=
> +++ b/meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2024-=
56374.patch=0A=
> @@ -0,0 +1,306 @@=0A=
> +From c11be4dd31d1dedc9ba6e3a1e70bc0a27dbbaa2d Mon Sep 17 00:00:00 2001=
=0A=
> +From: Natalia <124304+nessita@users.noreply.github.com>=0A=
> +Date: Mon, 6 Jan 2025 15:51:45 -0300=0A=
> +Subject: [PATCH] Fixed CVE-2024-56374 -- Mitigated potential DoS in IPv6=
=0A=
> + validation.=0A=
> +=0A=
> +Thanks Saravana Kumar for the report, and Sarah Boyce and Mariusz=0A=
> +Felisiak for the reviews.=0A=
> +=0A=
> +CVE: CVE-2024-56374=0A=
> +=0A=
> +Upstream-Status: Backport=0A=
> +https://github.com/django/django/commit/ad866a1ca3e7d60da888d25d27e46a8a=
db2ed36e=0A=
> +=0A=
> +Signed-off-by: Natalia <124304+nessita@users.noreply.github.com>=0A=
> +Co-authored-by: Natalia <124304+nessita@users.noreply.github.com>=0A=
> +Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.co=
m>=0A=
> +---=0A=
> + django/db/models/fields/__init__.py           |  4 +-=0A=
> + django/forms/fields.py                        |  7 +++-=0A=
> + django/utils/ipv6.py                          | 22 ++++++++--=0A=
> + docs/ref/forms/fields.txt                     | 13 +++++-=0A=
> + docs/releases/3.2.23.txt                      | 13 ++++++=0A=
> + .../field_tests/test_genericipaddressfield.py | 35 +++++++++++++++-=0A=
> + tests/utils_tests/test_ipv6.py                | 40 +++++++++++++++++--=
=0A=
> + 7 files changed, 120 insertions(+), 14 deletions(-)=0A=
> +=0A=
> +diff --git a/django/db/models/fields/__init__.py b/django/db/models/fiel=
ds/__init__.py=0A=
> +index 167c3d2..148201d 100644=0A=
> +--- a/django/db/models/fields/__init__.py=0A=
> ++++ b/django/db/models/fields/__init__.py=0A=
> +@@ -22,7 +22,7 @@ from django.utils.dateparse import (=0A=
> + )=0A=
> + from django.utils.duration import duration_microseconds, duration_strin=
g=0A=
> + from django.utils.functional import Promise, cached_property=0A=
> +-from django.utils.ipv6 import clean_ipv6_address=0A=
> ++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH, clean_ipv6_addre=
ss=0A=
> + from django.utils.itercompat import is_iterable=0A=
> + from django.utils.text import capfirst=0A=
> + from django.utils.translation import gettext_lazy as _=0A=
> +@@ -1940,7 +1940,7 @@ class GenericIPAddressField(Field):=0A=
> +             kwargs['unpack_ipv4'] =3D self.unpack_ipv4=0A=
> +         if self.protocol !=3D "both":=0A=
> +             kwargs['protocol'] =3D self.protocol=0A=
> +-        if kwargs.get("max_length") =3D=3D 39:=0A=
> ++        if kwargs.get("max_length") =3D=3D self.max_length:=0A=
> +             del kwargs['max_length']=0A=
> +         return name, path, args, kwargs=0A=
> +=0A=
> +diff --git a/django/forms/fields.py b/django/forms/fields.py=0A=
> +index 8adb09e..6969c4a 100644=0A=
> +--- a/django/forms/fields.py=0A=
> ++++ b/django/forms/fields.py=0A=
> +@@ -28,7 +28,7 @@ from django.forms.widgets import (=0A=
> + from django.utils import formats=0A=
> + from django.utils.dateparse import parse_datetime, parse_duration=0A=
> + from django.utils.duration import duration_string=0A=
> +-from django.utils.ipv6 import clean_ipv6_address=0A=
> ++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH, clean_ipv6_addre=
ss=0A=
> + from django.utils.regex_helper import _lazy_re_compile=0A=
> + from django.utils.translation import gettext_lazy as _, ngettext_lazy=
=0A=
> +=0A=
> +@@ -1179,6 +1179,7 @@ class GenericIPAddressField(CharField):=0A=
> +     def __init__(self, *, protocol=3D'both', unpack_ipv4=3DFalse, **kwa=
rgs):=0A=
> +         self.unpack_ipv4 =3D unpack_ipv4=0A=
> +         self.default_validators =3D validators.ip_address_validators(pr=
otocol, unpack_ipv4)[0]=0A=
> ++        kwargs.setdefault("max_length", MAX_IPV6_ADDRESS_LENGTH)=0A=
> +         super().__init__(**kwargs)=0A=
> +=0A=
> +     def to_python(self, value):=0A=
> +@@ -1186,7 +1187,9 @@ class GenericIPAddressField(CharField):=0A=
> +             return ''=0A=
> +         value =3D value.strip()=0A=
> +         if value and ':' in value:=0A=
> +-            return clean_ipv6_address(value, self.unpack_ipv4)=0A=
> ++            return clean_ipv6_address(=0A=
> ++                value, self.unpack_ipv4, max_length=3Dself.max_length=
=0A=
> ++            )=0A=
> +         return value=0A=
> +=0A=
> +=0A=
> +diff --git a/django/utils/ipv6.py b/django/utils/ipv6.py=0A=
> +index ddb8c80..aed7902 100644=0A=
> +--- a/django/utils/ipv6.py=0A=
> ++++ b/django/utils/ipv6.py=0A=
> +@@ -3,9 +3,23 @@ import ipaddress=0A=
> + from django.core.exceptions import ValidationError=0A=
> + from django.utils.translation import gettext_lazy as _=0A=
> +=0A=
> ++MAX_IPV6_ADDRESS_LENGTH =3D 39=0A=
> +=0A=
> +-def clean_ipv6_address(ip_str, unpack_ipv4=3DFalse,=0A=
> +-                       error_message=3D_("This is not a valid IPv6 addr=
ess.")):=0A=
> ++=0A=
> ++def _ipv6_address_from_str(ip_str, max_length=3DMAX_IPV6_ADDRESS_LENGTH=
):=0A=
> ++    if len(ip_str) > max_length:=0A=
> ++        raise ValueError(=0A=
> ++            f"Unable to convert {ip_str} to an IPv6 address (value too =
long)."=0A=
> ++        )=0A=
> ++    return ipaddress.IPv6Address(int(ipaddress.IPv6Address(ip_str)))=0A=
> ++=0A=
> ++=0A=
> ++def clean_ipv6_address(=0A=
> ++    ip_str,=0A=
> ++    unpack_ipv4=3DFalse,=0A=
> ++    error_message=3D_("This is not a valid IPv6 address."),=0A=
> ++    max_length=3DMAX_IPV6_ADDRESS_LENGTH,=0A=
> ++    ):=0A=
> +     """=0A=
> +     Clean an IPv6 address string.=0A=
> +=0A=
> +@@ -23,7 +37,7 @@ def clean_ipv6_address(ip_str, unpack_ipv4=3DFalse,=0A=
> +     Return a compressed IPv6 address or the same value.=0A=
> +     """=0A=
> +     try:=0A=
> +-        addr =3D ipaddress.IPv6Address(int(ipaddress.IPv6Address(ip_str=
)))=0A=
> ++        addr =3D _ipv6_address_from_str(ip_str, max_length)=0A=
> +     except ValueError:=0A=
> +         raise ValidationError(error_message, code=3D'invalid')=0A=
> +=0A=
> +@@ -40,7 +54,7 @@ def is_valid_ipv6_address(ip_str):=0A=
> +     Return whether or not the `ip_str` string is a valid IPv6 address.=
=0A=
> +     """=0A=
> +     try:=0A=
> +-        ipaddress.IPv6Address(ip_str)=0A=
> ++        _ipv6_address_from_str(ip_str)=0A=
> +     except ValueError:=0A=
> +         return False=0A=
> +     return True=0A=
> +diff --git a/docs/ref/forms/fields.txt b/docs/ref/forms/fields.txt=0A=
> +index 5b485f2..45973eb 100644=0A=
> +--- a/docs/ref/forms/fields.txt=0A=
> ++++ b/docs/ref/forms/fields.txt=0A=
> +@@ -847,7 +847,7 @@ For each field, we describe the default widget used =
if you don't specify=0A=
> +     * Empty value: ``''`` (an empty string)=0A=
> +     * Normalizes to: A string. IPv6 addresses are normalized as describ=
ed below.=0A=
> +     * Validates that the given value is a valid IP address.=0A=
> +-    * Error message keys: ``required``, ``invalid``=0A=
> ++    * Error message keys: ``required``, ``invalid``, ``max_length``=0A=
> +=0A=
> +     The IPv6 address normalization follows :rfc:`4291#section-2.2` sect=
ion 2.2,=0A=
> +     including using the IPv4 format suggested in paragraph 3 of that se=
ction, like=0A=
> +@@ -855,7 +855,7 @@ For each field, we describe the default widget used =
if you don't specify=0A=
> +     ``2001::1``, and ``::ffff:0a0a:0a0a`` to ``::ffff:10.10.10.10``. Al=
l characters=0A=
> +     are converted to lowercase.=0A=
> +=0A=
> +-    Takes two optional arguments:=0A=
> ++    Takes three optional arguments:=0A=
> +=0A=
> +     .. attribute:: protocol=0A=
> +=0A=
> +@@ -870,6 +870,15 @@ For each field, we describe the default widget used=
 if you don't specify=0A=
> +         ``192.0.2.1``. Default is disabled. Can only be used=0A=
> +         when ``protocol`` is set to ``'both'``.=0A=
> +=0A=
> ++    .. attribute:: max_length=0A=
> ++=0A=
> ++        Defaults to 39, and behaves the same way as it does for=0A=
> ++        :class:`CharField`.=0A=
> ++=0A=
> ++    .. versionchanged:: 4.2.18=0A=
> ++=0A=
> ++        The default value for ``max_length`` was set to 39 characters.=
=0A=
> ++=0A=
> + ``MultipleChoiceField``=0A=
> + -----------------------=0A=
> +=0A=
> +diff --git a/docs/releases/3.2.23.txt b/docs/releases/3.2.23.txt=0A=
> +index da75eca..9a9b52d 100644=0A=
> +--- a/docs/releases/3.2.23.txt=0A=
> ++++ b/docs/releases/3.2.23.txt=0A=
> +@@ -32,3 +32,16 @@ CVE-2025-26699: Potential denial-of-service vulnerabi=
lity in ``django.utils.text=0A=
> + The ``wrap()`` and :tfilter:`wordwrap` template filter were subject to =
a=0A=
> + potential denial-of-service attack when used with very long strings.=0A=
> +=0A=
> ++=0A=
> ++CVE-2024-56374: Potential denial-of-service vulnerability in IPv6 valid=
ation=0A=
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=0A=
> ++=0A=
> ++Lack of upper bound limit enforcement in strings passed when performing=
 IPv6=0A=
> ++validation could lead to a potential denial-of-service attack. The undo=
cumented=0A=
> ++and private functions ``clean_ipv6_address`` and ``is_valid_ipv6_addres=
s`` were=0A=
> ++vulnerable, as was the  :class:`django.forms.GenericIPAddressField` for=
m field,=0A=
> ++which has now been updated to define a ``max_length`` of 39 characters.=
=0A=
> ++=0A=
> ++The :class:`django.db.models.GenericIPAddressField` model field was not=
=0A=
> ++affected.=0A=
> ++=0A=
> +diff --git a/tests/forms_tests/field_tests/test_genericipaddressfield.py=
 b/tests/forms_tests/field_tests/test_genericipaddressfield.py=0A=
> +index 92dbd71..fc3f129 100644=0A=
> +--- a/tests/forms_tests/field_tests/test_genericipaddressfield.py=0A=
> ++++ b/tests/forms_tests/field_tests/test_genericipaddressfield.py=0A=
> +@@ -1,6 +1,7 @@=0A=
> + from django.core.exceptions import ValidationError=0A=
> + from django.forms import GenericIPAddressField=0A=
> + from django.test import SimpleTestCase=0A=
> ++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH=0A=
> +=0A=
> +=0A=
> + class GenericIPAddressFieldTest(SimpleTestCase):=0A=
> +@@ -90,6 +91,35 @@ class GenericIPAddressFieldTest(SimpleTestCase):=0A=
> +         with self.assertRaisesMessage(ValidationError, "'This is not a =
valid IPv6 address.'"):=0A=
> +             f.clean('1:2')=0A=
> +=0A=
> ++    def test_generic_ipaddress_max_length_custom(self):=0A=
> ++        # Valid IPv4-mapped IPv6 address, len 45.=0A=
> ++        addr =3D "0000:0000:0000:0000:0000:ffff:192.168.100.228"=0A=
> ++        f =3D GenericIPAddressField(max_length=3Dlen(addr))=0A=
> ++        f.clean(addr)=0A=
> ++=0A=
> ++    def test_generic_ipaddress_max_length_validation_error(self):=0A=
> ++        # Valid IPv4-mapped IPv6 address, len 45.=0A=
> ++        addr =3D "0000:0000:0000:0000:0000:ffff:192.168.100.228"=0A=
> ++=0A=
> ++        cases =3D [=0A=
> ++            ({}, MAX_IPV6_ADDRESS_LENGTH),  # Default value.=0A=
> ++            ({"max_length": len(addr) - 1}, len(addr) - 1),=0A=
> ++        ]=0A=
> ++        for kwargs, max_length in cases:=0A=
> ++            max_length_plus_one =3D max_length + 1=0A=
> ++            msg =3D (=0A=
> ++                f"Ensure this value has at most {max_length} characters=
 (it has "=0A=
> ++                f"{max_length_plus_one}).'"=0A=
> ++            )=0A=
> ++            with self.subTest(max_length=3Dmax_length):=0A=
> ++                f =3D GenericIPAddressField(**kwargs)=0A=
> ++                with self.assertRaisesMessage(ValidationError, msg):=0A=
> ++                    f.clean("x" * max_length_plus_one)=0A=
> ++                with self.assertRaisesMessage(=0A=
> ++                    ValidationError, "This is not a valid IPv6 address.=
"=0A=
> ++                ):=0A=
> ++                    f.clean(addr)=0A=
> ++=0A=
> +     def test_generic_ipaddress_as_generic_not_required(self):=0A=
> +         f =3D GenericIPAddressField(required=3DFalse)=0A=
> +         self.assertEqual(f.clean(''), '')=0A=
> +@@ -104,7 +134,10 @@ class GenericIPAddressFieldTest(SimpleTestCase):=0A=
> +         with self.assertRaisesMessage(ValidationError, "'Enter a valid =
IPv4 or IPv6 address.'"):=0A=
> +             f.clean('256.125.1.5')=0A=
> +         self.assertEqual(f.clean(' fe80::223:6cff:fe8a:2e8a '), 'fe80::=
223:6cff:fe8a:2e8a')=0A=
> +-        self.assertEqual(f.clean(' 2a02::223:6cff:fe8a:2e8a '), '2a02::=
223:6cff:fe8a:2e8a')=0A=
> ++        self.assertEqual(=0A=
> ++            f.clean(" " * MAX_IPV6_ADDRESS_LENGTH + " 2a02::223:6cff:fe=
8a:2e8a "),=0A=
> ++            "2a02::223:6cff:fe8a:2e8a",=0A=
> ++            )=0A=
> +         with self.assertRaisesMessage(ValidationError, "'This is not a =
valid IPv6 address.'"):=0A=
> +             f.clean('12345:2:3:4')=0A=
> +         with self.assertRaisesMessage(ValidationError, "'This is not a =
valid IPv6 address.'"):=0A=
> +diff --git a/tests/utils_tests/test_ipv6.py b/tests/utils_tests/test_ipv=
6.py=0A=
> +index 4e434f3..1ac6763 100644=0A=
> +--- a/tests/utils_tests/test_ipv6.py=0A=
> ++++ b/tests/utils_tests/test_ipv6.py=0A=
> +@@ -1,9 +1,17 @@=0A=
> +-import unittest=0A=
> ++import traceback=0A=
> ++from io import StringIO=0A=
> +=0A=
> +-from django.utils.ipv6 import clean_ipv6_address, is_valid_ipv6_address=
=0A=
> ++from django.core.exceptions import ValidationError=0A=
> ++from django.test import SimpleTestCase=0A=
> ++from django.utils.ipv6 import (=0A=
> ++    MAX_IPV6_ADDRESS_LENGTH,=0A=
> ++    clean_ipv6_address,=0A=
> ++    is_valid_ipv6_address,=0A=
> ++)=0A=
> ++from django.utils.version import PY310=0A=
> +=0A=
> +=0A=
> +-class TestUtilsIPv6(unittest.TestCase):=0A=
> ++class TestUtilsIPv6(SimpleTestCase):=0A=
> +=0A=
> +     def test_validates_correct_plain_address(self):=0A=
> +         self.assertTrue(is_valid_ipv6_address('fe80::223:6cff:fe8a:2e8a=
'))=0A=
> +@@ -55,3 +63,29 @@ class TestUtilsIPv6(unittest.TestCase):=0A=
> +         self.assertEqual(clean_ipv6_address('::ffff:0a0a:0a0a', unpack_=
ipv4=3DTrue), '10.10.10.10')=0A=
> +         self.assertEqual(clean_ipv6_address('::ffff:1234:1234', unpack_=
ipv4=3DTrue), '18.52.18.52')=0A=
> +         self.assertEqual(clean_ipv6_address('::ffff:18.52.18.52', unpac=
k_ipv4=3DTrue), '18.52.18.52')=0A=
> ++=0A=
> ++    def test_address_too_long(self):=0A=
> ++        addresses =3D [=0A=
> ++            "0000:0000:0000:0000:0000:ffff:192.168.100.228",  # IPv4-ma=
pped IPv6 address=0A=
> ++            "0000:0000:0000:0000:0000:ffff:192.168.100.228%123456",  # =
% scope/zone=0A=
> ++            "fe80::223:6cff:fe8a:2e8a:1234:5678:00000",  # MAX_IPV6_ADD=
RESS_LENGTH + 1=0A=
> ++        ]=0A=
> ++        msg =3D "This is the error message."=0A=
> ++        value_error_msg =3D "Unable to convert %s to an IPv6 address (v=
alue too long)."=0A=
> ++        for addr in addresses:=0A=
> ++            with self.subTest(addr=3Daddr):=0A=
> ++                self.assertGreater(len(addr), MAX_IPV6_ADDRESS_LENGTH)=
=0A=
> ++                self.assertEqual(is_valid_ipv6_address(addr), False)=0A=
> ++                with self.assertRaisesMessage(ValidationError, msg) as =
ctx:=0A=
> ++                    clean_ipv6_address(addr, error_message=3Dmsg)=0A=
> ++                exception_traceback =3D StringIO()=0A=
> ++                if PY310:=0A=
> ++                    traceback.print_exception(ctx.exception, file=3Dexc=
eption_traceback)=0A=
> ++                else:=0A=
> ++                    traceback.print_exception(=0A=
> ++                        type(ctx.exception),=0A=
> ++                        value=3Dctx.exception,=0A=
> ++                        tb=3Dctx.exception.__traceback__,=0A=
> ++                        file=3Dexception_traceback,=0A=
> ++                    )=0A=
> ++                self.assertIn(value_error_msg % addr, exception_traceba=
ck.getvalue())=0A=
> +--=0A=
> +2.40.0=0A=
> +=0A=
> diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.17/CV=
E-2024-56374.patch b/meta-python/recipes-devtools/python/python3-django-4.2=
.17/CVE-2024-56374.patch=0A=
> new file mode 100644=0A=
> index 0000000000..cee4be249e=0A=
> --- /dev/null=0A=
> +++ b/meta-python/recipes-devtools/python/python3-django-4.2.17/CVE-2024-=
56374.patch=0A=
> @@ -0,0 +1,354 @@=0A=
> +From ed42ea878033ef6b8bbc811140108816021b1d50 Mon Sep 17 00:00:00 2001=
=0A=
> +From: Natalia <124304+nessita@users.noreply.github.com>=0A=
> +Date: Mon, 6 Jan 2025 15:51:45 -0300=0A=
> +Subject: [PATCH] Fixed CVE-2024-56374 -- Mitigated potential DoS in IPv6=
=0A=
> +=0A=
> + validation.=0A=
> +=0A=
> +Thanks Saravana Kumar for the report, and Sarah Boyce and Mariusz=0A=
> +Felisiak for the reviews.=0A=
> +=0A=
> +CVE: CVE-2024-56374=0A=
> +=0A=
> +Upstream-Status: Backport=0A=
> +https://github.com/django/django/commit/ad866a1ca3e7d60da888d25d27e46a8a=
db2ed36e=0A=
> +=0A=
> +Signed-off-by: Natalia <124304+nessita@users.noreply.github.com>=0A=
> +Co-authored-by: Natalia <124304+nessita@users.noreply.github.com>=0A=
> +Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.co=
m>=0A=
> +=0A=
> +%% original patch: CVE-2024-56374.patch=0A=
> +---=0A=
> + Django.egg-info/PKG-INFO                      | 11 ++---=0A=
> + Django.egg-info/entry_points.txt              |  1 +=0A=
> + django/db/models/fields/__init__.py           |  6 +--=0A=
> + django/forms/fields.py                        |  7 +++-=0A=
> + django/utils/ipv6.py                          | 19 +++++++--=0A=
> + docs/ref/forms/fields.txt                     | 13 +++++-=0A=
> + docs/releases/4.2.17.txt                      | 11 +++++=0A=
> + .../field_tests/test_genericipaddressfield.py | 33 ++++++++++++++-=0A=
> + tests/utils_tests/test_ipv6.py                | 40 +++++++++++++++++--=
=0A=
> + 9 files changed, 119 insertions(+), 22 deletions(-)=0A=
> +=0A=
> +diff --git a/Django.egg-info/PKG-INFO b/Django.egg-info/PKG-INFO=0A=
> +index 77b00b7..6159219 100644=0A=
> +--- a/Django.egg-info/PKG-INFO=0A=
> ++++ b/Django.egg-info/PKG-INFO=0A=
> +@@ -11,6 +11,7 @@ Project-URL: Release notes, https://docs.djangoproject=
.com/en/stable/releases/=0A=
> + Project-URL: Funding, https://www.djangoproject.com/fundraising/=0A=
> + Project-URL: Source, https://github.com/django/django=0A=
> + Project-URL: Tracker, https://code.djangoproject.com/=0A=
> ++Platform: UNKNOWN=0A=
> + Classifier: Development Status :: 5 - Production/Stable=0A=
> + Classifier: Environment :: Web Environment=0A=
> + Classifier: Framework :: Django=0A=
> +@@ -31,17 +32,11 @@ Classifier: Topic :: Internet :: WWW/HTTP :: WSGI=0A=
> + Classifier: Topic :: Software Development :: Libraries :: Application F=
rameworks=0A=
> + Classifier: Topic :: Software Development :: Libraries :: Python Module=
s=0A=
> + Requires-Python: >=3D3.8=0A=
> ++Provides-Extra: argon2=0A=
> ++Provides-Extra: bcrypt=0A=
> + License-File: LICENSE=0A=
> + License-File: LICENSE.python=0A=
> + License-File: AUTHORS=0A=
> +-Requires-Dist: asgiref<4,>=3D3.6.0=0A=
> +-Requires-Dist: backports.zoneinfo; python_version < "3.9"=0A=
> +-Requires-Dist: sqlparse>=3D0.3.1=0A=
> +-Requires-Dist: tzdata; sys_platform =3D=3D "win32"=0A=
> +-Provides-Extra: argon2=0A=
> +-Requires-Dist: argon2-cffi>=3D19.1.0; extra =3D=3D "argon2"=0A=
> +-Provides-Extra: bcrypt=0A=
> +-Requires-Dist: bcrypt; extra =3D=3D "bcrypt"=0A=
> +=0A=
> + =3D=3D=3D=3D=3D=3D=0A=
> + Django=0A=
> +diff --git a/Django.egg-info/entry_points.txt b/Django.egg-info/entry_po=
ints.txt=0A=
> +index eaeb88e..22df67e 100644=0A=
> +--- a/Django.egg-info/entry_points.txt=0A=
> ++++ b/Django.egg-info/entry_points.txt=0A=
> +@@ -1,2 +1,3 @@=0A=
> + [console_scripts]=0A=
> + django-admin =3D django.core.management:execute_from_command_line=0A=
> ++=0A=
> +diff --git a/django/db/models/fields/__init__.py b/django/db/models/fiel=
ds/__init__.py=0A=
> +index b65948d..0cfba4e 100644=0A=
> +--- a/django/db/models/fields/__init__.py=0A=
> ++++ b/django/db/models/fields/__init__.py=0A=
> +@@ -25,7 +25,7 @@ from django.utils.dateparse import (=0A=
> + )=0A=
> + from django.utils.duration import duration_microseconds, duration_strin=
g=0A=
> + from django.utils.functional import Promise, cached_property=0A=
> +-from django.utils.ipv6 import clean_ipv6_address=0A=
> ++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH, clean_ipv6_addre=
ss=0A=
> + from django.utils.itercompat import is_iterable=0A=
> + from django.utils.text import capfirst=0A=
> + from django.utils.translation import gettext_lazy as _=0A=
> +@@ -2160,7 +2160,7 @@ class GenericIPAddressField(Field):=0A=
> +             invalid_error_message,=0A=
> +         ) =3D validators.ip_address_validators(protocol, unpack_ipv4)=
=0A=
> +         self.default_error_messages["invalid"] =3D invalid_error_messag=
e=0A=
> +-        kwargs["max_length"] =3D 39=0A=
> ++        kwargs["max_length"] =3D MAX_IPV6_ADDRESS_LENGTH=0A=
> +         super().__init__(verbose_name, name, *args, **kwargs)=0A=
> +=0A=
> +     def check(self, **kwargs):=0A=
> +@@ -2187,7 +2187,7 @@ class GenericIPAddressField(Field):=0A=
> +             kwargs["unpack_ipv4"] =3D self.unpack_ipv4=0A=
> +         if self.protocol !=3D "both":=0A=
> +             kwargs["protocol"] =3D self.protocol=0A=
> +-        if kwargs.get("max_length") =3D=3D 39:=0A=
> ++        if kwargs.get("max_length") =3D=3D self.max_length:=0A=
> +             del kwargs["max_length"]=0A=
> +         return name, path, args, kwargs=0A=
> +=0A=
> +diff --git a/django/forms/fields.py b/django/forms/fields.py=0A=
> +index 01cd831..e62417f 100644=0A=
> +--- a/django/forms/fields.py=0A=
> ++++ b/django/forms/fields.py=0A=
> +@@ -42,7 +42,7 @@ from django.forms.widgets import (=0A=
> + from django.utils import formats=0A=
> + from django.utils.dateparse import parse_datetime, parse_duration=0A=
> + from django.utils.duration import duration_string=0A=
> +-from django.utils.ipv6 import clean_ipv6_address=0A=
> ++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH, clean_ipv6_addre=
ss=0A=
> + from django.utils.regex_helper import _lazy_re_compile=0A=
> + from django.utils.translation import gettext_lazy as _=0A=
> + from django.utils.translation import ngettext_lazy=0A=
> +@@ -1284,6 +1284,7 @@ class GenericIPAddressField(CharField):=0A=
> +         self.default_validators =3D validators.ip_address_validators(=
=0A=
> +             protocol, unpack_ipv4=0A=
> +         )[0]=0A=
> ++        kwargs.setdefault("max_length", MAX_IPV6_ADDRESS_LENGTH)=0A=
> +         super().__init__(**kwargs)=0A=
> +=0A=
> +     def to_python(self, value):=0A=
> +@@ -1291,7 +1292,9 @@ class GenericIPAddressField(CharField):=0A=
> +             return ""=0A=
> +         value =3D value.strip()=0A=
> +         if value and ":" in value:=0A=
> +-            return clean_ipv6_address(value, self.unpack_ipv4)=0A=
> ++            return clean_ipv6_address(=0A=
> ++                value, self.unpack_ipv4, max_length=3Dself.max_length=
=0A=
> ++            )=0A=
> +         return value=0A=
> +=0A=
> +=0A=
> +diff --git a/django/utils/ipv6.py b/django/utils/ipv6.py=0A=
> +index 88dd6ec..de41a97 100644=0A=
> +--- a/django/utils/ipv6.py=0A=
> ++++ b/django/utils/ipv6.py=0A=
> +@@ -3,9 +3,22 @@ import ipaddress=0A=
> + from django.core.exceptions import ValidationError=0A=
> + from django.utils.translation import gettext_lazy as _=0A=
> +=0A=
> ++MAX_IPV6_ADDRESS_LENGTH =3D 39=0A=
> ++=0A=
> ++=0A=
> ++def _ipv6_address_from_str(ip_str, max_length=3DMAX_IPV6_ADDRESS_LENGTH=
):=0A=
> ++    if len(ip_str) > max_length:=0A=
> ++        raise ValueError(=0A=
> ++            f"Unable to convert {ip_str} to an IPv6 address (value too =
long)."=0A=
> ++        )=0A=
> ++    return ipaddress.IPv6Address(int(ipaddress.IPv6Address(ip_str)))=0A=
> ++=0A=
> +=0A=
> + def clean_ipv6_address(=0A=
> +-    ip_str, unpack_ipv4=3DFalse, error_message=3D_("This is not a valid=
 IPv6 address.")=0A=
> ++    ip_str,=0A=
> ++    unpack_ipv4=3DFalse,=0A=
> ++    error_message=3D_("This is not a valid IPv6 address."),=0A=
> ++    max_length=3DMAX_IPV6_ADDRESS_LENGTH,=0A=
> + ):=0A=
> +     """=0A=
> +     Clean an IPv6 address string.=0A=
> +@@ -24,7 +37,7 @@ def clean_ipv6_address(=0A=
> +     Return a compressed IPv6 address or the same value.=0A=
> +     """=0A=
> +     try:=0A=
> +-        addr =3D ipaddress.IPv6Address(int(ipaddress.IPv6Address(ip_str=
)))=0A=
> ++        addr =3D _ipv6_address_from_str(ip_str, max_length)=0A=
> +     except ValueError:=0A=
> +         raise ValidationError(error_message, code=3D"invalid")=0A=
> +=0A=
> +@@ -41,7 +54,7 @@ def is_valid_ipv6_address(ip_str):=0A=
> +     Return whether or not the `ip_str` string is a valid IPv6 address.=
=0A=
> +     """=0A=
> +     try:=0A=
> +-        ipaddress.IPv6Address(ip_str)=0A=
> ++        _ipv6_address_from_str(ip_str)=0A=
> +     except ValueError:=0A=
> +         return False=0A=
> +     return True=0A=
> +diff --git a/docs/ref/forms/fields.txt b/docs/ref/forms/fields.txt=0A=
> +index 1a7274e..76b4587 100644=0A=
> +--- a/docs/ref/forms/fields.txt=0A=
> ++++ b/docs/ref/forms/fields.txt=0A=
> +@@ -719,7 +719,7 @@ For each field, we describe the default widget used =
if you don't specify=0A=
> +     * Empty value: ``''`` (an empty string)=0A=
> +     * Normalizes to: A string. IPv6 addresses are normalized as describ=
ed below.=0A=
> +     * Validates that the given value is a valid IP address.=0A=
> +-    * Error message keys: ``required``, ``invalid``=0A=
> ++    * Error message keys: ``required``, ``invalid``, ``max_length``=0A=
> +=0A=
> +     The IPv6 address normalization follows :rfc:`4291#section-2.2` sect=
ion 2.2,=0A=
> +     including using the IPv4 format suggested in paragraph 3 of that se=
ction, like=0A=
> +@@ -727,7 +727,7 @@ For each field, we describe the default widget used =
if you don't specify=0A=
> +     ``2001::1``, and ``::ffff:0a0a:0a0a`` to ``::ffff:10.10.10.10``. Al=
l characters=0A=
> +     are converted to lowercase.=0A=
> +=0A=
> +-    Takes two optional arguments:=0A=
> ++    Takes three optional arguments:=0A=
> +=0A=
> +     .. attribute:: protocol=0A=
> +=0A=
> +@@ -742,6 +742,15 @@ For each field, we describe the default widget used=
 if you don't specify=0A=
> +         ``192.0.2.1``. Default is disabled. Can only be used=0A=
> +         when ``protocol`` is set to ``'both'``.=0A=
> +=0A=
> ++    .. attribute:: max_length=0A=
> ++=0A=
> ++        Defaults to 39, and behaves the same way as it does for=0A=
> ++        :class:`CharField`.=0A=
> ++=0A=
> ++    .. versionchanged:: 4.2.18=0A=
> ++=0A=
> ++        The default value for ``max_length`` was set to 39 characters.=
=0A=
> ++=0A=
> + ``ImageField``=0A=
> + --------------=0A=
> +=0A=
> +diff --git a/docs/releases/4.2.17.txt b/docs/releases/4.2.17.txt=0A=
> +index 0475a96..1392724 100644=0A=
> +--- a/docs/releases/4.2.17.txt=0A=
> ++++ b/docs/releases/4.2.17.txt=0A=
> +@@ -39,3 +39,14 @@ CVE-2025-26699: Potential denial-of-service vulnerabi=
lity in ``django.utils.text=0A=
> + The ``wrap()`` and :tfilter:`wordwrap` template filter were subject to =
a=0A=
> + potential denial-of-service attack when used with very long strings.=0A=
> +=0A=
> ++CVE-2024-56374: Potential denial-of-service vulnerability in IPv6 valid=
ation=0A=
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=0A=
> ++=0A=
> ++Lack of upper bound limit enforcement in strings passed when performing=
 IPv6=0A=
> ++validation could lead to a potential denial-of-service attack. The undo=
cumented=0A=
> ++and private functions ``clean_ipv6_address`` and ``is_valid_ipv6_addres=
s`` were=0A=
> ++vulnerable, as was the  :class:`django.forms.GenericIPAddressField` for=
m field,=0A=
> ++which has now been updated to define a ``max_length`` of 39 characters.=
=0A=
> ++=0A=
> ++The :class:`django.db.models.GenericIPAddressField` model field was not=
=0A=
> ++affected.=0A=
> +diff --git a/tests/forms_tests/field_tests/test_genericipaddressfield.py=
 b/tests/forms_tests/field_tests/test_genericipaddressfield.py=0A=
> +index 80722f5..ef00a72 100644=0A=
> +--- a/tests/forms_tests/field_tests/test_genericipaddressfield.py=0A=
> ++++ b/tests/forms_tests/field_tests/test_genericipaddressfield.py=0A=
> +@@ -1,6 +1,7 @@=0A=
> + from django.core.exceptions import ValidationError=0A=
> + from django.forms import GenericIPAddressField=0A=
> + from django.test import SimpleTestCase=0A=
> ++from django.utils.ipv6 import MAX_IPV6_ADDRESS_LENGTH=0A=
> +=0A=
> +=0A=
> + class GenericIPAddressFieldTest(SimpleTestCase):=0A=
> +@@ -125,6 +126,35 @@ class GenericIPAddressFieldTest(SimpleTestCase):=0A=
> +         ):=0A=
> +             f.clean("1:2")=0A=
> +=0A=
> ++    def test_generic_ipaddress_max_length_custom(self):=0A=
> ++        # Valid IPv4-mapped IPv6 address, len 45.=0A=
> ++        addr =3D "0000:0000:0000:0000:0000:ffff:192.168.100.228"=0A=
> ++        f =3D GenericIPAddressField(max_length=3Dlen(addr))=0A=
> ++        f.clean(addr)=0A=
> ++=0A=
> ++    def test_generic_ipaddress_max_length_validation_error(self):=0A=
> ++        # Valid IPv4-mapped IPv6 address, len 45.=0A=
> ++        addr =3D "0000:0000:0000:0000:0000:ffff:192.168.100.228"=0A=
> ++=0A=
> ++        cases =3D [=0A=
> ++            ({}, MAX_IPV6_ADDRESS_LENGTH),  # Default value.=0A=
> ++            ({"max_length": len(addr) - 1}, len(addr) - 1),=0A=
> ++        ]=0A=
> ++        for kwargs, max_length in cases:=0A=
> ++            max_length_plus_one =3D max_length + 1=0A=
> ++            msg =3D (=0A=
> ++                f"Ensure this value has at most {max_length} characters=
 (it has "=0A=
> ++                f"{max_length_plus_one}).'"=0A=
> ++            )=0A=
> ++            with self.subTest(max_length=3Dmax_length):=0A=
> ++                f =3D GenericIPAddressField(**kwargs)=0A=
> ++                with self.assertRaisesMessage(ValidationError, msg):=0A=
> ++                    f.clean("x" * max_length_plus_one)=0A=
> ++                with self.assertRaisesMessage(=0A=
> ++                    ValidationError, "This is not a valid IPv6 address.=
"=0A=
> ++                ):=0A=
> ++                    f.clean(addr)=0A=
> ++=0A=
> +     def test_generic_ipaddress_as_generic_not_required(self):=0A=
> +         f =3D GenericIPAddressField(required=3DFalse)=0A=
> +         self.assertEqual(f.clean(""), "")=0A=
> +@@ -150,7 +180,8 @@ class GenericIPAddressFieldTest(SimpleTestCase):=0A=
> +             f.clean(" fe80::223:6cff:fe8a:2e8a "), "fe80::223:6cff:fe8a=
:2e8a"=0A=
> +         )=0A=
> +         self.assertEqual(=0A=
> +-            f.clean(" 2a02::223:6cff:fe8a:2e8a "), "2a02::223:6cff:fe8a=
:2e8a"=0A=
> ++            f.clean(" " * MAX_IPV6_ADDRESS_LENGTH + " 2a02::223:6cff:fe=
8a:2e8a "),=0A=
> ++            "2a02::223:6cff:fe8a:2e8a",=0A=
> +         )=0A=
> +         with self.assertRaisesMessage(=0A=
> +             ValidationError, "'This is not a valid IPv6 address.'"=0A=
> +diff --git a/tests/utils_tests/test_ipv6.py b/tests/utils_tests/test_ipv=
6.py=0A=
> +index bf78ed9..2d06507 100644=0A=
> +--- a/tests/utils_tests/test_ipv6.py=0A=
> ++++ b/tests/utils_tests/test_ipv6.py=0A=
> +@@ -1,9 +1,17 @@=0A=
> +-import unittest=0A=
> ++import traceback=0A=
> ++from io import StringIO=0A=
> +=0A=
> +-from django.utils.ipv6 import clean_ipv6_address, is_valid_ipv6_address=
=0A=
> ++from django.core.exceptions import ValidationError=0A=
> ++from django.test import SimpleTestCase=0A=
> ++from django.utils.ipv6 import (=0A=
> ++    MAX_IPV6_ADDRESS_LENGTH,=0A=
> ++    clean_ipv6_address,=0A=
> ++    is_valid_ipv6_address,=0A=
> ++)=0A=
> ++from django.utils.version import PY310=0A=
> +=0A=
> +=0A=
> +-class TestUtilsIPv6(unittest.TestCase):=0A=
> ++class TestUtilsIPv6(SimpleTestCase):=0A=
> +     def test_validates_correct_plain_address(self):=0A=
> +         self.assertTrue(is_valid_ipv6_address("fe80::223:6cff:fe8a:2e8a=
"))=0A=
> +         self.assertTrue(is_valid_ipv6_address("2a02::223:6cff:fe8a:2e8a=
"))=0A=
> +@@ -64,3 +72,29 @@ class TestUtilsIPv6(unittest.TestCase):=0A=
> +         self.assertEqual(=0A=
> +             clean_ipv6_address("::ffff:18.52.18.52", unpack_ipv4=3DTrue=
), "18.52.18.52"=0A=
> +         )=0A=
> ++=0A=
> ++    def test_address_too_long(self):=0A=
> ++        addresses =3D [=0A=
> ++            "0000:0000:0000:0000:0000:ffff:192.168.100.228",  # IPv4-ma=
pped IPv6 address=0A=
> ++            "0000:0000:0000:0000:0000:ffff:192.168.100.228%123456",  # =
% scope/zone=0A=
> ++            "fe80::223:6cff:fe8a:2e8a:1234:5678:00000",  # MAX_IPV6_ADD=
RESS_LENGTH + 1=0A=
> ++        ]=0A=
> ++        msg =3D "This is the error message."=0A=
> ++        value_error_msg =3D "Unable to convert %s to an IPv6 address (v=
alue too long)."=0A=
> ++        for addr in addresses:=0A=
> ++            with self.subTest(addr=3Daddr):=0A=
> ++                self.assertGreater(len(addr), MAX_IPV6_ADDRESS_LENGTH)=
=0A=
> ++                self.assertEqual(is_valid_ipv6_address(addr), False)=0A=
> ++                with self.assertRaisesMessage(ValidationError, msg) as =
ctx:=0A=
> ++                    clean_ipv6_address(addr, error_message=3Dmsg)=0A=
> ++                exception_traceback =3D StringIO()=0A=
> ++                if PY310:=0A=
> ++                    traceback.print_exception(ctx.exception, file=3Dexc=
eption_traceback)=0A=
> ++                else:=0A=
> ++                    traceback.print_exception(=0A=
> ++                        type(ctx.exception),=0A=
> ++                        value=3Dctx.exception,=0A=
> ++                        tb=3Dctx.exception.__traceback__,=0A=
> ++                        file=3Dexception_traceback,=0A=
> ++                    )=0A=
> ++                self.assertIn(value_error_msg % addr, exception_traceba=
ck.getvalue())=0A=
> +--=0A=
> +2.35.5=0A=
> +=0A=
> diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb=
 b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb=0A=
> index 24eee95f03..f4b8da69b5 100644=0A=
> --- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb=0A=
> +++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb=0A=
> @@ -26,6 +26,7 @@ SRC_URI +=3D "file://CVE-2023-31047.patch \=0A=
>              file://CVE-2024-53907.patch \=0A=
>              file://CVE-2024-27351.patch \=0A=
>              file://CVE-2025-26699.patch \=0A=
> +            file://CVE-2024-56374.patch \=0A=
>             "=0A=
>=0A=
>  SRC_URI[sha256sum] =3D "0200b657afbf1bc08003845ddda053c7641b9b24951e52ac=
d51f6abda33a7413"=0A=
> diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.23.bb=
 b/meta-python/recipes-devtools/python/python3-django_3.2.23.bb=0A=
> index 92a3886cbc..b8e8759467 100644=0A=
> --- a/meta-python/recipes-devtools/python/python3-django_3.2.23.bb=0A=
> +++ b/meta-python/recipes-devtools/python/python3-django_3.2.23.bb=0A=
> @@ -9,6 +9,7 @@ RDEPENDS:${PN} +=3D "\=0A=
>  SRC_URI +=3D "\=0A=
>       file://CVE-2024-27351.patch \=0A=
>       file://CVE-2025-26699.patch \=0A=
> +     file://CVE-2024-56374.patch \=0A=
>  "=0A=
>=0A=
>  # Set DEFAULT_PREFERENCE so that the LTS version of django is built by=
=0A=
> diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.17.bb=
 b/meta-python/recipes-devtools/python/python3-django_4.2.17.bb=0A=
> index c2b517a441..5377b96c79 100644=0A=
> --- a/meta-python/recipes-devtools/python/python3-django_4.2.17.bb=0A=
> +++ b/meta-python/recipes-devtools/python/python3-django_4.2.17.bb=0A=
> @@ -7,7 +7,10 @@ RDEPENDS:${PN} +=3D "\=0A=
>      ${PYTHON_PN}-sqlparse \=0A=
>  "=0A=
>=0A=
> -SRC_URI +=3D "file://CVE-2025-26699.patch"=0A=
> +SRC_URI +=3D "\=0A=
> +     file://CVE-2025-26699.patch \=0A=
> +     file://CVE-2024-56374.patch \=0A=
> +"=0A=
>=0A=
>  # Set DEFAULT_PREFERENCE so that the LTS version of django is built by=
=0A=
>  # default. To build the 4.x branch,=0A=
>=0A=
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=0A=
> Links: You receive all messages sent to this group.=0A=
> View/Reply Online (#121753): https://lists.openembedded.org/g/openembedde=
d-devel/message/121753=0A=
> Mute This Topic: https://lists.openembedded.org/mt/116332483/6084445=0A=
> Group Owner: openembedded-devel+owner@lists.openembedded.org=0A=
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [s=
kandigraun@gmail.com]=0A=
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=0A=
>=0A=
=0A=

