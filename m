Return-Path: <alex.kiernan@gmail.com>
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
	[209.85.166.181])
	by mail.openembedded.org (Postfix) with ESMTP id C29EE7F890
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 08:05:45 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id s75so17397355ilc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Nov 2019 00:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=o3mUUXHRGd8BuN+A7aR6gwTF77yOQFncymRODsY9+L0=;
	b=jajXsEk0C1xw4yI7fQsju6ousNcioASdPWht3ZuBRoNNJFahe3CsCOPYKgqfDS3dGw
	koWodeyCN+Zu8Qb7pUeU9I2+oEyj/LuJb5vhw7CVX7GwM+/842Kk7CQE71ZkKFtRrtS4
	vpIQ7tG13PKd01EAiaEZHbwxdXoXeoSL6u9k0HOf7jyhM0sy4IpsAWKb4KaduD5HNM/D
	x4GzJFZ8slBVuO6EbnxfnGEr+qrNyUv9/woyOq1ZXkwhnCQ7Y+VP43XdqXo0d4FKpOqW
	QK52YPQj6GJizNJxYXC2z8/OIKoNzWlG5A23fqpaSWsbQBXwSZ1wRDWKJ3DLSFGyx+fM
	L6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o3mUUXHRGd8BuN+A7aR6gwTF77yOQFncymRODsY9+L0=;
	b=bAm0EqLsZMuk5CP9bS5MlZQYyp82jTrYz0jQP31kjwgh+OSjgre/qokkRnLraE62Ox
	iupWsEAl+lUobVzRsEMdiDaFxUFGKitin666SWrNdPEKaqJoZEAoJPnqFecA95kKLp1y
	5SXyy3rqiCcIQR0AhRExMTplyR0swEn0apcTdOQQ9xkvBso0FXBZg2M18FADZ84vKL3g
	vAZ7+dnzhpYdcoo60/voq4U0aoEQpaTy+Z8zOaFwVnpjFfduCLKAIeiRbn67vXyqJove
	5UqyxfXkbMAOZBmDBLINNWfQkAbG2xHQCBXaJIfgXw8QdemQZsVsX7JmrnM/wAw7xHjZ
	+XHA==
X-Gm-Message-State: APjAAAU++BzcaQoQTiNN0pQzKRFwZE4Yzmf3dRPmK7Chp8q7/7FjUS1Z
	9rcsn4+MOO1yWf+HWqHwOhLH7vzL8iKqM8Y4q8M=
X-Google-Smtp-Source: APXvYqx07dVWGPN+H12Ha0J2K778BxSkpRS6jxCe1rZ9BUeq3UAa0SlV3dyfaeQUzMZiCS05+zBJqnAsuVWCeig9178=
X-Received: by 2002:a92:9c1a:: with SMTP id h26mr33478354ili.295.1572941146369;
	Tue, 05 Nov 2019 00:05:46 -0800 (PST)
MIME-Version: 1.0
References: <20191104210829.65166-1-alex.kiernan@gmail.com>
	<CAMKF1srLHO74UVzfCz0-s2msrUrQGst3B1tO1e+ZM3=VWohSaA@mail.gmail.com>
In-Reply-To: <CAMKF1srLHO74UVzfCz0-s2msrUrQGst3B1tO1e+ZM3=VWohSaA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 5 Nov 2019 08:05:34 +0000
Message-ID: <CAO5Uq5Tw1BdP0Wc8BwObQGVTmwrMaO82u02cknxKDWR=cNZzAQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 1/2] ostree: Add support for ptest
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Nov 2019 08:05:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 5, 2019 at 6:00 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> with ptest enabled I am seeing
>
> https://errors.yoctoproject.org/Errors/Details/275345/
>

I wonder if that's a make race as there's no `mkdir -p tests/` inside
that make target. Can you point me at config so I can see I can
reproduce it (though I've no 44 way boxes handy to test your build
flags on!)

