Received: from [87.194.255.144] (helo=honeysuckle.london.02.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bluelightning@bluelightning.org>) id 1M2BU2-0008Mj-6O
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 23:50:26 +0200
Received: from shodan.localnet (93.96.131.185) by honeysuckle.london.02.net
	(8.5.016.1)
	id 49D39F4E01B9B809 for openembedded-devel@lists.openembedded.org;
	Thu, 7 May 2009 22:44:15 +0100
From: Paul Eggleton <bluelightning@bluelightning.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 7 May 2009 22:44:14 +0100
User-Agent: KMail/1.11.2 (Linux/2.6.28-11-generic; KDE/4.2.2; i686; ; )
References: <1241686197-14065-1-git-send-email-k.kooi@student.utwente.nl>
In-Reply-To: <1241686197-14065-1-git-send-email-k.kooi@student.utwente.nl>
MIME-Version: 1.0
Message-Id: <200905072244.14692.bluelightning@bluelightning.org>
Subject: Re: [STABLE][PATCH] zaurusd: point tskeys to the real ts device instead hardcoding it to event1
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
X-List-Received-Date: Thu, 07 May 2009 21:50:29 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, 07 May 2009, Koen Kooi wrote:
> From: Koen Kooi <koen@openembedded.org>
>
>
> Signed-off-by: Koen Kooi <koen@openembedded.org>

Acked-by; Paul Eggleton <bluelightning@bluelightning.org>



