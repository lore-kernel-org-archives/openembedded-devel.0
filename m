Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id B0A3877223
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:10:09 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so42688673igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 07:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=WKK7LJlzS+YZIHq2n72+13chqMAPUFCgOUjYXzu3zHk=;
	b=rqsXakhnTS9JSXXJZRXF1Iq8QM9OUZw3N2Owu5yOxUr1foL2mTxguryB88K2bMM0qh
	uviiuMEKoD+ZoTe8QZFUfBE4QE9GFiPr9AhjQ7chyjtR9ARqeLFqxuXn88ARjotwH6S8
	3BYQ0Vm8epFQSA9fJAKkomyj4iT54rDDWUiMKUxDzgLoKUkYkXnIHHWL+hhhwBbxxdkM
	0ljQjQUmRHQGy40R4CZthasrCqifcDQUa2dudgg9nO6uH9JlHG3QKUR6FLZGPvXgOdtO
	ORrtZ/HvVrVdos2HQR6PE52HS7XCkH6jlDAPjbMdrl+oEakrYUCanrP+5C6sa/uqk9wm
	aRrg==
MIME-Version: 1.0
X-Received: by 10.50.64.147 with SMTP id o19mr35706554igs.52.1447341009816;
	Thu, 12 Nov 2015 07:10:09 -0800 (PST)
Received: by 10.36.31.131 with HTTP; Thu, 12 Nov 2015 07:10:09 -0800 (PST)
In-Reply-To: <20151112144939.GF2574@jama>
References: <1447338183-9675-1-git-send-email-Martin.Jansa@gmail.com>
	<CALbNGRTs5LyeazLDrmKrrJfYo0NVBaW3uUVe7jxFpWQus-daEA@mail.gmail.com>
	<20151112144939.GF2574@jama>
Date: Thu, 12 Nov 2015 16:10:09 +0100
Message-ID: <CALbNGRQq8Lb_uQFyCCmgf79w7smtrEg2DKPE58Phee9_tBXBnQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 12 Nov 2015 15:10:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 3:49 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Nov 12, 2015 at 03:39:12PM +0100, Andreas M=C3=BCller wrote:
>> On Thu, Nov 12, 2015 at 3:22 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> > * see:
>> >   http://lists.openembedded.org/pipermail/openembedded-devel/2015-Sept=
ember/103271.html
>> > * fixes:
>> > ERROR: ipsec-tools different signature for task do_configure.sigdata b=
etween qemux86copy and qemux86
>> > runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroo=
t:virtual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:na=
tive', 'bisonbison_3.0.4.bb.do_populate_sysroot:virtual:native', 'flexflex_=
2.5.39.bb.do_populate_sysroot:virtual:native', 'gccgcc-cross_5.2.bb.do_popu=
late_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.2=
2.bb.do_populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sysroot=
:virtual:native', 'ipsec-toolsipsec-tools_0.8.2.bb.do_patch', 'libtoollibto=
ol-cross_2.4.6.bb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_=
populate_sysroot', 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'opensslo=
penssl_1.0.2d.bb.do_populate_sysroot', 'readlinereadline_6.3.bb.do_populate=
_sysroot', 'systemdsystemd-systemctl-native.bb.do_populate_sysroot']
>> > to
>> > ['autoconfautoconf_2.69.bb.do_populate_sysroot:virtual:native', 'autom=
akeautomake_1.15.bb.do_populate_sysroot:virtual:native', 'bisonbison_3.0.4.=
bb.do_populate_sysroot:virtual:native', 'flexflex_2.5.39.bb.do_populate_sys=
root:virtual:native', 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-ru=
ntime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot'=
, 'gnu-configgnu-config_git.bb.do_populate_sysroot:virtual:native', 'ipsec-=
toolsipsec-tools_0.8.2.bb.do_patch', 'libtoollibtool-cross_2.4.6.bb.do_popu=
late_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot', 'linux=
linux-yocto_4.1.bb.do_populate_sysroot', 'opensslopenssl_1.0.2d.bb.do_popul=
ate_sysroot', 'readlinereadline_6.3.bb.do_populate_sysroot', 'systemdsystem=
d-systemctl-native.bb.do_populate_sysroot']
>> > openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb.do_popu=
late_sysroot with hash 1a8aa7a50a6cf3ebf5401af43dd6bf3b
>> >  changed to
>> > openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb.do_popu=
late_sysroot with hash 143d2686a37f592891fb2aa6fa9b752e
>> > Hash for dependent task linuxlinux-yocto_4.1.bb.do_populate_sysroot ch=
anged from 1a8aa7a50a6cf3ebf5401af43dd6bf3b to 143d2686a37f592891fb2aa6fa9b=
752e
>> >
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> >  meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb | 2 =
++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0=
.8.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
>> > index 8ee81f8..d9f1212 100644
>> > --- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
>> > +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
>> > @@ -7,6 +7,8 @@ LIC_FILES_CHKSUM =3D "file://src/libipsec/pfkey.c;begi=
nline=3D6;endline=3D31;md5=3Dbc9b7
>> >
>> >  DEPENDS =3D "virtual/kernel openssl readline flex-native bison-native=
"
>> >
>> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> > +
>> >  SRC_URI =3D "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ips=
ec-tools-${PV}.tar.bz2 \
>> >             file://0002-Don-t-link-against-libfl.patch \
>> >             file://configure.patch \
>> > --
>> > 2.6.3
>> >
>> Maybe I am wrong: I think there were times when depending on kernel
>> made recipe machine specific. I somehow get the feeling that this is
>> the wrong fix...
>
> That's what this patch is doing, or I didn't get your point.
>
I thought there was once a magic doing this automatically: As soon as
there is one package in depends which is machine specific this recipe
also turns machine specififc.

But the more I think over this, it seems I am mixing this up with
inheriting modules - which does turn the recipe into machine specific.
So forget my question.

Andreas

