Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PuVz2-0000CN-TP
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 21:15:48 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PuVxg-0007VS-Rn
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 21:14:24 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D6D3A8A.10904@mentor.com>
References: <1299001532-3260-1-git-send-email-GNUtoo@no-log.org>
	<1299001532-3260-2-git-send-email-GNUtoo@no-log.org>
	<1299002339.23547.117.camel@phil-desktop> <4D6D3A8A.10904@mentor.com>
Date: Tue, 01 Mar 2011 20:14:16 +0000
Message-ID: <1299010456.3235.3.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] netbase and opkg: reorder init scripts to make networking come up at first boot
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
X-List-Received-Date: Tue, 01 Mar 2011 20:15:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-01 at 11:27 -0700, Tom Rini wrote:
> On 03/01/2011 10:58 AM, Phil Blundell wrote:
> > On Tue, 2011-03-01 at 18:45 +0100, Denis 'GNUtoo' Carikli wrote:
> >> Without that fix, usb0 doesn't come up at first boot
> >>    (tested on the bug machine, with Angstrom on a console-image).
> >>
> >> Signed-off-by: Denis 'GNUtoo' Carikli<GNUtoo@no-log.org>
> >
> > That sounds like it's just papering over some kind of problem in
> > netbase.  What exactly stops usb0 from working with the previous
> > arrangement?
> 
> Presumably having not configured the system.  We should try and look at 
> moving opkg's configure up to be as early as possible

It oughtn't really to matter.  Generally, if a package depends on having
been configured before its initscript runs, that means it will also fail
to work in the case where it's subsequently installed (or upgraded) on a
running system.  (Obviously that's a nonissue for distros that don't use
O_P_M but it would still be nice to get it right in the metadata.)

Also, packages which depend on having "opkg configure" run on the target
before they will work are a bit of a pain for folks with readonly
rootfses.  In some cases that's just unavoidable but I would have
sort-of hoped that a base package like netbase would manage this a bit
better.

p.




