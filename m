Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pv2zk-0000Mc-GZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Mar 2011 08:30:44 +0100
Received: by fxm8 with SMTP id 8so833892fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2011 23:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=zC3Tg6t4ebEAGPf4RXieQ9voCtmxNGOWCZs6kG0K9bc=;
	b=eeReGs1yznhWEHjNDS9+DiyOXaE7JndR8ppaWpntWZKXt+hTgbjKph0YAMOkM0SYYY
	JD+uJBGwohc6QMFX3041QlspbQ+L+MnWbM5UK/eLJa2TLTMHrpuElVu4dTzK7seHQztP
	7BQXJklZu5lAYS8Fdclu238w8a/AirTXjsR48=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=VmKf1BLeLEliKV3Hk0DmfHVuLT8J5bQssSCxXJYWaHCAXAqyMjAcsxRVLXzqslHYSn
	Xm4/4sgKOZI2CuNBvy+GNbe8D1gRSDZ3ECm3s16jkGA7v8uREqlx70XGXECINlKS9eep
	MdzVDo2VbeiIjQzb2DiciWWfI+uYa5EML0mQI=
Received: by 10.223.96.195 with SMTP id i3mr1044582fan.77.1299137267286;
	Wed, 02 Mar 2011 23:27:47 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id o12sm389499fav.6.2011.03.02.23.27.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 23:27:46 -0800 (PST)
Date: Thu, 3 Mar 2011 08:27:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110303072744.GB419@jama.jama.net>
References: <20110224164519.GA12581@jama.jama.net>
	<1298647636-13022-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1298647636-13022-1-git-send-email-Martin.Jansa@gmail.com>
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
X-List-Received-Date: Thu, 03 Mar 2011 07:30:44 -0000
X-Groupsio-MsgNum: 29893
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline

--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 25, 2011 at 04:27:16PM +0100, Martin Jansa wrote:
> * import from poky 6a11cf7dfe930461a6660e3b783b546fa2634900
> * we had CACHE var pointing to machine specific dir since 2006
>   caf077679022f37ce55d758101f130e4e93bd7b5
> * current bitbake is looking for cache dir like this:
>   cachedir =3D (bb.data.getVar("PERSISTENT_DIR", d, True) or
>               bb.data.getVar("CACHE", d, True))
>   which without PERSISTENT_DIR defined picks machine-specific CACHE dir
>   so LOCALCOUNT numbers in SRCPV keeps rolling with every MACHINE switch
>   in same builddir :/

ping?

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  classes/sanity.bbclass |   12 ++++++++++++
>  conf/bitbake.conf      |    2 ++
>  conf/sanity.conf       |    1 +
>  3 files changed, 15 insertions(+), 0 deletions(-)
>=20
> diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
> index 1e6b170..ffe3a49 100644
> --- a/classes/sanity.bbclass
> +++ b/classes/sanity.bbclass
> @@ -189,6 +189,18 @@ def check_sanity(e):
>  	if messages !=3D "":
>  		raise_sanity_error(messages)
> =20
> +	#
> +	# Check there isn't old persistent cache
> +	#
> +	cache =3D data.getVar('CACHE', e.data, True)
> +	persistent_dir =3D data.getVar('PERSISTENT_DIR', e.data, True)
> +	persistent_cache_filename =3D data.getVar('SANITY_PERSIST_DATA_FILE', e=
=2Edata, True)
> +	if os.path.exists(cache + '/' + persistent_cache_filename):
> +		messages =3D messages + "Error, persistent cache file '%s' exists in o=
ld location '%s', please migrate it to new location '%s' and merge them tog=
ether if you have one for each MACHINE.\n" % (persistent_cache_filename, ca=
che, persistent_dir)
> +
> +	if messages !=3D "":
> +		raise_sanity_error(messages)
> +
>  python check_sanity_eventhandler() {
>      if isinstance(e, bb.event.BuildStarted):
>          check_sanity(e)
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 88ad2ba..0c11cdb 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -294,6 +294,8 @@ FILESDIR =3D "${@bb.which(d.getVar('FILESPATH', 1), '=
=2E')}"
> =20
>  TMPDIR =3D "${TOPDIR}/tmp"
>  CACHE =3D "${TMPDIR}/cache${@['', '/' + str(bb.data.getVar('MACHINE', d,=
 1))][bool(bb.data.getVar('MACHINE', d, 1))]}"
> +# The persistent cache should be shared by all builds
> +PERSISTENT_DIR =3D "${TOPDIR}/conf/persistent"
>  CO_DIR =3D "${DL_DIR}"
>  CVSDIR =3D "${CO_DIR}/cvs"
>  SVNDIR =3D "${CO_DIR}/svn"
> diff --git a/conf/sanity.conf b/conf/sanity.conf
> index e9902f6..c1ac332 100644
> --- a/conf/sanity.conf
> +++ b/conf/sanity.conf
> @@ -7,5 +7,6 @@ BB_MIN_VERSION =3D "1.10.2"
> =20
>  SANITY_ABIFILE =3D "${TMPDIR}/abi_version"
>  SANITY_PRFILE =3D "${TMPDIR}/distro_pr"
> +SANITY_PERSIST_DATA_FILE =3D "bb_persist_data.sqlite3"
> =20
>  INHERIT +=3D "sanity"
> --=20
> 1.7.4.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1vQvAACgkQN1Ujt2V2gBw+UgCcCMFXCk7BWMwTtI9+o6L52d85
1qgAoJRRYFYERFUpVRXGSXvUdnsP1eCx
=ZlF1
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
