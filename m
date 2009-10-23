Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N1Gru-0007YT-3Z
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 11:55:38 +0200
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 39A231B10C06
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 10:03:45 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Oct 2009 11:54:22 +0200
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <200910230504.57681.holger+oe@freyther.de>
	<200910231133.11053.holger+oe@freyther.de>
	<hbru1e$m80$1@ger.gmane.org>
In-Reply-To: <hbru1e$m80$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200910231154.22284.holger+oe@freyther.de>
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
X-List-Received-Date: Fri, 23 Oct 2009 09:55:38 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 23 October 2009 11:46:22 Koen Kooi wrote:

> > and I would prefer to have debug symbols in there. you can always strip
> > them out of the final binary but you can not add them when they are gone.
> 
> Installing foo-dbg doesn't work?

It will not. At least from my understanding of an .a archive. You will need to 
get the symbols into the binary when statically linking, this will not happen 
when they are in a .debug/liba.a.

Does this sound correct?

	z.


