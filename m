Received: from static.88-198-119-4.clients.your-server.de ([88.198.119.4]
	helo=hetzner.pbcl.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PnBsu-0007CE-V4
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 16:23:13 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PnBrv-0000cW-Nz
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 16:22:11 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D52AC3D.4050906@mentor.com>
References: <1297116822-30938-1-git-send-email-filip.zyzniewski@gmail.com>
	<201102091039.27832.marcin@juszkiewicz.com.pl>
	<AANLkTikDHBWTnf2S3j-P9_rpscdRQ7GZHVxrNLbLCXZW@mail.gmail.com>
	<iiu4qb$8st$1@dough.gmane.org>  <4D52AC3D.4050906@mentor.com>
Date: Wed, 09 Feb 2011 15:22:07 +0000
Message-ID: <1297264927.2161.15.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] task-base: conditional wifi and bluetooth tasks in PACKAGES
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
X-List-Received-Date: Wed, 09 Feb 2011 15:23:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-02-09 at 08:01 -0700, Tom Rini wrote:
> So... wouldn't making the patch be DISTRO_FEATURES rather than 
> MACHINE_FEATURES be what people want?

I think that's still not quite right.  As far as I can tell there are
three interesting scenarios that need to be distinguished:

1. DISTRO doesn't want bluetooth at all: bluez shouldn't be built,
nothing should depend on it, and bluetooth should be disabled in all
packages where it's an option.  If nothing is using bluez then clearly
it isn't going to be wanted in the bootstrap images.

2. DISTRO does want bluetooth as an option in the feeds but it isn't
needed for bootstrapping (on distros where that's a meaningful concept).
Bluez should be built, packages where it's an option should depend on
it, but task-base/task-bootstrap should not make any special effort to
haul bluez into the installation images.

3. DISTRO wants bluetooth and it is required for bootstrapping.  In this
case, evidently something in task-base/task-bootstrap needs to RDEPEND
on it in order to make sure it's available at install time.

I think case (1) corresponds to DISTRO_FEATURES not including bluetooth.
Case (3) corresponds to DISTRO_FEATURES having bluetooth and the MACHINE
declaring that it is bluetooth-capable in some way (either by mentioning
it directly in MACHINE_FEATURES or by mentioning a bus like pci or cf
which could accept a bluetooth card).

The difficulty seems to be that, for case (2), there is currently no way
for a DISTRO to say that it isn't interested in bluetooth for bootstrap
purposes even though the hardware might be capable of it.  That might be
a legitimate point of view if all the hardware that it runs on also
supports an easier bootstrap method (e.g. wifi).

If you change the patch to just look at DISTRO_FEATURES then it will
essentially be a no-op since the distros which are having this problem
must already be enabling bluetooth in DISTRO_FEATURES.

All that said, though, I think there is a fairly strong case for just
saying that each distro should provide its own task-bootstrap equivalent
(if it cares about bootstrapping).  It seems a bit silly to try to have
a single one-size-fits-all recipe with a zillion little switches that
make it behave differently in a multitude of ways.

p.




