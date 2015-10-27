Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2AA7175CC2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 19:57:25 +0000 (UTC)
Received: by wikq8 with SMTP id q8so227870372wik.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 12:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tKgepnnG6bLlEbG12T+uy0U61gZcZYBxbcPidggDjHo=;
	b=NeDdp2XPA9BGy6tbJDMKpfuGFMVFw8/NrmGZ5GsCSLUhPWCmv7TudwxteJSZDxbj0g
	RPgu+IB3l6Y0xRq6dTjzVcvkgULjeZ/AZOmuZrbNd1bX2wFhlAkgX960UBRt8lew4wQL
	oSq8K8K9hCUL2fM4mBW5WSKAAMUfbNvSw0krbeQstXiw9VBuEA4FVAIxlWYuTbitiJLU
	GJq/sdDp7K+k2s7sNkuRh8rksusiK9gyL2kHMW94tx/5fpZkclC1i2EMsE8+sCz2Rs+l
	KbDCNJ0YLBkpPdgQwRmw213Ff7kl0ebRVW6hKGFXa0Gj9+dgsUfSKyE0aVi353mjeYbj
	ottA==
X-Received: by 10.180.72.7 with SMTP id z7mr15134067wiu.35.1445975845341;
	Tue, 27 Oct 2015 12:57:25 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	kr10sm46560020wjc.25.2015.10.27.12.57.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Oct 2015 12:57:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 27 Oct 2015 20:57:42 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151027195742.GG2577@jama>
References: <55EAE272.5010904@topic.nl> <20151027182121.GF2577@jama>
	<CAMKF1spKg10RUh3O3f+skxykHvGHA9Si-LvD1jKLDUQCrE2rtw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spKg10RUh3O3f+skxykHvGHA9Si-LvD1jKLDUQCrE2rtw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: "krb" fails to build, suspect GCC bug
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
X-List-Received-Date: Tue, 27 Oct 2015 19:57:27 -0000
X-Groupsio-MsgNum: 58073
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iAL9S67WQOXgEPD9"
Content-Disposition: inline

--iAL9S67WQOXgEPD9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2015 at 11:26:32AM -0700, Khem Raj wrote:
> On Tue, Oct 27, 2015 at 11:21 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Sat, Sep 05, 2015 at 02:39:14PM +0200, Mike Looijmans wrote:
> >> I got this weird build failure from the "krb" package:
> >>
> >> | make[3]: Entering directory
> >> '/TOPDIR/build/tmp/work/mips32el-oe-linux/krb5/1.13.2-r0/krb5-1.13.2/s=
rc/lib/krb5/ccache'
> >> | mipsel-oe-linux-gcc  -mel -mabi=3D32 -mhard-float -march=3Dmips32
> >> --sysroot=3D/TOPDIR/build/tmp/sysroots/formuler1 -fPIC -DSHARED
> >> -DHAVE_CONFIG_H  -I../../../include -I../../../include -I./ccapi -I. -=
I.
> >>   -DKRB5_DEPRECATED=3D1 -DKRB5_PRIVATE  -Os -pipe -g
> >> -feliminate-unused-debug-types -DDESTRUCTOR_ATTR_WORKS=3D1
> >> -I/TOPDIR/build/tmp/sysroots/formuler1/usr/include/et -Wall -Wcast-ali=
gn
> >> -Wshadow -Wmissing-prototypes -Wno-format-zero-length -Woverflow
> >> -Wstrict-overflow -Wmissing-format-attribute -Wmissing-prototypes
> >> -Wreturn-type -Wmissing-braces -Wparentheses -Wswitch -Wunused-function
> >> -Wunused-label -Wunused-variable -Wunused-value -Wunknown-pragmas
> >> -Wsign-compare -Werror=3Duninitialized -Werror=3Dpointer-arith
> >> -Werror=3Ddeclaration-after-statement
> >> -Werror-implicit-function-declaration -pthread -c cc_file.c -o
> >> cc_file.so.o && mv -f cc_file.so.o cc_file.so
> >> | cc_file.c: In function 'fcc_next_cred':
> >> | cc_file.c:368:9: error: 'maxsize' may be used uninitialized in this
> >> function [-Werror=3Dmaybe-uninitialized]
> >> |      ret =3D load_data(context, id, maxsize, buf);
> >> |          ^
> >> | cc_file.c:1091:12: note: 'maxsize' was declared here
> >> |      size_t maxsize;
> >> |             ^
> >> | cc1: some warnings being treated as errors
> >>
> >> Looking at the source, this doesn't make any sense at all. The
> >> declaration of the variable isn't even in the same method body. And the
> >> line it complains about is about the fifth time it passes that variable
> >> to another method.
> >>
> >> And working around it by initializing maxsize=3D0 just makes the compi=
ler
> >> choke on a similar situation elsewhere:
> >> | packet.c:50:67: error: 'id' may be used uninitialized in this functi=
on
> >>
> >>
> >> I suspect the problem here is GCC and not the krb code. Anyone seen th=
is?
> >
> > I've seen it today in my world builds, It seems to fail only when build=
ing with -Os.
> >
> > I've seen similar issue in mdadm, also only with -Os.
> >
>=20
> is this regression ? or seen for first time?

krb5 fails to build like this with -Os at least since dizzy

mdadm failure:
| raid6check.c: In function 'check_stripes':
| raid6check.c:315:8: error: 'stripe_buf' may be used uninitialized in this=
 function [-Werror=3Dmaybe-uninitialized]
|   char *stripe_buf;
|         ^
| cc1: all warnings being treated as errors
| make: *** [raid6check.o] Error 1
| ERROR: oe_runmake failed

is newer (seen only in Jethro builds).

But maybe only because this is built in do_compile_ptest_base and ptest
support was added in oe-core/jethro, it fails the same with gcc-5.2 and gcc=
-4.9.

>=20
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iAL9S67WQOXgEPD9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYv1zUACgkQN1Ujt2V2gBx8KgCdEd4g1kAG+9IFk6ZAav2ACZca
XBsAn0kicnSj5VujNMr5RAmNyURt8G1+
=bVSH
-----END PGP SIGNATURE-----

--iAL9S67WQOXgEPD9--
