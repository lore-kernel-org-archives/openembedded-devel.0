Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B696772430
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 20:09:43 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1Y5gdM-0004bB-78 from Joe_MacDonald@mentor.com ;
	Mon, 29 Dec 2014 12:09:44 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 29 Dec 2014 12:09:43 -0800
Received: by burninator (Postfix, from userid 1000)	id 4A20E5810B3; Mon, 29
	Dec 2014 15:09:37 -0500 (EST)
Date: Mon, 29 Dec 2014 15:09:37 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20141229200936.GF4672@mentor.com>
References: <1419572675-28661-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1419572675-28661-1-git-send-email-akuster808@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] proftpd: update to 1.3.5
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
X-List-Received-Date: Mon, 29 Dec 2014 20:09:49 -0000
X-Groupsio-MsgNum: 53517
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RE3pQJLXZi4fr8Xo"
Content-Disposition: inline

--RE3pQJLXZi4fr8Xo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks Armin.  I'm noticing I'm kind of eggnog-poor this year,
probably still time to fix that.  :-)

I didn't confirm yet, but maybe you know off the top of your head, does
this result in sane / expected ownership of the binaries that are
installed or does everything end up root/root?

-J.

[[meta-networking][PATCH] proftpd: update to 1.3.5] On 14.12.25 (Thu 21:44)=
 Armin Kuster wrote:

