Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2C61E6AFCA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2013 12:03:52 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id h10so2251889eaj.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2013 05:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oXffMy7QcDW9ipmQUycFGn1M7Lw+bgDLCAMcfV6h/yY=;
	b=1IdTrqlUMPu9bVhjTHuPsnWyHx9obKR59FpLLq+edKfyT1PVInKjXIlJcfwb0sBuJU
	x7VCwUejbTUMBrYli3kp5TdmprJaHpLE3oOSepz+Ucmf+2lsW18DyHgSXeXU7dcmwqYd
	NTMKJVgF3396pnGgCh7WTcXW33iz2vtNgxJI4PRSTf1uZxfiMWcdFVmFkY7lOz7tyUNu
	4ctEzwhzSLRgloDljnet9YBJ62sVis+skUT4yt4LJDWnOf6NFAuCErnn83YFhR92NQLH
	qFdxy3Y93bPntcw3QTCsBZ1avRTk9tHdhdfM05oyzswqHs3UWBdEyH7Xfpgat+RmzCVU
	D3cQ==
X-Received: by 10.14.111.9 with SMTP id v9mr22086807eeg.35.1376913832284;
	Mon, 19 Aug 2013 05:03:52 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm16966825eeg.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 19 Aug 2013 05:03:51 -0700 (PDT)
Date: Mon, 19 Aug 2013 14:04:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130819120455.GB522@jama>
References: <1376913341-18910-1-git-send-email-erp@movis.dk>
MIME-Version: 1.0
In-Reply-To: <1376913341-18910-1-git-send-email-erp@movis.dk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] Added recipes for Test::More and its dependency Test::Harness Signed-off-by: Emil Petersen <erp@movis.dk>
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
X-List-Received-Date: Mon, 19 Aug 2013 12:03:52 -0000
X-Groupsio-MsgNum: 45780
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline

--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2013 at 01:55:41PM +0200, Emil Petersen wrote:
> ---
>  .../perl-module-test-harness_3.28.bb                |   18 +++++++++++++=
+++++
>  .../perl-module-test-more_0.98.bb                   |   19 +++++++++++++=
++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta-perl/recipes-perl/perl-module-test-harness/perl-=
module-test-harness_3.28.bb
>  create mode 100644 meta-perl/recipes-perl/perl-module-test-more/perl-mod=
ule-test-more_0.98.bb

[meta-perl] tag missing in e-mail subject

You need blank line before SOB line (otherwise it's considered to be
part of commit subject).

>=20
> diff --git a/meta-perl/recipes-perl/perl-module-test-harness/perl-module-=
test-harness_3.28.bb b/meta-perl/recipes-perl/perl-module-test-harness/perl=
-module-test-harness_3.28.bb
> new file mode 100644
> index 0000000..a7ed42e
> --- /dev/null
> +++ b/meta-perl/recipes-perl/perl-module-test-harness/perl-module-test-ha=
rness_3.28.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "Test::Harness - Run Perl standard test scripts with statist=
ics"
> +AUTHOR =3D "Curis \"Ovid\" Poe <ovid@cpan.org>"
> +HOMEPAGE =3D "https://metacpan.org/module/Test::Harness"
> +SECTION =3D "devtools"
> +LICENSE =3D "GPLv1"
> +LIC_FILES_CHKSUM =3D "file://README;md5=3D37947a7c4fbd4a63c41d1bfa385e0c=
1e"
> +
> +SRC_URI =3D "http://cpan.metacpan.org/authors/id/O/OV/OVID/Test-Harness-=
3.28.tar.gz"
> +SRC_URI[md5sum] =3D "e71faf73830f249e2eb569a52362c106"
> +SRC_URI[sha256sum] =3D "209d538a7809935967c2c148a36c75a2959a3c3432e1d406=
288662632870a07c"
> +
> +S =3D "${WORKDIR}/Test-Harness-${PV}/"
> +
> +inherit cpan
> +
> +BBCLASSEXTEND =3D "native"
> +
> +
> diff --git a/meta-perl/recipes-perl/perl-module-test-more/perl-module-tes=
t-more_0.98.bb b/meta-perl/recipes-perl/perl-module-test-more/perl-module-t=
est-more_0.98.bb
> new file mode 100644
> index 0000000..429284d
> --- /dev/null
> +++ b/meta-perl/recipes-perl/perl-module-test-more/perl-module-test-more_=
0.98.bb
> @@ -0,0 +1,19 @@
> +SUMMARY =3D "Test::More - yet another framework for writing test scripts"
> +AUTHOR =3D "Michael G Schwern <schwern@pobox.com>"
> +HOMEPAGE =3D "https://metacpan.org/module/Test::More"
> +SECTION =3D "cpan"
> +LICENSE =3D "GPLv1"
> +LIC_FILES_CHKSUM =3D "file://README;md5=3D23e939b09e39c1a3069cf98c7f0450=
0e"
> +
> +RDEPENDS_${PN} +=3D 'perl-module-test-harness'
> +
> +SRC_URI =3D "http://cpan.metacpan.org/authors/id/M/MS/MSCHWERN/Test-Simp=
le-0.98.tar.gz"
> +SRC_URI[md5sum] =3D "a8b26c97440269b33dd79fd847c521d8"
> +SRC_URI[sha256sum] =3D "2fb203e2cb75e72c6f70af71c6b01998f2c0ec2afba6c38c=
c5053c6107cd12a8"
> +
> +S =3D "${WORKDIR}/Test-Simple-${PV}"
> +
> +inherit cpan
> +
> +BBCLASSEXTEND =3D "native"
> +
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlISCecACgkQN1Ujt2V2gBzMuACfY0nICjlD9qQvD00GF+JvTvku
VhkAn06Z1xy5uRLfICmP4R3AZ78lThPq
=EERF
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--