> ---
>  .../use-ts-symlink-instead-of-hardcoding.diff      |   88
> ++++++++++++++++++++ recipes/zaurusd/zaurusd_svn.bb                     |  
>  5 +-
>  2 files changed, 91 insertions(+), 2 deletions(-)
>  create mode 100644
> recipes/zaurusd/files/use-ts-symlink-instead-of-hardcoding.diff
>
> diff --git
> a/recipes/zaurusd/files/use-ts-symlink-instead-of-hardcoding.diff
> b/recipes/zaurusd/files/use-ts-symlink-instead-of-hardcoding.diff new file
> mode 100644
> index 0000000..b49a21f
> --- /dev/null
> +++ b/recipes/zaurusd/files/use-ts-symlink-instead-of-hardcoding.diff
> @@ -0,0 +1,88 @@
> +--- /tmp/mach-akita-vars.in	2009-04-28 16:39:58.000000000 +0200
> ++++ zaurusd/config/mach-config/mach-akita-vars.in	2009-04-28
> 16:40:06.000000000 +0200 +@@ -5,6 +5,6 @@
> + SWITCH_EVENT_DEVICE=/dev/input/event0
> +
> + TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
> +-TSKEYS_DEVICE=/dev/input/event1
> ++TSKEYS_DEVICE=/dev/input/touchscreen0
> +
> + ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
> +\ No newline at end of file
> +--- /tmp/mach-borzoi-vars.in	2009-04-28 16:39:58.000000000 +0200
> ++++ zaurusd/config/mach-config/mach-borzoi-vars.in	2009-04-28
> 16:40:06.000000000 +0200 +@@ -5,6 +5,6 @@
> + SWITCH_EVENT_DEVICE=/dev/input/event0
> +
> + TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
> +-TSKEYS_DEVICE=/dev/input/event1
> ++TSKEYS_DEVICE=/dev/input/touchscreen0
> +
> + ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
> +\ No newline at end of file
> +--- /tmp/mach-corgi-vars.in	2009-04-28 16:39:58.000000000 +0200
> ++++ zaurusd/config/mach-config/mach-corgi-vars.in	2009-04-28
> 16:40:06.000000000 +0200 +@@ -5,6 +5,6 @@
> + SWITCH_EVENT_DEVICE=/dev/input/event0
> +
> + TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
> +-TSKEYS_DEVICE=/dev/input/event1
> ++TSKEYS_DEVICE=/dev/input/touchscreen0
> +
> + ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
> +\ No newline at end of file
> +--- /tmp/mach-husky-vars.in	2009-04-28 16:39:58.000000000 +0200
> ++++ zaurusd/config/mach-config/mach-husky-vars.in	2009-04-28
> 16:40:06.000000000 +0200 +@@ -5,6 +5,6 @@
> + SWITCH_EVENT_DEVICE=/dev/input/event0
> +
> + TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
> +-TSKEYS_DEVICE=/dev/input/event1
> ++TSKEYS_DEVICE=/dev/input/touchscreen0
> +
> + ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
> +\ No newline at end of file
> +--- /tmp/mach-poodle-vars	2009-04-28 16:39:58.000000000 +0200
> ++++ zaurusd/config/mach-config/mach-poodle-vars	2009-04-28
> 16:40:06.000000000 +0200 +@@ -4,6 +4,6 @@
> + SWITCH_EVENT_DEVICE=/dev/input/event0
> +
> + #TSKEYS_CONF=@appconfdir@/tskeys/zaurus-clamshell.conf
> +-#TSKEYS_DEVICE=/dev/input/event1
> ++#TSKEYS_DEVICE=/dev/input/touchscreen0
> +
> + ALSA_MIXER_INIT=@appconfdir@/alsa/poodle-default.state
> +\ No newline at end of file
> +--- /tmp/mach-shepherd-vars.in	2009-04-28 16:39:58.000000000 +0200
> ++++ zaurusd/config/mach-config/mach-shepherd-vars.in	2009-04-28
> 16:40:06.000000000 +0200 +@@ -5,6 +5,6 @@
> + SWITCH_EVENT_DEVICE=/dev/input/event0
> +
> + TSKEYS_CONF=@appconfdir@/tskeys/zaurus-c7x0.conf
> +-TSKEYS_DEVICE=/dev/input/event1
> ++TSKEYS_DEVICE=/dev/input/touchscreen0
> +
> + ALSA_MIXER_INIT=@appconfdir@/alsa/c7x0-default.state
> +\ No newline at end of file
> +--- /tmp/mach-spitz-vars.in	2009-04-28 16:39:58.000000000 +0200
> ++++ zaurusd/config/mach-config/mach-spitz-vars.in	2009-04-28
> 16:40:06.000000000 +0200 +@@ -5,6 +5,6 @@
> + SWITCH_EVENT_DEVICE=/dev/input/event0
> +
> + TSKEYS_CONF=@appconfdir@/tskeys/zaurus-cxx00.conf
> +-TSKEYS_DEVICE=/dev/input/event1
> ++TSKEYS_DEVICE=/dev/input/touchscreen0
> +
> + ALSA_MIXER_INIT=@appconfdir@/alsa/cxx00-default.state
> +\ No newline at end of file
> +--- /tmp/mach-tosa-vars.in	2009-04-28 16:39:58.000000000 +0200
> ++++ zaurusd/config/mach-config/mach-tosa-vars.in	2009-04-28
> 16:40:06.000000000 +0200 +@@ -4,6 +4,6 @@
> + SWITCH_EVENT_DEVICE=/dev/input/event0
> +
> + #TSKEYS_CONF=@appconfdir@/tskeys/zaurus-clamshell.conf
> +-#TSKEYS_DEVICE=/dev/input/event1
> ++#TSKEYS_DEVICE=/dev/input/touchscreen0
> +
> + ALSA_MIXER_INIT=@appconfdir@/alsa/6000x-default.state
> +\ No newline at end of file
> diff --git a/recipes/zaurusd/zaurusd_svn.bb
> b/recipes/zaurusd/zaurusd_svn.bb index 2ad405e..b2b1622 100644
> --- a/recipes/zaurusd/zaurusd_svn.bb
> +++ b/recipes/zaurusd/zaurusd_svn.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPL"
>  DEPENDS = "tslib"
>  RDEPENDS = "procps"
>  PV = "0.0+svn${SRCDATE}"
> -PR = "r18"
> +PR = "r19"
>
>  SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=zaurusd;proto=http
> \ file://zaurus-hinge.in \
> @@ -18,7 +18,8 @@ SRC_URI =
> "svn://svn.o-hand.com/repos/misc/trunk;module=zaurusd;proto=http \
> file://zaurus-hinge.bl-on \
>  	   file://zaurus-hinge.bl-off \
>  	   file://01-check-toggle-landscape \
> -	   file://01-check-toggle-portait"
> +	   file://01-check-toggle-portait \
> +       file://use-ts-symlink-instead-of-hardcoding.diff;patch=1 "
>
>
>  S = "${WORKDIR}/${PN}"



