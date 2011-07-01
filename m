Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QcaOg-0005ea-KJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 11:52:26 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QcaL6-0002AM-Cq
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 11:48:44 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1309498698-13369-1-git-send-email-raj.khem@gmail.com>
References: <1309498698-13369-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 01 Jul 2011 10:48:43 +0100
Message-ID: <1309513723.2633.32.camel@phil-desktop>
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
X-List-Received-Date: Fri, 01 Jul 2011 09:52:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-30 at 22:38 -0700, Khem Raj wrote:
> ++#ifdef __UCLIBC__
> ++/* uclibc does not implement mkostemp GNU extention */
> ++#define mkostemp(x,y) mkstemp(x)
> ++#endif

Is that safe?  It would be nice to have some commentary in the patch
explaining why the flags are not required for systemd to operate
correctly.  If it genuinely doesn't need to be using mkostemp() then
perhaps this change should just be made upstream for all libcs.

p.





