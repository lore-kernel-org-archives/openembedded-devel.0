Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1KfA3P-0008FS-70; Mon, 15 Sep 2008 11:07:31 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1KfA0V-0001C6-Oh; Mon, 15 Sep 2008 10:04:32 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>)
	id 1KfA0V-0002uN-Hh; Mon, 15 Sep 2008 10:04:31 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080914235938.GH29676@smtp.west.cox.net>
References: <20080912160657.GE29676@smtp.west.cox.net>
	<20080914235938.GH29676@smtp.west.cox.net>
Date: Mon, 15 Sep 2008 10:04:30 +0100
Message-Id: <1221469471.24620.7.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: [Bug 4549] A number of xorg dev packages are uninstallable
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
X-List-Received-Date: Mon, 15 Sep 2008 09:07:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2008-09-14 at 16:59 -0700, Tom Rini wrote:
> So, there's three ways to fix this:
> - Fix these recipes to have RDEPENDS_${PN}-dev = ""
> - Fix these recipes to build empty main packages.
> - Fix package.bbclass to do the 1st option, automatically (not put the
>   dependency in to start with).
> 
> How do we get going ahead with one of these?  I could take a stab at the
> 3rd option, with some hints.

For #3, I would start by looking at populate_packages().  This is where
the files get moved into the individual packages, and is the first point
at which you get to find out whether any given package is going to be
empty or not.  As luck would have it this method also contains some
existing code to bash RDEPENDS around, which you should be able to
extend and adapt for your own purposes.

I suggest an approach along the lines of:

- extend the loop that does the initial population to notice when it is
populating ${PN}, and set a flag according to whether it has any files
in it or not. 

- then, add something along the lines of:

if pn_was_empty and "${PN}" in rdepends:
	rdepends.remove("${PN}")

to the RDEPENDS-processing loop near the bottom of the function.

p.




