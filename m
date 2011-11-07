Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RNHfG-00029k-DT
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Nov 2011 06:22:34 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Nov 2011 21:15:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="71790365"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by orsmga001.jf.intel.com with ESMTP; 06 Nov 2011 21:15:15 -0800
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 7 Nov 2011 13:15:14 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 7 Nov 2011 13:15:13 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi; Mon, 7 Nov 2011
	13:15:12 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 7 Nov 2011 13:15:11 +0800
Thread-Topic: [oe] Understanding recipes vs packages
Thread-Index: Acyc/fHbrMdj1LDjQBGNaAkBGXJkeQADWiyw
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12DBA31174@shsmsx501.ccr.corp.intel.com>
References: <CAE21AQr7mWqM=RQZBk8k2FUkQW8=jXb6vPBL3k6SnXF5sqRSPg@mail.gmail.com>
In-Reply-To: <CAE21AQr7mWqM=RQZBk8k2FUkQW8=jXb6vPBL3k6SnXF5sqRSPg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: Understanding recipes vs packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Nov 2011 05:22:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Charles,

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Charles Manning
> Sent: Monday, November 07, 2011 11:32 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] Understanding recipes vs packages
>=20
> Hello
>=20
> Something very weird is going on with some changes I have made recently t=
o a
> custom image I am building.
>=20
> For some reason I was getting libpng12 built and now that no longer happe=
ns.
>=20
> In debugging this I've been doing things that now stump me.
>=20
> From my understanding, a recipe can build multiple different packages.
> For example libpng.inc has the following in it:

Yes, it is correct.

>=20
> PACKAGES =3D+ "${PN}12-dbg ${PN}12 ${PN}12-dev"
>=20
> FILES_${PN}12-dbg +=3D "${libdir}/libpng12*.dbg"
> FILES_${PN}12 =3D "${libdir}/libpng12.so.*"
> FILES_${PN}12-dev =3D "${libdir}/libpng12.* ${includedir}/libpng12
> ${libdir}/pkgconfig/libpng12.pc"
> FILES_${PN} =3D "${libdir}/lib*.so.*"
> FILES_${PN}-dev =3D "${includedir} ${libdir}/lib*.so ${libdir}/*.la \
> 		${libdir}/*.a ${libdir}/pkgconfig \
> 		${datadir}/aclocal ${bindir} ${sbindir}"
>=20
>=20
> Does that mean I should be able to build  libgpng12 as follows:
>=20
> bitbake libpng12

No, package name could not be passed to bitbake as a parameter.

Bitbake can accept a recipe name as its parameter, and it will process task=
s like "do_fetch", "do_unpack", ..., "do_package", etc. for that recipe. In=
 the above case, libpng12 will be generated in do_package task, and then it=
 will be archived into rpm/ipk/deb package formats.

Try to run "bitbake libpng" and see if libpng12 is generated.

Thanks,
Dongxiao

>=20
> Thanks
>=20
> Charles
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


