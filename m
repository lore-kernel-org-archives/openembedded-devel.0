Received: from esa9.fujitsucc.c3s2.iphmx.com (esa9.fujitsucc.c3s2.iphmx.com [68.232.159.90])
 by mx.groups.io with SMTP id smtpd.web09.5881.1623926817126227586
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jun 2021 03:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=vL2UjB+b;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.90, mailfrom: sekine.shigeki@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1623926817; x=1655462817;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=1AX5CdLa2R9T5nL9qdLGD8IMkNhgUkbmDcjyPMXFPYg=;
  b=vL2UjB+bB+GTTnXkQSaVTDdLL2vY/NO1KB2T9tOCJUUe/LNVLXf9jmp+
   CdT5qK46t3Y3XAThANlr1/Hj7mMgEmVJ9vQ5pQSkqN31CAw6WqA0KciwK
   OYo5/YPrc56xTL6j3wonrO0vilh4WyW/wxHyZOW+bG/R+a/rkXHsaOzt1
   8QBCJIL8NoTsI7EdFbAe+MG5X9j0RzauKJhOyl9rm7GhNO/GA4OObrUXo
   VKmap19AAJvnJrmbL+mXmDYQvIg9CZ2jy5MT494pOLtsoKLCv27h01yGr
   U2jqIumPwBVYP0ptiiYo3GeQSYEQXkhvPm/2Btqujx70LQ0DH3Wig9Q/3
   A==;
IronPort-SDR: f5Jm/VTDGAW0dYARAdl7vKY2lwUb+SVfioow6e9yslF1P6zUtxy897HdbhJ1GnH+Epx18gaTgy
 jMUodbKVVRkMqDc43WB2yBm4sRUHA0DDwt6sfcRbOBk5wbSgZ7lCPvgChmmWSf5da5Y53qG7cr
 woGwySQV05p+vmnBesZ9ZG6BTFV/8L7jrhUKtmHmNQL14XTxBOwNzVbUV9UrtAJkFu1JJoc9u8
 iz09o6QraIaREWfFFnaHg0Sl8gJEM4EjEED6zQyIIAri7VN8tk2CjT817yRrtCTOQOJVZ5Q+wI
 A6I=
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="33342693"
X-IronPort-AV: E=Sophos;i="5.83,280,1616425200"; 
   d="scan'208";a="33342693"
Received: from mail-os2jpn01lp2052.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.52])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 19:46:54 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DX3m00OD5SmYh8hK57Z+QItjmMOLOA5KGTgJdsJaZ6/NhXx/DWjlztck9NmZt4O37KbLmKRHm8rr1s1P5NumEgACkWvWhZn4HPWQNXcIXtD8CiZUl+ElYRyL0Z+uI/WqElnpeB217pUPp1MMD8JUwYWPN7mxHxbeDKWWRHo3/LU0L0DYEV6IIaxrhMevNivBABPCY6Z4EKpcSqIWazPEiL3G+gHlTfoq5UBKt1zpToXZLx6TMhmUbs4KbRny6gKDwoCFP49jaI53SvIGsssVG2wxOmijZrVIDUz1rSWwPVzzyEjbI4zoeOaKZ7A86jxm6tQmx799Q9OyqrI71wpwDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1AX5CdLa2R9T5nL9qdLGD8IMkNhgUkbmDcjyPMXFPYg=;
 b=IRl0jn4MsAVSfWy/rWghp4pVYgd8Aipsz8XbX6OsX5lQ5MPFBVnPKWcgrVtLu7/OlPcpddCbLhbVfJNmCLNONATvJz5b7SLyrxbFbhDTCCBEurbJutJit98T/sT3nQ/B0Noj1HLCWCZICWtCG2+pq6VnN3pxP9qBj1rV26D/mOEr4vpoI55LUmyhFmoVVR5ppLf35Fj7x3lcwtYDpKwO9my3RS4pPDtxsWCbQeL/SK7ji2gfvwWcB9KqBkx4zJtc7WWNBA+HoXGwwOJxGiRkCzDGCOdiMt62DjPlfKm3OdJOClxHn1MJ1ylRRjp+NEI9H+l0ich0o9nXn3PSWZbmmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1AX5CdLa2R9T5nL9qdLGD8IMkNhgUkbmDcjyPMXFPYg=;
 b=Az5r58wZc479c7XrNEjwTARQwPL2o8OWD1Vl7SgB05W8eSsD9RbYvT4i+z+K60h/BbzTBw4P2+DbU0Oxg32AtxiTDjyFHB13lF9zCUSqhZKuc6A6RMyIP+EUqWtXXLq3PcLetkGw3C+avKbQox1714nAgwk1yLrznX5YkalStfs=
