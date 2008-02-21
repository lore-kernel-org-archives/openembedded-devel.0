Received: from [209.85.128.190] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JS9Pk-0003TA-W6
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Feb 2008 12:16:36 +0100
Received: by fk-out-0910.google.com with SMTP id 18so3523981fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2008 03:16:29 -0800 (PST)
Received: by 10.78.97.7 with SMTP id u7mr15439984hub.50.1203592589404;
	Thu, 21 Feb 2008 03:16:29 -0800 (PST)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id y34sm1273453iky.6.2008.02.21.03.16.27
	(version=SSLv3 cipher=OTHER); Thu, 21 Feb 2008 03:16:28 -0800 (PST)
Date: Thu, 21 Feb 2008 13:18:10 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: angstrom-distro-devel@linuxtogo.org
Message-ID: <20080221131810.2f58c40e@widy.localdomain>
In-Reply-To: <1203591205.6860.103.camel@hammer.suse.cz>
References: <fb8538570802200452r5d4360f2ld6330218f4c5c0b6@mail.gmail.com>
	<20080220213121.69007f37@widy.localdomain>
	<1203591205.6860.103.camel@hammer.suse.cz>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.128.190
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Angstrom-devel] Best place to send new/updated bb files?
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
X-List-Received-Date: Thu, 21 Feb 2008 11:16:36 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Thu, 21 Feb 2008 11:53:25 +0100
Stanislav Brabec <utx@penguin.cz> wrote:

> Paul Sokolovsky wrote:
> > Hello,
> > 
> > On Wed, 20 Feb 2008 06:52:18 -0600
> > "Capn_Fish Zaurus" <capn.fish.zaurus@gmail.com> wrote:
> > 
> > > Is there a protocol for submitting new/updated bb files to the
> > > bugtracker (eg, importance markings, etc)? Or is there a better
> > > place to submit them?
> > 
> > Bugtracker is *the* place to submit .bb's in all cases. There's no
> > special meaning (from submitter's point of view) for priority, etc.
> > except common sense. In other words, in most cases default values
> > should be left as is.
> 
> In theory...
> 
> Simple search shows 50 potential open bugs with new recipes:
> http://bugs.openembedded.org/buglist.cgi?query_format=advanced&short_desc_type=allwordssubstr&short_desc=&long_desc_type=substring&long_desc=&bug_file_loc_type=allwordssubstr&bug_file_loc=&keywords_type=allwords&keywords=&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&emailassigned_to1=1&emailtype1=substring&email1=&emailassigned_to2=1&emailreporter2=1&emailcc2=1&emailtype2=substring&email2=&bugidtype=include&bug_id=&votes=&chfieldfrom=&chfieldto=Now&chfieldvalue=&cmdtype=doit&order=Reuse+same+sort+as+last+time&field0-0-0=attachments.filename&type0-0-0=substring&value0-0-0=.bb


We even have http://bugs.openembedded.net/show_bug.cgi?id=2194 ,
maintained by Rolf.

> 
> I am not expert on monotone, but it supports submitting changes after
> peer review:
> http://monotone.ca/docs/Quality-Assurance.html

Oh, that must be zecke's favorite "wanna one sweet day in the
bright future" toy ;-).

But let's just be real about all this - all "process improvements" are
just those shiny toys, nothing more. For them to work, *people* should
use them. But if we talk about committing new recipes, then they would
need to be committed in the end, no matter what additional procedure is
built on top of that. And then, nothing precludes people with doing
that with the current procedure, which includes pre-review.

So, the way to improve this, IMHO, is raising awareness among the
developers with OE commit rights, that having the commit access is not
just to let them commit own stuff more easily, but entails
responsibility before community - just as before someone reviewed and
pushed their patches, the same way they should join with this important
service for new contributors.

And of course, people with newly acquired commit rights are in the best
position to actually help with that, because older developers
oftentimes acquire additional responsibilities and/or work areas which
precludes them from timely participation in new submission
processing ;-(.

> 
> Could it provide a better way?
> 
> -- 
> Stanislav Brabec
> http://www.penguin.cz/~utx/zaurus

[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


