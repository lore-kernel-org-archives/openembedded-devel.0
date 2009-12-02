Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NFklj-0007ua-Fl
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 09:41:06 +0100
Received: from [85.210.162.25] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NFkkB-0000Ui-QE
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 08:39:28 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200912020838.48141.holger+oe@freyther.de>
References: <4B0CC1A4.1060401@gmail.com>
	<200911260953.02170.holger+oe@freyther.de> <4B160147.9050303@gmail.com>
	<200912020838.48141.holger+oe@freyther.de>
Date: Wed, 02 Dec 2009 08:39:26 +0000
Message-ID: <1259743166.4916.35.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.162.25
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
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
X-List-Received-Date: Wed, 02 Dec 2009 08:41:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2009-12-02 at 08:38 +0100, Holger Hans Peter Freyther wrote:
> On Wednesday 02 December 2009 06:55:19 Dmitry Vinokurov wrote:
> > Yesterday pulled from dev branch (git describe output is
> > pre-nov2009-core-updates-606-g237cbb4) and made meta-toolchain-qte
> > rebuild, then tried again to build example -- same error "cannot find
> > /usr/lib/libpthread_nonshared.a inside
> > /usr/local/minimal/arm/arm-oe-linux-gnueabi"
> 
> Oh you are using minimal? So all these files are installed into /lib? So you 
> actually do have a libpthread_nonshared.a but it is in lib/ and not usr/lib? 
> Could you confirm this?

I think you're thinking of micro, not minimal.  AFAIK, minimal uses the
"normal" filesystem layout, complete with /usr.

p.




