Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.71])
 by mx.groups.io with SMTP id smtpd.web11.332.1628614796056023612
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Aug 2021 09:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=OAFIwyms;
 spf=pass (domain: siemens.com, ip: 40.107.6.71, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGU0BN9PHB+3kxl1cZJiqpxm0fKWxzVFAwNfskC3Y2yzTyB4tjsluVKyVIVm4OcgUm1nMmjWRkS2dq/q2anJuCkt4yzHCkYUYh5X9bxDtwTLhV3TxQngr/owzzhazszB61A8GJkImF/b1U9qA88h0ho5XWEfqLYLYhIRM1NVd/R0GsncaxwtUJgEIDpsFua2Db9MCpLoVdwZmYQ+7IBquR6ugTRN/41ocKdVWlnu2rvcWmqUQdjtyQkWVw6F/bs+41RRIjvduHD0jOq+cJuO6Nk9PfW+O0cT3fZqGzUwMEcBEX2/8qciHb9DRROZwP7D5WOLU24EfAtxAogu7a5iYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNS421cniDhdDyORDDqii54IHBwSrJinRFQjPrtoi2k=;
 b=AgrN5+nHVEcpu8Jg8Chg7nN3U38XGgY+nI9ikvArdetOk+viMZtgJqMGvNqUQoldNxHpJWlSkiFIXlmSwjWezZsY+8OsOsWkhcEdsXUS5exvvgMTy6s5WQQ6axslJS8d3wCqJ6tkEXzwSqo4UJTePsprJ/sbBBEGZUbfswOnk99PjbwyQM7RRV9ZBM0Qa54slT0HRhK4WHR5Wt6eMzEzQzSjna9EqK3/fBJY1v1MXt6vCDfnGO4I/R5/xWqJM4zjL0hQxCGKwD+K2RXRgYp3V5BQS5PP36DGSuo9AJbA2CEupxEQFWhFXRC+qq9IKpY5ukZHqtDcLNrZdl+7GtgAvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNS421cniDhdDyORDDqii54IHBwSrJinRFQjPrtoi2k=;
 b=OAFIwymsDkXVlzEsYDDSUgXVtO0m+n/DuIBGNdLhTl7hIoY6Igs6PRON6LxfCRRX4LAV0laql52eiNFru0ISwhnsYCcajAa3vLZ4UxcdkpZJ9RbwMwwmnoekkS25+JvOsDoN/Gg15So4Mp3dDIrlqMOaloZzdYZ8tselznqWOhc=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB7PR10MB1993.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:5:10::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Tue, 10 Aug
 2021 16:59:53 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a95f:bc47:e21e:adac]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a95f:bc47:e21e:adac%9]) with mapi id 15.20.4394.022; Tue, 10 Aug 2021
 16:59:53 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "sakoman@gmail.com" <sakoman@gmail.com>
Subject: Re: [oe] [dunfell][meta-oe][PATCH 0/2] thrift upgrade
Thread-Topic: [oe] [dunfell][meta-oe][PATCH 0/2] thrift upgrade
Thread-Index: AQHXjfa6z0+X2RMVIkm/2flpeFZBiats9F1V
Date: Tue, 10 Aug 2021 16:59:53 +0000
Message-ID: 
 <DB8PR10MB3977EF762ABBFA3785BECB3492F79@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <20210810135555.12946-1-andrej.valek@siemens.com>,<c2bc6f71-3c98-f24b-dddc-d5078f173449@gmail.com>
In-Reply-To: <c2bc6f71-3c98-f24b-dddc-d5078f173449@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=True;MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2021-08-10T16:59:52.964Z;MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=Restricted
 Default;MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0;MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7785e8b-4090-4ddc-b8c2-08d95c20463a
