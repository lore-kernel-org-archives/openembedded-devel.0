Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1MBD2h-00073R-Jw; Mon, 01 Jun 2009 21:19:31 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1MBCuD-0006c3-NM; Mon, 01 Jun 2009 20:10:45 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <h017kn$emm$1@ger.gmane.org>
References: <gr7nfd$32a$1@ger.gmane.org>
	<20090601165809.GZ23842@smtp.west.cox.net> <h012tn$v40$1@ger.gmane.org>
	<1243880254.5049.1.camel@lenovo.internal.reciva.com>
	<h017kn$emm$1@ger.gmane.org>
Date: Mon, 01 Jun 2009 20:10:44 +0100
Message-Id: <1243883444.5049.8.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] Rebuild external kernel modules on kernel change
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
X-List-Received-Date: Mon, 01 Jun 2009 19:19:32 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-06-01 at 20:45 +0200, Koen Kooi wrote:
> On 01-06-09 20:17, Phil Blundell wrote:
> > On Mon, 2009-06-01 at 19:25 +0200, Koen Kooi wrote:
> >> So far I've only seen suggestions that will trigger a rebuild of recipes
> >> using module*bbclass, but no solutions for automagic version changes so
> >> that the package manager will pick it up as well.
> >
> > I don't quite understand why this is so complicated; can't you just
> > append the kernel's ABI version to either ${PR} or ${PV} (depending on
> > whether or not you want parallel installability) for the modules?
> 
> No, since PV and PR need to be known at parsing time when the kernel 
> hasn't been built yet.

I can't think offhand of any reason why it's important to have PR
available at parse time, but if that's the case then you could splice it
into DISTRO_PR (or some equivalent variable) instead.

My reference to PV above was spurious; it's no different to PR in this
context.  If you want parallel installation then it's actually PKG_xx
that you need to modify (or, conceptually, PN, but fiddling with that
would almost certainly be a bad idea).

p.




