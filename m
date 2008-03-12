Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JZYvk-0000At-Ki
	for openembedded-devel@openembedded.org; Wed, 12 Mar 2008 22:56:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2CLs6qR002085
	for <openembedded-devel@openembedded.org>; Wed, 12 Mar 2008 21:54:06 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02056-01 for <openembedded-devel@openembedded.org>;
	Wed, 12 Mar 2008 21:54:01 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2CLs1Yb002076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 12 Mar 2008 21:54:01 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0803121326r631bf595v72126de8c7905835@mail.gmail.com>
References: <200803110807.11368.zecke@selfish.org>
	<20080311114938.GM30267@ibawizard.net>
	<f96d234e0803110712t6d88dfc6t521fdf39081e2c76@mail.gmail.com>
	<20080311145739.GN30267@ibawizard.net>
	<1205250588.4521.111.camel@dax.rpnet.com>
	<20080312014945.4783ae6a@widy.localdomain>
	<1205280598.16531.26.camel@dax.rpnet.com>
	<20080312024408.44d9192e@widy.localdomain>
	<c384c5ea0803121138r4bf89729t18c530b67e80c107@mail.gmail.com>
	<fr997r$aat$1@ger.gmane.org>
	<c384c5ea0803121326r631bf595v72126de8c7905835@mail.gmail.com>
Date: Wed, 12 Mar 2008 21:54:03 +0000
Message-Id: <1205358843.4530.22.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
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
X-List-Received-Date: Wed, 12 Mar 2008 21:56:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-03-12 at 21:26 +0100, Leon Woestenberg wrote:
> On Wed, Mar 12, 2008 at 8:00 PM, Koen Kooi
> <koen@dominion.kabel.utwente.nl> wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> >  | http://lists.freedesktop.org/archives/cairo/2006-February/006255.html
> >  |
> >  | His arguments on the (main two) differences strongly favors me to move
> >  | to GIT, not HG.
> >
> >  Actually it shows that hg fits better into the OE way of using a DSCM:
> >  central repo (and mirrors) with distributed developers.
> >
> Quoting Carl: "Namely, it [hg] appears to force a more centralized,
> (or at least, a more strictly hierarchical), model on the development
> process, while git allows a more fully distributed model making it
> easier for users to pull (even speculatively with "fetch") from
> multiple sources, track them in the local repository as separate
> branches and merge when appropriate."
> 
> Carl carefully uses the words "force" and "allows". Git does not
> preclude a central model, whilst still allowing more centralized
> development.

Thanks for posting the link, I've found it very interesting and to me it
shows that I'm not going to like hg :/.

Why? The *big* *big* win with git is the way it deals with branches. I
really can't stress how useful they are and how much they improve the
way you can use the SCM. Good branch support is the major reason I'd
like to see OE switch SCM in the first place.

Whilst I think OE will always have a central master .dev repository I
see a lot of gain from having branches. I would have happily put the
sysroot changes into a branch and likewise the packaged-staging stuff
I'm working on. As it is I'm keeping it locally uncommitted with no
version tracking since I don't really want to play games with monotone.
I've also got the problem that I've found some bugs in bitbake and being
able to make a bitbake branch available might actually be useful at the
moment. 

So I'm now moving to a position of strongly favouring git. 

Whilst I've argued against it in the past I would consider a move of
bitbake from svn to git too.

Cheers,

Richard



