Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5C1D9789A3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 20:59:28 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id s13-v6so265733uad.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 13:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Kp9tpTe81D6bCUiNcIoxgDx6fyLgtvwjdfUW/Fa2M78=;
	b=axnJHE0Ca5iuOPXqLivVkg2UwmtcqpJ9f9km5JRak6tpKFCyiB+GvJht6PwuFBbXlu
	lKmyWVD+Qhty3w0YoFwewgZJLWnbwNmSoDU7rbZ4ucEzxZRCfzqCgOIePgVEnBVi/uAS
	6e+KhyrmVnSiY1Ew/OeWP8X+q2uFqCkxBghwmXvowGALK4YD0UJEtV0Yh4NJLwoA3ZVD
	fcgIVzvyjra4f6JBoc7RW36mgjl20CF884QqRkHOkwfzGFZ1O1aG24d9+rjXv31FdA69
	wSSvoki+pbmAc7b/2o0Z9+MF1ZCZ6CHEe/8Guh0aDwo2+dpN+4xWyUaMsMnqxhXEjSM2
	bgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Kp9tpTe81D6bCUiNcIoxgDx6fyLgtvwjdfUW/Fa2M78=;
	b=fAdyB8QpU006H6kuLhUyV0TbPDdnMahLQKz0jx1EJZsLifx6flwCjYuhQ5s6Olies7
	lmR+re8ZEo3/Wj091onFxiUEKDd+5wiJzo2OHmpQtdFwsdIP8+1UV98OdeTfdTddDSeN
	b31kCO9tBFbqWCcOa0262DfmEjb8Z6SfktB0cEWgTb1IIHQFjJTtKz6ebjI36gAa/AJn
	EN4NVKymIbBklNquJJlLnAnpfIQTBPZAuNGHbbbhwQrmJdVd67oNzIWfMN4aHKTtdVgl
	mxkp2PioGR4urCFQMEeqaQQQ0Gbqcl3CxgdJ1YLTTsdmSnfnvJ13RhoAtUSqLXhhiSmK
	w5/g==
X-Gm-Message-State: APt69E2hZALGWeXdsQ8eeocvpM/SMjyv72fhGDOhXmH8R4vP7iWCk7Ky
	ic2bGHQ1n/GaNGsGp75N6YWKzXz4kAtnILSOPTo=
X-Google-Smtp-Source: ADUXVKJ3vEmZ/7gxKuAKpIGdAJhr2Vh56KubhTorOaPqQSGikbw6c/B6BZFUTvSq4URNxUCDyduUuEeIEV7rsQZTKIg=
X-Received: by 2002:ab0:5323:: with SMTP id
	x32-v6mr1452663uax.139.1528837169021; 
	Tue, 12 Jun 2018 13:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20180607132109.23396-3-andrej.valek@siemens.com>
	<20180612103709.25990-1-andrej.valek@siemens.com>
In-Reply-To: <20180612103709.25990-1-andrej.valek@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jun 2018 13:59:03 -0700
Message-ID: <CAMKF1so6aoZnh43t7=W8d9+DpjNxr8HE4Dkie4gLpwn+x_dj_A@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] syslog-ng: update to 3.15.1
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
X-List-Received-Date: Tue, 12 Jun 2018 20:59:28 -0000
Content-Type: text/plain; charset="UTF-8"

Fails to build with qemux86_64/musl

In file included from
/mnt/a/oe/build/tmp/work/core2-64-bec-linux-musl/syslog-ng/3.15.1-r0/recipe-sysroot/usr/include/limits.h:8,
                 from
/mnt/a/oe/build/tmp/work/core2-64-bec-linux-musl/syslog-ng/3.15.1-r0/recipe-sysroot/usr/lib/glib-2.0/include/glibconfig.h:11,
                 from
/mnt/a/oe/build/tmp/work/core2-64-bec-linux-musl/syslog-ng/3.15.1-r0/recipe-sysroot/usr/include/glib-2.0/glib/gtypes.h:32,
                 from
/mnt/a/oe/build/tmp/work/core2-64-bec-linux-musl/syslog-ng/3.15.1-r0/recipe-sysroot/usr/include/glib-2.0/glib/galloca.h:32,
                 from
/mnt/a/oe/build/tmp/work/core2-64-bec-linux-musl/syslog-ng/3.15.1-r0/recipe-sysroot/usr/include/glib-2.0/glib.h:30,
                 from ../syslog-ng-3.15.1/lib/compat/glib.h:31,
                 from
../syslog-ng-3.15.1/lib/secret-storage/nondumpable-allocator.h:27,
                 from
