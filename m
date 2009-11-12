Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1N8fPr-0007xp-O2
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 20:33:15 +0100
Received: from [85.210.2.237] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1N8fOb-0005Na-Bm
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 19:31:53 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20091112191809.GG9787@mx.loc>
References: <200911110206.20901.holger+oe@freyther.de>
	<1257927850.25369.283.camel@lenovo.internal.reciva.com>
	<200911110944.10399.holger+oe@freyther.de>
	<1257949048.29038.388.camel@dax.rpnet.com>
	<1257954353.25369.304.camel@lenovo.internal.reciva.com>
	<ac9c93b10911110801q308a2d80g916a0271757fedd5@mail.gmail.com>
	<1257955603.25369.325.camel@lenovo.internal.reciva.com>
	<ac9c93b10911110937u4607a2c8w9e63c9df738d8fe8@mail.gmail.com>
	<1257971641.25369.426.camel@lenovo.internal.reciva.com>
	<1258050962.25369.454.camel@lenovo.internal.reciva.com>
	<20091112191809.GG9787@mx.loc>
Date: Thu, 12 Nov 2009 19:31:49 +0000
Message-ID: <1258054309.25369.457.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Thu, 12 Nov 2009 19:33:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2009-11-12 at 20:18 +0100, Bernhard Reutner-Fischer wrote:
> >+            raise Exception("MD5 Sums do not match. Wanted: '%s' Got: '%s'" % (want_md5sum, md5data))
> 
> Why are you providing the same information as a note and in the
> exception text?

This is the way those diagnostics have always been done (see the
existing code in base.bbclass).  In practice I don't think the exception
text is used for anything but it seems fairly harmless to go on
providing it.  If we're going to change that then it should presumably
be done for both forms of the checksum code, not just for this one.

p.




