Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Nkyuy-0003MG-0A
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 13:03:40 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id E18D8D741
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 12:37:40 +0100 (CET)
X-SMTPAUTH-B2: 
X-SENDER-IP: 83.227.59.242
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AkUUAKNBh0tT4zvyPGdsb2JhbAAHmxQBAQEBN7wJhHkE
X-IronPort-AV: E=Sophos;i="4.49,546,1262559600"; d="scan'208";a="42624998"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.224]) ([83.227.59.242])
	by ipb2.telenor.se with ESMTP; 26 Feb 2010 12:37:40 +0100
Message-ID: <4B87B283.20009@atmel.com>
Date: Fri, 26 Feb 2010 12:37:39 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 195.54.99.197
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=SPF_SOFTFAIL autolearn=no
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: RFC; Building multiple u-boot images for a single board
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
X-List-Received-Date: Fri, 26 Feb 2010 12:03:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

If you want to support multiple boot memories, you have to
have multiple boards in the conf/machine directory

I currently testing a change to at91bootstrap, where a defconfig
is not provided by openembedded.
Instead you provide a list of defconfig's in your machine description:

I.E: in conf/machien/at91sam9g45ek.conf you have:

AT91BOOTSTRAP_BOARD = "at91sam9g45df at91sam9g45ek at91sam9g45nf"

when at91bootstrap is built it will loop through all the boards.
and build three versions.

I think it would make sense to do the same for u-boot,
so that you can build u-boot for several configurations.

This change would happen from u-boot-2009.11 an onwards.

In your machine conf you would supply:
UBOOT_MACHINES = "at91sam9g45ekes_nandflash at91sam9g45ekes_dataflash"

A loop goes through the list
and runs make on each element in the list.

make at91sam9g45ekes_nandflash_config
make
make at91sam9g45ekes_dataflash_config
make

if UBOOT_MACHINES is not set, then a single build is done using
UBOOT_MACHINE as usual.

This will allow u_boot to be built for every boot configuration
without having to add a lot of files.

-- 
Best Regards
Ulf Samuelsson



