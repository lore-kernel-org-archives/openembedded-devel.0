Received: from [64.233.182.187] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1IvJTl-0003cn-4t
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2007 22:20:57 +0100
Received: by nf-out-0910.google.com with SMTP id h3so2545976nfh
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2007 13:18:34 -0800 (PST)
Received: by 10.82.181.10 with SMTP id d10mr25285535buf.1195764869317;
	Thu, 22 Nov 2007 12:54:29 -0800 (PST)
Received: from ?192.168.2.2? ( [88.231.78.200])
	by mx.google.com with ESMTPS id b30sm1551427ika.2007.11.22.12.54.27
	(version=SSLv3 cipher=OTHER); Thu, 22 Nov 2007 12:54:28 -0800 (PST)
Date: Thu, 22 Nov 2007 22:29:00 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1723576698.20071122222900@gmail.com>
To: Rod Whitby <rod@whitby.id.au>
In-Reply-To: <4744BC8B.8020607@whitby.id.au>
References: <20071119120819.GA17788@lenovo>
	<47419EA0.4030308@student.utwente.nl>
	<4742217C.9060506@whitby.id.au>
	<74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>
	<4743201F.8000202@am.sony.com> <617697824.20071121042405@gmail.com>
	<474471B1.6020101@am.sony.com>
	<1938272464.20071121202938@gmail.com>
	<4744BC8B.8020607@whitby.id.au>
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
X-List-Received-Date: Thu, 22 Nov 2007 21:20:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Rod,

Thursday, November 22, 2007, 1:17:31 AM, you wrote:

> Paul Sokolovsky wrote:
>>   Yes, and it's good question what job is whose. For example, if
>> OE should adapt itself to end users, or if rather targetted
>> communities using OE should provide Makefiles, scripts, SDKs for
>> their end users.

> There are currently two targetted communities (nslu2-linux and openmoko)
> who very publicly use Makefiles.  But yet, that is publicly scorned by
> the OE core team (and Koen in particular) to the extent that it is a
> minuted outcome of the last OE core team meeting.

  Well, this is really funny discussion. Everyone speaks about their
own itch, and is comes pretty clear, there're quite different itches
around. Now, we even have ethical plug here ;-).

> So if the second option is not allowed by the OE core team, then perhaps
> we should focus on the first option.  However, various individuals
> continue to treat OE users (as opposed to OE developers) with scorn and
> derision.

  Core team doesn't allow you to use Makefiles on top of OE?!! How can
that be? Your Makefile is on meta-level regarding OE, core team just
can't do anything against your using anything on top of it (without
employing real evil vigor). If Koen would tell you to not grep ps's
output, would you go patching ps instead? ;-D  So, let's separate
technical and organizational requirements from human ethics and
emotion here.

> Does the OE core team simply not want people to use OE unless you are a
> distribution developer?

  U-m-mmm, I love these conspiracy-talks! ;-D  So, do you want instead
to lock down users in some stone-age Makefiles, hiding The Truth and
hindering dissemination of The Knowledge? ;-))



  Rationale: I wonder if other people see it just like me: people have
various itches with OE, but at the same time *all* of them have
solutions for them! So, they just try to put their solutions upon
other folks, as the only right and all-encompassing. Well, maybe
instead to think that it's all pretty ok with OE, if it allows
different people to solve different needs, and it's not worth risking
to change it for the benefit of one fraction and ailment of others?

  Otherwise, if there's real good reason to move OE in *some*
direction, let's think how to do that. For example, making OE setup
for novice OE users easier is pretty valid point of course. But if
formulate it like, let's stop:

1. Talking about Makefiles. Because from pure logic it's clear that
it's harder to use *both* bitbake and Makefile than *only* bitbake.
And yes, we do talk about using *bitbake*, because we talk about *OE*
users, and OE uses bitbake, and not some make. If people want to talk
about making users not using bitbake, then IMHO, this grows
increasingly offtopic here, as this is OE list. Also, any OE
developer, not just coreteam, will frown on that, as OE developers
obviously want more, not less, people to use *OE* tools, and grow to
the level of improving and progressing them and OE.

2. Talking about multiple build areas and stuff like that. Obviously,
that's too advanced for novice to pull it in. And advanced users know
how to do that anyway. (It's just everyone thinks that his way is better
then peers' ;-) ).

3. Talking about random hacks. Acquainting users with a new system
starting with random hacks in it is not too good a way to present such
system.

> -- Rod



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



