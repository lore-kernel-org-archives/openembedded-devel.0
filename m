Received: from [81.228.8.83] (helo=pne-smtpout1-sn2.hy.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MTIcC-0000ud-PR
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jul 2009 18:54:56 +0200
Received: from [10.175.196.247] (213.66.88.59) by
	pne-smtpout1-sn2.hy.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A48C447001B0232 for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jul 2009 18:40:51 +0200
Message-ID: <4A65EF53.1080508@atmel.com>
Date: Tue, 21 Jul 2009 18:39:47 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
To: openembedded-devel@lists.openembedded.org
References: <4A657D58.4070404@atmel.com>
	<1248173048.28930.59.camel@mill.internal.reciva.com>
In-Reply-To: <1248173048.28930.59.camel@mill.internal.reciva.com>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] hal-0.5.12 requires blkid >= 1.43
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
X-List-Received-Date: Tue, 21 Jul 2009 16:54:56 -0000
Content-Type: text/plain; charset="us-ascii"

   Phil Blundell skrev:

On Tue, 2009-07-21 at 10:33 +0200, Ulf Samuelsson wrote:


hal does not build when bitbaking gpe-image,since
blkid is 1.41.8 and hal requires >= 1.43.
1.41.8 seems to be the latest!
The attached patch fixes configure and configure.in in the hal


I think the idea is that you're meant to use libblkid from
util-linux-ng.  I've no idea what the difference is, though: it's
possible that 1.41.8 would indeed work correctly.  I guess you'd have to
ask the hal h4x0rs why they selected 1.43 as the minimum version to be
sure.

p.



I did not do anything special, just "bitbake gpe-image".

Looks like "gpe-image" should be updated to use "util-linux-ng"
instead of my proposed patch.

--
Best Regards
Ulf Samuelsson

