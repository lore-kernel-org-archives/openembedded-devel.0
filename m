Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1MUh8o-0000EJ-Q4
	for openembedded-devel@openembedded.org; Sat, 25 Jul 2009 15:18:23 +0200
Received: from [12.42.230.2] (helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1MUgum-0000FL-2l
	for openembedded-devel@openembedded.org; Sat, 25 Jul 2009 09:03:52 -0400
Date: Sat, 25 Jul 2009 09:01:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@openembedded.org
In-Reply-To: <200907251452.41374.holger+oe@freyther.de>
Message-ID: <alpine.LFD.2.00.0907250858080.9674@localhost>
References: <alpine.LFD.2.00.0907250800110.9021@localhost>
	<200907251452.41374.holger+oe@freyther.de>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: getting bitbake-1.8.12 for the org.openembedded.dev branch?
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
X-List-Received-Date: Sat, 25 Jul 2009 13:18:24 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 25 Jul 2009, Holger Hans Peter Freyther wrote:

> On Saturday 25 July 2009 14:15:08 Robert P. J. Day wrote:
>
> >   would it not make more sense to have even the "dev" branch come
> > with the required version of bitbake embedded in the checkout?
> > or, failing that, just toss that incomplete bitbake directory
> > entirely?
>
> If you look into this directory it will only contain *.pyc files and
> I don't think it makes any sense to put bitbake into the
> OpenEmbedded repository.

  in a sense, i agree with that.  the problem is that the precedent
has already been set by having bitbake in the stable/2009 branch and,
based on the principle of least surprise, you shouldn't suddenly yank
something out of a branch if developers are used to seeing it there.

  for consistency, either bitbake should be included in an OE
checkout, or it shouldn't.  it shouldn't depend on which branch you're
working with.  that way lies confusion.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
"Kernel Newbie Corner" column @ linux.com:          http://cli.gs/WG6WYX
========================================================================


