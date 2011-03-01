Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PuJLE-00085v-DU
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 07:45:52 +0100
Received: by fxm8 with SMTP id 8so4310567fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 22:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=eIgUTWYI0n7UedBMO63DbfTmLZkEgNebm4KETg4Q1/I=;
	b=MhHmQt8oC/AL/1h9lBabkT1CU/4fUW5ejRgbmihEs/dJXyCaYODDHxc4XfB44qRA3b
	gAzo2kokW1GHmVc8fHnzSg/e85/6EiiVWOiAWZpt0bQr4XXOM71bsBmqMOiaDrKGGyVD
	sORPPZbX1K33F75Wv23sn055h1cgbQ0KL7aPk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ZbTUQnKCmPVBgN9m5D7FWqPtIWr9p8ou7HN63sD5YnQzW8No7+Uk787DUryMsSy0qu
	SO5djRiG5flPDGeZV+fUJRl1dy0W0rQbmC3ecdat/j9MDb5nwetN8xDJXauCM3NTmoT1
	aC0LcFnMNZSKk1Ev5qtVr/eVkIlmmJskP15dc=
Received: by 10.223.79.1 with SMTP id n1mr5178290fak.36.1298961866159;
	Mon, 28 Feb 2011 22:44:26 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 17sm99206far.19.2011.02.28.22.44.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Feb 2011 22:44:25 -0800 (PST)
Date: Tue, 1 Mar 2011 07:44:24 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110301064424.GK5886@jama.jama.net>
References: <4D6BC0EA.4000207@mentor.com> <20110228160659.GG5886@jama.jama.net>
	<20110228161328.GH5886@jama.jama.net> <4D6BD384.90002@mentor.com>
	<20110228200440.GI5886@jama.jama.net> <4D6C067A.5020202@mentor.com>
	<AANLkTi=UxUu-bJQoMbC2KhppwZuBxQYPp6O1fN0BmEbp@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=UxUu-bJQoMbC2KhppwZuBxQYPp6O1fN0BmEbp@mail.gmail.com>
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
X-List-Received-Date: Tue, 01 Mar 2011 06:45:52 -0000
X-Groupsio-MsgNum: 29803
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Z9t8O/5YJLB6LEUl"
Content-Disposition: inline

--Z9t8O/5YJLB6LEUl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2011 at 02:22:03PM -0800, Khem Raj wrote:
> On Mon, Feb 28, 2011 at 12:32 PM, Tom Rini <tom_rini@mentor.com> wrote:
> > On 02/28/2011 01:04 PM, Martin Jansa wrote:
> >>
> >> On Mon, Feb 28, 2011 at 09:55:32AM -0700, Tom Rini wrote:
> >>>
> >>> On 02/28/2011 09:13 AM, Martin Jansa wrote:
> >>>>
> >>>> On Mon, Feb 28, 2011 at 05:06:59PM +0100, Martin Jansa wrote:
> >>>>>
> >>>>> On Mon, Feb 28, 2011 at 08:36:10AM -0700, Tom Rini wrote:
> >>>>>>
> >>>>>> Hey all,
> >>>>>>
> >>>>>> Trying to build shr/shr-image/nokia900 fails with the following:
> >>>>>> http://pastebin.com/Z13aYd2Z which seems odd in that we're buildin=
g:
> >>>>>>
> >>>>>> NOTE: Running task 5802 of 10948 (ID: 2141,
> >>>>>>
> >>>>>> /var/hudson/workspace/sb_openembedded_autobuilder/BBPKGS/shr-image=
/DISTRO/shr/MACHINE/nokia900/label/sb-u804/recipes/efl1/elementary_svn.bb,
> >>>>>> do_setscene)
> >>>>>> NOTE: package elementary-2_0.7.0+svnr56372-r11: task do_setscene:
> >>>>>> Started
> >>>>>>
> >>>>>> And it's already past do_populate_sysroot before this starts. =A0I=
 do
