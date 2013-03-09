Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UEDZF-00053Y-CK
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Mar 2013 07:47:42 +0100
Received: by mail-pb0-f44.google.com with SMTP id wz12so1966745pbc.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Mar 2013 22:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=rkjTN9RZSWADhypFyA7YChX46iMsxy+jiQAUtZ2H+y4=;
	b=WZlO1YP+IWNmmIKnqQj95Pw1QA7O+ModaBpjNNGf1XTGfZyBj9hQiOcdeGWVb/Nmx2
	2DvmyPQqIgScQRC4b374KJVmhQo4x+FRgdNL8eiEEHT2hmBlgzfJhsMabJDjJzX+B5or
	Ewe5J/eo4UjDe+0Tl5JwppIqS5K8QDnMqah+oBcbdlC0JIT1+Bi2s6NXWVr6mDPDl0Oi
	gHdencWR11QfUoPr7dnznY+zaUiG3DaR0JRPyk1ORhlpuFD7bUzPGWjgeCkX5s2kem5W
	uZ8xz84tl8wPqqFIsY/DIwhv+ZWHMtigoKjWhsSijj+4czoG/z/ySeB6yG+9F/an7ciK
	sjZA==
X-Received: by 10.68.108.129 with SMTP id hk1mr8946979pbb.102.1362810665675;
	Fri, 08 Mar 2013 22:31:05 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id hu2sm8686336pbc.38.2013.03.08.22.31.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 08 Mar 2013 22:31:03 -0800 (PST)
Date: Sat, 9 Mar 2013 07:30:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130309063059.GA9724@jama.dyndns-home.com>
References: <1362768637-29343-1-git-send-email-otavio@ossystems.com.br>
	<1500617.PjPkZjIiXc@helios>
MIME-Version: 1.0
In-Reply-To: <1500617.PjPkZjIiXc@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] polkit: Remove authentication override as it is handled in OE-Core
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
X-List-Received-Date: Sat, 09 Mar 2013 06:47:49 -0000
X-Groupsio-MsgNum: 43463
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline

--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 08, 2013 at 10:48:17PM +0000, Paul Eggleton wrote:
> On Friday 08 March 2013 15:50:37 Otavio Salvador wrote:
> > OE-Core now handles the detection of authentication so we don't need
> > to do it here. The bbappend file is kept to provide the upgrade path
> > only, or the revision would go backwards.
> >=20
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >  meta-oe/recipes-extended/polkit/polkit_0.104.bbappend | 9 +--------
> >  1 file changed, 1 insertion(+), 8 deletions(-)
> >=20
> > diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
> > b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend index
> > ea82e37..ceb2b6b 100644
> > --- a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
> > +++ b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
> > @@ -1,8 +1 @@
> > -PRINC :=3D "${@int(PRINC) + 4}"
> > -
> > -POLKITAUTH ??=3D "consolekit"
> > -
> > -PACKAGECONFIG +=3D "${POLKITAUTH}"
> > -PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,systemd"
> > -# there is no --enable/--disable option for consolekit and it's not pi=
cked
> > by shlibs, so add it to RDEPENDS -PACKAGECONFIG[consolekit] =3D
> > ",,,consolekit"
> > +PRINC :=3D "${@int(PRINC) + 5}"
>=20
> Can't we just bump PR in OE-Core?

we dont know which oe-core and meta-oe revisions are used together and
this needs to be applied in both at the same time.. so no, we need to
wait for PE/PV change in oe-core.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE61yMACgkQN1Ujt2V2gBx4BwCgrIJp0nQQNB/bm7PzS5KCy0eu
wRIAnioeLCJWf1mzC3NrvHcHGP5XJ3g0
=S4Ug
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
