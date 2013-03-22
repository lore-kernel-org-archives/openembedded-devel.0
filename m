Received: from mail-pd0-f181.google.com ([209.85.192.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UIyQH-0007fu-VB
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 10:38:36 +0100
Received: by mail-pd0-f181.google.com with SMTP id q10so1504688pdj.40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 02:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2NngwY0ujIkIZ2ktAf0TtuI8bPZz50BYDEI+03SQW3k=;
	b=PmR/O6MuXk5Wm9YOJqhpESBtjw2ao7MX5tiEUTydNlC/vUv9Fcf8QoRxmbFv15PVJv
	BzKY4AFhJ6IC0ZxtYdfIEk5OJSPc0fMfSwH9G4Q5lHyO/jnaldEeiOaLYXn8GxwuIRCh
	dhR/agkLfu/VSKZX7tRtNCi3wQShmnizUpfUcDK/YuUiRgTXZhap7USV6Z8udXIxJtwv
	xv/I/pNeiblYyfMy1zRfBJIQbySVO2vn89mvMeBJJm+5U/v+lD9NtTxMD1CzBBP9dtcK
	0g3sTrYd39oRsqCQkpJPlUkxPURzqfNkBLUhDqCrlKUnPzvPyybgChoiUgwltwMryy1r
	zZ4g==
X-Received: by 10.66.163.69 with SMTP id yg5mr2132021pab.109.1363944071676;
	Fri, 22 Mar 2013 02:21:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ij15sm2295138pac.4.2013.03.22.02.21.09
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 02:21:10 -0700 (PDT)
Date: Fri, 22 Mar 2013 10:21:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130322092109.GK3219@jama>
References: <1363873108-2848-1-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1363873108-2848-1-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] openldap: do not strip during install
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
X-List-Received-Date: Fri, 22 Mar 2013 09:38:39 -0000
X-Groupsio-MsgNum: 43652
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOhpupldhMlYbdva"
Content-Disposition: inline

--BOhpupldhMlYbdva
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2013 at 02:38:28PM +0100, Marcin Juszkiewicz wrote:
> Before:
> WARNING: File '/usr/lib/openldap/slapd' from openldap was already strippe=
d, this will prevent future debugging!
> WARNING: File '/usr/bin/ldapsearch' from openldap was already stripped, t=
his will prevent future debugging!
> WARNING: File '/usr/bin/ldapmodify' from openldap was already stripped, t=
his will prevent future debugging!
> WARNING: File '/usr/bin/ldapdelete' from openldap was already stripped, t=
his will prevent future debugging!
> WARNING: File '/usr/bin/ldapmodrdn' from openldap was already stripped, t=
his will prevent future debugging!
> WARNING: File '/usr/bin/ldappasswd' from openldap was already stripped, t=
his will prevent future debugging!
> WARNING: File '/usr/bin/ldapwhoami' from openldap was already stripped, t=
his will prevent future debugging!
> WARNING: File '/usr/bin/ldapcompare' from openldap was already stripped, =
this will prevent future debugging!
> WARNING: File '/usr/bin/ldapexop' from openldap was already stripped, thi=
s will prevent future debugging!
> WARNING: File '/usr/bin/ldapurl' from openldap was already stripped, this=
 will prevent future debugging!

Applied, thanks!

>=20
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta-oe/recipes-support/openldap/openldap-2.4.23/install-strip.patch | 2=
 +-
>  meta-oe/recipes-support/openldap/openldap_2.4.23.bb                  | 1=
 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.23/install-str=
ip.patch b/meta-oe/recipes-support/openldap/openldap-2.4.23/install-strip.p=
atch
> index 9d7640c..2992b70 100644
> --- a/meta-oe/recipes-support/openldap/openldap-2.4.23/install-strip.patch
> +++ b/meta-oe/recipes-support/openldap/openldap-2.4.23/install-strip.patch
> @@ -8,7 +8,7 @@
>   	$(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_MOD)
>  =20
>  -LTINSTALL =3D $(LIBTOOL) --mode=3Dinstall $(INSTALL)=20
> -+LTINSTALL =3D STRIPPROG=3D"@STRIP@" $(LIBTOOL) --mode=3Dinstall $(top_s=
rcdir)/contrib/ldapc++/install-sh -c
> ++LTINSTALL =3D STRIPPROG=3D"" $(LIBTOOL) --mode=3Dinstall $(top_srcdir)/=
contrib/ldapc++/install-sh -c
>   LTFINISH =3D $(LIBTOOL) --mode=3Dfinish
>  =20
>   # Misc UNIX commands used in build environment
> diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb b/meta-o=
e/recipes-support/openldap/openldap_2.4.23.bb
> index 319c50d..1c6c32f 100644
> --- a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
> +++ b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
> @@ -19,6 +19,7 @@ SRC_URI +=3D "file://initscript"
>  SRC_URI[md5sum] =3D "90150b8c0d0192e10b30157e68844ddf"
>  SRC_URI[sha256sum] =3D "5a5ede91d5e8ab3c7f637620aa29a3b96eb34318a8b26c8e=
ef2d2c789fc055e3"
> =20
> +PR =3D "r1"
>  # The original top.mk used INSTALL, not INSTALL_STRIP_PROGRAM when
>  # installing .so and executables, this fails in cross compilation
>  # environments
> --=20
> 1.8.1.2
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BOhpupldhMlYbdva
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFMIoUACgkQN1Ujt2V2gByp6wCeMYhSyqWR3ALpqncP9RLaNoNW
VXIAniMdq6y3EqwTsO8WG4lb+RWsFo9s
=k7fl
-----END PGP SIGNATURE-----

--BOhpupldhMlYbdva--
