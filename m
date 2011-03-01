Received: from smtp204.alice.it ([82.57.200.100])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1PuUBV-0005OT-0z
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 19:20:33 +0100
Received: from [192.168.1.178] (80.116.58.157) by smtp204.alice.it
	(8.5.124.08) (authenticated as editempo)
	id 4D498E39024240FA for openembedded-devel@lists.openembedded.org;
	Tue, 1 Mar 2011 19:13:28 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1299002339.23547.117.camel@phil-desktop>
References: <1299001532-3260-1-git-send-email-GNUtoo@no-log.org>
	<1299001532-3260-2-git-send-email-GNUtoo@no-log.org>
	<1299002339.23547.117.camel@phil-desktop>
Date: Tue, 01 Mar 2011 19:13:20 +0100
Message-ID: <1299003200.2701.65.camel@gnutoo-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
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
X-List-Received-Date: Tue, 01 Mar 2011 18:20:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-01 at 17:58 +0000, Phil Blundell wrote:
> On Tue, 2011-03-01 at 18:45 +0100, Denis 'GNUtoo' Carikli wrote:
> > Without that fix, usb0 doesn't come up at first boot
> >   (tested on the bug machine, with Angstrom on a console-image).
> > 
> > Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
> 
> That sounds like it's just papering over some kind of problem in
> netbase.  What exactly stops usb0 from working with the previous
> arrangement?
> 
> p.
The usb0 interface doesn't exist when it's configured by netbase in the
first boot.

Altough it's there in the second boot.

Denis.



