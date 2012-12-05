Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TgKeN-00070M-CR
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 20:29:12 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB5JERxZ002887
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Dec 2012 11:14:29 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 5 Dec 2012 11:14:27 -0800
Received: from yow-jmacdona-d2.windriver.com (yow-jmacdona-d2.wrs.com
	[128.224.146.166])	by yow-jmacdona-d1.ottawa.wrs.com (Postfix) with
	ESMTP id 35C2A7FE2	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2012 14:13:31 -0500 (EST)
Received: by yow-jmacdona-d2.windriver.com (Postfix, from userid 1000)	id
	E606D6A8119; Wed,  5 Dec 2012 14:14:26 -0500 (EST)
Date: Wed, 5 Dec 2012 14:14:26 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20121205191426.GL5359@windriver.com>
References: <1354727024-12231-1-git-send-email-paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1354727024-12231-1-git-send-email-paul.eggleton@linux.intel.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH v2] proftpd: fix do_install failure after libexecdir change
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
X-List-Received-Date: Wed, 05 Dec 2012 19:29:20 -0000
X-Groupsio-MsgNum: 42018
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hdW7zL/qDS6RXdAL"
Content-Disposition: inline

--hdW7zL/qDS6RXdAL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH v2] proftpd: fix do_install failure after lib=
execdir change] On 12.12.05 (Wed 17:03) Paul Eggleton wrote:

> As of OE-Core commit id 406bd38b4232f9f399ef5ffe0b4fac72ed605a23
> libexecdir has been changed to ${libdir}/${BPN}. As we are already
> deleting ${libdir}/proftpd which is the same as ${libdir}/${BPN} in this
> case, introduce a check to see if ${libexecdir} still exists before
> attempting to remove it possibly a second time. This will handle if
> libexecdir is set to its original value or a custom value in the distro
> config.
>=20
> Based on a patch by Kevin Strasser <kevin.strasser@linux.intel.com>
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b/=
meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> index 8624c16..7279cfb 100644
> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> @@ -34,7 +34,8 @@ FTPGROUP =3D "ftp"
> =20
>  do_install () {
>  	oe_runmake DESTDIR=3D${D} install
> -	rmdir ${D}${libexecdir} ${D}${libdir}/proftpd ${D}${datadir}/locale
> +	rmdir ${D}${libdir}/proftpd ${D}${datadir}/locale
> +	[ -d ${D}${libexecdir} ] && rmdir ${D}${libexecdir}
>  	sed -i '/ *User[ \t]*/s/ftp/${FTPUSER}/' ${D}${sysconfdir}/proftpd.conf
>  	sed -i '/ *Group[ \t]*/s/ftp/${FTPGROUP}/' ${D}${sysconfdir}/proftpd.co=
nf
>  	install -d ${D}${sysconfdir}/init.d

Seems sensible.  Merged.  Thanks.

--=20
-Joe MacDonald.
:wq

--hdW7zL/qDS6RXdAL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlC/nRIACgkQPN8S4W6ZZnfyXACfQBEktsFUrUoH/Wu+w0NGkJOC
I2oAnjRGXfcUYATOonWvH/T5FaBXk2px
=0lMR
-----END PGP SIGNATURE-----

--hdW7zL/qDS6RXdAL--
