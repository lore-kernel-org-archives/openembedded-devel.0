Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TCVG2-0004bi-MN
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Sep 2012 14:44:30 +0200
Received: by eekb57 with SMTP id b57so2159680eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2012 05:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=vGztr5qXy98V2+oJ2SVIyEInYo3OoZ+lz8FMc5KIblg=;
	b=Q05bHll9aLyKuULsjRaTvZC9jguc7/9H9LIkODqbXLIDjORDhiJbSrgVbbdxVCAmvR
	juC5Ur1WjrLYm8VDVNRs25Bncf8SuLorBFatlcM51t/7x5sWjXAEp8LYzqnarkiy5jef
	N021uvnnTiZAcD2ixtUdH451DZvSCubkGUAyHnWXmPork18zA58jzIF0YhLP8P9qepbG
	0vo0T5cJDLp4mC6ZY3GgNrbAe6fbTiZc3sh8FfShOniXdIE5aaWWHmmOTR6GFcWnX66t
	79vACHnaxEy1XbXjWj0gVJejPEKxirrSl0m2E0ETr9UQvLYAPIfPy/XW3eBqfQnZksEy
	V+sw==
Received: by 10.14.204.200 with SMTP id h48mr3412057eeo.7.1347625915913;
	Fri, 14 Sep 2012 05:31:55 -0700 (PDT)
Received: from [192.168.103.31] (manaslu.utelisys.net. [217.117.239.6])
	by mx.google.com with ESMTPS id e7sm4102572eep.2.2012.09.14.05.31.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Sep 2012 05:31:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1347617889-16484-1-git-send-email-b28495@freescale.com>
Date: Fri, 14 Sep 2012 14:31:39 +0200
Message-Id: <6ABF37BF-CD17-4C0E-AA90-2641D869742F@dominion.thruhere.net>
References: <1347617889-16484-1-git-send-email-b28495@freescale.com>
To: <b28495@freescale.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQnYqDfTI8T0FHA+TihV/dw6FDh19ouv3fFrWxeTrZEXxKv2i8ejiI3tkms1i9XsDRoywJg0
Cc: yocto@linux.freescale.net, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe v2][for-denzil][PATCH] systemd: use system variables instead of hardcoded paths
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
X-List-Received-Date: Fri, 14 Sep 2012 12:44:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Please do a git cherry-pick to keep author info

Op 14 sep. 2012, om 12:18 heeft <b28495@freescale.com> het volgende =
geschreven:

