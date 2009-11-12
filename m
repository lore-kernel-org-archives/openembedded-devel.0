Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N8Rzj-0002bw-9H
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 06:13:22 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id C25C41B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 05:22:50 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2009 06:11:24 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <200911120457.39018.holger+oe@freyther.de>
	<6ec4247d0911112034v54f570ccn4c4334a1da094f0d@mail.gmail.com>
	<200911120549.11166.holger+oe@freyther.de>
In-Reply-To: <200911120549.11166.holger+oe@freyther.de>
MIME-Version: 1.0
Message-Id: <200911120611.24699.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: meta-toolchain continues to woe
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
X-List-Received-Date: Thu, 12 Nov 2009 05:13:22 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 12 November 2009 05:49:11 Holger Hans Peter Freyther wrote:

> The test case is really simple and I will repeat it here:
> 
> 	bitbake -c populate_sdk -b meta-toolchain.bb


bisect shows me:
	bea72c2fecde175add169bb55df1922b048030c8


IMHO the pace of the recent classes/ change was way too high, a branch and 
some builds would have been a lot better (no critics on the changes 
themselves). I'm about to write a simple meta-toolchain checker and plan to 
run it once a a week.... or if someone has a spare machine I would run this 
test there with every day..


z.


