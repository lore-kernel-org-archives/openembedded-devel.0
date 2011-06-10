Received: from rs69.luxsci.com ([64.49.254.154])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchiii@mtiemail.com>) id 1QV2Jo-00060n-Rr
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jun 2011 16:04:14 +0200
Received: from [192.168.0.165] (adsl-76-255-12-150.dsl.mrdnct.sbcglobal.net
	[76.255.12.150]) (authenticated bits=0)
	by rs69.luxsci.com (8.13.8/8.13.8) with ESMTP id p5AE0nHl004141
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jun 2011 09:00:51 -0500
Message-ID: <4DF22391.70703@mtiemail.com>
Date: Fri, 10 Jun 2011 10:00:49 -0400
From: "George C. Huntington III" <gchiii@mtiemail.com>
Organization: MicroTools, Inc.
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1307713686-30844-1-git-send-email-gchiii@mtiemail.com>
In-Reply-To: <1307713686-30844-1-git-send-email-gchiii@mtiemail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [2011.03-maintenance] fakeroot: Move from not fetchable 1.14.5 to 1.15.1
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
X-List-Received-Date: Fri, 10 Jun 2011 14:04:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

please apply to 2011.03-maintenance branch

Cherry-picked from 085dc5e99abf98772bfb44f3f25320418d500740
Tested-By: George C. Huntington III <gchiii@mtiemail.com>

