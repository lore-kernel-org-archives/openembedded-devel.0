Return-Path: <joe@deserted.net>
X-Greylist: delayed 488 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 09 May 2014 14:28:54 UTC
Received: from mail-qa0-f47.google.com (unknown [209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8410A60167
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 May 2014 14:28:54 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id s7so4059364qap.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 May 2014 07:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=PmNOe3AUZDS3u8xQtnYN0g9meT0yiA9pIeuVoajxfG8=;
	b=d3hrygevQ9sftubEFrGVOOVMMJ33JlcMWJl0zbMO4XaP5T2+JrT8OlVY1NWVrRK834
	7CMATosZYL4Vx8wYTdvg6ljCFthQ7UsdVuD7nqMwcBa4fLLc29Lnj1XTfz5ofabJUtOg
	QeMrJiZfw29aGX87XwwSm3FyZY3KVWWdFmoZ01NUFJs2xh5W/LAtwefne5nYamanB09/
	Niqktc1C91Yc4uePBEZsuW//fOkqfC4rr0sQavziF/HbB09348Za2meG9YxLmZuBtOZL
	cv9WSSi3S60fRSrR4I4ziQQbmeGu5P2eZkvo6vJh+qzvD7ydbzbJSd5cbdeP1IOCuvRQ
	WS1g==
X-Gm-Message-State: ALoCoQkwRfAVX7njekyoBlB1+nTmGl2IRctsyBHB7mttLT/e8aRj2lWpe4Sy2EB18+AXcODRSreE
X-Received: by 10.140.27.45 with SMTP id 42mr3879160qgw.94.1399645247537;
	Fri, 09 May 2014 07:20:47 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id b5sm6827745qar.1.2014.05.09.07.20.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 09 May 2014 07:20:46 -0700 (PDT)
Date: Fri, 9 May 2014 10:20:44 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140509142042.GC3770@deserted.net>
References: <1399624837-21018-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1399624837-21018-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-networking][PATCH 1/3] net-snmp: Using the target perl
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
X-List-Received-Date: Fri, 09 May 2014 14:28:56 -0000
X-Groupsio-MsgNum: 49815
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8NvZYKFJsRX2Djef"
Content-Disposition: inline

--8NvZYKFJsRX2Djef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged the three of these.  Thanks.
-J.

[[oe] [meta-networking][PATCH 1/3] net-snmp: Using the target perl] On 14.0=
5.09 (Fri 16:40) rongqing.li@windriver.com wrote:

> From: Yue Tao <Yue.Tao@windriver.com>
>=20
> Set the PERLPROG to target perl to avoid host contamination.
>=20
> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb |    4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb=
 b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
> index d21995a..f6656ad 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
> @@ -37,6 +37,10 @@ EXTRA_OECONF =3D "--disable-embedded-perl \
>                  --with-defaults \
>                  ${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--with=
-endianness=3Dlittle', '--with-endianness=3Dbig', d)}"
> =20
> +do_configure_prepend() {
> +    export PERLPROG=3D"${bindir}/env perl"
> +}
> +
>  do_install_append() {
>      install -d ${D}${sysconfdir}/snmp
>      install -d ${D}${sysconfdir}/init.d
> --=20
> 1.7.10.4
>=20
--=20
-Joe MacDonald.
:wq

--8NvZYKFJsRX2Djef
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlNs5DoACgkQwFvcllog0XzG/QCdF6QgAfBm/enQ2xxhilB2MUVQ
mx4An3jU6clPOAE/er2Iv+SBPr4Zd41Y
=Oc9+
-----END PGP SIGNATURE-----

--8NvZYKFJsRX2Djef--
