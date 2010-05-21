Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OFTZX-0006dK-DN
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 16:51:36 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 979FE1660618; Fri, 21 May 2010 08:47:32 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 3A81F16604F5;
	Fri, 21 May 2010 08:47:32 -0600 (MDT)
Message-ID: <4BF69D04.5060506@mlbassoc.com>
Date: Fri, 21 May 2010 08:47:32 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100330 Fedora/3.0.4-1.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: staging problem
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
X-List-Received-Date: Fri, 21 May 2010 14:51:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Trying a clean build
   MACHINE="beagleboard"
   DISTRO="angstrom-2008.1"
   org.openembedded.dev 2c153f33b8ebb807a622ad9ae92ed5341a356740

I get failures like this (in many packages):
   /local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/regex.h:138: error: expected '=', ',', ';', 'asm' or '__attribute__' before 're_void'
   /local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/regex.h:298: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'int'
   /local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/regex.h:307: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'int'
   /local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/regex.h:309: error: expected '=', ',', ';', 'asm' or '__attribute__' before 're_void'
   /local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/regex.h:310: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'size_t'

The problem is that the compiler include file <regex.h> is
not the standard/default one, rather the file from tcl!
I replaced the bogus regex.h file with the correct one and
my build completes & runs.

* Any ideas how/why this happens?  I'm sure it has to do with
   the recent RP changes.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


