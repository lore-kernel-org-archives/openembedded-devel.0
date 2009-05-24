Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M8CvW-0003Rk-UH
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 14:35:43 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M8Cnp-0000if-DO
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 13:27:46 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gvbbh9$m3s$1@ger.gmane.org>
References: <20090522213142.GF23842@smtp.west.cox.net>
	<c384c5ea0905230606t48e57c58y658282e25c97fbee@mail.gmail.com>
	<1243095832.4226.105.camel@lenovo.internal.reciva.com>
	<c384c5ea0905231525u2248fcf7ycf512bd48ef05e56@mail.gmail.com>
	<gvb066$tov$1@ger.gmane.org>
	<1243157020.4226.124.camel@lenovo.internal.reciva.com>
	<gvbbh9$m3s$1@ger.gmane.org>
Date: Sun, 24 May 2009 13:27:40 +0100
Message-Id: <1243168060.4226.161.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: Kernel recipes with broken PRs now
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
X-List-Received-Date: Sun, 24 May 2009 12:35:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-05-24 at 13:37 +0200, Koen Kooi wrote:
> On 24-05-09 11:23, Phil Blundell wrote:
> >  This seems
> > particularly pertinent for the stable branch where, as I understood it,
> > intrusive changes were supposed to be avoided.
> 
> Wrong, the stable branch can get intrusive changes as well, the only 
> prereq is review and testing, which most changes in .dev never get.

Fair enough.  "Stable" seems like a bit of a misnomer in that case, but
if this genuinely is the policy for the branch then so be it.

> That's nice and all, but I see no actual patch that implements that, or 
> even a proposal with pseudocode. I'm sure there are better ways, but 
> till someone actually takes the time to cook up a patch instead of 
> handwaving, the situation won't change.

I did already propose one specific better way (i.e. extending the
kernel-abiversion mechanism) in which you could have implemented the
original feature.  I see that Richard Purdie also made some different
suggestions in response to your original RFC.  If these suggestions
don't work for you, please explain why not and perhaps we can come up
with something different.

I have also suggested one way in which, if you aren't prepared to solve
the underlying problem in a better way, you could at least mitigate the
effect of the collateral damage (i.e. making your change be DISTRO
opt-in rather than globally applied).

It seems fairly clear that, as the originator of the patch in question,
the onus is on you to minimise any resulting damage to other users.
Simply checking in something that breaks the versioning for all kernels
apart from your own and then expecting other people to run around after
you cleaning up the mess that you've created is, at the very least,
inconsiderate.

p.




