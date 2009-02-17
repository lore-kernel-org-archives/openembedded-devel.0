Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LZSwy-0002ht-20
	for openembedded-devel@openembedded.org; Tue, 17 Feb 2009 17:37:40 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090217163527.WIOM11567.fed1rmmtao104.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 17 Feb 2009 11:35:27 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id H4bS1b00P1E665w044bSQ5; Tue, 17 Feb 2009 11:35:27 -0500
X-Authority-Analysis: v=1.0 c=1 a=VmMwIalPbQoA:10 a=7GgQa5d7hcEA:10
	a=_QH82EnQ1dAesEIUCmMA:9 a=BuMz2ZsTv2fmgt9eoXAA:7
	a=F6TzzK3bAH9rZzY7FHGOBRQvk58A:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 17 Feb 2009 09:35:26 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090217163526.GF11815@smtp.west.cox.net>
References: <gneadq$s6g$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gneadq$s6g$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [RFC] removing DISTRO_* vars from task-boot
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
X-List-Received-Date: Tue, 17 Feb 2009 16:37:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 17, 2009 at 01:26:34PM +0100, Koen Kooi wrote:

> Hi,
>
> Lately I have been wondering how to change the /dev manager on a per  
> image base, since I want udev for most images and busybox-mdev for  
> special-purpose stuff. The catch is that I want to keep using task-boot  
> for both.
>
> Currently we have:
>
> DISTRO_DEV_MANAGER ?= "${@base_contains("MACHINE_FEATURES", "kernel26",  
> "udev","",d)} "
> DISTRO_INIT_MANAGER ?= "sysvinit sysvinit-pidof"
> DISTRO_INITSCRIPTS ?= "initscripts"
> DISTRO_LOGIN_MANAGER ?= "tinylogin"
>
> in task-boot.bb
>
> There are various ways we could attack this:
>
> 1) The image.bbclass way:
>
>   Put the following in image.bbclass:
>
>   IMAGE_DEV_MANAGER ?= "${@base_contains("MACHINE_FEATURES", "kernel26",  
> "udev","",d)} "
>   IMAGE_INIT_MANAGER ?= "sysvinit sysvinit-pidof"
>   IMAGE_INITSCRIPTS ?= "initscripts"
>   IMAGE_LOGIN_MANAGER ?= "tinylogin"
>
>   Pros:
>   * Takes immediate effect
>   * Can have distro defaults, overridable per image
>
>   Cons:
>   * marks them as 'user installed'
>   * you can't 'debootstrap' from tasks anymore, you need to encode  
> knowledge about the above vars into the debootstrap script

I really like this one as for our uses there's times where I'd rather
let busybox handle INIT_MANAGER and LOGIN_MANAGER too.

-- 
Tom Rini


