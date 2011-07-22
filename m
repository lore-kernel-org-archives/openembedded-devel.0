Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1QkJX0-0000nx-NG
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jul 2011 19:28:58 +0200
Received: (qmail 15697 invoked by uid 1003); 22 Jul 2011 17:24:46 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@96.240.162.216)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	22 Jul 2011 17:24:46 -0000
Message-ID: <4E29B25D.8030503@balister.org>
Date: Fri, 22 Jul 2011 13:24:45 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110621 Fedora/3.1.11-1.fc14 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1307648104-24260-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1307648104-24260-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] gcc: Package libstdc++ gdb python helpers into dev package
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
X-List-Received-Date: Fri, 22 Jul 2011 17:28:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2011 03:35 PM, Khem Raj wrote:
> People are seeing these errrors from ldconfig
> libstdc++.so.6.0.14-gdb.py is not an ELF file - it has the wrong magic
> bytes at the start.
>
> this file is moved into gdb's autoload directory
> if it exists there then gdb will find it when debugging
> and it wont be in the paths where ldconfig looks for
> libraries.
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>

Finally,

Tested-by: Philip Balister <philip@balister.org>

No more annoying message when I run ldconfig. Getting this fix in will 
reduce my support emails by a small, but noticeable amount.

Philip


> ---
>   recipes/gcc/gcc-4.5.inc            |    2 +-
>   recipes/gcc/gcc-package-cross.inc  |    8 +++++++-
>   recipes/gcc/gcc-package-target.inc |    4 ++++
>   3 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
> index aa5bb00..69229ef 100644
> --- a/recipes/gcc/gcc-4.5.inc
> +++ b/recipes/gcc/gcc-4.5.inc
> @@ -8,7 +8,7 @@ DEPENDS = "mpfr gmp libmpc libelf"
>   NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
>
>
> -INC_PR = "r36"
> +INC_PR = "r37"
>
>   SRCREV = "170880"
>   PV = "4.5"
> diff --git a/recipes/gcc/gcc-package-cross.inc b/recipes/gcc/gcc-package-cross.inc
> index f9a7eeb..1533069 100644
> --- a/recipes/gcc/gcc-package-cross.inc
> +++ b/recipes/gcc/gcc-package-cross.inc
> @@ -4,7 +4,7 @@ PACKAGE_STRIP = "no"
>
>   SHLIBSDIR = "${STAGING_DIR_TARGET}/shlibs"
>
> -PACKAGES = "libgcc libssp libstdc++ libg2c libgfortran"
> +PACKAGES = "libgcc libssp libstdc++ libg2c libgfortran libstdc++-dev libgcc-dev"
>
>   # Called from within gcc-cross, so libdir is set wrong
>   FILES_libg2c = "${target_libdir}/libg2c.so.*"
> @@ -18,6 +18,7 @@ FILES_libgcc-dev = "${target_libdir}/libgcc_s.so"
>
>   FILES_libstdc++ = "${target_libdir}/libstdc++.so.*"
>
> +FILES_libstdc++-dev = "${target_datadir}/gdb/auto-load/${libdir}/libstdc++.so.*-gdb.py*"
>   do_install () {
>   	oe_runmake 'DESTDIR=${D}' install
>   	install -d ${D}${target_base_libdir}
> @@ -68,5 +69,10 @@ GROUP ( libgcc_s.so.1 libgcc.a )">  ${D}${target_libdir}/libgcc_s.so
>   	# We use libiberty from binutils or binutils-cross
>   	rm -f ${D}${libdir}/libiberty.a
>   	rm -f ${D}${target_libdir}/libiberty.a
> +	if [ -f ${D}${target_libdir}/libstdc++.so.*-gdb.py ]; then
> +		# move the gdb python helpers to gdb auto-load directory
> +		install -d ${D}${target_datadir}/gdb/auto-load${target_libdir}
> +		mv -f ${D}${target_libdir}/libstdc++.so.*-gdb.py* ${D}${target_datadir}/gdb/auto-load${target_libdir}
> +	fi
>   }
>
> diff --git a/recipes/gcc/gcc-package-target.inc b/recipes/gcc/gcc-package-target.inc
> index 5cfe47b..959b9ec 100644
> --- a/recipes/gcc/gcc-package-target.inc
> +++ b/recipes/gcc/gcc-package-target.inc
> @@ -83,6 +83,7 @@ FILES_libstdc++-dev = "\
>     ${libdir}/libsupc++.la \
>     ${libdir}/libsupc++.a \
>   "
> +FILES_libstdc++-dev += "${datadir}/gdb/auto-load/${libdir}/libstdc++.so.*-gdb.py*"
>
>   FILES_libgfortran-dev = "${libdir}/libgfortran.a \
>                            ${libdir}/libgfortran.so \
> @@ -168,4 +169,7 @@ GROUP ( libgcc_s.so.1 libgcc.a )">  ${D}${libdir}/libgcc_s.so
>
>   	# Remove precompiled c++ headers as they are really big
>   	rm -rf ${D}${includedir}/c++/${BINV}/${TARGET_SYS}/bits/*.gch
> +	# move the gdb python helpers to gdb auto-load directory
> +	install -d ${D}${datadir}/gdb/auto-load/${libdir}
> +	mv ${D}${libdir}/libstdc++.so.*-gdb.py* ${D}${datadir}/gdb/auto-load${libdir}
>   }


