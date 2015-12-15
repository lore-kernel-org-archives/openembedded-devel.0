Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 22E8E6FF72
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 12:40:56 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id p66so88861160wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 04:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=/HVv7Q681ol5HaG2+DD4nVu7/gOn/dXQk5Z/IETc7ZI=;
	b=zzPVtwK/sh5WNBycHwXWp42R/PQ1eu8sBVUPAm4ZaOL1xzIvWDGbMH3EKqteGLn3JU
	3d4whe3ELeyuAX85kaqT/m/Z1vVM85c+OJPRHJWQhX2rjfINBqF0jjwg5wNNIPTdhjub
	XTPyGyrv245jU3Z24x1WhWBB4BofHTWxIEusrJTV2Mwp4PC/mBYQHI6H1J5Gwso9Pbad
	ruRb+VcDVyoKJBkqbUUfzDCnGFU4VfjX/40EnVCrzyw2O4DqgSAS218ZAwPo63VEtKHc
	Rz4QYjOrm2wlP0mO14z7kVt0HmRUj2jbLOZZRsy55eIHTNlMv3tQaszrE6Q43BGHtsJG
	iFCQ==
X-Received: by 10.194.185.42 with SMTP id ez10mr51013652wjc.82.1450183257039; 
	Tue, 15 Dec 2015 04:40:57 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	u134sm20899029wmd.0.2015.12.15.04.40.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Dec 2015 04:40:56 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAP9ODKpFa5V__us5s+9WY7GHcyvzXT-5U_wzzp8cNmwW5UzYhw@mail.gmail.com>
Date: Tue, 15 Dec 2015 13:40:54 +0100
Message-Id: <0A579224-B53A-40F8-9C7E-270C6D9D9B4A@gmail.com>
References: <97430B74-EFAB-4C2E-BB83-D8695FF14CB8@gmail.com>
	<CAP9ODKpFa5V__us5s+9WY7GHcyvzXT-5U_wzzp8cNmwW5UzYhw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-java][PATCH] openjdk-8: fix rewrite QA warnings
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
X-List-Received-Date: Tue, 15 Dec 2015 12:40:57 -0000
X-Groupsio-MsgNum: 59029
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1D886E62-B574-45FA-9A33-785ADF90DD44";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_1D886E62-B574-45FA-9A33-785ADF90DD44
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> Am 15.12.2015 um 13:31 schrieb Otavio Salvador =
<otavio.salvador@ossystems.com.br>:
>=20
> On Sat, Dec 12, 2015 at 7:36 AM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>=20
>> Fix bitbake warnings from variable renaming like
>>=20
>>    Variable key FILES_${PN} (${bindir}/* ${sbindir}/* ${libexecdir}/* =
${libdir}/lib*${SOLIBS} ${sysconfdir} ${sharedstatedir} ${localstatedir} =
${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*${SOLIBS} =
${base_prefix}/lib/udev/rules.d ${prefix}/lib/udev/rules.d =
${datadir}/${BPN} ${libdir}/${BPN}/* ${datadir}/pixmaps =
${datadir}/applications ${datadir}/idl ${datadir}/omf ${datadir}/sounds =
${libdir}/bonobo/servers) replaces original key FILES_openjre-8 (    =
${JRE_HOME}/bin/[a-z]*     ${JRE_HOME}/lib/[a-z]*     =
${JRE_HOME}/LICENSE     ${JRE_HOME}/release ).
>>=20
>> It is caused by using FILES_${PN} and FILES_{JDKPN} or =
FILES_${JREPN},
>> respectively. Moving FILES_{JDKPN} to openjdk-8_%.bb and =
FILES_${JREPN} to
>> openjre-8_%.bb to allow consequently use FILES_${PN}.
>>=20
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>=20
> Looking at the proposed change, it seems it would be better to squash
> the JDK and JRE installation to a single recipe and do the proper
> split using the packaging.
>=20
> Do you think this is reasonable?

I split openjdk-8/openjre-8 because of weird behavior wrt.

PREFERRED_PROVIDER_java2-runtime =3D "openjdk-8-jre"

but I think with all the things I learned during packaging openjdk-8
and nqp/perl6 I can retry.

This will require lots of tests, so unfortunately it's unlikely
to manage it this year - maybe even not before our planned HP1 update
release.

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_1D886E62-B574-45FA-9A33-785ADF90DD44
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWcApXAAoJEESZlq7c5QqdkkEP/3q4xkodwcrOCjG2o+Lyx6fr
FgHTGh5paPsKSBSKzPUE9zFX8dYv8cbUdhI03qbtojjeYeDctEbjfKFH04CbX2gK
5aH+k+2K8GKf71eX9BwI0n37HoKGCkq0n37dond73CK4W9PgG11W5UCcT0dYo4QM
piyICz1fSUG1NEmCD5CuTjBu0o9rgpkomT5whzZn2tFnFggArRIMdNaAm1kpgtPz
4IzDVTf0Uz6pIoSO22W6KyOyIgPZTK47QXe6hPSspFIJfhrhhxEAXKAbQkSH90+F
f9VH3cwJp6aogYlIzZjCIyTl8iWuZNlpuq+WHv79jpH0aKt4PDgELlWNhXazI5+I
RJpN9aHFgO1s5ZDzmhLXEOGFscC+3XYLALAgZSPtPM56Z5h2cQk1bxUSiLJIE9+/
jCElgE2/wxNTu354z7wp3hklh5dyfxoGj/n2+KOMchif3/cFDOQXNdCntbd6msQK
3TEmi7dBA5XySGtr1xRJbe7tI7RzI77FP9NbXLP1lvvSvTsmlJ49mLD4MPhFnJfj
N4RgL6rgMBnytd3E3uuna3GQpC8O3ccxrWHExcRIGoo2k9ZwwHYC3Sr6QDbFRNMN
UK8ndNBverGadpOvHXblstwcG/9b2u0p+cz+1x2/StHTXGkgQEpb3gO1pUD8d3vj
TgG78oQrPqQpOxw0tgKM
=lBpp
-----END PGP SIGNATURE-----

--Apple-Mail=_1D886E62-B574-45FA-9A33-785ADF90DD44--
