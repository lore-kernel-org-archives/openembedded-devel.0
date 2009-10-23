Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N1FSB-00021c-4C
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 10:24:58 +0200
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 0B3971B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 08:33:06 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Oct 2009 10:23:43 +0200
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <200910230504.57681.holger+oe@freyther.de>
	<200910230930.00314.holger+oe@freyther.de>
	<hbrnn4$1kd$1@ger.gmane.org>
In-Reply-To: <hbrnn4$1kd$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200910231023.43911.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Fri, 23 Oct 2009 08:24:58 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 23 October 2009 09:58:28 Koen Kooi wrote:

> > Why do you need .a files on the device? Is this normal operation or only
> > when installing -dev packages?
> 
> When installing -dev packages, yes. For example on the touchbook default
> image we ship a toolchain and -dev packages for clutter to allow people
> to build things on the target. By stripping the .a files we save about
> 200MiB.
> 
> I can think of a few solutions:
> 
> * build toolchain packages with -ggdbN where N < 3
> * use a safer stripping option in package.bbclass
> * blacklist libc_nonshared.a
> 
> Do you have more solutions and which do you prefer? I really like to
> avoid blowing up -dev packages if we can safely strip (most of) them.

I see. Yeah the -ggdb3 can make things quite big. The problem is if I want to 
link statically and debug having debug symbols and symbols around is quite 
helpful. Currently the .a files are just plain broken (worse than not 
installing).

One thing that pops back into my mind is to move .a files into a -static 
package? People that want to link statically can pick their .a files.

z.


