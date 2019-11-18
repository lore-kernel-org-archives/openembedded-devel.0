Return-Path: <prvs=218492722=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Nov 2019 11:47:53 UTC
Received: from esa9.bmw.c3s2.iphmx.com (esa9.bmw.c3s2.iphmx.com
	[68.232.133.110])
	by mail.openembedded.org (Postfix) with ESMTP id BAFA67D1E9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 11:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1574077675; x=1605613675;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=eAwy0uG49MMXp108chAweufCf9rgXY08rSC/cAjEw/s=;
	b=W8iND1+2vkNNaC+NTOLJYdmvlj7rpmHp1kwx9nwf3BaG1rsH/vY4FmWb
	ax+KUO/ZyphFDrssizkMnTS4JGiNTF0QDNBo6eIusigeJum72aZRVM+P0
	ZVKP7mpYrw29j7g+aiCw8MfaqRdE2BNhKXCRjfns9pfbY+b5mvfMrHGhj 8=;
IronPort-SDR: GTX9FjqcYbkxrBANLYt1BR3Jp1LSQ64b+pSd73QU7FzyFJgMTYndQi0VmN6x/Oqr3ipTlDerRY
	b4dFbcJzN5FPfQaVh7PNiSu6NF1ooGFIimX1aYCT0L5Ib20NE5/f16JFCku9KRXjJMYMR2bLTZ
	MusqAhDnJNkdSKhExzFbXy/kkgIKr6dEj3sTnMxnJLsr8sQ1JMUlUrOQdjTNEM27SR4VI4Obfz
	kPiwekcos/nGLFrnh7V8UXDC/rltdwRtH5H93iQUX3HDFzyeurIEUEHY1VUZDpYbXtbvgzkK62
	m68=
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
	esa9.bmw.c3s2.iphmx.com with ESMTP/TLS; 18 Nov 2019 12:40:48 +0100
Received: from esabb5.muc ([160.50.100.47])  by esagw3.muc with ESMTP/TLS;
	18 Nov 2019 12:40:28 +0100
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb5.muc with ESMTP/TLS; 18 Nov 2019 12:40:28 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Mon, 18 Nov 2019 12:40:27 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Mon, 18 Nov 2019 12:40:27 +0100
From: <Mikko.Rapeli@bmw.de>
To: <jhofstee@victronenergy.com>
Thread-Topic: [oe] [meta-qt4][PATCH 0/2] fix qt4 for zeus
Thread-Index: AQHVnZA1pOVfbe9HvE2w/5DckYGk1KeQMEEAgABkoICAAB4xgIAACvuA
Date: Mon, 18 Nov 2019 11:40:27 +0000
Message-ID: <20191118114027.GG3527@hiutale>
References: <20191117214427.20073-1-jhofstee@victronenergy.com>
	<314811743.THUKncEJB5@shodan> <20191118091305.GE3527@hiutale>
	<e5beec9d-74a7-d60d-af9f-71f4c4d527aa@victronenergy.com>
In-Reply-To: <e5beec9d-74a7-d60d-af9f-71f4c4d527aa@victronenergy.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-devel@lists.openembedded.org,
	bunk@stusta.de
Subject: Re: [meta-qt4][PATCH 0/2] fix qt4 for zeus
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
X-List-Received-Date: Mon, 18 Nov 2019 11:47:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <63D7A1B17895304C889DF1CDFEA6405C@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 11:01:09AM +0000, Jeroen Hofstee wrote:
> Hello Mikko,
>=20
> On 11/18/19 10:13 AM, Mikko.Rapeli@bmw.de wrote:
> > On Mon, Nov 18, 2019 at 04:12:56PM +1300, Paul Eggleton wrote:
> >> Hi Jeroen
> >>
> >> On Monday, 18 November 2019 10:44:37 AM NZDT Jeroen Hofstee wrote:
> >>> Gcc 9.2 miscompiles the foreach resulting in broken applications.
> >>> This backports a fix from qt5 to make it work again. The fix is
> >>> not written for this issue, but it does solve it.
> >>>
> >>> As a prepartion it includes some whitespace fixes, so the patches
> >>> are aligned in the SRC_URI.
> >>>
> >>> Jeroen Hofstee (2):
> >>>    qt4: fix whitespace so it aligns
> >>>    qt4: updates for gcc 9.2
> >> I've merged both of these. I've also created zeus and warrior branches=
. (For
> >> now I have assumed these two should not be on warrior - let me know if=
 that's
> >> not correct.)
> > It this ok from licensing point of view since LICENSE =3D "LGPLv2.1 | G=
PLv3"?
> >
> > I suspect the LGPLv2.1 is not correct if GPLv3 licensed patches from qt=
5 are there too.
> >
>=20
> Since the license of the file this patch is coming from is the same
> as in qt4, I don't understand how you suspect that it conflicts.

Ok, that's great then!

As you know, licensing of qt5 is different, e.g. in meta-qt5/recipes-qt/qt5=
/qt5.inc says
LICENSE =3D "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 =
| The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Comm=
ercial )"
which does not include LGPLv2.1.

Thus one needs to be very careful when backporting patches, or change the l=
icensing to be
compatible. If qt4 would not include LGPLv2.1 in LICENSE, then backporting =
GPLv3 licensed
changes from qt5 could be more straight forward.

-Mikko=

