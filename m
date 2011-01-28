Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PitId-0007Fb-5Z
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 19:44:00 +0100
Received: (qmail 4500 invoked by uid 503); 28 Jan 2011 18:40:25 -0000
Received: from b9.ovh.net (HELO mail419.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 28 Jan 2011 18:40:25 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 28 Jan 2011 20:43:10 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 28 Jan 2011 20:43:10 +0200
Message-ID: <4D430E3D.3040207@eukrea.com>
Date: Fri, 28 Jan 2011 19:43:09 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296219611-14580-1-git-send-email-sujak.marek@gmail.com>
	<AANLkTim0qsgQExvKhTQtPAyZz8cPos4osWFDDmxfEhjx@mail.gmail.com>
In-Reply-To: <AANLkTim0qsgQExvKhTQtPAyZz8cPos4osWFDDmxfEhjx@mail.gmail.com>
X-Ovh-Tracer-Id: 1026257766544289097
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
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
X-List-Received-Date: Fri, 28 Jan 2011 18:44:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Khem,

On 28/01/2011 18:50, Khem Raj wrote:
>> +PREFERRED_PROVIDER_virtual/bootloader = "barebox"
>> +PREFERRED_PROVIDER_virtual/kernel = "linux"
>> +PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
>
> what xserver is chosen is s distro choice do not lock it here.
>
not sure of this point : the distro don't know if you want xserver-xorg or 
xserver-kdrive for your machine.
>> +
>> +PREFERRED_VERSION_linux = "2.6.35"
>
> kernel should not be pinned in conf file but in the kernel recipe itself
> you should add PREFERRRED_PROVIDER_yourmacine = ...
>
>> +
>> +MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget touchscreen keyboard"
>> +
>> +GUI_MACHINE_CLASS = "bigscreen"
>> +XSERVER ?= "xserver-xorg \
>> +           xf86-input-tslib \
>> +           xf86-input-evdev \
>> +           xf86-input-mouse \
>> +           xf86-input-keyboard \
>> +           xf86-video-fbdev \
>> +"
>
> this two defines should be part of distros to pin not machines.
>
I'm not sure of this :
GUI_MACHINE_CLASS is about the machine not the distro.
XSERVER's choice depends on the machine not on the distro.

Eric


