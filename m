Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0DFC177316
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id CD0FE2E3BD;
	Sat, 11 Mar 2017 06:24:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Vm9VrXbqpcdH; Sat, 11 Mar 2017 06:24:58 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 218F62E315;
	Sat, 11 Mar 2017 06:24:58 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0BC1E1A077;
	Sat, 11 Mar 2017 06:24:58 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 00B5E1A075;
	Sat, 11 Mar 2017 06:24:58 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Sat, 11 Mar 2017 06:24:57 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id E8FA031D;
	Sat, 11 Mar 2017 06:24:57 +0100 (CET)
Received: from xbox12.axis.com (10.0.5.26) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Sat, 11 Mar 2017 06:24:57 +0100
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Sat, 11 Mar 2017 06:24:57 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Sat, 11 Mar 2017 06:24:57 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH 5/5] meson.bbclass: Use the correct C++ compiler
	when cross compiling
Thread-Index: AQHSmiX9196dtmmcCUKreVHv24co5aGPGrPg
Date: Sat, 11 Mar 2017 05:24:57 +0000
Message-ID: <ed10e97de7ba4d4b8de2c3f7feaba5ab@XBOX02.axis.com>
References: <20170311045855.3665-1-pkj@axis.com>
	<20170311045855.3665-5-pkj@axis.com>
	<b2dff51f-a954-d214-f612-e53f506f9233@gmail.com>
In-Reply-To: <b2dff51f-a954-d214-f612-e53f506f9233@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 5/5] meson.bbclass: Use the correct C++ compiler when cross compiling
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
X-List-Received-Date: Sat, 11 Mar 2017 05:24:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: den 11 mars 2017 06:12
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH 5/5] meson.bbclass: Use the correct C++
> compiler when cross compiling
>=20
> On 3/10/17 8:58 PM, Peter Kjellerstedt wrote:
> > ---
> >  meta-oe/classes/meson.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/classes/meson.bbclass b/meta-
> oe/classes/meson.bbclass
> > index e3489dd12..e27ed3906 100644
> > --- a/meta-oe/classes/meson.bbclass
> > +++ b/meta-oe/classes/meson.bbclass
> > @@ -52,7 +52,7 @@ do_write_config() {
> >      cat >${WORKDIR}/meson.cross <<EOF
> >  [binaries]
> >  c =3D '${HOST_PREFIX}gcc'
> > -cpp =3D '${HOST_PREFIX}gcc'
> > +cpp =3D '${HOST_PREFIX}g++'
>=20
> is cpp c preprocssor or c++ compiler ? generally cxx is used for c++
> compiler

I agree, it is confusing, but in Meson it is actually the C++ compiler.

> >  ar =3D '${HOST_PREFIX}ar'
> >  ld =3D '${HOST_PREFIX}ld'
> >  strip =3D '${HOST_PREFIX}strip'
> >

//Peter


