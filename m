Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Ot9xH-0001X2-Ib
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 04:00:08 +0200
Received: from [123.192.162.165] (123-192-162-165.dynamic.kbronet.com.tw
	[123.192.162.165])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id C47CF1B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Sep 2010 02:00:56 +0000 (UTC)
Message-ID: <4C86EDFC.5030406@freyther.de>
Date: Wed, 08 Sep 2010 09:59:24 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.7) Gecko/20100720 Fedora/3.1.1-1.fc13 Lightning/1.0b2
	Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=H6oMWDysJdxA+AsRvYLRxTqRZFBJz+1qVKuf-@mail.gmail.com>
In-Reply-To: <AANLkTi=H6oMWDysJdxA+AsRvYLRxTqRZFBJz+1qVKuf-@mail.gmail.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libsegfault on ARMV5
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
X-List-Received-Date: Wed, 08 Sep 2010 02:00:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/08/2010 07:40 AM, Cliff Brake wrote:

> Backtrace:
> /lib/libSegFault.so[0x400275cc]
> /lib/libc.so.6(__default_rt_sa_restorer_v2+0x0)[0x4105e9c0]
> 
> I'm running: libsegfault - 2.9-r36.3.5
> 
> Has anyone else successfully used libsegfault on ARM built with OE, or
> have other ideas on how to accomplish this?

Could you attempt to build the binary with -fno-omit-frame-pointer and see if
it makes a difference?


