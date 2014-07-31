Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 2C66A70632
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 22:56:14 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id A5822F811FE; Thu, 31 Jul 2014 16:56:15 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 97C98F811FD;
	Thu, 31 Jul 2014 16:56:13 -0600 (MDT)
Message-ID: <53DAC99F.6070701@mlbassoc.com>
Date: Thu, 31 Jul 2014 16:56:31 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1406846802-1311-1-git-send-email-andrea.adami@gmail.com>
In-Reply-To: <1406846802-1311-1-git-send-email-andrea.adami@gmail.com>
Subject: Re: [meta-initramfs][PATCH] kexecboot: remove trailing slash in do_install
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jul 2014 22:56:21 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-07-31 16:46, Andrea Adami wrote:
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>   meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
> index d0176c5..1fb5f0d 100644
> --- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
> +++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
> @@ -48,7 +48,7 @@ EXTRA_OECONF = "--enable-delay=2 --enable-evdev-rate=1000,250"
>
>   do_install () {
>       install -d ${D}${bindir}
> -    install -m 0755 kexecboot ${D}${bindir}/
> +    install -m 0755 kexecboot ${D}${bindir}
>       install -d ${D}/proc
>       install -d ${D}/mnt
>       install -d ${D}/dev
>

What is the reason for this change.  Using XXX/ is quite common
in OE recipes.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

