Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id B321E60169
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 19:37:01 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hi2so9513634wib.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 12:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bQI2idD4b4NRzN2je+cbjUz3qOIsVyqR35bN9aPdQ6Y=;
	b=HroP3HXFpYVEbEQylbIK4BD8o5QmLih5NPQyCE2yobPrMqxVji5nXlNzop5XgfEsP6
	x+aWDEX66YSxJLmIZJxXBKd45FjMwgApdD32AkKMwmhC7zXF17r6cUnU20B2Lre9FbLI
	YytOqVlYcvN9DIjngJy5rry3Z1vIjHC9hqPdxio2i3VWYJSTcRn7vHbtwdl8R6O8Dz6D
	74LFsAAf+Tc8kMhFxOGscpoRWRWRrsnJQoNgvjaiaKP6uKCwytkf3RXUgKf1+OwDg0PY
	oovmhC3lMrQ5bSMseERUboBZVAQUaZEdaWD8H/jyArDhfPSkwlvGPbJHQ8lBwrDK9v54
	CNpQ==
X-Received: by 10.180.184.99 with SMTP id et3mr53750707wic.31.1407353822434;
	Wed, 06 Aug 2014 12:37:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pm3sm4536929wjb.28.2014.08.06.12.37.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 12:37:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 Aug 2014 21:37:32 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140806193732.GQ14848@jama>
References: <1407332271-32696-1-git-send-email-joe_macdonald@mentor.com>
	<20140806183909.GO14848@jama> <20140806185145.GF14621@mentor.com>
MIME-Version: 1.0
In-Reply-To: <20140806185145.GF14621@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] wireshark: update to latest stable version
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
X-List-Received-Date: Wed, 06 Aug 2014 19:37:08 -0000
X-Groupsio-MsgNum: 51466
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Ocr+Jy+jPJR1APa"
Content-Disposition: inline

--/Ocr+Jy+jPJR1APa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2014 at 02:51:45PM -0400, Joe MacDonald wrote:
> [Re: [oe] [meta-networking][PATCH] wireshark: update to latest stable ver=
sion] On 14.08.06 (Wed 20:39) Martin Jansa wrote:
>=20
> > On Wed, Aug 06, 2014 at 09:37:51AM -0400, Joe MacDonald wrote:
> > > Version 1.12.0 is out, update the SRC_URI and associated variables.
> >=20
> > One more issue:
> >=20
> > WARNING: QA Issue: wireshark rdepends on c-ares but its not a build
> > dependency? [build-deps]
> >=20
> > it's strange, but it's new with 1.12.0 final.
>=20
> This is likely auto-detected and the behaviour is different depending on
> the presence or absence of c-ares.  I'm inclined to disable the
> dependency in wireshark, but calling it out explicitly is fine with me
> too.

That's what my test-dependencies.sh script is testing and it was
returning clean result for rc2, that's why it's surprising, but
wireshark isn't alone with this issue, so follow-up patch is completely
fine (it can also include that PE bump).

http://lists.openembedded.org/pipermail/openembedded-devel/2014-July/097223=
=2Ehtml
libcap libnl libnl-genl libnl-nf libnl-route portaudio-v19 sbc were
floating with rc2, all of them fixed (according to test-dependencies.sh)
by
http://lists.openembedded.org/pipermail/openembedded-devel/2014-July/097255=
=2Ehtml

Regards,

> > > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > > ---
> > >  .../wireshark/va_list-can-t-be-NULL-on-ARM.patch   | 99 ------------=
----------
> > >  ...wireshark_1.12.0-rc2.bb =3D> wireshark_1.12.0.bb} | 10 +--
> > >  2 files changed, 5 insertions(+), 104 deletions(-)
> > >  delete mode 100644 meta-networking/recipes-support/wireshark/wiresha=
rk/va_list-can-t-be-NULL-on-ARM.patch
> > >  rename meta-networking/recipes-support/wireshark/{wireshark_1.12.0-r=
c2.bb =3D> wireshark_1.12.0.bb} (81%)
>=20
>=20
>=20
> --=20
> -Joe MacDonald.
> :wq



> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/Ocr+Jy+jPJR1APa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPig/wACgkQN1Ujt2V2gByRugCgmqQm2PEjTwC3+ti4pwyz/pV+
KlkAoJgUQ+To88MxjEd0uqR5ET1D/qsV
=3Buf
-----END PGP SIGNATURE-----

--/Ocr+Jy+jPJR1APa--
