Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QJ1cq-0004Dd-DF
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 12:54:12 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QJ1VM-0005my-2g
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 12:46:28 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304846189.4124.25.camel@mattotaupa>
References: <1304524618-4864-1-git-send-email-robert@erafx.com>
	<20110508005952.GC20352@sakrah.homelinux.org>
	<1304837776.4124.15.camel@mattotaupa>
	<1304845356.3355.4.camel@lenovo.internal.reciva.com>
	<1304846189.4124.25.camel@mattotaupa>
Date: Sun, 08 May 2011 11:51:25 +0100
Message-ID: <1304851885.3355.13.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] x264_r2245: fix DEPENDS for x86
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
X-List-Received-Date: Sun, 08 May 2011 10:54:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-05-08 at 11:16 +0200, Paul Menzel wrote:
> Thank you for the clarification. Is for example `RDEPENDS_${PN}` also an
> override?

Not in the sense I was meaning here, no.  (It is true that the ${PN} bit
is technically an OVERRIDE, but in most/all cases RDEPENDS_${PN} is
effectively a primary variable, i.e. there is no underlying RDEPENDS
which it overrides.)

The issue with the "DEPENDS_x86" thing is that, as far as the initial
metadata processing is concerned, DEPENDS and DEPENDS_x86 are distinct
variables.  You might hope that "DEPENDS_x86 += ..." would do a
conditional append to DEPENDS, but it doesn't: what happens is that it
creates a new variable "DEPENDS_x86" which then replaces the contents of
DEPENDS during override processing.  So the initial value of ${DEPENDS}
is lost rather than being appended to.

This whole issue is basically the whole reason that the "_append" syntax
hasn't been deprecated, since we don't currently have any other way to
do conditional appending (apart from resorting to python).

>  If yes, then looking at
> 
> 	$ git grep 'DEPENDS_'
> 
> returns a lot of incorrect usages.

From a quick glance at that output nothing jumped out at me as being
incorrect, but there might well be a few wrong ones in there.  This one,
for example:

classes/vala.bbclass:DEPENDS_virtclass-native += "vala-native"

looks a bit dubious to me (for the same reasons as above) but without
checking the recipe context it's impossible to say whether it's actually
wrong or not.

p.



