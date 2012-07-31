Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SwBLX-0003Mh-4N
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 14:14:43 +0200
Received: by yhjj56 with SMTP id j56so5343167yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2012 05:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=VQZ/guSoW6nBLqmLa0B4goYh2BehIaIAhKFO3+F+eG0=;
	b=T+nYNXSLpB9NowGPeWfd3t13gTYZ0EHLqstpyeNwSFpJm/tjVWio69dTHQwczfIHXu
	g/eSnff7Dl013CABCZoPW8zYHic7ostifQgfS7h3L4XhRe7y3kPKds48ey2XhmSVrWYU
	sG1NStDWFvR7ZWoJqihyPmp/Q1QFzkFUnAqPF9Ev26XYsG0lzIxidTqDMfTnULphfoRP
	Up0Y9l9SxCU/GGtbaId+VF60vqPnqqshsMR4nb1TeRMcWgT+/X5no7KQd+RzasMUmi0R
	bdIAkXHEHd7FALnph3ZxaTOvGzJvZrv7+3u1vqurIu4ug8uHugWcd/GJ7HkcFuKmk3vY
	AmPA==
MIME-Version: 1.0
Received: by 10.50.208.34 with SMTP id mb2mr451975igc.5.1343736185221; Tue, 31
	Jul 2012 05:03:05 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Tue, 31 Jul 2012 05:03:05 -0700 (PDT)
