Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id E1521605B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 16:16:51 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so147060659wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 09:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KkXdouPMmwW4Y++o9j5fsh8sajYtJtCXJyW9AAd73t8=;
	b=CLwfbrDQIjxwdZlBcPak0zmnzRKEmqUU9S/o0OvlGRE5ZOsI/UbzNbuBcGwzy3unE3
	HU6aKIT8TjJYlBm9CQ920x4gAtViNEivKhuNY67p/I4XkwthLo46XM2fJVcGf2V2sOSC
	vqub1WEuv3CgG6H/iieTTGb+BZxizLkmngzfPMvVMwzEcCcGjuGe6N2L4ztiE7T9lIrV
	u+KBxzcDYR8nEmqMV6tNuIzKAxbyulmJ63aim3qjWTr28VJqbVhzQ8PbM0aEKylgJcPL
	2zcG8+/Op3XIl/G/ybaE4HLVm9B1fE8aA7R2f6sHbjF1XO930+ntoqqew9rFt1qXoti8
	OiSg==
X-Received: by 10.194.133.73 with SMTP id pa9mr55847516wjb.148.1438013811361; 
	Mon, 27 Jul 2015 09:16:51 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lz10sm28608900wjb.48.2015.07.27.09.16.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 09:16:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 27 Jul 2015 18:16:55 +0200
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20150727161655.GC307@jama>
References: <cover.1437454485.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1437454485.git.akuster808@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: otavio@ossystems.com.br, openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 0/5] meta-oe Dizzy-next
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
X-List-Received-Date: Mon, 27 Jul 2015 16:16:52 -0000
X-Groupsio-MsgNum: 56392
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Content-Disposition: inline

--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2015 at 09:56:35PM -0700, Armin Kuster wrote:
> please consider these patches for meta-openembedded dizzy-next
>=20
> The following changes since commit 5b6f39ce325d490fc382d5d59c5b8b9d5fa38b=
38:
>=20
>   gsoap: fold .inc and -native into one recipe (2015-04-29 19:24:09 +0200)
>=20
> are available in the git repository at:
>=20
>   git://github.com/akuster/meta-openembedded akuster/dizzy-next
>   https://github.com/akuster/meta-openembedded/tree/akuster/dizz-next

Merged to dizzy-next.

For some reason "y" is missing in your https github link, are you
generating the cover manually?

> Hugo Vasconcelos Saldanha (1):
>   libssh2: fix CVE-2015-1782
>=20
> Roy Li (2):
>   mariadb: Security Advisory -CVE-2015-2305
>   ipsec-tools: Security Advisory - CVE-2015-4047
>=20
> Stefan Agner (1):
>   ptpd: disable libpcap detection via pcap-config
>=20
> Tudor Florea (1):
>   fuse: fix for CVE-2015-3202 Privilege Escalation
>=20
>  ...fix_exec_environment_for_mount_and_umount.patch |  63 +++++++++++
>  .../recipes-support/fuse/fuse_2.9.3.bb             |   1 +
>  .../recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb         |   4 +-
>  .../ipsec-tools/fix-CVE-2015-4047.patch            |  36 +++++++
>  .../ipsec-tools/ipsec-tools_0.8.2.bb               |   1 +
>  .../libssh2/libssh2-1.4.3/CVE-2015-1782.patch      | 115 +++++++++++++++=
++++++
>  meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb   |   4 +-
>  .../mysql/mariadb/fix-CVE-2015-2305.patch          |  43 ++++++++
>  meta-oe/recipes-support/mysql/mariadb_5.5.39.inc   |   1 +
>  9 files changed, 265 insertions(+), 3 deletions(-)
>  create mode 100644 meta-filesystems/recipes-support/fuse/files/001-fix_e=
xec_environment_for_mount_and_umount.patch
>  create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-too=
ls/fix-CVE-2015-4047.patch
>  create mode 100644 meta-oe/recipes-support/libssh2/libssh2-1.4.3/CVE-201=
5-1782.patch
>  create mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-CVE-2015-23=
05.patch
>=20
> --=20
> 1.9.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW2WXYACgkQN1Ujt2V2gBxk2QCeNfsg4qr7x+NeMTphE/LmNszR
X0YAn2Z41N8CJFvo8KwPSTuqVldQYFqV
=kTFV
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--
