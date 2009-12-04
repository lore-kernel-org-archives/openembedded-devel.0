Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NGToG-00081H-0M for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 09:46:43 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NGTmh-00018H-SX
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 09:45:03 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2009 09:45:03 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2009 09:45:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 04 Dec 2009 09:39:41 +0100
Message-ID: <hfahsd$ofp$1@ger.gmane.org>
References: <1259911168-19992-1-git-send-email-Sebastian@SSpaeth.de>
	<1259911168-19992-2-git-send-email-Sebastian@SSpaeth.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <1259911168-19992-2-git-send-email-Sebastian@SSpaeth.de>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/2] task-base: Introduce DISTRO_apm and convert recipes to use it.
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
X-List-Received-Date: Fri, 04 Dec 2009 08:46:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-12-09 08:19, Sebastian Spaeth wrote:
> * This allows distros to override the apm provider with an DISTRO_apm variable
> * The change should be transparent and invisible for other distros
> * This could also be done with a virtual/apm package, and a PREFERED_PROVIDER set to apm

Don't forget to remove the (R)PROVIDES in fso-apmd which are causing all 
the problems. Some comment as mickey, please use caps for vars.

regards,

Koen


> Signed-off-by: Sebastian Spaeth<Sebastian@SSpaeth.de>
> ---
>   recipes/ipaq-sleep/ipaq-sleep_0.9.bb           |    5 +++--
>   recipes/matchbox2/matchbox-panel-2_svn.bb      |    6 ++++--
>   recipes/openmoko2/neod_svn.bb                  |    6 ++++--
>   recipes/suspend-desktop/suspend-desktop_1.0.bb |    5 +++--
>   recipes/tasks/task-base.bb                     |    7 +++++--
>   5 files changed, 19 insertions(+), 10 deletions(-)
>
> diff --git a/recipes/ipaq-sleep/ipaq-sleep_0.9.bb b/recipes/ipaq-sleep/ipaq-sleep_0.9.bb
> index 24d881d..6c37b73 100644
> --- a/recipes/ipaq-sleep/ipaq-sleep_0.9.bb
> +++ b/recipes/ipaq-sleep/ipaq-sleep_0.9.bb
> @@ -2,8 +2,9 @@ DESCRIPTION = "Automatic sleep/suspend control daemon"
>   SECTION = "x11/base"
>   LICENSE = "GPL"
>   DEPENDS = "apmd virtual/xserver libxext virtual/libx11 libxau xscrnsaverh libxss"
> -RDEPENDS = "apm"
> -PR = "r6"
> +DISTRO_apm ?= "apm"
> +RDEPENDS = "${DISTRO_apm}"
> +PR = "r7"
>
>   inherit gpe pkgconfig
>
> diff --git a/recipes/matchbox2/matchbox-panel-2_svn.bb b/recipes/matchbox2/matchbox-panel-2_svn.bb
> index a2a807f..9d1781b 100644
> --- a/recipes/matchbox2/matchbox-panel-2_svn.bb
> +++ b/recipes/matchbox2/matchbox-panel-2_svn.bb
> @@ -1,13 +1,15 @@
>   DESCRIPTION = "matchbox-panel-2 is a lightweight dock (system tray) application based on Gtk+"
>   LICENSE = "GPLv2"
>   SECTION = "x11/panels"
> +
> +DISTRO_apm ?= "apm"
>   DEPENDS = "gtk+ startup-notification dbus dbus-glib matchbox-panel-2-icon-themes"
>   DEPENDS += " ${@base_contains("MACHINE_FEATURES", "acpi", "libacpi", "",d)}"
> -DEPENDS += " ${@base_contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
> +DEPENDS += " ${@base_contains("MACHINE_FEATURES", "${DISTRO_apm}", "apmd", "",d)}"
>   RDEPENDS_${PN} = "matchbox-panel-2-icon-theme"
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   PV = "2.0+svnr${SRCPV}"
> -PR = "r0"
> +PR = "r1"
>
>   inherit autotools_stage pkgconfig
>
> diff --git a/recipes/openmoko2/neod_svn.bb b/recipes/openmoko2/neod_svn.bb
> index aeeee87..14858a7 100644
> --- a/recipes/openmoko2/neod_svn.bb
> +++ b/recipes/openmoko2/neod_svn.bb
> @@ -1,9 +1,11 @@
>   DESCRIPTION = "Simple Neo1973 Daemon for Button Handling and Power Management"
>   SECTION = "openmoko/daemons"
> +
> +DISTRO_apm ?= "apm"
>   DEPENDS = "gtk+ pulseaudio apmd"
> -RDEPENDS = "gpe-scap xrandr alsa-utils-amixer apm dbus"
> +RDEPENDS = "gpe-scap xrandr alsa-utils-amixer ${DISTRO_apm} dbus"
>   PV = "0.1.0+svnr${SRCPV}"
> -PR = "r6"
> +PR = "r7"
>
>   inherit openmoko2 gconf
>
> diff --git a/recipes/suspend-desktop/suspend-desktop_1.0.bb b/recipes/suspend-desktop/suspend-desktop_1.0.bb
> index fa9efba..8fcdfea 100644
> --- a/recipes/suspend-desktop/suspend-desktop_1.0.bb
> +++ b/recipes/suspend-desktop/suspend-desktop_1.0.bb
> @@ -3,10 +3,11 @@ PRIORITY    = "optional"
>   DESCRIPTION = "Suspend feature for the application launcher menu."
>   LICENSE     = "GPL"
>
> -PR          = "r1"
> +PR          = "r2"
>
> +DISTRO-apm ?= "apm"
>   RDEPENDS    = "gpe-conf"
> -RRECOMMENDS = "apm"
> +RRECOMMENDS = "${DISTRO_apm}"
>
>   PACKAGES    = "${PN}"
>   PACKAGE_ARCH = "all"
> diff --git a/recipes/tasks/task-base.bb b/recipes/tasks/task-base.bb
> index ed561b8..6aad873 100644
> --- a/recipes/tasks/task-base.bb
> +++ b/recipes/tasks/task-base.bb
> @@ -1,5 +1,5 @@
>   DESCRIPTION = "Merge machine and distro options to create a basic machine task/package"
> -PR = "r86"
> +PR = "r87"
>
>   inherit task
>
> @@ -60,6 +60,9 @@ HOTPLUG ?= "${@base_contains("MACHINE_FEATURES", "kernel24",  "linux-hotplug",""
>   #
>   DISTRO_SSH_DAEMON ?= "dropbear"
>
> +# Distro can override apm provider
> +DISTRO_apm ?= "apm"
> +
>   #
>   # bluetooth manager
>   #
> @@ -190,7 +193,7 @@ RDEPENDS_task-base-acpi = "\
>       acpid"
>
>   RDEPENDS_task-base-apm = "\
> -    apm \
> +    "${DISTRO_apm}" \
>       apmd \
>       ${@base_contains('MACHINE_FEATURES', 'kernel24', 'network-suspend-scripts', '',d)}"
>




