Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1N1J1R-0007cf-HO
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 14:13:36 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1N1J0S-0000kW-QT
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 13:12:32 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1N1J0S-00053f-Mr
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 13:12:32 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1256296026.9503.26.camel@hammer.suse.cz>
References: <200910230504.57681.holger+oe@freyther.de>
	<1256286976.4529.117.camel@mill.internal.reciva.com>
	<hbrs68$gbd$1@ger.gmane.org> <200910231133.11053.holger+oe@freyther.de>
	<hbru1e$m80$1@ger.gmane.org> <1256296026.9503.26.camel@hammer.suse.cz>
Date: Fri, 23 Oct 2009 13:12:29 +0100
Message-Id: <1256299949.4529.152.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: pb@reciva.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Fri, 23 Oct 2009 12:13:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-10-23 at 13:07 +0200, Stanislav Brabec wrote:
> I think that the logic should be:
> 
> libfoo.a exists and libfoo.so exists => put .a to -static.
> 
> libfoo.a exists and libfoo.so does not exist => put .a to -dev.
> 
> This logic will work as most users expect and will need no exception for
> glibc.

I agree that this logic would give you the optimum results in all cases,
but I am not sure that it is worth the trouble to implement.  There are
hardly any packages that ship static-only libraries and most (perhaps
all) of the ones that do are most likely doing so for erroneous reasons.
The remaining packages that ship static-only libraries for good reason
are almost certainly few enough in number that they could be fixed up
individually.

> That is why I would like to introduce new global default:
> --disable-static (via variable, site config or so).

That sounds like a fine idea to me.  I'm not so sure about making it the
default, but providing an easy switch that DISTROs can use to turn off
static libraries globally would be a good plan.

p.



