Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1E30C60CA0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 17:01:27 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id k11so3619902wrd.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Feb 2020 09:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=sPnBkd0YeadRBAz7ibUQ3sgYr5D9EpmjjlwFW2S5pt0=;
	b=By2ZIkf9GRXGnu0xV1hwRSzxnPwYnLX5YbykjsZo9YnUOKrrGCg+J2Qj/DqhtshZ2y
	P95GWi/1UCDBOa7eQibd/pOG8o4KYLScEbohVQonT5V/u/WFXTc15qklyLLOe1NiKN0c
	wUSS6rUqLIFBn9KidUUNuz4f3YwDPhjNGng8ov1H4/uEWX90zA/G9FuYooLv8zP0vhjZ
	QAWkp3AM9WHXkV8DnJ8Zy/N3UJiL24vtlPWAj69ZM3qXzgow7JUmRKM60Po2/w+tseSs
	n+CwZCkVkCg5FtdVh0P/c1+fHU0ilLbyvSc2YIMseuztlUGOQVCwsu7kM0QWAkFtmn1Q
	0cIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=sPnBkd0YeadRBAz7ibUQ3sgYr5D9EpmjjlwFW2S5pt0=;
	b=EAstVZq8BsDIauHmpzRr5EEwDbsJX9m3M4Unbq7hmzsTC13Y9lhSaIJwjNV10zYAaX
	QfIfaai2foLp8jTZai43tBYHJSHE5X9d98O1MM2f0dh8uE9z1qbiwtv/5SAcxKh1eTCv
	4jhssMU8wdpRvDR85B7RrLithP2xtoWxaS1uHyunbBtqK46cHC+c+reP+HDD2fPBaAgp
	kRbbehgh1b5NBcm3k+LGICat8gu6w6yyoBzKgKjpFPlKH7XfE1CWHIv6UnrDvyG0lIAK
	4FTcLnGcgsgSS2kBMB7zHDQDmTqZhx+oH27GNkXaHTzW6U33PJIQVpv2Dr9dnYU46VgG
	0b6A==
X-Gm-Message-State: APjAAAWiLllB1FevCQ4/xnUy0xVFrLpAK09SanUYn/t/lz49HvPES+7O
	JUDqZeqF5sfbeo5i4Q8ujDo=
X-Google-Smtp-Source: APXvYqyt52jD680OpaQrXB9jlEyfubxwgdZ8QdYRXDv+NNliqk8UxkGuQbrTOZnZGhMhzLRb+IHTmA==
X-Received: by 2002:a05:6000:118d:: with SMTP id
	g13mr27963005wrx.141.1580922088641; 
	Wed, 05 Feb 2020 09:01:28 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id s8sm201320wmf.45.2020.02.05.09.01.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 09:01:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 5 Feb 2020 18:01:27 +0100
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <20200205170127.xhu2tmhdfrhcbewm@jama>
References: <20200130153405.26756-1-Trevor.Gamblin@windriver.com>
	<CA+chaQdLL1BnAD7Yg3=MJxjxUEOGcZoUvBodTgYCkjTAHTspXQ@mail.gmail.com>
	<CANx9H-CSjpmXB13nkBB8PSgM8a4q=T+xHpQ4FGdij5ykEM+f+A@mail.gmail.com>
	<20200205145939.tadzklcfscc442eg@jama>
	<9c5c3983-5b16-eae0-db77-d273ba65a699@windriver.com>
MIME-Version: 1.0
In-Reply-To: <9c5c3983-5b16-eae0-db77-d273ba65a699@windriver.com>
User-Agent: NeoMutt/20180716
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][zeus][PATCH v2 1/2] python-twisted: add required RDEPENDS for twistd
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
X-List-Received-Date: Wed, 05 Feb 2020 17:01:28 -0000
X-Groupsio-MsgNum: 82622
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pzjvxitsopqvpwhu"
Content-Disposition: inline

