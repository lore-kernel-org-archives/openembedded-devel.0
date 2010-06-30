Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OTvM5-0000KQ-JU
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 13:21:26 +0200
Received: from [62.7.80.98] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OTvHX-0007bh-3s
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 12:16:43 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1OTvHW-00069x-Su
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 12:16:42 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTikPwgZUakbZFu0Rlmqr-_0NZ5jXwa-R3BTaeOVB@mail.gmail.com>
References: <1277552779-12490-1-git-send-email-Martin.Jansa@gmail.com>
	<AANLkTikPwgZUakbZFu0Rlmqr-_0NZ5jXwa-R3BTaeOVB@mail.gmail.com>
Date: Wed, 30 Jun 2010 12:16:42 +0100
Message-ID: <1277896602.2345.1332.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-Broken-Reverse-DNS: no host name found for IP address 62.7.80.98
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] preferred-xorg-versions: remove include files for old releases
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
X-List-Received-Date: Wed, 30 Jun 2010 11:21:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-06-30 at 13:06 +0200, Martin Jansa wrote:
> On Sat, Jun 26, 2010 at 1:46 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > * git grep shows that all distributions (in OE tree) moved to
> >  preferred-xorg-versions-X11R7.5.inc already
> > * would be nice to encourage everybody to use most tested X11R7.5 or
> >  no preferred-xorg-versions at all (we can keep latest versions working
> >  and use D_P -1 for stuff which needs more testing first)
> > * replace preferred-xorg-versions.inc with link always adjusted to
> >  latest relase (is there any problem with symlink in OE tree?)
> > * this would also make easier to remove really old versions when it's
> >  hard to test some changes (like converting libx11 staging)

Rather than the symlink, how about adding:

PREFERRED_XORG_VERSION ?= "X11R7.5"

in some generic place, and encouraging distros to include
preferred-xorg-versions-${PREFERRED_XORG_VERSION}.inc if they so desire?

I don't have much of a view on deleting the old include files.  On the
one hand it seems a bit of a shame to remove them, since they aren't
doing any harm (and, being .incs, aren't even adding to parse time).
But I don't use them myself and I find it hard to get very excited about
the issue.

p.




