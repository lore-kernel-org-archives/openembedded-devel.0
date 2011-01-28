Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PitXm-0007Vk-Hq
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 19:59:38 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PitWx-0000Pt-GK from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 10:58:47 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 28 Jan 2011 10:58:45 -0800
Received: from [172.30.80.64] ([172.30.80.64]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 28 Jan 2011 11:58:44 -0700
Message-ID: <4D4311DE.9070605@mentor.com>
Date: Fri, 28 Jan 2011 11:58:38 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296219611-14580-1-git-send-email-sujak.marek@gmail.com>	<AANLkTim0qsgQExvKhTQtPAyZz8cPos4osWFDDmxfEhjx@mail.gmail.com>
	<4D430E3D.3040207@eukrea.com>
In-Reply-To: <4D430E3D.3040207@eukrea.com>
X-OriginalArrivalTime: 28 Jan 2011 18:58:45.0063 (UTC)
	FILETIME=[63453D70:01CBBF1D]
Subject: Re: [PATCH v2] VMX25: Add machine support for vmx25
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
X-List-Received-Date: Fri, 28 Jan 2011 18:59:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 01/28/2011 11:43 AM, Eric Bénard wrote:
> Hi Khem,
>
> On 28/01/2011 18:50, Khem Raj wrote:
>>> +PREFERRED_PROVIDER_virtual/bootloader = "barebox"
>>> +PREFERRED_PROVIDER_virtual/kernel = "linux"
>>> +PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
>>
>> what xserver is chosen is s distro choice do not lock it here.
>>
> not sure of this point : the distro don't know if you want xserver-xorg
> or xserver-kdrive for your machine.
>>> +
>>> +PREFERRED_VERSION_linux = "2.6.35"
>>
>> kernel should not be pinned in conf file but in the kernel recipe itself
>> you should add PREFERRRED_PROVIDER_yourmacine = ...
>>
>>> +
>>> +MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget touchscreen
>>> keyboard"
>>> +
>>> +GUI_MACHINE_CLASS = "bigscreen"
>>> +XSERVER ?= "xserver-xorg \
>>> + xf86-input-tslib \
>>> + xf86-input-evdev \
>>> + xf86-input-mouse \
>>> + xf86-input-keyboard \
>>> + xf86-video-fbdev \
>>> +"
>>
>> this two defines should be part of distros to pin not machines.
>>
> I'm not sure of this :
> GUI_MACHINE_CLASS is about the machine not the distro.
> XSERVER's choice depends on the machine not on the distro.

Agreed.  The machine dictates what will and will not make the hardware 
function here.  That said, we ought to make that the default rather than 
xserver-kdrive :)

-- 
Tom Rini
Mentor Graphics Corporation


