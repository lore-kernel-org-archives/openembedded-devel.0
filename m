Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PfSgN-0003KM-4c
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 08:42:19 +0100
Received: by bwz10 with SMTP id 10so515515bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jan 2011 23:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=oQP05ahEvhE8h6N/abLql9FhclC4hCtUe4DzV+Uxqbc=;
	b=oml1Jga5XlWMVaN6DDAGP90Hqksozs3Y9JGidspTZH5/Ln0JAU/m+q+jlxodHnGOSH
	b9EA/dC9qz3o0Wz82OPD4xQtJ7YA0zoIwDWOWGV23KPpo0+QOoMFmWmso1s/+ZsIB7xX
	mwNbb6sfTcpDxIKKsqfeR3EV9oqiQ9TlW8qEA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=mJwNhySKIKcO7ybBuyWXfzwqoY2MtvnNFbtS5Mc8KRNuFegwe067jdp4S2+MBxxeVf
	qUfFr1eNnd2M9ulpNMC9HergCxkEVOW17fiSYwRPlzGYebqwxtyAKt6chOQr7oExL/G5
	TNYjrAp2NyChFUn/2XHN5a/6OHS2EyXsy0Aic=
Received: by 10.204.65.135 with SMTP id j7mr285641bki.85.1295422901134;
	Tue, 18 Jan 2011 23:41:41 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id v1sm3107695bkt.17.2011.01.18.23.41.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 18 Jan 2011 23:41:39 -0800 (PST)
Date: Wed, 19 Jan 2011 08:42:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Michael Smith <msmith@cbnco.com>
Message-ID: <20110119074225.GU21179@jama>
References: <1295388343-2058-1-git-send-email-msmith@cbnco.com>
MIME-Version: 1.0
In-Reply-To: <1295388343-2058-1-git-send-email-msmith@cbnco.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] gnutls: move to latest stable branch 2.10.2 -> 2.10.4
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
X-List-Received-Date: Wed, 19 Jan 2011 07:42:19 -0000
X-Groupsio-MsgNum: 28168
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m1rwLFmcefDs/2Y3"
Content-Disposition: inline

--m1rwLFmcefDs/2Y3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2011 at 05:05:42PM -0500, Michael Smith wrote:
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> Cc: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../gettextize-with-gettext-0.18.patch             |    0
>  .../gnutls-openssl.patch                           |    0
>  .../gnutls-replace-siginterrupt.patch              |    0
>  .../gnutls/{gnutls_2.10.2.bb =3D> gnutls_2.10.4.bb}  |    4 ++--
>  4 files changed, 2 insertions(+), 2 deletions(-)
>  rename recipes/gnutls/{gnutls-2.10.2 =3D> gnutls-2.10.4}/gettextize-with=
-gettext-0.18.patch (100%)
>  rename recipes/gnutls/{gnutls-2.10.2 =3D> gnutls-2.10.4}/gnutls-openssl.=
patch (100%)
>  rename recipes/gnutls/{gnutls-2.10.2 =3D> gnutls-2.10.4}/gnutls-replace-=
siginterrupt.patch (100%)
>  rename recipes/gnutls/{gnutls_2.10.2.bb =3D> gnutls_2.10.4.bb} (77%)
>=20
> diff --git a/recipes/gnutls/gnutls-2.10.2/gettextize-with-gettext-0.18.pa=
tch b/recipes/gnutls/gnutls-2.10.4/gettextize-with-gettext-0.18.patch
> similarity index 100%
> rename from recipes/gnutls/gnutls-2.10.2/gettextize-with-gettext-0.18.pat=
ch
> rename to recipes/gnutls/gnutls-2.10.4/gettextize-with-gettext-0.18.patch
> diff --git a/recipes/gnutls/gnutls-2.10.2/gnutls-openssl.patch b/recipes/=
gnutls/gnutls-2.10.4/gnutls-openssl.patch
> similarity index 100%
> rename from recipes/gnutls/gnutls-2.10.2/gnutls-openssl.patch
> rename to recipes/gnutls/gnutls-2.10.4/gnutls-openssl.patch
> diff --git a/recipes/gnutls/gnutls-2.10.2/gnutls-replace-siginterrupt.pat=
ch b/recipes/gnutls/gnutls-2.10.4/gnutls-replace-siginterrupt.patch
> similarity index 100%
> rename from recipes/gnutls/gnutls-2.10.2/gnutls-replace-siginterrupt.patch
> rename to recipes/gnutls/gnutls-2.10.4/gnutls-replace-siginterrupt.patch
> diff --git a/recipes/gnutls/gnutls_2.10.2.bb b/recipes/gnutls/gnutls_2.10=
=2E4.bb
> similarity index 77%
> rename from recipes/gnutls/gnutls_2.10.2.bb
> rename to recipes/gnutls/gnutls_2.10.4.bb
> index 8af70ec..3e582b0 100644
> --- a/recipes/gnutls/gnutls_2.10.2.bb
> +++ b/recipes/gnutls/gnutls_2.10.4.bb
> @@ -24,5 +24,5 @@ do_configure_prepend() {
> =20
>  }
> =20
> -SRC_URI[gnutls.md5sum] =3D "777823f5746ab80cd6f7f7b5fcb2f91b"
> -SRC_URI[gnutls.sha256sum] =3D "e82e7a3fc69b02cc06c291a1652789d73e45bc073=
2e139817838248f814f8724"
> +SRC_URI[gnutls.md5sum] =3D "4e1517084018a8b1fdc96daabea40528"
> +SRC_URI[gnutls.sha256sum] =3D "b8bfe36450fe671e99db5ff1e44e6b65fda8a79ca=
cd9e77d550eff7da3745fc8"
> --=20
> 1.6.3.2
>=20

I guess gnutls-2.10.2/parallel-build.patch needs to be moved to..

PR =3D "${INC_PR}.1"

should be "${INC_PR}.0"

but if all patches still apply then otherwise looks ok..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--m1rwLFmcefDs/2Y3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk02ld8ACgkQN1Ujt2V2gByVQACeKhXX6KUF3c89yh5Fpp0ckRgv
n1EAn3xtzK0c4ndk7mOoOG8gnDB8UA0i
=08Fu
-----END PGP SIGNATURE-----

--m1rwLFmcefDs/2Y3--
