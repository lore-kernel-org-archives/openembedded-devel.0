Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8A93577223
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 14:49:24 +0000 (UTC)
Received: by wmec201 with SMTP id c201so36691941wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 06:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VjUAqyL9z9sSj49W/T+u/wVq93mMrYlW9cz5j1aba/s=;
	b=jQjCSr9YlD0uy/8EesWhm6pngQpqXbo1Fa1VGeNkVZWGDsQkY/e5lg+nVDP95DtGhy
	hdkgzoIPJQxL0e4Jvw61qlMfsa7tKi7WrlKBu634y8IWLCxJ/1erdNHOb1WFjYB3gVxu
	y/1jxcXPs49aPigZsLkDvpYwx8wti4u7+EyUsgKgzG2Iydf/WwttJGM+dpnCnpn076RV
	k90wO0M/NNfLlvjIZ/76xoqqVHzzOZw/jZlfJIyCoEH2wwNnImqpZK4k7vbrkmM4XI+/
	aPjNgW+wo3vD1yMYIVqNHPXcsV/RaqWESmFxWdzjxUREcAEiHR3IH2G0oiS8avEGW+Ry
	eFzg==
X-Received: by 10.194.176.70 with SMTP id cg6mr19171330wjc.155.1447339764081; 
	Thu, 12 Nov 2015 06:49:24 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	vx1sm4656802wjc.28.2015.11.12.06.49.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 06:49:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Nov 2015 15:49:39 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151112144939.GF2574@jama>
References: <1447338183-9675-1-git-send-email-Martin.Jansa@gmail.com>
	<CALbNGRTs5LyeazLDrmKrrJfYo0NVBaW3uUVe7jxFpWQus-daEA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTs5LyeazLDrmKrrJfYo0NVBaW3uUVe7jxFpWQus-daEA@mail.gmail.com>
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
X-List-Received-Date: Thu, 12 Nov 2015 14:49:26 -0000
X-Groupsio-MsgNum: 58566
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xkXJwpr35CY/Lc3I"
Content-Disposition: inline

--xkXJwpr35CY/Lc3I
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 03:39:12PM +0100, Andreas M=FCller wrote:
> On Thu, Nov 12, 2015 at 3:22 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > * see:
> >   http://lists.openembedded.org/pipermail/openembedded-devel/2015-Septe=
mber/103271.html
> > * fixes:
> > ERROR: ipsec-tools different signature for task do_configure.sigdata be=
tween qemux86copy and qemux86
> > runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot=
:virtual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:nat=
ive', 'bisonbison_3.0.4.bb.do_populate_sysroot:virtual:native', 'flexflex_2=
=2E5.39.bb.do_populate_sysroot:virtual:native', 'gccgcc-cross_5.2.bb.do_pop=
ulate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.=
22.bb.do_populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sysroo=
t:virtual:native', 'ipsec-toolsipsec-tools_0.8.2.bb.do_patch', 'libtoollibt=
ool-cross_2.4.6.bb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb.do=
_populate_sysroot', 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'openssl=
openssl_1.0.2d.bb.do_populate_sysroot', 'readlinereadline_6.3.bb.do_populat=
e_sysroot', 'systemdsystemd-systemctl-native.bb.do_populate_sysroot']
> > to
> > ['autoconfautoconf_2.69.bb.do_populate_sysroot:virtual:native', 'automa=
keautomake_1.15.bb.do_populate_sysroot:virtual:native', 'bisonbison_3.0.4.b=
b.do_populate_sysroot:virtual:native', 'flexflex_2.5.39.bb.do_populate_sysr=
oot:virtual:native', 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-run=
time_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot',=
 'gnu-configgnu-config_git.bb.do_populate_sysroot:virtual:native', 'ipsec-t=
oolsipsec-tools_0.8.2.bb.do_patch', 'libtoollibtool-cross_2.4.6.bb.do_popul=
ate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot', 'linuxl=
inux-yocto_4.1.bb.do_populate_sysroot', 'opensslopenssl_1.0.2d.bb.do_popula=
te_sysroot', 'readlinereadline_6.3.bb.do_populate_sysroot', 'systemdsystemd=
-systemctl-native.bb.do_populate_sysroot']
> > openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb.do_popul=
ate_sysroot with hash 1a8aa7a50a6cf3ebf5401af43dd6bf3b
> >  changed to
> > openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb.do_popul=
ate_sysroot with hash 143d2686a37f592891fb2aa6fa9b752e
> > Hash for dependent task linuxlinux-yocto_4.1.bb.do_populate_sysroot cha=
nged from 1a8aa7a50a6cf3ebf5401af43dd6bf3b to 143d2686a37f592891fb2aa6fa9b7=
52e
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.=
8.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
> > index 8ee81f8..d9f1212 100644
> > --- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
> > +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
> > @@ -7,6 +7,8 @@ LIC_FILES_CHKSUM =3D "file://src/libipsec/pfkey.c;begin=
line=3D6;endline=3D31;md5=3Dbc9b7
> >
> >  DEPENDS =3D "virtual/kernel openssl readline flex-native bison-native"
> >
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> >  SRC_URI =3D "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipse=
c-tools-${PV}.tar.bz2 \
> >             file://0002-Don-t-link-against-libfl.patch \
> >             file://configure.patch \
> > --
> > 2.6.3
> >
> Maybe I am wrong: I think there were times when depending on kernel
> made recipe machine specific. I somehow get the feeling that this is
> the wrong fix...

That's what this patch is doing, or I didn't get your point.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xkXJwpr35CY/Lc3I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZEpwAACgkQN1Ujt2V2gBz9xgCfTjQdW2QmhlKT2N/V56zKLjEt
IEwAnisuk51geWFte+U/jpbG5mWgiL0N
=dE/9
-----END PGP SIGNATURE-----

--xkXJwpr35CY/Lc3I--