--pzjvxitsopqvpwhu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2020 at 10:16:01AM -0500, Trevor Gamblin wrote:
>=20
> On 2/5/20 9:59 AM, Martin Jansa wrote:
> > On Mon, Feb 03, 2020 at 08:45:26PM -0800, Tim Orling wrote:
> > > On Mon, Feb 3, 2020 at 8:30 PM Martin Jansa <martin.jansa@gmail.com> =
wrote:
> > >=20
> > > > Please send this fix to normal meta-python in meta-oe/zeus:
> > > >=20
> > > > http://git.openembedded.org/meta-openembedded/tree/meta-python/reci=
pes-devtools/python/python-twisted.inc?h=3Dzeus
> > > >=20
> > > > BTW: Why are you using meta-python2 with zeus branch? It imho doesn=
't have
> > > > anything which would be missing in oe-core+meta-oe zeus branch and =
fixes
> > > > like this should be resolved also for people using zeus branch with=
out
> > > > overlaying them by meta-python2.
> > > >=20
> > > >=20
> > > Because, as I believe I have said before, I need a prior release to t=
est
> > > the infrastructure on. zeus allows me to work on more than just master
> > > until we have the next stable release branching.
> > The question was for Trevor, I understood that you wanted zeus branch to
> > test the infrastructure, but I still don't understand why any "project"
> > should use meta-python2/zeus for the python2 bits which are still in
> > oe-core/zeus + meta-python/zeus.
> I'm not sure if I'm misunderstanding, or if I have been the cause for
> confusion in my summary. When the reporter filed
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13741, it was clear h=
e was
> using the python 2.x version of Twisted, on the zeus branch of
> meta-openembedded (based on the version of Twisted that he reported). The
> patch was written and tested using meta-oe/meta-python zeus and submitted
> for that layer. I suppose it could be applied to meta-python2 as well.

Thanks for reply, not it's more clear that my brain somehow failed to
parse "[oe] [meta-python][zeus][PATCH v2 1/2]", all I was seeing was
"meta-python" and "2", since my first reply I was seeing this as
meta-python2 and assumed that you're submitting it only there, not to
meta-python in meta-oe/zeus which is completely reasonable.

Sorry for noise I just need more sleep or coffee or both actually.

Now when I see that you're working on meta-python in meta-oe, why not
cherry-pick the commits from master as they are?

Similar change in master:
http://git.openembedded.org/meta-openembedded/commit/meta-python/recipes-de=
vtools/python/python-twisted.inc?id=3D7077abdf29a56896ef4dbad94b28201689b70=
ee3
http://git.openembedded.org/meta-openembedded/commit/meta-python/recipes-de=
vtools/python/python-twisted.inc?id=3D53e62e4e57c701dd546a2e27d8b72b7a46985=
51a
it has a bit fewer modules in RDEPENDS. Is it because of 19.10.0 version in
master while zeus has only 19.7.0 or are they actually missing in master
as well?

Similarly what about the RDEPENDS of conch fixed in master with:
http://git.openembedded.org/meta-openembedded/commit/meta-python/recipes-de=
vtools/python/python-twisted.inc?id=3Dc3a3470b1ba3768e04e0a938870ad487bd848=
120
isn't this needed in zeus as well?

I don't use python-twisted anywhere, I was just curious why this isn't
straight backport from master.

> I suppose it could be applied to meta-python2 as well.
Yes, it looks like these changes are missing in meta-python2/master as
well:
https://git.openembedded.org/meta-python2/tree/recipes-devtools/python/pyth=
on-twisted_19.10.0.bb#n66

Cheers,

> > I see that there are some differences in the recipes in zeus, e.g.:
> >=20
> > martin@jama:/OE/meta-python2$ diff recipes-devtools/python/python-confi=
gparser_3.8.1.bb ../meta-openembedded/meta-python/recipes-devtools/python/p=
ython-configparser_3.8.1.bb
> > 1c1
> > < inherit setuptools python-backports-init
> > ---
> > > inherit setuptools
> > martin@jama:/OE/meta-python2$ diff recipes-devtools/python/python-dbus_=
1.2.12.bb ../meta-openembedded/meta-python/recipes-devtools/python/python-d=
bus_1.2.12.bb
> > 18,19c18,19
> > < # documentation needs python-sphinx, which is not in oe-core or meta-=
python2 for now
> > < # change to use PACKAGECONFIG when python-sphinx is added to oe-core =
or meta-python2
> > ---
> > > # documentation needs python-sphinx, which is not in oe-core or meta-=
python for now
> > > # change to use PACKAGECONFIG when python-sphinx is added to oe-core =
or meta-python
> > But README nor your reply explained to me, what's the benefit of using =
meta-python2/zeus
> > instead of the existing python2 recipes which are in oe-core and meta-o=
e zeus. That's why
> > I've never tried to use it with zeus, nor submitted the python-numpy an=
d python-nose
> > recipes which got removed from oe-core/zeus, but weren't re-introduced =
in meta-python2
> > python-nose was removed in:
> > http://git.openembedded.org/openembedded-core/commit/?h=3Dzeus&id=3D9f0=
7b2836405d86e869780f8f1ae00843eadc409
> > python-numpy in:
> > http://git.openembedded.org/openembedded-core/commit/?h=3Dzeus&id=3D4e9=
659f24e2f699effadcbe378b6a746d77ccdbd
> > from oe-core/zeus.
> >=20
> > > It has nothing to do with what is missing from meta-oe, it is a viable
> > > alternative that also helps prove out my workflow as I have EXTREMELY
> > > LIMITED TIME to support this.
> > Understood, thanks for doing this work, I'm happy to use and contribute=
 to
