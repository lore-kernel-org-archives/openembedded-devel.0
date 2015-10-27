Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id A81F575D4A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 20:24:47 +0000 (UTC)
Received: by wikq8 with SMTP id q8so228810105wik.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 13:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RtVBm2nWLNnLuCNdE7vvA1CoPceaOaxjeuwzutWSw5U=;
	b=pq0wnriIrCQZw5kem27CnezwMfhSCl25utGxk9JQmYPTRsF/gn2+yc80vNwfKfEFwC
	xlJ78/rXoCvVXMPQqtdQWNy+u+i0cj+3avUYRjDRoXJ5ChwyGXqb5zH5W2TiejQ/XdgZ
	o2aA0+GfTY0BTLLUZTtn2bksfmzlx4LAZt/HsgSmXNM7lEgPfUJG2iHm7y8pRnQ2V0RC
	50yNjvl0FXUTIEZuQwd9G+W6ml/JacQJhHBDmmneJSsw/y9RLNKs1i5iVMsF22UDMQkJ
	A+1B9IRbCNsH7t1W6Di242EI8uwfc1qpiWNSn9v3/6hUIcEC1SbauP89WInaqcccZvxA
	ikYg==
X-Received: by 10.180.198.227 with SMTP id jf3mr30985439wic.94.1445977487825; 
	Tue, 27 Oct 2015 13:24:47 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ub15sm14331092wib.6.2015.10.27.13.24.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Oct 2015 13:24:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 27 Oct 2015 21:25:03 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151027202503.GH2577@jama>
References: <55EAE272.5010904@topic.nl> <20151027182121.GF2577@jama>
	<CAMKF1spKg10RUh3O3f+skxykHvGHA9Si-LvD1jKLDUQCrE2rtw@mail.gmail.com>
	<20151027195742.GG2577@jama>
MIME-Version: 1.0
In-Reply-To: <20151027195742.GG2577@jama>
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
X-List-Received-Date: Tue, 27 Oct 2015 20:24:51 -0000
X-Groupsio-MsgNum: 58080
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k+G3HLlWI7eRTl+h"
Content-Disposition: inline

--k+G3HLlWI7eRTl+h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2015 at 08:57:42PM +0100, Martin Jansa wrote:
> On Tue, Oct 27, 2015 at 11:26:32AM -0700, Khem Raj wrote:
> > On Tue, Oct 27, 2015 at 11:21 AM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> > > On Sat, Sep 05, 2015 at 02:39:14PM +0200, Mike Looijmans wrote:
> > >> I got this weird build failure from the "krb" package:
> > >>
> > >> | make[3]: Entering directory
> > >> '/TOPDIR/build/tmp/work/mips32el-oe-linux/krb5/1.13.2-r0/krb5-1.13.2=
/src/lib/krb5/ccache'
> > >> | mipsel-oe-linux-gcc  -mel -mabi=3D32 -mhard-float -march=3Dmips32
> > >> --sysroot=3D/TOPDIR/build/tmp/sysroots/formuler1 -fPIC -DSHARED
> > >> -DHAVE_CONFIG_H  -I../../../include -I../../../include -I./ccapi -I.=
 -I.
