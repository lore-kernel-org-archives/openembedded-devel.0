Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PvOFO-0006qb-KA
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 07:12:18 +0100
Received: by fxm8 with SMTP id 8so1859606fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Mar 2011 22:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=c4uNpl0yhpYqfgp8bLjDYG/geH9ps44chqMK+Yj8p+Y=;
	b=iyGOaf7+4lozFGJGZdK8aIKXaNibcvO7JoOcHWhs4O83rphF0wOUFJkngnkuFLVHG2
	lPOi55Y2u/rh5NK5m+X62X1lhL/pYqDIi3aZC+pgJQIiHKP9fxvfXHmH861mbQpoRJm+
	Y++6PZ+5P1BxIkf50bbSekODFDfULE1KNGglM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=QMYPskqjQ1w/sTAEPtTSpftT4syHgXrw/dg6A8w9+JXaZH3JAOVrv10C6AlVpxLG9V
	pnkc13i075GeY1d1v0ME4mYAnmyK+ERtrAgqTAYsY9sy6D7K1JhmD8fJqBhWF5QdSKM4
	SHihzjzUzXK+dwuPIKgklg4nhN3+8+dML2WOU=
Received: by 10.223.74.136 with SMTP id u8mr237156faj.136.1299219049434;
	Thu, 03 Mar 2011 22:10:49 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 17sm965285far.19.2011.03.03.22.10.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Mar 2011 22:10:48 -0800 (PST)
Date: Fri, 4 Mar 2011 07:10:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110304061046.GA3312@jama.jama.net>
References: <20110224164519.GA12581@jama.jama.net>
	<1298647636-13022-1-git-send-email-Martin.Jansa@gmail.com>
	<20110303072744.GB419@jama.jama.net> <4D6FA7CC.9020407@mentor.com>
	<1299197506.17567.241.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1299197506.17567.241.camel@rex>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] bitbake.conf: define shared PERSISTENT_DIR and point it outside TMPDIR
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
X-List-Received-Date: Fri, 04 Mar 2011 06:12:18 -0000
X-Groupsio-MsgNum: 29911
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 04, 2011 at 12:11:46AM +0000, Richard Purdie wrote:
> On Thu, 2011-03-03 at 07:38 -0700, Tom Rini wrote:
> > On 03/03/2011 12:27 AM, Martin Jansa wrote:
> > > On Fri, Feb 25, 2011 at 04:27:16PM +0100, Martin Jansa wrote:
> > >> * import from poky 6a11cf7dfe930461a6660e3b783b546fa2634900
> > >> * we had CACHE var pointing to machine specific dir since 2006
> > >>    caf077679022f37ce55d758101f130e4e93bd7b5
> > >> * current bitbake is looking for cache dir like this:
> > >>    cachedir =3D (bb.data.getVar("PERSISTENT_DIR", d, True) or
> > >>                bb.data.getVar("CACHE", d, True))
> > >>    which without PERSISTENT_DIR defined picks machine-specific CACHE=
 dir
> > >>    so LOCALCOUNT numbers in SRCPV keeps rolling with every MACHINE s=
witch
> > >>    in same builddir :/
> > >
> > > ping?
> > >
> >=20
> > I'd like Richards comments here.
>=20
> The intent was always to have CACHE be machine specific and
> PERSISTENT_DIR not be machine specific. This means all builds share the

> idea of revision numbers yet the main cache is machine specific so you
> don't hit reparses when switching machines unnecessarily.

BTW: with bitbake master and shared CACHE on one system I noticed that
if I set MACHINE/DISTRO only in shell environment (with correct
BB_ENV_EXTRAWHITE), then cache is not invalidated and metadata reparsed,
resulting in broken builds where parts were respecting ${MACHINE} from
shell and some parts had different machine from previous build.

IIRC I noticed it on different machine listed in build summary and then
another one in filename of machine-specific ipk. Removing cache after
switching MACHINE in shell env worked fine.

Regards,

> So yes, I think the change is valid, I hadn't realised OE didn't have
> that change and I'm happy to ack it...
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> > >>
> > >> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> > >> ---
> > >>   classes/sanity.bbclass |   12 ++++++++++++
> > >>   conf/bitbake.conf      |    2 ++
> > >>   conf/sanity.conf       |    1 +
> > >>   3 files changed, 15 insertions(+), 0 deletions(-)
> > >>
> > >> diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
> > >> index 1e6b170..ffe3a49 100644
> > >> --- a/classes/sanity.bbclass
> > >> +++ b/classes/sanity.bbclass
> > >> @@ -189,6 +189,18 @@ def check_sanity(e):
> > >>   	if messages !=3D "":
> > >>   		raise_sanity_error(messages)
> > >>
> > >> +	#
> > >> +	# Check there isn't old persistent cache
> > >> +	#
> > >> +	cache =3D data.getVar('CACHE', e.data, True)
> > >> +	persistent_dir =3D data.getVar('PERSISTENT_DIR', e.data, True)
> > >> +	persistent_cache_filename =3D data.getVar('SANITY_PERSIST_DATA_FIL=
E', e.data, True)
> > >> +	if os.path.exists(cache + '/' + persistent_cache_filename):
> > >> +		messages =3D messages + "Error, persistent cache file '%s' exists=
 in old location '%s', please migrate it to new location '%s' and merge the=
m together if you have one for each MACHINE.\n" % (persistent_cache_filenam=
e, cache, persistent_dir)
> > >> +
> > >> +	if messages !=3D "":
> > >> +		raise_sanity_error(messages)
> > >> +
> > >>   python check_sanity_eventhandler() {
> > >>       if isinstance(e, bb.event.BuildStarted):
> > >>           check_sanity(e)
> > >> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> > >> index 88ad2ba..0c11cdb 100644
> > >> --- a/conf/bitbake.conf
> > >> +++ b/conf/bitbake.conf
> > >> @@ -294,6 +294,8 @@ FILESDIR =3D "${@bb.which(d.getVar('FILESPATH', =
1), '.')}"
> > >>
> > >>   TMPDIR =3D "${TOPDIR}/tmp"
> > >>   CACHE =3D "${TMPDIR}/cache${@['', '/' + str(bb.data.getVar('MACHIN=
E', d, 1))][bool(bb.data.getVar('MACHINE', d, 1))]}"
> > >> +# The persistent cache should be shared by all builds
> > >> +PERSISTENT_DIR =3D "${TOPDIR}/conf/persistent"
> > >>   CO_DIR =3D "${DL_DIR}"
> > >>   CVSDIR =3D "${CO_DIR}/cvs"
> > >>   SVNDIR =3D "${CO_DIR}/svn"
> > >> diff --git a/conf/sanity.conf b/conf/sanity.conf
> > >> index e9902f6..c1ac332 100644
> > >> --- a/conf/sanity.conf
> > >> +++ b/conf/sanity.conf
> > >> @@ -7,5 +7,6 @@ BB_MIN_VERSION =3D "1.10.2"
> > >>
> > >>   SANITY_ABIFILE =3D "${TMPDIR}/abi_version"
> > >>   SANITY_PRFILE =3D "${TMPDIR}/distro_pr"
> > >> +SANITY_PERSIST_DATA_FILE =3D "bb_persist_data.sqlite3"
> > >>
> > >>   INHERIT +=3D "sanity"
> > >> --
> > >> 1.7.4.1
> > >>
> > >
> > >
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >=20
> >=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1wgmYACgkQN1Ujt2V2gBzzWACgkpZQ89gykJPRTNdHgk7nA2eS
l3YAnjZ4fduIx6E/vaFRFmV9VMtBicpW
=6+mf
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
