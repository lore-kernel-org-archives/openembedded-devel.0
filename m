Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1KrDrz-0008RT-5U
	for openembedded-devel@openembedded.org; Sat, 18 Oct 2008 17:37:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m9IFbQQP005226
	for <openembedded-devel@openembedded.org>;
	Sat, 18 Oct 2008 16:37:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04945-07 for <openembedded-devel@openembedded.org>;
	Sat, 18 Oct 2008 16:37:19 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m9IFbJwD005216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sat, 18 Oct 2008 16:37:19 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1224341977.3140.112.camel@mill.internal.reciva.com>
References: <1224320609.5215.15.camel@dax.rpnet.com>
	<1224341977.3140.112.camel@mill.internal.reciva.com>
Date: Sat, 18 Oct 2008 16:37:20 +0100
Message-Id: <1224344240.5215.48.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Some open issues
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
X-List-Received-Date: Sat, 18 Oct 2008 15:37:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2008-10-18 at 15:59 +0100, Phil Blundell wrote:
> I do struggle to see why this is such a pressing issue right now.  As I
> understand it, the "corruption" in question is basically mangled data
> from the BK history.  This doesn't seem like it is obviously going to
> get any worse over time, nor does it seem like the contagion is likely
> to spread to other data, nor is the corruption going to be visible at
> the tip of any recent checkout.  Also, we have now had several days of
> activity on the live git tree, and we would presumably want to preserve
> those changesets on any putative re-import.
> 
> Assuming the above to be the case, I don't fully understand either:
> 
> i) why this is a terribly big issue in the first place (i.e. what the
> real-world impact of the corruption is going to be); or

There is no impact on the current metadata, just the history. It depends
how much value we place on that.

At present we can't at some future date add in a good version of the
BKCVS data as easily as we could if it had been done by a tree graft
originally. The data there at the moment is pretty useless for actually
finding history (I know since I've tried to use it).

> ii) why, if we don't act now, it might be "too late" to solve the
> problem in the future

As you point out, we have a certain number of commits already. At the
moment we can probably deal with these but the longer we leave it, the
more commits and the more I'd not want to rebase things. We also have
the FILE_PR issue to consider and we need to revert that commit by some
means and find a better solution (I think even zecke agrees with that
but we'll discuss that in another thread).

Cheers,

Richard






