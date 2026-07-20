Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC12C4451B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 06:00:01 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.129])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2899.1784527191699297238
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jul 2026 22:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=TlED2RgU;
 spf=pass (domain: navimatix.de, ip: 52.101.70.129, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSOf7vIDWCda/vuzzfc5bHX3FQf8Elabb43eLVFTgs+EzI2p1UYQQbtTknRQJwo+cCUOq9I4vsvwnyuv2WkzSt0TgTGBtrzPni/wM3cxnEw+qOwmH555kezBHgv6jzJ9YsQ5T+bF+6EbOVsTTi8XKVTK772tdR0YMlDgZnVzaQ1phk1xccQ8LjAF5pnP/+1PRsQcFwyqyKKR5XH1322961rq11Ne+DmbT8jCMCCOlBAPQ5vhccVfW5PY0Hc3Fds+WGettNUuHH58c6Q/ZN65+JbPjWOYXwJXgDxuBb7hZqzjQTXiczQsawd+PBdy/kn5Z/Z4aHJoXgWy6RfxVueAnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRbCTA/w0U4FC+vshHMzmPeDn0GXILFpcJdZ4wrLHAQ=;
 b=MdwWT7B0h2jtsXsz8yWb896w6UoOSf6h6XzwwMgABoO6mZ+13v/oZwMmoj/vZScxI7QGnMgw74AflAb2m0AraPTsqricAMitaKo+D1OocpvqtcZBc5SknozAkn5aL/4WVbGBdbtqbcD1uTV9hNjbTpa8bG81js73jhd4vC4WYDYyz0Gxqcpvu1fjD5jtrdmGGwx99I4iDsZouAMRziwqqar5dyRY/+j2eUFoWcK+OaUvpOe4aZqyhABCzkSH5KJsMyO48fi4pnl5ASrF0js+KLVvBC/aQnFzh+8+RqD8O16x2bzkBCvBW6EfJthB7knB6+1JY+leW2zTM3qO/lp3Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRbCTA/w0U4FC+vshHMzmPeDn0GXILFpcJdZ4wrLHAQ=;
 b=TlED2RgUf8NtPbGEcHfnlcdi64Dutn2/+g4TQdho5zcByZaHGcu6AUGEwyjzn5Yim7SOpIYiOIhXyuRnNiIme/AoppBgcU/x/2iGL0SP75EcnZNN/ZUaC4HNzA+F3orBHYtEPt5hjVBFxd9E55DN4HDupZeKi/He1Kyn36miRV0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by GV1PR01MB11312.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:20a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 05:59:45 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0223.011; Mon, 20 Jul 2026 05:59:45 +0000
Date: Mon, 20 Jul 2026 07:59:42 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] zsh: Update 5.9.1 -> 5.9.2
Message-ID: <al244IOfDr7UkPSW@navimatix.de>
References: <ccc9289f95924943d5fba4f4be27e6c558652390.1784270036.git.joerg.sommer@navimatix.de>
 <CAMKF1srYEvATLXXGDgBizwnedDPhihfX0E5+VBi0n=R-kMZZyQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="2rgfur5fpwlyfelz"
