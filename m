Received: from relay.ihostexchange.net ([66.46.182.56])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kwong@wurldtech.com>) id 1PAoLo-0003eb-OG
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 20:34:26 +0200
Received: from kwong-desktop.localnet (209.52.149.70) by
	smtp.ihostexchange.net (66.46.182.50) with Microsoft SMTP Server (TLS)
	id 8.3.106.1; Tue, 26 Oct 2010 14:32:28 -0400
From: Kelvie Wong <kwong@wurldtech.com>
Organization: Wurldtech Security Technologies Inc.
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Oct 2010 11:33:07 -0700
User-Agent: KMail/1.13.5 (Linux/2.6.35-22-generic-pae; KDE/4.5.1; i686; ; )
MIME-Version: 1.0
Message-ID: <201010261133.07987.kwong@wurldtech.com>
X-SA-Exim-Connect-IP: 66.46.182.56
X-SA-Exim-Mail-From: kwong@wurldtech.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Our changes to the main OE tree (mostly network/snort related recipes)
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
X-List-Received-Date: Tue, 26 Oct 2010 18:34:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If any of you are interested, we have published our additions to the 
OpenEmbedded repository --

http://gitorious.org/~kelvie/oe/kelvies-oe/commits/upstream-base

There are a couple of bug fixes in there (with the kernel bbclass), and several 
new recipes:

- snort-2.9 and its dependencies, libdnet and daq
- A fix for the ARCH detection for the kernel bbclasses
- The latest kernel driver for the Intel e1000e PCI express ethernet gigabit 
driver
- The initramfs-udev module that I had posted earlier to the list and hadn't 
been integrated yet.

These are based off of our branch which is 1.5 years old, so if anyone wants to 
integrate these, some porting is likely required (e.g. with the new checksum 
mechanism).

If anyone wants to try the latest and greatest Snort on their system, these 
changes will be of interest :)

-- 
Kelvie Wong
Software Developer

Wurldtech Security Technologies Inc.
Suite 1680 - 401 West Georgia St.
Vancouver, B.C.  V6B 5A1
Canada

Phone:       + 1.604.669.6674
Toll Free:   + 1.877.369.6674
Fax:           + 1.604.669.2902
Website:    http://www.wurldtech.com/

"ARE YOU ACHILLES CERTIFIED?"

This message is intended only for the named recipients. This message
may contain information that is privileged, confidential or exempt
from disclosure under applicable law. Any dissemination or copying
of this message by anyone other than a named recipient is strictly
prohibited. If you are not a named recipient or an employee or agent
responsible for delivering this message to a named recipient, please
notify us immediately by telephone at 604-669-6674, and permanently
destroy this message and any copies you may have. Email may not be
secure unless properly encrypted.


