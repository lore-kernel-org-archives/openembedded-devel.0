Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TTXTb-0000KE-D6
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 13:32:55 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TTXGT-0002oK-01
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 13:19:21 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Oct 2012 12:19:20 +0000
In-Reply-To: <50911500.6010207@gmail.com>
References: <1351681706-12778-1-git-send-email-otavio@ossystems.com.br>
	<50910EFB.7010804@gmail.com> <1351685486.13864.97.camel@phil-desktop>
	<50911500.6010207@gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1351685961.13864.101.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH v2 1/3] meta-systemd: Move ntp recipes to 'meta-networking' sublayer
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
X-List-Received-Date: Wed, 31 Oct 2012 12:32:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-31 at 13:09 +0100, Martin Erts=C3=A5s wrote:
> Should we just leave the .service files broken then, until someone
> registers a pool? Or are we allowed to use someone else's pool?

I don't think just using someone else's pool without asking them would
be a terribly polite way to proceed.

It seems like your options are:

a) Make it be a DISTRO setting, punt this problem to the distribution,
and let them figure out what to do about it.

b) Make the service files take the NTP server from DHCP rather than
having it be hard-coded.

c) Approach ntp.org to get a vendor zone for OE and have it be the
default.

d) Use your own NTP server, or one provided by a Yocto-affiliated
organisation.

e) Leave the files alone.

p.




