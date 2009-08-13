Received: from [81.228.11.98] (helo=pne-smtpout1-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MbhUY-0001j3-GN
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 23:05:46 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout1-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A683C78001CD31D for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 22:49:11 +0200
Message-ID: <4A847C46.7090306@atmel.com>
Date: Thu, 13 Aug 2009 22:49:10 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Common patch directory for a set of boards.
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
X-List-Received-Date: Thu, 13 Aug 2009 21:05:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Is there a way to store a patch which is applied to a list of boards,
but not every board, in a common directory?

SRC_URI_append_at91sam9263ek += "file://atmel.patch;patch=1"
SRC_URI_append_at32stk1000 += "file://atmel.patch;patch=1"
SRC_URI_append_at572d940hf += "file://atmel.patch;patch=1"
SRC_URI_append_beta1 += "file://beta.patch;patch=1"
SRC_URI_append_beta2 += "file://beta.patch;patch=1"
SRC_URI_append_beta3 += "file://beta.patch;patch=1"
SRC_URI_append_caesar1 += "file://caesar.patch;patch=1"
SRC_URI_append_caesar2 += "file://caesar.patch;patch=1"

with a file system like:

<recipe>
	recipe-1.0/atmel/atmel.patch
	recipe-1.0/beta/beta.patch
	recipe-1.0/caesar/caesar.patch
	recipe-1.0.bb


instead of

<recipe>
	recipe-1.0/at91sam9263ek/atmel.patch
	recipe-1.0/at32stk1000/atmel.patch
	recipe-1.0/at572d940hf/atmel.patch
	recipe-1.0/beta1/beta.patch
	recipe-1.0/beta2/beta.patch
	recipe-1.0/beta3/beta.patch
	recipe-1.0/caesar1/caesar.patch
	recipe-1.0/caesar2/caesar.patch
	recipe-1.0.bb


I can think of symlinking at91sam9263ek to at572d940hf
but then you cannot have a defconfig file per board.

Maybe you can specify:

SRC_URI_append_at91sam9263ek += "file://../atmel/atmel.patch;patch=1"

but this has a fould look about it.

FOr the at91 patches, I took the easy way out and put all the patches
on www.at91.com, which is no good, since it has been down for
almost two days :-(



-- 
Best Regards
Ulf Samuelsson



