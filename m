Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Me7ty-0006ed-B4
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 15:42:02 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 2202A1B10C0C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 13:28:39 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Aug 2009 15:23:59 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <4A8D4947.5030108@gmail.com>
In-Reply-To: <4A8D4947.5030108@gmail.com>
MIME-Version: 1.0
Message-Id: <200908201523.59750.holger+oe@freyther.de>
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
X-List-Received-Date: Thu, 20 Aug 2009 13:42:02 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Thursday 20 August 2009 15:01:59 Dmitry Vinokurov wrote:
> Hello,
>
> I'm trying to build helloworld-image for LPC3250 board and created
> local.conf and lpc3250.conf (files attached) using prebuilt toolchain
> and 'bitbake -v helloworld-image' give following error:

I think you should explore using the external-toolchain. This way you will 
have to set the PATH to the toolchain and make "external-toolchain" the 
default provider...

And for the old way have you seen this: 
http://docs.openembedded.org/usermanual/html/commonuse_prebuilt_toolchain.html?

z.



>
> Looks like bitbake use ARM toolchain instead of X86 and of course it
> cannot run ARM targets on my laptop. Could somebody explain, please, how
> this mess with toolchains can be fixed?
>
> By the way, I don't understand why bitbake build gcc-cross-initial when
> I use external toolchain. Maybe I've configured something wrong and OE
> tries to build it's own toolchain, but seems like config is correct
> according to manual.
>
> Thanks in advance.


