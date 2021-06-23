Received: from esa18.fujitsucc.c3s2.iphmx.com (esa18.fujitsucc.c3s2.iphmx.com [216.71.158.38])
 by mx.groups.io with SMTP id smtpd.web11.906.1624407596594141780
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jun 2021 17:19:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=BnjX6Xyg;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.38, mailfrom: ito-yuichi@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1624407597; x=1655943597;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=opJrdvSgHlh0M/MJp0qlzYmvb0904AcJsFWheTw3gbY=;
  b=BnjX6XygNdRzk8YJfyCtV/jXdnsb+3oXD45auj/rKnrMKD/akz0nnJ5E
   gqHEUGRXVSVCezWnmA+/22xYF7yfuFb1jpldirilY02fZ+62JKRTFuAZx
   rP+Ef4jQoEfzgBfd+2CN4B/bW+KuaGTmjAZ6ukSg8OvcIxE7GwbhWmmpg
   OZU2i40WvfeuWxqB9p+x2Z8dGR49ZHJ44hILZ4KCwgIECd0nHCbiJ1Epb
   0SG09E6wLncqzWxtNtw5hTLzH1M7DQOX70ljL0soHQMVte95Xs7GhxeDJ
   5OphWoZPxQZKvjUpVQe+TnTruPAB15IZIQ5ZGPz89hq636gpj8GOe6cJQ
   g==;
IronPort-SDR: gwaSvIrj3e6M1IYRzTpXcDFXKUUmt+PYn1mZTKAZ1c1kg/cO86eMarljx9u/d772+QxFal1uaW
 B2zHII/yWltySiO6iAVm5Ci0EJRSV2MuU3995KELIqX5z1UtVRtiYAbBdSDORdk2YFJz+twXa8
 P1X5llfK/E2RJ1Djp1gOeayJE4fhJR+6wP0NQe646iW9qXcu8DOroNy98KSVTuoL920z2wKwt5
 KQUXTlPcspbTTzvoNWC5UO6S4UtxiWT/4FqvxZdLiIKSWwoRoznf+oOFXLuFpnbJcbNgvJcnnz
 sSg=
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="34134862"
X-IronPort-AV: E=Sophos;i="5.83,293,1616425200"; 
   d="scan'208";a="34134862"
Received: from mail-os2jpn01lp2054.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.54])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2021 09:19:54 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmSDYpVF9/zs2dtw3B5OMhvWFXZlK/nqxUmeqWtNXBamZBlKJm856TdPkUFT/XHpdVu8asP2OQyTQDjq8nVP6GrgPOO4NRG481mfMjNkPNAGXJJGXwLOhjcoZUHlMbN6GcTrm2OY50ckSAAIGk3hXLSVfJu/aN0L8W4a3TjRmouAt9qKrvSNNfiog1ObInrFmkMz4vD+XG8jaP1f7fRUwhO4JjxUmBkUq48AkyTWHeBeArl9El8xbGDvrPmZsrRQBECJRyrjJT+ZN6CfaYVPAGE3we4IkhAfn2bezEHQvoRbua1lJjNlNmS3EkblkUAtAducmeUTZWMl1ABlAI8z9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhzWWEg3VwuacvTWVSOh/kr9SP38nG/OfCrFEsiYAjI=;
 b=FojO08Q8Py2XOSBTsXbUnLR/2Hp/5R69P0sRj3L/KGkyrttpyxjYLXEOF48sBN/eegcvD3Uav6jKpZovXJUNzZx3NgUkkWGUMinq7r6WzyARZoAQ9tO3aMmFRdM2M9qCoYjHgngD4keMh1KGUbF6AyCV1WpHmKuqZoxJzhHnn6BwR2SBnrBk+lImi+OJ1pEt3JHX9rd3VoixFFmLCPhkjweFw/YURBhi+HmFtFIqlf82103yfdfP4Ue38Vs+ixE9kW804/kcKTBvdcymW71OH6rpNbQrkmW0nOlm4DHodjBzhgovP3OKgVp9AjLGO9EWbYGxnaHmgMBNxrvEoTmXgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhzWWEg3VwuacvTWVSOh/kr9SP38nG/OfCrFEsiYAjI=;
 b=h5vHGiP0M8k1Ug2gAtljECjI2tzYzbADC0dOmA4Nhzyqtd1GOO3j/ZO+VjY52cCFBe6iFbc5hHHw4Kd7eLX2T4FFXtVkSF+Y80mZezCF7TWw6qo/5kWeZ0yoHzHDJIrN+b2CvIa7JrZcq25LXyGsjL2FnZSmxOmgXGMXiUJLl70=
