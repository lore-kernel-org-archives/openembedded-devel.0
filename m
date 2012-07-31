Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwBRW-0003Vo-B0
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 14:20:54 +0200
Received: by bkcik5 with SMTP id ik5so2533031bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2012 05:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CyyiDyXmXEmyWUeRtMicsrdC1MErGfZfbwbLP2UDC6c=;
	b=EJv2I0PnycxSPNSU9MVZU9LzNCazxAe0dX2aBLXkl8CWsqe/WN3OVKXYkR7XNzqaIz
	/AyUoOe2UBx64D0PmTtIR03/nBH1fhO/+T6YZPriLq8QkSqLKgJl4sAGh0oEet20Dh+r
	uV32qe4emYRFWOkOA1QhZR/s6e/RTL3dkl2LtWXAPyU6yY05eW9xUuqRX1xDvHk1ghol
	d758nBbVZTXhhGUSmcIjKmnky/m3RG/BfYxWYzA8kOcp8KgXHypDzO3zH2xkvp4Q7jcZ
	45abbIgpwmFHZ1tSyV1XRs0AkSKwapHIzGKSXnkd5fh3IOzsIzf2BlDj6jMpkBOeWd02
	KeHw==
Received: by 10.204.133.196 with SMTP id g4mr5282485bkt.89.1343736557451;
	Tue, 31 Jul 2012 05:09:17 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 14sm5261012bkq.12.2012.07.31.05.09.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jul 2012 05:09:16 -0700 (PDT)
Date: Tue, 31 Jul 2012 14:09:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120731120912.GV3261@jama.jama.net>
References: <1343048025-13347-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRQZLyrO62ndATu02ds7+NWQZPdmVJ4+kwZU012iJyQV3g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQZLyrO62ndATu02ds7+NWQZPdmVJ4+kwZU012iJyQV3g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe] [PATCH] fuse: Fix-build-with-automake-1.12.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2012 12:20:54 -0000
X-Groupsio-MsgNum: 39959
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pbi2MkfjSbXbI4MN"
Content-Disposition: inline

