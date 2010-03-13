Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NqOKk-0004Ef-LW
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Mar 2010 11:12:43 +0100
Received: (qmail 8675 invoked by uid 1003); 13 Mar 2010 10:09:35 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 13 Mar 2010 10:09:35 -0000
Message-ID: <4B9B645D.5000907@balister.org>
Date: Sat, 13 Mar 2010 05:09:33 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8) Gecko/20100301 Fedora/3.0.3-1.fc11 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1268433000-4728-1-git-send-email-ulf.samuelsson@atmel.com>
In-Reply-To: <1268433000-4728-1-git-send-email-ulf.samuelsson@atmel.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] console-at91sam9-image: console-image with apps
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
X-List-Received-Date: Sat, 13 Mar 2010 10:12:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2010 05:30 PM, Ulf Samuelsson wrote:
> From: Nicolas Ferre<nicolas.ferre@atmel.com>
>
> Create a derivative of console-image with more applications
>
> +       usbview
> +       mplayer
> +       thttpd
> +       madplay
> +       alsa-utils-aplay
> +       alsa-utils-amixer
> +       iperf
> +       dosfstools
> +       mtd-utils
>
> Signed-off-by: Ulf Samuelsson<ulf.samuelsson@atmel.com>
> ---
>   recipes/images/console-at91sam9-image.bb |   34 ++++++++++++++++++++++++++++++
>   1 files changed, 34 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/images/console-at91sam9-image.bb
>
> diff --git a/recipes/images/console-at91sam9-image.bb b/recipes/images/console-at91sam9-image.bb
> new file mode 100644
> index 0000000..7aae0fb
> --- /dev/null
> +++ b/recipes/images/console-at91sam9-image.bb
> @@ -0,0 +1,34 @@
> +#Angstrom bootstrap at91sam9 image
> +
> +IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
> +
> +ANGSTROM_EXTRA_INSTALL += " \
> +	usbview \
> +	mplayer \
> +	thttpd \
> +	madplay \
> +	alsa-utils-aplay \
> +	alsa-utils-amixer \
> +	iperf \
> +	dosfstools \
> +	mtd-utils \
> +#	nbench-byte \
> +	"

You should add these packages to IMAGE_INSTALL and (if you want the user 
to insert additional packages via an env var) add the var 
IMAGE_EXTRA_INSTALL to the IMAGE_INSTALL list. We do not want to keep 
adding the ANGSTROM_EXTRA_INSTALL variable to recipes that are not 
distro specific.

Philip

> +
> +DEPENDS = "task-base-extended \
> +           ${@base_contains("MACHINE_FEATURES", "screen", "psplash-zap", "",d)} \
> +	   "
> +
> +IMAGE_INSTALL = "task-base-extended \
> +	    ${ANGSTROM_EXTRA_INSTALL} \
> +	    ${@base_contains("MACHINE_FEATURES", "screen", "psplash-zap", "",d)} \
> +	   "
> +
> +export IMAGE_BASENAME = "console-at91sam9-image"
> +IMAGE_LINGUAS = ""
> +
> +#we dont need the kernel in the image
> +ROOTFS_POSTPROCESS_COMMAND += "rm -f ${IMAGE_ROOTFS}/boot/*Image*; "
> +
> +inherit image
> +


