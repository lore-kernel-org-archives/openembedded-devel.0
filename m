Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id A9D9060EFA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 19:12:15 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id s7so1187836lbd.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 12:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2c3EdybBAjdor44ehi+trRLybR1FTiNpI8JJ4QYv/7o=;
	b=Oi6U59knOg9yFk5gHXFdVpElAnYErutreEDIKStRiqTpzoqaQTrg7fypVmXVnkpKpA
	Uc6DpxWFK3tObMQfnOP2zxko53/9S0iXjpWPjM9pdt3h948XcPnTiOnImQnkJZiMEpjX
	B0BPv/n0t/N/LM8AKo1WUTc10+LXfla6BjSpOsArQOuwbIvPrs4rumwLl2Mu2s2fMKNz
	EH+gGpPjWHJ9JquER1pz9ubKEOdsA0At+JdmQ/ggMgV0vbQtBCy/1LYXf9a29PPNpKB5
	3cXmP25AoYLYWNdaqp8A+hAhzqc4C2Hg5dnIg2dN87ZI+uwjOcGiIczBrC89A93Hvggt
	JFvA==
X-Received: by 10.112.219.234 with SMTP id pr10mr6783110lbc.59.1408043536550; 
	Thu, 14 Aug 2014 12:12:16 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h3sm3584585lah.20.2014.08.14.12.12.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 12:12:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 14 Aug 2014 21:12:53 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140814191253.GO14848@jama>
References: <1407868378-26155-1-git-send-email-gary.robertson@linaro.org>
	<CAF7YWnxeFrzp1EOojxezpa0-f+ivKPKmKnp1evdFr=pmd53npw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAF7YWnxeFrzp1EOojxezpa0-f+ivKPKmKnp1evdFr=pmd53npw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][master][PATCH] libhugetlbfs: Extend arm32 support to include BE variants
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
X-List-Received-Date: Thu, 14 Aug 2014 19:12:19 -0000
X-Groupsio-MsgNum: 51704
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6PUEI5/nYziPl3wQ"
Content-Disposition: inline

--6PUEI5/nYziPl3wQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2014 at 02:04:58PM -0500, Gary Robertson wrote:
> The patch to add support for all arm 32-bit variants has now been accepted
> by the libhugetlbfs project - but as yet I have received no feedback on
> adding the patch to the OE libhugetlbfs recipe.  Did I format the patch or
> the subject line improperly?  I am new to this mailing list so I'm not too
> confident that I have adhered to its common practices.

It looks OK to me and it's already queued in master-next.

