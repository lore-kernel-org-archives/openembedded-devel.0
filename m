Received: from [64.233.184.230] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1Hnrqp-0002gc-CV
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2007 09:53:46 +0200
Received: by wr-out-0506.google.com with SMTP id 55so1981544wri
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2007 00:53:31 -0700 (PDT)
Received: by 10.78.136.9 with SMTP id j9mr2516046hud.1179215610212;
	Tue, 15 May 2007 00:53:30 -0700 (PDT)
Received: by 10.67.51.14 with HTTP; Tue, 15 May 2007 00:53:30 -0700 (PDT)
Message-ID: <74d0deb30705150053p109b57d6of67860d7fbb028ba@mail.gmail.com>
Date: Tue, 15 May 2007 09:53:30 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4648EB51.4040303@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <4648EB51.4040303@dominion.kabel.utwente.nl>
Subject: Re: Fixing up libtool-native and libtool-cross
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 May 2007 07:53:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 5/15/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> Richard has fixed up libtool in Poky a bit and I want to merge his work into OE. Since
> it's 1 AM now, and libtool is a pretty 'core' part, I'm posting the patch for review
> before committing it tomorrow night.

Looks good to me.

> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFGSOtRMkyGM64RGpERAuiCAJ0Yqz+t4X/zNCjTbZIBU7yjaDt8twCgkgVq
> iM3uwQTciklpQKjurM34Nys=
> =W6UX
> -----END PGP SIGNATURE-----
>
> #
> # old_revision [990392a71744fa8ec062ee769a883473775269ee]
> #
> # patch "classes/autotools.bbclass"
> #  from [dced52fcafd4e224bafcb35c4fb04253857c7c3b]
> #    to [113ae9d1554b6e93d9c7a7fda84d71da4712caf9]
> #
> # patch "packages/libtool/libtool-cross_1.5.10.bb"
> #  from [58b238af5bb9acdeca5b86c34b50c419fb49b55e]
> #    to [5134256c71b2d679838e87a55b084a99b1ac17d4]
> #
> # patch "packages/libtool/libtool-native_1.5.10.bb"
> #  from [e1d2b08387782afbf7c5c6787a92d9af864dfb2d]
> #    to [bc799a0464069f3531cbb0a017c4d8d2a1afd63e]
> #
> ============================================================
> --- classes/autotools.bbclass   dced52fcafd4e224bafcb35c4fb04253857c7c3b
> +++ classes/autotools.bbclass   113ae9d1554b6e93d9c7a7fda84d71da4712caf9
> @@ -15,6 +15,10 @@ def autotools_dep_prepend(d):
>
>         if not pn in ['libtool', 'libtool-native', 'libtool-cross']:
>                 deps += 'libtool-native '
> +               if not bb.data.inherits_class('native', d) \
> +                        and not bb.data.inherits_class('cross', d) \
> +                        and not bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, 1):
> +                    deps += 'libtool-cross '
>
>         return deps + 'gnu-config-native '
>
> ============================================================
> --- packages/libtool/libtool-cross_1.5.10.bb    58b238af5bb9acdeca5b86c34b50c419fb49b55e
> +++ packages/libtool/libtool-cross_1.5.10.bb    5134256c71b2d679838e87a55b084a99b1ac17d4
> @@ -1,7 +1,7 @@ require libtool_${PV}.bb
>  SECTION = "devel"
>  require libtool_${PV}.bb
>
> -PR = "r4"
> +PR = "r5"
>  PACKAGES = ""
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libtool-${PV}"
>  SRC_URI_append = " file://libdir-la.patch;patch=1 \
> @@ -21,6 +21,13 @@ do_stage () {
>
>  do_stage () {
>          install -m 0755 ${HOST_SYS}-libtool ${bindir}/${HOST_SYS}-libtool
> +        install -m 0644 libltdl/ltdl.h ${STAGING_INCDIR}/
> +        install -d ${STAGING_DATADIR}/libtool ${STAGING_DATADIR}/aclocal
> +        install -c config.guess ${STAGING_DATADIR}/libtool/
> +        install -c config.sub ${STAGING_DATADIR}/libtool/
> +        install -c -m 0644 ltmain.sh ${STAGING_DATADIR}/libtool/
> +        install -c -m 0644 libtool.m4 ${STAGING_DATADIR}/aclocal/
> +        install -c -m 0644 ltdl.m4 ${STAGING_DATADIR}/aclocal/
>  }
>
>  do_install () {
> ============================================================
> --- packages/libtool/libtool-native_1.5.10.bb   e1d2b08387782afbf7c5c6787a92d9af864dfb2d
> +++ packages/libtool/libtool-native_1.5.10.bb   bc799a0464069f3531cbb0a017c4d8d2a1afd63e
> @@ -1,7 +1,7 @@ require libtool_${PV}.bb
>  SECTION = "devel"
>  require libtool_${PV}.bb
>
> -PR = "r4"
> +PR = "r5"
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libtool-${PV}"
>  SRC_URI_append = " file://libdir-la.patch;patch=1 \
>                     file://prefix.patch;patch=1 \
> @@ -10,8 +10,6 @@ S = "${WORKDIR}/libtool-${PV}"
>                     file://install-path-check.patch;patch=1"
>  S = "${WORKDIR}/libtool-${PV}"
>
> -STAGING_DATADIR_safe := "${STAGING_DATADIR}"
> -
>  inherit native
>
>  do_stage () {
> @@ -19,22 +17,12 @@ do_stage () {
>         install -m 0755 libtoolize ${STAGING_BINDIR}/libtoolize
>         oe_libinstall -a -so -C libltdl libltdl ${STAGING_LIBDIR}
>         install -m 0644 libltdl/ltdl.h ${STAGING_INCDIR}/
> -       for dir in ${STAGING_DATADIR} ${STAGING_DATADIR_safe}; do
> -               ltdldir="${dir}/libtool/libltdl"
> -               install -d $dir/libtool \
> -                          $ltdldir \
> -                          $dir/aclocal
> -               install -c config.guess $dir/libtool/config.guess
> -               install -c config.sub $dir/libtool/config.sub
> -               install -c -m 0644 ltmain.sh $dir/libtool/
> -               install -c -m 0644 libtool.m4 $dir/aclocal/
> -               install -c -m 0644 ltdl.m4 $dir/aclocal/
> -
> -               for src in README COPYING.LIB Makefile.am configure.ac \
> -                               config-h.in ltdl.c ltdl.h; do
> -                       install -m 0644 libltdl/${src} ${ltdldir}
> -               done
> -       done
> +       install -d ${STAGING_DATADIR}/libtool ${STAGING_DATADIR}/aclocal
> +       install -c config.guess ${STAGING_DATADIR}/libtool/
> +       install -c config.sub ${STAGING_DATADIR}/libtool/
> +       install -c -m 0644 ltmain.sh ${STAGING_DATADIR}/libtool/
> +       install -c -m 0644 libtool.m4 ${STAGING_DATADIR}/aclocal/
> +       install -c -m 0644 ltdl.m4 ${STAGING_DATADIR}/aclocal/
>  }
>
>  do_install () {
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


