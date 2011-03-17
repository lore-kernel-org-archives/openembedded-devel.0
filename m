Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q0ElP-0000BQ-6p
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 16:05:23 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q0Ejl-0002xl-54
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 16:03:41 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300373028.2468.8.camel@eha>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha>
	<1300360696.2132.14681.camel@phil-desktop>
	<1300373028.2468.8.camel@eha>
Date: Thu, 17 Mar 2011 15:07:19 +0000
Message-ID: <1300374439.9054.21.camel@phil-desktop>
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
X-List-Received-Date: Thu, 17 Mar 2011 15:05:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-17 at 15:43 +0100, Esben Haabendal wrote:
> Is OE really in a position to permantly settle for something suboptimal
> in such a central area?

No, but rejecting the big bang doesn't mean that we can't make the
change; it just means that we need to find a way to make the old and new
arrangements coexist for a transition period.  This is the way every
other architectural change in OE has been done and I don't see any
reason that this one needs to be different.

If we really did want to go ahead and have a metadata flag day then no
doubt there are plenty of other things we would like to change at the
same time.  But, thus far, this has never seemed to justify the
disruption of breaking every recipe in both the main OE repo and third
party overlays.

I must admit that I'm also slightly unclear about why the change in
build dependency specifications is a prerequisite for doing per-recipe
sysroots.  Is that just an artifact of the way you implemented it in
OE-lite or is there some fundamental constraint that means it needs to
be this way?

p.