x-ms-traffictypediagnostic: DB7PR10MB1993:
x-microsoft-antispam-prvs: 
 <DB7PR10MB199327E9E4ABB50C6CC46FBD92F79@DB7PR10MB1993.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lbWDSg8oV3rhl5OqQ+P3c9Fh6sGnqcXqZQ0XeFSyJDX0LL/QVNBk19exVj3Vm6u8uzRROCCLCOcyNzljtkJuH/yJ+xl0+8aE3X9+kpRSvmCB5aqtQAxHVAOJOlDxbVv60DGZxaQDQ3uNa1hqaizFi9qsRCswQvogBRn4Lg7WIzFIXsAv3S+3QUGn+BHAmJ9klPVyyF/AXk9QQw95ySdRoAi/TzjsMuVzPW/ePwCpdI5kYtGmq7+KvVV9wVsCBhZGu3O9QBQAZVf40qZ0YRp0PCjPAw9DpkSM5nNAXU3AwfQkn8BzT/kGfXsrsdfG2wmRpZ6v0ImwH1ofbh9P7rse4j+uMAt1Gvp/gOrPXgICGT+e83U0wUIDH/tR/3Wfz4qwAQO7gxKphZlZS++apsDx9zABULKYFLPa6wu7xjeUIpCg+ZnNm66Oeu9noEP/AG82LGRQlV0T2gfN3nJIOc54ie/wwJh+zgV+kozmIfRlz3fdTOu3QJ83d11zBmpF1YB1pDF4gJW4oJavBzF790EgZqzrVo5QqgLON196reYMKghADLGtx3mBHJPKMOeAcsHCf0s4MCinb+eg9pU80xW39Er2KDziDl95mbHCKeziaDoDK5UqtTsB2a+f0Pf3vF93LJJH+NVBDPd/u/h/TbHQ27wxwWy06xpFmdekY4y3LXT7wy48Fw+RKlKX1LNT0PjyJhCa4kOJHy6JQkzVJTZ35Ji1NWUuFUQh9AmxIPkuCP7OZn9IfK/g1WDXOoRxFRvrJ+QqaKlM1c01Blr/G9TVPPZVRzDnLLhB1OAU3uvYIAc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(186003)(478600001)(26005)(45080400002)(66946007)(64756008)(966005)(4326008)(8936002)(53546011)(6506007)(66446008)(91956017)(86362001)(71200400001)(66476007)(7696005)(5660300002)(66556008)(76116006)(122000001)(38100700002)(316002)(83380400001)(166002)(19627405001)(110136005)(52536014)(55016002)(9686003)(33656002)(8676002)(2906002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?MqK7T3zuW+gBg6padOnkEHZf56yZDM6LnCLdmRdcV0SybSEBHAvGPqjuNb?=
 =?iso-8859-1?Q?WqZ/ohdxx2EGepanBmHtSme7xm5VzPxI79DZDuc24AYCMRDm8pGjZnJ03d?=
 =?iso-8859-1?Q?TsCdfxKOarHCzryS7isQ11Ar5fYHsGfS6e+YHw4gewFU9KlOtTw2qSOMkk?=
 =?iso-8859-1?Q?JmnLJx+5mLy3V71usjcIUzlmo7DQ2KYKwJ9YlGMIWrATCPneMuZ6aBaM9X?=
 =?iso-8859-1?Q?jtqNoKjw3FwkU7yyWKnfBA9IRjRumJnManlslkfi5Ssfoo31tp2beIwlo7?=
 =?iso-8859-1?Q?hRQzU4CkNpxe4UR7Inb5Y8YwcJU1tlNl7tIayymP2uGOZ62Npz68YkuxHl?=
 =?iso-8859-1?Q?NqUNwqAz/g4+rugHm11ufOP90O89lok1P9uhXpWa66MZWG7VLZ53hQ5K6s?=
 =?iso-8859-1?Q?H4dsIvWnM1JrKCXc5AfvZlO1tEAPFr5itWszE5fuzFYcl2GXyLvpvuLztJ?=
 =?iso-8859-1?Q?jV1bYZjXnvgAeelT6+mrm8GSDl22Gm/rCMjikGTfwOB5G3J7ntTGfniOb8?=
 =?iso-8859-1?Q?k6HFwPtagpVxLVDhirfLtt33g0vh2+0mTInJt+VkorwR12JJwxDn1+Qtdi?=
 =?iso-8859-1?Q?bRG1/EL31+INqqchyPB9r+HCrHcnNxS84X6HaCCEB9KDHA5qA82OMUJREp?=
 =?iso-8859-1?Q?YwQCtPs1s0PTD+q1IEsS9wWYuvEIHGWYzj1q0tXUUyjW8NbsIovYO2TBU1?=
 =?iso-8859-1?Q?Y63dW1Dm8ko+h4vNDLgTwNDOWfnLLbOTakpFhL6cMvhfzJsTDDnBalpFCW?=
 =?iso-8859-1?Q?sZTq1HY4YPSQQusldkSOpRYjLdWcAlsalmzKZ2ym2ZSff7tlWMyaLQtgR6?=
 =?iso-8859-1?Q?1RZaqZa4hgodZcKgF6OpQGXMvqX6eb6+Qzv86h+LalFEY/ACCcHBOhfb2Y?=
 =?iso-8859-1?Q?vJqd+wvC/pDwwwO/KSOPfAj7Uk9P5h0PE9MFNBeBDJQ4O/GRNrsDvDy2kn?=
 =?iso-8859-1?Q?KNa18JF49QQy85jhyXyAlhAUs680mnr8330ZH4TYuAjT34xnw0AQy4Wq8l?=
 =?iso-8859-1?Q?Z33cG7UbyVGO7mN2IKWkq8jrNYwTQ3NhOn0VSpcBIUCVjtbRPG9mv/S4U0?=
 =?iso-8859-1?Q?G9FMZWANcPNhYy0tBH0pgHCzz55plxypSulJ7zoV6w0qLVLm/VM0hAFcy7?=
 =?iso-8859-1?Q?N7dpIGolPE1FrvyuX7G4x42kvRdOBlgk5rAnvuG1/QpPneJWO2J6CYrrat?=
 =?iso-8859-1?Q?E6SgQCwnzEwHocrk1wiRmwBvL+ycn/CplvqfaEzCJVGHnGHZZgQoZXAfJ5?=
 =?iso-8859-1?Q?ZCEm/l/sl8K3zKOcK+UbA7DPfzeX7a1j0apJU133ywTMZ0YVb5/EvKf75p?=
 =?iso-8859-1?Q?1GY+GpDrBfI0Vz/EfOL5fh4bDrABFRB9hQ0aWP+eTN9fV8g=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c7785e8b-4090-4ddc-b8c2-08d95c20463a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2021 16:59:53.5214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MWt1A4C1TcoDqbX4FDaYluI154TXIXPMGNLQ/UpDJ1heM7e58xQvSv5uHQWXt6asgvRWu58pKiWYZOvzIhJ+CbQQJ2VSfRDxN/oaG4mRBkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR10MB1993
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB8PR10MB3977EF762ABBFA3785BECB3492F79DB8PR10MB3977EURP_"

--_000_DB8PR10MB3977EF762ABBFA3785BECB3492F79DB8PR10MB3977EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Armin,

Take a look at the CVE-2020-13949 (https://issues.apache.org/jira/browse/TH=
RIFT-5237). Backporting just those patches is probably no go, that's reason=
 why I chose the upgrade option.

Regards,
Andrej

> On 8/10/21 6:55 AM, Andrej Valek wrote:
>> Upgrade thrift to version 0.14.2 due to remote security
>> vulnerability.
> No specific security issues are mentioned in the other patches. This is a=
 big jump and from what I can decode from their release notes. They depreca=
te many things between these two versions.
>
> Unless I can be convinced otherwise, this update is deemed outside the ac=
ceptable norms for a stable release.
>
> I think backport the specific security issues may be  more appropriate.
>
> thanks,
> Armin
>
>> Andrej Valek (2):
>>   thrift: drop unsupported features
>>   thrift: upgrade to 0.14.2
>>
>>  ...llationPaths.cmake-Define-libdir-in-terms.patch |  8 +++----
>>  .../thrift/{thrift_0.13.0.bb =3D> thrift_0.14.2.bb}  | 26 ++++++++++---=
---------
>>  2 files changed, 16 insertions(+), 18 deletions(-)
>>  rename meta-oe/recipes-connectivity/thrift/{thrift_0.13.0.bb =3D> thrif=
t_0.14.2.bb} (72%)
>>
>>
>>=20
>>


--_000_DB8PR10MB3977EF762ABBFA3785BECB3492F79DB8PR10MB3977EURP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hello Armin,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Take a look&nbsp;at the CVE-2020-13949 (<a href=3D"https://issues.apache.or=
g/jira/browse/THRIFT-5237" id=3D"LPlnk">https://issues.apache.org/jira/brow=
se/THRIFT-5237</a>). Backporting just those patches is probably no go, that=
's reason why I chose the upgrade option.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Andrej<br>
</div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1"></div>
<br>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">&gt; On 8/10/21 6:55 AM, Andrej Valek wrote:<br>
&gt;&gt; Upgrade thrift to version 0.14.2 due to remote security<br>
&gt;&gt; vulnerability.<br>
&gt; No specific security issues are mentioned in the other patches. This i=
s a big jump and from what I can decode from their release notes. They depr=
ecate many things between these two versions.<br>
&gt;<br>
&gt; Unless I can be convinced otherwise, this update is deemed outside the=
 acceptable norms for a stable release.<br>
&gt;<br>
&gt; I think backport the specific security issues may be&nbsp; more approp=
riate.<br>
&gt;<br>
&gt; thanks,<br>
&gt; Armin<br>
&gt;<br>
&gt;&gt; Andrej Valek (2):<br>
&gt;&gt;&nbsp;&nbsp; thrift: drop unsupported features<br>
&gt;&gt;&nbsp;&nbsp; thrift: upgrade to 0.14.2<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&gt;<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&gt;&nbsp=
; ...llationPaths.cmake-Define-libdir-in-terms.patch |&nbsp; 8 +++----<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&gt;&nbsp=
; .../thrift/{thrift_0.13.0.bb =3D&gt; thrift_0.14.2.bb}&nbsp; | 26 +++++++=
+++------------<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&gt;&nbsp=
; 2 files changed, 16 insertions(+), 18 deletions(-)<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&gt;&nbsp=
; rename meta-oe/recipes-connectivity/thrift/{thrift_0.13.0.bb =3D&gt; thri=
ft_0.14.2.bb} (72%)<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&gt;<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&gt;<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&gt; <br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt;</span></font>&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DB8PR10MB3977EF762ABBFA3785BECB3492F79DB8PR10MB3977EURP_--
