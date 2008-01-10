Received: from [72.14.220.156] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JCuMa-0007p4-DU
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2008 11:10:21 +0100
Received: by fg-out-1718.google.com with SMTP id 22so561876fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2008 02:10:11 -0800 (PST)
Received: by 10.86.66.1 with SMTP id o1mr1623327fga.23.1199956409008;
	Thu, 10 Jan 2008 01:13:29 -0800 (PST)
Received: from paul.bn.lan ( [194.79.8.34])
	by mx.google.com with ESMTPS id y18sm2222317fkd.17.2008.01.10.01.13.27
	(version=SSLv3 cipher=OTHER); Thu, 10 Jan 2008 01:13:27 -0800 (PST)
Date: Thu, 10 Jan 2008 11:19:17 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <456018236.20080110111917@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1199810941.6053.50.camel@localhost.localdomain>
References: <1824361960.20080106235611@gmail.com>
	<47825896.7030301@kernelconcepts.de>
	<1133928457.20080108163429@gmail.com>
	<1199810941.6053.50.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: angstrom-distro-devel@linuxtogo.org
Subject: Re: [RFC] Smallscreen mod for GtkFileChooser
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
X-List-Received-Date: Thu, 10 Jan 2008 10:10:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

Tuesday, January 8, 2008, 6:49:01 PM, you wrote:

[]

>> > Do we have a screenshot around to see how it looks? :)
>> 
>>   I still didn't try it due to the above. I'd like first a confirmation
>> from Poky people that merging those patches to OE will be of benefit
>> to them (for example, wider testing). Then we can review the
>> functionality. I do worry a bit about QVGA support, as all latest OH
>> workings seems to be not optimized for it (Sato, Pimlico).

> We're happy enough for wider testing. I can also confirm that patch
> works well for QVGA. I'm not sure about screenshots but qemu poky images
> are available from http://pokylinux.org/autobuild/poky/ and have a
> screenshot utility! I would make one but I don't have a suitable image
> handy :(.


  We talked with Richard on IRC on how to proceed with this, and
decided that I'd try Poky's patches and see what they offer.

  Well, not much joy here. Here's screenshot (as installed under
Angstrom, I'm sorry beforehand if Poky is different):
http://linuxtogo.org/gowiki/PaulSokolovsky?action=AttachFile&do=view&target=Poky-smallscreen.png

  So, what we see is that the design of the dialog is changed,
simplifying it to just a file list, parent dir button, and buttons for
mounted filesystems (same icons appeared in Angstrom image). There're
still "desktop" gaps and dialog sizing (3/4 of screen width, no resize
with matchbox).

  Looking at the patches, there's filechooser-respect-style.patch,
whose name and quick scan suggests that at least gaps might be
configurable by theme, but we have what we have and OE's "standard"
themes like Clearlooks and GPE Default. Also, I'm not gtk+ styling
expert, but for me it looks like it just does different arithmetic
with the numbers hardcoded as they were before ;-(.

  Main patch is filechooser-default.patch, and its size (~200k for
gtk+ 2.10, ~400k for 2.12) and content suggests that it was an
implementation for older gtk+, or completely different code, so it
removes large content of pristine gtk+'s file and replaces it with
something else.


  I welcome different reviews, and I really, really would prefer that
smallscreen support in gtk+ was done, and maintained, past me, but
based on the above, and the current scope of this work (*1), I would
like to raise the original proposal: to apply my patch, at least to
Angstrom stable branch. Of course, I'd prefer .dev to keep in sync
too, but if there're concerns that applying such patch would lead to
false feeling that the issue is solved once and for all, and someone
plans to work on that soon, .dev can be skipped. Otherwise, it still
can be applied - we of course can shuffle and swap patches anytime the
changes are required.



*1) To make Angstrom work well now, and in sustainable manner (that includes
applying as little and as short patches as possible, which would do as
little as possible changes to the upstream, if the upstream can be made
well enough usable with such small changes.


> Cheers,

> Richard



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



