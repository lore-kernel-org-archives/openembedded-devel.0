Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TzmNH-0002xI-FQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2013 11:56:18 +0100
Received: by mail-wi0-f173.google.com with SMTP id hn17so1266359wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2013 02:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Y7XDnVZmbzpjk/Qq5wdEyB0ny6gzQbmRm9BoU9xntBQ=;
	b=Tb/TknDuZuCNX3HGbDJZ3mNUPGQuEdOCeDO6KRab8Db/29XFSl8mNP4PCsiNfqjlMJ
	5Dvrr33u1PI5g+KZGnD2Ebvgg+WCJ1srhoZNfomxTnf2EtKSh0CpF8Ms3CXtuDsNg1BZ
	gbPe9Eyt54VbHiYCl1OFGM4gV8u+vikABZMYYaWBzdchaZUp9+pWmV1gvptvQaJd0uM1
	QAfjDsZ+2SgZWw1Lc9cbLxkTxT39RedGJRoQPR7imLRz3nbPblRvU4fQoV9S6eNQcmlv
	V3z9uJhCh86siE/5eHY2bw5Ux824kmuV8sqr8tns5H2+21C/i4nwDPzcTrN0GVK9rr0r
	jtGA==
X-Received: by 10.180.88.138 with SMTP id bg10mr8726178wib.13.1359369601366;
	Mon, 28 Jan 2013 02:40:01 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id fx5sm2618844wib.11.2013.01.28.02.40.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 02:40:00 -0800 (PST)
Date: Mon, 28 Jan 2013 11:40:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130128104004.GT16904@jama.palm1.palmone.com>
References: <1359152782-23743-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1359152782-23743-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe/meta-systemd/V2 0/5] various patches
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
X-List-Received-Date: Mon, 28 Jan 2013 10:56:22 -0000
X-Groupsio-MsgNum: 42877
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aEcIyhw0mmnxygNd"
Content-Disposition: inline

--aEcIyhw0mmnxygNd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2013 at 11:26:17PM +0100, Andreas M=FCller wrote:
> V1->V2: thunar remove RDEPENDS_${PN} =3D "eglibc-charmaps"
>=20
> The following changes since commit b7ff6ac09affebe72b7587d7e345adaae427ef=
3d:
>=20
>   autofs: fails to compile with openldap disabled (2013-01-24 10:35:49 -0=
500)
>=20
> are available in the git repository at:
>   git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches

Applied, except geany, thanks

>=20
> Andreas M=FCller (5):
>       thunar: add RRECOMMENDS and RDEPENDS to ensure full functionality
>       tumbler: update to 0.1.27
>       daemonize: initial add 1.73+
>       geany: initial add 1.22
>       lxdm: disable screensaver by default when starting X
>=20
>  meta-oe/recipes-devtools/geany/geany_1.22.bb       |   13 +++++++++++++
>  meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |    5 +++--
>  meta-oe/recipes-support/daemonize/daemonize_git.bb |   12 ++++++++++++
>  meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb      |    3 +++
>  .../{tumbler_0.1.26.bb =3D> tumbler_0.1.27.bb}       |    4 ++--
>  5 files changed, 33 insertions(+), 4 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/geany/geany_1.22.bb
>  create mode 100644 meta-oe/recipes-support/daemonize/daemonize_git.bb
>  rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.26.bb =3D> tumbler_0.=
1.27.bb} (89%)
>=20
> --=20
> 1.7.4.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aEcIyhw0mmnxygNd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEGVYQACgkQN1Ujt2V2gByJogCfdV+JkYWPa+mjz3w0T5Ani4jl
8iUAni+DH4LotkbFUnv5NSuBXfWSEn/a
=7wVM
-----END PGP SIGNATURE-----

--aEcIyhw0mmnxygNd--
