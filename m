Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N8E5L-0007he-Iv
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 15:22:14 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nABEHoQ4006306 for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 14:17:50 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id p-WrrEhMFaQO
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 14:17:50 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nABEHliG006295
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 14:17:49 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200911110944.10399.holger+oe@freyther.de>
References: <1257872140.1484.335.camel@mill.internal.reciva.com>
	<200911110206.20901.holger+oe@freyther.de>
	<1257927850.25369.283.camel@lenovo.internal.reciva.com>
	<200911110944.10399.holger+oe@freyther.de>
Date: Wed, 11 Nov 2009 14:17:28 +0000
Message-Id: <1257949048.29038.388.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
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
X-List-Received-Date: Wed, 11 Nov 2009 14:22:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-11-11 at 09:44 +0100, Holger Hans Peter Freyther wrote:
> On Wednesday 11 November 2009 09:24:09 Phil Blundell wrote:
> > On Wed, 2009-11-11 at 02:06 +0100, Holger Hans Peter Freyther wrote:
> > > SRC_URI = "http://example.org/${PN}-${PV}.tar,bz2"
> > >
> > > how do you want to handle these? What happens if you place a checksum in
> > > the inc file? Do you want to propose removing SRC_URI from .ini files and
> > > put them back to the .bb files?
> > 
> > SRC_URI = "http://example.org/${PN}-${PV}.tar,bz2;md5sum=${MD5SUM}"
> > 
> > You can define ${MD5SUM} whereever you like.
> 
> This will create an even bigger mess. Sometimes you need to download two 
> things, this means you will end up with A_MD5SUM, B_MD5SUM, A_SHASUM, 
> B_SHASUM. The main problem with the above is that in contrast to a well defined 
> checksums.ini file we will end up with n-variants of the above trick.
> 
> 
> I agree that conceptually the checksum belongs to the URI, but putting it into
> the URI is just creating a horrible mess. It has issues with .inc files, adding 
> a shasum will make the URI not fit in any terminal...
> 
> The best alternatives so far where:
> 	- Place the checksums into the dir of the recipe
> 	- Use a MD5SUM_${URL} = "", SHA256SUM_${URL} = "" syntax

Might I also propose:

SCR_URI = "xyz://abc.com/efg.tgz;name=bar"

MD5SUM_bar = ""

or maybe :

MD5SUM[bar] = ""

Cheers,

Richard