> > master branch, it's just that I still don't understand the purpose of z=
eus
> > branch (other than testing the infrastructure by you) and I hope you ag=
ree
> > that bug fixes for python2 issues like the one in this thread belong
> > to meta-oe/meta-python zeus in first place (because that's the layer wh=
ich
> > what most people are probably still using with zeus).
> >=20
> > Cheers,
> >=20
> > > On Fri, Jan 31, 2020 at 10:29 AM Trevor Gamblin <
> > > > Trevor.Gamblin@windriver.com> wrote:
> > > >=20
> > > > > From: Trevor Gamblin <trevor.gamblin@windriver.com>
> > > > >=20
> > > > > python-twisted is currently missing some packages for its /usr/bi=
n/twistd
> > > > > executable to function. Add these to the RDEPENDS list, and also =
clean up
> > > > > formatting since the list is getting long.
> > > > >=20
> > > > > Note that a similar patch has already been submitted for master b=
ranch,
> > > > > but the python2 version of twisted needs more explicit RDEPENDS t=
han the
> > > > > python3 version submitted to master in order for /usr/bin/twistd =
to work
> > > > > properly.
> > > > >=20
> > > > > Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> > > > > ---
> > > > >   .../recipes-devtools/python/python-twisted.inc | 18 +++++++++++=
++++++-
> > > > >   1 file changed, 17 insertions(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/meta-python/recipes-devtools/python/python-twisted.i=
nc
> > > > > b/meta-python/recipes-devtools/python/python-twisted.inc
> > > > > index d70104dc2..024a9fa7c 100644
> > > > > --- a/meta-python/recipes-devtools/python/python-twisted.inc
> > > > > +++ b/meta-python/recipes-devtools/python/python-twisted.inc
> > > > > @@ -56,7 +56,23 @@ RDEPENDS_${PN} =3D "\
> > > > >       ${PN}-zsh \
> > > > >   "
> > > > >=20
> > > > > -RDEPENDS_${PN}-core =3D "${PYTHON_PN}-core ${PYTHON_PN}-zopeinte=
rface
> > > > > ${PYTHON_PN}-incremental ${PYTHON_PN}-constantly ${PYTHON_PN}-hyp=
erlink
> > > > > ${PYTHON_PN}-automat"
> > > > > +RDEPENDS_${PN}-core =3D "${PYTHON_PN}-automat \
> > > > > +                       ${PYTHON_PN}-constantly \
> > > > > +                       ${PYTHON_PN}-core \
> > > > > +                      ${PYTHON_PN}-debugger \
> > > > > +                       ${PYTHON_PN}-hyperlink \
> > > > > +                       ${PYTHON_PN}-incremental \
> > > > > +                       ${PYTHON_PN}-misc \
> > > > > +                       ${PYTHON_PN}-pkg-resources \
> > > > > +                       ${PYTHON_PN}-pkgutil \
> > > > > +                       ${PYTHON_PN}-plistlib \
> > > > > +                       ${PYTHON_PN}-pyhamcrest \
> > > > > +                       ${PYTHON_PN}-pyserial \
> > > > > +                       ${PYTHON_PN}-setuptools \
> > > > > +                       ${PYTHON_PN}-unixadmin \
> > > > > +                       ${PYTHON_PN}-zopeinterface \
> > > > > +"
> > > > > +
> > > > >   RDEPENDS_${PN}-test =3D "${PN}"
> > > > >   RDEPENDS_${PN}-conch =3D "${PN}-core ${PN}-protocols"
> > > > >   RDEPENDS_${PN}-mail =3D "${PN}-core ${PN}-protocols"
> > > > > --
> > > > > 2.24.0
> > > > >=20
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > > >=20
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > >=20

--pzjvxitsopqvpwhu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXjr05gAKCRA3VSO3ZXaA
HGH7AJ9crlvFgUEqslfyAQ0TgMni16/zAgCcDQbQbUCwKs9kr336S6pHVgrB04o=
=DjUK
-----END PGP SIGNATURE-----

--pzjvxitsopqvpwhu--
