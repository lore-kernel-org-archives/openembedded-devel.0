Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <thommycheck@gmx.de>) id 1JKDyi-0003QP-8K
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2008 15:32:00 +0100
Received: (qmail invoked by alias); 30 Jan 2008 12:45:17 -0000
Received: from unknown (EHLO [10.117.55.125]) [212.201.107.125]
	by mail.gmx.net (mp026) with SMTP; 30 Jan 2008 13:45:17 +0100
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX18d2Y5MoJod+XPHAL5NNRIy12PRDW7Tl+/OIvAWsA
	j26jiObEhW9LSL
Message-ID: <47A0715C.8010003@gmx.de>
Date: Wed, 30 Jan 2008 13:45:16 +0100
From: Thomas Kunze <thommycheck@gmx.de>
User-Agent: Thunderbird 1.5.0.14 (X11/20060911)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47A05B52.6000202@gmail.com>
In-Reply-To: <47A05B52.6000202@gmail.com>
X-Y-GMX-Trusted: 0
Subject: Re: [RFC] add kernel-module-loop to roofs for collie and tosa
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2008 14:32:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Junqian Gordon Xu wrote:
> altboot-console-image needs loopback file support either in the kernel 
> or as kernel module. CONFIG_BLK_DEV_LOOP=m were set for both collie and 
> tosa. Other Z deviced has loopback file support built into the kernel. 
> I would propose the following change [both dev and stable] to pack 
> kernel-module-loop into the default rootfs for collie and tosa; and bump 
> PR for task-base.
>
> ============================================================
> --- conf/machine/collie.conf	c23a85835bc13ac978f36742cfc8ccf5880e0ec8
> +++ conf/machine/collie.conf	062e7d70c35cf3f4db0e10e8b9f254fd47e39952
> @@ -14,5 +14,7 @@ IMAGE_FSTYPES ?= "jffs2 tar.gz"
>   IMAGE_LINGUAS = ""
>   IMAGE_FSTYPES ?= "jffs2 tar.gz"
>
> +MACHINE_EXTRA_RRECOMMENDS += "kernel-module-loop"
> +
>   ROOT_FLASH_SIZE = "14"
>   # actually 14680064, see EXTRA_IMAGECMD above
> ============================================================
> --- conf/machine/tosa.conf	bdda7deb7ee9f2d950ee255097efcdfa1cf7a39a
> +++ conf/machine/tosa.conf	94e6eda28ba66d57c2ef49c6c11c78bf0c311349
> @@ -7,6 +7,6 @@ IMAGE_FSTYPES ?= "jffs2"
>   IMAGE_FSTYPES ?= "jffs2"
>
>   # wlan-ng Modules
> -MACHINE_EXTRA_RRECOMMENDS += "wlan-ng-modules-usb"
> +MACHINE_EXTRA_RRECOMMENDS += "wlan-ng-modules-usb kernel-module-loop"
>
>   ROOT_FLASH_SIZE = "28"
>
>
> Regards
> Gordon
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   
Wouldn't it be better do make altboot depend on kernel-modules-loop?


