Return-Path: <joe@deserted.net>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id B745B6E6B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2014 03:55:57 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id m12so12178470iga.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2014 19:55:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=IvFIbn3nN2/BTiAw91VX82b+W5Guf1M8OUafuh/x1NA=;
	b=LXNfB2OFJljDFgGgp7gMkPpWpYMDy0w0GdlXCVOPTmHuGV+SGsV1QAXxFody5wlXaK
	FYV/n1VpZTLEmie23/yS38XoRQXiMPE8I+MiYJA2x28gPyzeYAeUEBXq+LfZ97reN0ew
	sIYTF3CaBlhK8ljIJejO145ZHmej3xC5fh4ZF47fDQSkdkPSlFtHZN8SiShu6vyUwJDE
	Q9x7/3LyF4VchonyCojp0Tk5tl24XxhgZ2aVglMSCgfh4eNkbpVEHpHbnTjgE0HjyjJv
	G0UeXkHRdimII8RSU385jolHwaYOweAW4wKVrr+MBcqqJPJaySGj3fVCpzajFZkbeKlr
	nOCA==
X-Gm-Message-State: ALoCoQnz1ADdwJrd5zXVTsTGsoU1NcumUWMJh0TH7Y8ahZSnp6P0/Y+eO9K+0IYtDeT0VCwZAzvu
X-Received: by 10.50.25.104 with SMTP id b8mr1152095igg.35.1392263758532;
	Wed, 12 Feb 2014 19:55:58 -0800 (PST)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	c17sm3669697igo.4.2014.02.12.19.55.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 12 Feb 2014 19:55:57 -0800 (PST)
Date: Wed, 12 Feb 2014 22:55:55 -0500
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140213035553.GG23405@deserted.net>
References: <1392097295-32258-1-git-send-email-rongqing.li@windriver.com>
	<ldcq6a$ko6$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ldcq6a$ko6$1@ger.gmane.org>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] proftpd: move the runing created file under /var/run
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
X-List-Received-Date: Thu, 13 Feb 2014 03:55:57 -0000
X-Groupsio-MsgNum: 48135
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fmEUq8M7S0s+Fl0V"
Content-Disposition: inline

--fmEUq8M7S0s+Fl0V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[Re: [oe] [meta-networking][PATCH] proftpd: move the runing created file un=
der /var/run] On 14.02.11 (Tue 10:25) Koen Kooi wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> rongqing.li@windriver.com schreef op 11-02-14 06:41:
> > From: Roy Li <rongqing.li@windriver.com>
> >=20
> > Signed-off-by: Roy Li <rongqing.li@windriver.com>
>=20
> Looks good to me:
>=20
> Acked-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
> > --- .../proftpd/files/move-runfile-to-var-run.patch    |   39
> > ++++++++++++++++++++ .../recipes-daemons/proftpd/proftpd_1.3.4b.bb     =
 |
> > 1 + 2 files changed, 40 insertions(+) create mode 100644
> > meta-networking/recipes-daemons/proftpd/files/move-runfile-to-var-run.p=
atch
> >
> >  diff --git
> > a/meta-networking/recipes-daemons/proftpd/files/move-runfile-to-var-run=
=2Epatch
> > b/meta-networking/recipes-daemons/proftpd/files/move-runfile-to-var-run=
=2Epatch
> >
> >=20
> new file mode 100644
> > index 0000000..1561ed8 --- /dev/null +++
> > b/meta-networking/recipes-daemons/proftpd/files/move-runfile-to-var-run=
=2Epatch
> >
> >=20
> @@ -0,0 +1,39 @@
> > +redefine PR_RUN_DIR as ${localstatedir}/run + +Upstream-Status:
> > Inappropriate [configuration] + +Signed-off-by: Roy Li
> > <rongqing.li@windriver.com> +--- + configure    |    2 +- + configure.in
> > |    2 +- + 2 files changed, 2 insertions(+), 2 deletions(-) + +diff
> > --git a/configure b/configure +index ebed38e..445d5bc 100755 +---
> > a/configure ++++ b/configure +@@ -33579,7 +33579,7 @@ _ACEOF + + + cat
> > >>confdefs.h <<_ACEOF +-#define PR_RUN_DIR "`eval echo
> > "${localstatedir}"`" ++#define PR_RUN_DIR "`eval echo
> > "${localstatedir}"/run/`" + _ACEOF + + cat >>confdefs.h <<_ACEOF +diff
> > --git a/configure.in b/configure.in +index c17929c..df9186a 100644 +---
> > a/configure.in ++++ b/configure.in +@@ -2788,7 +2788,7 @@
> > locale_dir=3D"`eval echo ${localedir}`" + locale_dir=3D"`eval echo
> > ${locale_dir}`" + AC_DEFINE_UNQUOTED(PR_LOCALE_DIR, "`eval echo
> > "${locale_dir}"`") + +-AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo
> > "${localstatedir}"`") ++AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo
> > "${localstatedir}/run"`") + AC_DEFINE_UNQUOTED(PR_CONFIG_FILE_PATH,
> > "`eval echo "${sysconfdir}/proftpd.conf"`") +
> > AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo
> > "${localstatedir}/run/proftpd.pid"`") + +-- +1.7.10.4 + diff --git
> > a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> > b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb index
> > eb502d6..cfbadfb 100644 ---
> > a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb +++
> > b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb @@ -14,6
> > +14,7 @@ SRC_URI =3D
> > "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \=20
> > file://default \ file://move-pidfile-to-var-run.patch \=20
> > file://close-RequireValidShell-check.patch \ +
> > file://move-runfile-to-var-run.patch \ "
> >=20
> > SRC_URI[md5sum] =3D "0871e0b93c9c3c88ca950b6d9a04aed2"
> >=20
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iD8DBQFS+ex9MkyGM64RGpERAtFhAJ4tLBnVXI5xKc0iYoO3yshkzptqpQCgsttg
> h+XRSssUW4vt2C7+O6LKyiI=3D
> =3Dy2I2
> -----END PGP SIGNATURE-----
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
-Joe MacDonald.
:wq

--fmEUq8M7S0s+Fl0V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlL8Qj4ACgkQwFvcllog0XwHiACfWTtDwwi6WSFFOKZc4KCKKi98
NCwAnAqiOokzHs0l176MsSPoX7dhfwbU
=pToJ
-----END PGP SIGNATURE-----

--fmEUq8M7S0s+Fl0V--
