Received: from [195.54.101.72] (helo=proxy2.bredband.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1LhuOu-0006A6-EY
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 00:33:20 +0100
Received: from ironport2.bredband.com (195.54.101.122) by proxy2.bredband.net
	(7.3.139)
	id 49B44974002C17EE for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 00:33:03 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApQTAE44uUlT4zhBPGdsb2JhbAAIiQeMGwEBAQE1u0CDfgY
X-IronPort-AV: E=Sophos;i="4.38,353,1233529200"; d="scan'208";a="463503804"
Received: from c-4138e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.249]) ([83.227.56.65])
	by ironport2.bredband.com with ESMTP; 13 Mar 2009 00:33:03 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Organization: Atmel Nordic AB
Date: Fri, 13 Mar 2009 00:32:16 +0100
Message-Id: <1236900736.26901.8.camel@grond.atmel.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1.1 
Subject: PARALLEL_MAKE
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
X-List-Received-Date: Thu, 12 Mar 2009 23:33:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Is there any activity to make this more useful?
Just managed to install a Core i7 machine, which speeded
up my Buildroot build from about 4 hours to less than 1 hour.
(There was an error in the build right at the end,
so it could have been downto 40 minutes or so)
Building the cross compiler took 10 minutes with "make -j 16"
compared to 1-2 hours on a P4 @ 3GHz.

Openembedded does not seem to use PARALLEL_MAKE extensively.
I have the frequency meter activated for all 8 CPUs in the Core i7,
and most of the time the CPUs seems to idle at 1.6 GHz,
with one CPU (or rarely 2) are running at the full 2.67 GHz.

Last time I built OE on a P4@ 3 GHz it took ~40 hours 
for the SAM9263, so some speedup would be nice.
Maybe we should make an effort?

Best Regards
Ulf Samuelsson



