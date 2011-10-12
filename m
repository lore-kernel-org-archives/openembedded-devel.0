Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RDsC4-0001EW-0f
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 08:21:32 +0200
Received: by eyd9 with SMTP id 9so380823eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2011 23:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oGYDiQq6Q4g/mAORNr37DrB0KboMeebyYySmePGAQHI=;
	b=j3HugIAHJhEfzu9pYpCiBaqpq5uRrBHNf0S9AKwwKbEPUgojRs+6p0TE6AmwY6Zbos
	VdLABI3C2+CR+e/6EL0+fdai41zs8u+HOK2iuLLxoLx1+ouEVyVg4hSW6OqzrRuQC7Q6
	Ywd1nO80WW4JnWycl5AkPTARFHO6Ti8ZmYS9E=
Received: by 10.223.92.144 with SMTP id r16mr44704677fam.23.1318400148907;
	Tue, 11 Oct 2011 23:15:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h16sm1982313fab.19.2011.10.11.23.15.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Oct 2011 23:15:47 -0700 (PDT)
Date: Wed, 12 Oct 2011 08:15:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111012061540.GG27073@jama.jama.net>
References: <1318384647-17338-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1318384647-17338-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/2] classes/glx-use-tls.bbclass: Delete
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
X-List-Received-Date: Wed, 12 Oct 2011 06:21:32 -0000
X-Groupsio-MsgNum: 34657
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eVzOFob/8UvintSX"
Content-Disposition: inline

--eVzOFob/8UvintSX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2011 at 06:57:26PM -0700, Khem Raj wrote:
> This functionality is now available in oe-core

There was
http://patches.openembedded.org/patch/12643/
in my last pull request..

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/classes/glx-use-tls.bbclass |    7 -------
>  1 files changed, 0 insertions(+), 7 deletions(-)
>  delete mode 100644 meta-oe/classes/glx-use-tls.bbclass
>=20
> diff --git a/meta-oe/classes/glx-use-tls.bbclass b/meta-oe/classes/glx-us=
e-tls.bbclass
> deleted file mode 100644
> index 7530872..0000000
> --- a/meta-oe/classes/glx-use-tls.bbclass
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -def get_tls_setting(bb, d):
> -    # until we have no prober TLS support in uclibc disable it
> -    if bb.data.getVar('TARGET_OS', d, 1).find('uclibc') >=3D 0 :
> -        return ""
> -    return "--enable-glx-tls"
> -
> -EXTRA_OECONF +=3D "${@get_tls_setting(bb, d)}"
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eVzOFob/8UvintSX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6VMIwACgkQN1Ujt2V2gBx/RACgmYsGkMbobG7HzD4/RlQmRbwD
ggkAoIdX/LHsL43Ob4A/qrDCQ1YcI6Ie
=cxTO
-----END PGP SIGNATURE-----

--eVzOFob/8UvintSX--
