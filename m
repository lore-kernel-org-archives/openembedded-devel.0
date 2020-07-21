Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.86])
 by mx.groups.io with SMTP id smtpd.web11.676.1595350287066312805
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2020 09:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=Z9qzTDMp;
 spf=pass (domain: xevo.com, ip: 40.107.236.86, mailfrom: rrowe@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ee8XKu9rLXbikgtUF3GF7ut26RU6lD9n/eFL0UHjMhPrzpoYxrsmqixyp8aFLGeK7y33q/AsDWXmBjzZGBXOsFzP1b1Uyi2p6SUbOtdKAjVuZI1YIdmcBJvxzYdVu6+Eq4KanCzrTJqwltbc8U4ZPj7sEjHNYxpl2x3yC8ylDiel6xt79vbT/02WsZVBC1/hVS7anv1JJza1s8IUFG7j7I+m706NoKYjFydUyfA+t3S/OWxKrSgUfb70UyvBcJ8srt1pQEbbI4AgzgfrinJ6uO0edN9mp7ethOUaUNXDaHYdBztgkOlBCAL9DBXnC2CN+OZS+Ls4+JJCYleR9+MPBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7FbXooS/2p3JIaVp78EBlc/+eE7QtmB2TWdHfbt4nE=;
 b=AUb3NYBMUOUe7stlnB9ZJ8bLLtNL4OzC6ORG3c/eSSbLEUPu/12RGPH2Qy7Ehc19HJJSZjEaTq6jLZQKDlRi79nztjc3WakNo3+6GWm9XXVtgQlbDSbgn0Alp9i0jO9nz+tey9kB3D7/RGjneuXas0bBNmmISPZsnjXY3hvcZRyTZxrGcLlOkdjWWchhm9ed97evlYp8QHgb+mhe7WO8yIFXVhLE9uUduh0U77IAg+qlliPmTzfNkUF8jWFKiKyN7EJB1Bvsu97O6LC9IinoVeMY5OSxLU7pqwtBQP3szfr2sUmDMXgPijWHWmyr+Q9ewGQuX97to+dQEc4yKNSqFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7FbXooS/2p3JIaVp78EBlc/+eE7QtmB2TWdHfbt4nE=;
 b=Z9qzTDMpekZeqGp521tKWVuGOQiC74c+SGHMX0W1Ivzxqmp2EIEU6x2qwNtd5H4mwYdqA5/aao1vV5glJfuIA9UMHBX67vX55Rz53WfTkGrSSs7BGw/Sa3KYRyhf8Dp8oOuc9BSpCY13Vgfn2+Es2K2Sj8Rqv/xiM/5+CGEDvII=
Received: from MW3PR18MB3659.namprd18.prod.outlook.com (2603:10b6:303:53::19)
 by MWHPR18MB1184.namprd18.prod.outlook.com (2603:10b6:320:28::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Tue, 21 Jul
 2020 16:51:22 +0000
Received: from MW3PR18MB3659.namprd18.prod.outlook.com
 ([fe80::2821:7dbe:f513:2a72]) by MW3PR18MB3659.namprd18.prod.outlook.com
 ([fe80::2821:7dbe:f513:2a72%6]) with mapi id 15.20.3195.026; Tue, 21 Jul 2020
 16:51:22 +0000
From: "Ryan Rowe" <rrowe@xevo.com>
To: Trevor Gamblin <trevor.gamblin@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Jim Broadus <jbroadus@xevo.com>, Khem Raj <raj.khem@gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-pint: add missing python3-packaging dep
Thread-Topic: [oe] [meta-python][PATCH 2/2] python3-pint: add missing
 python3-packaging dep
Thread-Index: AQHWW8e17hJlgZnstkW1kNcFi7TCsqkSPeKA//+TiQA=
Date: Tue, 21 Jul 2020 16:51:22 +0000
Message-ID: <2B10C7D7-D03E-4189-953A-3DBCB4B678B7@xevo.com>
References: <20200716231839.48850-1-rrowe@xevo.com>
 <20200716231839.48850-2-rrowe@xevo.com>
 <892fa835-302c-8367-ad12-a5d534c8dfd4@windriver.com>
In-Reply-To: <892fa835-302c-8367-ad12-a5d534c8dfd4@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none header.from=xevo.com;
x-originating-ip: [2601:602:8900:814:88c4:81e4:4897:d7ee]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad069af4-a1c8-450d-c6ed-08d82d964cb6
x-ms-traffictypediagnostic: MWHPR18MB1184:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <MWHPR18MB11847517AD0701CB10B92007CC780@MWHPR18MB1184.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qur6rZGFuYS6UOS4hsVpODj6W9WGXX4quggnOpAZ7T+LQeePFs0tQ58Tiw2ZBCdWGjM4kHCvXYCJ4fh+mbJt6/B5ZbkNtFeA5l0FdJt+2Fh1KQzrRwB4uhI5pisCwnVpPhydOwgQXs4TgTowo/uAja7T33eqBaLnc7wnRdW81erDqpM/Ccex/OAL/VBIB0SGz4Bviiz8va2P8yZXBzavk20LaHQtXxHNzEXiSIl0AZMbOp/HKhaE8D5KFsg3yrBE2HPPtEdrbmsvRAAzJHVtygQ9B0DIM8BTB39cim1ddYqq/9dNI9Y7aEM6bVPqB8TW9Rw/K4qB9sf+qRsWwGfHkg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR18MB3659.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(366004)(346002)(376002)(39840400004)(136003)(66946007)(316002)(76116006)(66446008)(66476007)(8676002)(83380400001)(33656002)(64756008)(66556008)(110136005)(2906002)(5660300002)(4326008)(6486002)(53546011)(6512007)(54906003)(6506007)(8936002)(2616005)(186003)(86362001)(71200400001)(478600001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 mTGuVo8R46BoXpF04ZJ6/emz4fFwdDuK7YKW5+xqMbWbg/ny5+XJgBFHyPKv8OM3FNYmw5VxO1kv/T23yUMWPs7r79122dKJveZHLxGuPLCSJUhEqBYLCJ0zuxqZD9oQFSxHFG80czlXfgw4ZnNgBmKQb8KYdzHhpJ/sWHgWr6gqllbBC7mkFUdhMqoQEDZ36RQcmxG7tV9R1U1mb+C14ji/bp2s1DXBCo7C0UittF+1rG6t5kl+FyVa1fsjKdk3FMHE3KstBAClJH6Woyr5R3jivKsBKkc5tXmU0Sas5qKk1i3rdC+zBx0siWpW6cTYBXx5zI1NgM3ot/ajegPzwMwbic0IBox46lQ+vZk2fXL3LCbj9D4I2g1hvriN56BQqOoGZA+xRT4pCMhFPSrRHNPdYI/vkeJgykW5pOYI8y/JiRprop7jHW/Fegrn9wjnlJXyrYseYx/LoXnZfEqnCUriR/HrPiw6usswG28gF/V06iCyy9/cjSowC6+BFmWHmv3eVK0n7+DTYjLEs44fvBXg3G4yHGEw3JGHgXVTIBw=
MIME-Version: 1.0
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR18MB3659.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad069af4-a1c8-450d-c6ed-08d82d964cb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2020 16:51:22.5887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XVjsRx1DtlKjGpTvXkUth+MiLe7Yh8KBIvtOTCCnXbN0jnd26mGI0CbLfai/IUSx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR18MB1184
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6FFBCFA1D672E439371DC2B95009208@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64

U29ycnkgYWJvdXQgdGhhdCwgZGlkbid0IHNlZSB0aGVzZSB0d28gbWVzc2FnZXMgdW50aWwgbm93
Lg0KDQogICAgT24gNy8yMS8yMCA5OjE5IEFNLCBUcmV2b3IgR2FtYmxpbiB3cm90ZToNCiAgICAg
ICAgT24gNy8xNi8yMCA3OjE4IFBNLCBSeWFuIFJvd2Ugd3JvdGU6DQoNCiAgICAgICAgU2lnbmVk
LW9mZi1ieTogUnlhbiBSb3dlIG1haWx0bzpycm93ZUB4ZXZvLmNvbQ0KDQogICAgTmVlZHMgcHl0
aG9uMy1zZXR1cHRvb2xzIGFuZCBweXRob24zLXBhY2thZ2luZyBpbiBSREVQRU5EUyB0byBpbXBv
cnQgY2xlYW5seS4gSSdtIGdvaW5nIHRvIHNlbmQgYSBmb2xsb3ctdXAgcGF0Y2ggZm9yIHRoYXQg
c2hvcnRseToNCg0KICAgID4+PiBpbXBvcnQgcGludA0KICAgIFRyYWNlYmFjayAobW9zdCByZWNl
bnQgY2FsbCBsYXN0KToNCiAgICAgIEZpbGUgIjxzdGRpbj4iLCBsaW5lIDEsIGluIDxtb2R1bGU+
DQogICAgICBGaWxlICIvdXNyL2xpYi9weXRob24zLjgvc2l0ZS1wYWNrYWdlcy9waW50L19faW5p
dF9fLnB5IiwgbGluZSAyOCwgaW4gPG1vZHVsZT4NCiAgICAgICAgZnJvbSAucmVnaXN0cnkgaW1w
b3J0IExhenlSZWdpc3RyeSwgVW5pdFJlZ2lzdHJ5DQogICAgICBGaWxlICIvdXNyL2xpYi9weXRo
b24zLjgvc2l0ZS1wYWNrYWdlcy9waW50L3JlZ2lzdHJ5LnB5IiwgbGluZSA0OSwgaW4gPG1vZHVs
ZT4NCiAgICAgICAgaW1wb3J0IHBrZ19yZXNvdXJjZXMNCiAgICBNb2R1bGVOb3RGb3VuZEVycm9y
OiBObyBtb2R1bGUgbmFtZWQgJ3BrZ19yZXNvdXJjZXMnDQoNClN0cmFuZ2UuLi4gSSB0ZXN0ZWQg
dGhlc2UgdHdvIHBhdGNoZXMgYXMgYmJhcHBlbmRzIGluIG91ciBtZXRhIGxheWVyIHdpdGggbm8g
aXNzdWVzLg0KUGVyaGFwcyB0aGF0IHBhdGggZGlkbid0IGxvYWQgdGhlIHVuaXQgcmVnaXN0cnku
IFRoYW5rcyBmb3IgdGFraW5nIGNhcmUgb2YgdGhpcy4NCg0KICAgIEFja2VkLWJ5OiBUcmV2b3Ig
R2FtYmxpbiBtYWlsdG86dHJldm9yLmdhbWJsaW5Ad2luZHJpdmVyLmNvbQ0KDQogICAgICAgIC0t
LQ0KICAgICAgICAgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
aW50XzAuMTQuYmIgfCA0ICsrKysNCiAgICAgICAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykNCg0KICAgICAgICBkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1waW50XzAuMTQuYmIgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBpbnRfMC4xNC5iYg0KICAgICAgICBpbmRleCA4ZTE2MzA0NzYu
LmFiOGI0ZDc0ZCAxMDA2NDQNCiAgICAgICAgLS0tIGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1waW50XzAuMTQuYmINCiAgICAgICAgKysrIGIvbWV0YS1weXRo
b24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waW50XzAuMTQuYmINCiAgICAgICAg
QEAgLTIxLDYgKzIxLDEwIEBAIFNSQ19VUkkgKz0gIiBcDQogICAgICAgICAgICAvcnVuLXB0ZXN0
IFwNCiAgICAgICAgICINCg0KICAgICAgICArUkRFUEVORFNfJHtQTn0gKz0gIiBcDQogICAgICAg
ICsgICAgJHtQWVRIT05fUE59LXBhY2thZ2luZyBcDQogICAgICAgICsiDQogICAgICAgICsNCiAg
ICAgICAgIFJERVBFTkRTXyR7UE59LXB0ZXN0ICs9ICIgXA0KICAgICAgICAgICAgJHtQWVRIT05f
UE59LXB5dGVzdCBcDQogICAgICAgICAiDQoNCg==
