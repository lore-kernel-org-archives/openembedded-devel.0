Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Nx9AY-0002GM-TT
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 03:26:03 +0200
Received: from tamarin.localnet (123-192-181-204.dynamic.kbronet.com.tw
	[123.192.181.204])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 26D521B10C79
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Apr 2010 01:27:10 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 1 Apr 2010 03:22:42 +0200
User-Agent: KMail/1.13.2 (Linux/2.6.34-rc3-00001-g17459ed; KDE/4.4.2; i686; ; )
References: <p2i66b2b2311003311747q17b48520vc3440b4427037d7a@mail.gmail.com>
In-Reply-To: <p2i66b2b2311003311747q17b48520vc3440b4427037d7a@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201004010322.42530.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OPKG Architecture
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
X-List-Received-Date: Thu, 01 Apr 2010 01:26:03 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 01 April 2010 02:47:59 John Tobias wrote:
> Hi all,
> 
> I built angstrom for dm6446 and use the kernel 2.6.18 from montavista. Both
> kernel and filesystem works well as I expected. But, I've got one problem,
> I couldn't use the .pkg files because of the architecture differences. The
> .pkg contain armv5te while uname -m returning armv5tejl.
> 
> Any idea?

You can always /etc/opkg/arch.conf, and you can change the dm6446 config to 
include this architecture as well.


