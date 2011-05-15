Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QLi2A-0005as-PN
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 22:35:26 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QLhaQ-0002o2-Fy
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 22:06:46 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DD031B1.1050601@kernelconcepts.de>
References: <1305290080.2448.3.camel@gnutoo-laptop>
	<1305290588-7057-8-git-send-email-GNUtoo@no-log.org>
	<4DD031B1.1050601@kernelconcepts.de>
Date: Sun, 15 May 2011 21:32:28 +0100
Message-ID: <1305491548.18415.2.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 08/12] matchbox-panel: depend on xterm(matchbox panel contain an xterm launcher)
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
X-List-Received-Date: Sun, 15 May 2011 20:35:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-05-15 at 22:04 +0200, Florian Boor wrote:
> Hi,
> 
> Am 13.05.2011 14:43, schrieb Denis 'GNUtoo' Carikli:
> > +RDEPENDS += "xterm"
> 
> I do not like this one. I have been using matchbox-panel for many years without
> having xterm installed.

Agreed, it should be RRECOMMENDS.  Also, whatever kind of dependency is
used, it should be applied only to ${PN} and not all subpackages.

Setting plain RDEPENDS is almost always an error, and I'm fairly sure
there is a QA diagnostic for this.  So, if this kind of thing shows up
in a submitted patch it always makes me question whether the patch has
actually been tested or not.

p.




