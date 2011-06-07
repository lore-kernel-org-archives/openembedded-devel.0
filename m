Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QTy6c-0002Op-92
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 17:22:10 +0200
Received: by bwz5 with SMTP id 5so5017844bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jun 2011 08:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ySbDowtsmZg4MgRybYmzxQKJfgYKAAuUU8axmQ+MFws=;
	b=ITQSGZV8XN/esCVdHVyIPA80O1WpBvnIrDU3ZJgleWhkfRoz8G6rEPmZUNug/97U+B
	NtCE6d9IUesUgdeUTIyO3XMY8YvNTn/XzobT7jokt4m6koGPjT4asiUhr3TOQrmZSgSF
	p+u2LUfIiDPSWz45DcJMArAJORL1NbO4kXxSQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=uiTXz+DFRVLnIrUaU/2SHbVyMBswU64GTwUH0ptM751n/XKnd4oEnk+p3OSw14XxjO
	b/K1mnEb4mG/+momgJOjI1gU3oROZ7Ea+TTAh/pJxZLO9hRoOLA4AZ8mcCVJ9WhSoQ0d
	MPnUqTMcZ/Lb0r3jrturX32H0uRogqSAqedEk=
Received: by 10.204.171.65 with SMTP id g1mr387316bkz.45.1307459930821;
	Tue, 07 Jun 2011 08:18:50 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id q20sm312040bka.5.2011.06.07.08.18.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 08:18:50 -0700 (PDT)
Date: Tue, 7 Jun 2011 17:18:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Guillaume BERAUDO <guillaume.beraudo@belledonne-communications.com>
Message-ID: <20110607151843.GD23137@jama.jama.net>
References: <guillaume.beraudo@belledonne-communications.com>
	<1307448812-27299-1-git-send-email-guillaume.beraudo@belledonne-communications.com>
	<20110607124151.GA23137@jama.jama.net>
	<20110607152354.7ff67c49@guibc>
	<20110607133310.GC23137@jama.jama.net>
	<20110607162358.44a38bcf@guibc>
MIME-Version: 1.0
In-Reply-To: <20110607162358.44a38bcf@guibc>
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
X-List-Received-Date: Tue, 07 Jun 2011 15:22:10 -0000
X-Groupsio-MsgNum: 32552
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+KJYzRxRHjYqLGl5"
Content-Disposition: inline

--+KJYzRxRHjYqLGl5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 07, 2011 at 04:23:58PM +0200, Guillaume BERAUDO wrote:
> Martin,
>=20
> > > > what does +nogtk mean in version?
> > >=20
> > > It is possible to compile linphone with or without gtk GUI.
> >=20
> > then I think it's better as part of package name
> > linphone-nogtk_3.4.3
> >=20
> > otherwise you risk user getting upgrade on target
> > from linphone-3.4.3+nogtk to linphone-3.4.4+gtk
>=20
> Ok, I will change this.
>=20
>=20
> > > > > +OVERRIDES_append =3D ":video:console"
> > > >=20
> > > > This looks like someone trying to implement USE flags in OE :).
> > > > But I'm not sure it's right way and I haven't noticed this used
> > > > in any other recipe. So it would be better to discuss first.
> > >=20
> > > I am new to openembedded and thus may have missed something in the
> > > documentations. Can you point me to some elegant way to implement
> > > recipe flavours?
> >=20
> > I don't think TSC agreed on some sort of USE-flag solution or policy
> > yet, but keeping shared EXTRA_OECONF in linphone-3.4.3.inc and then
> > EXTRA_OECONF_append with nogtk specific options in separate files like
> > linphone-nogtk_3.4.3.bb would be easier to understand (at least to
> > me), even when not so "elegant" as your OVERRIDES solution.
>=20
> There is also some conditionnals with the DEPENDS.
> What is the use of all the "DEPENDS_some-package-name" directives?
> Isn't it identical to only use the global "DEPENDS"?

Yes it looks weird and broken on quick glance.
but "shared" DEPENDS =3D "foo" in linphone-3.4.3.inc and DEPENDS_append =3D=
 "gtk+"
in linphone-gtk_1.2.4.bb makes sense
=20
> I removed all the RDEPENDS stuff. Can you confirm it was unnecessary?

all linked .so providers should be picked to rdepends automatically by
package.bbclass so only extra stuff like linphone-gtk-config would be
needed in extra RDEPENDS_${PN} in linphone-gtk_1.2.4.bb.

>=20
> Regards,
>=20
> Guillaume

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+KJYzRxRHjYqLGl5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3uQVMACgkQN1Ujt2V2gByfCACgnD1AuO8M6rX4OOa07ma9vdBV
HAQAoKsQhqJTNoTvnyG4/bk9aZ2Ewyw6
=b1Hb
-----END PGP SIGNATURE-----

--+KJYzRxRHjYqLGl5--
