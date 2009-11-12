Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N8QqA-0003Um-FD
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 04:59:25 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 708DE1B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 04:08:54 +0000 (UTC)
To: openembedded-devel@lists.openembedded.org
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
Date: Thu, 12 Nov 2009 04:57:38 +0100
MIME-Version: 1.0
Message-Id: <200911120457.39018.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: meta-toolchain continues to woe
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
X-List-Received-Date: Thu, 12 Nov 2009 03:59:25 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi Guys,

I'm really getting frustrated by this crap. Every week I try to build meta-
toolchain and every week it is broken in another way. Not even talking about 
the runtime breakage I'm seeing and would like to fix...

So I either have a problem with the variable changes for the layout dir or in 
the opkg upgrade that happened.

any ideas?

	z.


The error:

You don't need to build everything, it will error out early..

bitbake -c populate_sdk -b recipes/meta/meta-toolchain.bb

./run.do_populate_sdk.27727 
Collected errors:
 * Could not obtain administrative lock for offline root (ERR: Bad file 
descriptor)  at /data/openembedded/build/arm/cortex-a8/tmp/work/x86_64-armv7a-
sdk-angstrom-linux-gnueabi/meta-toolchain-1.0-r0/sdk/image//usr/lib/opkg/lock


