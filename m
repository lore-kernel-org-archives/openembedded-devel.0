Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Me7wd-0006hy-0y
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 15:44:47 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 2C7AC1B10C0C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 13:31:25 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Aug 2009 15:26:46 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <4A8D4947.5030108@gmail.com>
In-Reply-To: <4A8D4947.5030108@gmail.com>
MIME-Version: 1.0
Message-Id: <200908201526.46349.holger+oe@freyther.de>
Subject: Re: LPC3250, helloworld-image, configure: error: cannot run C compiled programs
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
X-List-Received-Date: Thu, 20 Aug 2009 13:44:47 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Thursday 20 August 2009 15:01:59 Dmitry Vinokurov wrote:

> By the way, I don't understand why bitbake build gcc-cross-initial when
> I use external toolchain. Maybe I've configured something wrong and OE
> tries to build it's own toolchain, but seems like config is correct
> according to manual.

To figure out why OE is building the toolchain you can do

bitbake -g helloworld

and then look at the generated depends.dot. Looking at slugos.inc you will 
need to set more ASSUMED_PROVIDED or go the external-toolchain route (which 
sadly has not much documentation...)

z.

>
> Thanks in advance.


