Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PiB6Y-0005xg-75
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 20:32:34 +0100
Received: (qmail 29860 invoked by uid 503); 26 Jan 2011 19:35:12 -0000
Received: from b9.ovh.net (HELO mail620.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 26 Jan 2011 19:35:12 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 26 Jan 2011 21:32:17 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 26 Jan 2011 21:32:16 +0200
Message-ID: <4D40769F.9030606@eukrea.com>
Date: Wed, 26 Jan 2011 20:31:43 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295363929-13246-1-git-send-email-kergoth@gmail.com>
	<1295363929-13246-3-git-send-email-kergoth@gmail.com>
In-Reply-To: <1295363929-13246-3-git-send-email-kergoth@gmail.com>
X-Ovh-Tracer-Id: 8556839292553309513
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH 3/4] Add install wrapper rather than coreutils-native
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
X-List-Received-Date: Wed, 26 Jan 2011 19:32:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 18/01/2011 16:18, Chris Larson wrote:
> From: Chris Larson<chris_larson@mentor.com>
>
> Signed-off-by: Chris Larson<chris_larson@mentor.com>
Acked-by: Eric Bénard <eric@eukrea.com>
> ---
>   bin/darwin/cp              |    2 +-
>   bin/darwin/sed             |    2 +-
>   bin/install                |   28 ++++++++++++++++++++++++++++
>   classes/base.bbclass       |   28 +++++++++-------------------
>   classes/gpe.bbclass        |    2 +-
>   classes/gpephone.bbclass   |    2 +-
>   recipes/twin/twin_0.4.6.bb |    1 -
>   7 files changed, 41 insertions(+), 24 deletions(-)
>   create mode 100755 bin/install
>
> diff --git a/bin/darwin/cp b/bin/darwin/cp
> index 0a523b7..a753557 100755
> --- a/bin/darwin/cp
> +++ b/bin/darwin/cp
> @@ -7,7 +7,7 @@
>   # - Otherwise, we stick to what SuSv3 defines
>
>
> -source $(dirname $0)/wrapper.sh
> +source $(dirname $0)/../wrapper.sh
>
>   saved=""
>   while getopts fpaRHLP opt; do
> diff --git a/bin/darwin/sed b/bin/darwin/sed
> index 2200bd1..5c830e4 100755
> --- a/bin/darwin/sed
> +++ b/bin/darwin/sed
> @@ -21,7 +21,7 @@
>   # to reimplement -i internally in this script on some platforms.
>
>
> -source $(dirname $0)/wrapper.sh
> +source $(dirname $0)/../wrapper.sh
>
>   case `uname -s` in
>       Darwin)
> diff --git a/bin/install b/bin/install
> new file mode 100755
> index 0000000..4ad8172
> --- /dev/null
> +++ b/bin/install
> @@ -0,0 +1,28 @@
> +#!/bin/sh
> +
> +source $(dirname $0)/wrapper.sh
> +
> +saved=""
> +while getopts dbCcMpSsvB:f:g:m:o: opt; do
> +    case "$opt" in
> +        s)
> +            # Ignore strip argument
> +            ;;
> +        B|f|g|m|o)
> +            save "-$opt"
> +            save "$OPTARG"
> +            ;;
> +        \?)
> +            exit 1
> +            ;;
> +        *)
> +            save "-$opt"
> +            ;;
> +    esac
> +done
> +shift $(($OPTIND - 1))
> +for arg; do
> +    save "$arg"
> +done
> +
> +exec_real
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 6fa292e..8804ec0 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -55,33 +55,23 @@ oe_runmake() {
>   }
>
>   def base_deps(d):
> -	#
> -	# Ideally this will check a flag so we will operate properly in
> -	# the case where host == build == target, for now we don't work in
> -	# that case though.
> -	#
> -	deps = "coreutils-native"
> -	if bb.data.getVar('PN', d, True) in ("shasum-native", "coreutils-native"):
> -		deps = ""
> -
>   	# INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether or  not
>   	# we need that built is the responsibility of the patch function / class, not
>   	# the application.
>   	if not bb.data.getVar('INHIBIT_DEFAULT_DEPS', d):
>   		if (bb.data.getVar('HOST_SYS', d, 1) !=
> -	     	    bb.data.getVar('BUILD_SYS', d, 1)):
> -			deps += " virtual/${TARGET_PREFIX}gcc virtual/libc "
> +		    bb.data.getVar('BUILD_SYS', d, 1)):
> +			return "virtual/${TARGET_PREFIX}gcc virtual/libc"
>   		elif bb.data.inherits_class('native', d) and \
>   				bb.data.getVar('PN', d, True) not in \
>   				("linux-libc-headers-native", "quilt-native",
> -				 "unifdef-native", "shasum-native",
> -				 "coreutils-native"):
> -			deps += " linux-libc-headers-native"
> -	return deps
> +				 "unifdef-native", "shasum-native"):
> +			return "linux-libc-headers-native"
> +	return ""
>
> -DEPENDS_prepend="${@base_deps(d)} "
> -DEPENDS_virtclass-native_prepend="${@base_deps(d)} "
> -DEPENDS_virtclass-nativesdk_prepend="${@base_deps(d)} "
> +DEPENDS_prepend = "${@base_deps(d)} "
> +DEPENDS_virtclass-native_prepend = "${@base_deps(d)} "
> +DEPENDS_virtclass-nativesdk_prepend = "${@base_deps(d)} "
>
>
>   SCENEFUNCS += "base_scenefunction"
> @@ -89,7 +79,7 @@ SCENEFUNCS += "base_scenefunction"
>   python base_scenefunction () {
>   	stamp = bb.data.getVar('STAMP', d, 1) + ".needclean"
>   	if os.path.exists(stamp):
> -	        bb.build.exec_func("do_clean", d)
> +		bb.build.exec_func("do_clean", d)
>   }
>
>   python base_do_setscene () {
> diff --git a/classes/gpe.bbclass b/classes/gpe.bbclass
> index a9ddec3..7e042ee 100644
> --- a/classes/gpe.bbclass
> +++ b/classes/gpe.bbclass
> @@ -1,4 +1,4 @@
> -DEPENDS_prepend = "coreutils-native virtual/libintl intltool-native "
> +DEPENDS_prepend = "virtual/libintl intltool-native "
>   GPE_TARBALL_SUFFIX ?= "gz"
>   SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.${GPE_TARBALL_SUFFIX}"
>   FILES_${PN} += "${datadir}/gpe ${datadir}/application-registry"
> diff --git a/classes/gpephone.bbclass b/classes/gpephone.bbclass
> index 57867b5..dffbaa9 100644
> --- a/classes/gpephone.bbclass
> +++ b/classes/gpephone.bbclass
> @@ -1,4 +1,4 @@
> -DEPENDS_prepend = "coreutils-native virtual/libintl intltool-native "
> +DEPENDS_prepend = "virtual/libintl intltool-native "
>   GPE_TARBALL_SUFFIX ?= "gz"
>   SRC_URI = "${GPEPHONE_MIRROR}/${PN}-${PV}/${PN}-${PV}.tar.${GPE_TARBALL_SUFFIX}"
>   FILES_${PN} += "${datadir}/gpe ${datadir}/application-registry"
> diff --git a/recipes/twin/twin_0.4.6.bb b/recipes/twin/twin_0.4.6.bb
> index c6c3fbd..3ea36f8 100644
> --- a/recipes/twin/twin_0.4.6.bb
> +++ b/recipes/twin/twin_0.4.6.bb
> @@ -1,7 +1,6 @@
>   DESCRIPTION = "Twin is a text-mode windowing environment: it draws and manages text windows on a text-mode display, like X11 does for graphical windows. It has a built-in window manager and terminal emulator, and can be used as server for remote clients in the same style as X11. It can display on Linux console, on X11 and inside itself."
>   SECTION = "console/utils"
>
> -DEPENDS = "coreutils-native"
>   LICENSE = "GPL LGPL"
>   SRC_URI = "http://linuz.sns.it/~max/twin/twin-0.4.6.tar.gz \
>   	   file://cross_compile.patch"