> From: Ting Liu <b28495@freescale.com>
>=20
> Back port commit 980b338fb5100ff4c779335a86f3d9450ea8c54a
> Below is the original commit message:
>=20
> Fix build for ppc64
>=20
> Consider /lib64 and /usr/lib64
>=20
> Some 64bit architectures chose lib64 instead of lib
> for default library dirnames. So we dig this from metadata
> vars base_libdir and libdir instead of hardcoding 'lib'
>=20
> ppc64 in OE uses lib64 for default libdir
> and this leaves lot of udev/systemd
> files unpackaged since 'lib' was hardcoded
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
> meta-oe/classes/systemd.bbclass                    |    5 +-
> .../systemd/systemd/use-rootlibdir.patch           |   94 =
++++++++++++++++++++
> meta-oe/recipes-core/systemd/systemd_git.bb        |    3 +-
> 3 files changed, 100 insertions(+), 2 deletions(-)
> create mode 100644 =
meta-oe/recipes-core/systemd/systemd/use-rootlibdir.patch
>=20
> diff --git a/meta-oe/classes/systemd.bbclass =
b/meta-oe/classes/systemd.bbclass
> index a2c8ddf..0d88c64 100644
> --- a/meta-oe/classes/systemd.bbclass
> +++ b/meta-oe/classes/systemd.bbclass
> @@ -154,7 +154,10 @@ python populate_packages_prepend () {
>=20
> 	# check service-files and call systemd_add_files_and_parse for =
each entry
> 	def systemd_check_services():
> -		searchpaths =3D '/etc/systemd/system/ =
/lib/systemd/system/ /usr/lib/systemd/system/'
> +		base_libdir =3D d.getVar('base_libdir', 1)
> +		searchpaths =3D '/etc/systemd/system/' + ' '
> +		searchpaths +=3D d.getVar('base_libdir', 1) + =
'/systemd/system/' + ' '
> +		searchpaths +=3D d.getVar('libdir', 1) + =
'/systemd/system/' + ' '
> 		systemd_packages =3D d.getVar('SYSTEMD_PACKAGES', 1)
> 		has_exactly_one_service =3D =
len(systemd_packages.split()) =3D=3D 1
> 		if has_exactly_one_service:
> diff --git a/meta-oe/recipes-core/systemd/systemd/use-rootlibdir.patch =
b/meta-oe/recipes-core/systemd/systemd/use-rootlibdir.patch
> new file mode 100644
> index 0000000..26973c4
> --- /dev/null
> +++ b/meta-oe/recipes-core/systemd/systemd/use-rootlibdir.patch
> @@ -0,0 +1,94 @@
> +=46rom 5210f67d0c637f4fbd8bb0a94e9b11da25a9c76c Mon Sep 17 00:00:00 =
2001
> +From: Ting Liu <b28495@freescale.com>
> +Date: Fri, 14 Sep 2012 16:56:30 +0800
> +Subject: [PATCH] use rootlibdir
> +
> +Back port from meta-oe 980b338fb5100ff4c779335a86f3d9450ea8c54a.
> +Below is the original message in the patch:
> +
> +Upstream-Status: Undecided
> +
> +This patch removes some of hardcoded references to /lib
> +and /usr/lib since on some architectures it should be
> +/lib64 and /usr/lib64 atleast in OE
> +
> +I am not sure about the intention of hardcoded values
> +thats why status is undecided
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Ting Liu <b28495@freescale.com>
> +---
> + Makefile.am |   20 ++++++++++----------
> + 1 files changed, 10 insertions(+), 10 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 219d8de..b96ac74 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -50,19 +50,19 @@ bashcompletiondir=3D$(sysconfdir)/bash_completion.d=

> +=20
> + # Our own, non-special dirs
> + pkgsysconfdir=3D$(sysconfdir)/systemd
> +-userunitdir=3D$(prefix)/lib/systemd/user
> +-tmpfilesdir=3D$(prefix)/lib/tmpfiles.d
> +-sysctldir=3D$(prefix)/lib/sysctl.d
> ++userunitdir=3D$(prefix)/$(rootlibdir)/gcsystemd/user
> ++tmpfilesdir=3D$(prefix)/$(rootlibdir)/gctmpfiles.d
> ++sysctldir=3D$(prefix)/$(rootlibdir)/gcsysctl.d
> + usergeneratordir=3D$(pkglibexecdir)/user-generators
> + pkgincludedir=3D$(includedir)/systemd
> +=20
> + # And these are the special ones for /
> + rootprefix=3D@rootprefix@
> + rootbindir=3D$(rootprefix)/bin
> +-rootlibexecdir=3D$(rootprefix)/lib/systemd
> ++rootlibexecdir=3D$(rootprefix)/$(rootlibdir)/gcsystemd
> + systemgeneratordir=3D$(rootlibexecdir)/system-generators
> + systemshutdowndir=3D$(rootlibexecdir)/system-shutdown
> +-systemunitdir=3D$(rootprefix)/lib/systemd/system
> ++systemunitdir=3D$(rootprefix)/$(rootlibdir)/gcsystemd/system
> +=20
> + CLEANFILES =3D
> + EXTRA_DIST =3D
> +@@ -93,7 +93,7 @@ AM_CPPFLAGS =3D \
> + 	=
-DSYSTEMD_STDIO_BRIDGE_BINARY_PATH=3D\"$(bindir)/systemd-stdio-bridge\" =
\
> + 	-DROOTPREFIX=3D\"$(rootprefix)\" \
> + 	-DRUNTIME_DIR=3D\"/run\" \
> +-	-DRANDOM_SEED=3D\"$(localstatedir)/lib/random-seed\" \
> ++	-DRANDOM_SEED=3D\"$(localstatedir)/$(rootlibdir)/gcrandom-seed\" =
\
> + 	=
-DSYSTEMD_CRYPTSETUP_PATH=3D\"$(rootlibexecdir)/systemd-cryptsetup\" \
> + 	-DSYSTEM_GENERATOR_PATH=3D\"$(systemgeneratordir)\" \
> + 	-DUSER_GENERATOR_PATH=3D\"$(usergeneratordir)\" \
> +@@ -1408,7 +1408,7 @@ nodist_systemunit_DATA +=3D \
> +=20
> + binfmt-install-data-hook:
> + 	$(MKDIR_P) -m 0755 \
> +-		$(DESTDIR)$(prefix)/lib/binfmt.d \
> ++		$(DESTDIR)$(prefix)/$(rootlibdir)/gcbinfmt.d \
> + 		$(DESTDIR)$(sysconfdir)/binfmt.d \
> + 		$(DESTDIR)$(systemunitdir)/sysinit.target.wants
> + 	( cd $(DESTDIR)$(systemunitdir)/sysinit.target.wants && \
> +@@ -1940,7 +1940,7 @@ polkitpolicy_in_files +=3D \
> + logind-install-data-hook:
> + 	$(MKDIR_P) -m 0755 \
> + 		$(DESTDIR)$(systemunitdir)/multi-user.target.wants \
> +-                $(DESTDIR)$(localstatedir)/lib/systemd
> ++                $(DESTDIR)$(localstatedir)/$(rootlibdir)/gcsystemd
> + 	( cd $(DESTDIR)$(systemunitdir) && \
> + 		rm -f dbus-org.freedesktop.login1.service && \
> + 		$(LN_S) systemd-logind.service =
dbus-org.freedesktop.login1.service)
> +@@ -2196,9 +2196,9 @@ systemd-install-data-hook:
> + 	$(MKDIR_P) -m 0755 \
> + 		$(DESTDIR)$(tmpfilesdir) \
> + 		$(DESTDIR)$(sysconfdir)/tmpfiles.d \
> +-		$(DESTDIR)$(prefix)/lib/modules-load.d \
> ++		$(DESTDIR)$(prefix)/$(rootlibdir)/gcmodules-load.d \
> + 		$(DESTDIR)$(sysconfdir)/modules-load.d \
> +-		$(DESTDIR)$(prefix)/lib/sysctl.d \
> ++		$(DESTDIR)$(prefix)/$(rootlibdir)/gcsysctl.d \
> + 		$(DESTDIR)$(sysconfdir)/sysctl.d \
> + 		$(DESTDIR)$(systemshutdowndir) \
> + 		$(DESTDIR)$(systemgeneratordir) \
> +--=20
> +1.7.5
> +
> diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb =
b/meta-oe/recipes-core/systemd/systemd_git.bb
> index b9c8a19..21a6326 100644
> --- a/meta-oe/recipes-core/systemd/systemd_git.bb
> +++ b/meta-oe/recipes-core/systemd/systemd_git.bb
> @@ -14,13 +14,14 @@ inherit gitpkgv
> PKGV =3D "v${GITPKGVTAG}"
>=20
> PV =3D "git"
> -PR =3D "r28"
> +PR =3D "r29"
>=20
> inherit useradd pkgconfig autotools vala perlnative
>=20
> SRCREV =3D "3eff4208ffecedd778fec260f0d4b18e94dab443"
>=20
> SRC_URI =3D =
"git://anongit.freedesktop.org/systemd/systemd;protocol=3Dgit \
> +           file://use-rootlibdir.patch \
>            ${UCLIBCPATCHES} \
>            file://var-run.conf \
>           "
> --=20
> 1.7.5
>=20
>=20



