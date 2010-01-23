Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NYdbL-0006Ae-Li for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 11:52:26 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NYdZ7-0005x4-J5
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 11:50:05 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 11:50:05 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 11:50:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 23 Jan 2010 11:45:06 +0100
Message-ID: <hjejvh$m65$2@ger.gmane.org>
References: <n> <1264197527-25414-1-git-send-email-michael.lippautz@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100113 Shredder/3.0.2pre
In-Reply-To: <1264197527-25414-1-git-send-email-michael.lippautz@gmail.com>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/2] gpsd: Prepare recipe and inc for version bump
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
X-List-Received-Date: Sat, 23 Jan 2010 10:52:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Speaking of GPSD, should we make the default config use a control socket
instead of hardcoding ttyS3?

regards,

Koen

On 22-01-10 22:58, Michael Lippautz wrote:
> 
> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
> ---
>  recipes/gpsd/gpsd.inc     |    9 ++++++---
>  recipes/gpsd/gpsd_2.38.bb |    4 +++-
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes/gpsd/gpsd.inc b/recipes/gpsd/gpsd.inc
> index a917fbe..5efbe2a 100644
> --- a/recipes/gpsd/gpsd.inc
> +++ b/recipes/gpsd/gpsd.inc
> @@ -5,12 +5,14 @@ LICENSE = "GPL"
>  DEPENDS = "dbus-glib ncurses python"
>  PROVIDES = "virtual/gpsd"
>  
> +INC_PR = "r0"
> +
>  EXTRA_OECONF = "--x-includes=${STAGING_INCDIR}/X11 \
>                  --x-libraries=${STAGING_LIBDIR} \
>                  --enable-dbus \
> -                --enable-python"
> +"
>  
> -SRC_URI = "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz \
> +SRC_URI = "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz;name=gpsd \
>             file://gpsd-default \
>             file://gps-hardware \
>             file://gpsd"
> @@ -28,6 +30,8 @@ LDFLAGS += "-L${STAGING_LIBDIR} -lm"
>  export STAGING_INCDIR
>  export STAGING_LIBDIR
>  
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
>  do_compile_prepend() {
>      export BUILD_SYS="${BUILD_SYS}"
>      export HOST_SYS="${HOST_SYS}"
> @@ -41,7 +45,6 @@ do_install_prepend() {
>  
>  do_install_append() {
>          install -d ${D}/${sysconfdir}/init.d
> -        install -d ${D}/dev
>          install -m 0755 ${WORKDIR}/gpsd ${D}/${sysconfdir}/init.d/
>          install -m 0755 ${WORKDIR}/gps-hardware ${D}/${sysconfdir}/init.d/gps-hardware.default
>          install -d ${D}/${sysconfdir}/default
> diff --git a/recipes/gpsd/gpsd_2.38.bb b/recipes/gpsd/gpsd_2.38.bb
> index 06a5fe7..7c7a477 100644
> --- a/recipes/gpsd/gpsd_2.38.bb
> +++ b/recipes/gpsd/gpsd_2.38.bb
> @@ -1,5 +1,7 @@
>  require gpsd.inc
>  
> -PR = "r2"
> +PR = "${INC_PR}.1"
>  # make attempts to link gpspacket.so without waiting for all compiler tasks:
>  PARALLEL_MAKE = ""
> +
> +EXTRA_OECONF += " --enable-python "

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLWtMyMkyGM64RGpERAtmDAJ9WqnRXPxe1NX6+HWg4hfPxTYd1bACffpoW
SG0ttXz5eVQUTE1J7X6vF5Q=
=+Wfg
-----END PGP SIGNATURE-----



