Received: from [209.85.146.183] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LhFJh-0004IZ-D2
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Mar 2009 04:41:15 +0100
Received: by wa-out-1112.google.com with SMTP id n7so1260991wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2009 20:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=YjPSwbJ9cHsCfpXWCjsms9W5INgkcstGrTj9yyr/kts=;
	b=Aeld6yLIeckw20j98j/6nzD/PCilp7SdKwyIjN2fImm0Tp5R4EeUNiL1eHLxYfXUNg
	7odCAfiu/wwSiB7ib5qIfouvVQ2kguJmd9+5yIuHfJcjYzRlhlnjEfWtFli6TEOXovMq
	9Xkh7BjTih5HaWGGrDiiStSqTF3ILiKBXUUgc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=hUI9WTjpptDgSdstE9WQnwIgpeafiQUNMgAE5le7jYYTHt/iYsUPPp5+JG6oN4cgcZ
	OzV7NJ0wWDDknECueEgtNRPBCAwvSemI0x1TyYIzx1m5Va9+PRQwUm6DgQ0Ik18a3HqE
	eky/tyJbM+uhGK23rjJACNIRQ3+sO/1lUEP1o=
Received: by 10.115.32.1 with SMTP id k1mr4799250waj.66.1236742868850;
	Tue, 10 Mar 2009 20:41:08 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-1-99.dsl.pltn13.sbcglobal.net
	[71.146.1.99])
	by mx.google.com with ESMTPS id l28sm5760954waf.65.2009.03.10.20.41.07
	(version=SSLv3 cipher=RC4-MD5); Tue, 10 Mar 2009 20:41:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Mar 2009 20:41:02 -0700
User-Agent: KMail/1.11.1 (Linux/2.6.28-9-generic; KDE/4.2.1; x86_64; ; )
References: <1236463653.25861.321.camel@cheeto.emacinc.com>
	<19c1b8a90903101035t52ba7a0ble2f49e324bc20ba@mail.gmail.com>
	<20090311030509.GA10085@denix.org>
In-Reply-To: <20090311030509.GA10085@denix.org>
MIME-Version: 1.0
Message-Id: <200903102041.06686.raj.khem@gmail.com>
Subject: Re: failure on gcc-cross-initial-4.2.4-r5 for i686
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
X-List-Received-Date: Wed, 11 Mar 2009 03:41:18 -0000
X-Groupsio-MsgNum: 8341
Content-Type: multipart/signed; boundary="nextPart9898945.g8txx1lpfE";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart9898945.g8txx1lpfE
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tuesday 10 March 2009 20:05:09 Denys Dmytriyenko wrote:
> On Tue, Mar 10, 2009 at 10:35:19AM -0700, Khem Raj wrote:
> > On Tue, Mar 10, 2009 at 8:40 AM, Travis Stratman <tstratman@emacinc.com=
>=20
wrote:
> > > Thanks Khem.
> > >
> > > On Mon, 2009-03-09 at 15:35 -0700, Khem Raj wrote:
> > >> On Mon, Mar 9, 2009 at 3:18 PM, Travis Stratman
> > >> <tstratman@emacinc.com> wrote:
> > >>
> > >> snip
> > >>
> > >> > PREFERRED_PROVIDERS +=3D "
> > >> > virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
> > >> > PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
> > >> > PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"
> > >>
> > >> Can you try by removing above three
> > >>
> > >> Rest of the changes seems like should not have effect.
> > >
> > > This doesn't seem to change anything. I made the changes, cleaned all
> > > glibc and gcc packages, then tried to build and I still get the same
> > > issue.
> > >
> > > Any other ideas?
> >
> > Hmm looking closely it seems that your cross compiler is from
> > i686-linux -> i686-linux which is native configuration and intl
> > configury  is then trying to use
> > your freshly built CC instead of the BUILD_CC. In short its not really
> > thinking if it is cross compiling. I have a x86_64 box thats why it
> > worked for me because I am cross'ing from x86_64-linux to i686-linux
> >
> > I will give it a shot on x86 box too. Meanwhile can you also define
> > TARGET_VENDOR =3D "something" for your distr and rebuild
>
> I'll save you some trouble - been building i686-generic on I32 x86 for
> months w/o a problem. Angstrom distro with a small overlay - configuration
> is pretty basic.
>
[snip]
> i686-linux holds my native packages
> i686-angstrom-linux holds my target/cross packages, including gcc-cross

Yeah this makes your target triplet different then your host triplet and he=
nce=20
it compiles a correct cross gcc for you.

> i686-generic-angstrom-linux holds machine-specific target packages

=2D-=20
Khem Raj

--nextPart9898945.g8txx1lpfE
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEUEABECAAYFAkm3Ms8ACgkQHnJKy6V6em6mVgCfeNFQUKUUawJlGfE7CjEv0r9H
UnYAlizdrOYr2KuXZRopmdjjygUyH9I=
=TkIc
-----END PGP SIGNATURE-----

--nextPart9898945.g8txx1lpfE--
