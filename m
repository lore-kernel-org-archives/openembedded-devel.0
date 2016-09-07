Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4134573191
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Sep 2016 10:33:00 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a6so2260860wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2016 03:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=aJpE5FaNUP7138xyoVlVd4api7aEkq1adOjM5Zs+ATQ=;
	b=jMd/RDV/VYj4Hn8u+IYMKMhYJlp5gjFRpbEgPoxGXfv/2ITFdUuUYWlQLmSK2Yy/Mf
	ZpdGDspeCAmX4WFmw0EQyJSLAJumCTE7LaSo1yFzznDS32h/6cM+JRTqOfmLJFnG8zta
	PpeXrGClTMf7MWrocsYmYiOOITx/6dfyfoPAzTgNfE7gF1eMgYmUPeGyjSqNembQjO8s
	Ksz+JKVM4ThKUTBjXjp3iLO3iA4OPVdyUw1bt3RSGP7zBjNqaogW94eewgtRDZSTwqGI
	UlMVuyqXm4c6SwByq3aOVo0zmKgINYCeeUCAmvf0a/XfJzNPeHad6NfzpX1K/H1+nSKl
	o+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=aJpE5FaNUP7138xyoVlVd4api7aEkq1adOjM5Zs+ATQ=;
	b=OcuW8ekw5Tar7r39MRWtfcoQsJKQkiJlU3GctpwSEyDhDw3sxE3i4cvzQC6z7iNDVl
	X47xc3F2lEBBnWJYTdhLsaWNje933y3NKrlC8pmuO6+SfOTbfUoTB9bYBWNH/c1+Lg7q
	xynSC1hEuMbkfafcydCAkhXa3aRAmbrLUpJilcbwi2WDoQn+zxCn0eQe4y6w3BZZb6Bk
	kD31KJR5xKgyPYRFm6AhaJG+8RffYpnNhzUDrXOL4HQm6OynZZ7crBoQOVqXUz8l7Yrg
	VXjEBi64s90heEGhOXiSTn/qMN9++3wzmRRDlOGr1g61mygLAKz8WFBnAOtZGvbyJX6J
	NAYQ==
X-Gm-Message-State: AE9vXwNmbKk/e0EnCp4bDvDfUbCfK8TBMgtXFGZaCkyGo9GYbT/e1+V02rUe24ixa7uQag==
X-Received: by 10.28.143.209 with SMTP id r200mr2633301wmd.5.1473244380861;
	Wed, 07 Sep 2016 03:33:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	bc5sm31478630wjb.37.2016.09.07.03.32.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 07 Sep 2016 03:32:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 7 Sep 2016 12:32:56 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160907103256.GF2645@jama>
References: <1473240851-11368-1-git-send-email-alexandru.moise@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1473240851-11368-1-git-send-email-alexandru.moise@windriver.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: Re: [PATCH] Security Advisory - collectd - CVE-2016-6254
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Sep 2016 10:33:02 -0000
X-Groupsio-MsgNum: 62998
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="udcq9yAoWb9A4FsZ"
Content-Disposition: inline

--udcq9yAoWb9A4FsZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2016 at 12:34:11PM +0300, Alexandru Moise wrote:
> Heap-based buffer overflow in the parse_packet function in network.c in
> collectd before 5.4.3 and 5.x before 5.5.2 allows remote attackers to
> cause a denial of service (daemon crash) or possibly execute arbitrary
> code via a crafted network packet.

The summary should start with component name:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

>=20
> Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
> ---
>  .../collectd/collectd/CVE-2016-6254.patch          | 55 ++++++++++++++++=
++++++
>  .../recipes-extended/collectd/collectd_5.5.0.bb    |  1 +
>  2 files changed, 56 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/collectd/collectd/CVE-2016-6=
254.patch
>=20
> diff --git a/meta-oe/recipes-extended/collectd/collectd/CVE-2016-6254.pat=
ch b/meta-oe/recipes-extended/collectd/collectd/CVE-2016-6254.patch
> new file mode 100644
> index 0000000..bc85b4c
> --- /dev/null
> +++ b/meta-oe/recipes-extended/collectd/collectd/CVE-2016-6254.patch
> @@ -0,0 +1,55 @@
> +From dd8483a4beb6f61521d8b32c726523bbea21cd92 Mon Sep 17 00:00:00 2001
> +From: Florian Forster <octo@collectd.org>
> +Date: Tue, 19 Jul 2016 10:00:37 +0200
> +Subject: [PATCH] network plugin: Fix heap overflow in parse_packet().
> +
> +Emilien Gaspar has identified a heap overflow in parse_packet(), the
> +function used by the network plugin to parse incoming network packets.
> +
> +This is a vulnerability in collectd, though the scope is not clear at
> +this point. At the very least specially crafted network packets can be
> +used to crash the daemon. We can't rule out a potential remote code
> +execution though.
> +
> +Fixes: CVE-2016-6254
> +
> +cherry picked from upstream commit b589096f
> +
> +Upstream Status: Backport
> +
> +Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
> +---
> + src/network.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/src/network.c b/src/network.c
> +index 551bd5c..cb979b2 100644
> +--- a/src/network.c
> ++++ b/src/network.c
> +@@ -1444,6 +1444,7 @@ static int parse_packet (sockent_t *se, /* {{{ */
> + 				printed_ignore_warning =3D 1;
> + 			}
> + 			buffer =3D ((char *) buffer) + pkg_length;
> ++			buffer_size -=3D (size_t) pkg_length;
> + 			continue;
> + 		}
> + #endif /* HAVE_LIBGCRYPT */
> +@@ -1471,6 +1472,7 @@ static int parse_packet (sockent_t *se, /* {{{ */
> + 				printed_ignore_warning =3D 1;
> + 			}
> + 			buffer =3D ((char *) buffer) + pkg_length;
> ++			buffer_size -=3D (size_t) pkg_length;
> + 			continue;
> + 		}
> + #endif /* HAVE_LIBGCRYPT */
> +@@ -1612,6 +1614,7 @@ static int parse_packet (sockent_t *se, /* {{{ */
> + 			DEBUG ("network plugin: parse_packet: Unknown part"
> + 					" type: 0x%04hx", pkg_type);
> + 			buffer =3D ((char *) buffer) + pkg_length;
> ++			buffer_size -=3D (size_t) pkg_length;
> + 		}
> + 	} /* while (buffer_size > sizeof (part_header_t)) */
> +=20
> +--=20
> +2.7.4
> +
> diff --git a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb b/meta-o=
e/recipes-extended/collectd/collectd_5.5.0.bb
> index d7ba5b7..34edecf 100644
> --- a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
> +++ b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
> @@ -13,6 +13,7 @@ SRC_URI =3D "http://collectd.org/files/collectd-${PV}.t=
ar.bz2 \
>             file://collectd.service \
>             file://0001-conditionally-check-libvirt.patch \
>             file://0001-collectd-replace-deprecated-readdir_r-with-readdi=
r.patch \
> +           file://CVE-2016-6254.patch \
>  "
>  SRC_URI[md5sum] =3D "c39305ef5514b44238b0d31f77e29e6a"
>  SRC_URI[sha256sum] =3D "847684cf5c10de1dc34145078af3fcf6e0d168ba98c14f13=
43b1062a4b569e88"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--udcq9yAoWb9A4FsZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfP7NcACgkQN1Ujt2V2gBxGfACeJZiyN1s9m1QCP0k8UPc3ifUP
uLYAoJlmZt2R4EWnwhZAeQUoURTSESGF
=d8We
-----END PGP SIGNATURE-----

--udcq9yAoWb9A4FsZ--
