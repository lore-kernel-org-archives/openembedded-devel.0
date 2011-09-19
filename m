Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R5ZOK-00083q-BM
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2011 10:39:52 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1R5ZJG-0004VO-IS; Mon, 19 Sep 2011 10:34:38 +0200
From: Phil Blundell <philb@gnu.org>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Mon, 19 Sep 2011 09:34:37 +0100
In-Reply-To: <4E743D19.4020901@dresearch-fe.de>
References: <4E70C8BA.9030901@dresearch-fe.de>
	<4E736B6C.9060906@dresearch-fe.de>
	<1316187165.3510.37.camel@phil-desktop>
	<4E743D19.4020901@dresearch-fe.de>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1316421278.3510.39.camel@phil-desktop>
Mime-Version: 1.0
Cc: Michael Lauer <mickey@vanille-media.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: guidelines for upstart in oe?
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
X-List-Received-Date: Mon, 19 Sep 2011 08:39:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-09-17 at 08:24 +0200, Steffen Sledz wrote:
> Would it be an accepted solution to have two different packages in two recipes with common parts in an include like this?
> 
> 
> foo_x.y.bb:
> ------------------>snip<-------------------
> require foo-x.y.inc
> 
> RCONFLICTS = "foo-upstart"

I think that would be a poor solution.  I guess you could do some sort
of BBCLASSEXTEND = "upstart" thing if you really wanted separate
packaging, though you'd then still have the issuette that a distro using
upstart (only) would end up with everything named "foo-upstart".

p.




