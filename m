Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K8FXO-0008Na-1H
	for openembedded-devel@openembedded.org; Mon, 16 Jun 2008 16:18:26 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K8FWc-0006uv-3x
	for openembedded-devel@openembedded.org; Mon, 16 Jun 2008 14:17:38 +0000
Received: from ip-62-143-23-251.hsi.ish.de ([62.143.23.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 16 Jun 2008 14:17:38 +0000
Received: from no2spam by ip-62-143-23-251.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 16 Jun 2008 14:17:38 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Mon, 16 Jun 2008 16:17:30 +0200
Message-ID: <g35sln$rc9$1@ger.gmane.org>
References: <1213345201.13942.3.camel@dax.rpnet.com>	<g2ubb9$a55$1@ger.gmane.org>	<87od65rxi8.fsf@neumann.lab.ossystems.com.br>	<200806132137.51103.zecke@selfish.org>
	<87mylpqccr.fsf@neumann.lab.ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-23-251.hsi.ish.de
User-Agent: Thunderbird 2.0.0.14 (X11/20080505)
In-Reply-To: <87mylpqccr.fsf@neumann.lab.ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: Switching SCM to git and commit/review policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 16 Jun 2008 14:18:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

[resending mail from 13:02 MESZ which apparently got lost somewhere]


Otavio Salvador wrote:
> What people think about that?

Sounds good to me, at least the most realistic proposal I saw so far.
Because it deals better with some short-comings in the "have every patch
touched by two devs"

1) we already have a *HUGE* backlog of patches in our bug tracker[1].
   This will only grow bigger if we require even more human intervention
2) it does not treat every patch the same, differentiation is needed
   IMHO, as well as efficiency and (semi)-automatic processes

Basically, I am fine with "commit to dev, test out, fix regressions if
present".  OTOH, "prevent regressions up front by reviewing everything"
will slow down .dev to a crawl, I am afraid.  Don't we have stable for
that very reason (less volatile code) and with exactly the "2 ACKs per
commit"-policy?   I am all for review for big changes and where
efficiently possibly, but I fail to see the value of it for example for
the type of work that I often do (the busy-work that Cliff Brake so
eloquently described on June 13th).

With the huge number of open bugs and things that need fixing which have
been untouched for ages, I am not convinced that slowing things down
even further is a step in the right direction.


Footnotes:
==========
[1]http://bugs.openembedded.net/buglist.cgi?keywords=patch&resolution=---





