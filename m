Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.8106.1595925083459358298
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=RsNbuB3q;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: johan.jeppsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2823; q=dns/txt; s=axis-central1;
  t=1595925083; x=1627461083;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=LAAqVEcdBh+9AGaNTFeOdpdU/b/m6OCJZMF2Ycr8WVA=;
  b=RsNbuB3qCxO/EmCMxnI5xcyE0e3DdZb1XK4vCyASApL9E5CrW7FN0p42
   r83DIwzoNpt0pOf50C67f3InXTnQcrMIKlIFlSXECw9Sx249SatOhxPNW
   NF75CWlu7P2gYjqp7PpBv7KRkwhaTVj341rn/AGecDvlyZBjDrolD9WB4
   xUywnwaQEDGGy8EtMt+uNv0s/iwD4kmv68z+TFBrCVdifZfwizF8Ou+OH
   uICwU5qKC0tNx/PW5VEFKOpNgHbhLiBuLYLo4MazcPzEq19Zkqgv4/T5n
   rQwVvIRRShSXtRAs6tIIEz0+Nk8ZpZGSdAoNsRlyDQfvTRdhjaNZ5lnA4
   Q==;
IronPort-SDR: BuIn4dmBOimLc4P4f4zO1AZXK8ks0QPHZavNKUPN22zj5T/vOGH/uQoJjcLSMVhIsixA9Dlqva
 NIXt4gf4tjP/XuaiyF0HPDJdfDLH0/yfzmb+fZ7SNj8WolGVHRDEVW+g6pF3b3wajJPL+RtR6f
 /5nD7Mnvik+537qPFg7CgVtzAIPHECCcBRd+Fe0pU97nuLP8F/x7AKBciBy+adX57Xrg65QnD7
 FJ9wTCQUgfE9xpS/ScAHedAGoaQFRWrGKSCfCRazsAP/tcwEA2vaOWQ9QJ56SAapkCFLdJBdcS
 LAc=
X-IronPort-AV: E=Sophos;i="5.75,405,1589234400"; 
   d="scan'208";a="11266658"
From: johan.jeppsson@axis.com
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: VB: [meta-networking][dunfell][PATCH] Add recipe for nngpp (c++ wrapper for nng)
Thread-Topic: [meta-networking][dunfell][PATCH] Add recipe for nngpp (c++
 wrapper for nng)
Thread-Index: AQHWY98hzyi8Lhxy/0WAvkvPL1t9VqkbHIB0gABUWACAATl0Rw==
Date: Tue, 28 Jul 2020 08:31:19 +0000
Message-ID: <1595925079727.13183@axis.com>
References: <1595831585459.86775@axis.com>
 <1595839561474.58709@axis.com>,<CAMKF1spAthChf61tCfr3wy_pAq0OUYLDto1J+09pRkmjtvkjVA@mail.gmail.com>
In-Reply-To: <CAMKF1spAthChf61tCfr3wy_pAq0OUYLDto1J+09pRkmjtvkjVA@mail.gmail.com>
Accept-Language: sv-SE, sv-FI, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: Johan.Jeppsson@axis.com
X-Groupsio-MsgNum: 86002
Content-Language: sv-SE
Content-Type: multipart/mixed; boundary="_002_159592507972713183axiscom_"

--_002_159592507972713183axiscom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi!=0A=
=0A=
Thanks Khem for pointing me in the right direction!=0A=
=0A=
I've attached a patch with a recipe for nngpp, which is a c++ wrapper for n=
ng (the latest version of nanomsg). If it's more convenient, I've also uplo=
aded a pull request for it here:=0A=
https://github.com/openembedded/meta-openembedded/pull/257=0A=
=0A=
Regards,=0A=
Johan=0A=
=0A=
________________________________________=0A=
Fr=E5n: Khem Raj <raj.khem@gmail.com>=0A=
Skickat: den 27 juli 2020 17:46=0A=
Till: Johan Jeppsson=0A=
Kopia: akuster808@gmail.com=0A=
=C4mne: Re: [meta-networking][dunfell][PATCH] Add recipe for nngpp (c++ wra=
pper for nng)=0A=
=0A=
Hi Johan=0A=
=0A=
Perhaps its better to send this to the mailing list as well ( you need=0A=
to be subscribed to mailing list ), I can cherry pick it from github=0A=
pulls too.=0A=
=0A=
On Mon, Jul 27, 2020 at 1:46 AM Johan Jeppsson <Johan.Jeppsson@axis.com> wr=
ote:=0A=
>=0A=
> Hi!=0A=
>=0A=
>=0A=
> Sorry for emailing you directly; I tried to send this to openembedded-dev=
el@lists.openembedded.org, but it bounced.=0A=
>=0A=
>=0A=
> I've attached a patch with a recipe for nngpp, which is a c++ wrapper for=
 nng (the latest version of nanomsg).=0A=
>=0A=
> Is anything else needed when adding new recipes? I'm new to this, so I mi=
ght have missed something; please let me know if that is the case!=0A=
>=0A=
>=0A=
> Regards,=0A=
>=0A=
> Johan=0A=

--_002_159592507972713183axiscom_
Content-Type: application/octet-stream; name="nngpp_patch"
Content-Description: nngpp_patch
Content-Disposition: attachment; filename="nngpp_patch"; size=639;
	creation-date="Tue, 28 Jul 2020 08:29:23 GMT";
	modification-date="Tue, 28 Jul 2020 08:29:23 GMT"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uYW5vbXNn
L25uZ3BwX2dpdC5iYiBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uYW5v
bXNnL25uZ3BwX2dpdC5iYgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLjUx
NzYyNGRjZQotLS0gL2Rldi9udWxsCisrKyBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9uYW5vbXNnL25uZ3BwX2dpdC5iYgpAQCAtMCwwICsxLDE0IEBACitERVNDUklQVElP
TiA9ICJDKysgd3JhcHBlciBhcm91bmQgdGhlIG5hbm9tc2cgTk5HIEFQSSIKK0hPTUVQQUdFID0g
Imh0dHBzOi8vZ2l0aHViLmNvbS9jd3p4L25uZ3BwIgorTElDRU5TRSA9ICJNSVQiCitMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9saWNlbnNlLnR4dDttZDU9NmQxN2Q3OGMzNTk3ZTBkNDQ1MmZi
MWM2M2JmN2M1OGUiCitERVBFTkRTID0gIm5uZyIKKworU1JDUkVWID0gIjg1Mjk0ZWRhM2Y1ODQy
ODE0Mzk2NDlhMDc0ZjQ2ZTJkMzUxNmIyYTEiCitQViA9ICIxLjIuNCIKKworU1JDX1VSSSA9ICJn
aXQ6Ly9naXRodWIuY29tL2N3engvbm5ncHAiCisKK1MgPSAiJHtXT1JLRElSfS9naXQiCisKK2lu
aGVyaXQgY21ha2UK

--_002_159592507972713183axiscom_--
