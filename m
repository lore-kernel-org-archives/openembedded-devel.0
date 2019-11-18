Return-Path: <prvs=218492722=Mikko.Rapeli@bmw.de>
Received: from esa4.bmw.c3s2.iphmx.com (esa4.bmw.c3s2.iphmx.com
	[68.232.139.62])
	by mail.openembedded.org (Postfix) with ESMTP id AE85C7F8CB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 09:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1574068392; x=1605604392;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=nxSRnfslu1ihtYTgQwNHVMcxBKvvEs9T3GI7QKU5/C8=;
	b=jpf5EXl+V/4GvtuEZNd2Sj+8IreFNVKzM60iGzAH1/SLjva0JQ6lvsTg
	WON8egOLGdnLeYsyuvaRO52Ek5+pEYFMgvEYzzHEIdaFGt3Z3t30PTy9q
	odUwSgRlmXQOZztXNGthqK1RVpkX9PIQ4aeC7n0rddx2cd075ers0CPMW o=;
IronPort-SDR: 8iv7rLwqhUXs1RLlghnzYaMK9R9VFd7GrEqvnYAYgRHVG7+aCrCXW66OyXnkM3ex4Sipd8wEq1
	o3JbvCz0avuwRdIGF3d5s9K6T1LIIbd9DoVEYsyN4vkqzzmk1gLDlXaahUzG6TESGbB4fVKZ0l
	lRnDxTkucGZI3KVWrmSJWb7OsYUfxBUtxKRzF7cdo1kpuSwJarvZ6k3ar8eQxGzEnCGmYR1eU9
	N3We+R87nQXNKcPj1fq253BJ466zAw/yr3rXKA+xiLiZEqxLWYD1Ct+N4Qow8woTnXuebR53Fh
	1CA=
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
	esa4.bmw.c3s2.iphmx.com with ESMTP/TLS; 18 Nov 2019 10:13:11 +0100
Received: from esabb3.muc ([160.50.100.30])  by esagw1.muc with ESMTP/TLS;
	18 Nov 2019 10:13:10 +0100
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp)
	([160.48.96.46])
	by esabb3.muc with ESMTP/TLS; 18 Nov 2019 10:13:10 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10j.europe.bmw.corp
	(160.48.96.46) with Microsoft SMTP Server (TLS;
	Mon, 18 Nov 2019 10:13:10 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Mon, 18 Nov 2019 10:13:09 +0100
From: <Mikko.Rapeli@bmw.de>
To: <paul.eggleton@linux.intel.com>
Thread-Topic: [oe] [meta-qt4][PATCH 0/2] fix qt4 for zeus
Thread-Index: AQHVnZA1pOVfbe9HvE2w/5DckYGk1KeQMEEAgABkoIA=
Date: Mon, 18 Nov 2019 09:13:09 +0000
Message-ID: <20191118091305.GE3527@hiutale>
References: <20191117214427.20073-1-jhofstee@victronenergy.com>
	<314811743.THUKncEJB5@shodan>
In-Reply-To: <314811743.THUKncEJB5@shodan>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org, bunk@stusta.de
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
X-List-Received-Date: Mon, 18 Nov 2019 09:13:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D4A8BCFE2A6611408A1DA63CEBAAAB94@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 04:12:56PM +1300, Paul Eggleton wrote:
> Hi Jeroen
>=20
> On Monday, 18 November 2019 10:44:37 AM NZDT Jeroen Hofstee wrote:
> > Gcc 9.2 miscompiles the foreach resulting in broken applications.
> > This backports a fix from qt5 to make it work again. The fix is
> > not written for this issue, but it does solve it.
> >=20
> > As a prepartion it includes some whitespace fixes, so the patches
> > are aligned in the SRC_URI.
> >=20
> > Jeroen Hofstee (2):
> >   qt4: fix whitespace so it aligns
> >   qt4: updates for gcc 9.2
>=20
> I've merged both of these. I've also created zeus and warrior branches. (=
For=20
> now I have assumed these two should not be on warrior - let me know if th=
at's=20
> not correct.)

It this ok from licensing point of view since LICENSE =3D "LGPLv2.1 | GPLv3=
"?

I suspect the LGPLv2.1 is not correct if GPLv3 licensed patches from qt5 ar=
e there too.

-Mikko=