../syslog-ng-3.15.1/lib/secret-storage/nondumpable-allocator.c:31:
../syslog-ng-3.15.1/lib/secret-storage/nondumpable-allocator.c: In
function 'nondumpable_buffer_alloc':
../syslog-ng-3.15.1/lib/secret-storage/nondumpable-allocator.c:107:9:
error: expected identifier or '(' before numeric constant
   gsize PAGESIZE = sysconf(_SC_PAGE_SIZE);
         ^~~~~~~~
On Tue, Jun 12, 2018 at 3:38 AM Andrej Valek <andrej.valek@siemens.com> wrote:
>
>  - Refresh and remove obsolete patches
>  - Implement SystemD service files handling
>   - splitted service into default
>  - Remove dependency to eventlog
>   - external libevtlog library linking was removed
>  - Version 3.15.1 supports OpenSSL 1.1
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  ...ry-leak-problem-when-HAVE_ENVIRON-defined.patch | 29 -----------------
>  ...c-add-option-enable-thread-tls-to-manage-.patch | 16 ++++-----
>  .../recipes-support/syslog-ng/files/syslog-ng.conf |  2 +-
>  .../syslog-ng.service-the-syslog-ng-service.patch  | 38 +++++++++++++++-------
>  meta-oe/recipes-support/syslog-ng/syslog-ng.inc    | 21 +++++++-----
>  .../recipes-support/syslog-ng/syslog-ng_3.15.1.bb  | 10 ++++++
>  .../recipes-support/syslog-ng/syslog-ng_3.8.1.bb   | 11 -------
>  7 files changed, 58 insertions(+), 69 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch
>  create mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_3.15.1.bb
>  delete mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_3.8.1.bb
>
> diff --git a/meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch b/meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch
> deleted file mode 100644
> index 5d481f232..000000000
> --- a/meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -Fix the memory leak problem when HAVE_ENVIRON is defined
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> ----
> -Index: syslog-ng-3.8.1/lib/gprocess.c
> -===================================================================
> ---- syslog-ng-3.8.1.orig/lib/gprocess.c
> -+++ syslog-ng-3.8.1/lib/gprocess.c
> -@@ -1432,6 +1432,18 @@ g_process_startup_ok(void)
> - void
> - g_process_finish(void)
> - {
> -+#ifdef HAVE_ENVIRON
> -+  int i = 0;
> -+
> -+  while (environ[i]) {
> -+    g_free(environ[i]);
> -+    ++i;
> -+  }
> -+  if (environ)
> -+    g_free(environ);
> -+  if (process_opts.argv_orig)
> -+    free(process_opts.argv_orig);
> -+#endif
> -   g_process_remove_pidfile();
> - }
> -
> diff --git a/meta-oe/recipes-support/syslog-ng/files/configure.ac-add-option-enable-thread-tls-to-manage-.patch b/meta-oe/recipes-support/syslog-ng/files/configure.ac-add-option-enable-thread-tls-to-manage-.patch
> index c172e4e74..4f8a3d077 100644
> --- a/meta-oe/recipes-support/syslog-ng/files/configure.ac-add-option-enable-thread-tls-to-manage-.patch
> +++ b/meta-oe/recipes-support/syslog-ng/files/configure.ac-add-option-enable-thread-tls-to-manage-.patch
> @@ -10,21 +10,21 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   configure.ac | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
>
> -Index: syslog-ng-3.8.1/configure.ac
> +Index: syslog-ng-3.15.1/configure.ac
>  ===================================================================
> ---- syslog-ng-3.8.1.orig/configure.ac
> -+++ syslog-ng-3.8.1/configure.ac
> -@@ -147,6 +147,9 @@ AC_ARG_ENABLE(gprof,
> +--- syslog-ng-3.15.1.orig/configure.ac
> ++++ syslog-ng-3.15.1/configure.ac
> +@@ -190,6 +190,9 @@ AC_ARG_ENABLE(gprof,
>   AC_ARG_ENABLE(memtrace,
>                 [  --enable-memtrace   Enable alternative leak debugging code.])
>
>  +AC_ARG_ENABLE(thread-tls,
> -+              [  --enable-thread-tls        Enable Thread Transport Layer Security support.],,enable_thread_tls="no")
> ++              [  --enable-thread-tls        Enable Thread Local Storage support.],,enable_thread_tls="no")
>  +
>   AC_ARG_ENABLE(dynamic-linking,
>                 [  --enable-dynamic-linking        Link everything dynamically.],,enable_dynamic_linking="auto")
>
> -@@ -486,12 +489,14 @@ dnl ************************************
> +@@ -591,12 +594,14 @@ dnl ***************************************************************************
>   dnl Is the __thread keyword available?
>   dnl ***************************************************************************
>
> @@ -33,14 +33,14 @@ Index: syslog-ng-3.8.1/configure.ac
>  -__thread int a;
>  -]],
>  -[a=0;])],
> --[ac_cv_have_tls=yes; AC_DEFINE_UNQUOTED(HAVE_THREAD_KEYWORD, 1, "Whether Transport Layer Security is supported by the system")])
> +-[ac_cv_have_tls=yes; AC_DEFINE_UNQUOTED(HAVE_THREAD_KEYWORD, 1, "Whether Thread Local Storage is supported by the system")])
>  +if test "x$enable_thread_tls" != "xno"; then
>  +    AC_LINK_IFELSE([AC_LANG_PROGRAM(
>  +    [[#include <pthread.h>
>  +    __thread int a;
>  +    ]],
>  +    [a=0;])],
> -+    [ac_cv_have_tls=yes; AC_DEFINE_UNQUOTED(HAVE_THREAD_KEYWORD, 1, "Whether Transport Layer Security is supported by the system")])
> ++    [ac_cv_have_tls=yes; AC_DEFINE_UNQUOTED(HAVE_THREAD_KEYWORD, 1, "Whether Thread Local Storage is supported by the system")])
>  +fi
>
>   dnl ***************************************************************************
> diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
> index 0c6f54355..fb183ee17 100644
> --- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
> +++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
> @@ -1,4 +1,4 @@
> -@version: 3.8
> +@version: 3.15
>  #
>  # Syslog-ng configuration file, compatible with default Debian syslogd
>  # installation. Originally written by anonymous (I can't find his name)
> diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
> index 6b30c20c1..dc2ba167a 100644
> --- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
> +++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
> @@ -7,25 +7,39 @@ Subject: [PATCH] syslog-ng.service: the syslog-ng service can not start
>  Upstream-Status: pending
>
>  Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +Updated-by: Andrej Valek <andrej.valek@siemens.com>
>  ---
>   contrib/systemd/syslog-ng.service | 5 ++---
>   1 file changed, 2 insertion(+), 3 deletions(-)
>
> -diff --git a/contrib/systemd/syslog-ng.service b/contrib/systemd/syslog-ng.service
> -index fc16f8d..8e09deb 100644
> ---- a/contrib/systemd/syslog-ng.service
> -+++ b/contrib/systemd/syslog-ng.service
> -@@ -4,8 +4,8 @@ Description=System Logger Daemon
> -
> - [Service]
> +diff --git a/contrib/systemd/syslog-ng@.service b/contrib/systemd/syslog-ng@.service
> +index a28640e..93aec94 100644
> +--- a/contrib/systemd/syslog-ng@.service
> ++++ b/contrib/systemd/syslog-ng@.service
> +@@ -7,8 +7,8 @@ Conflicts=emergency.service emergency.target
>   Type=notify
> --ExecStart=/usr/sbin/syslog-ng -F $SYSLOGNG_OPTS
> + EnvironmentFile=-/etc/default/syslog-ng@%i
> + EnvironmentFile=-/etc/sysconfig/syslog-ng@%i
> +-ExecStart=/usr/sbin/syslog-ng -F $OTHER_OPTIONS --cfgfile $CONFIG_FILE --control $CONTROL_FILE --persist-file $PERSIST_FILE --pidfile $PID_FILE
>  -ExecReload=/bin/kill -HUP $MAINPID
> -+ExecStart=@SBINDIR@/syslog-ng -F $SYSLOGNG_OPTS -p @LOCALSTATEDIR@/run/syslogd.pid
> ++ExecStart=@SBINDIR@/syslog-ng -F $OTHER_OPTIONS --cfgfile $CONFIG_FILE --control $CONTROL_FILE --persist-file $PERSIST_FILE --pidfile $PID_FILE
>  +ExecReload=@BASEBINDIR@/kill -HUP $MAINPID
> - EnvironmentFile=-/etc/default/syslog-ng
> - EnvironmentFile=-/etc/sysconfig/syslog-ng
>   StandardOutput=journal
> + StandardError=journal
> + Restart=on-failure
> +diff --git a/contrib/systemd/syslog-ng@default b/contrib/systemd/syslog-ng@default
> +index 02da288..3a8215d 100644
> +--- a/contrib/systemd/syslog-ng@default
> ++++ b/contrib/systemd/syslog-ng@default
> +@@ -1,5 +1,5 @@
> + CONFIG_FILE=/etc/syslog-ng.conf
> +-PERSIST_FILE=/var/lib/syslog-ng/syslog-ng.persist
> +-CONTROL_FILE=/var/lib/syslog-ng/syslog-ng.ctl
> +-PID_FILE=/var/run/syslog-ng.pid
> ++PERSIST_FILE=@LOCALSTATEDIR@/lib/syslog-ng/syslog-ng.persist
> ++CONTROL_FILE=@LOCALSTATEDIR@/lib/syslog-ng/syslog-ng.ctl
> ++PID_FILE=@LOCALSTATEDIR@/run/syslog-ng.pid
> + OTHER_OPTIONS="--enable-core"
> +
>  --
>  1.8.4.2
> -
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> index 771cdb196..d8fd96282 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> @@ -13,7 +13,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=24c0c5cb2c83d9f2ab725481e4df5240"
>
>  # util-linux added to get libuuid
> -DEPENDS = "libpcre flex eventlog glib-2.0 openssl util-linux"
> +DEPENDS = "libpcre flex glib-2.0 openssl util-linux"
>
>  SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.tar.gz \
>             file://syslog-ng.conf \
> @@ -67,12 +67,6 @@ do_configure_prepend() {
>         cd $olddir
>  }
>
> -do_install_prepend() {
> -    sed -i -e 's,@SBINDIR@,${sbindir},g' ${S}/contrib/systemd/*.service
> -    sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${S}/contrib/systemd/*.service
> -    sed -i -e 's,@BASEBINDIR@,${base_bindir},g' ${S}/contrib/systemd/*.service
> -}
> -
>  do_install_append() {
>      install -d ${D}/${sysconfdir}/${BPN}
>      install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${BPN}/${BPN}.conf
> @@ -83,6 +77,17 @@ do_install_append() {
>      install -d ${D}/${localstatedir}/lib/${BPN}
>      # Remove /var/run as it is created on startup
>      rm -rf ${D}${localstatedir}/run
> +
> +    # support for systemd
> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +        install -d ${D}${systemd_unitdir}/system/
> +        install -m 0644 ${S}/contrib/systemd/${BPN}@.service ${D}${systemd_unitdir}/system/${BPN}@.service
> +        install -m 0644 ${S}/contrib/systemd/${BPN}@default ${D}${systemd_unitdir}/system/${BPN}@default
> +
> +        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${systemd_unitdir}/system/${BPN}@default
> +        sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${systemd_unitdir}/system/${BPN}@default
> +        sed -i -e 's,@BASEBINDIR@,${base_bindir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${systemd_unitdir}/system/${BPN}@default
> +    fi
>  }
>
>  FILES_${PN} += "${datadir}/include/scl/ ${datadir}/xsd ${datadir}/tools"
> @@ -108,7 +113,7 @@ RCONFLICTS_${PN} = "busybox-syslog sysklogd rsyslog"
>  RPROVIDES_${PN} += "${PN}-systemd"
>  RREPLACES_${PN} += "${PN}-systemd"
>  RCONFLICTS_${PN} += "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN} = "${BPN}.service"
> +SYSTEMD_SERVICE_${PN} = "${BPN}@default ${BPN}@.service"
>
>  INITSCRIPT_NAME = "syslog"
>  INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 90 0 1 6 ."
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.15.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.15.1.bb
> new file mode 100644
> index 000000000..e6a214ced
> --- /dev/null
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.15.1.bb
> @@ -0,0 +1,10 @@
> +require syslog-ng.inc
> +
> +SRC_URI += " \
> +    file://fix-config-libnet.patch \
> +    file://fix-invalid-ownership.patch \
> +    file://syslog-ng.service-the-syslog-ng-service.patch \
> +"
> +
> +SRC_URI[md5sum] = "da59a65cd5e293ec0fa3d3ecf4984af9"
> +SRC_URI[sha256sum] = "a2dabd28674e2b558e4fb92484ad111d77bf7150070aa28556827130b479f9ef"
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.8.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.8.1.bb
> deleted file mode 100644
> index 91a0e4699..000000000
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.8.1.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require syslog-ng.inc
> -
> -SRC_URI += " \
> -    file://fix-config-libnet.patch \
> -    file://fix-invalid-ownership.patch \
> -    file://Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch \
> -    file://syslog-ng.service-the-syslog-ng-service.patch \
> -"
> -
> -SRC_URI[md5sum] = "acf14563cf5ce435db8db35486ce66af"
> -SRC_URI[sha256sum] = "84b081f6e5f98cbc52052e342bcfdc5de5fe0ebe9f5ec32fe9eaec5759224cc5"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

