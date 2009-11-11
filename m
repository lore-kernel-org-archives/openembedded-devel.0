Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1N89M3-0000KS-TI
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 10:19:11 +0100
Received: from [85.210.2.237] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1N89Kn-0006wm-IH
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 09:17:50 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200911110944.10399.holger+oe@freyther.de>
References: <1257872140.1484.335.camel@mill.internal.reciva.com>
	<200911110206.20901.holger+oe@freyther.de>
	<1257927850.25369.283.camel@lenovo.internal.reciva.com>
	<200911110944.10399.holger+oe@freyther.de>
Date: Wed, 11 Nov 2009 09:17:42 +0000
Message-ID: <1257931062.25369.292.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.2.237
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
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
X-List-Received-Date: Wed, 11 Nov 2009 09:19:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2009-11-11 at 09:44 +0100, Holger Hans Peter Freyther wrote:
> This will create an even bigger mess. Sometimes you need to download two 
> things, this means you will end up with A_MD5SUM, B_MD5SUM, A_SHASUM, 
> B_SHASUM. The main problem with the above is that in contrast to a well defined 
> checksums.ini file we will end up with n-variants of the above trick.

The number of recipes where multiple items need to be downloaded and
checksummed is small: this is a tiny minority of the total.  So,
although I agree that this case will become more ugly, I don't think
this is going to be a common enough problem that it will represent a
very big deal.

> I agree that conceptually the checksum belongs to the URI, but putting it into
> the URI is just creating a horrible mess. It has issues with .inc files, adding 
> a shasum will make the URI not fit in any terminal...
> 
> The best alternatives so far where:
> 	- Place the checksums into the dir of the recipe
> 	- Use a MD5SUM_${URL} = "", SHA256SUM_${URL} = "" syntax

I would be happy with the latter of those suggestions.  I don't think
the former really addresses the problems with the current checksums.ini.

p.




