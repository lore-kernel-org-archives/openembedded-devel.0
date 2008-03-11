Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JZ6ld-0005GY-61
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 16:52:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2BFnt3R030767
	for <openembedded-devel@openembedded.org>; Tue, 11 Mar 2008 15:49:55 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30655-02 for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 15:49:51 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2BFnllB030756
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 11 Mar 2008 15:49:47 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20080311145739.GN30267@ibawizard.net>
References: <200803110807.11368.zecke@selfish.org>
	<200803111126.04715.openembedded@haerwu.biz>
	<fr5ntp$n0v$1@ger.gmane.org> <20080311114938.GM30267@ibawizard.net>
	<f96d234e0803110712t6d88dfc6t521fdf39081e2c76@mail.gmail.com>
	<20080311145739.GN30267@ibawizard.net>
Date: Tue, 11 Mar 2008 15:49:48 +0000
Message-Id: <1205250588.4521.111.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
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
X-List-Received-Date: Tue, 11 Mar 2008 15:53:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Tue, 2008-03-11 at 15:57 +0100, Petr Stetiar wrote:
> Cliff Brake <cliff.brake@gmail.com> [2008-03-11 10:12:52]:
> 
> > On Tue, Mar 11, 2008 at 7:49 AM, Petr Stetiar <ynezz@true.cz> wrote:
> > 
> > >  My reason for using Git, is, that I could drop my local overlays
> > >  maintained in SVN, and could easily use Git's branches for it. It's then
> > >  really easy to try out and build different braches and also easier to
> > >  send patches back to OE.
> > 
> > I'm really pleased with how easy it is to maintain multiple branches and
> > quickly switch between branches in one working directory using git when
> > doing kernel work.  I'm not sure how hg compares as I've not used it yet.
> > This is important to me because I work on OE in small,
> 
> As I've understood it, Hg don't use simple branches inside local repository,
> but you've to branch it in another directory outside your repository.  Since
> it's using hardlinks it won't waste too much disk space, but it's not as cheap
> and easy as in Git probably.

I asked around about hg and this did come up, you don't get cheap
branching like you do with git, you have to use a separate
directory/checkout per branch.

For anyone who's used git, cheap branching is a wonderful thing[1]. This
is enough to swing things for me since its one feature of git I'd love
to be able to use with OE.

[1] unless you're dwmw2[2]
[2] don't go there ;-)

Cheers,

Richard



