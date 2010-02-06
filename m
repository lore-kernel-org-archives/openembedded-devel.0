Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Ndq7Y-0001Le-AL
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Feb 2010 20:15:12 +0100
Received: from tamarin.localnet (dsl-62-220-14-162.berlikomm.net
	[62.220.14.162])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 0AA951B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Feb 2010 19:12:38 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 6 Feb 2010 20:12:36 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <C791CD9B.22735%jgrant@vml.com>
In-Reply-To: <C791CD9B.22735%jgrant@vml.com>
MIME-Version: 1.0
Message-Id: <201002062012.36110.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Working with OEMs
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
X-List-Received-Date: Sat, 06 Feb 2010 19:15:12 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 05 February 2010 20:28:59 Jeremy Grant wrote:

Hi Jeremy,

in general we encourage people to use one of the existing distributions 
(angstrom, micro, minimal). In some recipes these distro's have done 
configuration or other policy. This is done with the "OVERRIDE" system of 
bitbake which is working by name. So just copying angstrom.conf to a new name 
will most likely not work right a way.

For the next part. I would suggest creating a "task-oem-kind" and a "oem-kind-
image" which would install Qt Embedded 4.6, the required plugins and 
additional applications like the arora browser.

My general suggestion is to use OE only for the tasks it is good. E.g. if you 
force a developer to use it for application development it can be pretty 
painful on both sides.

At the OEM I would encourage someone to write the machine config, makes sure 
the init files are working. As the output of the OEM they should have the 
machine file, the sourcecode, a bootable image, and the result of something 
like "meta-toolchain-qte" or "meta-toolchain" to allow easy application 
development for the target hardware.



holger


