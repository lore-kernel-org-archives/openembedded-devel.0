Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5BCFD6AC36;
	Tue, 24 Mar 2015 01:02:44 +0000 (UTC)
Received: by weoy45 with SMTP id y45so1729103weo.2;
	Mon, 23 Mar 2015 18:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cAY7pKRVW58yr+L5Q6y8VHVYjvTQRBWg6w3rDG2QeJA=;
	b=AkmfG12QS5bkbLcdsXLYWJBp8BLYRVH1J3UPlMzWfrVejRDbWDjudlvPXA5UnT8syj
	oy2moqwvCWzBxUYulEhnN8LKuLjj4a5HODiMySYE0A6t7nm0HoUseD0ZaEyDccMRvih0
	GaGJwvku5DrIlLQ7KnlHanIWOZyN0Qvqu7FRD5S9FS4Tj0QbH+6EbDQHaYKFBmrKsUct
	yIVM2qIJYBkLQKQ4jfwWS0KZtS+Uh6O6H8qbC4mhmXkYj8+Q2rLGrUKuqzjSrh7/VaKy
	FoUCXXEXZ6oOTSJUGXaY5nld6qtg8FIdFyYCytATFWQ2RaQQSLFhWi2W8ely2HvGtFXo
	+/OQ==
X-Received: by 10.180.171.35 with SMTP id ar3mr24439846wic.24.1427158965451;
	Mon, 23 Mar 2015 18:02:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dj4sm3755733wjc.13.2015.03.23.18.02.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Mar 2015 18:02:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 24 Mar 2015 02:02:58 +0100
To: Raphael Philipe <rapphil@gmail.com>
Message-ID: <20150324010258.GG3904@jama>
References: <20150303074258.E353A50433@opal.openembedded.org>
	<20150321153142.GJ4738@jama>
	<CAENGNheZZ67eAKA1O58kj7ztXG3Sv8tBagvOnLQJDx77=S1ouw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAENGNheZZ67eAKA1O58kj7ztXG3Sv8tBagvOnLQJDx77=S1ouw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	Raphael Silva <raphael.philipe@ossystems.com.br>
Subject: Re: [oe-commits] Raphael Silva : fio: fix do_compile error
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
X-List-Received-Date: Tue, 24 Mar 2015 01:02:45 -0000
X-Groupsio-MsgNum: 54853
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qftxBdZWiueWNAVY"
Content-Disposition: inline

--qftxBdZWiueWNAVY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2015 at 09:56:29PM -0300, Raphael Philipe wrote:
> Hi Martin,
>=20
> I'm sorry, but I wasn't able to reproduce this problem. Could you
> please give more details on how you setup your build?

Have you tried to build numactl before rebuilding fio?
meta-oe/recipes-support/numactl/numactl_2.0.9.bb

bitbake numactl
bitbake -c cleansstate fio
bitbake fio

should show the error

