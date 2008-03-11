Received: from [72.14.204.237] (helo=qb-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1JZBdG-0007nW-0P
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 22:04:10 +0100
Received: by qb-out-0506.google.com with SMTP id p30so2332797qba.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2008 14:01:33 -0700 (PDT)
Received: by 10.114.198.1 with SMTP id v1mr5507678waf.130.1205269292278;
	Tue, 11 Mar 2008 14:01:32 -0700 (PDT)
Received: by 10.114.147.11 with HTTP; Tue, 11 Mar 2008 14:01:32 -0700 (PDT)
Message-ID: <bdb0025f0803111401o5dcc3de8l97cd875b66f4337f@mail.gmail.com>
Date: Tue, 11 Mar 2008 18:01:32 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47D6AF65.1020007@am.sony.com>
MIME-Version: 1.0
References: <200803110807.11368.zecke@selfish.org>
	<200803111126.04715.openembedded@haerwu.biz>
	<fr5ntp$n0v$1@ger.gmane.org> <1205233201.4521.30.camel@dax.rpnet.com>
	<20080311143030.68d6341b@widy.localdomain>
	<1205239153.4521.53.camel@dax.rpnet.com>
	<20080311150320.7c31b2f6@widy.localdomain>
	<1205243052.4521.82.camel@dax.rpnet.com>
	<47D6AF65.1020007@am.sony.com>
X-SA-Exim-Connect-IP: 72.14.204.237
X-SA-Exim-Mail-From: rodrigo.vivi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Tue, 11 Mar 2008 21:05:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I'd like to tell you that we (Mamona) has just migrate to git
repository. We are pulling the OE's changes from Holger's git tree
since last week.

We've decided to migrate because we were having lots of problems with
monotone propagate. We had problems that neither monotone developers
could help us to figure them out. It was so annoying. Most of our
problems was related to "Non content conflicts".

At last OEDEM we talked a lot about Monotone x Git but I couldn't
contribute because I had never used git before. I remember Koen
complaining about git documentation and all.

Nowdays I'm using git to work on linux-omap, Xorg and Mamona and I can
tell that git is so much better. It is easier, faster and simplest.

What about documentation? Amazing. The man pages are complete and
there are many big projects already using git whose has lots of
documentations about how to deal with unexpected issues (edit old
commits, conflicts, etc)

So we believe that migrate to git is the best option.

Cheers

On Tue, Mar 11, 2008 at 1:12 PM, Tim Bird <tim.bird@am.sony.com> wrote:
> Richard Purdie wrote:
>  > On Tue, 2008-03-11 at 15:03 +0200, Paul Sokolovsky wrote:
>
> >> It's nice to have that said explicit - different. Supposedly it's more
>  >> powerful for developers, but how good it is for end users? How many
>  >> industry entities select git as their in-house SCM? I doubt that too
>  >> many, knowing too well that many still select just CVS.
>
>
>
>
> > Regarding industrial entities, hopefully we call agree CVS is a pretty
>  > bad SCM and that proves said industrial entities don't know what they're
>  > doing, usually since it often it comes down to politics rather than
>  > technical merit. I know of a few surprising companies using git FWIW
>  > although I know of a few abominations in use too.
>
>  Just a data point...
>  Sony uses git as its in-house SCM for Linux-related work.
>  We also use quilt.
>
>
>   > Also, I think more end users coming fresh to OE will know how to do this
>   > with git in the current climate than with monotone, hg or any other
>   > distributed SCM.
>
>  I would agree with this.  monotone is a big reason I'm still
>  an observer of OE rather than an active participant.
>  As such, I shouldn't really have a vote.  But if I did it would
>  be for git, purely for personal economy of training.
>
>   -- Tim
>
>  =============================
>  Tim Bird
>  Architecture Group Chair, CE Linux Forum
>  Senior Staff Engineer, Sony Corporation of America
>  =============================
>
>
>
>
>  _______________________________________________
>  Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Rodrigo Vivi
INdT - Instituto Nokia de Tecnologia
Blog: http://blog.vivi.eng.br
GPG: 0x905BE242 @ wwwkeys.pgp.net


