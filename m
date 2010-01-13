Received: from exprod5og105.obsmtp.com ([64.18.0.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@gefanuc.com>) id 1NV3EO-0002DX-Si
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 14:25:56 +0100
Received: from source ([4.79.213.129]) (using TLSv1) by
	exprod5ob105.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS03JX7sAj0u1nYyN6tjPgkSX7vRXMBoY@postini.com;
	Wed, 13 Jan 2010 05:23:44 PST
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Alpmlip07.e2k.ad.ge.com with ESMTP; 13 Jan 2010 08:23:43 -0500
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 13 Jan 2010 08:23:42 -0500
Message-ID: <4B4DCA07.4050005@gefanuc.com>
Date: Wed, 13 Jan 2010 13:26:31 +0000
From: Martyn Welch <martyn.welch@gefanuc.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <97332218.1263387312.156294792.17546@mcgi47.rambler.ru>
In-Reply-To: <97332218.1263387312.156294792.17546@mcgi47.rambler.ru>
X-SA-Exim-Connect-IP: 64.18.0.180
X-SA-Exim-Mail-From: martyn.welch@gefanuc.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Adding a new Machine question
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
X-List-Received-Date: Wed, 13 Jan 2010 13:25:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Perepelica Alexander wrote:
> Hi!
> I have problem with configs for new x86_64 machine.
> How I read in manual I need set next vasiables
> 1. TARGET_ARCH
>  TARGET_ARCH = "x86_64"
> 2. MACHINE_FEATURES
> MACHINE_FEATURES = "kernel26 screen keyboard pci usbhost acpi ext2 x86"
> MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
> 3. PREFERRED_PROVIDER_virtual/kernel
> PREFERRED_PROVIDER_virtual/kernel = "linux"
> And now when I build  helloworld-image all is ok i get my RFS image.
> But when I try build bootstrap-image I got error
> "  no such directory asm-x86" but I see dir with name "asm-generic" and
> name of machine conf file is x86_64-generic.conf.
> So, I don't understand what I do wrong?
>

I think I had this problem as well when compiling for a i586-generic
(infact i686-generic and x86 as well).

All the kernel bitbake files contain DEFAULT_PREFERENCE = "-1" and the
bitbake file for the newest kernel (linux_2.6.32+2.6.33-rc3.bb
<http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux/linux_2.6.32+2.6.33-rc3.bb>
I think) was failing for x86.

I modified linux_2.6.32.bb
<http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux/linux_2.6.32.bb>
from:

|DEFAULT_PREFERENCE = "-1"
|

to:

|DEFAULT_PREFERENCE = "1"
|

and was able to build (though I haven't got around to testing the
resulting kernel yet...)

Martyn


-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@gefanuc.com                   |   M2 3AB  VAT:GB 927559189