>=20
> Regards,
>=20
> On Sat, Mar 21, 2015 at 12:31 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Tue, Mar 03, 2015 at 07:42:58AM +0000, git@git.openembedded.org wrot=
e:
> >> Module: meta-openembedded.git
> >> Branch: master
> >> Commit: 9b35e07cabaf3ed9bd681423a758b9c0dc3945af
> >> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcom=
mit;h=3D9b35e07cabaf3ed9bd681423a758b9c0dc3945af
> >>
> >> Author: Raphael Silva <rapphil@gmail.com>
> >> Date:   Sat Feb 28 20:15:16 2015 -0300
> >>
> >> fio: fix do_compile error
> >>
> >> * Update to v2.2.6
> >
> > Please fix these issues:
> > fio-2.2.6: fio rdepends on numactl, but it isn't a build dependency? [b=
uild-deps]
> > fio-2.2.6: fio rdepends on zlib, but it isn't a build dependency? [buil=
d-deps]
> >>
> >> Signed-off-by: Raphael Silva <raphael.philipe@ossystems.com.br>
> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>
> >> ---
> >>
> >>  ...eric-assembly-nop-and-barrier-code-for-ar.patch | 30 -------------=
---------
> >>  .../fio/{fio_2.0.5.bb =3D> fio_2.2.6.bb}             | 11 ++++----
> >>  2 files changed, 5 insertions(+), 36 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-benchmark/fio/fio/0001-ARM-Use-generic-as=
sembly-nop-and-barrier-code-for-ar.patch b/meta-oe/recipes-benchmark/fio/fi=
o/0001-ARM-Use-generic-assembly-nop-and-barrier-code-for-ar.patch
> >> deleted file mode 100644
> >> index db97244..0000000
> >> --- a/meta-oe/recipes-benchmark/fio/fio/0001-ARM-Use-generic-assembly-=
nop-and-barrier-code-for-ar.patch
> >> +++ /dev/null
> >> @@ -1,30 +0,0 @@
> >> -From 152b969cd4ff5b4b7e1c65eca1f9ab243b8a30c8 Mon Sep 17 00:00:00 2001
> >> -From: Otavio Salvador <otavio@ossystems.com.br>
> >> -Date: Sun, 14 Apr 2013 13:53:35 -0300
> >> -Subject: [PATCH] ARM: Use generic assembly nop and barrier code for a=
rmv6
> >> -
> >> -Upstream-Status: Submitted
> >> -
> >> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >> ----
> >> - arch/arch-arm.h |    4 +++-
> >> - 1 files changed, 3 insertions(+), 1 deletions(-)
> >> -
> >> -diff --git a/arch/arch-arm.h b/arch/arch-arm.h
> >> -index 658b688..7cd9502 100644
> >> ---- a/arch/arch-arm.h
> >> -+++ b/arch/arch-arm.h
> >> -@@ -18,7 +18,9 @@
> >> - #define __NR_sys_vmsplice   343
> >> - #endif
> >> -
> >> --#if defined (__ARM_ARCH_4__) || defined (__ARM_ARCH_4T__) || defined=
 (__ARM_ARCH_5__) || defined (__ARM_ARCH_5T__) || defined (__ARM_ARCH_5TE__=
) || defined (__ARM_ARCH_5TEJ__)
> >> -+#if defined (__ARM_ARCH_4__) || defined (__ARM_ARCH_4T__) \
> >> -+    || defined (__ARM_ARCH_5__) || defined (__ARM_ARCH_5T__) || defi=
ned (__ARM_ARCH_5TE__) || defined (__ARM_ARCH_5TEJ__) \
> >> -+    || defined(__ARM_ARCH_6__)  || defined(__ARM_ARCH_6J__) || defin=
ed(__ARM_ARCH_6Z__) || defined(__ARM_ARCH_6ZK__)
> >> - #define nop             __asm__ __volatile__("mov\tr0,r0\t@ nop\n\t")
> >> - #define read_barrier()      __asm__ __volatile__ ("" : : : "memory")
> >> - #define write_barrier()     __asm__ __volatile__ ("" : : : "memory")
> >> ---
> >> -1.7.2.5
> >> -
> >> diff --git a/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb b/meta-oe/reci=
pes-benchmark/fio/fio_2.2.6.bb
> >> similarity index 72%
> >> rename from meta-oe/recipes-benchmark/fio/fio_2.0.5.bb
> >> rename to meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
> >> index 8dcf637..016b1f2 100644
> >> --- a/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb
> >> +++ b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
> >> @@ -12,17 +12,16 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D393a5ca=
445f6965873eca0259a17f833"
> >>
> >>  DEPENDS =3D "libaio"
> >>
> >> -# rev for v2.0.5
> >> -SRCREV =3D "02efadeb8b05144bcf2fc7796e1da2e7db211d00"
> >> -SRC_URI =3D "git://git.kernel.dk/fio.git \
> >> -           file://0001-ARM-Use-generic-assembly-nop-and-barrier-code-=
for-ar.patch"
> >> +# rev for v2.2.6
> >> +SRCREV =3D "f52c9691bc8c285f3445235c69acdfd6de7f9b82"
> >> +SRC_URI =3D "git://git.kernel.dk/fio.git"
> >>
> >>  S =3D "${WORKDIR}/git"
> >>
> >> -EXTRA_OEMAKE =3D "CC=3D'${CC}' CFLAGS=3D'${CFLAGS}' LDFLAGS=3D'${LDFL=
AGS}'"
> >> +EXTRA_OEMAKE =3D "CC=3D'${CC}' LDFLAGS=3D'${LDFLAGS}'"
> >>
> >>  do_install() {
> >> -    oe_runmake install DESTDIR=3D${D} bindir=3D${bindir} mandir=3D${m=
andir}
> >> +    oe_runmake install DESTDIR=3D${D} prefix=3D${prefix} mandir=3D${m=
andir}
> >>      install -d ${D}/${docdir}/${PN}
> >>      cp -a ${S}/examples ${D}/${docdir}/${PN}/
> >>  }
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-commits mailing list
> >> Openembedded-commits@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qftxBdZWiueWNAVY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUQt8IACgkQN1Ujt2V2gBzx7QCdHyZsAJLXxnAdNzi+Ke+9MjQw
BCQAnREDZ62r1P1aO4MilICo0GQmw7DN
=TrsL
-----END PGP SIGNATURE-----

--qftxBdZWiueWNAVY--
