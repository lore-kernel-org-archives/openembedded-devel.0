Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QTwSR-0007GA-0s
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 15:36:35 +0200
Received: by bwz5 with SMTP id 5so4910967bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jun 2011 06:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=3PuaJI41TZYMTz4nno2xDT7PNnxuJzahOLSQa00u6C0=;
	b=yDk0iOlEi8P3ZgM7Six5Hccr/Iy+rCJSbshDlsibXjzxIuLhhJP3GvOAgTHUKd5kpo
	UjP6OA8v0a3a4T9F2Xeof05R9QdFtZfw+eMbNiLhTcs7OOGIyOb9GtrcVYjNNnEDnm9W
	y4tbXHLfkuhs8ARjtwqr3UamvuPbGM7/fMCsc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=iSoYplPtGf6UsLLDPZKZ0w1EZk7IfZ80pyvOvqNsoLNNTT0qplD7AHx7p1h3RYzOj0
	d+HZXheV0phlEC9XMcCCf5LKxT5UVq6ZV2xFmUtB2FksrpWSobq+PusPUWvAhbY7gWLz
	7qCunCX5QW7N4QrnL3RQGjKw3wO2tak1EbtQY=
Received: by 10.204.15.75 with SMTP id j11mr911330bka.100.1307453597793;
	Tue, 07 Jun 2011 06:33:17 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id ek1sm4181331bkb.9.2011.06.07.06.33.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 06:33:17 -0700 (PDT)
Date: Tue, 7 Jun 2011 15:33:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Guillaume BERAUDO <guillaume.beraudo@belledonne-communications.com>
Message-ID: <20110607133310.GC23137@jama.jama.net>
References: <guillaume.beraudo@belledonne-communications.com>
	<1307448812-27299-1-git-send-email-guillaume.beraudo@belledonne-communications.com>
	<20110607124151.GA23137@jama.jama.net>
	<20110607152354.7ff67c49@guibc>
MIME-Version: 1.0
In-Reply-To: <20110607152354.7ff67c49@guibc>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] linphone: added recipe for v3.4.3
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
X-List-Received-Date: Tue, 07 Jun 2011 13:36:35 -0000
X-Groupsio-MsgNum: 32547
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eHhjakXzOLJAF9wJ"
Content-Disposition: inline

--eHhjakXzOLJAF9wJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 07, 2011 at 03:23:54PM +0200, Guillaume BERAUDO wrote:
> Sorry, I missed your other comments.
> See below for my answers.
>=20
> > > --git a/recipes/linphone/linphone-common_3.4.3.inc
> > > b/recipes/linphone/linphone-common_3.4.3.inc new file mode 100644
> > > index 0000000..5865ab0 --- /dev/null
> > > +++ b/recipes/linphone/linphone-common_3.4.3.inc
> > > @@ -0,0 +1,11 @@
> > > +
> > > +SRC_URI =3D
> > > "${SAVANNAH_MIRROR}/releases/linphone/3.4.x/sources/linphone-3.4.3.ta=
r.gz
> > > \
> > > +	file://cif10fps.patch"
> > where is this file?
>=20
> It is a mistake, this patch should not be added.
>=20
>=20
>=20
> > > +require linphone-common.inc
> > > diff --git a/recipes/linphone/linphone_3.4.3+nogtk.bb
> > > b/recipes/linphone/linphone_3.4.3+nogtk.bb new file mode 100644
> > > index 0000000..9bec7b1
> > > --- /dev/null
> > > +++ b/recipes/linphone/linphone_3.4.3+nogtk.bb
> >
> > what does +nogtk mean in version?
>=20
> It is possible to compile linphone with or without gtk GUI.

then I think it's better as part of package name
linphone-nogtk_3.4.3

otherwise you risk user getting upgrade on target
=66rom linphone-3.4.3+nogtk to linphone-3.4.4+gtk

> I wrote another recipe for linphone 3.4.3 with gtk GUI.
> It will be sent for review later.
>=20
>=20
> > > @@ -0,0 +1,9 @@
> > > +DESCRIPTION =3D "Audio/video SIP-based IP phone (console edition)"
> > > +HOMEPAGE =3D "http://www.linphone.org/?lang=3Dus"
> > > +LICENSE =3D "GPLv2"
> > > +PR=3D"r6"
> > > +
> > > +DEFAULT_PREFERENCE =3D "2"
> >=20
> > why D_P =3D "2" when all other recipes have default D_P =3D "1" and this
> > has highest PV?
>=20
> Ok, I will correct it.
>=20
>=20
> >=20
> > > +OVERRIDES_append =3D ":video:console"
> >=20
> > This looks like someone trying to implement USE flags in OE :). But
> > I'm not sure it's right way and I haven't noticed this used in any
> > other recipe. So it would be better to discuss first.
>=20
> I am new to openembedded and thus may have missed something in the
> documentations. Can you point me to some elegant way to implement
> recipe flavours?

I don't think TSC agreed on some sort of USE-flag solution or policy
yet, but keeping shared EXTRA_OECONF in linphone-3.4.3.inc and then
EXTRA_OECONF_append with nogtk specific options in separate files like
linphone-nogtk_3.4.3.bb would be easier to understand (at least to me),
even when not so "elegant" as your OVERRIDES solution.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eHhjakXzOLJAF9wJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3uKJYACgkQN1Ujt2V2gBw2igCgp2hn80a6l0waeWtQaDYIiowD
t5gAn0dAFrMCNAWTbCx1Y+AWzgHjlooo
=/q4d
-----END PGP SIGNATURE-----

--eHhjakXzOLJAF9wJ--
