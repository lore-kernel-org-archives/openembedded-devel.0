Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q0HYB-0005Qs-Hq
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 19:03:55 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q0HWX-00031q-CS
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 19:02:13 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300384355.2175.13.camel@eha>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha>
	<1300360696.2132.14681.camel@phil-desktop>
	<1300373028.2468.8.camel@eha> <1300374439.9054.21.camel@phil-desktop>
	<1300384355.2175.13.camel@eha>
Date: Thu, 17 Mar 2011 18:05:53 +0000
Message-ID: <1300385153.9054.44.camel@phil-desktop>
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
X-List-Received-Date: Thu, 17 Mar 2011 18:03:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-17 at 18:52 +0100, Esben Haabendal wrote:
> Well, it might be possible to minimize the disruption for a transitional
> period by carefully specifying some catch-all build-time package
> dependencies pulling in all packages for recipes not ported yet.

Yes, that's the sort of thing I was thinking of.  It isn't even totally
obvious to me that specifying individual packages is any better than
"all packages from recipe X", since with the former you then have a
potential maintenance headache if files get moved from one package to
another.

p.



