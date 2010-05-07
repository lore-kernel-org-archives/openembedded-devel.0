Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OAJWL-0003bw-78
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 11:07:05 +0200
Received: from 88-108-80-109.dynamic.dsl.as9105.com ([88.108.80.109]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OAJSf-0001rN-Mt
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 10:03:09 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BE185C7.50305@dresearch.de>
References: <4BE13C20.1010902@dresearch.de>
	<20100505094242.GF2444@xora-desktop.xora.org.uk>
	<4BE141CA.30904@dresearch.de>
	<1273053926.18119.331.camel@mill.internal.reciva.com>
	<4BE185C7.50305@dresearch.de>
Date: Fri, 07 May 2010 10:03:06 +0100
Message-ID: <1273222986.4378.18.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux vs. linux-libc-headers?
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
X-List-Received-Date: Fri, 07 May 2010 09:07:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-05-05 at 16:50 +0200, Steffen Sledz wrote:
> As mentioned before that's just one problem and we have some more.
> I do not have time and knowledge to hunt and fix them all.

That is unfortunate.

> So for the moment i would prefer to work with linux-libc-headers
> of version 2.6.24.
> 
> But what's the recommended way to select them in OE/Angstrom?

As far as OE goes, it's fairly easy: you just set
PREFERRED_VERSION_linux-libc-headers appropriately.  But, if Angstrom
has taken a distro decision to use the 2.6.31 headers then you will have
a problem: if you just make that change for one MACHINE, your binaries
will now be different to everybody else's and hence what you are
building is not really Angstrom anymore.

If you are not willing to fix glibc then I think there are only three
sensible ways to proceed:

a) update your machine to use the 2.6.31 kernel so that the problem goes
away; or

b) persuade the Angstrom maintainers to adopt 2.6.24 headers as their
DISTRO standard, though this will presumably cause some fallout in terms
of other incompatibilities so I suspect it will be a struggle; or

c) create your own DISTRO, which can be a derivative/fork of Angstrom if
you wish, and in which you can obviously do whatever you like.  This
probably seems like a bit of a large hammer to crack that particular nut
but it is more or less the only way in which you can use a different
version from the other Angstrom folks.

p.




