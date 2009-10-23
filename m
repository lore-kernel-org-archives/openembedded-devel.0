Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N18w8-0002nR-R2
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 03:27:27 +0200
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 8734E1B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 01:35:34 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Oct 2009 03:26:13 +0200
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <4AE0BEFA.4020905@mlbassoc.com>
	<19c1b8a90910221735t5c91498ft9a692cd75c442db4@mail.gmail.com>
In-Reply-To: <19c1b8a90910221735t5c91498ft9a692cd75c442db4@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200910230326.13922.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SDK problems
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
X-List-Received-Date: Fri, 23 Oct 2009 01:27:27 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Friday 23 October 2009 02:35:31 Khem Raj wrote:

> One reason could be that its not getting right libc to link with. You
> could check <staging>/usr/lib/libc.so
> and it should be a text file which points to right libc to link with.
> On glibc it was different than in eglibc
> eglibc one should work. I do not know about glibc as I do not have
> working version of glibc here.

Okay,

thanks to Khem on irc and pointing me to -Wl,-verbose there is something fishy 
with the libc_nonshared.a in the SDK. I have no idea what kind of problem but 
the workaround is to copy libc_nonshared.a from the OE staging to

/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/lib.


regards
	holger




