Received: from [66.249.92.175] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1JZF5t-0002vw-OM
	for openembedded-devel@openembedded.org; Wed, 12 Mar 2008 01:45:23 +0100
Received: by ug-out-1314.google.com with SMTP id q7so155232uge.0
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 17:43:21 -0700 (PDT)
Received: by 10.66.221.6 with SMTP id t6mr361578ugg.0.1205282600550;
	Tue, 11 Mar 2008 17:43:20 -0700 (PDT)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id 19sm1692011ugl.13.2008.03.11.17.43.18
	(version=SSLv3 cipher=OTHER); Tue, 11 Mar 2008 17:43:19 -0700 (PDT)
Date: Wed, 12 Mar 2008 02:44:08 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
Message-ID: <20080312024408.44d9192e@widy.localdomain>
In-Reply-To: <1205280598.16531.26.camel@dax.rpnet.com>
References: <200803110807.11368.zecke@selfish.org>
	<200803111126.04715.openembedded@haerwu.biz>
	<fr5ntp$n0v$1@ger.gmane.org> <20080311114938.GM30267@ibawizard.net>
	<f96d234e0803110712t6d88dfc6t521fdf39081e2c76@mail.gmail.com>
	<20080311145739.GN30267@ibawizard.net>
	<1205250588.4521.111.camel@dax.rpnet.com>
	<20080312014945.4783ae6a@widy.localdomain>
	<1205280598.16531.26.camel@dax.rpnet.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 66.249.92.175
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Wed, 12 Mar 2008 00:45:23 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Wed, 12 Mar 2008 00:09:58 +0000
Richard Purdie <rpurdie@rpsys.net> wrote:

> On Wed, 2008-03-12 at 01:49 +0200, Paul Sokolovsky wrote:
> > On Tue, 11 Mar 2008 15:49:48 +0000
> > Richard Purdie <rpurdie@rpsys.net> wrote:
> > > I asked around about hg and this did come up, you don't get cheap
> > > branching like you do with git, you have to use a separate
> > > directory/checkout per branch.
> > > 
> > > For anyone who's used git, cheap branching is a wonderful
> > > thing[1].
> > 
> > I personally don't see anything wonderful in that, and glad that
> > some orthodoxes share this point of view. Kernel people have it
> > because they are poor, poor people who created hundreds of
> > megabytes of entities and don't have big enough hdds to deal with
> > them comfortably (and if they have, their users don't), so they
> > must play such weird tricks as the need to evaporate current branch
> > to work on another.
> >
> > I can call svn as witness - it supports both models. But I yet need
> > to see someone who in sober mind and given a choice, would use "svn
> > switch" back and forth instead of checking out needed branches to
> > have them side by side.
> 
> svn switch is in no way similar to the way git's cheap branching
> works.

Doesn't it? That must be only due to my naivete regarding git's cheap
branching. Because otherwise they would seem oh so similar to me - svn
revisions are lightweight, any of them can be a tag, a branch, and you
can do arbitrary travels in time and space with svn, all using one
consistent interface.

Well, eager to fix aforementioned naivete, I proceeded to google, and
the first hit on the matter I got was good blog-talk we just recently
discussed: http://blog.madism.org/index.php/2008/02/19/150-git-branches

"but because they are a cheap operation, not in the SVN sense at all,
but because a branch in git is a name, and 40 hexadecimal bytes". Yeah,
that must be it! The reason why svn branches are in no way similar to
git's!

I did stop with this hit, preferring to stay with my naivete - it's
just more comfortable to think of git as just yet another SCM with
its own set of known issues, than as the center of the world, a magic
tool to solve all development needs. Just my 2 cent opinion.


> 
> Cheers,
> 
> Richard
> 
> 
> 



-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


