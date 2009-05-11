Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1M3Qds-0004K8-NW
	for openembedded-devel@openembedded.org; Mon, 11 May 2009 10:13:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n4B87C8J008667
	for <openembedded-devel@openembedded.org>;
	Mon, 11 May 2009 09:07:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08547-03 for <openembedded-devel@openembedded.org>;
	Mon, 11 May 2009 09:07:08 +0100 (BST)
Received: from [192.168.1.30] (dynamic0.rpnet.com [192.168.1.30])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n4B876Bg008661
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 11 May 2009 09:07:06 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <gu8ikj$gvo$1@ger.gmane.org>
References: <20090427141943.GG18788@smtp.west.cox.net>
	<20090429161224.GB18788@smtp.west.cox.net> <49FCA524.10102@dls.net>
	<c384c5ea0905030529n585de20awfcc6bb835a282483@mail.gmail.com>
	<20090503165318.GA7973@smtp.west.cox.net>
	<20090510194704.GZ7973@smtp.west.cox.net>	<gu7ff8$cmr$1@ger.gmane.org>
	<20090510215154.GA7973@smtp.west.cox.net>
	<be7a9f3d0905101527i3123f921sc86f01f43d5eacfe@mail.gmail.com>
	<20090510223606.GB7973@smtp.west.cox.net> <gu8ikj$gvo$1@ger.gmane.org>
Date: Mon, 11 May 2009 09:07:05 +0100
Message-Id: <1242029225.5824.22.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Bring PREFERRED_LIBC to all distros
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
X-List-Received-Date: Mon, 11 May 2009 08:13:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-05-11 at 09:03 +0200, Koen Kooi wrote:
> On 11-05-09 00:36, Tom Rini wrote:
> > On Sun, May 10, 2009 at 07:27:42PM -0300, Otavio Salvador wrote:
> >> Hello Tom,
> >>
> >> On Sun, May 10, 2009 at 6:51 PM, Tom Rini<trini@embeddedalley.com>  wrote:
> >>> Not too wierd looking?  Otherwise, is there somewhere we can do,
> >>> roughly, sort -u, on ${OVERRIDES} ?  And not require a new bitbake for
> >>> everyone?
> 
> How do you decide which one to drop? The one with a lower or higher 
> priority? You can see how that gets real ugly real fast.
> 
> >> I belive that we shouldn't add hacks into OE recipes to avoid the
> >> requirement of new bitbake. If someone is using dev tree we can assume
> >> that this person can also use a development version from bitbake
> >> stable branch.
> >
> > I don't mean a hack to glibc*.bb, but rather changing base.bbclass (and
> > anything else) to not blow up if OVERRIDES contains duplicates.  I think
> > it's possible to add a python function that does it, but it would have
> > to be 'slow' since the fast method is to throw everything into a dict
> > and then return the list of keys.  So perhaps it's best to just say
> > libc-<foo>  for an additional per-libc override.
> 
> libc-<foo> is also a lot clearer in the case of newlib :)

Playing with OVERRIDES can get messy quickly. The key to success is
having patterns which are unique. "glibc" is therefore not as good as
"libc-glibc". This is why there are the "task-" and "pn-" namespaces and
IMO, namespaces are essential there.

Yes, there are several things we add there without namespacing but we've
mostly been lucky...

Cheers,

Richard



