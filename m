Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QcELA-0002eX-70
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jun 2011 12:19:20 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QcEHa-0000cW-SV
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jun 2011 12:15:38 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4E0C4BF3.2050701@dresearch-fe.de>
References: <4E0C4BF3.2050701@dresearch-fe.de>
Date: Thu, 30 Jun 2011 11:15:37 +0100
Message-ID: <1309428937.2551.107.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Any reasons not to use "newer" ppp?
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
X-List-Received-Date: Thu, 30 Jun 2011 10:19:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-30 at 12:12 +0200, Steffen Sledz wrote:
> The current oe-dev master contains recipes for 2.4.4 and 2.4.5, but both are DEFAULT_PREFERENCE = "-1", so 2.4.3 is used by default.
> 
> We hit a problem in LCP open/close handling which is fixed in the newer versions.
> 
> Is there any reason *not* to go to 2.4.5?

Oe-core is using 2.4.5 and presumably it works OK there.  Judging from
the commit messages there is no good reason for 2.4.5 to have been set
D_P=-1 in oe.dev, so I think you should be safe to upgrade.

p.




