Received: from [64.233.182.186] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1GbFfG-0005dL-HV
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Oct 2006 14:09:22 +0200
Received: by nf-out-0910.google.com with SMTP id l23so1735637nfc
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Oct 2006 05:02:07 -0700 (PDT)
Received: by 10.49.29.2 with SMTP id g2mr2375997nfj;
	Sat, 21 Oct 2006 05:02:07 -0700 (PDT)
Received: from CUBE ( [85.202.124.214])
	by mx.google.com with ESMTP id c28sm1275414nfb.2006.10.21.05.02.06;
	Sat, 21 Oct 2006 05:02:07 -0700 (PDT)
Date: Sat, 21 Oct 2006 15:02:07 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <175148202.20061021150207@gmail.com>
To: Erik Hovland <erik@hovland.org>
In-Reply-To: <20061014153521.GB15562@hovland.org>
References: <698474498.20061013195107@gmail.com>
	<20061013173454.GA25324@mage.jpl.nasa.gov>
	<137495124.20061014162300@gmail.com>
	<20061014151143.GA15562@hovland.org>
	<74d0deb30610140817w417b787dpa80f702436bf136a@mail.gmail.com>
	<20061014153521.GB15562@hovland.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] handhelds-pxa-2.6 -> linux-handhelds-2.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Oct 2006 12:09:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Erik,

Saturday, October 14, 2006, 6:35:21 PM, you wrote:

[]

> Well, *ahem* the defconfig that the -sa bb specifies will build a sa
> kernel, the defconfig that -pxa specifies will build a pxa kernel.

  Well, OE.dev now uses per-machine overrides for defconfigs, so this
won't be an issue.

> The recipes themselves do not bild in the constraint. Thanks for double
> checking.

  Ok, so we should be pretty safe to do the rename. I've cleared my
tree from otehr patches, so will start on this.


>   The related question is however EABI support on pre-armv5 arhcs.
> Koen, can you (possibly, once again ;-) ) elaborate, what we have
> here. I hope noone (maybe, except ARM Inc.) talks about no EABI
> support on armv4 machines? Maybe it won't be that thumb instruction
> (let there be more memory in each of us), maybe there indeed be armv4
> and armv5 specific binaries (with armv4 working around that
> isntruction), but we will have Angstrom and other coolness on
> all machines, right?

  Koen pointed me to the same old page regarding this:
http://wiki.debian.org/ArmEabiPort . So yes, there're ways to support
both armv4t and armv4 (i.e. thumb-less) archs with EABI. It's separate
question when thumb-less CPUs will be actually supported, but all
needed info for that is available.

  I also went to check what's the state of thumb support for CPUs used
in consumer PocketPC and Palm devices, and (sorry if that's well known
trivia) that only StrongARM SA1110 doesn't support thumb. I annotated
http://handhelds.org/moin/moin.cgi/HandheldHardwareXref with that
(well, I didn't really check OMAPs yet, but I'm sure they are
thumb-able).

  
> E




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



