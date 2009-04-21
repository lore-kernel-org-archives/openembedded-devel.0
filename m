Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LwN8o-0005f2-N6
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 23:04:30 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LwN4V-00027T-2X
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 21:00:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 21:00:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 21:00:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Apr 2009 22:35:05 +0200
Message-ID: <gslalp$mfs$4@ger.gmane.org>
References: <1239882421-19769-1-git-send-email-khimov@altell.ru>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <1239882421-19769-1-git-send-email-khimov@altell.ru>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] image.bbclass: IMAGE_VARS->IMAGE_BOOT, make overridable
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
X-List-Received-Date: Tue, 21 Apr 2009 21:04:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I think this should be done in a slightly different way, but that can be 
done after this is in.

Acked-by: Koen Kooi <koen@openembedded.org>


On 16-04-09 13:47, Roman I Khimov wrote:
> IMAGE_VARS usage forces images to have init, dev management, login
> management and other stuff. In cases where you don't need any of those
> (like initramfs images or other special-purpose images) you need to
> override 4 variables in order to get clean image that only installs
> things from IMAGE_INSTALL.
>
> So, this changes IMAGE_VARS to more meaningful IMAGE_BOOT and makes it
> possible to build images without boot components with single
> IMAGE_BOOT="".
> ---
>   classes/image.bbclass |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/classes/image.bbclass b/classes/image.bbclass
> index fd0df4d..9012de2 100644
> --- a/classes/image.bbclass
> +++ b/classes/image.bbclass
> @@ -17,16 +17,16 @@ IMAGE_INITSCRIPTS ?= "initscripts"
>   #
>   IMAGE_LOGIN_MANAGER ?= "tinylogin"
>
> -IMAGE_VARS = "${IMAGE_INITSCRIPTS} \
> +IMAGE_BOOT ?= "${IMAGE_INITSCRIPTS} \
>   ${IMAGE_DEV_MANAGER} \
>   ${IMAGE_INIT_MANAGER} \
>   ${IMAGE_LOGIN_MANAGER} "
>
> -RDEPENDS += "${IMAGE_INSTALL} ${IMAGE_VARS}"
> +RDEPENDS += "${IMAGE_INSTALL} ${IMAGE_BOOT}"
>
>   # "export IMAGE_BASENAME" not supported at this time
>   IMAGE_BASENAME[export] = "1"
> -export PACKAGE_INSTALL ?= "${IMAGE_INSTALL} ${IMAGE_VARS}"
> +export PACKAGE_INSTALL ?= "${IMAGE_INSTALL} ${IMAGE_BOOT}"
>
>   # We need to recursively follow RDEPENDS and RRECOMMENDS for images
>   do_rootfs[recrdeptask] += "do_deploy do_populate_staging"




