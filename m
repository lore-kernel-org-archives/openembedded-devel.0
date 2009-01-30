Received: from [195.54.101.73] (helo=proxy3.bredband.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1LSh6t-0002g1-JU
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jan 2009 01:19:51 +0100
Received: from ironport2.bredband.com (195.54.101.122) by proxy3.bredband.net
	(7.3.127)
	id 492A9CFF017A0CB0 for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jan 2009 01:12:06 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: An8LABzVgUlT4zhBPGdsb2JhbAAIiRWKbgEBAQE1twSEEAY
Received: from c-4138e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.221]) ([83.227.56.65])
	by ironport2.bredband.com with ESMTP; 30 Jan 2009 01:12:06 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Organization: Atmel Nordic AB
Date: Fri, 30 Jan 2009 01:12:05 +0100
Message-Id: <1233274325.4147.72.camel@elrond.atmel.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Review of ulf/atmel branch
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
X-List-Received-Date: Fri, 30 Jan 2009 00:19:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Myybe someone can look into this.

I have added 

* at91bootstrap-2.10
* u-boot-2009.01
* linux-2.6.28.2

focusing on at91sam9263ek

at91bootstrap is my own version of the
official at91bootstrap-1.11 from Atmel
A key difference is that at91bootstrap can
now be configured using Kconfig.

U-Boot has some extra patches, including at91sam9g20
It also fixed a problem with AVR32.
Due to a miss, a patch was not pulled from Haavards
git, so 2009.01 is broken for all AVR32 withotu this patch.

linux-2.6.28.2 has the Atmel 2.6.27 patches
forward ported to 2.6.28.2.

Stuff builds, but I have only tested
a few of the multiple combinations
on real H/W.

Hope to start adding the latest 2.6.27 patchees for AVR32 as well
but time is short...

BR
Ulf Samuelsson