In-Reply-To: <1343048025-13347-1-git-send-email-schnitzeltony@googlemail.com>
References: <1343048025-13347-1-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 31 Jul 2012 14:03:05 +0200
Message-ID: <CALbNGRQZLyrO62ndATu02ds7+NWQZPdmVJ4+kwZU012iJyQV3g@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] fuse: Fix-build-with-automake-1.12.1
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
X-List-Received-Date: Tue, 31 Jul 2012 12:14:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 23, 2012 at 2:53 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> error message was:
> | make[2]: ../mkinstalldirs: Command not found
> | make[2]: *** [install-exec-local] Error 127
> | make[2]: *** Waiting for unfinished jobs....
> | make[2]: ../mkinstalldirs: Command not found
> | make[2]: *** [install-data-local] Error 127
>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../0001-Fix-install-from-out-of-tree-build.patch  |   33 +++++++++
>  .../0002-Fix-build-with-automake-1.12.1.patch      |   73 ++++++++++++++=
++++++
>  meta-oe/recipes-support/fuse/fuse_2.8.6.bb         |    4 +-
>  3 files changed, 109 insertions(+), 1 deletions(-)
>  create mode 100644 meta-oe/recipes-support/fuse/fuse-2.8.6/0001-Fix-inst=
all-from-out-of-tree-build.patch
>  create mode 100644 meta-oe/recipes-support/fuse/fuse-2.8.6/0002-Fix-buil=
d-with-automake-1.12.1.patch
>
> diff --git a/meta-oe/recipes-support/fuse/fuse-2.8.6/0001-Fix-install-fro=
m-out-of-tree-build.patch b/meta-oe/recipes-support/fuse/fuse-2.8.6/0001-Fi=
x-install-from-out-of-tree-build.patch
> new file mode 100644
> index 0000000..7f01227
> --- /dev/null
> +++ b/meta-oe/recipes-support/fuse/fuse-2.8.6/0001-Fix-install-from-out-o=
f-tree-build.patch
> @@ -0,0 +1,33 @@
> +From eac25997edf1de69130e6a8c7e72b058daa0bb5d Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Mon, 23 Jul 2012 14:37:13 +0200
> +Subject: [PATCH 1/2] Fix install from out-of-tree build
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-status: backport of [1]
> +
> +[1] http://fuse.git.sourceforge.net/git/gitweb.cgi?p=3Dfuse/fuse;a=3Dcom=
mit;h=3Dfd4a816823133dd66de60b3a017e1f0442486d1f
> +
> +Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> +---
> + util/Makefile.am |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/util/Makefile.am b/util/Makefile.am
> +index b9bcdaa..b627da1 100644
> +--- a/util/Makefile.am
> ++++ b/util/Makefile.am
> +@@ -29,7 +29,7 @@ INIT_D_PATH =3D @INIT_D_PATH@
> +
> + install-exec-local:
> +       $(mkdir_p) $(DESTDIR)$(MOUNT_FUSE_PATH)
> +-      $(INSTALL_PROGRAM) $(srcdir)/mount.fuse $(DESTDIR)$(MOUNT_FUSE_PA=
TH)/mount.fuse
> ++      $(INSTALL_PROGRAM) $(builddir)/mount.fuse $(DESTDIR)$(MOUNT_FUSE_=
PATH)/mount.fuse
> +       $(mkdir_p) $(DESTDIR)$(INIT_D_PATH)
> +       $(INSTALL_SCRIPT) $(srcdir)/init_script $(DESTDIR)$(INIT_D_PATH)/=
fuse
> +       @if test -x /usr/sbin/update-rc.d; then \
> +--
> +1.7.6.5
> +
> diff --git a/meta-oe/recipes-support/fuse/fuse-2.8.6/0002-Fix-build-with-=
automake-1.12.1.patch b/meta-oe/recipes-support/fuse/fuse-2.8.6/0002-Fix-bu=
ild-with-automake-1.12.1.patch
> new file mode 100644
> index 0000000..358e77c
> --- /dev/null
> +++ b/meta-oe/recipes-support/fuse/fuse-2.8.6/0002-Fix-build-with-automak=
e-1.12.1.patch
> @@ -0,0 +1,73 @@
> +From 05bbacf18bcf1a66973297bcbb9a284af6ce654f Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Mon, 23 Jul 2012 14:43:18 +0200
> +Subject: [PATCH 2/2] Fix build with automake >=3D 1.12.1
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-status: backport of [1]
> +
> +[1] http://fuse.git.sourceforge.net/git/gitweb.cgi?p=3Dfuse/fuse;a=3Dcom=
mit;h=3Da6a8bcbeefd6c9e9cf1c6c6f5e8224aff2beb51b
> +
> +Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> +---
> + configure.in     |    2 ++
> + util/Makefile.am |    8 ++++----
> + 2 files changed, 6 insertions(+), 4 deletions(-)
> +
> +diff --git a/configure.in b/configure.in
> +index 9604d5e..c0e4fc6 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -1,4 +1,5 @@
> + AC_INIT(fuse, 2.8.6)
> ++AC_PREREQ(2.59d)
> + AC_CONFIG_MACRO_DIR([m4])
> + AC_CANONICAL_TARGET
> + AM_INIT_AUTOMAKE
> +@@ -6,6 +7,7 @@ AM_CONFIG_HEADER(include/config.h)
> +
> + AC_PROG_LIBTOOL
> + AC_PROG_CC
> ++AC_PROG_MKDIR_P
> + AM_PROG_CC_C_O
> +
> + # compatibility for automake < 1.8
> +diff --git a/util/Makefile.am b/util/Makefile.am
> +index b627da1..4d91e1a 100644
> +--- a/util/Makefile.am
> ++++ b/util/Makefile.am
> +@@ -16,7 +16,7 @@ ulockmgr_server_LDFLAGS =3D -pthread
> + install-exec-hook:
> +       -chmod u+s $(DESTDIR)$(bindir)/fusermount
> +       @if test ! -e $(DESTDIR)/dev/fuse; then \
> +-              $(mkdir_p) $(DESTDIR)/dev; \
> ++              $(MKDIR_P) $(DESTDIR)/dev; \
> +               echo "mknod $(DESTDIR)/dev/fuse -m 0666 c 10 229 || true"=
; \
> +               mknod $(DESTDIR)/dev/fuse -m 0666 c 10 229 || true; \
> +       fi
> +@@ -28,9 +28,9 @@ UDEV_RULES_PATH =3D @UDEV_RULES_PATH@
> + INIT_D_PATH =3D @INIT_D_PATH@
> +
> + install-exec-local:
> +-      $(mkdir_p) $(DESTDIR)$(MOUNT_FUSE_PATH)
> ++      $(MKDIR_P) $(DESTDIR)$(MOUNT_FUSE_PATH)
> +       $(INSTALL_PROGRAM) $(builddir)/mount.fuse $(DESTDIR)$(MOUNT_FUSE_=
PATH)/mount.fuse
> +-      $(mkdir_p) $(DESTDIR)$(INIT_D_PATH)
> ++      $(MKDIR_P) $(DESTDIR)$(INIT_D_PATH)
> +       $(INSTALL_SCRIPT) $(srcdir)/init_script $(DESTDIR)$(INIT_D_PATH)/=
fuse
> +       @if test -x /usr/sbin/update-rc.d; then \
> +               echo "/usr/sbin/update-rc.d fuse start 34 S . start 41 0 =
6 . || true"; \
> +@@ -38,7 +38,7 @@ install-exec-local:
> +       fi
> +
> + install-data-local:
> +-      $(mkdir_p) $(DESTDIR)$(UDEV_RULES_PATH)
> ++      $(MKDIR_P) $(DESTDIR)$(UDEV_RULES_PATH)
> +       $(INSTALL_DATA) $(srcdir)/udev.rules $(DESTDIR)$(UDEV_RULES_PATH)=
/99-fuse.rules
> +
> + uninstall-local:
> +--
> +1.7.6.5
> +
> diff --git a/meta-oe/recipes-support/fuse/fuse_2.8.6.bb b/meta-oe/recipes=
-support/fuse/fuse_2.8.6.bb
> index 15e9206..a7605da 100644
> --- a/meta-oe/recipes-support/fuse/fuse_2.8.6.bb
> +++ b/meta-oe/recipes-support/fuse/fuse_2.8.6.bb
> @@ -5,11 +5,13 @@ LICENSE =3D "GPLv2&LGPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
>                      file://COPYING.LIB;md5=3Df30a9716ef3762e3467a2f62bf7=
90f0a"
>
> -PR =3D "r1"
> +PR =3D "r2"
>
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz \
>             file://define_GNU_SOURCE.patch \
>             file://gold-unversioned-symbol.patch \
> +           file://0001-Fix-install-from-out-of-tree-build.patch \
> +           file://0002-Fix-build-with-automake-1.12.1.patch \
>            "
>
>  SRC_URI[md5sum] =3D "eaa32c8cef56a981656a786f258a002a"
> --
> 1.7.6.5
>
Any comments on this one?

Andreas


