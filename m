Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MANwO-0006AN-BQ
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 14:45:36 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MANo7-000762-Qb
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 12:37:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 30 May 2009 12:37:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 30 May 2009 12:37:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 30 May 2009 14:36:45 +0200
Message-ID: <gvr98t$m7g$1@ger.gmane.org>
References: <32175.6964237013$1243684428@news.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090522 Shredder/3.0b3pre
In-Reply-To: <32175.6964237013$1243684428@news.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] usb-gadget-mode: Add defaults for omap3-pandora and fix broken script.
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
X-List-Received-Date: Sat, 30 May 2009 12:45:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30-05-09 13:51, John Willis wrote:
> Add default usb-gadget mode for the omap3-pandora and fix typo in
> recipes/usb-gadget-mode/files/usb-gadget that breaks package.
>
> Signed-off-by: John Willis<John.Willis@Distant-earth.com>

Applied, I'll push it out with the rest of my commits next week

regards,

Koen

>
> ---
>   .../files/omap3-pandora/usb-gadget.conf            |    3 +++
>   recipes/usb-gadget-mode/files/usb-gadget           |    2 +-
>   recipes/usb-gadget-mode/usb-gadget-mode.bb         |    2 +-
>   3 files changed, 5 insertions(+), 2 deletions(-)
>   create mode 100755
> recipes/usb-gadget-mode/files/omap3-pandora/usb-gadget.conf
>   mode change 100644 =>  100755 recipes/usb-gadget-mode/usb-gadget-mode.bb
>
> diff --git a/recipes/usb-gadget-mode/files/omap3-pandora/usb-gadget.conf
> b/recipes/usb-gadget-mode/files/omap3-pandora/usb-gadget.conf
> new file mode 100755
> index 0000000..35ff0d4
> --- /dev/null
> +++ b/recipes/usb-gadget-mode/files/omap3-pandora/usb-gadget.conf
> @@ -0,0 +1,3 @@
> +USB_MODE="composite"
> +MODULE_OPTIONS=""
> +
> diff --git a/recipes/usb-gadget-mode/files/usb-gadget
> b/recipes/usb-gadget-mode/files/usb-gadget
> index c9ff2f0..0e6b39f 100755
> --- a/recipes/usb-gadget-mode/files/usb-gadget
> +++ b/recipes/usb-gadget-mode/files/usb-gadget
> @@ -26,7 +26,7 @@ go() {
>   	networking)	setup_usb g_ether "$MODULE_OPTIONS" ;;
>   	zero)		setup_usb g_zero "$MODULE_OPTIONS" ;;
>   	midi)		setup_usb g_midi "$MODULE_OPTIONS" ;;
> -	printer		setup_usb g_printer "$MODULE_OPTIONS" ;;
> +	printer)	setup_usb g_printer "$MODULE_OPTIONS" ;;
>   	gadgetfs) 	setup_usb gadgetfs "$MODULE_OPTIONS" ;;
>   	composite)	setup_usb g_cdc "$MODULE_OPTIONS" ;;
>   	storage)	setup_usb g_file_storage "$MODULE_OPTIONS" ;;
> diff --git a/recipes/usb-gadget-mode/usb-gadget-mode.bb
> b/recipes/usb-gadget-mode/usb-gadget-mode.bb
> old mode 100644
> new mode 100755
> index cc00a88..e6e8e51
> --- a/recipes/usb-gadget-mode/usb-gadget-mode.bb
> +++ b/recipes/usb-gadget-mode/usb-gadget-mode.bb
> @@ -9,7 +9,7 @@ DESCRIPTION = "Manage the default USB gadget mode"
>   SECTION = "console/network"
>   LICENSE = "GPL"
>   PV = "0.0.2"
> -PR = "r2"
> +PR = "r3"
>
>   SRC_URI = "\
>     file://usb-gadget.conf \