> >>>>>> see
> >>>>>> some svn complaining (and not doing something...) earlier on in the
> >>>>>> do_configure here.
> >>>>>
> >>>>> This looks like related to
> >>>>> http://www.mail-archive.com/bitbake-dev@lists.berlios.de/msg00880.h=
tml
> >>>>>
> >>>>> which was resolved later with scmdata=3Dkeep param
> >>>>>
> >>>>> http://git.openembedded.org/cgit.cgi/bitbake/commit/?id=3D05cbc1d1a=
01c667c77688f36fbc5b61c5f452a3a
> >>>>>
> >>>>> but that patch didn't make it to bitbake-1.10.2 release, but neither
> >>>>> did
> >>>>> patch causing this in master/1.12
> >>>>>
> >>>>> http://git.openembedded.org/cgit.cgi/bitbake/commit/?id=3Df264cb6d4=
3472525ad787b0887764ea696ec52ba
> >>>>>
> >>>>> Can you try that svnversion call in your checkout to get thath svn
> >>>>> error? It seems to be working here fine.
> >>>>
> >>>> $ mkdir test&& =A0 cd test
> >>>> $ tar xzvf
> >>>> ../downloads/elementary_svn.enlightenment.org_.svn.e.trunk_56372_.ta=
r.gz
> >>>> $ cd elementary
> >>>> $ (svnversion . | grep -v export || echo 0) | awk -F :
> >>>> '{printf("%s\n",$1);}' | tr -d ':MSP\n'
> >>>> 56372$
> >>>
> >>> The error is that the svn version is too old for the checkout. =A0Is =
there
> >>> a way we can figure this out without calling svn?
> >>
> >> I guess you have subversion< =A01.6
> >> and 1.6 changed the format, so if efl repo was upgraded then it needs
> >> newer svn client
> >>
> >> http://subversion.apache.org/docs/release-notes/1.6.html
> >>
> >> Maybe it's time to force subversion-native as there were issues before
> >> ie with -trust-server-cert.

And this problem is a bit wider, if buildhost filling your PREMIRRORS
already has subversion-1.6.0, then you need also at least 1.6.0 to work
with tarballed checkouts. If you disable PREMIRROS and do "svn co" on
your own, then you have chance that repository wasn't converted yet and
your checkout will work with your svn version.

> >
> > Stupid question. =A0Why aren't we just using ${SRCREV} ? =A0Or is this =
really
> > bitbake calling out svn to do something?
>=20
> there are some packages whose configure/makefiles munges data from scm
> folders to find out *stuff* if its checked out from scm and I dont
> know how

In this case they're checking if elementary rev is new enough for rev of
python-elementary you're trying to build and as both didn't have
release..

so elementary is still 0.7.0.${SRCREV} and python-elementary wants
pkgconfig_elementary_requires_libs=3D"elementary >=3D 0.7.0.52890 evas >=3D=
 1.0.0 eina >=3D 1.0.0 python-evas >=3D ${python_evas_version}"

I'll ask on #edevelop if they plan to change elementary version to at
least 0.7.1 any time soon, but in the meantime I think that their
requirements are valid and svnversion should work.

> they handle the same on release tarballs.

They have the same of 4th part of version, but this problem is not
there, because it will result to "0" when .svn is not there and version
will be 1.0.0.0 which is good enough for requirements like this "evas >=3D =
1.0.0"

BTW: I still don't see how it gets "110" in "0.7.0.110", because without
=2Esvn I always got "0", so I would expect the same without svnversion
working.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Z9t8O/5YJLB6LEUl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1slcgACgkQN1Ujt2V2gBwEsQCgr5IHBYzskVSqEm62+TvKaXsy
CPkAn1ul1ci+31HyQYKjDRPOFX4aEY5Y
=YUm7
-----END PGP SIGNATURE-----

--Z9t8O/5YJLB6LEUl--
