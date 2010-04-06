Received: from smtp-out05a.alice.it ([85.33.3.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1Nz5bh-0002YL-FI
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Apr 2010 12:02:06 +0200
Received: from FBCMMO04.fbc.local ([7.168.68.254]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 6 Apr 2010 11:58:44 +0200
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 6 Apr 2010 11:58:43 +0200
Received: from jcn ([87.1.143.206]) by FBCMCL01B06.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Tue, 6 Apr 2010 11:58:42 +0200
Date: Tue, 6 Apr 2010 11:58:37 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100406115837.fde46160.ospite@studenti.unina.it>
In-Reply-To: <201004032017.10514.marcin@juszkiewicz.com.pl>
References: <20100403171724.b9df4c84.ospite@studenti.unina.it>
	<201004032017.10514.marcin@juszkiewicz.com.pl>
X-Mailer: Sylpheed 3.0.1 (GTK+ 2.20.0; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 06 Apr 2010 09:58:42.0748 (UTC)
	FILETIME=[BD4C97C0:01CAD56F]
X-SA-Exim-Connect-IP: 85.33.3.5
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL, BAYES_00, RCVD_ILLEGAL_IP
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gtk+-native-2.20.0-r8.0 fails in do_configure.
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
X-List-Received-Date: Tue, 06 Apr 2010 10:02:06 -0000
X-Groupsio-MsgNum: 18431
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Tue__6_Apr_2010_11_58_37_+0200_WLN3axuZS0zZS5Js"

--Signature=_Tue__6_Apr_2010_11_58_37_+0200_WLN3axuZS0zZS5Js
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 3 Apr 2010 20:17:09 +0200
Marcin Juszkiewicz <marcin@juszkiewicz.com.pl> wrote:

> Dnia sobota, 3 kwietnia 2010 o 17:17:24 Antonio Ospite napisa=C5=82(a):
> > when building gtk+-native-2.20.0-r8.0 (actually bitbaking
> > fso-console-image DISTRO=3Dminimal MACHINE=3Da780) I get this message:
> >=20
> >  Requested 'glib-2.0 >=3D 2.23.6' but version of GLib is 2.22.1
> >=20
> > See also http://tinderbox.openembedded.org/packages/540390/
> >=20
> > I can workaround that locally but I would like to learn what the best
> > way to solve such issues would be. I don't see any
> > preferred-minimal-versions.inc
>=20
> Recent glib-2.0 recipes has BBCLASSEXTEND =3D "native" set but we also ha=
ve=20
> glib-2.0-native recipes... I think that native ones should be dropped.
>=20

So what is happening to me now it that glib-2.0-native_2.22.1.bb gets
selected and the more recent ones with BBCLASSEXTEND =3D "native" are
discarded, right?

If the -native recipes are going to be dropped should the
BBCLASSEXTEND mechanism moved to some .inc file?

Thanks,
   Antonio

--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

--Signature=_Tue__6_Apr_2010_11_58_37_+0200_WLN3axuZS0zZS5Js
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAku7Bc0ACgkQ5xr2akVTsAFRmwCdETZHV/u4sLBtsl1jq/WmLdD8
vLcAoIQilAkHvZCNqgACgrMH6D6N61c0
=SUec
-----END PGP SIGNATURE-----

--Signature=_Tue__6_Apr_2010_11_58_37_+0200_WLN3axuZS0zZS5Js--
