Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NFjp8-0003pY-A8
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 08:40:33 +0100
Received: from tamarin.localnet (unknown [122.181.150.106])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 811B41B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Dec 2009 07:51:26 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 2 Dec 2009 08:38:48 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <4B0CC1A4.1060401@gmail.com>
	<200911260953.02170.holger+oe@freyther.de>
	<4B160147.9050303@gmail.com>
In-Reply-To: <4B160147.9050303@gmail.com>
MIME-Version: 1.0
Message-Id: <200912020838.48141.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Making simple QTE application, cannot find libpthread_nonshared.a
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
X-List-Received-Date: Wed, 02 Dec 2009 07:40:33 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Wednesday 02 December 2009 06:55:19 Dmitry Vinokurov wrote:
> Yesterday pulled from dev branch (git describe output is
> pre-nov2009-core-updates-606-g237cbb4) and made meta-toolchain-qte
> rebuild, then tried again to build example -- same error "cannot find
> /usr/lib/libpthread_nonshared.a inside
> /usr/local/minimal/arm/arm-oe-linux-gnueabi"

Oh you are using minimal? So all these files are installed into /lib? So you 
actually do have a libpthread_nonshared.a but it is in lib/ and not usr/lib? 
Could you confirm this?

z.