On 06/10/2011 09:48 AM, George C. Huntington III wrote:
> From: Florian Boor <florian.boor@kernelconcepts.de>
>
> Fakeroot 1.14.5 was not fetchable any more. Updating to 1.15.1.
>
> Test environment:
>     BB_VERSION        = "1.10.2"
>     METADATA_BRANCH   = "org.openembedded.dev"
>     TARGET_ARCH       = "arm"
>     TARGET_OS         = "linux-gnueabi"
>     MACHINE           = "mainstone"
>     DISTRO            = "minimal"
>     DISTRO_VERSION    = "dev-snapshot-20110504"
>     TARGET_FPU        = "soft"
>
> Signed-off-by: Florian Boor <florian.boor@kernelconcepts.de>
> ---
>  recipes/fakeroot/fakeroot-1.14.5/fix-prefix.patch  |   15 ---------------
>  .../fakeroot-1.14.5/quiet-getopt-check.patch       |   12 ------------
>  recipes/fakeroot/fakeroot-1.15.1/fix-prefix.patch  |   15 +++++++++++++++
>  .../fakeroot-1.15.1/quiet-getopt-check.patch       |   12 ++++++++++++
>  recipes/fakeroot/fakeroot_1.14.5.bb                |   10 ----------
>  recipes/fakeroot/fakeroot_1.15.1.bb                |   10 ++++++++++
>  6 files changed, 37 insertions(+), 37 deletions(-)
>  delete mode 100644 recipes/fakeroot/fakeroot-1.14.5/fix-prefix.patch
>  delete mode 100644 recipes/fakeroot/fakeroot-1.14.5/quiet-getopt-check.patch
>  create mode 100644 recipes/fakeroot/fakeroot-1.15.1/fix-prefix.patch
>  create mode 100644 recipes/fakeroot/fakeroot-1.15.1/quiet-getopt-check.patch
>  delete mode 100644 recipes/fakeroot/fakeroot_1.14.5.bb
>  create mode 100644 recipes/fakeroot/fakeroot_1.15.1.bb
>
> diff --git a/recipes/fakeroot/fakeroot-1.14.5/fix-prefix.patch b/recipes/fakeroot/fakeroot-1.14.5/fix-prefix.patch
> deleted file mode 100644
> index 72e7528..0000000
> --- a/recipes/fakeroot/fakeroot-1.14.5/fix-prefix.patch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -This is not needed, kept just for reference.
> -
> ---- fakeroot-1.14.5.orig/scripts/fakeroot.in	2009-11-15 04:09:21.000000000 +0100
> -+++ fakeroot-1.14.5/scripts/fakeroot.in	2011-01-12 20:10:02.897300394 +0100
> -@@ -30,8 +30,8 @@ fatal ()
> - }
> - 
> - # strip /bin/fakeroot to find install prefix
> --FAKEROOT_PREFIX=@prefix@
> --FAKEROOT_BINDIR=@bindir@
> -+FAKEROOT_BINDIR=`dirname $0`
> -+FAKEROOT_PREFIX=`dirname ${FAKEROOT_BINDIR}`
> - 
> - USEABSLIBPATH=@LDPRELOADABS@
> - LIB=lib@fakeroot_transformed@@DLSUFFIX@
> diff --git a/recipes/fakeroot/fakeroot-1.14.5/quiet-getopt-check.patch b/recipes/fakeroot/fakeroot-1.14.5/quiet-getopt-check.patch
> deleted file mode 100644
> index bcb9083..0000000
> --- a/recipes/fakeroot/fakeroot-1.14.5/quiet-getopt-check.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -busybox provided getopt prints the help-text on stderr.
> ---- fakeroot-1.14.5.orig/scripts/fakeroot.in	2009-11-15 04:09:21.000000000 +0100
> -+++ fakeroot-1.14.5/scripts/fakeroot.in	2011-01-12 20:11:50.059891996 +0100
> -@@ -43,7 +43,7 @@ export FAKED_MODE
> - 
> - libfound=no
> - 
> --GETOPTEST=`getopt --version`
> -+GETOPTEST=`getopt --version 2> /dev/null`
> - case $GETOPTEST in
> - getopt*) # GNU getopt
> -     FAKE_TEMP=`getopt -l lib: -l faked: -l unknown-is-real -l fd-base: -l version -l help -- +l:f:i:s:ub:vh "$@"`
> diff --git a/recipes/fakeroot/fakeroot-1.15.1/fix-prefix.patch b/recipes/fakeroot/fakeroot-1.15.1/fix-prefix.patch
> new file mode 100644
> index 0000000..72e7528
> --- /dev/null
> +++ b/recipes/fakeroot/fakeroot-1.15.1/fix-prefix.patch
> @@ -0,0 +1,15 @@
> +This is not needed, kept just for reference.
> +
> +--- fakeroot-1.14.5.orig/scripts/fakeroot.in	2009-11-15 04:09:21.000000000 +0100
> ++++ fakeroot-1.14.5/scripts/fakeroot.in	2011-01-12 20:10:02.897300394 +0100
> +@@ -30,8 +30,8 @@ fatal ()
> + }
> + 
> + # strip /bin/fakeroot to find install prefix
> +-FAKEROOT_PREFIX=@prefix@
> +-FAKEROOT_BINDIR=@bindir@
> ++FAKEROOT_BINDIR=`dirname $0`
> ++FAKEROOT_PREFIX=`dirname ${FAKEROOT_BINDIR}`
> + 
> + USEABSLIBPATH=@LDPRELOADABS@
> + LIB=lib@fakeroot_transformed@@DLSUFFIX@
> diff --git a/recipes/fakeroot/fakeroot-1.15.1/quiet-getopt-check.patch b/recipes/fakeroot/fakeroot-1.15.1/quiet-getopt-check.patch
> new file mode 100644
> index 0000000..bcb9083
> --- /dev/null
> +++ b/recipes/fakeroot/fakeroot-1.15.1/quiet-getopt-check.patch
> @@ -0,0 +1,12 @@
> +busybox provided getopt prints the help-text on stderr.
> +--- fakeroot-1.14.5.orig/scripts/fakeroot.in	2009-11-15 04:09:21.000000000 +0100
> ++++ fakeroot-1.14.5/scripts/fakeroot.in	2011-01-12 20:11:50.059891996 +0100
> +@@ -43,7 +43,7 @@ export FAKED_MODE
> + 
> + libfound=no
> + 
> +-GETOPTEST=`getopt --version`
> ++GETOPTEST=`getopt --version 2> /dev/null`
> + case $GETOPTEST in
> + getopt*) # GNU getopt
> +     FAKE_TEMP=`getopt -l lib: -l faked: -l unknown-is-real -l fd-base: -l version -l help -- +l:f:i:s:ub:vh "$@"`
> diff --git a/recipes/fakeroot/fakeroot_1.14.5.bb b/recipes/fakeroot/fakeroot_1.14.5.bb
> deleted file mode 100644
> index ff6844d..0000000
> --- a/recipes/fakeroot/fakeroot_1.14.5.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require fakeroot.inc
> -PR = "${INC_PR}.0"
> -
> -SRC_URI =+ "\
> -  ${DEBIAN_MIRROR}/main/f/fakeroot/fakeroot_${PV}.orig.tar.bz2 \
> -  file://quiet-getopt-check.patch \
> -"
> -
> -SRC_URI[md5sum] = "659a1f3a36554abfc2a3eaad2fdc0604"
> -SRC_URI[sha256] = "b035c834944bf9482027f48c388de8492e96609825265ac03f05408d0b3aae68"
> diff --git a/recipes/fakeroot/fakeroot_1.15.1.bb b/recipes/fakeroot/fakeroot_1.15.1.bb
> new file mode 100644
> index 0000000..4c625ca
> --- /dev/null
> +++ b/recipes/fakeroot/fakeroot_1.15.1.bb
> @@ -0,0 +1,10 @@
> +require fakeroot.inc
> +PR = "${INC_PR}.0"
> +
> +SRC_URI =+ "\
> +  ${DEBIAN_MIRROR}/main/f/fakeroot/fakeroot_${PV}.orig.tar.bz2 \
> +  file://quiet-getopt-check.patch \
> +"
> +
> +SRC_URI[md5sum] = "248c408b1e06e776c5739871b49bd968"
> +SRC_URI[sha256sum] = "45fbb9ad611f33224cc09954963dde563cc80fe58c76feb25b6e98550b81729a"
>   


