Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NGScQ-0001MM-VL
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 08:30:26 +0100
Received: from homiemail-a21.g.dreamhost.com (mailbigip.dreamhost.com
	[208.97.132.5])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 0926917B0CE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Dec 2009 23:28:47 -0800 (PST)
Received: from [129.132.133.199] (mtec-hg-docking-1-dhcp-199.ethz.ch
	[129.132.133.199])
	by homiemail-a21.g.dreamhost.com (Postfix) with ESMTPA id BE35B300059
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Dec 2009 23:28:44 -0800 (PST)
Message-ID: <4B18BA2B.40602@SSpaeth.de>
Date: Fri, 04 Dec 2009 08:28:43 +0100
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
Organization: ETH Zurich
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1259911168-19992-1-git-send-email-Sebastian@SSpaeth.de>
	<1259911168-19992-2-git-send-email-Sebastian@SSpaeth.de>
In-Reply-To: <1259911168-19992-2-git-send-email-Sebastian@SSpaeth.de>
X-Enigmail-Version: 0.95.7
OpenPGP: id=C827A062
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/2] task-base: Introduce DISTRO_apm and convert recipes to use it.
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
X-List-Received-Date: Fri, 04 Dec 2009 07:30:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

This is my take on solving our problem that we want a different "apm"
provider. Koen outlined this solution, so this way I went.

All recipes that RDPEND on "apm" basically get a

DISTRO_apm ?=3D "apm"
RDEPEND    +=3D ${DISTRO_apm}

This could also be done with a virtual/apm package, and a
PREFERED_PROVIDER set to apm for all distros. Which would even be
cleaner I think, with the downside that all other distros would need to
set a prefered provider too.
For things like this is would be nice to get a common sane-providers.inc
where these standard providers can be defined.

What do you think? Can I commit this?
spaetz



