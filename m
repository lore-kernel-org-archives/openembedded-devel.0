Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R70oc-0007jF-Ty
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Sep 2011 10:08:59 +0200
Received: by bke11 with SMTP id 11so3622397bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2011 01:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=g4/ZYuFvnH8pyF1m0rncZMGEh1zmiPFaYQeohNJxsHk=;
	b=CUO+ilWJrALU/qqy5WbuNF9gewnZSilZnYbOXKi34qTDwNK4GhU55KbFvCbNf3sX/n
	GzCR1zplEpvvfkksOuTnu9X0lhqFnlJxIMcpArp5j6ULyJ3aCoFKkif+kqB1uo/7zZhB
	3YtFknNZDZhAwiYcZGLT1qE2G7AMSeGLtXiPQ=
Received: by 10.204.156.11 with SMTP id u11mr2181835bkw.143.1316765018410;
	Fri, 23 Sep 2011 01:03:38 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t18sm10593240bkb.9.2011.09.23.01.03.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Sep 2011 01:03:37 -0700 (PDT)
Date: Fri, 23 Sep 2011 10:03:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110923080330.GB9004@jama.jama.net>
References: <ED3E0BCACD909541BA94A34C4A164D4C40134FF1@post.tritech.se>
MIME-Version: 1.0
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C40134FF1@post.tritech.se>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: How to track custom packages during development?
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
X-List-Received-Date: Fri, 23 Sep 2011 08:08:59 -0000
X-Groupsio-MsgNum: 34460
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Content-Disposition: inline

--gj572EiMnwbLXET9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2011 at 07:48:06AM +0000, Mats K=E4rrman wrote:
> Hi!
>=20
> I'm using OE classic for a product I'm developing. Included in the produc=
t are some proprietary software applications that I build using OE recipes.=
 In an Agile development spirit :) these applications are frequently update=
d and distributed to the customer using .ipk's. Now to the question:
>=20
> How do I best manage versions of these packages without having to create =
a new recipe for each?
>=20
> E.g. can I have a recipe xxxx-1.0 that has a variable that is included in=
 the ipk filename and version?

If they are built from SCM then SRCPV should be included in PV and it
will end in filename and version :).

Also you can use AUTOREV to build always the latest HEAD if needed.

>=20
> All suggestions are welcome!
>=20
> Thanks,
> Mats
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk58PVIACgkQN1Ujt2V2gBxn+ACeI9TYNhOQTJfRHRSOEdfDOBmo
Du8An0CX/5bgvny6kay0XgZBosYyQenh
=ZGig
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