Received: from OSBPR01MB4440.jpnprd01.prod.outlook.com (2603:1096:604:7d::21)
 by OS3PR01MB6791.jpnprd01.prod.outlook.com (2603:1096:604:12a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Thu, 17 Jun
 2021 10:46:51 +0000
Received: from OSBPR01MB4440.jpnprd01.prod.outlook.com
 ([fe80::59a0:5e20:ff73:bcbd]) by OSBPR01MB4440.jpnprd01.prod.outlook.com
 ([fe80::59a0:5e20:ff73:bcbd%3]) with mapi id 15.20.4219.025; Thu, 17 Jun 2021
 10:46:51 +0000
From: "Sekine Shigeki" <sekine.shigeki@fujitsu.com>
To: 'Armin Kuster' <akuster808@gmail.com>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [OE-core] [meta-oe][dunfell][PATCH] ntp: add CVE-2016-9312 to allowlist
Thread-Topic: [oe] [OE-core] [meta-oe][dunfell][PATCH] ntp: add CVE-2016-9312
 to allowlist
Thread-Index: AQHXYRqfZT1ofvk58kaK5dCcaUCPjasTqLaAgARgepA=
Date: Thu, 17 Jun 2021 10:46:51 +0000
Message-ID: 
 <OSBPR01MB4440741300D497F9F3DD807F940E9@OSBPR01MB4440.jpnprd01.prod.outlook.com>
References: <20210614124044.3746-1-sekine.shigeki@fujitsu.com>
 <97f50ef4-f51a-b125-bc8c-9afc9266fdb1@gmail.com>
In-Reply-To: <97f50ef4-f51a-b125-bc8c-9afc9266fdb1@gmail.com>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfRW5hYmxlZD10cnVlOyBNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJh?=
 =?utf-8?B?Yy1hYjRkLTNiMGY0ZmVjZTA1MF9TZXREYXRlPTIwMjEtMDYtMTdUMTA6NDY6?=
 =?utf-8?B?NTBaOyBNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0?=
 =?utf-8?B?ZmVjZTA1MF9NZXRob2Q9U3RhbmRhcmQ7IE1TSVBfTGFiZWxfYTcyOTVjYzEt?=
 =?utf-8?B?ZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX05hbWU9RlVKSVRTVS1SRVNU?=
 =?utf-8?B?UklDVEVE4oCLOyBNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9TaXRlSWQ9YTE5ZjEyMWQtODFlMS00ODU4LWE5ZDgt?=
 =?utf-8?B?NzM2ZTI2N2ZkNGM3OyBNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1h?=
 =?utf-8?B?YjRkLTNiMGY0ZmVjZTA1MF9BY3Rpb25JZD00N2RlMmYyOC1jNmQ0LTQzOTYt?=
 =?utf-8?B?OWE0Ni00MzM4MTU5NjYzZDk7IE1TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00?=
 =?utf-8?B?MmFjLWFiNGQtM2IwZjRmZWNlMDUwX0NvbnRlbnRCaXRzPTA=?=
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [210.162.30.53]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b22ffd5f-162f-4355-7a10-08d9317d374e
x-ms-traffictypediagnostic: OS3PR01MB6791:
x-microsoft-antispam-prvs: 
 <OS3PR01MB6791AF6D1B6A04551A11492C940E9@OS3PR01MB6791.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YFziuKdbQoVGO92nSsF6hmuQpW2nMn5GAyobSXSwLFaJCudHHonJd/afP2/t3arOnQRgNfjAahKBBNpeiw2aSx9D2z1cLjYiEV+F5lqhbsY94PeLv08mIbC+BfRR1tJkDUyzffzoqW7QoBjzjRpIfnPK2m+PvXcXZo3V8tExtDtfcfnKvhviLrEs2uQdBpXNcSO2seCd2vkbYQ4+1cAPk5zi4noqFaZUpJlIj0DUl9LFGrdTvsue1VsWBibo1Eo+UhgR9Usishb5Qv/bWp0Uchs1SeqJ4EcsLiz3H5t0TNIvXisye8AkvOS1yux53KcawKdp3NJwf3VtY7+1VzUtia3A8RE07ZgAV7DuKk86JtXFKFQhk1OBl8FcEYiEPskCMlhDd3VZqaz/3wNYzgep/+lYQZtQsj9rwd5wcMq7WTs1Iz25javaegqIaQLUS0nTkejZEw79Xpr3baMfyQ3YBF5aavldYQ/AUk2IqeX4UQtLXwJYlR8gqYUnyuxqL9vkk0HMv+FeFz1RAcDo7gsP1W0t8/F7jjCVIej+NCS7vP+PQPp9rkm3rLFkeCzDG31Zg+w8b49a5hSM6P+rbdR4sjZUEkOk4SragBowVR5kRF93ALhuCkhoFZ7/BbM0z/RdNJs7pFYVHIMqHYCCmLosso7s7oyBmTpDa+36rDqPUx8KoGSQxx1fc1u1pMw6erNUflqRWpx1Zm146Xp8SZ4KTudCa58qyLkGEoonexbDT98=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB4440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(8676002)(26005)(478600001)(83380400001)(66446008)(5660300002)(2906002)(64756008)(55016002)(66476007)(85182001)(33656002)(66556008)(38100700002)(53546011)(52536014)(71200400001)(76116006)(316002)(110136005)(7696005)(9686003)(66946007)(186003)(86362001)(122000001)(8936002)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RTJEWnlCNnBzdGNoaG1tOVhUbDMxbHdzbGExT1ZnYU1CdTRJZUlEUHNkWmF6?=
 =?utf-8?B?dzhEdWg0WHJ4SmYwaVB3WWVSa201L1JPdW9kMFU4MGZ2NHU2UVE5SS9EK2Rr?=
 =?utf-8?B?TEI4UCtuV2JKY3VzNi9UTExORnZTNk4wd05YNHhpTTBMSzMzc2x1SGdHMWd5?=
 =?utf-8?B?UkQzZmhOQmpHSEwrRWVsU1JKSGNRZE1zYm03SWdya3JUQ2Jqbk4vVWphVldv?=
 =?utf-8?B?eWt2WEN5eUczZFM3MmZCMzJ5UG93bUVIRHNQREthbVBGd292RlJscEdCeTJZ?=
 =?utf-8?B?eDhGVjZqZ1FsSTNYaURNZ2tTc0NIK2I2SlJyZXRDM1h5K1VyaFVlTmRIeGNs?=
 =?utf-8?B?dU5zMG9zWmJhdGRNa2FWa1pmenZ1TkJPbWRWa1VCaDBFcWdXZ0FhSS81L1hW?=
 =?utf-8?B?OE9hcDM1NDVEZUI0ZUViQklvUzJyWVRyN3B2VmJURkhMNUkyR09HS3h6cVk3?=
 =?utf-8?B?ejNaeCtOSDhlVy9xcmF4bWRWalBlRFNsdWs5RUZHK0FuNW5UVWZmd2ZrYm02?=
 =?utf-8?B?bWZ0VVFMOEJmQXZhS0YrV2RranNRNFNNZ1BhYXdEOURERGJtT3BONnZRaWdL?=
 =?utf-8?B?T05zVEU4MVZ6S1c0Y01PTm5VWHp4US9NLzdpb0tKRXFHby9YbFBxSUZsTldv?=
 =?utf-8?B?ZkNQd0N5bzNMY0NiK3NLbWwyM0x5M2RqR3BEMjVYUEV0Q1hWUHNwcllIK05p?=
 =?utf-8?B?SllicG43dDljUHRUQmlCN2tiNDlQNVdBSXMzMjRzN3p0bm5hQy9EMThaQXpo?=
 =?utf-8?B?ZlE2emkyeExua012ZWQ4bk94V2NiVHY5b3R3WEl1ZURTWFIyL3FJMHpmQy9K?=
 =?utf-8?B?UW8zSThNbTVrM01jWUVud25BcXE0UGlEOUxOQUhXcEJoWEFYZUkwOW5ieWJF?=
 =?utf-8?B?ZWdjNWlua0Z4QXRlcUVqYXVKRmUvUXpCYjJ6bDcyY3hHeGU0ZkVTY2tDdS9K?=
 =?utf-8?B?bnFObU84US9zUlFjN1dTQ2krSFYwWEYwcXhXOUoyZ0o5VjlCZ0VuZkZXcklN?=
 =?utf-8?B?d2h1dDNpcWpuTTVqa2tRWmJmanB0WjR6YTRlL3QyTlRvdzJHc2FJNW93TDFk?=
 =?utf-8?B?aTRicUloYjhzZXlNNmFhTDFIemcxU3o3OHhnY3BGOEExQjU2VVRwTzRNNmFl?=
 =?utf-8?B?QXlNZHVoV0x1cisrZjY3bks1QUxvbVVDcmdyVEhOekhJeXlsZW1SWWNvT09r?=
 =?utf-8?B?djlpZ3cxRXhOOXpieGpxM2JGZis1eVlOcXkzMXk5RFdtOUlicFhsVDdBVFZm?=
 =?utf-8?B?bzB4QjhoVndPR0FlSDl6VHU5RUh0MyttUzB1aHAzUVNEamcwR3lUWnlQVmMw?=
 =?utf-8?B?N1FCRjBxcTgxbTZ0bDBSbTBDUFpYZWhmQ2dQbTAwZVJVWDh3ak9kTEZxckRs?=
 =?utf-8?B?Vm1CcG5wdHd5czVVNzJYc29RNmZwK0V2NGdtYkQ1YTJ3Z3dnakF4akNvNG1v?=
 =?utf-8?B?SlhjdmpvMnpjeS92Vys5cC8vT1F6Z0k0MGp2Yld3Vm5yVW5veWgySnAzWHFt?=
 =?utf-8?B?aFo5MUdGNkt4amRHSGY4SWRHK25HdVB1Ums4MWgxUllhbzlnQ0FwV1BMVnY1?=
 =?utf-8?B?eGNacTl3TTduM3lwVTE1bDhmVHVxRCtjUWtURU5QZHhNcG9PZEZtRGpQZGNE?=
 =?utf-8?B?S0Qzc3FYZ0J1Q1lhc0JQVnkvRmdPWDdzNHlVUWRjWVJ2azdCdkVDUC84WHFM?=
 =?utf-8?B?QWs0MncveGVyb203eFdxaG1hNWZ3SUNNTnJLR3pNb0k2Mkx4ODcxTXBkVElR?=
 =?utf-8?Q?m11B3iUL5rc6spxe++ClyaQqPqOpbmkX4tI44BV?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB4440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b22ffd5f-162f-4355-7a10-08d9317d374e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 10:46:51.7529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yvGAe7BEMqG0mnSWMf0sxz4Cz8/RxSaDTiW0B77b0BQaHZStK/f1ZV0oE7JPcslx3l/k63JbEEsFzLpFU297FUj3DwAQ2jZS4VbFJdNCUak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6791
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U29ycnksIEkgbWFkZSBhIG1pc3Rha2Ugd2l0aCB0aGUgc3ViamVjdC4gSSB3aWxsIHJlc2VuZCB0
aGUgcmV2aXNlZCBvbmUgbGF0ZXIsIHNvIHBsZWFzZSBpZ25vcmUgaXQuDQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJl
aGFsZiBPZiBBcm1pbiBLdXN0ZXINClNlbnQ6IFR1ZXNkYXksIEp1bmUgMTUsIDIwMjEgMTI6NTQg
QU0NClRvOiBPcGVuRW1iZWRkZWQgRGV2ZWwgTGlzdCA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc+DQpTdWJqZWN0OiBSZTogW29lXSBbT0UtY29yZV0gW21ldGEtb2Vd
W2R1bmZlbGxdW1BBVENIXSBudHA6IGFkZCBDVkUtMjAxNi05MzEyIHRvIGFsbG93bGlzdA0KDQoN
Cg0KT24gNi8xNC8yMSA1OjQwIEFNLCBTZWtpbmUgU2hpZ2VraSB3cm90ZToNCj4gQ1ZFLTIwMTYt
OTMxMiBpcyBvbmx5IGZvciB3aW5kb3dzLg0KPiBTaWduZWQtb2ZmLWJ5OiBTZWtpbmUgU2hpZ2Vr
aSA8c2VraW5lLnNoaWdla2lAZnVqaXRzdS5jb20+DQo+IC0tLQ0KPiAgbWV0YS1uZXR3b3JraW5n
L3JlY2lwZXMtc3VwcG9ydC9udHAvbnRwXzQuMi44cDE1LmJiIHwgMyArKysNCj4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL21ldGEtbmV0d29ya2lu
Zy9yZWNpcGVzLXN1cHBvcnQvbnRwL250cF80LjIuOHAxNS5iYiBiL21ldGEtbmV0d29ya2luZy9y
ZWNpcGVzLXN1cHBvcnQvbnRwL250cF80LjIuOHAxNS5iYg0KPiBpbmRleCA3ZTE2ODgyNWUuLmU2
NjgxMTNjNSAxMDA2NDQNCj4gLS0tIGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9u
dHAvbnRwXzQuMi44cDE1LmJiDQo+ICsrKyBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBv
cnQvbnRwL250cF80LjIuOHAxNS5iYg0KPiBAQCAtMjYsNiArMjYsOSBAQCBTUkNfVVJJID0gImh0
dHA6Ly93d3cuZWVjaXMudWRlbC5lZHUvfm50cC9udHBfc3Bvb2wvbnRwNC9udHAtNC4yL250cC0k
e1BWfS50YXIuZw0KPiAgDQo+ICBTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjY1ODQwZGVhYjY4NjE0
ZDVkN2NlYjJkMGJiOTMwNGZmNzBkY2RlZGQwOWFiYjc5NzU0YTg3NTM2Yjg0OWMxOSINCkRvZXMg
dGhpcyBhZmZlY3QgSGFyZGtub3R0Pw0KDQo+ICANCj4gKyMgQ1ZFLTIwMTYtOTMxMiBpcyBvbmx5
IGZvciB3aW5kb3dzLg0KPiArQ1ZFX0NIRUNLX1dISVRFTElTVCArPSAiQ1ZFLTIwMTYtOTMxMiIN
Cj4gKw0KPiAgaW5oZXJpdCBhdXRvdG9vbHMgdXBkYXRlLXJjLmQgdXNlcmFkZCBzeXN0ZW1kIHBr
Z2NvbmZpZw0KPiAgDQo+ICAjIFRoZSBhY19jdl9oZWFkZXJfcmVhZGxpbmVfaGlzdG9yeSBpcyB0
byBzdG9wIG50cGRjIGRlcGVuZGluZyBvbiBlaXRoZXINCj4NCj4gDQo+DQoNCg==
