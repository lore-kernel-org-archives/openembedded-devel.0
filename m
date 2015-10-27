Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id C16E976104
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 20:32:24 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so177343203wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 13:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7RDVyGrnShdQ1BLDMdiwPU4JFxTqNBo+bKbtnSzfg60=;
	b=gM/NDdSJ6TxmH5T6GnENezdoDEgtead18JJFzxQ/Z51fRr3khUKbeXeDCjYirpAFfd
	31zPyNd7vd6JsW3wr7WkiKzVfHavOwe7dNgiGeQR4JXCSMpfx1YzTUPwujk7lt4WrHo8
	fM5U8pf60gVkegEoed2VaH2SLjlrgqjspdg1/IP33yyUT3BruLm8BVspfizVOZq1WGZx
	+ujAyx1Rh4rvWagES14p1HfLDCEuD2WI3UJfYuCayDaqRLSjdVqwmgujFPOAmenFye40
	auQp3k4PHlTs6pu2C/xhO7L2w+QO4xxOnXEoHSzKPZPVmJBW5SUhC7FndWbLMtseW9Sg
	4pFA==
X-Received: by 10.180.90.100 with SMTP id bv4mr28772930wib.77.1445977944479;
	Tue, 27 Oct 2015 13:32:24 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ee5sm46744551wjd.17.2015.10.27.13.32.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Oct 2015 13:32:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 27 Oct 2015 21:32:41 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151027203241.GI2577@jama>
References: <79D6C2B5-2151-4A49-AC04-48342EFD42FD@gmail.com>
	<CAP9ODKox4BAruNKS8cG8EnB+=egF3zJdHC7WZu3jO9OtresREw@mail.gmail.com>
	<39E716D7-E36A-4696-9503-3DBB6B1C94DF@gmail.com>
	<CAP9ODKp5yhi1GqwciLueq1mwzhBekg6DtTxXrPFfP=9gNSEu6w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKp5yhi1GqwciLueq1mwzhBekg6DtTxXrPFfP=9gNSEu6w@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] llvm: update 3.5.2 to have a sane ARM JIT for OpenJDK-8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Oct 2015 20:32:25 -0000
X-Groupsio-MsgNum: 58087
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PWfwoUCx3AFJRUBq"
Content-Disposition: inline

--PWfwoUCx3AFJRUBq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2015 at 06:24:52PM -0200, Otavio Salvador wrote:
> On Tue, Oct 27, 2015 at 6:21 PM, Jens Rehsack <rehsack@gmail.com> wrote:
> >
> >> Am 27.10.2015 um 21:15 schrieb Otavio Salvador <otavio.salvador@ossyst=
ems.com.br>:
> >>
> >> On Tue, Oct 27, 2015 at 6:04 PM, Jens Rehsack <rehsack@gmail.com> wrot=
e:
> >>>
> >>> llvm introduced new JIT technology MCJIT with llvm 3.4 and fixes ARM =
in 3.5
> >>> (see http://llvm.org/releases/3.5.2/docs/ReleaseNotes.html#changes-to=
-the-arm-backend).
> >>>
> >>> Ensure JIT is built with llvm
> >>>
> >>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> >>
> >> There is a patch to add LLVM 3.7[1]; I think this one can be dropped.
> >>
> >> 1. http://patchwork.openembedded.org/patch/106281/
> >
> > I'v seen this and I guarantee that OpenJDK-8 will fail heavily with llv=
m3.7 - the guys
> > put an end to an antiquated API's with each release, and OpenJDK's zero=
shark uses lot's
> > of them.
>=20
> So we will need to figure how to deal with this. I see following options:
>=20
>  - add needed llvm recipe in meta-java (I dislike this)
>  - fix openjdk
>  - update openjdk so it work with 3.7 (preferred)

I don't mind having all 3 llvm versions in parallel until all this is
sorted out.

People can select the right one based on mesa version they are using and
3.8 for OpenJDK.

But I would appreciate this recipe rebased on top of Philip's (or vice
versa), because I don't have spare time to text it with newer mesa
Philip is using or with OpenJDK Jens is using.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PWfwoUCx3AFJRUBq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYv32gACgkQN1Ujt2V2gBzRaQCfVZVLLYt7x1lO0xKm+/6oyGnJ
kBgAn3q/SW/flKnq/oFpPS9bjNDORzfD
=jvFk
-----END PGP SIGNATURE-----

--PWfwoUCx3AFJRUBq--