> On Mon, Nov 4, 2019 at 1:08 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> > Move ostree-trivial-httpd to its own package so we can RDEPEND on it in both
> > the main ostree and ptest packages. Drop the patches to remove
> > ostree-trivial-httpd based on --enable-trivial-httpd-cmdline as they break
> > installed tests (and were reverted upstream).
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> > Changes in v2:
> > - include ptest changes against 2019.4 so can we remove the
> >   BUILDOPT_TRIVIAL_HTTPD changes before upgrading to 2019.5 as they were
> >   reverted upstream
> >
> >  ...lways-enable-trivial-httpd-for-tests.patch | 59 -------------------
> >  ...-EPIPE-failures-when-head-terminates.patch | 51 ++++++++++++++++
> >  ...-core-Fallback-to-en_US.UTF-8-locale.patch | 42 +++++++++++++
> >  ...vial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch | 51 ----------------
> >  ...Assume-C.UTF-8-if-locale-isn-t-found.patch | 40 +++++++++++++
> >  ...3-tests-Avoid-musl-failure-with-cp-a.patch | 52 ++++++++++++++++
> >  .../recipes-extended/ostree/ostree/run-ptest  |  3 +
> >  .../recipes-extended/ostree/ostree_2019.4.bb  | 44 ++++++++++++--
> >  8 files changed, 227 insertions(+), 115 deletions(-)
> >  delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-Always-enable-trivial-httpd-for-tests.patch
> >  create mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-tests-Handle-EPIPE-failures-when-head-terminates.patch
> >  create mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-tests-core-Fallback-to-en_US.UTF-8-locale.patch
> >  delete mode 100644 meta-oe/recipes-extended/ostree/ostree/0002-Gate-ostree-trivial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch
> >  create mode 100644 meta-oe/recipes-extended/ostree/ostree/0002-tests-core-Assume-C.UTF-8-if-locale-isn-t-found.patch
> >  create mode 100644 meta-oe/recipes-extended/ostree/ostree/0003-tests-Avoid-musl-failure-with-cp-a.patch
> >  create mode 100644 meta-oe/recipes-extended/ostree/ostree/run-ptest
> >
> > diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-Always-enable-trivial-httpd-for-tests.patch b/meta-oe/recipes-extended/ostree/ostree/0001-Always-enable-trivial-httpd-for-tests.patch
> > deleted file mode 100644
> > index c9e1306afde0..000000000000
> > --- a/meta-oe/recipes-extended/ostree/ostree/0001-Always-enable-trivial-httpd-for-tests.patch
> > +++ /dev/null
> > @@ -1,59 +0,0 @@
> > -From 44e0647230b22cd136ae2fb252ce90eed4751970 Mon Sep 17 00:00:00 2001
> > -From: Alex Kiernan <alex.kiernan@gmail.com>
> > -Date: Wed, 4 Sep 2019 17:29:15 +0100
> > -Subject: [PATCH 1/2] Always enable trivial-httpd for tests
> > -
> > -When running tests we always need ostree-trivial-httpd, so enable it
> > -unconditionally
> > -
> > -Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > -Upstream-Status: Submitted [https://github.com/ostreedev/ostree/pull/1912]
> > ----
> > - Makefile.am        | 1 +
> > - ci/build.sh        | 5 +++++
> > - ci/travis-build.sh | 1 +
> > - 3 files changed, 7 insertions(+)
> > -
> > -diff --git a/Makefile.am b/Makefile.am
> > -index cd04a055045a..673dbf88de55 100644
> > ---- a/Makefile.am
> > -+++ b/Makefile.am
> > -@@ -39,6 +39,7 @@ AM_DISTCHECK_CONFIGURE_FLAGS += \
> > -       --enable-gtk-doc \
> > -       --enable-man \
> > -       --disable-maintainer-mode \
> > -+      --enable-trivial-httpd-cmdline \
> > -       $(NULL)
> > -
> > - GITIGNOREFILES = aclocal.m4 build-aux/ buildutil/*.m4 config.h.in gtk-doc.make
> > -diff --git a/ci/build.sh b/ci/build.sh
> > -index 0901507498f2..806af050b780 100755
> > ---- a/ci/build.sh
> > -+++ b/ci/build.sh
> > -@@ -22,6 +22,11 @@ case "${CONFIGOPTS:-}" in
> > -         fi
> > -         ;;
> > - esac
> > -+# unless libsoup is disabled, enable trivial-httpd for the tests
> > -+case "${CONFIGOPTS:-}" in
> > -+    *--without-soup*) ;;
> > -+    *) CONFIGOPTS="${CONFIGOPTS:-} --enable-trivial-httpd-cmdline" ;;
> > -+esac
> > -
> > - # always fail on warnings; https://github.com/ostreedev/ostree/pull/971
> > - # NB: this disables the default set of flags from configure.ac
> > -diff --git a/ci/travis-build.sh b/ci/travis-build.sh
> > -index 3fd969bdced6..7c85313a2d32 100755
> > ---- a/ci/travis-build.sh
> > -+++ b/ci/travis-build.sh
> > -@@ -85,6 +85,7 @@ make="make -j${ci_parallel} V=1 VERBOSE=1"
> > -
> > - ../configure \
> > -     --enable-always-build-tests \
> > -+    --enable-trivial-httpd-cmdline \
> > -     ${ci_configopts}
> > -     "$@"
> > -
> > ---
> > -2.17.1
> > -
> > diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-tests-Handle-EPIPE-failures-when-head-terminates.patch b/meta-oe/recipes-extended/ostree/ostree/0001-tests-Handle-EPIPE-failures-when-head-terminates.patch
> > new file mode 100644
> > index 000000000000..fdb733ebe4f2
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/ostree/ostree/0001-tests-Handle-EPIPE-failures-when-head-terminates.patch
> > @@ -0,0 +1,51 @@
> > +From fb519f0361565cad0d340095263a1e8866ec4f89 Mon Sep 17 00:00:00 2001
> > +From: Alex Kiernan <alex.kiernan@gmail.com>
> > +Date: Thu, 31 Oct 2019 11:30:00 +0000
> > +Subject: [PATCH 1/3] tests: Handle EPIPE failures when head terminates
> > +
> > +When using musl, it appears that the default is line buffered output, so
> > +when `head -1` reads from a pipe we have to handle the source end of the
> > +pipe getting EPIPE.
> > +
> > +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > +Upstream-Status: Accepted [v2019.6]
> > +---
> > + tests/pull-test.sh            | 2 +-
> > + tests/test-pull-mirrorlist.sh | 4 ++--
> > + 2 files changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/tests/pull-test.sh b/tests/pull-test.sh
> > +index 0a97a1195582..2cfd8e02f790 100644
> > +--- a/tests/pull-test.sh
> > ++++ b/tests/pull-test.sh
> > +@@ -177,7 +177,7 @@ if ! skip_one_without_user_xattrs; then
> > +     ${CMD_PREFIX} ostree --repo=cacherepo pull-local ostree-srv/gnomerepo main
> > +     rev=$(ostree --repo=cacherepo rev-parse main)
> > +     ${CMD_PREFIX} ostree --repo=cacherepo ls -R -C main > ls.txt
> > +-    regfile_hash=$(grep -E -e '^-0' ls.txt | head -1 | awk '{ print $5 }')
> > ++    regfile_hash=$((grep -E -e '^-0' ls.txt || true) | head -1 | awk '{ print $5 }')
> > +     ${CMD_PREFIX} ostree --repo=repo remote add --set=gpg-verify=false corruptrepo $(cat httpd-address)/ostree/corruptrepo
> > +     # Make this a loop so in the future we can add more object types like commit etc.
> > +     for object in ${regfile_hash}.file; do
> > +diff --git a/tests/test-pull-mirrorlist.sh b/tests/test-pull-mirrorlist.sh
> > +index 4e44852d3971..85ff66e99f8e 100755
> > +--- a/tests/test-pull-mirrorlist.sh
> > ++++ b/tests/test-pull-mirrorlist.sh
> > +@@ -47,12 +47,12 @@ setup_mirror content_mirror3
> > +
> > + # Let's delete a file from 1 so that it falls back on 2
> > + cd ${test_tmpdir}/content_mirror1/ostree/gnomerepo
> > +-filez=$(find objects/ -name '*.filez' | head -n 1)
> > ++filez=$((find objects/ -name '*.filez' || true) | head -n 1)
> > + rm ${filez}
> > +
> > + # Let's delete a file from 1 and 2 so that it falls back on 3
> > + cd ${test_tmpdir}/content_mirror1/ostree/gnomerepo
> > +-filez=$(find objects/ -name '*.filez' | head -n 1)
> > ++filez=$((find objects/ -name '*.filez' || true) | head -n 1)
> > + rm ${filez}
> > + cd ${test_tmpdir}/content_mirror2/ostree/gnomerepo
> > + rm ${filez}
> > +--
> > +2.17.1
> > +
> > diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-tests-core-Fallback-to-en_US.UTF-8-locale.patch b/meta-oe/recipes-extended/ostree/ostree/0001-tests-core-Fallback-to-en_US.UTF-8-locale.patch
> > new file mode 100644
> > index 000000000000..dcafb0995784
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/ostree/ostree/0001-tests-core-Fallback-to-en_US.UTF-8-locale.patch
> > @@ -0,0 +1,42 @@
> > +From 4d17cd917fe4fb67d2f9e4881b6693ac7289f423 Mon Sep 17 00:00:00 2001
> > +From: Alex Kiernan <alex.kiernan@gmail.com>
> > +Date: Wed, 30 Oct 2019 07:55:41 +0000
> > +Subject: [PATCH 1/4] tests/core: Fallback to en_US.UTF-8 locale
> > +
> > +A number of tests expect explicit left/right single quotes in their
> > +messages, which will never happen in the C locale. Change so we pick a
> > +likely UTF-8 locale, or fail if we can't find one.
> > +
> > +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > +Upstream-Status: Accepted [v2019.6]
> > +---
> > + tests/libtest-core.sh | 12 ++++--------
> > + 1 file changed, 4 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/tests/libtest-core.sh b/tests/libtest-core.sh
> > +index f6f94288fc61..bc191332c916 100644
> > +--- a/tests/libtest-core.sh
> > ++++ b/tests/libtest-core.sh
> > +@@ -35,15 +35,11 @@ assert_not_reached () {
> > + }
> > +
> > + # Some tests look for specific English strings. Use a UTF-8 version
> > +-# of the C (POSIX) locale if we have one, or fall back to POSIX
> > ++# of the C (POSIX) locale if we have one, or fall back to en_US.UTF-8
> > + # (https://sourceware.org/glibc/wiki/Proposals/C.UTF-8)
> > +-if locale -a | grep '^C.UTF-8$' >/dev/null; then
> > +-    export LC_ALL=C.UTF-8
> > +-elif locale -a | grep '^C.utf8$' >/dev/null; then
> > +-    export LC_ALL=C.utf8
> > +-else
> > +-    export LC_ALL=C
> > +-fi
> > ++export LC_ALL=$(locale -a | grep -Ee '\.(UTF-8|utf8)' | grep -iEe '^(C|en_US)' | head -1 || true)
> > ++if [ -z "${LC_ALL}" ]; then fatal "Can't find suitable UTF-8 locale"; fi
> > ++
> > + # A GNU extension, used whenever LC_ALL is not C
> > + unset LANGUAGE
> > +
> > +--
> > +2.17.1
> > +
> > diff --git a/meta-oe/recipes-extended/ostree/ostree/0002-Gate-ostree-trivial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch b/meta-oe/recipes-extended/ostree/ostree/0002-Gate-ostree-trivial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch
> > deleted file mode 100644
> > index 362b2f36ab51..000000000000
> > --- a/meta-oe/recipes-extended/ostree/ostree/0002-Gate-ostree-trivial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch
> > +++ /dev/null
> > @@ -1,51 +0,0 @@
> > -From 2629328b39ae117876f4854409c2231220a30b9c Mon Sep 17 00:00:00 2001
> > -From: Alex Kiernan <alex.kiernan@gmail.com>
> > -Date: Thu, 5 Sep 2019 13:22:15 +0100
> > -Subject: [PATCH 2/2] Gate ostree-trivial-httpd on BUILDOPT_TRIVIAL_HTTPD
> > -
> > -When building without --enable-trivial-httpd-cmdline, don't build or install
> > -the ostree-trivial-httpd binary.
> > -
> > -Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > -Upstream-Status: Submitted [https://github.com/ostreedev/ostree/pull/1912]
> > ----
> > - Makefile-ostree.am | 3 ++-
> > - configure.ac       | 3 +++
> > - 2 files changed, 5 insertions(+), 1 deletion(-)
> > -
> > -diff --git a/Makefile-ostree.am b/Makefile-ostree.am
> > -index 76f39cad4b74..7b53cb148960 100644
> > ---- a/Makefile-ostree.am
> > -+++ b/Makefile-ostree.am
> > -@@ -143,12 +143,13 @@ ostree_SOURCES += src/ostree/ot-builtin-pull.c
> > - endif
> > -
> > - if USE_LIBSOUP
> > --# Eventually once we stop things from using this, we should support disabling this
> > -+if BUILDOPT_TRIVIAL_HTTPD
> > - ostree_SOURCES += src/ostree/ot-builtin-trivial-httpd.c
> > - pkglibexec_PROGRAMS += ostree-trivial-httpd
> > - ostree_trivial_httpd_SOURCES = src/ostree/ostree-trivial-httpd.c
> > - ostree_trivial_httpd_CFLAGS = $(ostree_bin_shared_cflags) $(OT_INTERNAL_SOUP_CFLAGS)
> > - ostree_trivial_httpd_LDADD = $(ostree_bin_shared_ldadd) $(OT_INTERNAL_SOUP_LIBS)
> > -+endif
> > -
> > - if !USE_CURL
> > - # This is necessary for the cookie jar bits
> > -diff --git a/configure.ac b/configure.ac
> > -index 069bab01752e..ffc67980d507 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -192,6 +192,9 @@ AC_ARG_ENABLE(trivial-httpd-cmdline,
> > -   [Continue to support "ostree trivial-httpd" [default=no]])],,
> > -   enable_trivial_httpd_cmdline=no)
> > - AM_CONDITIONAL(BUILDOPT_TRIVIAL_HTTPD, test x$enable_trivial_httpd_cmdline = xyes)
> > -+AS_IF([test x$with_soup = xno && test x$enable_trivial_httpd_cmdline = xyes], [
> > -+  AC_MSG_ERROR([trivial-httpd enabled, but libsoup is not; libsoup is needed for trivial-httpd])
> > -+])
> > - AM_COND_IF(BUILDOPT_TRIVIAL_HTTPD,
> > -   [AC_DEFINE([BUILDOPT_ENABLE_TRIVIAL_HTTPD_CMDLINE], 1, [Define if we are enabling ostree trivial-httpd entrypoint])]
> > - )
> > ---
> > -2.17.1
> > -
> > diff --git a/meta-oe/recipes-extended/ostree/ostree/0002-tests-core-Assume-C.UTF-8-if-locale-isn-t-found.patch b/meta-oe/recipes-extended/ostree/ostree/0002-tests-core-Assume-C.UTF-8-if-locale-isn-t-found.patch
> > new file mode 100644
> > index 000000000000..5ab9c8f6d75c
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/ostree/ostree/0002-tests-core-Assume-C.UTF-8-if-locale-isn-t-found.patch
> > @@ -0,0 +1,40 @@
> > +From 3d48021fb0892721fab8359b49470e521aaed493 Mon Sep 17 00:00:00 2001
> > +From: Alex Kiernan <alex.kiernan@gmail.com>
> > +Date: Thu, 31 Oct 2019 11:28:07 +0000
> > +Subject: [PATCH 2/3] tests/core: Assume C.UTF-8 if locale isn't found
> > +
> > +When building with musl there's no locale command, also its default
> > +locale is C.UTF-8, so just get C.UTF-8 if we can't find locale.
> > +
> > +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > +Upstream-Status: Accepted [v2019.6]
> > +---
> > + tests/libtest-core.sh | 12 +++++++++---
> > + 1 file changed, 9 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/tests/libtest-core.sh b/tests/libtest-core.sh
> > +index bc191332c916..46aafab03cc8 100644
> > +--- a/tests/libtest-core.sh
> > ++++ b/tests/libtest-core.sh
> > +@@ -37,9 +37,15 @@ assert_not_reached () {
> > + # Some tests look for specific English strings. Use a UTF-8 version
> > + # of the C (POSIX) locale if we have one, or fall back to en_US.UTF-8
> > + # (https://sourceware.org/glibc/wiki/Proposals/C.UTF-8)
> > +-export LC_ALL=$(locale -a | grep -Ee '\.(UTF-8|utf8)' | grep -iEe '^(C|en_US)' | head -1 || true)
> > +-if [ -z "${LC_ALL}" ]; then fatal "Can't find suitable UTF-8 locale"; fi
> > +-
> > ++#
> > ++# If we can't find the locale command assume we have support for C.UTF-8
> > ++# (e.g. musl based systems)
> > ++if type -p locale >/dev/null; then
> > ++    export LC_ALL=$(locale -a | grep -Ee '\.(UTF-8|utf8)' | grep -iEe '^(C|en_US)' | head -1 || true)
> > ++    if [ -z "${LC_ALL}" ]; then fatal "Can't find suitable UTF-8 locale"; fi
> > ++else
> > ++    export LC_ALL=C.UTF-8
> > ++fi
> > + # A GNU extension, used whenever LC_ALL is not C
> > + unset LANGUAGE
> > +
> > +--
> > +2.17.1
> > +
> > diff --git a/meta-oe/recipes-extended/ostree/ostree/0003-tests-Avoid-musl-failure-with-cp-a.patch b/meta-oe/recipes-extended/ostree/ostree/0003-tests-Avoid-musl-failure-with-cp-a.patch
> > new file mode 100644
> > index 000000000000..834617c12d96
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/ostree/ostree/0003-tests-Avoid-musl-failure-with-cp-a.patch
> > @@ -0,0 +1,52 @@
> > +From abf1a7392b2fa1945286a39a35190d74fe141e52 Mon Sep 17 00:00:00 2001
> > +From: Alex Kiernan <alex.kiernan@gmail.com>
> > +Date: Thu, 31 Oct 2019 17:09:36 +0000
> > +Subject: [PATCH 3/3] tests: Avoid musl failure with `cp -a`
> > +
> > +When copying the tree, using musl and GNU coreutils, something gets confused
> > +when setting the ownership of symlinks and the copy fails with:
> > +
> > +  cp: failed to preserve ownership for osdata-devel/bin: Not supported
> > +
> > +Rework using tar to avoid the problem.
> > +
> > +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > +Upstream-Status: Accepted [v2019.6]
> > +---
> > + tests/libtest.sh        | 4 +++-
> > + tests/test-admin-gpg.sh | 4 +++-
> > + 2 files changed, 6 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/tests/libtest.sh b/tests/libtest.sh
> > +index ba00073a10a7..3f5fd931bc1e 100755
> > +--- a/tests/libtest.sh
> > ++++ b/tests/libtest.sh
> > +@@ -440,7 +440,9 @@ EOF
> > +     ${CMD_PREFIX} ostree --repo=${test_tmpdir}/testos-repo commit --add-metadata-string version=1.0.10 -b testos/buildmaster/x86_64-runtime -s "Build"
> > +
> > +     cd ${test_tmpdir}
> > +-    cp -a osdata osdata-devel
> > ++    rm -rf osdata-devel
> > ++    mkdir osdata-devel
> > ++    tar -C osdata -cf - . | tar -C osdata-devel -xf -
> > +     cd osdata-devel
> > +     mkdir -p usr/include
> > +     echo "a development header" > usr/include/foo.h
> > +diff --git a/tests/test-admin-gpg.sh b/tests/test-admin-gpg.sh
> > +index 1f50c8a9a508..dc776743776c 100755
> > +--- a/tests/test-admin-gpg.sh
> > ++++ b/tests/test-admin-gpg.sh
> > +@@ -90,7 +90,9 @@ EOF
> > +     ${CMD_PREFIX} ostree --repo=${test_tmpdir}/testos-repo commit --add-metadata-string version=1.0.10 -b testos/buildmaster/x86_64-runtime -s "Build" --gpg-sign=$keyid --gpg-homedir=${test_tmpdir}/gpghome
> > +
> > +     cd ${test_tmpdir}
> > +-    cp -a osdata osdata-devel
> > ++    rm -rf osdata-devel
> > ++    mkdir osdata-devel
> > ++    tar -C osdata -cf - . | tar -C osdata-devel -xf -
> > +     cd osdata-devel
> > +     mkdir -p usr/include
> > +     echo "a development header" > usr/include/foo.h
> > +--
> > +2.17.1
> > +
> > diff --git a/meta-oe/recipes-extended/ostree/ostree/run-ptest b/meta-oe/recipes-extended/ostree/ostree/run-ptest
> > new file mode 100644
> > index 000000000000..963d1f69285d
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/ostree/ostree/run-ptest
> > @@ -0,0 +1,3 @@
> > +#! /bin/sh
> > +
> > +gnome-desktop-testing-runner libostree
> > diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.4.bb b/meta-oe/recipes-extended/ostree/ostree_2019.4.bb
> > index 505c9fcccc59..4be02220af87 100644
> > --- a/meta-oe/recipes-extended/ostree/ostree_2019.4.bb
> > +++ b/meta-oe/recipes-extended/ostree/ostree_2019.4.bb
> > @@ -25,8 +25,11 @@ PREMIRRORS = ""
> >  SRC_URI = " \
> >      gitsm://github.com/ostreedev/ostree \
> >      file://0001-macros-Add-TEMP_FAILURE_RETRY-for-musl.patch \
> > -    file://0001-Always-enable-trivial-httpd-for-tests.patch \
> > -    file://0002-Gate-ostree-trivial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch \
> > +    file://run-ptest \
> > +    file://0001-tests-core-Fallback-to-en_US.UTF-8-locale.patch \
> > +    file://0001-tests-Handle-EPIPE-failures-when-head-terminates.patch \
> > +    file://0002-tests-core-Assume-C.UTF-8-if-locale-isn-t-found.patch \
> > +    file://0003-tests-Avoid-musl-failure-with-cp-a.patch \
> >  "
> >  SRCREV = "9d39e7d91e8497987cad69a3fbed5c5fc91eebdc"
> >
> > @@ -34,9 +37,9 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
> >
> >  S = "${WORKDIR}/git"
> >
> > -inherit autotools bash-completion gobject-introspection gtk-doc pkgconfig systemd
> > +inherit autotools bash-completion gobject-introspection gtk-doc pkgconfig ptest-gnome systemd
> >
> > -# package configuration - match ostree defaults, but without rofiles-fuse
> > +# Package configuration - match ostree defaults, but without rofiles-fuse
> >  # otherwise we introduce a dependendency on meta-filesystems
> >  PACKAGECONFIG ??= " \
> >      ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
> > @@ -107,6 +110,7 @@ PACKAGES += " \
> >      ${PN}-grub \
> >      ${PN}-mkinitcpio \
> >      ${PN}-switchroot \
> > +    ${PN}-trivial-httpd \
> >  "
> >
> >  FILES_${PN} = " \
> > @@ -118,7 +122,6 @@ FILES_${PN} = " \
> >      ${libdir}/girepository-1.0 \
> >      ${libdir}/lib*${SOLIBS} \
> >      ${libdir}/tmpfiles.d/ostree-tmpfiles.conf \
> > -    ${libexecdir}/libostree/ostree-trivial-httpd \
> >      ${sysconfdir}/ostree/remotes.d \
> >      ${systemd_unitdir}/system-generators/ostree-system-generator \
> >      ${systemd_unitdir}/system/ostree-finalize-staged.path \
> > @@ -141,17 +144,48 @@ FILES_${PN}-switchroot = " \
> >      ${libdir}/ostree/ostree-prepare-root \
> >      ${systemd_unitdir}/system/ostree-prepare-root.service \
> >  "
> > +FILES_${PN}-trivial-httpd = " \
> > +    ${libexecdir}/libostree/ostree-trivial-httpd \
> > +"
> >
> > +RDEPENDS_${PN} = " \
> > +    ${@bb.utils.contains('PACKAGECONFIG', 'trivial-httpd-cmdline', '${PN}-trivial-httpd', '', d)} \
> > +"
> >  RDEPENDS_${PN}-dracut = "bash"
> >  RDEPENDS_${PN}-mkinitcpio = "bash"
> >  RDEPENDS_${PN}_class-target = " \
> >      gnupg \
> >      ${PN}-switchroot \
> >  "
> > +RDEPENDS_${PN}-ptest += " \
> > +    attr \
> > +    bash \
> > +    coreutils \
> > +    cpio \
> > +    diffutils \
> > +    findutils \
> > +    grep \
> > +    python3-core \
> > +    python3-multiprocessing \
> > +    python3-pyyaml \
> > +    ${PN}-trivial-httpd \
> > +"
> > +RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils glibc-localedata-en-us"
> >
> >  RRECOMMENDS_${PN} += "kernel-module-overlay"
> > +RRECOMMENDS_${PN}-ptest += "strace"
> >
> >  SYSTEMD_SERVICE_${PN} = "ostree-remount.service ostree-finalize-staged.path"
> >  SYSTEMD_SERVICE_${PN}-switchroot = "ostree-prepare-root.service"
> >
> >  BBCLASSEXTEND = "native"
> > +
> > +python __anonymous() {
> > +    if bb.utils.contains('PTEST_ENABLED', '1', 'True', 'False', d):
> > +        if 'meta-python' not in d.getVar('BBFILE_COLLECTIONS').split():
> > +            raise bb.parse.SkipRecipe('ptest requires meta-python to be present.')
> > +        elif 'soup' not in d.getVar('PACKAGECONFIG').split():
> > +            raise bb.parse.SkipRecipe('ptest requires soup enabled in PACKAGECONFIG.')
> > +        elif not oe.utils.any_distro_features(d, "xattr"):
> > +            raise bb.parse.SkipRecipe('ptest requires xattr enabled in DISTRO_FEATURES.')
> > +}
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Alex Kiernan

