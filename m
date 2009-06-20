Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MHxKA-0004s9-Jc
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 11:57:26 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MHx9l-00010o-2I
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 10:46:41 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090619211055.GT15477@smtp.west.cox.net>
References: <E1MHjjt-00019r-UN@melo.nslu2-linux.org>
	<20090619211055.GT15477@smtp.west.cox.net>
Date: Sat, 20 Jun 2009 10:46:39 +0100
Message-Id: <1245491199.29153.237.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [oe-commits] Phil Blundell : micro-uclibc: avoid	selection of	crazy iphone stuff as provider for iconv
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
X-List-Received-Date: Sat, 20 Jun 2009 09:57:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-06-19 at 14:10 -0700, Tom Rini wrote:
> So, micro and micro-uclibc have a bug that's masked by this commit.
> Both use PREFERRED_LIBC rather than LIBC.  Switching to LIBC should
> allow for a few things to be removed from both confs (the libintl
> settings in the main one and the iconv one in uclibc, possibly the
> libintl one if you want to use gettext instead).

Thanks for pointing that out.  I've changed the conf files to use
${LIBC} now and I'll remove the redundant definitions over the next
couple of days.

p.




