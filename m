Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SEfIm-0001hC-U2
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Apr 2012 13:20:01 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 02 Apr 2012 04:10:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="136542063"
Received: from unknown (HELO helios.localnet) ([10.252.123.252])
	by fmsmga001.fm.intel.com with ESMTP; 02 Apr 2012 04:10:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Mon, 02 Apr 2012 12:10:48 +0100
Message-ID: <3232177.RSLRf5oIft@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-17-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <1333237424-22209-1-git-send-email-andrea.adami@gmail.com>
References: <1333237424-22209-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH] udev: generalize the check in touchscreen rule
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
X-List-Received-Date: Mon, 02 Apr 2012 11:20:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 01 April 2012 01:43:44 Andrea Adami wrote:
> * The rule only works for devices reporting ts pressure
> * and ignores the other touchscreens (happens e.g. on ipaq h1940).
> * a0,1,*18   a = absolute axes (ABS_X 0x00 ABS_Y 0x01 ABS_PRESSURE 0x18)
> * (see include/linux/input.h)
> *
> * Guidelines for touchscreen suggest only ABS_X and ABS_Y are mandatory
> * (http://kernel.org/doc/Documentation/input/event-codes.txt)
> *
> * Side-effect of the patch is to remove a dependency on meta-oe
> * but using older udev from oe-core.
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-core/udev/udev/local.rules       |   34
> ++++++++++++++++++++++++++++++ recipes-core/udev/udev/touchscreen.rules |  
> 21 ------------------ recipes-core/udev/udev_164.bbappend      |    5 ++++
>  recipes-core/udev/udev_173.bbappend      |    5 ----
>  4 files changed, 39 insertions(+), 26 deletions(-)
>  create mode 100644 recipes-core/udev/udev/local.rules
>  delete mode 100644 recipes-core/udev/udev/touchscreen.rules
>  create mode 100644 recipes-core/udev/udev_164.bbappend
>  delete mode 100644 recipes-core/udev/udev_173.bbappend
> 
> diff --git a/recipes-core/udev/udev/local.rules
> b/recipes-core/udev/udev/local.rules new file mode 100644
> index 0000000..49e8d28
> --- /dev/null
> +++ b/recipes-core/udev/udev/local.rules
> @@ -0,0 +1,34 @@
> +# There are a number of modifiers that are allowed to be used in some
> +# of the different fields. They provide the following subsitutions:
> +#
> +# %n the "kernel number" of the device.
> +#    For example, 'sda3' has a "kernel number" of '3'
> +# %e the smallest number for that name which does not matches an existing
> node +# %k the kernel name for the device
> +# %M the kernel major number for the device
> +# %m the kernel minor number for the device
> +# %b the bus id for the device
> +# %c the string returned by the PROGRAM
> +# %s{filename} the content of a sysfs attribute
> +# %% the '%' char itself
> +#
> +
> +# Media automounting
> +SUBSYSTEM=="block", ACTION=="add"    RUN+="/etc/udev/scripts/mount.sh"
> +SUBSYSTEM=="block", ACTION=="remove" RUN+="/etc/udev/scripts/mount.sh"
> +
> +# Handle network interface setup
> +SUBSYSTEM=="net", ACTION=="add" RUN+="/etc/udev/scripts/network.sh"
> +SUBSYSTEM=="net", ACTION=="remove" RUN+="/etc/udev/scripts/network.sh"
> +
> +# The first framebuffer is symlinked to /dev/fb
> +KERNEL=="fb0", SYMLINK+="fb"
> +
> +# The first rtc device is symlinked to /dev/rtc
> +KERNEL=="rtc0", SYMLINK+="rtc"
> +
> +# Try and modprobe for drivers for new hardware
> +ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*",
> RUN+="/sbin/modprobe $env{MODALIAS}" +
> +# Create a symlink to any touchscreen input device
> +SUBSYSTEM=="input", KERNEL=="event[0-9]*",
> ATTRS{modalias}=="input:*-e0*,3,*a0,1,*", SYMLINK+="input/touchscreen0"
> diff --git a/recipes-core/udev/udev/touchscreen.rules
> b/recipes-core/udev/udev/touchscreen.rules deleted file mode 100644
> index b2307cf..0000000
> --- a/recipes-core/udev/udev/touchscreen.rules
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -# There are a number of modifiers that are allowed to be used in some
> -# of the different fields. They provide the following subsitutions:
> -#
> -# %n the "kernel number" of the device.
> -#    For example, 'sda3' has a "kernel number" of '3'
> -# %e the smallest number for that name which does not matches an existing
> node -# %k the kernel name for the device
> -# %M the kernel major number for the device
> -# %m the kernel minor number for the device
> -# %b the bus id for the device
> -# %c the string returned by the PROGRAM
> -# %s{filename} the content of a sysfs attribute
> -# %% the '%' char itself
> -#
> -
> -# Create a symlink to any touchscreen input device
> -SUBSYSTEM=="input", KERNEL=="event[0-9]*",
> ATTRS{modalias}=="input:*-e0*,3,*a0,1,*18,*", SYMLINK+="input/touchscreen0"
> -SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="ads7846",
> SYMLINK+="input/touchscreen0" -# This one is necessary for h1940
> -SUBSYSTEM=="input", KERNEL=="event[0-9]*",
> ATTRS{modalias}=="input:*-e0*,3,*a0,1,*", SYMLINK+="input/touchscreen0" -
> diff --git a/recipes-core/udev/udev_164.bbappend
> b/recipes-core/udev/udev_164.bbappend new file mode 100644
> index 0000000..4770c5b
> --- /dev/null
> +++ b/recipes-core/udev/udev_164.bbappend
> @@ -0,0 +1,5 @@
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +PRINC = "1"
> +
> diff --git a/recipes-core/udev/udev_173.bbappend
> b/recipes-core/udev/udev_173.bbappend deleted file mode 100644
> index 4770c5b..0000000
> --- a/recipes-core/udev/udev_173.bbappend
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -
> -PRINC = "1"
> -

Merged to meta-handheld (with some rebasing), thanks.

FWIW I'd like to see this more generalised rule in OE-Core, but as we're in 
stabilisation at the moment I don't think now is the time. For the moment we 
can test it in meta-handheld.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


