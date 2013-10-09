Return-Path: <joe@deserted.net>
Received: from mail-qe0-f49.google.com (mail-qe0-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 89E1A6CE6D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2013 12:21:59 +0000 (UTC)
Received: by mail-qe0-f49.google.com with SMTP id ff1so284416qeb.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Oct 2013 05:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=v2c+npg8U1QW6xPUiRJXhwPvww7jj6SkhXQ0UvB01f4=;
	b=k8rnSuryuKSu/DjngxBAs5tHshqPxK58OO4Co9RwthuOCL/c/vy0qbHdeZzcwSEXht
	tsubuGbp4xlpgyAnRvqx8JfIwnphZ7fXlWc11pLqCklcpUk4aN8NR4tSVedT1JdHsyF9
	+J2gl2swOZZDUBCxe3avsQrFBhnoUYfZCKwAkm3i6QuQNunehPLagITGlQHdGSFf73XA
	3sGEZQD6QLWR60VbjyYut0lEei1KzbxZ0wbe9k6MTr1BkXMurDqMnCdS3ObYretW9QEJ
	Bs/ipWFREXmSVulg/XI+Tf27mp53zqZIljeZJTx8ienMw0YxnZl1R68aJ6xMThJchrJe
	JslQ==
X-Gm-Message-State: ALoCoQk8cScmst4GWiFeDqxUtVNJ8FIafJhJePAtQA65AgTOQMT3g+EyGjB+bMbB8i2Zziq4SiBJ
X-Received: by 10.224.2.68 with SMTP id 4mr10752724qai.25.1381321321002;
	Wed, 09 Oct 2013 05:22:01 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id g2sm85610509qaf.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 09 Oct 2013 05:21:59 -0700 (PDT)
Date: Wed, 9 Oct 2013 08:21:57 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131009122156.GA5541@deserted.net>
References: <1381310457-4961-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1381310457-4961-1-git-send-email-Qi.Chen@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-selinux][PATCH] README: update the Dependencies area
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Oct 2013 12:22:00 -0000
X-Groupsio-MsgNum: 46583
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline

--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-selinux][PATCH] README: update the Dependencies area] On 13.10.=
09 (Wed 17:20) Qi.Chen@windriver.com wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> Add meta-oe to the dependencies as some recipes in meta-selinux may
> require it. Here's a dependency chain:
>=20
> ['policycoreutils', 'libselinux', 'swig-native']
>=20
> And swig is from meta-oe layer.

I'll take a look at this.  It shouldn't be necessary, meta-selinux
provides its own swig.

meta-selinux/recipes-devtools/swig
=E2=94=9C=E2=94=80=E2=94=80 swig
=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 0001-Use-proc-self-exe-fo=
r-swig-swiglib-on-non-Win32-plat.patch
=E2=94=9C=E2=94=80=E2=94=80 swig_2.0.10.bb
=E2=94=94=E2=94=80=E2=94=80 swig.inc

Might've crept in during the update last week.

-J.

>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  README |    7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/README b/README
> index 926d880..987f7ac 100644
> --- a/README
> +++ b/README
> @@ -34,6 +34,13 @@ the Yocto Project website:
> =20
>  http://www.yoctoproject.org
> =20
> +For some recipes, the meta-oe layer is required:
> +
> +URI: git://github.com/openembedded/meta-oe.git
> +subdirectory: meta-oe
> +branch: master
> +revision: HEAD
> +
> =20
>  Maintenance
>  -----------
--=20
-Joe MacDonald.
:wq

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJVSloACgkQwFvcllog0XykXQCgpCTMDX/dzZlNq4r3V0Td9DJw
w4sAnidvEOX6sawaBRDmNQNlQjc7dVmc
=lMRW
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
