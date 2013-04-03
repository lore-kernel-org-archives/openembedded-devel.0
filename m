Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UNSR3-00036X-51
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 20:29:25 +0200
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id BB5F92130F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2013 20:12:15 +0200 (CEST)
Message-ID: <515C7100.9020509@pseudoterminal.org>
Date: Wed, 03 Apr 2013 20:12:16 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <515C5DE6.6040702@pseudoterminal.org>
	<35A30735-BA00-4711-8C20-453733BB9353@gmail.com>
In-Reply-To: <35A30735-BA00-4711-8C20-453733BB9353@gmail.com>
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
X-List-Received-Date: Wed, 03 Apr 2013 18:29:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-04-03 19:52, Khem Raj wrote:
> On Apr 3, 2013, at 9:50 AM, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
>
>> Hello,
>>
>> I have created a BSP layer for the SolidRun Cubox platform. Informations about this device can be found athttp://solid-run.com/cubox  .
>> The layer itself is hosted athttps://github.com/dv1/meta-cubox  .
>>
>> This layer introduces a new machine, new tunes for the CuBox' Marvell PJ4 processor, in addition to the platform specific recipes for hardware video acceleration and EGL,OpenGL ES,OpenVG support. Both hardfp and softfp are supported.
>> The 3D accelerator and the hardware accelerated video engine (called vMeta) require some closed source components. The recipes pick the right ones depending on whether softpfp or hardfp is used.
>>
>> It also copies the generated uImage into the rootfs (as expected by the bootloader), and autogenerates a boot.scr out of an included boot script using uboot-mkimage.
>> The resulting tarball is extracted on an SD card, and the device can be booted.
>>
>> A new xorg driver and a customized xorg.conf are included.
>>
>> I'm open to feedback, patches, suggestions.
>
> Carlos
>
> Thanks for doing this. Please add this to layer index here http://layers.openembedded.org/layerindex/
>
>

Hello,

it is added.

Carlos


