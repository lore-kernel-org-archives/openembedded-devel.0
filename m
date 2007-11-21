Received: from [209.85.146.176] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1Iuw5Z-0007lo-Ap
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2007 21:22:27 +0100
Received: by wa-out-1112.google.com with SMTP id l24so3209122waf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2007 12:20:08 -0800 (PST)
Received: by 10.114.166.1 with SMTP id o1mr1559050wae.1195669783639;
	Wed, 21 Nov 2007 10:29:43 -0800 (PST)
Received: from ?192.168.2.2? ( [88.231.78.200])
	by mx.google.com with ESMTPS id z37sm3735ikz.2007.11.21.10.29.41
	(version=SSLv3 cipher=OTHER); Wed, 21 Nov 2007 10:29:42 -0800 (PST)
Date: Wed, 21 Nov 2007 20:29:38 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1938272464.20071121202938@gmail.com>
To: Tim Bird <tim.bird@am.sony.com>
In-Reply-To: <474471B1.6020101@am.sony.com>
References: <20071119120819.GA17788@lenovo>
	<47419EA0.4030308@student.utwente.nl>
	<4742217C.9060506@whitby.id.au>
	<74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>
	<4743201F.8000202@am.sony.com> <617697824.20071121042405@gmail.com>
	<474471B1.6020101@am.sony.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Wed, 21 Nov 2007 20:22:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Tim,

Wednesday, November 21, 2007, 7:58:09 PM, you wrote:

> Paul Sokolovsky wrote:
>>    This is attempt to put it backwards. It's not to allow bitbake
>> to be used outside of build directory, it's to allow *source* be
>> outside build directory. Real hardcore make users might have heard
>> about VPATH envvar and out-of-source building.

> I use makefiles to build source code, or affect operations
> in different locations in the file system, all the time.
> It is convenient and familiar to have PWD be part of the
> trigger for what operation I'm performing.  I realize
> this is an artifact of years of using make.  But since
> it's something I and most others have already learned,
> it seems like it would be nice to leverage that experience.

  Just don't tell me about Makefiles - I love them too. ;-)

  And please don't take following personally, instead it's just
simile: there's big difference between 1) a user who install a distro
from CD, and then subverts its package management by installing
software from source with "./configure; make; make install" and 2) a
user who builds a distro which can be burned on a CD and then
installed for user #1.

>> 
>>    Why not default? Well, because what make builds is usually ones to
>> tens of megabytes, while bitbake builds tens to hundreds gigabytes.

> I don't see how this is relevant.  Maybe we are considering different
> use cases.

  It must be simple: if you have 2 partitions of 10Gb, you usually can
"make" anything in any place. But for OE, that means that you need a
bit more careful planning what to put where - may be you'll need to
split source vs build by different partitions for example. As OE
doesn't know what partition sized you have and where you mount them,
it just explicitly requires you to do path setup. That's it.

>> Those who're brave to undertake such endeavour, are expected to get
>> some understanding of what they're going to be thru by learning and
>> doing some setup with their own hands.
> I have no idea why this should be so.

> A few people have mentioned this similar theme - "if OE
> hides the details, users won't be forced to learn what's
> going on."

  If OE hides details, few users might be unpleasantly suprised,
for example, by the filled-in home. Moreover, if we hide arguably
important things, less people will learn it, and will be able to
progress/improve.

> In the most general terms, computers EXIST
> to allow people to not learn what's going on in complete detail.
> So does OE.  It's just the invocation sequence and minimum
> learning curve that people seem hung up on.

  We'd start a long philosophical discussion here, with one opinion of
dichotomy being the one above, and the other - if those people should
choose TV and popcorn instead ;-).

> I have sensed that OE seems squarely targeted
> at distro developers rather than end users.

  That's how I assumed it all the time.

>  Maybe this is
> the disconnect.  The use cases for OE for developers and
> users will be quite different.

  Yes, and it's good question what job is whose. For example, if
OE should adapt itself to end users, or if rather targetted
communities using OE should provide Makefiles, scripts, SDKs for
their end users.

  I'd personally regret if OE turned into another portage feel-alike
with warning signs like "You, mere mortal user, don't even dare to
change that setting!". So far, OE's way was more of "See that setting?
Learn what it does, and tweak it, if you're sure."


>> I'm sure that was original
>> motivation why bitbake and OE was setup that way. Of course, that was
>> quite some time ago, when disks were much smaller. Let's see if this
>> will change now.

> Indeed.  Thanks for the response.
>  -- Tim

> =============================
> Tim Bird
> Architecture Group Chair, CE Linux Forum
> Senior Staff Engineer, Sony Corporation of America
> =============================



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