Content-Disposition: inline
In-Reply-To: <CAMKF1srYEvATLXXGDgBizwnedDPhihfX0E5+VBi0n=R-kMZZyQ@mail.gmail.com>
X-ClientProxiedBy: BE1P281CA0385.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::21) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|GV1PR01MB11312:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c856a6-f728-4cf9-2d08-08dee6241930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|4022899009|1800799024|366016|6133799003|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	kOT/c3Mr+nD1m6U3MLXFcolauMYe4y4I0tROVwpHNMS6S3OjhbRSUIxiGiwZjzAY8hVONESGalbnQkTEFmEo6qtWIMuS2sT3YtiV/kUasOftnc25BJfZthgCPmhMByINOnOTeJWXXVRJgu9w975d00c+etYS+3XXrNkS8GM3S6tgJlIPs88K78VPbeXsZ73/+ih90+KnQ4sLMNZBjlfVAagBn/3WjupqC9Tcbv1NCN3GduirbSnv11kawPxnLry/3RymPuK9SNtqDQTp8J/3ryNproOHZ9lQwROE3BaciEXgVNXtMl8B4H8ML4USDi2kFCBaHClbrCm3H4EGm/G0oyzAqFVmEf5x/JhYECYdby++9MYgGOluFtLGnB3lvU7r5nNS2XNP+w7tlmElfi2jayvsJEatNonKnyFBA+lj14K+xW+lvKoJ3OJvt2ACdWYPg3yp8GdePEcU1HYcij836ol7TRUYZJUUVesqILDfia2tnq0yFEe25iFRCoBjDTaV5GJmBxNAFEAZj0P3qgew9+VTTyQ/RC0gzqCYY/srT7R8nxQgpqJl6ZXy31GyCw/Ic4mJzEUc/7bS5EYMmomvMCccHGZFEpR4duUCrDpFGYM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(4022899009)(1800799024)(366016)(6133799003)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dnI1aEJxZmlCaVFTa1FSMmZ4ZHdodTdHcHZZQkprN1JQRnYxNGRCU2pYNTQw?=
 =?utf-8?B?WVhtV0NQek52YXE2UE1QNmtWekVPVWRQRis2amNBUS9lNy9JZGk5ZG5pV04v?=
 =?utf-8?B?UGZxTmdNdlZXK3I0dk1WQlBpcXN1elJKMk1aTG41Z3NKQ3N4Z0c2SUIvTXlv?=
 =?utf-8?B?NnFieGJ2ellpaWYzMEtVSDZ3MTlWSGlrWmtJd1VQMFI1d0xqakJlV1I3U2hT?=
 =?utf-8?B?VUdNSUVkQjNlckIvelBBOEx2UHN1R0N3T05PaE1JMzZrZmNubnJXQXNOUTdx?=
 =?utf-8?B?OGZQYzdwTkoyL0w0WFNhbTJrQ1FKK1c0NjVPNTNCYS9ZNDZnMm94ZFdXN0JI?=
 =?utf-8?B?OFdQL3U0ZWVBS3JCSVVqL0Jmek5uN3NGa3grb2wzYzd0aVZxK1djNDZRNzdZ?=
 =?utf-8?B?c0pMWUd0aEduU3RCSGZBemh6eHpWV1k4ekg3dXIzZjNiN0Z2ajBOakVieitj?=
 =?utf-8?B?djk3Yk1oVGFGb25yeklpR1MzenI1V3MvTTVuY2lpYTBTSzM2NDk0TDVJQ0Yz?=
 =?utf-8?B?aENIQ2RsTXp5VEZvYm1qRVhoOWhCV3JSaHJqWUsyclRvS0FUaGUyTGVORnh2?=
 =?utf-8?B?SWZyaGo1MnpDRG91K0M2ZGlOdHVVaHh3cUJMMDQvRSs3aVNLMkNDUUFRSkVq?=
 =?utf-8?B?OGxGSmtiUzN1aE1SWWxZLzIzL1VuN2FDajZocEwzMHFnZ0tMZkFITXE4UENI?=
 =?utf-8?B?MWEyajR2Ykw1bkorVG4wTkMydHIrdEswS2J1Y21ZSCt0aFpISlBEQ1NOMFUw?=
 =?utf-8?B?SmxFRXoyUzFHcktWMWxqdnYzS1dHbHRCY0hDdzRFem5TM3hUc0ZPQ2hESjBk?=
 =?utf-8?B?Vkp6UkFCdElmVWFUWlhmOWt5WkN4Q0ZQL0x1UTh1T1pJOTZOelhPWi9tdE5L?=
 =?utf-8?B?RitPZ05tV29RVnc0VUJFRlltQ0krQms0VG9pZUlFOEpWK0JSN0F6ZW02d2lm?=
 =?utf-8?B?ZUd5NnhRRUdoTERxQVU0SERDS0JBdVNORDBlR29OZjVOeW1tQWk5eUliZXJU?=
 =?utf-8?B?WDM1cmhTWWlsSkF1UVJkVHNQQUFhR3dsbEJudHdmSGh1dnFONW9sZEE0Qkxx?=
 =?utf-8?B?SWphYnBGZ3dNZzZpdGFlc1hrYlg4OUloV3BzQzJUc0xCWEdSWjcwTU95cFFZ?=
 =?utf-8?B?NmRGUEZoSGxZUTQ0dTAwMndybTFyWEh0S2dGY1l5RVI2MjQvS01sMUV3Mmx6?=
 =?utf-8?B?WHNCaURNTE85UXdUNE43WFFQMmw2bVo4bENOd3F4WnphMHlrdjV5TEFiQi9z?=
 =?utf-8?B?MEFnb1lGTVNCRmo3dXpYTWl0YXZaeTc5Q085Sk5LY21iZlI0UllLelVDdytk?=
 =?utf-8?B?K01xd2tRU0xDeWU5R01ta01GN1owVjVaUERwNjh6OG5mYVUrTk96Tjc3QTZx?=
 =?utf-8?B?a3hlSDNiRVNIdGphQ2hyZHB3YXdJRE1Ockw0TytNZFdpeUdWWUNVQTZRQ3hn?=
 =?utf-8?B?MDhtOGljcURsWGZEZlNFQ1AxV3A3NTRwc2ZZUTZQQUdkNmI0UDIxTkFBUkZR?=
 =?utf-8?B?ZmlYTnpFVU1JcldaVTFERUE0UGJyL0gyWFFXU1k5S0RiNllBY244R1FRN3A5?=
 =?utf-8?B?MXg0TlV5eWliYmdiYzkyUmNzazhFRlRocXdnMlR2Z21NMGV5SjBKcHJTeStB?=
 =?utf-8?B?MW9tOW5PYkdNRHp5bkdXZndCOWlPNzRzTnY0N3lnUWtnNlBmUFV0U1hBTWNX?=
 =?utf-8?B?bDMwNW1uejFiUXpKbmxHMHVMcVlFY0FKdkQ2cGlxN2l3YW94eWxuZHpxaFU5?=
 =?utf-8?B?N3ZXV0xXTjhVNVQ3OGIwOTM3a3pBNU1ldGhZVFdLQ1VGV0IwMHhHNUFRS2pJ?=
 =?utf-8?B?UFBwWVNVcU1EZi95UklEenA1L1lJM1Myb3QyM01oUkhyQ0lreVRSVUdOSzdO?=
 =?utf-8?B?cEdyeXpnckRNVTEzRUF4SjZ2b2xtOU9yZFhkUFVLcXpWemY0eGlyWXhrRFY2?=
 =?utf-8?B?S3dJcUMrcFkyTWhmYTBzZWZob0hjeXZrcnV2ellnWjV0VVZSUWt0M0dGV1Ry?=
 =?utf-8?B?UjZPZGhFQTZDOXdkM01mcHc0ekkzWUFIbk8yb1B5dWk1ZEFWek1aMDgzdGNK?=
 =?utf-8?B?cVN5RFBlTGY0MkIzTWFwbzg1dVg5NnFac1FuSG15SCs2UStRdWpieG1lVU9k?=
 =?utf-8?B?YjFsZzFZbGExa3RuUTNxOUJmcVlwOEZ1UE40dDBpK0F1R0ticFpvY0laZkRX?=
 =?utf-8?B?ZWc1ZU1CcnNCY1lzenFGaUJBa3Q0UTc3VXIrK1dDekI4TzBaYVNCckRaTkpT?=
 =?utf-8?B?eVR5eWtQZGFUS0pwU0RudTlFMkU2bEE1M0p2QVNTSHhNLzREbU8xZG9POERa?=
 =?utf-8?B?Z2lQYkQrWDdYY2o3bUVxS0JRbldvVGU2aHlqR0pHcENpZCs4N2lNNkZRWmFl?=
 =?utf-8?Q?C68jK4RbLY5GTGD0=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c856a6-f728-4cf9-2d08-08dee6241930
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 05:59:45.2045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpONPK0Fa5Xd1pCNVYO279pSG5q/nmRqcaxrLoGjBmohXJIupNUpVWR1pOpfSnSgUPlVKHHoXjryFtO2lAMrB9kXr8561keWygw8XtAROs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR01MB11312
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 06:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128273

