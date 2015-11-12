Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7D4C57720C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 16:03:48 +0000 (UTC)
Received: by wmec201 with SMTP id c201so98542824wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 08:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gWFBvn1jtDioXrds/ZdM6Xtrxsz9jyphNbXAYgnp6vE=;
	b=DEEHK8J0iNvIzHLQcmV+L4L6keEhNZXg39BF2jFWfxfrxF4YP1Q2mhyovnvKczOi/N
	Fgup2gYB281OuxlMCfGfLd+pDEvtiEIUZ/NHhVcaWzJiAQGhpp5nc1ZtByi4mN0CZ+FS
	SpBOCkcw6Min02ymrnAslbNMsOvcrfdUdefip5n3gFZAQqN4Tf91TFlUj7wuYcHsvi6k
	6C+0DqzvluisL1kk/sfRZ4q8aa6kxcqDx1UhOSim6AkkOys5m8pn0/rze5PKtf/UGk2h
	Or3fmvPvkNadzHjsxlGgyKEUzlcKpKlUVOqxV5+QpHvpabjCBR7Yny666lbObjnIn6us
	QZwA==
X-Received: by 10.194.114.105 with SMTP id jf9mr5076754wjb.102.1447344227635; 
	Thu, 12 Nov 2015 08:03:47 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ot9sm1798572wjc.12.2015.11.12.08.03.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 08:03:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Nov 2015 17:04:03 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151112160403.GH2574@jama>
References: <1447338183-9675-1-git-send-email-Martin.Jansa@gmail.com>
	<CALbNGRTs5LyeazLDrmKrrJfYo0NVBaW3uUVe7jxFpWQus-daEA@mail.gmail.com>
	<20151112144939.GF2574@jama>
	<CALbNGRQq8Lb_uQFyCCmgf79w7smtrEg2DKPE58Phee9_tBXBnQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQq8Lb_uQFyCCmgf79w7smtrEg2DKPE58Phee9_tBXBnQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-oe 1/9] ipsec-tools: set MACHINE_ARCH, because it depends on kernel
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
X-List-Received-Date: Thu, 12 Nov 2015 16:03:51 -0000
X-Groupsio-MsgNum: 58575
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zq44+AAfm4giZpo5"
Content-Disposition: inline

--zq44+AAfm4giZpo5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 04:10:09PM +0100, Andreas M=FCller wrote:
> On Thu, Nov 12, 2015 at 3:49 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Thu, Nov 12, 2015 at 03:39:12PM +0100, Andreas M=FCller wrote:
> >> On Thu, Nov 12, 2015 at 3:22 PM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> >> > * see:
> >> >   http://lists.openembedded.org/pipermail/openembedded-devel/2015-Se=
ptember/103271.html
> >> > * fixes:
> >> > ERROR: ipsec-tools different signature for task do_configure.sigdata=
 between qemux86copy and qemux86
> >> > runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysr=
oot:virtual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:=
native', 'bisonbison_3.0.4.bb.do_populate_sysroot:virtual:native', 'flexfle=
x_2.5.39.bb.do_populate_sysroot:virtual:native', 'gccgcc-cross_5.2.bb.do_po=
pulate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2=
=2E22.bb.do_populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sys=
root:virtual:native', 'ipsec-toolsipsec-tools_0.8.2.bb.do_patch', 'libtooll=
ibtool-cross_2.4.6.bb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb=
=2Edo_populate_sysroot', 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'op=
ensslopenssl_1.0.2d.bb.do_populate_sysroot', 'readlinereadline_6.3.bb.do_po=
pulate_sysroot', 'systemdsystemd-systemctl-native.bb.do_populate_sysroot']
> >> > to
> >> > ['autoconfautoconf_2.69.bb.do_populate_sysroot:virtual:native', 'aut=
omakeautomake_1.15.bb.do_populate_sysroot:virtual:native', 'bisonbison_3.0.=
4.bb.do_populate_sysroot:virtual:native', 'flexflex_2.5.39.bb.do_populate_s=
ysroot:virtual:native', 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-=
runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroo=
t', 'gnu-configgnu-config_git.bb.do_populate_sysroot:virtual:native', 'ipse=
c-toolsipsec-tools_0.8.2.bb.do_patch', 'libtoollibtool-cross_2.4.6.bb.do_po=
pulate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot', 'lin=
uxlinux-yocto_4.1.bb.do_populate_sysroot', 'opensslopenssl_1.0.2d.bb.do_pop=
ulate_sysroot', 'readlinereadline_6.3.bb.do_populate_sysroot', 'systemdsyst=
emd-systemctl-native.bb.do_populate_sysroot']
> >> > openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb.do_po=
pulate_sysroot with hash 1a8aa7a50a6cf3ebf5401af43dd6bf3b
> >> >  changed to
> >> > openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb.do_po=
pulate_sysroot with hash 143d2686a37f592891fb2aa6fa9b752e
> >> > Hash for dependent task linuxlinux-yocto_4.1.bb.do_populate_sysroot =
changed from 1a8aa7a50a6cf3ebf5401af43dd6bf3b to 143d2686a37f592891fb2aa6fa=
9b752e
> >> >
> >> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> > ---
> >> >  meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb | =
2 ++
> >> >  1 file changed, 2 insertions(+)
> >> >
> >> > diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools=
_0.8.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
> >> > index 8ee81f8..d9f1212 100644
> >> > --- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.=
bb
> >> > +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.=
bb
> >> > @@ -7,6 +7,8 @@ LIC_FILES_CHKSUM =3D "file://src/libipsec/pfkey.c;be=
ginline=3D6;endline=3D31;md5=3Dbc9b7
> >> >
> >> >  DEPENDS =3D "virtual/kernel openssl readline flex-native bison-nati=
ve"
> >> >
> >> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >> > +
> >> >  SRC_URI =3D "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/i=
psec-tools-${PV}.tar.bz2 \
> >> >             file://0002-Don-t-link-against-libfl.patch \
> >> >             file://configure.patch \
> >> > --
> >> > 2.6.3
> >> >
> >> Maybe I am wrong: I think there were times when depending on kernel
> >> made recipe machine specific. I somehow get the feeling that this is
> >> the wrong fix...
> >
> > That's what this patch is doing, or I didn't get your point.
> >
> I thought there was once a magic doing this automatically: As soon as
> there is one package in depends which is machine specific this recipe
> also turns machine specififc.

The magic PACKAGE_ARCH works only for SRC_URI files when they are found ${M=
ACHINE}
directory in FILESPATH.

> But the more I think over this, it seems I am mixing this up with
> inheriting modules - which does turn the recipe into machine specific.
> So forget my question.

OK, done :)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zq44+AAfm4giZpo5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZEuHMACgkQN1Ujt2V2gByQ0QCghnUA2yBLurULh3zESeLKYzno
yOsAnj7MD4RvWn5xFztYO9nVJHj7qaFj
=TRFr
-----END PGP SIGNATURE-----

--zq44+AAfm4giZpo5--
