Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q0BBn-0001Hv-RC
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 12:16:23 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q0BAA-0002tF-0C
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 12:14:42 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300180117.2522.14.camel@eha>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha>
Date: Thu, 17 Mar 2011 11:18:16 +0000
Message-ID: <1300360696.2132.14681.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Eliminating dependency race-conditions (was Re: [PATCH] net-snmp: disable libnl use)
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
X-List-Received-Date: Thu, 17 Mar 2011 11:16:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-15 at 10:08 +0100, Esben Haabendal wrote:
> The current dependency/staging model of OE basically has this feature
> that a build can be influenced not only by it's own dependencies, but
> also what has been build before it (or not).
> 
> I strongly believe that this has to be fixed on the architectural level,
> and not just on a case-by-case level as is currently needed.

Yes, agreed.  This clearly sucks, and indeed I think it is probably the
largest single area of architectural suckage in OE today.

> I am still very much interested in discussing how to move this
> technology from OE-lite to OE, but as it impacts all recipe metadata
> (build dependencies has to be redefined), OE community at a large really
> needs to value the benefits of solving this problem.

The benefits of solving the problem are clearly very great, but I don't
think OE itself is really in a position to embrace a "big bang" kind of
change which would require redefining all the build dependencies.  I
think we need to find a technological solution which will work with our
current DEPENDS scheme.

I did do some work in that direction about a year ago, but I got
sidetracked into dealing with some toolchain suckage (which was making
it difficult to construct the per-recipe sysroots in the way that I
wanted) and then ran out of time.  I would like to get back to working
on this stuff but right now it is difficult for me to set aside the time
for it.

p.




