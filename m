Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N6beZ-0006Nj-D1
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 04:07:54 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id E3DE51B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Nov 2009 03:17:02 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 7 Nov 2009 04:06:18 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>
In-Reply-To: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200911070406.18094.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: what to do with wrong checksum
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
X-List-Received-Date: Sat, 07 Nov 2009 03:07:54 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 06 November 2009 21:38:40 Frans Meulenbroeks wrote:
> While trying to build xmltv I got this:
> 
> NOTE: The MD5Sums did not match. Wanted:
> '495fd8c320f67a0c8e0b90ccb060f0ea' and Got:
> '68d9a93d507bbf917e1f3ad294fd5727'
> NOTE: Task failed: Checksum of
> 'http://xmltwig.com/xmltwig/XML-Twig-3.33.tar.gz' failed
> 
> How should I handle this. Of course I can change the checksum, but i
> don't think that is the intention :-)
> Is there a version somewhere cached that has the old checksum (so I
> can compare).
> Or how else should I handle this?


Check the angstrom mirror or sources.oe.org and download that version
and then diff it.

z.


