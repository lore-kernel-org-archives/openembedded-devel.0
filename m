Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N81gj-0005TY-7E
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 02:08:00 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 7A9C21B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 01:17:25 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2009 02:06:20 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <1257872140.1484.335.camel@mill.internal.reciva.com>
In-Reply-To: <1257872140.1484.335.camel@mill.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200911110206.20901.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM 2009 summary: Death to checksums.ini?
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
X-List-Received-Date: Wed, 11 Nov 2009 01:08:00 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 10 November 2009 17:55:40 Phil Blundell wrote:
> The current checksums.ini arrangement has a number of issues:
> 
>  - single monolithic file is a rich source of merge conflicts
>  - concrete URIs require many duplicate entries for different mirrors
>  - can be annoying for folks using overlays and/or collections
>  - storing the checksum separately from the rest of the .bb file makes
> cherry-picking harder than it needs to be
>  - large amount of churn in checksums.ini can make it hard to spot cases
> where checksums were changed rather than just added.
> 
> It was proposed that, rather than storing checksums centrally in
> checksums.ini, they should be placed in the individual .bb file to which
> the checksum relates.  Bitbake already has a certain level of support
> for reading checksums from SRC_URI and it would seem natural to try to
> make use of that.

*sigh*

SRC_URI = "http://example.org/${PN}-${PV}.tar,bz2"

how do you want to handle these? What happens if you place a checksum in the 
inc file? Do you want to propose removing SRC_URI from .ini files and put them 
back to the .bb files?


z.


