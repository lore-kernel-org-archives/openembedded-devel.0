Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1UNevy-0001Ap-V1
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 09:50:13 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.80.1)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1UNefM-001hRk-Qj>; Thu, 04 Apr 2013 09:33:00 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.80.1)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1UNefM-000KG4-P8>; Thu, 04 Apr 2013 09:33:00 +0200
Received: from heinold by andorra.imp.fu-berlin.de with local (internal_ws
	Exim 4.72) id 1UNefL-0002iW-MP
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Apr 2013 09:32:59 +0200
Date: Thu, 4 Apr 2013 09:32:59 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130404073259.GA8722@mi.fu-berlin.de>
References: <515C5DE6.6040702@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <515C5DE6.6040702@pseudoterminal.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: New meta-cubox layer
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
X-List-Received-Date: Thu, 04 Apr 2013 07:50:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 03, 2013 at 06:50:46PM +0200, Carlos Rafael Giani wrote:
> Hello,
> 
> I have created a BSP layer for the SolidRun Cubox platform. Informations about this device can be found athttp://solid-run.com/cubox  .
> The layer itself is hosted athttps://github.com/dv1/meta-cubox  .
> 
> This layer introduces a new machine, new tunes for the CuBox' Marvell PJ4 processor, in addition to the platform specific recipes for hardware video acceleration and EGL,OpenGL ES,OpenVG support. Both hardfp and softfp are supported.
> The 3D accelerator and the hardware accelerated video engine (called vMeta) require some closed source components. The recipes pick the right ones depending on whether softpfp or hardfp is used.
> 
> It also copies the generated uImage into the rootfs (as expected by the bootloader), and autogenerates a boot.scr out of an included boot script using uboot-mkimage.
> The resulting tarball is extracted on an SD card, and the device can be booted.
> 
> A new xorg driver and a customized xorg.conf are included.
> 
> I'm open to feedback, patches, suggestions.
> 
> Thanks

Hi,

nice work, but I wonder why the u-boot needs a boot.scr. Is it that old or can you switch it over to uEnv.txt so it is easier for people
to change kernel cmdline and other u-boot config stuff.

Bye Henning