--2rgfur5fpwlyfelz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [oe] [PATCH] zsh: Update 5.9.1 -> 5.9.2
MIME-Version: 1.0

Khem Raj schrieb am Sa 18. Jul, 08:50 (-0700):
> The sha checksum for 5.9.2 tarball seems to have discrepancies.
>=20
> https://errors.yoctoproject.org/Errors/Details/950824/
>=20
> Can you check by building please ?

Arrr, sorry. I did not update my commit before sending, and built with open
changes. This checksum is the one from zsh-5.9.2-doc.tar.xz.

> On Thu, Jul 16, 2026 at 11:34=E2=80=AFPM J=C3=B6rg Sommer via lists.opene=
mbedded.org
> <joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
>=20
> > From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> >
> > Changelog https://zsh.sourceforge.io/releases.html
> >
> > * Only minor changes.
> >
> > Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> > ---
> >  meta-oe/recipes-shells/zsh/{zsh_5.9.1.bb =3D> zsh_5.9.2.bb} | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-shells/zsh/{zsh_5.9.1.bb =3D> zsh_5.9.2.bb} (95=
%)
> >
> > diff --git a/meta-oe/recipes-shells/zsh/zsh_5.9.1.bb
> > b/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
> > similarity index 95%
> > rename from meta-oe/recipes-shells/zsh/zsh_5.9.1.bb
> > rename to meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
> > index a62526dbb2..88c846a27d 100644
> > --- a/meta-oe/recipes-shells/zsh/zsh_5.9.1.bb
> > +++ b/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
> > @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D
> > "file://LICENCE;md5=3D1a4c4cda3e8096d2fd483ff2f4514fec"
> >  DEPENDS =3D "ncurses bison-native libcap libpcre2 gdbm groff-native"
> >
> >  SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.t=
ar.xz"
> > -SRC_URI[sha256sum] =3D
> > "5d20bec03f981dc4e9a09ec245e7415388ff641f79c5c5c416b5042e58d8280d"
> > +SRC_URI[sha256sum] =3D
> > "020ee644be1749507b282e619cdcd95c56ff36144e79b7a3c245458aacd9458f"
> >
> >  inherit autotools gettext update-alternatives manpages
> >
> > --
> > 2.53.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#128245):
> > https://lists.openembedded.org/g/openembedded-devel/message/128245
> > Mute This Topic: https://lists.openembedded.org/mt/120311241/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> > raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> >
--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--2rgfur5fpwlyfelz
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIaGAYJKoZIhvcNAQcCoIIaCTCCGgUCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghehMIIFgTCCBGmgAwIBAgIQOXJEOvkit1HX02wQ3TE1lTANBgkqhkiG9w0BAQwFADB7
MQswCQYDVQQGEwJHQjEbMBkGA1UECAwSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHDAdT
YWxmb3JkMRowGAYDVQQKDBFDb21vZG8gQ0EgTGltaXRlZDEhMB8GA1UEAwwYQUFBIENlcnRp
ZmljYXRlIFNlcnZpY2VzMB4XDTE5MDMxMjAwMDAwMFoXDTI4MTIzMTIzNTk1OVowgYgxCzAJ
BgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJzZXkgQ2l0eTEe
MBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQDEyVVU0VSVHJ1c3QgUlNB
IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
AgEAgBJlFzYOw9sIs9CsVw127c0n00ytUINh4qogTQktZAnczomfzD2p7PbPwdzx07HWezco
EStH2jnGvDoZtF+mvX2do2NCtnbyqTsrkfjib9DsFiCQCT7i6HTJGLSR1GJk23+jBvGIGGqQ
Ijy8/hPwhxR79uQfjtTkUcYRZ0YIUcuGFFQ/vDP+fmyc/xadGL1RjjWmp2bIcmfbIWax1Jt4
A8BQOujM8Ny8nkz+rwWWNR9XWrf/zvk9tyy29lTdyOcSOk2uTIq3XJq0tyA9yn8iNK5+O2hm
AUTnAU5GU5szYPeUvlM3kHND8zLDU+/bqv50TmnHa4xgk97Exwzf4TKuzJM7UXiVZ4vuPVb+
DNBpDxsP8yUmazNt925H+nND5X4OpWaxKXwyhGNVicQNwZNUMBkTrNN9N6frXTpsNVzbQdcS
2qlJC9/YgIoJk2KOtWbPJYjNhLixP6Q5D9kCnusSTJV882sFqV4Wg8y4Z+LoE53MW4LTTLPt
W//e5XOsIzstAL81VXQJSdhJWBp/kjbmUZIO8yZ9HE0XvMnsQybQv0FfQKlERPSZ51eHnlAf
V1SoPv10Yy+xUGUJ5lhCLkMaTLTwJUdZ+gQek9QmRkpQgbLevni3/GcV4clXhB4PY9bpYrrW
X1Uu6lzGKAgEJTm4Diup8kyXHAc/DVL17e8vgg8CAwEAAaOB8jCB7zAfBgNVHSMEGDAWgBSg
EQojPpbxB+zirynvgqV/0DCktDAdBgNVHQ4EFgQUU3m/WqorSs9UgOHYm8Cd8rIDZsswDgYD
VR0PAQH/BAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wEQYDVR0gBAowCDAGBgRVHSAAMEMGA1Ud
HwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0FBQUNlcnRpZmljYXRlU2Vy
dmljZXMuY3JsMDQGCCsGAQUFBwEBBCgwJjAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29t
b2RvY2EuY29tMA0GCSqGSIb3DQEBDAUAA4IBAQAYh1HcdCE9nIrgJ7cz0C7M7PDmy14R3iJv
m3WOnnL+5Nb+qh+cli3vA0p+rvSNb3I8QzvAP+u431yqqcau8vzY7qN7Q/aGNnwU4M309z/+
3ri0ivCRlv79Q2R+/czSAaF9ffgZGclCKxO/WIu6pKJmBHaIkU4MiRTOok3JMrO66BQavHHx
W/BBC5gACiIDEOUMsfnNkjcZ7Tvx5Dq2+UUTJnWvu6rvP3t3O9LEApE9GQDTF1w52z97GA1F
zZOFli9d31kWTz9RvdVFGD/tSo7oBmF0Ixa1DVBzJ0RHfxBdiSprhTEUxOipakyAvGp4z7h/
jnZymQyd/teRCBaho1+VMIIGkDCCBHigAwIBAgIRAJNhG7GFaX1Mm3w/sd+ASzYwDQYJKoZI
hvcNAQEMBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQH
EwtKZXJzZXkgQ2l0eTEeMBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQD
EyVVU0VSVHJ1c3QgUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTIxMDMyMjAwMDAw
MFoXDTM4MDExODIzNTk1OVowWjELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28gTGlt
aXRlZDExMC8GA1UEAxMoU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBSb290IFI0
NjCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAJHlG/qqbTcrdccuXxSl2yyXtixG
j2nZ7JYt8x1avtMdI+ZoCf9KEXMarmefdprS5+y42V8r+SZWUa92nan8F+8yCtAjPLosT0eD
7J0FaEJeBuDV6CtoSJey+vOkcTV9NJsXi39NDdvcTwVMlGK/NfovyKccZtlxX+XmWlXKq/S4
dxlFUEVOSqvbnmbBGbc3QshWpUAS+TPoOEU6xoSjAo4vJLDDQYUHSZzP3NHyJm/tMxwzZypF
N9mFZSIasbUQUglrA8YfcD2RxH2QPe1m+JD/JeDtkqKLMSmtnBJmeGOdV+z7C96O3IvLOql3
9Lrl7DiMi+YTZqdpWMOCGhrN8Z/YU5JOSX2pRefxQyFatz5AzWOJz9m/x1AL4bzniJatntQX
2l3P4JH9phDUuQOBm2ms+4SogTXrG+tobHxgPsPfybSudB1Ird1uEYbhKmo2Fq7IzrzbWPxA
k0DYjlOXwqwiOOWIMbMuoe/s4EIN6v+TVkoGpJtMAmhkj1ZQwYEF/cvbxdcV8mu1dsOj+TLO
yrVKqRt9Gdx/x2p+ley2uI39lUqcoytti/Fw5UcrAFzkuZ7U+NlYKdDL4ChibK6cYuLMvDaT
QfXv/kZilbBXSnQsR1Ipnd2ioU9CwpLOLVBSXowKoffYncX4/TaHTlf9aKFfmYMc8LXd6JLT
ZUBVypaFAgMBAAGjggEgMIIBHDAfBgNVHSMEGDAWgBRTeb9aqitKz1SA4dibwJ3ysgNmyzAd
BgNVHQ4EFgQUp9eVd+tKwyfNk743TCaEIRR9XZgwDgYDVR0PAQH/BAQDAgGGMA8GA1UdEwEB
/wQFMAMBAf8wHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMBEGA1UdIAQKMAgwBgYE
VR0gADBQBgNVHR8ESTBHMEWgQ6BBhj9odHRwOi8vY3JsLnVzZXJ0cnVzdC5jb20vVVNFUlRy
dXN0UlNBQ2VydGlmaWNhdGlvbkF1dGhvcml0eS5jcmwwNQYIKwYBBQUHAQEEKTAnMCUGCCsG
AQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0GCSqGSIb3DQEBDAUAA4ICAQBw
pquT4ow8LyRHG6NgR4oUsFncHl+eWLMtEBwv90EpGCGGDDDjoO23j4Zw6tS+THzwgz4SyP0M
FQaMzHj40enm+z1Y29QIQCnJTeDOHWHKMRxeiFD8MBso+XgVM6z6MMDbbJ95btM/4eE3LyaB
uBbheiINaAVieIdxLq6+dVkm00kmvMdlARsTkEvr5a9nYhGAs8T5RBD1DozAv9r89WJcn+QY
X1M2l5vv0ws3Me1ziVSjC2cRhcae4seOFFjkRdJItzfk6H/Wm2FNv2XG8nE1nbgN8UCdhORO
lQGGQ9DN152RmSJ1A6KAJIldo3YrJNiO8J4JLAE5/Tl9CNUHtbdYTOZLCAZ95G1g2GELQ2DQ
1Xxo55iNojqUA4w1feORe86Dq2P08xzolHKepP1LGEw1gDGCkUYR0gVXLJExGd3dfEZDm0mm
U7vWb6vRyLso/GUawFD2MZS4kK8/igkPO2Pkjfd5HD7hknpPVhcuBaWxWj8Q7bjwVlxGwts6
sNZ+UJ5HC4c+11vVoV9cdbb93qpbWn/d+azhit6kRYdUmAUl8Bt5VRBMKCUnSaAAspxb9kFK
+cvm/MjErxN63YNEcMs2QKs3N862V8MQaoKqD+KsKnaLxF6pxRpOotenpfUTNE9GqxP9nI6i
9rSHf16VFwW4NnJ6yUgzHUMdIqtTge98VjCCBiowggQSoAMCAQICEHb3t/4teUvaYKSSf0s+
XMIwDQYJKoZIhvcNAQEMBQAwWjELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28gTGlt
aXRlZDExMC8GA1UEAxMoU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBSb290IFI0
NjAeFw0yMTAzMjIwMDAwMDBaFw0zNjAzMjEyMzU5NTlaMFgxCzAJBgNVBAYTAkdCMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxLzAtBgNVBAMTJlNlY3RpZ28gUHVibGljIEVtYWlsIFBy
b3RlY3Rpb24gQ0EgUjM2MIIBojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAk7qaEDRX
E35PMot8PAmiNaWYblItPHGyt1+H+DUs2GAYHofsdeURmjngaB0C3GcUcrVav1HsGjJuoh77
nRif3O0gxUJGnIzj4ppKxxTsMNau8qvL+FnEkK6VrnqqnKIL3myjhJRdghUlK8Lgetl/3Pdz
KQ7JO2xPZFklrLRm8EQSuUdyccvb+auvRdSnwrxsOvV+9n18ZdeahL/RBxM7R31DhVkMPO19
EiQMj4PBl99wuWzXWL7yLgYh2/TJvIpSOf7waFcHkVYvfAPivV/ulUVaN2ncpSvlE4/TjA8d
5NXKOY+C7RcyD3UZIi6XVg7T81gOfnvE/eEGsyHmgjzLFDYpgBwVOd7jLQ9jhLX4hdRbm959
FrXQQrozzfTbyxRIwMwDqgUoPxIQVU9A7qXKu3yRXsn7OvnjYkYve6X0ZifTbjZaf4Hi/KXW
fNn67zqCt0eNONM2QB5bNqg14qLooRQcgRpSNAEB4UsSyhwsJqEhXz4QwPFWn/wwvEJ0FgYD
AgMBAAGjggFsMIIBaDAfBgNVHSMEGDAWgBSn15V360rDJ82TvjdMJoQhFH1dmDAdBgNVHQ4E
FgQUHwSkfkz2MrEJ4pF84WzfUr/PLv0wDgYDVR0PAQH/BAQDAgGGMBIGA1UdEwEB/wQIMAYB
Af8CAQAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBEGA1UdIAQKMAgwBgYEVR0g
ADBPBgNVHR8ESDBGMESgQqBAhj5odHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29QdWJs
aWNFbWFpbFByb3RlY3Rpb25Sb290UjQ2LmNybDB/BggrBgEFBQcBAQRzMHEwSgYIKwYBBQUH
MAKGPmh0dHA6Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1B1YmxpY0VtYWlsUHJvdGVjdGlv
blJvb3RSNDYucDdjMCMGCCsGAQUFBzABhhdodHRwOi8vb2NzcC5zZWN0aWdvLmNvbTANBgkq
hkiG9w0BAQwFAAOCAgEAWooWgE/1j6esLJfOKB48VUcFaafH6wZcbEln7ls6BP7IvAP2GDRF
33LtQhuVpt7qIqm/RXxWQLaC0yA14LE/pZZdm6CkkoWlTRgzZln6rM9dm2JvqyX2TLS0Z7P1
E6o9EmPx53bRNrnauUu2lYYfpODYq/5LzDPWBjGNK5QW4+oKCykPzzfSveoF5KTuW1xxy+da
EmtXm3hgYwYvTrB/7jHZU2hVbj/8DUAf/JCa/+AdQCtUE5XzKl6o5gGtWahY1yh9smQ3b48/
cto1QW+ZwGCHk5CLr5bDhe2uh2ifn8BXxBOf33D6YHjnrOUyNxi43QD2wZRwyL8arpu/Ljl4
H9zwIM0Q4vfbZuDghYLDnRVC1fGYBArWxw+uvoEMvO7lcc9MTezGkonPmanHYAcGffaIXpIQ
rQWtWS9Pb22jEy6YZCUiqH4YcqkelJHqJD1HBLVMOPaCn2wXgBbv9jvZQsP9yFrD6tKX//ue
D1V12I+L8qjUj17/ZRuxLcPDCF6vb/Svnu38Ejni16jHUO9G/YWFBZOuRbutUEgEp8hMXEzJ
XO43NzBthf80VV86GaC83nNy3TETFF2yav+ioLIK7Qd5NRnI4DXNQYPq6j8qkEnODayXA1bR
7V/qy4BrdrLHJf9NHMiANvCNiDn02MuniTPmb+rp4syaXK409MSG4PYwggVWMIIDvqADAgEC
AhEAsFHj29zvfVPWA2FcnDeJlzANBgkqhkiG9w0BAQsFADBYMQswCQYDVQQGEwJHQjEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMS8wLQYDVQQDEyZTZWN0aWdvIFB1YmxpYyBFbWFpbCBQ
cm90ZWN0aW9uIENBIFIzNjAeFw0yNjA3MDIwMDAwMDBaFw0yODA3MDEyMzU5NTlaMCoxKDAm
BgkqhkiG9w0BCQEWGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQDNxFyhl/UuZdUpuQiuqZBMSU/pN5SMIj4lkvTlrtp2jl4Q77wb
v4vXdXIFWqKd3qtut55G0ptK4nXs1ARrh3AHQAYwB0vW+PHVNPLs9yombnTeMgnEv/RQDFkH
+DxoKdY5+DRUmcVO/tYl6ExMEBj6oh6b/63whIkC61WRETH3FpRCRbyNBD73OWt0KzxoKzW9
xmdqfhNtylLcIFMzuv9C1WAqJ3mLbFHYaW4NEMMckPZJWWYzvA2nwCCryerE3J9z4ZbSK0OK
6DDRN9gW/H7+/4pHSIhdooGfQEdgLj+Z4ZPhvLMF5DncBD8k5DOK8mlDxCKp4GsrLLuBfLQd
xilvAgMBAAGjggHHMIIBwzAfBgNVHSMEGDAWgBQfBKR+TPYysQnikXzhbN9Sv88u/TAdBgNV
HQ4EFgQU3lTOaS6cJRsIzzEjdtC4j6GPtWIwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQC
MAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGy
MQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBzOi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYH
Z4EMAQUBAjBNBgNVHR8ERjBEMEKgQKA+hjxodHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3Rp
Z29QdWJsaWNFbWFpbFByb3RlY3Rpb25DQVIzNi5jcmwwfQYIKwYBBQUHAQEEcTBvMEgGCCsG
AQUFBzAChjxodHRwOi8vY3J0LnNlY3RpZ28uY29tL1NlY3RpZ29QdWJsaWNFbWFpbFByb3Rl
Y3Rpb25DQVIzNi5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggGB
AD6hnou447615g2A0y87bR6mtVI+C+wAFCqRqfrCgHu0dB29VPiVXIVYbPN7H6meSMNr2lFo
e81aZfbE7LMQj98hVKA/ljqWKJe6R5W1Tssv1568G9GJ0fvL1iGT74LuqcuYPt0LVH99Q1rH
MfCBKpsyFo7P3JwoqEkuIpbAhaQMYdTcOgeHMYOLrIdx/9wQ1BXjTa/Cajvc3QxJEb308wgJ
PBxhl8FWWm5MNOynBmRZPKeOeMF5113u6b03KTmXhBqSVeN2nZXEZ+B+wNcJv1dr4Sa0/k6p
tbjZcr9ZkK7QtCarYgLDbsSbcLRJMuXUSHf1yaLwihZWJ1asynbFEmv1SrRSQ+3Hv4megEeY
kYmW9Jiu9qh5z6S98F7JhsP4n6tGs24Xz7l2I/T+BmJMRglTeQnzBihH0kFPUanlApSKC99A
clKs/tfOX8HKHs79Bw3PjRjJDog4D4Pbkom8UwQ/m5sCuOf7v632pjK2jm3OErS3XZxIjnFV
4Gl+5jZ1zzGCAjswggI3AgEBMG0wWDELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28g
TGltaXRlZDEvMC0GA1UEAxMmU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBDQSBS
MzYCEQCwUePb3O99U9YDYVycN4mXMA0GCWCGSAFlAwQCAQUAoIGgMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDcyMDA1NTk0MlowLwYJKoZIhvcNAQkE
MSIEIIvVzKly92tLMPFHepf2+aGVTX90sWDxEtPPGst5yIqeMDUGCSqGSIb3DQEJDzEoMCYw
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzANBgkqhkiG9w0BAQEFAASC
AQBe7tbLBcnCP3YmhPHVEjFDo3KgdTV9Uip6FWOUqiT4XYXdBFDwyq8f+UQxE5rNPlNqBttP
MRB+u26Kvtv7UCSSLNTQzkF3m12DHZNPlr9OiIbM0UJ4Y8U7Kts2hSalhg4oS3y19ZbUAk/n
yOMzDcMuZTKDitK/KUgGYu8vQX2ewNKhbjkqgmwDfCJeXG3c5a0ypWMv67eFpX5t4nDGABy6
AKnlNvtR4RYcDyhWPYZk6iyjhFmFStu3Mm3DmCSyGItRNZv38rOSXF18nySWj0Pnwp52bkra
nhZFjn71eg48ScqomjzIJyTl+WqlnEDxN2CYLWPgXOn2BwrQSptCI+AP

--2rgfur5fpwlyfelz--

