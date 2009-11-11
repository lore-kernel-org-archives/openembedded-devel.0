Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1N8B95-0002ph-6P
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 12:13:54 +0100
Received: from [192.168.1.7] (dialbs-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by drlauer-research.com (Postfix) with ESMTP id A28C2128006C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 12:58:29 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1257931062.25369.292.camel@lenovo.internal.reciva.com>
References: <1257872140.1484.335.camel@mill.internal.reciva.com>
	<200911110206.20901.holger+oe@freyther.de>
	<1257927850.25369.283.camel@lenovo.internal.reciva.com>
	<200911110944.10399.holger+oe@freyther.de>
	<1257931062.25369.292.camel@lenovo.internal.reciva.com>
Organization: Vanille-Media
Date: Wed, 11 Nov 2009 12:12:34 +0100
Message-ID: <1257937954.6879.2.camel@opal>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
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
X-List-Received-Date: Wed, 11 Nov 2009 11:13:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 11.11.2009, 09:17 +0000 schrieb Phil Blundell:
> On Wed, 2009-11-11 at 09:44 +0100, Holger Hans Peter Freyther wrote:
> > This will create an even bigger mess. Sometimes you need to download two 
> > things, this means you will end up with A_MD5SUM, B_MD5SUM, A_SHASUM, 
> > B_SHASUM. The main problem with the above is that in contrast to a well defined 
> > checksums.ini file we will end up with n-variants of the above trick.
> 
> The number of recipes where multiple items need to be downloaded and
> checksummed is small: this is a tiny minority of the total.  So,
> although I agree that this case will become more ugly, I don't think
> this is going to be a common enough problem that it will represent a
> very big deal.
> 
> > I agree that conceptually the checksum belongs to the URI, but putting it into
> > the URI is just creating a horrible mess. It has issues with .inc files, adding 
> > a shasum will make the URI not fit in any terminal...
> > 
> > The best alternatives so far where:
> > 	- Place the checksums into the dir of the recipe
> > 	- Use a MD5SUM_${URL} = "", SHA256SUM_${URL} = "" syntax
> 
> I would be happy with the latter of those suggestions.  I don't think
> the former really addresses the problems with the current checksums.ini.

I agree here, the latter syntax seems well.

:M:




