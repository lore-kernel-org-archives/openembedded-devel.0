Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NpkMR-0002fP-8K
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Mar 2010 16:31:48 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id DC3AE491264
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Mar 2010 16:28:46 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 11 Mar 2010 16:29:04 +0100
Message-ID: <4B990C32.6000906@dresearch.de>
Date: Thu, 11 Mar 2010 16:28:50 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 11 Mar 2010 15:29:04.0463 (UTC)
	FILETIME=[9538C5F0:01CAC12F]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Angstrom opkg feed config
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
X-List-Received-Date: Thu, 11 Mar 2010 15:31:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

At the moment recipes/angstrom/angstrom-feed-configs.bb creates
also config file for ${MACHINE_ARCH} specific packages. But at
least for the machine arch 'hipox' (i'm not sure for other ones)
the given URI does not exist. This results in an error when
calling 'opkg update':

Collected errors:
 * Failed to download http://www.angstrom-distribution.org/feeds/unstable/ipk/glibc/armv5te/machine/hipox/Packages.gz, error 1

Does this directory intentionally not exist?

Wouldn't it be better to create an empty Packages.gz if there
are no machine arch specific packages?

Steffen



