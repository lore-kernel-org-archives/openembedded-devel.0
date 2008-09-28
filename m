Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1Kk1TB-0002rb-RS
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Sep 2008 20:58:15 +0200
Received: from 88-109-232-232.dynamic.dsl.as9105.com ([88.109.232.232]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1Kk1PE-0008GF-Ct
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Sep 2008 19:54:10 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080928161320.GA5665@rhein.zuhause.netz>
References: <87abdtcpvp.fsf@neumann.lab.ossystems.com.br>
	<gbo38l$9sr$1@ger.gmane.org> <20080928161320.GA5665@rhein.zuhause.netz>
Date: Sun, 28 Sep 2008 19:53:53 +0100
Message-Id: <1222628033.4426.6.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: fennec fails to build when host system lacks autoconf2.13
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
X-List-Received-Date: Sun, 28 Sep 2008 18:58:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2008-09-28 at 18:13 +0200, Henning Heinold wrote:
> On Sun, Sep 28, 2008 at 04:10:29PM +0200, Koen Kooi wrote:
> > On 27-09-2008 22:09, Otavio Salvador wrote:
> >> Hello,
> >>
> >> It takes a while until I found the reason fennec was failing to build;
> >> it needs autoconf2.13 but OE doesn't has it anymore.
> >>
> >> Does someone feels like fixing it?
> >
> > I've asked the mozilla people to fix their crappy autotools code, but  
> > they say that the mozilla code isn't buggy, but that all autoconf >2.13  
> > versions are buggy.....
> 
> Args,
> 
> I looked at this autotools abuse too and this is really crap. Seems
> no easy fixing for us.

Is it that hard to put autoconf 2.13 back in OE?  I don't know why it
was removed but I can't think of any insurmountable obstacle to
reinstating it.  Debian is still shipping that old version for
compatibility reasons, which suggests that there is a significant
codebase out there which doesn't build with autoconf 2.50 and newer.

p.