Received: from TYCPR01MB5599.jpnprd01.prod.outlook.com (2603:1096:400:41::9)
 by TYAPR01MB4143.jpnprd01.prod.outlook.com (2603:1096:404:be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Wed, 23 Jun
 2021 00:19:50 +0000
Received: from TYCPR01MB5599.jpnprd01.prod.outlook.com
 ([fe80::446a:7e01:7ec1:953b]) by TYCPR01MB5599.jpnprd01.prod.outlook.com
 ([fe80::446a:7e01:7ec1:953b%4]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 00:19:50 +0000
From: "ito-yuichi@fujitsu.com" <ito-yuichi@fujitsu.com>
To: 'Khem Raj' <raj.khem@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH] cve-check: Add allowlist that is same function of whitelist.
Thread-Topic: [oe] [PATCH] cve-check: Add allowlist that is same function of
 whitelist.
Thread-Index: AQHXZ4SVkoMCDgNyvkmP9aIky9bdCKsgukpw
Date: Wed, 23 Jun 2021 00:19:50 +0000
Message-ID: 
 <TYCPR01MB55990300583DF9F78FE774B28F089@TYCPR01MB5599.jpnprd01.prod.outlook.com>
References: <20210622082917.1567681-1-ito-yuichi@fujitsu.com>
 <ffe8bb78-c56b-08de-dfab-77ef8c89c6e6@gmail.com>
In-Reply-To: <ffe8bb78-c56b-08de-dfab-77ef8c89c6e6@gmail.com>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4959b00c-8d5b-4dbd-aa8b-08d935dc9ddb
x-ms-traffictypediagnostic: TYAPR01MB4143:
x-microsoft-antispam-prvs: 
 <TYAPR01MB4143C1EBD50A50EC1CB6436E8F089@TYAPR01MB4143.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LcGNSvy2CXOiFDqqUT9iirg6FeHsrZAkWfXC2MYuqfpW0BGtlLkaQGKiQQcYkLWQkPHz50IPIiZiI9pxzqSmX6n15QltB6aOyh3yGqeBOJcsZR9yTVoSRLEqHzNR4egYFWyhLUyHMI2nd3dyERM3OZ2c8Ua5ROd8dPHSKYViTRcwTHSX+hmXdXowBS0hf+BoXuzuK+fSVzrIaPxn6wkG1BDDoz2h2BVEqsPGIUaaZGGnLJsgNLZtlJBL0Vam1X9YMfkdSO2y9MyuLiCz5o3BGjNKeICuLbzDQNzf+CQrUL5J9fZC16gmbgt68YB6ms26zgSkJhx4SQpDJNGubvNByVdL9IJNHFoFzfn+LCYZmZ0BxyAN29st9wGkQ8PKyUW2vHvFQEz1ZP6J3UTHr72KMu+WdkssfaZ7oOkxlCIx14cYIlUS2RtmAanbcN8s8PRmR8aZgym+Jr4V83/tR7UyKRbpOAiAea+etb+r4ZPi5zCuRVeITvY9T5o126nzSvw8GsEzUzE0kTNdGDHWPXS9qJufGgOtzVMQ6C33k3uNnCaoIXPTgAJhV3pU83gDMdBdlm9/6FiP3iREXD9D3pbY9ceO7ROfRDUB+s7muRFHmrihsn66w5zhC8TqNrERrCbZ8R4njsr/Jg8oB33rh84PRhGheBnJrEK163h2lOrcSkwWTbwky77r5OawgTFfrMs6oEfQBByvkGFeJjHpRf/eZzYfbJOpifaci+6dZgwCy4LN1gIh0XotwYbuEPCL1ILqn5S5H8UwGpgEPa2aiZVo/A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5599.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(478600001)(53546011)(6506007)(966005)(52536014)(316002)(38100700002)(110136005)(122000001)(186003)(2906002)(55016002)(8676002)(76116006)(71200400001)(26005)(66446008)(64756008)(66556008)(66476007)(66946007)(86362001)(83380400001)(33656002)(5660300002)(85182001)(9686003)(8936002)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?aDNGOGNWQW1TeWVad2NBdHRpMWk1dnJHZ1BDS05zbVRaNHR4dUpQUWQ4?=
 =?iso-2022-jp?B?Yk4vM0MzbkdhZDUxMXAxczlEWHV1d2tOL2pBMmttUzNHRmo5bU1TcWlY?=
 =?iso-2022-jp?B?a2xLZHFGQ0plTElCK0NUTnI2SHh2VXZjNnZQMWNtYStUaW0yNHVXTzNq?=
 =?iso-2022-jp?B?N2lWeFhBT1Yydy9SMW1MSGx1dGllWnV2L05yKzNCRWR0ckNIOVZTQS9P?=
 =?iso-2022-jp?B?ZXBiNHI1UVNxOEhJR285SjVvUlpwaERlSy9ZMEVpY1I1aWRna0IyTGx4?=
 =?iso-2022-jp?B?WXB3WndrK2pPdDR2R3REaUNGaXVnM2pJS0gyeVZjZFZRTXdyVWdpYUgz?=
 =?iso-2022-jp?B?YmF0bWk1ZjNuaDhvUWlESDUzd0lkRFQrMVpjT3piclJrQWdZRkRpYk1I?=
 =?iso-2022-jp?B?STFBbjhZNDZTaTlqRS9hRkRLSlRQS29SLzlWQnFXR1hEK1JoQit6UG1w?=
 =?iso-2022-jp?B?czI4QnNJZFJYSlBkZEJxU2NET0NuWEFEeldHVmRoeW54Sm9UT1hWckVt?=
 =?iso-2022-jp?B?WkJOdFhrNFMrRURkYllYOGl1Z21QOVFFWEtVRnROZGxPaU5YY0lpWmNP?=
 =?iso-2022-jp?B?a3JkcGd1aXpRRXZkTG9OVVM4SHVlQ2NHVmZEYTRVcGlRWkwyZko3SFhQ?=
 =?iso-2022-jp?B?dDdEN2FYUU9Qa2RBc01taVNwbS9Pc2s5QUdycDlIeDZJbTYxUitvRzgw?=
 =?iso-2022-jp?B?clN4em1xSXhrc2VQa3l0VU9aYmp3NGFEdGlMWDJHM0hBVVV2THk4N0hW?=
 =?iso-2022-jp?B?TlozQkVacFRrTUJNbTdXaHNYTVk1R1lJSmNSN3orNW52TU55UysrK290?=
 =?iso-2022-jp?B?cHJtdFpwWEhGY2tyN05VR3o3cTByQzUrOUEwdkxuNHlHZitjcXVEanFm?=
 =?iso-2022-jp?B?ZzlwZ0UvcTJUdmdsdzYwcDI1V29ZQWlUQk1BZUVKK0dkcTNCUVR3RDB2?=
 =?iso-2022-jp?B?elZ6Qk9DVEhGYUZWczZRWlpFanE5dzFyaURxaEk1OGdTOW5CRzIwcTJR?=
 =?iso-2022-jp?B?VERXOHZaM1E4enVISXltODBqeENkNVZ0MEJnNUNtRzhmTWp0Q2JGVWVG?=
 =?iso-2022-jp?B?bTRLZmJLckx3bitxYkdENTduaXVJWUZEbUdHWEJ1T2QvMS8xY3hNWTlI?=
 =?iso-2022-jp?B?bXlscU5Ta0xzdW1sL0M1d1Ztc25BazA5TytyVy96VEtLc1NOM2NFMVFt?=
 =?iso-2022-jp?B?dFduRmUvM1Zud2pXeWxMOU1uVzkrNjNGZEJLSmJ0N3pNQUFCaERzYnNJ?=
 =?iso-2022-jp?B?Rk96ZHVaSmpBU0F5c2RGSCtyaTFUakdmdHZuejZSVDNWNURsc0VBNnFH?=
 =?iso-2022-jp?B?WXVpUXNTQ3VIcElUZ2hjNmFxMUpXM0YzWlhCVWZadC9KQ3RmcnhRcExS?=
 =?iso-2022-jp?B?NVprWXFYOGR1RVltcHhabXdsUmxTTTUyckgydXM4bEhYOGhkTU9wZ1NY?=
 =?iso-2022-jp?B?S0JPdEc3UktTelNLdElJMXF1aHFqY0oxUjhKSXBNVVdESTJySC84Wjhm?=
 =?iso-2022-jp?B?Y1MwMTA1SzJXTFVXU1hXZWVwKzhlZUNiRVpkS2R6WjkvUHBMMEFVdUtU?=
 =?iso-2022-jp?B?R2tTZ3RMelJ5WXNTZHdFUzAxeEdWQ3NFc3l3Vk1RVkVibS85QVhtRFFI?=
 =?iso-2022-jp?B?V2VkMVhzTnhJWTlYTldIUEIvcFp2TjBFazJvY2Q3elp0QUxNVVB3MXkx?=
 =?iso-2022-jp?B?UFg2YVZybk5iWDhycnlYZnMvSE4yYndlbkI4NkVDQ3J6K0tBejdUSHRG?=
 =?iso-2022-jp?B?QS9BTkJJR2RIUDdYbGh3ZktkeWJGLzNlbDhGT2FwckxCbmJ2eDVWSndU?=
 =?iso-2022-jp?B?a09WTUs2M1VaS3RrN0NWYWlHMmt2WG91QjQxaHRpcFExbEJ3MTVmZkE2?=
 =?iso-2022-jp?B?VmViK2Y0TnFvTjMxcW91WU1hZmZVPQ==?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5599.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4959b00c-8d5b-4dbd-aa8b-08d935dc9ddb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 00:19:50.5857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ee/boBzqGHP9pXiCvTgW7N6tb21bkndjM7LkYBalaldlY27mTpA68Pmw2Ab+KGt6a8EeMjgUO8CPkOvSE+bH6eKTOMI/Wg3p66nZXd86Bqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4143
Content-Language: ja-JP
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Sorry, I mistook send mailing list, and thank you for your advice.

> -----Original Message-----
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Wednesday, June 23, 2021 1:35 AM
> To: Ito, Yuichi/=1B$B0KF#=1B(B =1B$BM-0l=1B(B <ito-yuichi@fujitsu.com>;
> openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] cve-check: Add allowlist that is same function=
 of