> > >>   -DKRB5_DEPRECATED=3D1 -DKRB5_PRIVATE  -Os -pipe -g
> > >> -feliminate-unused-debug-types -DDESTRUCTOR_ATTR_WORKS=3D1
> > >> -I/TOPDIR/build/tmp/sysroots/formuler1/usr/include/et -Wall -Wcast-a=
lign
> > >> -Wshadow -Wmissing-prototypes -Wno-format-zero-length -Woverflow
> > >> -Wstrict-overflow -Wmissing-format-attribute -Wmissing-prototypes
> > >> -Wreturn-type -Wmissing-braces -Wparentheses -Wswitch -Wunused-funct=
ion
> > >> -Wunused-label -Wunused-variable -Wunused-value -Wunknown-pragmas
> > >> -Wsign-compare -Werror=3Duninitialized -Werror=3Dpointer-arith
> > >> -Werror=3Ddeclaration-after-statement
> > >> -Werror-implicit-function-declaration -pthread -c cc_file.c -o
> > >> cc_file.so.o && mv -f cc_file.so.o cc_file.so
> > >> | cc_file.c: In function 'fcc_next_cred':
> > >> | cc_file.c:368:9: error: 'maxsize' may be used uninitialized in this
> > >> function [-Werror=3Dmaybe-uninitialized]
> > >> |      ret =3D load_data(context, id, maxsize, buf);
> > >> |          ^
> > >> | cc_file.c:1091:12: note: 'maxsize' was declared here
> > >> |      size_t maxsize;
> > >> |             ^
> > >> | cc1: some warnings being treated as errors
> > >>
> > >> Looking at the source, this doesn't make any sense at all. The
> > >> declaration of the variable isn't even in the same method body. And =
the
> > >> line it complains about is about the fifth time it passes that varia=
ble
> > >> to another method.
> > >>
> > >> And working around it by initializing maxsize=3D0 just makes the com=
piler
> > >> choke on a similar situation elsewhere:
> > >> | packet.c:50:67: error: 'id' may be used uninitialized in this func=
tion
> > >>
> > >>
> > >> I suspect the problem here is GCC and not the krb code. Anyone seen =
this?
> > >
> > > I've seen it today in my world builds, It seems to fail only when bui=
lding with -Os.
> > >
> > > I've seen similar issue in mdadm, also only with -Os.
> > >
> >=20
> > is this regression ? or seen for first time?
>=20
> krb5 fails to build like this with -Os at least since dizzy
>=20
> mdadm failure:
> | raid6check.c: In function 'check_stripes':
> | raid6check.c:315:8: error: 'stripe_buf' may be used uninitialized in th=
is function [-Werror=3Dmaybe-uninitialized]
> |   char *stripe_buf;
> |         ^
> | cc1: all warnings being treated as errors
> | make: *** [raid6check.o] Error 1
> | ERROR: oe_runmake failed
>=20
> is newer (seen only in Jethro builds).
>=20
> But maybe only because this is built in do_compile_ptest_base and ptest
> support was added in oe-core/jethro, it fails the same with gcc-5.2 and g=
cc-4.9.

Quick grep in my last -Os world build shows 2 more recipes with
similar issue (smbnetfs is failing in krb5 dependency already):

physfs:
| physfs/2.0.3-r0/physfs-2.0.3/archivers/zip.c: In function 'ZIP_openArchiv=
e':
| physfs/2.0.3-r0/physfs-2.0.3/archivers/zip.c:944:19: error: 'data_start' =
may be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
|      entry->offset +=3D ofs_fixup;
|                    ^
| physfs/2.0.3-r0/physfs-2.0.3/archivers/zip.c:1116:19: note: 'data_start' =
was declared here
|      PHYSFS_uint32 data_start;
|                    ^
| physfs/2.0.3-r0/physfs-2.0.3/archivers/zip.c: In function 'ZIP_openArchiv=
e':
| physfs/2.0.3-r0/physfs-2.0.3/archivers/zip.c:944:19: error: 'data_start' =
may be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
|      entry->offset +=3D ofs_fixup;
|                    ^
| physfs/2.0.3-r0/physfs-2.0.3/archivers/zip.c:1116:19: note: 'data_start' =
was declared here
|      PHYSFS_uint32 data_start;
|                    ^
| cc1: all warnings being treated as errors

tvheadend:
| tvheadend/3.3-r0/git/src/serviceprobe.c: In function 'serviceprobe_thread=
':
| tvheadend/3.3-r0/git/src/serviceprobe.c:168:7: error: 's' may be used uni=
nitialized in this function [-Werror=3Dmaybe-uninitialized]
|        subscription_unsubscribe(s);
|        ^

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k+G3HLlWI7eRTl+h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYv3Z4ACgkQN1Ujt2V2gBwSHQCfd8+CVWWqiFfj+YxJhHNLaGTE
iZ8AoKhnX0vunm3ndVE8ksijvfaTSRB8
=SRSm
-----END PGP SIGNATURE-----

--k+G3HLlWI7eRTl+h--