> On Tue, Aug 12, 2014 at 1:32 PM, Gary S. Robertson <
> gary.robertson@linaro.org> wrote:
>=20
> > From: "Gary S. Robertson" <gary.robertson@linaro.org>
> >
> > Upstream Status: Submitted
> >
> > This patch applies the same technique used by Koen Kool in the following
> > patch
> > which was accepted by the libhugetlbfs project:
> >
> > [0a4f6] Add aarch64_be_support 2014-03-31 10:52:37
> >
> > It modifies the libhugetlbfs Makefile to mark all 32-bit arm architectu=
res
> > as supported by the libhugetlbfs build.  Builds and successful function=
al
> > tests have been performed for armv7a LE and BE runtime platforms.
> >
> > This patch replaces and renders obsolete the following patch:
> > arm32-support.patch by: Chunrong Guo <B40290@freescale.com>
> >
> > Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> > ---
> >  ...tend-arm32-support-to-include-BE-variants.patch |   38
> > ++++++++++++++++++++
> >  .../libhugetlbfs/files/arm32-support.patch         |   29 ------------=
---
> >  .../libhugetlbfs/libhugetlbfs_git.bb               |    2 +-
> >  3 files changed, 39 insertions(+), 30 deletions(-)
> >  create mode 100644
> > meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Extend-arm32-support-=
to-include-BE-variants.patch
> >  delete mode 100644
> > meta-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.patch
> >
> > diff --git
> > a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Extend-arm32-suppor=
t-to-include-BE-variants.patch
> > b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Extend-arm32-suppor=
t-to-include-BE-variants.patch
> > new file mode 100644
> > index 0000000..f6147cb
> > --- /dev/null
> > +++
> > b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Extend-arm32-suppor=
t-to-include-BE-variants.patch
> > @@ -0,0 +1,38 @@
> > +From 5af6dec8764375ca4f13bd9fed96af090228351a Mon Sep 17 00:00:00 2001
> > +From: "Gary S. Robertson" <gary.robertson@linaro.org>
> > +Date: Mon, 11 Aug 2014 11:06:04 -0500
> > +Subject: [libhugetlbfs][PATCH] Extend arm32 support to include BE vari=
ants
> > +
> > +This patch applies the same technique used by Koen Kool in the followi=
ng
> > patch
> > +which was accepted by the libhugetlbfs project:
> > +
> > +[0a4f6] Add aarch64_be_support 2014-03-31 10:52:37
> > +
> > +It modifies the libhugetlbfs Makefile to mark all 32-bit arm architect=
ures
> > +as supported by the libhugetlbfs build.  Builds and successful functio=
nal
> > +tests have been performed for armv7a LE and BE runtime platforms.
> > +
> > +This patch replaces and renders obsolete the following patch:
> > +arm32-support.patch submitted by: Chunrong Guo <B40290@freescale.com>
> > +
> > +Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> > +---
> > + Makefile |    2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 91502e1..ba79607 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -59,7 +59,7 @@ ELF32 =3D elf32ppclinux
> > + TMPLIB32 =3D lib
> > + CPPFLAGS +=3D -DPPC_NO_SEGMENTS
> > + else
> > +-ifeq ($(ARCH),armv7l)
> > ++ifneq (,$(findstring arm,$(ARCH)))
> > + CC32 =3D $(CC)
> > + TMPLIB32 =3D lib
> > + ELF32 +=3D armelf_linux_eabi
> > +--
> > +1.7.9.5
> > +
> > diff --git
> > a/meta-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.patch
> > b/meta-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.patch
> > deleted file mode 100644
> > index 96f162d..0000000
> > --- a/meta-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.patch
> > +++ /dev/null
> > @@ -1,29 +0,0 @@
> > -Upstream-Status: Submitted
> > -
> > -This patch adds support for arm32.
> > -
> > -Signed-off-by: Chunrong Guo <B40290@freescale.com>
> > -
> > ---- a/Makefileold      2014-06-17 21:55:23.131058918 -0500
> > -+++ b/Makefile 2014-06-17 21:56:08.726098531 -0500
> > -@@ -59,6 +59,12 @@
> > - TMPLIB32 =3D lib
> > - CPPFLAGS +=3D -DPPC_NO_SEGMENTS
> > - else
> > -+ifeq ($(ARCH),arm)
> > -+CC32 =3D $(CC)
> > -+TMPLIB32 =3D lib
> > -+ELF32 +=3D armelf_linux_eabi
> > -+CUSTOM_LDSCRIPTS =3D no
> > -+else
> > - ifeq ($(ARCH),armv7l)
> > - CC32 =3D $(CC)
> > - TMPLIB32 =3D lib
> > -@@ -116,6 +122,7 @@
> > - endif
> > - endif
> > - endif
> > -+endif
> > -
> > - ifdef CC32
> > - OBJDIRS +=3D obj32
> > diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > index 315863d..851b050 100644
> > --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > @@ -17,7 +17,7 @@ SRC_URI =3D "git://git.code.sf.net/p/libhugetlbfs/cod=
e \
> >      file://0001-aarch64-fix-cross-compilation.patch \
> >      file://0001-aarch64-fix-page-size-not-properly-computed.patch \
> >
> >  file://0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch=
 \
> > -    file://arm32-support.patch \
> > +    file://0001-Extend-arm32-support-to-include-BE-variants.patch \
> >  "
> >
> >  S =3D "${WORKDIR}/git"
> > --
> > 1.7.9.5
> >
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6PUEI5/nYziPl3wQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPtCjUACgkQN1Ujt2V2gBxGHQCdFkr7135L8WHyar6SpwHhWIqn
6kEAoJQ+9T4wm7XUaBgCg0iIRez9pcs7
=4OcK
-----END PGP SIGNATURE-----

--6PUEI5/nYziPl3wQ--
