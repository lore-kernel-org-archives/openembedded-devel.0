Received: from [209.85.146.180] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JQ3Rg-0005NX-6c
	for openembedded-devel@openembedded.org; Fri, 15 Feb 2008 17:29:54 +0100
Received: by wa-out-1112.google.com with SMTP id v27so1438344wah.4
	for <openembedded-devel@openembedded.org>;
	Fri, 15 Feb 2008 08:29:34 -0800 (PST)
Received: by 10.114.160.1 with SMTP id i1mr1965574wae.49.1203092974072;
	Fri, 15 Feb 2008 08:29:34 -0800 (PST)
Received: from widy.localdomain ( [88.252.162.97])
	by mx.google.com with ESMTPS id 32sm8723047nfu.7.2008.02.15.08.29.30
	(version=SSLv3 cipher=OTHER); Fri, 15 Feb 2008 08:29:33 -0800 (PST)
Date: Fri, 15 Feb 2008 18:29:49 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
Message-ID: <20080215182949.053c3d3a@widy.localdomain>
In-Reply-To: <1203076695.8636.30.camel@dax.rpnet.com>
References: <20080214045433.02de68cd@widy.localdomain>
	<74d0deb30802140255k6c16bafeq6771d572fd7c542c@mail.gmail.com>
	<20080215110230.526ea6a1@widy.localdomain>
	<74d0deb30802150141q71e844esd6185bf52b1e79ae@mail.gmail.com>
	<20080215133238.7d8f7887@widy.localdomain>
	<1203076695.8636.30.camel@dax.rpnet.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.146.180
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: Building a kernel with builtin initramfs
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
X-List-Received-Date: Fri, 15 Feb 2008 16:29:55 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Fri, 15 Feb 2008 11:58:15 +0000
Richard Purdie <rpurdie@rpsys.net> wrote:

> Sorry, I am aware of the thread but I haven't had time to respond
> much :(.
> 
> On Fri, 2008-02-15 at 13:32 +0200, Paul Sokolovsky wrote:
> > python package_do_package () {
> > []
> > }
> > do_package[dirs] = "${D}"
> > 
> > Note sure how such declarative stuff can be converted to imperative
> > style like above. Also, do_package is only part of the picture.
> > Important thing is package_write. And the way it is implemented now,
> > do_package_write is just a dummy anchor task. Subclasses do not
> > implement it, but instead anchor using it in task sequence:
> > 
> > addtask package_write_ipk before do_package_write after do_package
> > 
> > This is weird. Richard, was it done this way? It makes impossible to
> > imperatively call package writeout task ;-((.
> 
> This is deliberate. Its so if you have "deb" packaging enabled and
> then switch to "ipk", everything just works since bitbake realises
> which stamps are missing and builds the missing parts.

;-( That's apparently a case where good rebuild from scratch would
solve all issues ;-). Or looking at the root of it, making bitbake
operate on hierarchical tasks would solve this and likely other issues
we discuss.

> 
> > Otherwise, regarding producing initramfs'ed kernel, I switched to
> > the solution a-la initramfs-image-ipk - instead of trying to plug
> > into existing kernel.bbclass task sequence, I made a separate task
> > which builds kernel with initramfs included. Of course, that's not
> > ideal - package with non-initramfsed kernel already written by that
> > time, so new package would need to overwrite it ;-\. If package
> > writing were possible at all, but it's not due to the above.
> > 
> > My current idea is to write package in separate recipe at all,
> > stealing PV from the file.
> 
> I'm not sure this recursive bitbake calling is something we want to
> encourage as its going to cause massive support nightmares and just
> confuse people. 

	Encourage? No. Recursion is far too morbid force to let anyone
use it ;-). Let's keep it for special cases only.

> What I'd prefer to see is a sequence like:
> 
> bitbake initramfs-image
> bitbake initramfs-kernel
> 

Ah, you mean sequences of:

./configure <lotsa stuff>
make
make install <some stuff>
...

? Wait, that holy place is taken already! And OE have been going in
quite different direction for long time. It automates mind-boggling
things like building gcc or glibc, but when it comes to automating
bitbake with bitbake itself, there's suddenly a taboo? ;-)

> The initramfs-kernel recipe complains if it can't find a compatible
> initramfs image and provides instructions on what you need to do to
> create one.
> 
> Whilst this means the user has to run two commands, it also means they
> see and understand what is going on.

Running bitbake in recipe is just as visible and understandable as
running gcc or anything else - nothing is shown to users except for
some high-level motions, but all actions are recorded in logs. So, to
understand what's going on, a look at recipe and logs is required in
either case, and there're lots of "non-recursive" recipes which are
beyond understanding of mere humans. On the contrary,
initramfs-image-ipk is pretty easy (except for long lines) and should
easily teach something new.

Other points:
* It only starts with 2 commands, the list grows with the time
(exponentially?)
* It's not going to be those easy "bitbake foo + bitbake bar"
2-word commands. As was pointed already, building an initramfs requires
ANGSTROM_MODE (aka LIBC_TYPE aka (but unrecognized) SYSTYPE) and
IMAGE_FSTYPES set. Further - more.
* One of the annoying issues is to how to get hands on results of the
first task in the second one. Currently, for the second task, such
location is rather unpredictable. I solved this by adding special task
which just accepts parameter - location where to put stuff. Again,
special tasks, special parameters. User would either need to know and
use them, or do it all manually.

> 
> Cheers,
> 
> Richard
> 
> 



-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