> whitelist.
>=20
> Thanks for the patch, you need to send to oe-core mailing list since thi=
s class
> is part of core metadata.
>=20
> On 6/22/21 1:29 AM, ito-yuichi@fujitsu.com wrote:
> > The Linux team plan to removed references to racially-charged jargon
> > from their code for more neutral and inclusive language.
> > So replace use of "whitelist" with "allowlist" in cve-check.
> >
> > First, we add CVE_CHECK_ALLOWLIST and it is considered patched as
> well
> > as CVE_CHECK_WHITELIST.
> > We plan to replace about other word later and eventualy, replace all
> > "whitelist" to "allowlist".
> >
> > Signed-off-by: Yuichi Ito <ito-yuichi@fujitsu.com>
> > ---
> >   meta/classes/cve-check.bbclass | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/cve-check.bbclass
> > b/meta/classes/cve-check.bbclass index 112ee3379d..5e3441a783 100644
> > --- a/meta/classes/cve-check.bbclass
> > +++ b/meta/classes/cve-check.bbclass
> > @@ -52,6 +52,7 @@ CVE_CHECK_PN_WHITELIST ?=3D ""
> >   # CVE_CHECK_WHITELIST =3D 'CVE-2014-2524 CVE-2018-1234'
> >   #
> >   CVE_CHECK_WHITELIST ?=3D ""
> > +CVE_CHECK_ALLOWLIST ?=3D ""
> >
> >   # Layers to be excluded
> >   CVE_CHECK_LAYER_EXCLUDELIST ??=3D ""
> > @@ -238,7 +239,7 @@ def check_cves(d, patched_cves):
> >       old_cve_whitelist =3D  d.getVar("CVE_CHECK_CVE_WHITELIST")
> >       if old_cve_whitelist:
> >           bb.warn("CVE_CHECK_CVE_WHITELIST is deprecated, please
> use CVE_CHECK_WHITELIST.")
> > -    cve_whitelist =3D d.getVar("CVE_CHECK_WHITELIST").split()
> > +    cve_whitelist =3D d.getVar("CVE_CHECK_ALLOWLIST").split() +
> > + d.getVar("CVE_CHECK_WHITELIST").split()
> >
> >       import sqlite3
> >       db_file =3D d.expand("file:${CVE_CHECK_DB_FILE}?mode=3Dro")
> >
> >
> >
> >=20
> >
