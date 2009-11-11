Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1N8Fjr-00057H-U3
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 17:08:11 +0100
Received: from [85.210.2.237] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1N8Fib-0006Mh-50
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 16:06:49 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b10911110801q308a2d80g916a0271757fedd5@mail.gmail.com>
References: <1257872140.1484.335.camel@mill.internal.reciva.com>
	<200911110206.20901.holger+oe@freyther.de>
	<1257927850.25369.283.camel@lenovo.internal.reciva.com>
	<200911110944.10399.holger+oe@freyther.de>
	<1257949048.29038.388.camel@dax.rpnet.com>
	<1257954353.25369.304.camel@lenovo.internal.reciva.com>
	<ac9c93b10911110801q308a2d80g916a0271757fedd5@mail.gmail.com>
Date: Wed, 11 Nov 2009 16:06:43 +0000
Message-ID: <1257955603.25369.325.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.2.237
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: pb@reciva.com
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
X-List-Received-Date: Wed, 11 Nov 2009 16:08:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2009-11-11 at 17:01 +0100, Frans Meulenbroeks wrote:
> 2009/11/11 Phil Blundell <philb@gnu.org>:
> > On Wed, 2009-11-11 at 14:17 +0000, Richard Purdie wrote:
> >> SCR_URI = "xyz://abc.com/efg.tgz;name=bar"
> >>
> >> MD5SUM_bar = ""
> >>
> >> or maybe :
> >>
> >> MD5SUM[bar] = ""
> >
> > The labelling is a good idea, although I am not especially keen on
> > either of those notations.  How about:
> >
> > SRC_URI = "xyz://abc.com/efg.tgz;name=bar"
> > SRC_URI[md5sum:bar] = "..."
> > SRC_URI[sha256sum:bar] = "..."
> >
> Would we still be able to use PN and PV in the md5sum:bar etc?

Not directly, though it isn't entirely obvious to me why this would be a
useful thing to do.  Did you have a situation in mind where this would
be desirable?

p.




