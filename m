Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sqpje-0004jc-2T
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 20:09:30 +0200
Received: by weyr6 with SMTP id r6so3681468wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 10:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=djFWvVw9kISDpnd8lLL5JMh3Rv5Zg6wOWpERZybPzao=;
	b=ogNlHx7FAFALH1g1Piu9qi0k8VNboZMbKOT1iUkRd1/a1b3O2SNFsI8J/3b72MaNUs
	Ca6CdVbnEnTUDvc9Fuz21dwouAMdLOWXZWMt/XtZKzarU+Tyb4spYatkLc+qg3fn5XzE
	WY1gsuLLD24qZP1QHp1Vn+GWTnGn8PbSfWF2wxFtd+QnmfNkv9jRceQ0+qqHLNhfNvrd
	pA8thyqV4QDHvIis80FEbYGAA7KIbA2e1PRFVM3aFseboBabKDYilmvUOoYhUwPvrUcV
	am8phwvW8nJgykaPF5F08Sl9BoAtU2rm2yVMG3dgYt5vMovHtDD8ITXc6oQolKLHxt6K
	Y9JQ==
Received: by 10.180.84.164 with SMTP id a4mr19964498wiz.12.1342461491734;
	Mon, 16 Jul 2012 10:58:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bc2sm33324405wib.0.2012.07.16.10.58.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 10:58:10 -0700 (PDT)
Date: Mon, 16 Jul 2012 19:58:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120716175819.GM3729@jama.jama.net>
References: <1342460316-5489-1-git-send-email-raj.khem@gmail.com>
	<1342460316-5489-3-git-send-email-raj.khem@gmail.com>
	<20120716174642.GK3729@jama.jama.net>
	<CAMKF1so4v-Sjm6sgHY4U_d7CwwwGp4DfQc0CSOq75n2kFwYvvA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1so4v-Sjm6sgHY4U_d7CwwwGp4DfQc0CSOq75n2kFwYvvA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC][meta-oe][PATCH 3/3] blacklist.bbclass: Move to meta-angstrom
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
X-List-Received-Date: Mon, 16 Jul 2012 18:09:30 -0000
X-Groupsio-MsgNum: 39694
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5V5c01chtBAiSHoy"
Content-Disposition: inline

--5V5c01chtBAiSHoy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 16, 2012 at 10:50:58AM -0700, Khem Raj wrote:
> On Mon, Jul 16, 2012 at 10:46 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Mon, Jul 16, 2012 at 10:38:36AM -0700, Khem Raj wrote:
> >> This class is angstrom specific so lets move it to more
> >> appropriate layer
> >
> > This is also used by SHR, that's why I've asked Koen to move blacklist
> > from meta-angstrom to meta-oe before
> > http://git.openembedded.org/meta-openembedded/commit/?id=3D68c15845d087=
df0a6f66c58a9fd80548a9bb3a59
> >
>=20
> OK, OE-Core also has blacklist implementation. Have you given a
> thought to use it ?

Yes, but that would require distro config to be updated from
ANGSTROM_BLACKLIST_PN to PNBLACKLIST[pn] at the same time this class is
moved or duplicate all blacklist entries now and then remove
ANGSTROM_BLACKLIST_PN after it's moved..

Cheers,

>=20
> > Cheers,
> >
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  meta-oe/classes/blacklist.bbclass |   20 --------------------
> >>  1 file changed, 20 deletions(-)
> >>  delete mode 100644 meta-oe/classes/blacklist.bbclass
> >>
> >> diff --git a/meta-oe/classes/blacklist.bbclass b/meta-oe/classes/black=
list.bbclass
> >> deleted file mode 100644
> >> index 7bf4a73..0000000
> >> --- a/meta-oe/classes/blacklist.bbclass
> >> +++ /dev/null
> >> @@ -1,20 +0,0 @@
> >> -# anonymous support class from angstrom
> >> -#
> >> -# Features:
> >> -#
> >> -# * blacklist handling, set ANGSTROM_BLACKLIST_pn-blah =3D "message"
> >> -#
> >> -
> >> -python () {
> >> -    import bb
> >> -
> >> -    blacklist =3D bb.data.getVar("ANGSTROM_BLACKLIST", d, 1)
> >> -    pkgnm =3D bb.data.getVar("PN", d, 1)
> >> -    distro =3D bb.data.getVar("DISTRO", d, 1)
> >> -
> >> -    if blacklist:
> >> -     bb.note("%s DOES NOT support %s because %s" % (distro,pkgnm, bla=
cklist))
> >> -        raise bb.parse.SkipPackage("%s DOES NOT support %s because %s=
" % (distro,pkgnm, blacklist))
> >> -
> >> -}
> >> -
> >> --
> >> 1.7.9.5
> >>
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5V5c01chtBAiSHoy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAEVjsACgkQN1Ujt2V2gBw8zwCgjpGrtXQ4ITshK8Iun9M3oD/8
JdcAn1ylkA2TsUela3Op8HIJS2oxxVgm
=M/aW
-----END PGP SIGNATURE-----

--5V5c01chtBAiSHoy--
