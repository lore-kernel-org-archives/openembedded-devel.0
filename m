Received: from smtp-out21.han.skanova.net ([195.67.226.208])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1PexE6-0001di-H8
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 23:07:02 +0100
Received: from [192.168.0.153] (81.170.167.207) by smtp-out21.han.skanova.net
	(8.5.133) (authenticated as u82406562)
	id 4D07517100AB564A for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 23:04:56 +0100
Message-ID: <4D34BD0A.3010206@atmel.com>
Date: Mon, 17 Jan 2011 23:04:58 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Thunderbird 2.0.0.24 (Windows/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Bulding multiple U-Boot configs for one machine
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
X-List-Received-Date: Mon, 17 Jan 2011 22:07:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Managed to get some time over and checked in a recipe
for u-boot-2010.12 which builds all u-boot configs
specified in the UBOOT_MACHINES (note "S" at the end)

The frecipe is available in a private branch:
  "ulf/linux-2.6.30-2011-01-16"  (or similar).

There is a SAM9M10 machine checked in as well as a test case.
grep for UBOOT_MACHINES in the conf/machine directory to find out which.

Note that
UBOOT_MACHINE = "at91sam9m10g45ek_config"

but

UBOOT_MACHINES = "at91sam9m10g45ek_dataflash at91sam9m10g45ek_sd"

I.E: No "_config" in the list.

The goal of the new branch is to test booting from an SD-Card
without any other flash in the system.
Have tested this outside openembedded so far, but
the current branch is still to be tested on a board.

Best Regards
Ulf Samuelsson



