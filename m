Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Pq6mB-0000F6-9q
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 17:32:19 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Pq6l3-0002Dp-09
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 17:31:09 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110215103626.GF8619@localhost.jama.net>
References: <20110214102232.GB8619@localhost.jama.net>
	<1297697243.2178.97.camel@phil-desktop>
	<20110215091517.GD8619@localhost.jama.net>
	<1297765171.2178.109.camel@phil-desktop>
	<20110215103626.GF8619@localhost.jama.net>
Date: Thu, 17 Feb 2011 16:33:19 +0000
Message-ID: <1297960399.2178.216.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: debian.bbclass issues when some package is substring of another
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
X-List-Received-Date: Thu, 17 Feb 2011 16:32:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-02-15 at 11:36 +0100, Martin Jansa wrote:
> Ah sorry, I didn't read your (b) properly, now I see last sentence about
> "longest substring".
> 
> But that's mostly what reverse sorted patch does now, isn't it? Longer
> patterns are replaced before their shorter substrings (which then
> matches only to their proper packages, because longer were already
> replaced while handling longer pattern and "normally" doesn't match
> anymore).

Yeah, I think that's probably true.  I haven't managed to convince
myself entirely that the reverse sorting patch is safe in all
situations, but neither have I been able to think of a case that my
algorithm would get right and yours would get wrong.  So I think you
might as well go ahead and check in your patch, and we can revisit it in
the future if further problems do pop up.

p.




