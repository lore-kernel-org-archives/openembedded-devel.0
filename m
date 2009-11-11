Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1N8DJT-0003lk-HM
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 14:32:46 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1N8DID-0003P5-Sx
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 13:31:25 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1N8DID-0002Kq-PO
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 13:31:25 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200911111043.21119.holger+oe@freyther.de>
References: <1257872140.1484.335.camel@mill.internal.reciva.com>
	<200911110944.10399.holger+oe@freyther.de>
	<1257931062.25369.292.camel@lenovo.internal.reciva.com>
	<200911111043.21119.holger+oe@freyther.de>
Date: Wed, 11 Nov 2009 13:31:21 +0000
Message-Id: <1257946281.1484.345.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
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
X-List-Received-Date: Wed, 11 Nov 2009 13:32:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-11-11 at 10:43 +0100, Holger Hans Peter Freyther wrote:
> On Wednesday 11 November 2009 10:17:42 Phil Blundell wrote:
> > On Wed, 2009-11-11 at 09:44 +0100, Holger Hans Peter Freyther wrote:
> > > This will create an even bigger mess. Sometimes you need to download two
> > > things, this means you will end up with A_MD5SUM, B_MD5SUM, A_SHASUM,
> > > B_SHASUM. The main problem with the above is that in contrast to a well
> > > defined checksums.ini file we will end up with n-variants of the above
> > > trick.
> > 
> > The number of recipes where multiple items need to be downloaded and
> > checksummed is small: this is a tiny minority of the total.  So,
> > although I agree that this case will become more ugly, I don't think
> > this is going to be a common enough problem that it will represent a
> > very big deal.
> 
> It depends. Currently the instructions to update the checksums.ini are 
> straight forward and branch free, with the above it is impossible to write a 
> branch free documentation that everyone can follow. :)

True.  On the other hand, if you are making a recipe with multiple
downloaded tarballs then you are already some way outside what can be
achieved using a straightforward "painting by numbers" approach.  I'm
not sure that the checksums make a material difference to that.

> PS: Let me come up with a patch introducing the new variables..

That'd be great.

p.




