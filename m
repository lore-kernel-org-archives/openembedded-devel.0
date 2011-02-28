Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pu5kN-0003Y4-Bt
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 17:14:55 +0100
Received: by fxm8 with SMTP id 8so3656711fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 08:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=HGbuCmBB3+1qmRYI5w75lwsigWaRv9wEgXDUFG9io/4=;
	b=RdOZ8UCZtdK0UIBubxkeSQCLXjj/1XT49WmHORmtcdtUXnSYZ6B8/tZfOc+N2z4HB2
	a0m/Aw/GIVBWyKb7bdU2gNe4FedHMzayqkljh8lSgCPsdkMkAu7plMkYK40O7Wxfh8y6
	h3RIRAA3UvTupMjx+HnRVwY2L+vQyzstUKP40=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Sv20fE+1Xmf8mSdbOGn6Gby05HYAaLoarfZiRw1oEbXHExqQ4k0fGmwJKkkqYhCrUi
	YUG3pkV2T/RjVT3LFM1BzaesIZVNAel2b6imZyvj8oAXyJhHE1ZrC4oOlmdwmm3aP8bl
	nVBbryU7Oyw1gO2JrwOC8iUuBV23zs6a+qBS0=
Received: by 10.223.114.209 with SMTP id f17mr6803388faq.136.1298909610384;
	Mon, 28 Feb 2011 08:13:30 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id o17sm3189fal.25.2011.02.28.08.13.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Feb 2011 08:13:29 -0800 (PST)
Date: Mon, 28 Feb 2011 17:13:28 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110228161328.GH5886@jama.jama.net>
References: <4D6BC0EA.4000207@mentor.com> <20110228160659.GG5886@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20110228160659.GG5886@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: shr-image failure
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
X-List-Received-Date: Mon, 28 Feb 2011 16:14:55 -0000
X-Groupsio-MsgNum: 29767
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FUaywKC54iCcLzqT"
Content-Disposition: inline

--FUaywKC54iCcLzqT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2011 at 05:06:59PM +0100, Martin Jansa wrote:
> On Mon, Feb 28, 2011 at 08:36:10AM -0700, Tom Rini wrote:
> > Hey all,
> >=20
> > Trying to build shr/shr-image/nokia900 fails with the following:=20
> > http://pastebin.com/Z13aYd2Z which seems odd in that we're building:
> >=20
> > NOTE: Running task 5802 of 10948 (ID: 2141,=20
> > /var/hudson/workspace/sb_openembedded_autobuilder/BBPKGS/shr-image/DIST=
RO/shr/MACHINE/nokia900/label/sb-u804/recipes/efl1/elementary_svn.bb,=20
> > do_setscene)
> > NOTE: package elementary-2_0.7.0+svnr56372-r11: task do_setscene: Start=
ed
> >=20
> > And it's already past do_populate_sysroot before this starts.  I do see=
=20
> > some svn complaining (and not doing something...) earlier on in the=20
> > do_configure here.
>=20
> This looks like related to
> http://www.mail-archive.com/bitbake-dev@lists.berlios.de/msg00880.html
>=20
> which was resolved later with scmdata=3Dkeep param
> http://git.openembedded.org/cgit.cgi/bitbake/commit/?id=3D05cbc1d1a01c667=
c77688f36fbc5b61c5f452a3a
>=20
> but that patch didn't make it to bitbake-1.10.2 release, but neither did
> patch causing this in master/1.12
> http://git.openembedded.org/cgit.cgi/bitbake/commit/?id=3Df264cb6d4347252=
5ad787b0887764ea696ec52ba
>=20
> Can you try that svnversion call in your checkout to get thath svn
> error? It seems to be working here fine.

$ mkdir test && cd test
$ tar xzvf ../downloads/elementary_svn.enlightenment.org_.svn.e.trunk_56372=
_.tar.gz
$ cd elementary
$ (svnversion . | grep -v export || echo 0) | awk -F : '{printf("%s\n",$1);=
}' | tr -d ':MSP\n'
56372$

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FUaywKC54iCcLzqT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1ryagACgkQN1Ujt2V2gBxE8ACgiFe9OIrPyCuQhFHcbgfGdBtt
fNwAn3q66oFGfHx+gjCBP2g9Y6bzd1yf
=RxcU
-----END PGP SIGNATURE-----

--FUaywKC54iCcLzqT--
