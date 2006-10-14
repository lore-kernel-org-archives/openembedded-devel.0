Received: from [64.233.166.180] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <pmiscml@gmail.com>) id 1GYja4-0001TQ-2u
	for openembedded-devel@openembedded.org; Sat, 14 Oct 2006 15:29:36 +0200
Received: by py-out-1112.google.com with SMTP id z59so1291665pyg
	for <openembedded-devel@openembedded.org>;
	Sat, 14 Oct 2006 06:23:02 -0700 (PDT)
Received: by 10.35.113.12 with SMTP id q12mr8100268pym;
	Sat, 14 Oct 2006 06:23:01 -0700 (PDT)
Received: from CUBE ( [85.202.124.214])
	by mx.google.com with ESMTP id 36sm1551144nza.2006.10.14.06.23.00;
	Sat, 14 Oct 2006 06:23:01 -0700 (PDT)
Date: Sat, 14 Oct 2006 16:23:00 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <137495124.20061014162300@gmail.com>
To: Erik Hovland <erik@hovland.org>, Koen Kooi <koen@dominion.kabel.utwente.nl>
In-Reply-To: <20061013173454.GA25324@mage.jpl.nasa.gov>
References: <698474498.20061013195107@gmail.com>
	<20061013173454.GA25324@mage.jpl.nasa.gov>
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org,
	Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC] handhelds-pxa-2.6 -> linux-handhelds-2.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Oct 2006 13:29:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Erik,

Friday, October 13, 2006, 8:34:54 PM, you wrote:

> On Fri, Oct 13, 2006 at 07:51:07PM +0300, Paul Sokolovsky wrote:
>> 2. "pxa" there is misleading, as 2.6 tree supports different
>> architectures. Handhelds.org tree as of now supports PXA, SA, and S3
>> (Samsung) devices. To the various degrees, but that's improving.

> Technically, the pxa is not misleading per se. That recipe only builds a
> kernel for pxa devices.

  Well that's why I brought this to discussion. By "only builds" do
you mean the current state of affairs or some inherent constraint on
that recipe?

  If first, then true, we have only PXA in "production" (so to say)
level in HH.org CVS. But other archs do catch up. For example, rx3000
(S3) already has support for SD, i.e. pretty suitable to host a Linux
install ;-).

  If you mean the latter, then I don't see anything PXA-specific in
recipe itself. It will build with whatever defconfig is called by
MACHINE. Architecture-dependent gcc options are set outside (e.g.
tune-xscale.conf), and IIRC, there's actually possible to use specific
GCC version to build a kernel if it goes up to that. So, what other
arch dependencies I'm missing?



  The related question is however EABI support on pre-armv5 arhcs.
Koen, can you (possibly, once again ;-) ) elaborate, what we have
here. I hope noone (maybe, except ARM Inc.) talks about no EABI
support on armv4 machines? Maybe it won't be that thumb instruction
(let there be more memory in each of us), maybe there indeed be armv4
and armv5 specific binaries (with armv4 working around that
isntruction), but we will have Angstrom and other coolness on
all machines, right?

> But since we are not really targeting one kernel
> for several handhelds, I don't see a problem with what you propose.

  Yes, I checked this with OE maintainers and as I heard this was
discussed on OEDEM: it's ok to have separate MACHINE (and thus,
kernel) for each device which deserves that (i.e. not just marketing
renaming of another model). However, it's desirable to get rid of
machine dependency for all other packages where it reasonably can be
done (runtime checks and configuration is ok means for that, if
it doesn't lead to gross code size/quality issues and noticable
performance loss; hopefully, we have few cases of that being otherwise
in 10-20 machine-dependent packages we have now).

> E




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



