Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MTyDW-0006qA-W9
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jul 2009 15:20:20 +0200
Received: from tamarin.localnet (123-192-186-20.dynamic.kbronet.com.tw
	[123.192.186.20])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id DB87F1B10C0C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2009 13:07:30 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jul 2009 15:05:03 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc2; KDE/4.2.96; i686; ; )
References: <1248201134.26475.15.camel@dax.rpnet.com>
	<200907231246.26866.khimov@altell.ru>
	<1248351596.14790.28.camel@dax.rpnet.com>
In-Reply-To: <1248351596.14790.28.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200907231505.03473.holger+oe@freyther.de>
Subject: Re: [Bitbake-dev] Bitbake runqueue performance improvement
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
X-List-Received-Date: Thu, 23 Jul 2009 13:20:31 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Thursday 23 July 2009 14:19:56 Richard Purdie wrote:
> On Thu, 2009-07-23 at 12:46 +0400, Roman I Khimov wrote:

> Also note that DEPENDS only gets its magical meaning from the entry in
> base.bbclass which says:
>
> do_configure[deptask] = "do_populate_staging"
>
> and these forms are what bitbake actually works with, not the shorthand
> convenience forms of DEPENDS and RDEPENDS.

I agree with Richard that the mentioned commit should be reverted and that 
inter rootfs dependencies need to be handled with task dependencies[1].

love
	z.


[1] given the current bitbake implementation


