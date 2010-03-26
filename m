Received: from smtp-out26.alice.it ([85.33.2.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1Nv88b-0006ac-45
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Mar 2010 12:55:42 +0100
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out26.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 26 Mar 2010 12:52:29 +0100
Received: from FBCMCL01B01.fbc.local ([192.168.69.82]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 26 Mar 2010 12:52:29 +0100
Received: from jcn ([79.2.146.62]) by FBCMCL01B01.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Fri, 26 Mar 2010 12:52:28 +0100
Date: Fri, 26 Mar 2010 12:52:22 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100326125222.7c5a7e7f.ospite@studenti.unina.it>
In-Reply-To: <201003220816.04657.holger+oe@freyther.de>
References: <1268826851-28042-1-git-send-email-ospite@studenti.unina.it>
	<1268944304-13459-1-git-send-email-ospite@studenti.unina.it>
	<201003220816.04657.holger+oe@freyther.de>
X-Mailer: Sylpheed 3.0.1 (GTK+ 2.18.9; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 26 Mar 2010 11:52:28.0162 (UTC)
	FILETIME=[CF04DE20:01CACCDA]
X-SA-Exim-Connect-IP: 85.33.2.26
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] gnutls: fix do_configure by depending on gtk-doc
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
X-List-Received-Date: Fri, 26 Mar 2010 11:55:43 -0000
X-Groupsio-MsgNum: 18145
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Fri__26_Mar_2010_12_52_22_+0100_Q1ep_9hAbQnj652z"

--Signature=_Fri__26_Mar_2010_12_52_22_+0100_Q1ep_9hAbQnj652z
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 22 Mar 2010 08:16:04 +0100
Holger Hans Peter Freyther <holger+oe@freyther.de> wrote:

> On Thursday 18 March 2010 21:31:44 Antonio Ospite wrote:
>=20
> > --- a/recipes/gnutls/gnutls.inc
> > +++ b/recipes/gnutls/gnutls.inc
> > @@ -1,13 +1,13 @@
> >  DESCRIPTION =3D "GNU Transport Layer Security Library"
> >  HOMEPAGE =3D "http://www.gnu.org/software/gnutls/"
> > -DEPENDS =3D "zlib libgcrypt lzo guile-native gettext"
> > +DEPENDS =3D "zlib libgcrypt lzo guile-native gettext gtk-doc"
>=20
> gtk-doc? Where is it installing its .m4 file?
>

I didn't investigate deeply the details, but with this patch
gnutls_2.8.5.bb builds again, without this it doesn't and thus prevents
even meta-toolchain to be built; this is reproducible when starting from
a fresh setup (wiping out tmp/ I mean). The full log is here:
http://tinderbox.openembedded.org/public/logs/task/5429228.txt

If the cause is elsewhere and there could be a better fix I am open to
suggestions and instructions about how to find out.

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

--Signature=_Fri__26_Mar_2010_12_52_22_+0100_Q1ep_9hAbQnj652z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkusn/YACgkQ5xr2akVTsAFDBgCgrjAOU2wV3nGAJwVd0gzeLlOm
YI0AnR2XhT5xwQt0fNB3xcJhscI4PabK
=fk2r
-----END PGP SIGNATURE-----

--Signature=_Fri__26_Mar_2010_12_52_22_+0100_Q1ep_9hAbQnj652z--
