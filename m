Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N89l5-00016m-QD
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 10:45:02 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id A7B531B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 09:54:29 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2009 10:43:21 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <1257872140.1484.335.camel@mill.internal.reciva.com>
	<200911110944.10399.holger+oe@freyther.de>
	<1257931062.25369.292.camel@lenovo.internal.reciva.com>
In-Reply-To: <1257931062.25369.292.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200911111043.21119.holger+oe@freyther.de>
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
X-List-Received-Date: Wed, 11 Nov 2009 09:45:02 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 11 November 2009 10:17:42 Phil Blundell wrote:
> On Wed, 2009-11-11 at 09:44 +0100, Holger Hans Peter Freyther wrote:
> > This will create an even bigger mess. Sometimes you need to download two
> > things, this means you will end up with A_MD5SUM, B_MD5SUM, A_SHASUM,
> > B_SHASUM. The main problem with the above is that in contrast to a well
> > defined checksums.ini file we will end up with n-variants of the above
> > trick.
> 
> The number of recipes where multiple items need to be downloaded and
> checksummed is small: this is a tiny minority of the total.  So,
> although I agree that this case will become more ugly, I don't think
> this is going to be a common enough problem that it will represent a
> very big deal.

It depends. Currently the instructions to update the checksums.ini are 
straight forward and branch free, with the above it is impossible to write a 
branch free documentation that everyone can follow. :)


PS: Let me come up with a patch introducing the new variables..


