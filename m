Received: from mxa.rambler.ru ([81.19.66.231])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alexondi@rambler.ru>) id 1NV5pq-0002Dp-RS
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 17:12:45 +0100
Received: from mcgi25.rambler.ru (mcgi25.rambler.ru [81.19.67.67])
	by mxa.rambler.ru (Postfix) with ESMTP id 9EB0574F08
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 19:10:34 +0300 (MSK)
Received: from mcgi25.rambler.ru (localhost [127.0.0.1])
	by mcgi25.rambler.ru (Postfix) with ESMTP id 05B3C1700D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 19:10:32 +0300 (MSK)
Received: from [77.52.208.230] by mcgi25.rambler.ru with HTTP (mailimap);
	Wed, 13 Jan 2010 19:10:29 +0300
From: Perepelica Alexander <alexondi@rambler.ru>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Jan 2010 19:10:29 +0300
MIME-Version: 1.0
Message-Id: <318819580.1263399029.155991028.16785@mcgi25.rambler.ru>
X-Mailer: Ramail 3u, (untone), http://mail.rambler.ru
X-SA-Exim-Connect-IP: 81.19.66.231
X-SA-Exim-Mail-From: alexondi@rambler.ru
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
X-List-Received-Date: Wed, 13 Jan 2010 16:12:46 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; format="flowed"

Thank you, Martyn!
I remove my changes from linux_2.6.32+2.6.33-rc3.bb and I build was 
successful but don't boot with image :(  - all hangs

Perepelica Alexander wrote:
> Hi!
> I have problem with configs for new x86_64 machine.
> How I read in manual I need set next vasiables
> 1. TARGET_ARCH
>  TARGET_ARCH = "x86_64"
> 2. MACHINE_FEATURES
> MACHINE_FEATURES = "kernel26 screen keyboard pci usbhost acpi ext2
x86"
> MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
> 3. PREFERRED_PROVIDER_virtual/kernel
> PREFERRED_PROVIDER_virtual/kernel = "linux"
> And now when I build  helloworld-image all is ok i get my RFS image.
> But when I try build bootstrap-image I got error
> "  no such directory asm-x86" but I see dir with name "asm-generic"
and
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
Martyn Welch (Principal Software Engineer)   |   Registered in England
and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square,
Manchester,
E martyn.welch@gefanuc.com                   |   M2 3AB  VAT:GB
927559189


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