--Pbi2MkfjSbXbI4MN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2012 at 02:03:05PM +0200, Andreas M=FCller wrote:
> On Mon, Jul 23, 2012 at 2:53 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> > error message was:
> > | make[2]: ../mkinstalldirs: Command not found
> > | make[2]: *** [install-exec-local] Error 127
> > | make[2]: *** Waiting for unfinished jobs....
> > | make[2]: ../mkinstalldirs: Command not found
> > | make[2]: *** [install-data-local] Error 127
> >
> > Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> > ---
> >  .../0001-Fix-install-from-out-of-tree-build.patch  |   33 +++++++++
> >  .../0002-Fix-build-with-automake-1.12.1.patch      |   73 ++++++++++++=
++++++++
> >  meta-oe/recipes-support/fuse/fuse_2.8.6.bb         |    4 +-
> >  3 files changed, 109 insertions(+), 1 deletions(-)
> >  create mode 100644 meta-oe/recipes-support/fuse/fuse-2.8.6/0001-Fix-in=
stall-from-out-of-tree-build.patch
> >  create mode 100644 meta-oe/recipes-support/fuse/fuse-2.8.6/0002-Fix-bu=
ild-with-automake-1.12.1.patch
> >
> > diff --git a/meta-oe/recipes-support/fuse/fuse-2.8.6/0001-Fix-install-f=
rom-out-of-tree-build.patch b/meta-oe/recipes-support/fuse/fuse-2.8.6/0001-=
Fix-install-from-out-of-tree-build.patch
> > new file mode 100644
> > index 0000000..7f01227
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/fuse/fuse-2.8.6/0001-Fix-install-from-out=
-of-tree-build.patch
> > @@ -0,0 +1,33 @@
> > +From eac25997edf1de69130e6a8c7e72b058daa0bb5d Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googl=
email.com>
> > +Date: Mon, 23 Jul 2012 14:37:13 +0200
> > +Subject: [PATCH 1/2] Fix install from out-of-tree build
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Upstream-status: backport of [1]
> > +
> > +[1] http://fuse.git.sourceforge.net/git/gitweb.cgi?p=3Dfuse/fuse;a=3Dc=
ommit;h=3Dfd4a816823133dd66de60b3a017e1f0442486d1f
> > +
> > +Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> > +---
> > + util/Makefile.am |    2 +-
> > + 1 files changed, 1 insertions(+), 1 deletions(-)
> > +
> > +diff --git a/util/Makefile.am b/util/Makefile.am
> > +index b9bcdaa..b627da1 100644
> > +--- a/util/Makefile.am
> > ++++ b/util/Makefile.am
> > +@@ -29,7 +29,7 @@ INIT_D_PATH =3D @INIT_D_PATH@
> > +
> > + install-exec-local:
> > +       $(mkdir_p) $(DESTDIR)$(MOUNT_FUSE_PATH)
> > +-      $(INSTALL_PROGRAM) $(srcdir)/mount.fuse $(DESTDIR)$(MOUNT_FUSE_=
PATH)/mount.fuse
> > ++      $(INSTALL_PROGRAM) $(builddir)/mount.fuse $(DESTDIR)$(MOUNT_FUS=
E_PATH)/mount.fuse
> > +       $(mkdir_p) $(DESTDIR)$(INIT_D_PATH)
> > +       $(INSTALL_SCRIPT) $(srcdir)/init_script $(DESTDIR)$(INIT_D_PATH=
)/fuse
> > +       @if test -x /usr/sbin/update-rc.d; then \
> > +--
> > +1.7.6.5
> > +
> > diff --git a/meta-oe/recipes-support/fuse/fuse-2.8.6/0002-Fix-build-wit=
h-automake-1.12.1.patch b/meta-oe/recipes-support/fuse/fuse-2.8.6/0002-Fix-=
build-with-automake-1.12.1.patch
> > new file mode 100644
> > index 0000000..358e77c
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/fuse/fuse-2.8.6/0002-Fix-build-with-autom=
ake-1.12.1.patch
> > @@ -0,0 +1,73 @@
> > +From 05bbacf18bcf1a66973297bcbb9a284af6ce654f Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googl=
email.com>
> > +Date: Mon, 23 Jul 2012 14:43:18 +0200
> > +Subject: [PATCH 2/2] Fix build with automake >=3D 1.12.1
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Upstream-status: backport of [1]
> > +
> > +[1] http://fuse.git.sourceforge.net/git/gitweb.cgi?p=3Dfuse/fuse;a=3Dc=
ommit;h=3Da6a8bcbeefd6c9e9cf1c6c6f5e8224aff2beb51b
> > +
> > +Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> > +---
> > + configure.in     |    2 ++
> > + util/Makefile.am |    8 ++++----
> > + 2 files changed, 6 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/configure.in b/configure.in
> > +index 9604d5e..c0e4fc6 100644
> > +--- a/configure.in
> > ++++ b/configure.in
> > +@@ -1,4 +1,5 @@
> > + AC_INIT(fuse, 2.8.6)
> > ++AC_PREREQ(2.59d)
> > + AC_CONFIG_MACRO_DIR([m4])
> > + AC_CANONICAL_TARGET
> > + AM_INIT_AUTOMAKE
> > +@@ -6,6 +7,7 @@ AM_CONFIG_HEADER(include/config.h)
> > +
> > + AC_PROG_LIBTOOL
> > + AC_PROG_CC
> > ++AC_PROG_MKDIR_P
> > + AM_PROG_CC_C_O
> > +
> > + # compatibility for automake < 1.8
> > +diff --git a/util/Makefile.am b/util/Makefile.am
> > +index b627da1..4d91e1a 100644
> > +--- a/util/Makefile.am
> > ++++ b/util/Makefile.am
> > +@@ -16,7 +16,7 @@ ulockmgr_server_LDFLAGS =3D -pthread
> > + install-exec-hook:
> > +       -chmod u+s $(DESTDIR)$(bindir)/fusermount
> > +       @if test ! -e $(DESTDIR)/dev/fuse; then \
> > +-              $(mkdir_p) $(DESTDIR)/dev; \
> > ++              $(MKDIR_P) $(DESTDIR)/dev; \
> > +               echo "mknod $(DESTDIR)/dev/fuse -m 0666 c 10 229 || tru=
e"; \
> > +               mknod $(DESTDIR)/dev/fuse -m 0666 c 10 229 || true; \
> > +       fi
> > +@@ -28,9 +28,9 @@ UDEV_RULES_PATH =3D @UDEV_RULES_PATH@
> > + INIT_D_PATH =3D @INIT_D_PATH@
> > +
> > + install-exec-local:
> > +-      $(mkdir_p) $(DESTDIR)$(MOUNT_FUSE_PATH)
> > ++      $(MKDIR_P) $(DESTDIR)$(MOUNT_FUSE_PATH)
> > +       $(INSTALL_PROGRAM) $(builddir)/mount.fuse $(DESTDIR)$(MOUNT_FUS=
E_PATH)/mount.fuse
> > +-      $(mkdir_p) $(DESTDIR)$(INIT_D_PATH)
> > ++      $(MKDIR_P) $(DESTDIR)$(INIT_D_PATH)
> > +       $(INSTALL_SCRIPT) $(srcdir)/init_script $(DESTDIR)$(INIT_D_PATH=
)/fuse
> > +       @if test -x /usr/sbin/update-rc.d; then \
> > +               echo "/usr/sbin/update-rc.d fuse start 34 S . start 41 =
0 6 . || true"; \
> > +@@ -38,7 +38,7 @@ install-exec-local:
> > +       fi
> > +
> > + install-data-local:
> > +-      $(mkdir_p) $(DESTDIR)$(UDEV_RULES_PATH)
> > ++      $(MKDIR_P) $(DESTDIR)$(UDEV_RULES_PATH)
> > +       $(INSTALL_DATA) $(srcdir)/udev.rules $(DESTDIR)$(UDEV_RULES_PAT=
H)/99-fuse.rules
> > +
> > + uninstall-local:
> > +--
> > +1.7.6.5
> > +
> > diff --git a/meta-oe/recipes-support/fuse/fuse_2.8.6.bb b/meta-oe/recip=
es-support/fuse/fuse_2.8.6.bb
> > index 15e9206..a7605da 100644
> > --- a/meta-oe/recipes-support/fuse/fuse_2.8.6.bb
> > +++ b/meta-oe/recipes-support/fuse/fuse_2.8.6.bb
> > @@ -5,11 +5,13 @@ LICENSE =3D "GPLv2&LGPLv2"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079b=
ae19f \
> >                      file://COPYING.LIB;md5=3Df30a9716ef3762e3467a2f62b=
f790f0a"
> >
> > -PR =3D "r1"
> > +PR =3D "r2"
> >
> >  SRC_URI =3D "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz \
> >             file://define_GNU_SOURCE.patch \
> >             file://gold-unversioned-symbol.patch \
> > +           file://0001-Fix-install-from-out-of-tree-build.patch \
> > +           file://0002-Fix-build-with-automake-1.12.1.patch \
> >            "
> >
> >  SRC_URI[md5sum] =3D "eaa32c8cef56a981656a786f258a002a"
> > --
> > 1.7.6.5
> >
> Any comments on this one?

Probably overlooked because of missing [meta-oe] prefix, but looks good
to me. (trying to add meta-oe to subject if pw finds it now :)).

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Pbi2MkfjSbXbI4MN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAXyugACgkQN1Ujt2V2gBzbcwCfR0yUxaqMh0omzjJT/rglKXAU
TsEAnRWg6S2nXOevZdfyf49FQLwNa0mL
=4T+2
-----END PGP SIGNATURE-----

--Pbi2MkfjSbXbI4MN--
