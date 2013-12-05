Return-Path: <gwt.scott@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by mail.openembedded.org (Postfix) with ESMTP id 45AF86DD0D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2013 15:32:51 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id m1so18611876oag.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2013 07:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:from:in-reply-to:mime-version:date:message-id:subject:to
	:content-type; bh=eG6XupfBz2nahc7bZ0FaRUJqOes0vGG18yk+13HmTz0=;
	b=Ioi/pY1oFOqFsbpF6f/1ypPfBup0KBVOLFLEVQMSwXzjzrHmOGHeVJCSyVWp4IUjfG
	DAtfcFo8SkX0VnTT26gLhtOZRnR1J04AFNfhAfL4nDpfASHOOdKaCMls9UbCKgCLpaho
	V8fxfoK8sql/tpVXypA3d8rd33ba2FRHoTSQfkfNEPYAtP/e+uMsqQV+sVpC4zeyX7MW
	iD6VVBfghY/Qk6ZcCDqRkkGY4IQe7voU/Q2TpwxpVd1zExVRgGB6pshJ2RTUu521p4/H
	fV7nEcCVu4+l/UnV4ZyHZ22NV8Vc0HrmY42bNcZiEmu5mJSPUdn6yK3ong9jSjW4wfmI
	UWWA==
X-Received: by 10.60.63.52 with SMTP id d20mr102415oes.76.1386257570017; Thu,
	05 Dec 2013 07:32:50 -0800 (PST)
References: <cover.1386227209.git.wenzong.fan@windriver.com>
	<427446e772574bf40b2ee7b9fc46048efd9601c7.1386227209.git.wenzong.fan@windriver.com>
From: Scott Penner <gwt.scott@gmail.com>
In-Reply-To: <427446e772574bf40b2ee7b9fc46048efd9601c7.1386227209.git.wenzong.fan@windriver.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 5 Dec 2013 08:32:46 -0700
Message-ID: <9022455822474819115@unknownmsgid>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/1] mariadb-native: fix link error on Ubuntu 13.10
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
X-List-Received-Date: Thu, 05 Dec 2013 15:32:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Great, what is the best way to apply this patch?
Please excuse my noobness.

Thanks,

Scott Penner

Goodwell Inc.
c. 4033761977
a. Box 906 Brooks, Ab T1R1B8

> On Dec 5, 2013, at 12:10 AM, "wenzong.fan@windriver.com" <wenzong.fan@windriver.com> wrote:
>
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> Below errors only occurs on Ubuntu 13.10:
>
> $arch-linux-libtool: link: g++ ... -o .libs/mysqltest_embedded \
>    ../../libmysqld/.libs/libmysqld.so -ldl
>
>    ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlopen'
>    ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlclose'
>    ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlerror'
>    ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlsym'
>
> GCC/ld verion on the host:
>    gcc (Ubuntu/Linaro 4.8.1-10ubuntu8) 4.8.1
>    GNU ld (GNU Binutils for Ubuntu) 2.23.52.20130913
>
> This is a strange behavior on Ub13.10, it fails even '-ldl' in the
> link command line. This patch will append '-ldl' to dependency_libs
> in libmysqld.la.
>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
> .../recipes-support/mysql/mariadb-native_5.1.67.bb |    3 ++
> .../mysql/mariadb/fix-link-error-ub1310.patch      |   37 ++++++++++++++++++++
> 2 files changed, 40 insertions(+)
> create mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-link-error-ub1310.patch
>
> diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb b/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
> index a55c2ab..dccbfd0 100644
> --- a/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
> +++ b/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
> @@ -8,6 +8,9 @@ PACKAGES = ""
> EXTRA_OEMAKE = ""
> EXTRA_OECONF = " --with-embedded-server "
>
> +SRC_URI += "file://fix-link-error-ub1310.patch \
> +    "
> +
> do_install() {
>     oe_runmake 'DESTDIR=${D}' install
>     mv -f ${D}${libdir}/mysql/* ${D}${libdir}
> diff --git a/meta-oe/recipes-support/mysql/mariadb/fix-link-error-ub1310.patch b/meta-oe/recipes-support/mysql/mariadb/fix-link-error-ub1310.patch
> new file mode 100644
> index 0000000..a528ea7
> --- /dev/null
> +++ b/meta-oe/recipes-support/mysql/mariadb/fix-link-error-ub1310.patch
> @@ -0,0 +1,37 @@
> +mariadb-native: fix link error on Ubuntu 13.10
> +
> +Below errors only occurs on Ubuntu 13.10:
> +
> +$arch-linux-libtool: link: g++ ... -o .libs/mysqltest_embedded \
> +    ../../libmysqld/.libs/libmysqld.so -ldl
> +
> +    ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlopen'
> +    ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlclose'
> +    ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlerror'
> +    ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlsym'
> +
> +GCC/ld verion on the host:
> +    gcc (Ubuntu/Linaro 4.8.1-10ubuntu8) 4.8.1
> +    GNU ld (GNU Binutils for Ubuntu) 2.23.52.20130913
> +
> +This is a strange behavior on Ub13.10, it fails even '-ldl' in the
> +link command line. Below fix will append '-ldl' to dependency_libs
> +in libmysqld.la.
> +
> +Upstream-Status: Submitted [https://mariadb.atlassian.net/browse/MDEV-5362]
> +
> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> +================================================
> +diff --git a/libmysqld/Makefile.am b/libmysqld/Makefile.am
> +index 7a2c92e..eee501e 100644
> +--- a/libmysqld/Makefile.am
> ++++ b/libmysqld/Makefile.am
> +@@ -92,7 +92,7 @@ INC_LIB=    $(top_builddir)/regex/libregex.la \
> +                 @ndbcluster_libs@ @NDB_SCI_LIBS@ \
> +        @mysql_embedded_plugin_libs@ \
> +        $(libevent_inc_libs) \
> +-        $(yassl_inc_libs)
> ++        $(yassl_inc_libs) @LIBDL@
> +
> + if HAVE_YASSL
> + yassl_inc_libs=    $(top_builddir)/extra/yassl/src/libyassl.la \
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

