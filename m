Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MlKSF-0007qv-LM
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 12:31:14 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MlKRp-0006f2-UP
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 11:30:46 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1MlKRp-0006Ix-Lh
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 11:30:45 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200909090932.52053.holger+oe@freyther.de>
References: <4AA60682.1020309@symas.com>
	<200909090932.52053.holger+oe@freyther.de>
Date: Wed, 09 Sep 2009 11:30:41 +0100
Message-Id: <1252492241.27780.738.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: wpa_supplicant and GnuTLS
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
X-List-Received-Date: Wed, 09 Sep 2009 10:31:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-09-09 at 09:32 +0200, Holger Hans Peter Freyther wrote:
> On Tuesday 08 September 2009 09:23:46 Howard Chu wrote:
> > On the Always Innovating TouchBook I've found that the wpa_supplicant
> > always fails on WPA-EAP authentication in its default package, built with
> > GnuTLS. It works fine when I rebuild it using OpenSSL. It's surprising the
> > number of packages in the distro that depend on GnuTLS. I think you should
> > seriously reconsider relying on such a volatile library in your builds.
> 
> Thanks, do you note that there are at least two things to consider? OpenSSL is  
> considered to not be GPL compatible. So people that want to distribute 
> binaries or don't want to advertize Eric Young can use GnuTLS or no SSL at 
> all..

Or yassl, I guess.  I haven't tried it myself, but in theory yassl is
meant to be approximately API-compatible with openssl so it might not be
too much of an upheaval to make wpa-supplicant work with it.

That aside, though, which SSL library to use is probably something that
ought to be a DISTRO choice rather than hard-wired.  Both OpenSSL and
GnuTLS clearly have their downsides and neither of them is going to be
suitable in all situations.

p.




