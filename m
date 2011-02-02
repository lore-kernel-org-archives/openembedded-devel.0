Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PkdxH-0001IF-Px
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Feb 2011 15:45:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 9C2E5314CA06;
	Wed,  2 Feb 2011 15:44:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id H4vwTHEmyVUI; Wed,  2 Feb 2011 15:44:13 +0100 (CET)
Received: from [172.22.22.61] (ip-94-79-168-47.unitymediagroup.de
	[94.79.168.47])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 042BF314C57C;
	Wed,  2 Feb 2011 15:44:13 +0100 (CET)
Message-ID: <4D496DBC.6030709@opendreambox.org>
Date: Wed, 02 Feb 2011 15:44:12 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110131 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201102012002.49849.schnitzeltony@gmx.de>
In-Reply-To: <201102012002.49849.schnitzeltony@gmx.de>
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: latest clutter-recipe
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
X-List-Received-Date: Wed, 02 Feb 2011 14:45:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Andreas,

I can't answer your technical questions regarding the recipe, because
I'm not using a clutter/gtk/x11 based distro. I'd like to comment the
rest of your mail, though.

On 02/01/2011 08:02 PM, Andreas Mueller wrote:
> it surprised me to see that Koen committed a new recipe for clutter 1.4.2. As you might know I was also working on this and sent some pre-release version here of this (1). What makes me not running in happy mode:
> 
> - Many of my previous patches were rejected first because of some commit message. Here we read 'clutter: add 1.4.2' - cool. Which tests were performed?

In general, contrary to patches which modify existing files, I think
that patches adding new recipes don't need a detailed commit message.
Still, a message should describe the content of a commit in a suitable
and understandable way. In my opinion, "<name>: add <version>"
sufficiently describes any new recipe, unless there's anything special
about it.

In this case, I would have preferred glib-gettextize getting mentioned,
which was added to clutter.inc.

> Please don't tell me I am invited to change this situation:  Many patches send by non-commit guys are nit-picked at least for commit message - and then I read 'clutter: add 1.4.2' for a recipe breaking lots of others.

Well, shit happens, unfortunately. Hopefully it was tested and worked in
a different environment. Bug reports like this are needed to make it
work for as many environments as possible. I've added Koen to CC to
decrease the chance that your bug report gets lost without Koen
noticing. I think he didn't mean to offend you in any way with his commit.

Nit-picking happens frequently, and personally I prefer getting negative
feedback over no feedback at all. Usually it's not very hard to address
the complaints, although it can be very frustrating to get only a short
comment on something you've put a lot of time into. My guess is that
this has occurred at least once to everybody who contributed to open
source projects.

> Sorry for this, but to me the this should have been a hobby for having fun - but at the moment it's far from

So let's try to regain some fun after this problem gets solved! You
shouldn't take it personally.

> Andreas
> 
> (1) http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-January/029260.html

Regards,
Andreas



