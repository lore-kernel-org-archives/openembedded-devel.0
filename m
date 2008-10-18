Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KrDHT-000299-C6
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Oct 2008 16:59:51 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KrDHK-0005y2-3R
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Oct 2008 15:59:42 +0100
Received: from mill.internal.reciva.com ([192.168.106.87])
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1KrDHJ-00037X-I9
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Oct 2008 15:59:41 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1224320609.5215.15.camel@dax.rpnet.com>
References: <1224320609.5215.15.camel@dax.rpnet.com>
Date: Sat, 18 Oct 2008 15:59:36 +0100
Message-Id: <1224341977.3140.112.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
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
X-List-Received-Date: Sat, 18 Oct 2008 14:59:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2008-10-18 at 10:03 +0100, Richard Purdie wrote:
> I'd actually like to a strong line on this and suggest
> [...] that we consider
> redoing the git conversion ASAP and the replaying the recent commits
> before its too late to get rid of the corruption in there. This is
> probably going to have to go to a core team vote since its a pretty big
> change to suggest but opinions are welcome.

Obviously I'm not a core team member, but seeing as you asked for
opinions... :-}

I do struggle to see why this is such a pressing issue right now.  As I
understand it, the "corruption" in question is basically mangled data
from the BK history.  This doesn't seem like it is obviously going to
get any worse over time, nor does it seem like the contagion is likely
to spread to other data, nor is the corruption going to be visible at
the tip of any recent checkout.  Also, we have now had several days of
activity on the live git tree, and we would presumably want to preserve
those changesets on any putative re-import.

Assuming the above to be the case, I don't fully understand either:

i) why this is a terribly big issue in the first place (i.e. what the
real-world impact of the corruption is going to be); or

ii) why, if we don't act now, it might be "too late" to solve the
problem in the future

Of course, it's entirely possible that my assumptions above are wrong.
I'd be interested to know the real situation, anyway.

p.




