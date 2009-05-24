Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M8A3K-0006il-3h
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 11:31:34 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M89vh-0003Av-HT
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 10:23:41 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gvb066$tov$1@ger.gmane.org>
References: <20090522213142.GF23842@smtp.west.cox.net>
	<c384c5ea0905230606t48e57c58y658282e25c97fbee@mail.gmail.com>
	<1243095832.4226.105.camel@lenovo.internal.reciva.com>
	<c384c5ea0905231525u2248fcf7ycf512bd48ef05e56@mail.gmail.com>
	<gvb066$tov$1@ger.gmane.org>
Date: Sun, 24 May 2009 10:23:40 +0100
Message-Id: <1243157020.4226.124.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Sun, 24 May 2009 09:31:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-05-24 at 10:23 +0200, Koen Kooi wrote:
> Now, if people posting in this thread would bother to read the original 
> RFC (that got approved for .dev as well as stable/2009), we wouldn't be 
> having this discussion.

I guess the RFC in question is this one:

http://projects.linuxtogo.org/pipermail/openembedded-devel/2009-April/009578.html

but it doesn't seem to really address the issues that have been raised
in this thread.  Indeed, looking at the responses that were posted to
the original RFC it doesn't seem at all obvious that there was a
consensus in favour of the patch; Otavio Salvador said that he was
"fully support[ive]" of it, but everybody else who posted seemed to have
some or other reservations.

If you do want to keep this mechanism then an easy way to make it less
intrusive would be simply to have it be a DISTRO opt-in rather than
standard behaviour.  Then, the distros that want it can be responsible
for making sure that all their kernels have been made compatible with
the patch, and other users don't need to worry about it.  This seems
particularly pertinent for the stable branch where, as I understood it,
intrusive changes were supposed to be avoided.

Per my previous email, though, I think there are probably better ways of
solving the original problem that don't require this kind of global
variable in the first place, and could at least be made to fail in a
"safe" way for users who aren't aware of the change.

p.




