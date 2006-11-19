Received: from [64.141.6.28] (helo=mail.ink-media.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pbell@ink-media.com>) id 1GlcfY-0004YK-Mh
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Nov 2006 03:44:32 +0100
Received: from [192.168.1.109] (S0106000f66ac2fae.gv.shawcable.net
	[24.108.147.189])
	by mail.ink-media.com (Postfix) with ESMTP id C4A7E1340A0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Nov 2006 18:54:58 -0800 (PST)
From: Peter Bell <pbell@ink-media.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Nov 2006 18:41:30 -0800
Message-Id: <1163904090.7453.9.camel@inkdev>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Mailman-Approved-At: Mon, 20 Nov 2006 09:52:38 +0100
Subject: Failure building hostap-modules-0.4.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Nov 2006 02:44:32 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi, everyone

I've just started trying to use oe, and am attempting to build a
distribution for the Freescale MX31ADS development board.

I have the following settings:

MACHINE = "mx31ads"
DISTRO = "angstrom-2007.1"

Everything appears to be setup correctly, and "bitbake nano" executes
with no problems.  When I attempted to do "bitbake bootstrap-image", the
compile fails with the following message.

| *** Can't build for 2.6 with a non-2.6 source!
| make: *** [2.6] Error 1
| FATAL: oe_runmake failed

The problem appears to be that the KERNEL_SRC variable is set to
<workdir>/tmp/staging/mx31ads-angstrom-linux-gnueabi/kernel, but the
kernel source is not there, it's in
<workdir>/tmp/work/mx31ads-angstrom-linux-gnueabi/mx31ads-kernel-2.6.19rc5-r2

It looks like it would be easy to fix by editing the .bb file for
hostap-modules, but this would be likely to break other platforms -
what's the recommended way of sorting this out?  Copy the kernel source
to staging?

Regards,

Pete Bel




