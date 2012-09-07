Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1T9z3g-0007Q4-G8
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 15:57:20 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1T9yrh-0004kA-2s>; Fri, 07 Sep 2012 15:44:57 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1T9yrh-0007lL-0Y>; Fri, 07 Sep 2012 15:44:57 +0200
Received: from heinold by andorra.imp.fu-berlin.de with local (internal Exim
	4.72) id 1T9yrf-0005nD-U1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2012 15:44:55 +0200
Date: Fri, 7 Sep 2012 15:44:55 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120907134455.GA21660@mi.fu-berlin.de>
References: <5049BEFD.9040003@outrightsolutions.nl>
MIME-Version: 1.0
In-Reply-To: <5049BEFD.9040003@outrightsolutions.nl>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: linux-firmware
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
X-List-Received-Date: Fri, 07 Sep 2012 13:57:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 07, 2012 at 11:31:41AM +0200, Sander van Grieken wrote:
> Hi,
> 
> Currently, linux-firmware produces one big package with all binary
> firmware files installed. It would be benificial , especially for
> devices with a very small rootfs, to install only a subset of the entire
> collection. Some effort has been done to split off separate packages,
> but it's not clear what the preferred naming should be.
> 
> - Should it follow the kernel-module-* naming, e.g.
> kernel-module-ath9k-htc would need linux-firmware-ath9k-htc?
> - Or should it follow the firmware file naming, e.g. linux-firmware-htc-7010
> - Or maybe have a bit larger packages and simply split by vendor, e.g.
> linux-firmware-atheros
> - How and if to package the license file
> 
> Thoughts?

Because we even split all kernel modules into seperate packages we should do it for firmware files
too. But that is a lot of monkey work, you need to check for all firmware files and make the right packages.
The scheme of the package names seems fine to me.

Bye Henning


