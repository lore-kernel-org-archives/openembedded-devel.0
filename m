Received: from smtp-out26.alice.it ([85.33.2.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1O0rxk-0001ig-Jn
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Apr 2010 09:52:13 +0200
Received: from fbcmmo06.fbc.local ([192.168.184.137]) by smtp-out26.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 11 Apr 2010 09:48:47 +0200
Received: from FBCMCL01B05.fbc.local ([192.168.69.86]) by fbcmmo06.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 11 Apr 2010 09:48:46 +0200
Received: from jcn ([87.6.147.51]) by FBCMCL01B05.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Sun, 11 Apr 2010 09:48:46 +0200
Date: Sun, 11 Apr 2010 09:48:39 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100411094839.7d756ab0.ospite@studenti.unina.it>
In-Reply-To: <hpo3d3$ado$1@dough.gmane.org>
References: <20100409213945.fdbf907b.ospite@studenti.unina.it>
	<hpo3d3$ado$1@dough.gmane.org>
X-Mailer: Sylpheed 3.0.1 (GTK+ 2.20.0; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 11 Apr 2010 07:48:46.0472 (UTC)
	FILETIME=[6A6C0880:01CAD94B]
X-SA-Exim-Connect-IP: 85.33.2.26
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: libmokoui2 needs pygtk-codegen-2.0
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
X-List-Received-Date: Sun, 11 Apr 2010 07:52:13 -0000
X-Groupsio-MsgNum: 18548
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Sun__11_Apr_2010_09_48_39_+0200_fwlJNe17zjQIWZg2"

--Signature=_Sun__11_Apr_2010_09_48_39_+0200_fwlJNe17zjQIWZg2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 09 Apr 2010 22:41:07 +0200
Koen Kooi <k.kooi@student.utwente.nl> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 09-04-10 21:39, Antonio Ospite wrote:
> > Hi,
> >=20
> > when building libmokoui2 I get this:
> > http://tinderbox.openembedded.org/packages/544186/
> >=20
> > basically:
> > /bin/sh: pygtk-codegen-2.0: command not found
> >=20
> > With this change to python-pygtk_2.16.0.bb I can make it build:
> >=20
> > diff --git a/recipes/python/python-pygtk_2.16.0.bb b/recipes/python/pyt=
hon-pygtk_2.16.0.bb
> > index e2b0602..de570c7 100644
> > --- a/recipes/python/python-pygtk_2.16.0.bb
> > +++ b/recipes/python/python-pygtk_2.16.0.bb
> > @@ -36,7 +36,6 @@ do_configure_prepend() {
> >  # dirty fix #1: remove dependency on python-pygobject-dev
> >  do_install_append() {
> >         find ${D} -name "*.la"|xargs rm -f
> > -       rm -f ${D}/${bindir}/pygtk-codegen-2.0
> >         rm -rf ${D}/${libdir}/pkgconfig
> >  }
> >=20
> > Is this the way to go? Why pygtk-codegen-2.0 is not supplied?
>=20
> It's part of python-gobject nowadays (and named differently).
>

So the right fix should be to make libmokoui2 using
pygobject-codegen-2.0 instead, leaving python-pygtk_2.16.0.bb
untouched, I see.

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

--Signature=_Sun__11_Apr_2010_09_48_39_+0200_fwlJNe17zjQIWZg2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvBftcACgkQ5xr2akVTsAECHwCgncHpl1OWLWl8REzjmOvTWQqs
NNUAn1nZwSFY2oC90xv1djJlnU6F8/q2
=4OXQ
-----END PGP SIGNATURE-----

--Signature=_Sun__11_Apr_2010_09_48_39_+0200_fwlJNe17zjQIWZg2--
