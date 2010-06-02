Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OJi9H-0002wx-JV
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 09:14:00 +0200
Received: (qmail 27643 invoked by uid 503); 2 Jun 2010 07:03:44 -0000
Received: from b6.ovh.net (HELO mail606.ha.ovh.net) (213.186.33.56)
	by 30.mail-out.ovh.net with SMTP; 2 Jun 2010 07:03:44 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 2 Jun 2010 09:09:46 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 2 Jun 2010 09:09:46 +0200
Message-ID: <4C0603B9.8090200@eukrea.com>
Date: Wed, 02 Jun 2010 09:09:45 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: Vitus Jensen <vjensen@gmx.de>
References: <1275435453-1118-1-git-send-email-vjensen@gmx.de>
In-Reply-To: <1275435453-1118-1-git-send-email-vjensen@gmx.de>
X-Ovh-Tracer-Id: 268527129507114269
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] linux-n1200_2.6.27-rc9+git: change KERNEL_OUTPUT to a	relative path
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
X-List-Received-Date: Wed, 02 Jun 2010 07:14:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 02/06/2010 01:37, Vitus Jensen a écrit :
> deploy method in kernel.bbclass automatically adds {S}
>
> Signed-off-by: Vitus Jensen<vjensen@gmx.de>
> ---
>   recipes/linux/linux-n1200_2.6.27-rc9+git.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/linux/linux-n1200_2.6.27-rc9+git.bb b/recipes/linux/linux-n1200_2.6.27-rc9+git.bb
> index d6751d0..31a07cd 100644
> --- a/recipes/linux/linux-n1200_2.6.27-rc9+git.bb
> +++ b/recipes/linux/linux-n1200_2.6.27-rc9+git.bb
> @@ -13,7 +13,7 @@ S = "${WORKDIR}/linux-2.6.27-foonas-git"
>   export ARCH="powerpc"
>
>   # Bootloader is not device tree aware
> -KERNEL_OUTPUT = "${S}/arch/powerpc/boot/cuImage.thecus_n1200"
> +KERNEL_OUTPUT = "arch/powerpc/boot/cuImage.thecus_n1200"
>
>   require linux.inc
>
applied thanks
Eric


