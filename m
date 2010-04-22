Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1O4vym-000432-Us
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Apr 2010 14:58:05 +0200
Received: from [192.168.1.11] (dialbs-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id B1961584121
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Apr 2010 14:58:49 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1078)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <20100422144638.7c78d45c.ospite@studenti.unina.it>
Date: Thu, 22 Apr 2010 14:54:31 +0200
Message-Id: <2B53CDC7-2375-440B-9B57-31A6067D4B54@vanille-media.de>
References: <20100422134322.f79d1365.ospite@studenti.unina.it>
	<1271937343.24079.176.camel@mill.internal.reciva.com>
	<20100422144638.7c78d45c.ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1078)
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: About having a static /dev
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
X-List-Received-Date: Thu, 22 Apr 2010 12:58:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Am 22.04.2010 um 14:46 schrieb Antonio Ospite:

> On Thu, 22 Apr 2010 12:55:43 +0100
> Phil Blundell <philb@gnu.org> wrote:
> 
>> On Thu, 2010-04-22 at 13:43 +0200, Antonio Ospite wrote:
>>> 2. If I install any package which depends on udev then udev is brought
>>>    in and the static layout is gone at the next boot.
>> 
>> I think your best option is probably to make udev be a DISTRO_FEATURE
>> and not set it for your own distribution.
>> 
>> If you genuinely want udev to be selected (for your particular DISTRO)
>> on a per-MACHINE basis then you'll have to invent some way to nobble its
>> startup script so that it just doesn't do anything on machines where it
>> isn't wanted.
>> 
> 
> A per-MACHINE way would be better IMHO, I am thinking about
> adding a check on something like /dev/.staticdev (suggested in [1]) to
> both udev init script and to the 'device' script from initscripts, and
> make the image class add the /dev/.staticdev file when
> IMAGE_DEV_MANAGER == "" (or maybe == "static" or "none"?)
> 
> Does this sound reasonable?

Please also handle the case where we neither want an IMAGE_DEV_MANAGER
nor static device population, since we use devtmpfs.

:M:



