Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PseLw-0003c1-TW
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 17:47:44 +0100
Received: by fxm8 with SMTP id 8so683686fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Feb 2011 08:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=8ZOcgQBLlMcmnxgd2vo70Vfg+LdtPltoQV2yDgyVZ9w=;
	b=DKgZunPfUOuEcFolrFevWFdurQ+GqVQ+2oa2TdRm+kB6fJGsdZhIGAbZxcgoQLO1xJ
	v2P4IOo7oq42DWBzaK5cahLKgZMlQGSzn1MIgnHm9MM27zn5y2RjLLbYm/G6LpLOrBRW
	v5zEne378vQ+3qgNQjCdqeyyPQr+EcLrE3Lb0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=hzZTz+fyi/Q0fPSviJJIn83K3S64OZHVjqUYjuePL+96XFBzHLVDTxii9pRskTSgM/
	M/mZ+Neky746meqNHY7ihS8oapDhTiaG8nS7LWzUhs4JofxLL3L4D4cv6ukwvDJDc8AO
	NHdLXazmB3+uyVR5tTV4gVrZTLQkFaIVCozZo=
Received: by 10.223.114.203 with SMTP id f11mr1330690faq.20.1298565930053;
	Thu, 24 Feb 2011 08:45:30 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n15sm46957fam.12.2011.02.24.08.45.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Feb 2011 08:45:27 -0800 (PST)
Date: Thu, 24 Feb 2011 17:45:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110224164519.GA12581@jama.jama.net>
References: <1298561156-21514-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1298561156-21514-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] bitbake.conf: define shared PERSISTENT_DIR
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
X-List-Received-Date: Thu, 24 Feb 2011 16:47:45 -0000
X-Groupsio-MsgNum: 29660
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline

--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 24, 2011 at 04:25:56PM +0100, Martin Jansa wrote:
> * import from poky
>   commit 6a11cf7dfe930461a6660e3b783b546fa2634900
>   Author: Richard Purdie <rpurdie@linux.intel.com>
>   Date:   Sun May 31 22:23:30 2009 +0100
> * we had CACHE var pointing to machine specific dir since
>   commit caf077679022f37ce55d758101f130e4e93bd7b5
>   Author: Richard Purdie <rpurdie@rpsys.net>
>   Date:   Mon Nov 20 17:40:20 2006 +0000
>=20
> * current bitbake is looking for cache dir like this:
>   cachedir =3D (bb.data.getVar("PERSISTENT_DIR", d, True) or
>               bb.data.getVar("CACHE", d, True))
>   which without PERSISTENT_DIR defined picks machine-specific CACHE dir
>   so LOCALCOUNT numbers in SRCPV keeps rolling with every MACHINE switch
>   in same builddir :/
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  conf/bitbake.conf |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index dcc5c70..53bb7b7 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -294,6 +294,8 @@ FILESDIR =3D "${@bb.which(d.getVar('FILESPATH', 1), '=
=2E')}"
> =20
>  TMPDIR =3D "${TOPDIR}/tmp"
>  CACHE =3D "${TMPDIR}/cache${@['', '/' + str(bb.data.getVar('MACHINE', d,=
 1))][bool(bb.data.getVar('MACHINE', d, 1))]}"
> +# The persistent cache should be shared by all builds
> +PERSISTENT_DIR =3D "${TMPDIR}/cache"

Or even better we can move it outside ${TMPDIR} and add sanity check to
warn user that he still has ${CACHE}/bb_persist_data.sqlite3 and should
move it to ${PERSISTENT_DIR}/bb_persist_data.sqlite3. (I'll send such
patch if requested).

But while thinking about it I found that there are probably other issues
with that too.

Machine-specific persistent cache was rebuilding packages with
FEED_ARCH, which works ok only as long as all machines started with same
cache and all machines are always built (so _count are incremented
consistently in all caches).

Shared persistent cache is much better, but still fails if some machine
is overriding SRCREV_machine ie in u-boot_git it's quite common with
same git SRC_URI and same branch (so key in persistent cache is the
same, but _rev is different so _count is incremented twice every time
this _machine is built. But overriding SRCREV is less common than
multiple machines building _same_ package with FEED_ARCH or even "all".

It could be maybe improved if we add actual PACKAGE_ARCH to key, but I
think that's not available while bitbake is parsing recipe (ie before
calling utils.is_machine_specific and changing PACKAGE_ARCH to
MACHINE_ARCH.

This improved cache would provide consistent _count, but will still fail
on target. ie when SRCREV for FEED_ARCH was changed twice and for
om-gta02 just once:

Package: frameworkd-config
Version: 1:0.9.5.9+gitr2+e31fa77906981a56be2271246693fd929c973abf-r12.6
Architecture: armv4t

will be preferred instead of

Package: frameworkd-config
Version: 1:0.9.5.9+gitr1+aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa-r12.6
Architecture: om-gta02

even with:
SHR root@gjama / $ cat /etc/opkg/arch.conf=20
=2E.
arch armv4t 26
arch om-gta02 31

because afaik opkg prefers newer version before higher arch priority.

I don't see how to fix this in all corner cases :/.
But shared PERSISTENT_DIR outside TMPDIR seems much better than machine
specific in CACHE.

BTW: I'm quite frustrated lately to see that OE is great only for 99%,
but last 1% of corner cases like this and ie substrings in packages with
debian.bbclass are quite hard to find/debug/explain/fix :(.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1mix8ACgkQN1Ujt2V2gBySjwCfZmJdTY4wattr44vmqZhvQGAf
DCIAniYzM9AOGKhFQ8XVzSSrM7Kr+1EC
=Lzuv
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
