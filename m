Received: from [216.182.48.170] (helo=beastbox.kfctristate.com)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <tom@openhardware.net>) id 1IA49S-0008RT-77
	for openembedded-devel@openembedded.org; Sun, 15 Jul 2007 15:28:44 +0200
Received: (qmail 25407 invoked from network); 15 Jul 2007 13:28:43 -0000
Received: from unknown (HELO ?172.30.107.2?) (172.30.107.2)
	by beastbox.kfctristate.com with SMTP; 15 Jul 2007 13:28:43 -0000
Message-ID: <469A20F8.2040707@openhardware.net>
Date: Sun, 15 Jul 2007 09:28:24 -0400
From: Tom Walsh <tom@openhardware.net>
User-Agent: Thunderbird 1.5.0.10 (X11/20070305)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <468C7B11.8050809@openhardware.net>
	<200707091643.00611.openembedded@hrw.one.pl>
In-Reply-To: <200707091643.00611.openembedded@hrw.one.pl>
Subject: Re: howto? Build something but not deploy in root image
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
X-List-Received-Date: Sun, 15 Jul 2007 13:28:46 -0000
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8bit

Marcin Juszkiewicz wrote:
> Dnia czwartek, 5 lipca 2007, Tom Walsh napisa³:
>
>   
>> I have several parts to this project that must be built during the
>> bitbake process (bootstrap-image), but are not part of the target
>> filesystem image.  The total system parts are:
>>
>> * bootloader - ARM - resides in Flash.
>> * kernel - ARM - resides in Flash.
>> * target rootfs image - ARM - resides on MMC card.
>> * Flash Utility - native (x86) - runs on host computer.
>>     
>
> In machine config add:
>
> IMAGEDEPENDS = "bootloader flash-utility-native"
>
> Basically it should be MACHINE_EXTRA_DEPENDS but we do not support it yet 
> properly.
>
>   
>> The only thing that I need in the root filesystem (tmp/rootfs/) is the
>> packages I named from the local conf files. 
>>     
>
> Create own image recipe and add those packages to RDEPENDS and 
> PACKAGE_INSTALL.
>
>   

Yes, that is what I was trying to avoid: building a custom image 
recipe.  It just seemed that it should be possible to thwart the copy of 
the kernel image into /boot from setting a variable or something.  The 
OE system changes quite frequently and I found myself in trouble with my 
own image recipe where I was "away" for several months and "returned".

Adding a DEPENDS for the bootloader and utils within the kernel recipe 
did resolve the issue of having the  image recipe attempting to install 
those two packages into the IMAGE.  I still have a 1.3Meg kernel in the 
/boot directory, though, I guess half a loaf is better than none?  At 
least OE now builds the entire project without stopping along the way to 
complain about "iconv.h" and other such things.

Regards,

TomW

-- 
Tom Walsh - WN3L - Embedded Systems Consultant
http://openhardware.net http://cyberiansoftware.com http://openzipit.org
"Windows? No thanks, I have work to do..."
----------------------------------------------------




