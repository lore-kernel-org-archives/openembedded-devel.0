Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pu9MD-00076R-6l
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 21:06:13 +0100
Received: by fxm8 with SMTP id 8so3899907fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 12:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=xdv/P84xQkdxYP8SUZ/tJsgB9acniIESLiBYcW+2Xok=;
	b=q6cbfr/VyKoduX1l62yIvv04v5gzI5OSptATkg/pfwy3Z8X08ASihHJNqXrj/aa/Iz
	o+WzCzDCzwB2YR4H2oVID4ktsRijTkm5tGulwlAe+gDXcG3EUDnEXHLFMXBOdRfm3XMk
	l/rODIpLgeA5Pz1tFAOCA5MU16mL7d8T7rl38=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Ok/oKHEH8+g3vEpIwBnS7m0MhLeZ1Qrt+8VgRniR6wprraPcFM6Vf3sbBnIglmxE20
	xu8MTwoXNnt2ADb8pLDYFb9paJ4IOzld7rdSV5T3zkhc3yPD6+60QDHQ119krlY8mU6m
	tsC1hsu0FTmgXiv/kCsXH6x3w7hCFagkjne3M=
Received: by 10.223.87.80 with SMTP id v16mr6979288fal.128.1298923487575;
	Mon, 28 Feb 2011 12:04:47 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y1sm1772578fak.15.2011.02.28.12.04.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Feb 2011 12:04:46 -0800 (PST)
Date: Mon, 28 Feb 2011 21:04:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110228200440.GI5886@jama.jama.net>
References: <4D6BC0EA.4000207@mentor.com> <20110228160659.GG5886@jama.jama.net>
	<20110228161328.GH5886@jama.jama.net> <4D6BD384.90002@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4D6BD384.90002@mentor.com>
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
X-List-Received-Date: Mon, 28 Feb 2011 20:06:13 -0000
X-Groupsio-MsgNum: 29790
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PMULwz+zIGJzpDN9"
Content-Disposition: inline

--PMULwz+zIGJzpDN9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2011 at 09:55:32AM -0700, Tom Rini wrote:
> On 02/28/2011 09:13 AM, Martin Jansa wrote:
> > On Mon, Feb 28, 2011 at 05:06:59PM +0100, Martin Jansa wrote:
> >> On Mon, Feb 28, 2011 at 08:36:10AM -0700, Tom Rini wrote:
> >>> Hey all,
> >>>
> >>> Trying to build shr/shr-image/nokia900 fails with the following:
> >>> http://pastebin.com/Z13aYd2Z which seems odd in that we're building:
> >>>
> >>> NOTE: Running task 5802 of 10948 (ID: 2141,
> >>> /var/hudson/workspace/sb_openembedded_autobuilder/BBPKGS/shr-image/DI=
STRO/shr/MACHINE/nokia900/label/sb-u804/recipes/efl1/elementary_svn.bb,
> >>> do_setscene)
> >>> NOTE: package elementary-2_0.7.0+svnr56372-r11: task do_setscene: Sta=
rted
> >>>
> >>> And it's already past do_populate_sysroot before this starts.  I do s=
ee
> >>> some svn complaining (and not doing something...) earlier on in the
> >>> do_configure here.
> >>
> >> This looks like related to
> >> http://www.mail-archive.com/bitbake-dev@lists.berlios.de/msg00880.html
> >>
> >> which was resolved later with scmdata=3Dkeep param
> >> http://git.openembedded.org/cgit.cgi/bitbake/commit/?id=3D05cbc1d1a01c=
667c77688f36fbc5b61c5f452a3a
> >>
> >> but that patch didn't make it to bitbake-1.10.2 release, but neither d=
id
> >> patch causing this in master/1.12
> >> http://git.openembedded.org/cgit.cgi/bitbake/commit/?id=3Df264cb6d4347=
2525ad787b0887764ea696ec52ba
> >>
> >> Can you try that svnversion call in your checkout to get thath svn
> >> error? It seems to be working here fine.
> >
> > $ mkdir test&&  cd test
> > $ tar xzvf ../downloads/elementary_svn.enlightenment.org_.svn.e.trunk_5=
6372_.tar.gz
> > $ cd elementary
> > $ (svnversion . | grep -v export || echo 0) | awk -F : '{printf("%s\n",=
$1);}' | tr -d ':MSP\n'
> > 56372$
>=20
> The error is that the svn version is too old for the checkout.  Is there=
=20
> a way we can figure this out without calling svn?

I guess you have subversion < 1.6
and 1.6 changed the format, so if efl repo was upgraded then it needs
newer svn client

http://subversion.apache.org/docs/release-notes/1.6.html

Maybe it's time to force subversion-native as there were issues before
ie with -trust-server-cert.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PMULwz+zIGJzpDN9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1r/9gACgkQN1Ujt2V2gBzX0gCfdm4SUSpSx6wFKD8dPK0lVX9v
vgQAnR+zP+J82Z/6WSQFRI7yyBBFCRWT
=gSVM
-----END PGP SIGNATURE-----

--PMULwz+zIGJzpDN9--
