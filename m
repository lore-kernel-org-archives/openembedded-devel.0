Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1Ix23H-0002qY-GP
	for openembedded-devel@openembedded.org; Tue, 27 Nov 2007 16:08:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lARF5pDZ022143;
	Tue, 27 Nov 2007 15:05:51 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21713-09; Tue, 27 Nov 2007 15:05:48 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lARF5hUC022136
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 27 Nov 2007 15:05:44 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <1712551091.20071127161727@gmail.com>
References: <474AFA66.30509@gmx.net>
	<1196166155.6780.11.camel@localhost.localdomain>
	<157949636.20071127154357@gmail.com>
	<1196172204.6780.37.camel@localhost.localdomain>
	<1712551091.20071127161727@gmail.com>
Date: Tue, 27 Nov 2007 15:05:42 +0000
Message-Id: <1196175943.6780.46.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
Subject: Re: python skills and bug 2412
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
X-List-Received-Date: Tue, 27 Nov 2007 15:08:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-11-27 at 16:17 +0200, Paul Sokolovsky wrote:
> > On Tue, 2007-11-27 at 15:43 +0200, Paul Sokolovsky wrote:
> > A proper use for RPROVIDES is for something like gtk+-directfb to
> > RPROVIDE gtk+. If an app linked against one, it should be able to run
> > against the other (I'm assuming thats the case, if its not there
> > shouldn't be an RPROVIDES).
> 
> > Does that help explain things?
> 
>   Ok, in other words, you say that OE's, build-time, virtuals, are
> completely different thing than package manager's Provides facilities,
> also common called virtuals? 

Yes.

> And that then the easiest solution is to
> make sure they are never mixed at all, instead of trying to do
> mind-boggling and still very limited logic of converting OE's virtuals
> to package-manager virtuals? 

Yes.

> Instead, package-manager virtuals should
> be managed manually, based on the actual properties of packages?

Yes.

>   Makes sense. But with this ambiguity of "virtuals" such questions
> would come up again and again, I guess. So I also wished we cut off
> OE-virtual bleeding to package manager realm soon ;-).

Indeed. Thinking about this stuff makes my head hurt :).

PROVIDES + virtual/* = good
RPROVIDES + virtual/* = nightmare + bug

My point was that any of the latter will never do what people want/need
and should be removed. If we ever do that, we should use a namespace
other than "virtual" too.

Cheers,

Richard



