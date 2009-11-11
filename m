Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N88pn-0001Zn-QI
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 09:45:50 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 803A21B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 08:55:17 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2009 09:44:10 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <1257872140.1484.335.camel@mill.internal.reciva.com>
	<200911110206.20901.holger+oe@freyther.de>
	<1257927850.25369.283.camel@lenovo.internal.reciva.com>
In-Reply-To: <1257927850.25369.283.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200911110944.10399.holger+oe@freyther.de>
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
X-List-Received-Date: Wed, 11 Nov 2009 08:45:50 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 11 November 2009 09:24:09 Phil Blundell wrote:
> On Wed, 2009-11-11 at 02:06 +0100, Holger Hans Peter Freyther wrote:
> > SRC_URI = "http://example.org/${PN}-${PV}.tar,bz2"
> >
> > how do you want to handle these? What happens if you place a checksum in
> > the inc file? Do you want to propose removing SRC_URI from .ini files and
> > put them back to the .bb files?
> 
> SRC_URI = "http://example.org/${PN}-${PV}.tar,bz2;md5sum=${MD5SUM}"
> 
> You can define ${MD5SUM} whereever you like.

This will create an even bigger mess. Sometimes you need to download two 
things, this means you will end up with A_MD5SUM, B_MD5SUM, A_SHASUM, 
B_SHASUM. The main problem with the above is that in contrast to a well defined 
checksums.ini file we will end up with n-variants of the above trick.


I agree that conceptually the checksum belongs to the URI, but putting it into
the URI is just creating a horrible mess. It has issues with .inc files, adding 
a shasum will make the URI not fit in any terminal...

The best alternatives so far where:
	- Place the checksums into the dir of the recipe
	- Use a MD5SUM_${URL} = "", SHA256SUM_${URL} = "" syntax


z.



