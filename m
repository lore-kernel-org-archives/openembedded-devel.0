Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QcegI-0006kW-QH
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 16:26:54 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Qceci-0002Lf-Dh
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 16:23:12 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BDFA7941-3D06-4F4E-8E0A-00F6B4D7E920@gmail.com>
References: <1309498698-13369-1-git-send-email-raj.khem@gmail.com>
	<1309513723.2633.32.camel@phil-desktop>
	<BDFA7941-3D06-4F4E-8E0A-00F6B4D7E920@gmail.com>
Date: Fri, 01 Jul 2011 15:23:11 +0100
Message-ID: <1309530191.2633.63.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [meta-oe][PATCH] systemd_git.bb: Alias mkostemp() to mkstemp() for uclibc targets
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
X-List-Received-Date: Fri, 01 Jul 2011 14:26:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-01 at 06:48 -0700, Khem Raj wrote:
> 
> On Jul 1, 2011, at 2:48 AM, Phil Blundell <philb@gnu.org> wrote:
> 
> > On Thu, 2011-06-30 at 22:38 -0700, Khem Raj wrote:
> >> ++#ifdef __UCLIBC__
> >> ++/* uclibc does not implement mkostemp GNU extention */
> >> ++#define mkostemp(x,y) mkstemp(x)
> >> ++#endif
> > 
> > Is that safe?  It would be nice to have some commentary in the patch
> > explaining why the flags are not required for systemd to operate
> > correctly.  If it genuinely doesn't need to be using mkostemp() then
> > perhaps this change should just be made upstream for all libcs.
> > 
> right
> I have to test it eglibc systems 

I'm not sure that's quite the point.  What I was trying to say before
was that, if systemd is going to the trouble of using mkostemp() rather
than mkstemp() in the first place, one would normally assume that it is
expecting that extra argument to be respected.  So it seems like there
are two possibilities:

a) the standardised semantics of mkstemp() are actually sufficient for
systemd's requirements and there was no need for it to be using
mkostemp() at all.  In this case it should just be patched (ideally
upstream) to use mkstemp() unconditionally.

b) the specific semantics of uClibc's mkstemp() implementation are
sufficient for systemd's needs, although the semantics guaranteed by the
standards are not.  In this case your patch might be appropriate but
there should be a comment explaining why it is safe and what exactly the
uClibc behaviour is that it depends on.  This would still not be an
ideal state of affairs since uClibc might change in the future, but it's
probably acceptable; a better solution might be either to add mkostemp()
into uClibc explicitly, or to patch systemd to obtain the semantics that
it needs by some other route.

I'm not familiar enough with either systemd or uClibc to know which of
the above is true here.  Can you clarify?

p.



