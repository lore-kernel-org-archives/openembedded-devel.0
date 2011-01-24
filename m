Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PhTJ8-00017I-Aw for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 21:46:38 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PhTIP-0006nJ-Q0 for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 21:45:53 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 21:45:53 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 21:45:53 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 24 Jan 2011 21:45:33 +0100
Message-ID: <ihkodd$bj5$1@dough.gmane.org>
References: <1295900092-1518-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1295900092-1518-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] udev: Remove duplicate udev firmware loading rule
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
X-List-Received-Date: Mon, 24 Jan 2011 20:46:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-01-11 21:14, Khem Raj wrote:
> A duplicate udev rule calling firmware.sh exists in
> 50-udev-default.rules and
> udev.rules
> 
> This causes the kernel to sometimes get the wrong the firmware due to a
> race between the two calls.
> 
> This is with udev124 from the stable2009 openembedded branch however a
> quick
> glance suggests that the same problem exists on the dev branch.
> 
> 50-udev-default.rules comes from the upstream tarball
> udev.rules is in the openembedded recipe.
> 
> This causes the infamous "Error number -110" while uploading firmware,
> i.e:
> 
> [ 4171.357272] firmware: requesting zd1211/zd1211b_ub
> [ 4171.375779] firmware: requesting zd1211/zd1211b_uphr
> [ 4193.981056] firmware: requesting zd1211/zd1211b_ub
> [ 4193.986433] firmware: requesting zd1211/zd1211b_uphr
> [ 4195.033695] usb 8-3: USB control request for firmware upload failed.  Error number -110
> 
> * Fixes Bugzilla/5334
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>  recipes/udev/udev-097/udev.rules |    3 ---
>  recipes/udev/udev-100/udev.rules |    3 ---
>  recipes/udev/udev-124/udev.rules |    3 ---
>  recipes/udev/udev-141/udev.rules |    3 ---
>  recipes/udev/udev-151/udev.rules |    3 ---
>  recipes/udev/udev-154/udev.rules |    3 ---
>  recipes/udev/udev-162/udev.rules |    3 ---
>  recipes/udev/udev-165/udev.rules |    3 ---
>  recipes/udev/udev_097.bb         |    2 +-
>  recipes/udev/udev_100.bb         |    2 +-
>  recipes/udev/udev_124.bb         |    2 +-
>  recipes/udev/udev_141.bb         |    2 +-
>  recipes/udev/udev_151.bb         |    2 +-
>  recipes/udev/udev_154.bb         |    2 +-
>  recipes/udev/udev_162.bb         |    2 +-
>  recipes/udev/udev_165.bb         |    2 +-
>  16 files changed, 8 insertions(+), 32 deletions(-)
> 
> diff --git a/recipes/udev/udev-097/udev.rules b/recipes/udev/udev-097/udev.rules
> index 27c4cb8..1fcf0cd 100644
> --- a/recipes/udev/udev-097/udev.rules
> +++ b/recipes/udev/udev-097/udev.rules
> @@ -94,9 +94,6 @@ KERNEL=="device-mapper",	NAME="mapper/control"
>  
>  KERNEL=="rfcomm[0-9]*", NAME="%k", GROUP="users", MODE="0660"
>  
> -# Firmware Helper
> -ACTION=="add", SUBSYSTEM=="firmware", RUN+="/lib/udev/firmware.sh"
> -
>  # Samsung UARTS
>  KERNEL=="s3c2410_serial[0-9]",   NAME="ttySAC%n"
>  
> diff --git a/recipes/udev/udev-100/udev.rules b/recipes/udev/udev-100/udev.rules
> index 27c4cb8..1fcf0cd 100644
> --- a/recipes/udev/udev-100/udev.rules
> +++ b/recipes/udev/udev-100/udev.rules
> @@ -94,9 +94,6 @@ KERNEL=="device-mapper",	NAME="mapper/control"
>  
>  KERNEL=="rfcomm[0-9]*", NAME="%k", GROUP="users", MODE="0660"
>  
> -# Firmware Helper
> -ACTION=="add", SUBSYSTEM=="firmware", RUN+="/lib/udev/firmware.sh"
> -
>  # Samsung UARTS
>  KERNEL=="s3c2410_serial[0-9]",   NAME="ttySAC%n"
>  
> diff --git a/recipes/udev/udev-124/udev.rules b/recipes/udev/udev-124/udev.rules
> index a19d4a0..6117b94 100644
> --- a/recipes/udev/udev-124/udev.rules
> +++ b/recipes/udev/udev-124/udev.rules
> @@ -105,9 +105,6 @@ KERNEL=="device-mapper",	NAME="mapper/control"
>  
>  KERNEL=="rfcomm[0-9]*", NAME="%k", GROUP="users", MODE="0660"
>  
> -# Firmware Helper
> -ACTION=="add", SUBSYSTEM=="firmware", RUN+="/lib/udev/firmware.sh"
> -
>  # Samsung UARTS
>  KERNEL=="s3c2410_serial[0-9]",   NAME="ttySAC%n"
>  
> diff --git a/recipes/udev/udev-141/udev.rules b/recipes/udev/udev-141/udev.rules
> index a19d4a0..6117b94 100644
> --- a/recipes/udev/udev-141/udev.rules
> +++ b/recipes/udev/udev-141/udev.rules
> @@ -105,9 +105,6 @@ KERNEL=="device-mapper",	NAME="mapper/control"
>  
>  KERNEL=="rfcomm[0-9]*", NAME="%k", GROUP="users", MODE="0660"
>  
> -# Firmware Helper
> -ACTION=="add", SUBSYSTEM=="firmware", RUN+="/lib/udev/firmware.sh"
> -
>  # Samsung UARTS
>  KERNEL=="s3c2410_serial[0-9]",   NAME="ttySAC%n"
>  
> diff --git a/recipes/udev/udev-151/udev.rules b/recipes/udev/udev-151/udev.rules
> index 60288c0..c20cdcc 100644
> --- a/recipes/udev/udev-151/udev.rules
> +++ b/recipes/udev/udev-151/udev.rules
> @@ -105,9 +105,6 @@ KERNEL=="device-mapper",	NAME="mapper/control"
>  
>  KERNEL=="rfcomm[0-9]*", GROUP="users", MODE="0660"
>  
> -# Firmware Helper
> -ACTION=="add", SUBSYSTEM=="firmware", RUN+="/lib/udev/firmware.sh"
> -
>  # Samsung UARTS
>  KERNEL=="s3c2410_serial[0-9]",   NAME="ttySAC%n"
>  
> diff --git a/recipes/udev/udev-154/udev.rules b/recipes/udev/udev-154/udev.rules
> index 60288c0..c20cdcc 100644
> --- a/recipes/udev/udev-154/udev.rules
> +++ b/recipes/udev/udev-154/udev.rules
> @@ -105,9 +105,6 @@ KERNEL=="device-mapper",	NAME="mapper/control"
>  
>  KERNEL=="rfcomm[0-9]*", GROUP="users", MODE="0660"
>  
> -# Firmware Helper
> -ACTION=="add", SUBSYSTEM=="firmware", RUN+="/lib/udev/firmware.sh"
> -
>  # Samsung UARTS
>  KERNEL=="s3c2410_serial[0-9]",   NAME="ttySAC%n"
>  
> diff --git a/recipes/udev/udev-162/udev.rules b/recipes/udev/udev-162/udev.rules
> index 60288c0..c20cdcc 100644
> --- a/recipes/udev/udev-162/udev.rules
> +++ b/recipes/udev/udev-162/udev.rules
> @@ -105,9 +105,6 @@ KERNEL=="device-mapper",	NAME="mapper/control"
>  
>  KERNEL=="rfcomm[0-9]*", GROUP="users", MODE="0660"
>  
> -# Firmware Helper
> -ACTION=="add", SUBSYSTEM=="firmware", RUN+="/lib/udev/firmware.sh"
> -
>  # Samsung UARTS
>  KERNEL=="s3c2410_serial[0-9]",   NAME="ttySAC%n"
>  
> diff --git a/recipes/udev/udev-165/udev.rules b/recipes/udev/udev-165/udev.rules
> index 60288c0..c20cdcc 100644
> --- a/recipes/udev/udev-165/udev.rules
> +++ b/recipes/udev/udev-165/udev.rules
> @@ -105,9 +105,6 @@ KERNEL=="device-mapper",	NAME="mapper/control"
>  
>  KERNEL=="rfcomm[0-9]*", GROUP="users", MODE="0660"
>  
> -# Firmware Helper
> -ACTION=="add", SUBSYSTEM=="firmware", RUN+="/lib/udev/firmware.sh"
> -
>  # Samsung UARTS
>  KERNEL=="s3c2410_serial[0-9]",   NAME="ttySAC%n"
>  
> diff --git a/recipes/udev/udev_097.bb b/recipes/udev/udev_097.bb
> index 84d4b61..2a20005 100644
> --- a/recipes/udev/udev_097.bb
> +++ b/recipes/udev/udev_097.bb
> @@ -10,7 +10,7 @@ needed to link programs with libvolume_id."
>  
>  require udev.inc
>  
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  
>  LD = "${CC}"
>  
> diff --git a/recipes/udev/udev_100.bb b/recipes/udev/udev_100.bb
> index a6692cf..c55a6a2 100644
> --- a/recipes/udev/udev_100.bb
> +++ b/recipes/udev/udev_100.bb
> @@ -11,7 +11,7 @@ needed to link programs with libvolume_id."
>  
>  require udev.inc
>  
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  
>  LD = "${CC}"
>  
> diff --git a/recipes/udev/udev_124.bb b/recipes/udev/udev_124.bb
> index a6c0e18..1585d8c 100644
> --- a/recipes/udev/udev_124.bb
> +++ b/recipes/udev/udev_124.bb
> @@ -5,7 +5,7 @@ RPROVIDES_${PN} = "hotplug"
>  
>  require udev.inc
>  
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.2"
>  
>  LD = "${CC}"
>  
> diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
> index 7a34ada..1c6a148 100644
> --- a/recipes/udev/udev_141.bb
> +++ b/recipes/udev/udev_141.bb
> @@ -7,7 +7,7 @@ DEFAULT_PREFERENCE = "-1"
>  
>  require udev.inc
>  
> -PR = "${INC_PR}.3"
> +PR = "${INC_PR}.4"
>  
>  SRC_URI += "file://mount.blacklist \
>  	    file://run.rules \
> diff --git a/recipes/udev/udev_151.bb b/recipes/udev/udev_151.bb
> index c903f0e..32ab909 100644
> --- a/recipes/udev/udev_151.bb
> +++ b/recipes/udev/udev_151.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
>  the hotplug package and requires a kernel not older than 2.6.12."
>  LICENSE = "GPLv2+"
>  
> -PR = "r22"
> +PR = "r23"
>  
>  # Untested
>  DEFAULT_PREFERENCE = "-1"
> diff --git a/recipes/udev/udev_154.bb b/recipes/udev/udev_154.bb
> index d7740a6..4a358d3 100644
> --- a/recipes/udev/udev_154.bb
> +++ b/recipes/udev/udev_154.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
>  the hotplug package and requires a kernel not older than 2.6.12."
>  LICENSE = "GPLv2+"
>  
> -PR = "r6"
> +PR = "r7"
>  
>  # Untested
>  DEFAULT_PREFERENCE = "-1"
> diff --git a/recipes/udev/udev_162.bb b/recipes/udev/udev_162.bb
> index dc9d313..90d66ce 100644
> --- a/recipes/udev/udev_162.bb
> +++ b/recipes/udev/udev_162.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
>  the hotplug package and requires a kernel not older than 2.6.12."
>  LICENSE = "GPLv2+"
>  
> -PR = "r8"
> +PR = "r9"
>  
>  # Untested
>  #DEFAULT_PREFERENCE = "-1"
> diff --git a/recipes/udev/udev_165.bb b/recipes/udev/udev_165.bb
> index c9e5096..55eccb0 100644
> --- a/recipes/udev/udev_165.bb
> +++ b/recipes/udev/udev_165.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
>  the hotplug package and requires a kernel not older than 2.6.12."
>  LICENSE = "GPLv2+"
>  
> -PR = "r0"
> +PR = "r1"
>  
>  # Untested
>  DEFAULT_PREFERENCE = "-1"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNPeTtMkyGM64RGpERAhT0AJ9gaeXfYIhU67ZRR9Yha+BltsyMxwCeLmi6
gH1GsUvxlZVB/l0m41+pBzc=
=nXPy
-----END PGP SIGNATURE-----



