Received: from mail-pa0-f44.google.com ([209.85.220.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USBKt-0002tE-H6
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 21:14:52 +0200
Received: by mail-pa0-f44.google.com with SMTP id bi5so501160pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 11:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FJrsTMcnMIPHBcvgAedGfVYK52nAU2zmd4nGLoJN3jI=;
	b=dm7wdyMeAXLgjGijdkVmKv5BsaOF9lFF4tLUXMP2QWuqQNmqmQOTGo/hr3Lff0DQxh
	lbBuaPhHw/1utcFGE8HAXbQGH9oQWSaPuCC9TflSU+ixDwdIQ7LL/QwoaGmfgshZWLr4
	xHAS4uk1Vpwant1Mw11dIV4z1Ojy4KJXnPchONFyeD5OtuCfF0K6JQSpVQFzjfBEYL6v
	giG7/rZXWVy73HZfZ+eQqqVVFBaVVsgFwJe8TU952x59dGRH9TUCQxSTvCDSQm2aszgx
	pOwqtXBZb/xRaiUAEFf3pStYUzHLPhEIJW7oUfaakzNXpGRox2Np9hDMhYUO2hkPXIRI
	xfSA==
X-Received: by 10.66.248.227 with SMTP id yp3mr4720188pac.158.1366138623976;
	Tue, 16 Apr 2013 11:57:03 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id rt13sm3700574pac.14.2013.04.16.11.57.01
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 11:57:02 -0700 (PDT)
Date: Tue, 16 Apr 2013 20:57:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130416185701.GS10628@jama.dyndns-home.com>
References: <1366128149-52411-1-git-send-email-paul@paulbarker.me.uk>
MIME-Version: 1.0
In-Reply-To: <1366128149-52411-1-git-send-email-paul@paulbarker.me.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/2] vim: recommend that runtime data is installed along with binaries
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
X-List-Received-Date: Tue, 16 Apr 2013 19:14:55 -0000
X-Groupsio-MsgNum: 44255
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1IOPqZ3f1xe/JZlz"
Content-Disposition: inline

--1IOPqZ3f1xe/JZlz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2013 at 05:02:27PM +0100, Paul Barker wrote:
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>

Both vim patches in queue for testing, but please update your checkout.
For following patches (vim strip was using old indentation).

> ---
>  meta-oe/recipes-support/vim/vim.inc |    3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-oe/recipes-support/vim/vim.inc b/meta-oe/recipes-suppor=
t/vim/vim.inc
> index 4fa8f7c..1ae5e5c 100644
> --- a/meta-oe/recipes-support/vim/vim.inc
> +++ b/meta-oe/recipes-support/vim/vim.inc
> @@ -69,6 +69,9 @@ FILES_${PN}-tutor =3D "${datadir}/${PN}/${VIMDIR}/tutor=
 ${bindir}/${PN}tutor"
>  FILES_${PN}-vimrc =3D "${datadir}/${PN}/vimrc"
>  FILES_${PN}-data =3D "${datadir}/${PN}"
> =20
> +# Recommend that runtime data is installed along with vim
> +RRECOMMENDS_${PN} =3D "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc $=
{PN}-data"
> +
>  ALTERNATIVE_${PN} =3D "vi"
>  ALTERNATIVE_TARGET[vi] =3D "${bindir}/${PN}"
>  ALTERNATIVE_LINK_NAME[vi] =3D "${base_bindir}/vi"
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1IOPqZ3f1xe/JZlz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFtnv0ACgkQN1Ujt2V2gByikQCgsPvpsgsmCZTl3HdZx2o8f0Gh
Uc8AoKu4fnZmW+iZrFumZEYJBJFUZDje
=ranf
-----END PGP SIGNATURE-----

--1IOPqZ3f1xe/JZlz--
