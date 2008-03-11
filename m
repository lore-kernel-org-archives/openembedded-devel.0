Received: from [72.14.220.152] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1JZEFF-0005bx-O6
	for openembedded-devel@openembedded.org; Wed, 12 Mar 2008 00:50:59 +0100
Received: by fg-out-1718.google.com with SMTP id e12so2098413fga.0
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 16:48:57 -0700 (PDT)
Received: by 10.82.121.15 with SMTP id t15mr17929525buc.8.1205279337552;
	Tue, 11 Mar 2008 16:48:57 -0700 (PDT)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id z40sm855348ikz.4.2008.03.11.16.48.55
	(version=SSLv3 cipher=OTHER); Tue, 11 Mar 2008 16:48:56 -0700 (PDT)
Date: Wed, 12 Mar 2008 01:49:45 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080312014945.4783ae6a@widy.localdomain>
In-Reply-To: <1205250588.4521.111.camel@dax.rpnet.com>
References: <200803110807.11368.zecke@selfish.org>
	<200803111126.04715.openembedded@haerwu.biz>
	<fr5ntp$n0v$1@ger.gmane.org> <20080311114938.GM30267@ibawizard.net>
	<f96d234e0803110712t6d88dfc6t521fdf39081e2c76@mail.gmail.com>
	<20080311145739.GN30267@ibawizard.net>
	<1205250588.4521.111.camel@dax.rpnet.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 72.14.220.152
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
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
X-List-Received-Date: Tue, 11 Mar 2008 23:51:00 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Tue, 11 Mar 2008 15:49:48 +0000
Richard Purdie <rpurdie@rpsys.net> wrote:

> 
> On Tue, 2008-03-11 at 15:57 +0100, Petr Stetiar wrote:
> > Cliff Brake <cliff.brake@gmail.com> [2008-03-11 10:12:52]:
> > 
> > > On Tue, Mar 11, 2008 at 7:49 AM, Petr Stetiar <ynezz@true.cz>
> > > wrote:
> > > 
> > > >  My reason for using Git, is, that I could drop my local
> > > > overlays maintained in SVN, and could easily use Git's branches
> > > > for it. It's then really easy to try out and build different
> > > > braches and also easier to send patches back to OE.
> > > 
> > > I'm really pleased with how easy it is to maintain multiple
> > > branches and quickly switch between branches in one working
> > > directory using git when doing kernel work.  I'm not sure how hg
> > > compares as I've not used it yet. This is important to me because
> > > I work on OE in small,
> > 
> > As I've understood it, Hg don't use simple branches inside local
> > repository, but you've to branch it in another directory outside
> > your repository.  Since it's using hardlinks it won't waste too
> > much disk space, but it's not as cheap and easy as in Git probably.
> 
> I asked around about hg and this did come up, you don't get cheap
> branching like you do with git, you have to use a separate
> directory/checkout per branch.
> 
> For anyone who's used git, cheap branching is a wonderful thing[1].

I personally don't see anything wonderful in that, and glad that some
orthodoxes share this point of view. Kernel people have it because they
are poor, poor people who created hundreds of megabytes of entities and
don't have big enough hdds to deal with them comfortably (and if they
have, their users don't), so they must play such weird tricks as the
need to evaporate current branch to work on another.

I can call svn as witness - it supports both models. But I yet need to
see someone who in sober mind and given a choice, would use "svn
switch" back and forth instead of checking out needed branches to have
them side by side.

> This is enough to swing things for me since its one feature of git
> I'd love to be able to use with OE.
> 
> [1] unless you're dwmw2[2]
> [2] don't go there ;-)
> 
> Cheers,
> 
> Richard

[]


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


