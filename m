Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Mba7S-0001Xc-R3
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 15:13:27 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 661AE1B10C0C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 13:00:06 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Aug 2009 14:56:10 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <4A83BD15.7070006@atmel.com> <h60t34$5kl$1@ger.gmane.org>
	<4A8402B0.1000308@atmel.com>
In-Reply-To: <4A8402B0.1000308@atmel.com>
MIME-Version: 1.0
Message-Id: <200908131456.10488.holger+oe@freyther.de>
Subject: Re: Ideas for scripts, to save work, when building several boards
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
X-List-Received-Date: Thu, 13 Aug 2009 13:13:27 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 13 August 2009 14:10:24 Ulf Samuelsson wrote:

> Thanks for helping out, but it does not work as expected.
>
> I first create a local.conf for the at91sam9261df
> and bitbake x11-image.
> Then I do "MACHINE=at91sam9g20dfc bitbake console-image".
> A console-image is built,but for the at91sam9261df,
> which is stored in "tmp/deploy/glibc/images/at91sam9261df"
>
> The bitbake does not generate u-boot/kernel or at91bootstrap
> for the at91sam9260dfc

Stupid question. The task that should pull in u-boot/kernel or at91bootstrap 
is not machine specific?

z.


