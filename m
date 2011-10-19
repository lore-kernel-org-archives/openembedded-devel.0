Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGRre-0001pm-B9
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 10:51:06 +0200
Received: by bkat8 with SMTP id t8so2044031bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2011 01:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ayjmdYsL504iQYznAnhTxRa1vv59DzzSYF2HxGWNx5w=;
	b=gadimhlS2FbMkb/tWNC75//VV1Hpo4LgHcIl8HlSa2QXoiuXEBBnvdf0sfAulftPTh
	nShaHrkzpIbKoAQuoBGVWTWqtuyUikF3raUB3yuGDam3ZQtHsm04lzujDH46jL+oALSw
	D7lnAd6eXJJlntfU1tF/3V0xBZftUPfNshuow=
Received: by 10.204.135.197 with SMTP id o5mr4260826bkt.37.1319013911770;
	Wed, 19 Oct 2011 01:45:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm5032677bkv.8.2011.10.19.01.45.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Oct 2011 01:45:10 -0700 (PDT)
Date: Wed, 19 Oct 2011 10:45:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111019084504.GB3522@jama.jama.net>
References: <4E9D3640.9070608@telia.com> <4E9D8EC0.4030409@gmail.com>
	<4E9E87AF.70900@telia.com>
	<20111019083811.GA4790@ad.chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <20111019083811.GA4790@ad.chargestorm.se>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Use of stamps in the source directory of openembedded-core
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
X-List-Received-Date: Wed, 19 Oct 2011 08:51:06 -0000
X-Groupsio-MsgNum: 34893
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vGgW1X5XWziG23Ko"
Content-Disposition: inline

--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2011 at 10:38:11AM +0200, Anders Darander wrote:
> * Ulf Samuelsson <ulf_samuelsson@telia.com> [111019 10:19]:
> > 2011-10-18 16:35, Khem Raj skrev:
> > > On 10/18/2011 1:18 AM, Ulf Samuelsson wrote:
> > >> After I have built openembedded-core, I notice that the source direc=
tory
> > >> is loaded with files: *.done.
>=20
> > > they indicate successful download of a source tar.
>=20
> > Are you sure?
> > It does not look like the whole story to me.
>=20
> > I can see that for each source file, there is a *.done file,
> > but there are also a lot of *.done which seems to be related
> > to patches, and the patches are not present in the source directory.
>=20
> I can confirm what Ulf is seeing.
> E.g. doing:
> $ ls ../downloads/parallel*
> ../downloads/parallel_build_fix_1.patch.done
> ../downloads/parallel_build_fix_5.patch.done
> ../downloads/parallel_build_fix_2.patch.done
> ../downloads/parallel_build_fix_6.patch.done
> ../downloads/parallel_build_fix_3.patch.done
> ../downloads/parallel-make-fix.patch.done
> ../downloads/parallel_build_fix_4.patch.done
>=20
> (../downloads is the source directory in our configuration).
>=20
> There seems to be a number of files which only have *.done-file, but not
> any downloaded file.
>=20
> > Why are those files created?
>=20
> > What happens if two different packages have a patch with the same name?
>=20
> Good questions...

answer:
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-October/011322.=
html

>=20
> > >> Is this really a good idea?
>=20
> > >> I tend to use a common source directory for multiple projects.
>=20
> > >> Having stamps in the source directory, means that you let one
> > >> project affect the others.
>=20
> --=20
> Anders Darander
> ChargeStorm AB / eStorm AB
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vGgW1X5XWziG23Ko
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6ejhAACgkQN1Ujt2V2gBxKrgCeOLQDlbNp9qjmgRkbM7HnPNUh
r8wAn3xeEIqClVk5n16RVkAyKqsKUVYz
=LKJz
-----END PGP SIGNATURE-----

--vGgW1X5XWziG23Ko--