> dropped proftpd-sftp.patch as it is included in update.
> combined make.patch, move-pidfile-to-var-run.patch, move-runfile-to-var-r=
un.patch into
> build_fixup
>=20
> Added several packagesconfig options (too much eggnog)
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../proftpd/files/build_fixup.patch                | 112 ++++++++++++++++
>  .../recipes-daemons/proftpd/files/make.patch       |  66 ----------
>  .../proftpd/files/move-pidfile-to-var-run.patch    |  39 ------
>  .../proftpd/files/move-runfile-to-var-run.patch    |  39 ------
>  .../proftpd/files/proftpd-sftp.patch               | 142 ---------------=
------
>  .../{proftpd_1.3.4b.bb =3D> proftpd_1.3.5.bb}        |  59 ++++++---
>  6 files changed, 156 insertions(+), 301 deletions(-)
>  create mode 100644 meta-networking/recipes-daemons/proftpd/files/build_f=
ixup.patch
>  delete mode 100644 meta-networking/recipes-daemons/proftpd/files/make.pa=
tch
>  delete mode 100644 meta-networking/recipes-daemons/proftpd/files/move-pi=
dfile-to-var-run.patch
>  delete mode 100644 meta-networking/recipes-daemons/proftpd/files/move-ru=
nfile-to-var-run.patch
>  delete mode 100644 meta-networking/recipes-daemons/proftpd/files/proftpd=
-sftp.patch
>  rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.4b.bb =3D> p=
roftpd_1.3.5.bb} (51%)
>=20
> diff --git a/meta-networking/recipes-daemons/proftpd/files/build_fixup.pa=
tch b/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
> new file mode 100644
> index 0000000..19617a6
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
> @@ -0,0 +1,112 @@
> +Upstream-Status: Inappropriate [configuration]
> +
> +combined the following patches into one:
> +make, move-pidfile-to-var-run, move-runfile-to-var-run
> +
> +move pidfile to /var/run
> +redefine PR_RUN_DIR as ${localstatedir}/run
> +
> +Signed-off-By: Armin Kuster <akuster808@gmail.com>
> +
> +
> +Index: proftpd-1.3.5/Make.rules.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- proftpd-1.3.5.orig/Make.rules.in
> ++++ proftpd-1.3.5/Make.rules.in
> +@@ -29,9 +29,9 @@ INSTALL=3D@INSTALL@
> + INSTALL_STRIP=3D@INSTALL_STRIP@
> + INSTALL_USER=3D@install_user@
> + INSTALL_GROUP=3D@install_group@
> +-INSTALL_BIN=3D$(INSTALL) $(INSTALL_STRIP) -o $(INSTALL_USER) -g $(INSTA=
LL_GROUP) -m 0755
> +-INSTALL_SBIN=3D$(INSTALL) $(INSTALL_STRIP) -o $(INSTALL_USER) -g $(INST=
ALL_GROUP) -m 0755
> +-INSTALL_MAN=3D$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0644
> ++INSTALL_BIN=3D$(INSTALL) -m 0755
> ++INSTALL_SBIN=3D$(INSTALL) -m 0755
> ++INSTALL_MAN=3D$(INSTALL) -m 0644
> +=20
> + RM=3Drm -f
> + SHELL=3D@CONFIG_SHELL@
> +Index: proftpd-1.3.5/Makefile.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- proftpd-1.3.5.orig/Makefile.in
> ++++ proftpd-1.3.5/Makefile.in
> +@@ -105,7 +105,6 @@ check: proftpd$(EXEEXT)
> + $(DESTDIR)$(localedir) $(DESTDIR)$(includedir) $(DESTDIR)$(includedir)/=
proftpd $(DESTDIR)$(libdir) $(DESTDIR)$(pkgconfigdir) $(DESTDIR)$(libdir)/p=
roftpd $(DESTDIR)$(libexecdir) $(DESTDIR)$(localstatedir) $(DESTDIR)$(sysco=
nfdir) $(DESTDIR)$(bindir) $(DESTDIR)$(sbindir) $(DESTDIR)$(mandir) $(DESTD=
IR)$(mandir)/man1 $(DESTDIR)$(mandir)/man5 $(DESTDIR)$(mandir)/man8:
> + 	@if [ ! -d $@ ]; then \
> + 		mkdir -p $@; \
> +-		chown $(INSTALL_USER):$(INSTALL_GROUP) $@; \
> + 		chmod 0755 $@; \
> + 	fi
> +=20
> +@@ -115,7 +114,6 @@ install-proftpd: proftpd $(DESTDIR)$(inc
> + 		rm -f $(DESTDIR)$(sbindir)/in.proftpd ; \
> + 	fi
> + 	ln -s proftpd $(DESTDIR)$(sbindir)/in.proftpd
> +-	-chown -h $(INSTALL_USER):$(INSTALL_GROUP) $(DESTDIR)$(sbindir)/in.pro=
ftpd
> +=20
> + install-libs: $(DESTDIR)$(libdir)/proftpd
> + 	cd lib/ && $(MAKE) install
> +@@ -152,11 +150,11 @@ install-utils: $(DESTDIR)$(sbindir) $(DE
> + 	$(INSTALL_SBIN) ftpshut  $(DESTDIR)$(sbindir)/ftpshut
> + 	$(INSTALL_BIN)  ftptop   $(DESTDIR)$(bindir)/ftptop
> + 	$(INSTALL_BIN)  ftpwho   $(DESTDIR)$(bindir)/ftpwho
> +-	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 src/prxs $(D=
ESTDIR)$(bindir)/prxs
> ++	$(INSTALL) -m 0755 src/prxs $(DESTDIR)$(bindir)/prxs
> +=20
> + install-conf: $(DESTDIR)$(sysconfdir)
> + 	if [ ! -f $(DESTDIR)$(sysconfdir)/proftpd.conf ] ; then \
> +-		$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0644 \
> ++		$(INSTALL) -m 0644 \
> + 		           $(top_srcdir)/sample-configurations/basic.conf \
> + 	       	           $(DESTDIR)$(sysconfdir)/proftpd.conf ; \
> + 	fi
> +Index: proftpd-1.3.5/configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- proftpd-1.3.5.orig/configure
> ++++ proftpd-1.3.5/configure
> +@@ -38255,7 +38255,7 @@ _ACEOF
> +=20
> +=20
> + cat >>confdefs.h <<_ACEOF
> +-#define PR_RUN_DIR "`eval echo "${localstatedir}"`"
> ++#define PR_RUN_DIR "`eval echo "${localstatedir}"/run/`"
> + _ACEOF
> +=20
> + cat >>confdefs.h <<_ACEOF
> +@@ -38263,7 +38263,7 @@ cat >>confdefs.h <<_ACEOF
> + _ACEOF
> +=20
> + cat >>confdefs.h <<_ACEOF
> +-#define PR_PID_FILE_PATH "`eval echo "${localstatedir}/proftpd.pid"`"
> ++#define PR_PID_FILE_PATH "`eval echo "${localstatedir}/run/proftpd.pid"=
`"
> + _ACEOF
> +=20
> +=20
> +Index: proftpd-1.3.5/configure.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- proftpd-1.3.5.orig/configure.in
> ++++ proftpd-1.3.5/configure.in
> +@@ -2971,8 +2971,8 @@ locale_dir=3D"`eval echo ${locale_dir}`"
> + AC_DEFINE_UNQUOTED(PR_LOCALE_DIR, "`eval echo "${locale_dir}"`")
> +=20
> + AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}"`")
> +-AC_DEFINE_UNQUOTED(PR_CONFIG_FILE_PATH, "`eval echo "${sysconfdir}/prof=
tpd.conf"`")
> +-AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo "${localstatedir}/prof=
tpd.pid"`")
> ++AC_DEFINE_UNQUOTED(PR_CONFIG_FILE_PATH, "`eval echo "${sysconfdir}/run/=
proftpd.conf"`")
> ++AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo "${localstatedir}/run/=
proftpd.pid"`")
> +=20
> + prefix=3D"$pr_saved_prefix"
> + exec_prefix=3D"$pr_saved_exec_prefix"
> +Index: proftpd-1.3.5/lib/libcap/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- proftpd-1.3.5.orig/lib/libcap/Makefile
> ++++ proftpd-1.3.5/lib/libcap/Makefile
> +@@ -26,7 +26,7 @@ OBJS=3D$(addsuffix .o, $(FILES))
> + all: $(LIBNAME)
> +=20
> + _makenames: _makenames.c cap_names.sed
> +-	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
> ++	$(BUILD_CC) $(CFLAGS) $(LDFLAGS) $< -o $@
> +=20
> + cap_names.h: _makenames
> + 	./_makenames > cap_names.h
> diff --git a/meta-networking/recipes-daemons/proftpd/files/make.patch b/m=
eta-networking/recipes-daemons/proftpd/files/make.patch
> deleted file mode 100644
> index c5ff013..0000000
> --- a/meta-networking/recipes-daemons/proftpd/files/make.patch
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> -Index: proftpd-1.3.2/Makefile.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- proftpd-1.3.2.orig/Makefile.in
> -+++ proftpd-1.3.2/Makefile.in
> -@@ -76,7 +76,6 @@ check: proftpd$(EXEEXT)
> - $(DESTDIR)$(localedir) $(DESTDIR)$(includedir) $(DESTDIR)$(includedir)/=
proftpd $(DESTDIR)$(libdir) $(DESTDIR)$(pkgconfigdir) $(DESTDIR)$(libdir)/p=
roftpd $(DESTDIR)$(libexecdir) $(DESTDIR)$(localstatedir) $(DESTDIR)$(sysco=
nfdir) $(DESTDIR)$(rundir) $(DESTDIR)$(bindir) $(DESTDIR)$(sbindir) $(DESTD=
IR)$(mandir) $(DESTDIR)$(mandir)/man1 $(DESTDIR)$(mandir)/man5 $(DESTDIR)$(=
mandir)/man8:
> - 	@if [ ! -d $@ ]; then \
> - 		mkdir -p $@; \
> --		chown $(INSTALL_USER):$(INSTALL_GROUP) $@; \
> - 		chmod 0755 $@; \
> - 	fi
> -=20
> -@@ -86,7 +85,6 @@ install-proftpd: proftpd $(DESTDIR)$(inc
> - 		rm -f $(DESTDIR)$(sbindir)/in.proftpd ; \
> - 	fi
> - 	ln -s proftpd $(DESTDIR)$(sbindir)/in.proftpd
> --	-chown -h $(INSTALL_USER):$(INSTALL_GROUP) $(DESTDIR)$(sbindir)/in.pro=
ftpd
> -=20
> - install-libs: $(DESTDIR)$(libdir)/proftpd
> - 	cd lib/ && $(MAKE) install
> -@@ -121,11 +119,11 @@ install-utils: $(DESTDIR)$(sbindir) $(DE
> - 	$(INSTALL_SBIN) ftpshut  $(DESTDIR)$(sbindir)/ftpshut
> - 	$(INSTALL_BIN)  ftptop   $(DESTDIR)$(bindir)/ftptop
> - 	$(INSTALL_BIN)  ftpwho   $(DESTDIR)$(bindir)/ftpwho
> --	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 src/prxs $(D=
ESTDIR)$(bindir)/prxs
> -+	$(INSTALL) -m 0755 src/prxs $(DESTDIR)$(bindir)/prxs
> -=20
> - install-conf: $(DESTDIR)$(sysconfdir)
> - 	if [ ! -f $(DESTDIR)$(sysconfdir)/proftpd.conf ] ; then \
> --		$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0644 \
> -+		$(INSTALL) -m 0644 \
> - 		           $(top_srcdir)/sample-configurations/basic.conf \
> - 	       	           $(DESTDIR)$(sysconfdir)/proftpd.conf ; \
> - 	fi
> -Index: proftpd-1.3.2/Make.rules.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- proftpd-1.3.2.orig/Make.rules.in
> -+++ proftpd-1.3.2/Make.rules.in
> -@@ -29,9 +29,9 @@ UTILS_LIBS=3D@UTILS_LIBS@ @LIBS@
> - INSTALL=3D@INSTALL@
> - INSTALL_USER=3D@install_user@
> - INSTALL_GROUP=3D@install_group@
> --INSTALL_BIN=3D$(INSTALL) @INSTALL_STRIP@ -o $(INSTALL_USER) -g $(INSTAL=
L_GROUP) -m 0755
> --INSTALL_SBIN=3D$(INSTALL) @INSTALL_STRIP@ -o $(INSTALL_USER) -g $(INSTA=
LL_GROUP) -m 0755
> --INSTALL_MAN=3D$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0644
> -+INSTALL_BIN=3D$(INSTALL) -m 0755
> -+INSTALL_SBIN=3D$(INSTALL) -m 0755
> -+INSTALL_MAN=3D$(INSTALL) -m 0644
> -=20
> - RM=3Drm -f
> - SHELL=3D/bin/sh
> -Index: proftpd-1.3.2/lib/libcap/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- proftpd-1.3.2.orig/lib/libcap/Makefile
> -+++ proftpd-1.3.2/lib/libcap/Makefile
> -@@ -26,7 +26,7 @@ OBJS=3D$(addsuffix .o, $(FILES))
> - all: $(LIBNAME)
> -=20
> - _makenames: _makenames.c cap_names.sed
> --	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
> -+	$(BUILD_CC) $(CFLAGS) $(LDFLAGS) $< -o $@
> -=20
> - cap_names.h: _makenames
> - 	./_makenames > cap_names.h
> diff --git a/meta-networking/recipes-daemons/proftpd/files/move-pidfile-t=
o-var-run.patch b/meta-networking/recipes-daemons/proftpd/files/move-pidfil=
e-to-var-run.patch
> deleted file mode 100644
> index 953bbdd..0000000
> --- a/meta-networking/recipes-daemons/proftpd/files/move-pidfile-to-var-r=
un.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -move pidfile to /var/run
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ----
> - configure    |    2 +-
> - configure.in |    2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure b/configure
> -index e6268f5..ebed38e 100755
> ---- a/configure
> -+++ b/configure
> -@@ -33587,7 +33587,7 @@ cat >>confdefs.h <<_ACEOF
> - _ACEOF
> -=20
> - cat >>confdefs.h <<_ACEOF
> --#define PR_PID_FILE_PATH "`eval echo "${localstatedir}/proftpd.pid"`"
> -+#define PR_PID_FILE_PATH "`eval echo "${localstatedir}/run/proftpd.pid"=
`"
> - _ACEOF
> -=20
> -=20
> -diff --git a/configure.in b/configure.in
> -index df9186a..e2ae868 100644
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -2790,7 +2790,7 @@ AC_DEFINE_UNQUOTED(PR_LOCALE_DIR, "`eval echo "${l=
ocale_dir}"`")
> -=20
> - AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}"`")
> - AC_DEFINE_UNQUOTED(PR_CONFIG_FILE_PATH, "`eval echo "${sysconfdir}/prof=
tpd.conf"`")
> --AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo "${localstatedir}/prof=
tpd.pid"`")
> -+AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo "${localstatedir}/run/=
proftpd.pid"`")
> -=20
> - prefix=3D"$pr_saved_prefix"
> - exec_prefix=3D"$pr_saved_exec_prefix"
> ---=20
> -1.7.10.4
> -
> diff --git a/meta-networking/recipes-daemons/proftpd/files/move-runfile-t=
o-var-run.patch b/meta-networking/recipes-daemons/proftpd/files/move-runfil=
e-to-var-run.patch
> deleted file mode 100644
> index 1561ed8..0000000
> --- a/meta-networking/recipes-daemons/proftpd/files/move-runfile-to-var-r=
un.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -redefine PR_RUN_DIR as ${localstatedir}/run
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ----
> - configure    |    2 +-
> - configure.in |    2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure b/configure
> -index ebed38e..445d5bc 100755
> ---- a/configure
> -+++ b/configure
> -@@ -33579,7 +33579,7 @@ _ACEOF
> -=20
> -=20
> - cat >>confdefs.h <<_ACEOF
> --#define PR_RUN_DIR "`eval echo "${localstatedir}"`"
> -+#define PR_RUN_DIR "`eval echo "${localstatedir}"/run/`"
> - _ACEOF
> -=20
> - cat >>confdefs.h <<_ACEOF
> -diff --git a/configure.in b/configure.in
> -index c17929c..df9186a 100644
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -2788,7 +2788,7 @@ locale_dir=3D"`eval echo ${localedir}`"
> - locale_dir=3D"`eval echo ${locale_dir}`"
> - AC_DEFINE_UNQUOTED(PR_LOCALE_DIR, "`eval echo "${locale_dir}"`")
> -=20
> --AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}"`")
> -+AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}/run"`")
> - AC_DEFINE_UNQUOTED(PR_CONFIG_FILE_PATH, "`eval echo "${sysconfdir}/prof=
tpd.conf"`")
> - AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo "${localstatedir}/run/=
proftpd.pid"`")
> -=20
> ---=20
> -1.7.10.4
> -
> diff --git a/meta-networking/recipes-daemons/proftpd/files/proftpd-sftp.p=
atch b/meta-networking/recipes-daemons/proftpd/files/proftpd-sftp.patch
> deleted file mode 100644
> index 8c71263..0000000
> --- a/meta-networking/recipes-daemons/proftpd/files/proftpd-sftp.patch
> +++ /dev/null
> @@ -1,142 +0,0 @@
> -proftpd/mod_sftp: fix too much memory allocation bug of mod_sftp
> -
> -This patch fixes the too much memory allocation bug of the mod_sftp by
> -ensuring both that a) the received response count matches the number of
> -challenges sent, and b) that the received response count is not too high
> -(as an additional sanity check); the upper bound is still set to 500.
> -
> -The patch is picked from: http://bugs.proftpd.org/show_bug.cgi?id=3D3973
> -
> -Upstream-Status: Backport CVE-2013-4359
> -
> -diff --git a/contrib/mod_sftp/kbdint.c b/contrib/mod_sftp/kbdint.c
> -index 0271fb2..de651fa 100644
> ---- a/contrib/mod_sftp/kbdint.c
> -+++ b/contrib/mod_sftp/kbdint.c
> -@@ -1,6 +1,6 @@
> - /*
> -  * ProFTPD - mod_sftp keyboard-interactive driver mgmt
> -- * Copyright (c) 2008-2009 TJ Saunders
> -+ * Copyright (c) 2008-2013 TJ Saunders
> -  *
> -  * This program is free software; you can redistribute it and/or modify
> -  * it under the terms of the GNU General Public License as published by
> -@@ -31,6 +31,8 @@
> - #include "utf8.h"
> - #include "kbdint.h"
> -=20
> -+#define SFTP_KBDINT_MAX_RESPONSES	500
> -+
> - struct kbdint_driver {
> -   struct kbdint_driver *next, *prev;
> -=20
> -@@ -252,8 +254,8 @@ int sftp_kbdint_send_challenge(const char *user, con=
st char *instruction,
> -   return res;
> - }
> -=20
> --int sftp_kbdint_recv_response(pool *p, unsigned int *count,
> --    const char ***responses) {
> -+int sftp_kbdint_recv_response(pool *p, unsigned int expected_count,
> -+    unsigned int *rcvd_count, const char ***responses) {
> -   register unsigned int i;
> -   char *buf;
> -   cmd_rec *cmd;
> -@@ -264,7 +266,7 @@ int sftp_kbdint_recv_response(pool *p, unsigned int =
*count,
> -   int res;
> -=20
> -   if (p =3D=3D NULL ||
> --      count =3D=3D NULL ||
> -+      rcvd_count =3D=3D NULL ||
> -       responses =3D=3D NULL) {
> -     errno =3D EINVAL;
> -     return -1;
> -@@ -299,6 +301,29 @@ int sftp_kbdint_recv_response(pool *p, unsigned int=
 *count,
> -=20
> -   resp_count =3D sftp_msg_read_int(pkt->pool, &buf, &buflen);
> -=20
> -+  /* Ensure that the number of responses sent by the client is the same
> -+   * as the number of challenges sent, lest a malicious client attempt =
to
> -+   * trick us into allocating too much memory (Bug#3973).
> -+   */
> -+  if (resp_count !=3D expected_count) {
> -+    (void) pr_log_writefile(sftp_logfd, MOD_SFTP_VERSION,
> -+      "sent %lu %s, but received %lu %s", (unsigned long) expected_coun=
t,
> -+      expected_count !=3D 1 ? "challenges" : "challenge",
> -+      (unsigned long) resp_count, resp_count !=3D 1 ? "responses" : "re=
sponse");
> -+    destroy_pool(pkt->pool);
> -+    errno =3D EPERM;
> -+    return -1;
> -+  }
> -+
> -+  if (resp_count > SFTP_KBDINT_MAX_RESPONSES) {
> -+    (void) pr_log_writefile(sftp_logfd, MOD_SFTP_VERSION,
> -+      "received too many responses (%lu > max %lu), rejecting",
> -+      (unsigned long) resp_count, (unsigned long) SFTP_KBDINT_MAX_RESPO=
NSES);
> -+    destroy_pool(pkt->pool);
> -+    errno =3D EPERM;
> -+    return -1;
> -+  }
> -+
> -   list =3D make_array(p, resp_count, sizeof(char *));
> -   for (i =3D 0; i < resp_count; i++) {
> -     char *resp;
> -@@ -307,7 +332,7 @@ int sftp_kbdint_recv_response(pool *p, unsigned int =
*count,
> -     *((char **) push_array(list)) =3D pstrdup(p, sftp_utf8_decode_str(p=
, resp));
> -   }
> -=20
> --  *count =3D (unsigned int) resp_count;
> -+  *rcvd_count =3D (unsigned int) resp_count;
> -   *responses =3D ((const char **) list->elts);
> -   return 0;
> - }
> -diff --git a/contrib/mod_sftp/mod_sftp.h.in b/contrib/mod_sftp/mod_sftp.=
h.in
> -index 3e91390..c547be0 100644
> ---- a/contrib/mod_sftp/mod_sftp.h.in
> -+++ b/contrib/mod_sftp/mod_sftp.h.in
> -@@ -1,6 +1,6 @@
> - /*
> -  * ProFTPD - mod_sftp
> -- * Copyright (c) 2008-2011 TJ Saunders
> -+ * Copyright (c) 2008-2013 TJ Saunders
> -  *
> -  * This program is free software; you can redistribute it and/or modify
> -  * it under the terms of the GNU General Public License as published by
> -@@ -174,7 +174,8 @@ int sftp_kbdint_register_driver(const char *name, sf=
tp_kbdint_driver_t *driver);
> - int sftp_kbdint_unregister_driver(const char *name);
> - int sftp_kbdint_send_challenge(const char *, const char *, unsigned int,
> -   sftp_kbdint_challenge_t *);
> --int sftp_kbdint_recv_response(pool *, unsigned int *, const char ***);
> -+int sftp_kbdint_recv_response(pool *, unsigned int, unsigned int *,
> -+  const char ***);
> -=20
> - /* API for modules that which to register keystores, for the
> -  * SFTPAuthorizedHostKeys and SFTPAuthorizedUserKeys directives.
> -diff --git a/contrib/mod_sftp_pam.c b/contrib/mod_sftp_pam.c
> -index 6c32df0..81aa113 100644
> ---- a/contrib/mod_sftp_pam.c
> -+++ b/contrib/mod_sftp_pam.c
> -@@ -179,22 +179,13 @@ static int sftppam_converse(int nmsgs, PR_PAM_CONS=
T struct pam_message **msgs,
> -     return PAM_CONV_ERR;
> -   }
> -=20
> --  if (sftp_kbdint_recv_response(sftppam_driver.driver_pool, &recvd_coun=
t,
> --      &recvd_responses) < 0) {
> -+  if (sftp_kbdint_recv_response(sftppam_driver.driver_pool, list->nelts,
> -+      &recvd_count, &recvd_responses) < 0) {
> -     pr_trace_msg(trace_channel, 3,
> -       "error receiving keyboard-interactive responses: %s", strerror(er=
rno));
> -     return PAM_CONV_ERR;
> -   }
> -=20
> --  /* Make sure that the count of responses matches the challenge count.=
 */
> --  if (recvd_count !=3D list->nelts) {
> --    (void) pr_log_writefile(sftp_logfd, MOD_SFTP_PAM_VERSION,
> --      "sent %d %s, but received %u %s", nmsgs,
> --      list->nelts !=3D 1 ? "challenges" : "challenge", recvd_count,
> --      recvd_count !=3D 1 ? "responses" : "response");
> --    return PAM_CONV_ERR;
> --  }
> --
> -   res =3D calloc(nmsgs, sizeof(struct pam_response));
> -   if (res =3D=3D NULL) {
> -     pr_log_pri(PR_LOG_CRIT, "Out of memory!");
> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b/=
meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> similarity index 51%
> rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> index a5e766a..cba39e8 100644
> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> @@ -4,31 +4,60 @@ HOMEPAGE =3D "http://www.proftpd.org"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfb0d1484d11915fa88a6a7702f1dc=
184"
> =20
> -PR =3D "r4"
> -
>  SRC_URI =3D "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
> -           file://make.patch \
>             file://basic.conf.patch \
> -           file://contrib.patch \
>             file://proftpd-basic.init \
>             file://default \
> -           file://move-pidfile-to-var-run.patch \
>             file://close-RequireValidShell-check.patch \
> -           file://move-runfile-to-var-run.patch \
> -           file://proftpd-sftp.patch \
> -"
> +           file://contrib.patch  \
> +           file://build_fixup.patch \
> +           "
> =20
> -SRC_URI[md5sum] =3D "0871e0b93c9c3c88ca950b6d9a04aed2"
> -SRC_URI[sha256sum] =3D "9f659585cea90fc6af34a0ffae4a90e4ed37abe92dbd9b6c=
311f95a436c961cb"
> +SRC_URI[md5sum] =3D "aff1bff40e675244d72c4667f203e5bb"
> +SRC_URI[sha256sum] =3D "c10316fb003bd25eccbc08c77dd9057e053693e6527ffa2e=
a2cc4e08ccb87715"
> =20
>  inherit autotools-brokensep useradd update-rc.d
> =20
> -PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG[curses] =3D "--enable-curses --enable-ncurses,--disable-cu=
rses --disable-ncurses,ncurses"
> +PACKAGECONFIG ??=3D "sia shadow"
> +PACKAGECONFIG +=3D " ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ip=
v6', '', d)}"
> +PACKAGECONFIG +=3D " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam=
', '', d)}"
> +
> +PACKAGECONFIG[curses] =3D "--enable-curses --enable-ncurses, --disable-c=
urses --disable-ncurses, ncurses"
> +PACKAGECONFIG[openssl] =3D "--enable-openssl, --disable-openssl, openssl=
, openssl"
> +PACKAGECONFIG[pam] =3D "--enable-auth-pam, --disable-auth-pam, libpam, l=
ibpam"
> +PACKAGECONFIG[ipv6] =3D "--enable-ipv6, --disable-ipv6"
> +PACKAGECONFIG[shadow] =3D "--enable-shadow, --disable-shadow"
> +PACKAGECONFIG[pcre] =3D "--enable-pcre, --disable-pcre, libpcre "
> +
> +# enable POSIX.1e capabilities
> +PACKAGECONFIG[cap] =3D "--enable-cap, --disable-cap, libcap, libcap"
> +
> +#enable support for POSIX ACLs
> +PACKAGECONFIG[acl] =3D "--enable-facl, --disable-facl"
> +
> +#enable proftpd controls via ftpdct
> +PACKAGECONFIG[ctrls] =3D "--enable-ctrls, --disable-crtls"
> +
> +#prevent proftpd from using its bundled getopt implementation.
> +PACKAGECONFIG[getopt] =3D "--with-getopt, --without-getopt"
> +
> +#do not strip debugging symbols from installed code
> +PACKAGECONFIG[strip] =3D "--enable-strip, --disable-strip"
> +
> +#enable SIA authentication support (Tru64)
> +PACKAGECONFIG[sia] =3D "--enable-sia, --disable-sia"
> +PACKAGECONFIG[sendfile] =3D "-enable-sendfile, --disable-sendfile"
> +
> +#enable Native Language Support (NLS)
> +PACKAGECONFIG[nls] =3D "--enable-nls, --disable-nls"
> +
> +#add mod_dso to core modules
> +PACKAGECONFIG[dso] =3D "--enable-dso, --disable-dso"
> +PACKAGECONFIG[largefile] =3D "--enable-largefile, --disable-largefile"
> +
> +#omit mod_auth_file from core modules
> +PACKAGECONFIG[auth] =3D "--enable-auth-file, --disable-auth-file"
> =20
> -EXTRA_OECONF =3D "--disable-cap \
> -                --disable-auth-pam \
> -"
> =20
>  # proftpd uses libltdl which currently makes configuring using
>  # autotools.bbclass a pain...
--=20
-Joe MacDonald.
:wq

--RE3pQJLXZi4fr8Xo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUobUAAAoJEEn8ffcsOfaWKfEH/2K1aw3mz6bOmpeuhQCCys6E
3ejh/O/iKi/pofGR6I5MgMqHKWT1FDku3DAW/6lPTESFUbAOJFY0S9AwzqUIViRv
51LCFpMqT34P/f1zaGkbz9raSAkqzBKGCEMRGmYOvMfT7juuE29m74lJ2fFWh0L4
10nAntefoRTOFcNlk3S/nRq7H7ekdY4w8sxCXx8d/yQ/ljqoVpkwtLeXRtHnCwu/
ztMzP93z+S7kLd8+v7kL2cWzOgTzBwM2g7wqq+wNYllUn5f9h8oJe8S0hfOYHaZv
2XleBlbxU5qkJHsmS0/X05XG8HABPq7o4k4FH92I/fcexUEi+f9sxhv1gM8W60s=
=IPaG
-----END PGP SIGNATURE-----

--RE3pQJLXZi4fr8Xo--
