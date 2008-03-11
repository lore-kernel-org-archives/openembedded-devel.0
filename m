Received: from [82.208.44.173] (helo=ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@ibawizard.net>) id 1JZ5wU-00085s-8W
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 15:59:21 +0100
Received: by ibawizard.net (Postfix, from userid 1009)
	id C1E9F12D03B; Tue, 11 Mar 2008 15:57:39 +0100 (CET)
Date: Tue, 11 Mar 2008 15:57:39 +0100
From: Petr Stetiar <ynezz@true.cz>
To: openembedded-devel@openembedded.org
Message-ID: <20080311145739.GN30267@ibawizard.net>
References: <200803110807.11368.zecke@selfish.org>
	<200803111126.04715.openembedded@haerwu.biz>
	<fr5ntp$n0v$1@ger.gmane.org> <20080311114938.GM30267@ibawizard.net>
	<f96d234e0803110712t6d88dfc6t521fdf39081e2c76@mail.gmail.com>
Mime-Version: 1.0
In-Reply-To: <f96d234e0803110712t6d88dfc6t521fdf39081e2c76@mail.gmail.com>
User-Agent: Mutt/1.5.9i
X-SA-Exim-Connect-IP: 82.208.44.173
X-SA-Exim-Mail-From: ynezz@ibawizard.net
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
X-List-Received-Date: Tue, 11 Mar 2008 14:59:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Cliff Brake <cliff.brake@gmail.com> [2008-03-11 10:12:52]:

> On Tue, Mar 11, 2008 at 7:49 AM, Petr Stetiar <ynezz@true.cz> wrote:
> 
> >  My reason for using Git, is, that I could drop my local overlays
> >  maintained in SVN, and could easily use Git's branches for it. It's then
> >  really easy to try out and build different braches and also easier to
> >  send patches back to OE.
> 
> I'm really pleased with how easy it is to maintain multiple branches and
> quickly switch between branches in one working directory using git when
> doing kernel work.  I'm not sure how hg compares as I've not used it yet.
> This is important to me because I work on OE in small,

As I've understood it, Hg don't use simple branches inside local repository,
but you've to branch it in another directory outside your repository.  Since
it's using hardlinks it won't waste too much disk space, but it's not as cheap
and easy as in Git probably.

-- ynezz


