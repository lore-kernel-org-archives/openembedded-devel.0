Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NbvrG-00067R-7Q
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 13:58:29 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Nbvos-0001A0-Ci
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 12:55:58 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1Nbvos-0006NQ-5b
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 12:55:58 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1265011036-9086-1-git-send-email-raj.khem@gmail.com>
References: <1265011036-9086-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 01 Feb 2010 12:55:54 +0000
Message-ID: <1265028954.3777.317.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH][RFC] gcc: Restructure package creation.
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
X-List-Received-Date: Mon, 01 Feb 2010 12:58:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-01-31 at 23:57 -0800, Khem Raj wrote:
> Hi,
> 
> Inspired by a discussion with RP on IRC this patch does following.
> 
> * Package most of target libraries during gcc-cross recipes
>   and not during gcc target recipe.
> 
> * Do not build and package libraries like libstdc++ and others
>   twice (once during cross compile and then during target gcc compile)
> 
> More libraries that can be built in cross gcc recipe should be packaged
> there. These changes can be done after this patch.
> 
> Comments ?

I think it might be better to unbundle the libraries from gcc{-cross}
altogether, and put them in a new recipe called gcc-runtime or
something.  Having them built as part of gcc-cross seems to cause a
certain level of headache for people who are using external toolchains;
this happens already with libgcc and libstdc++, and I suspect your patch
will cause the same issues to start popping up with the other libraries.

Or, even better, put the different language runtimes in separate recipes
so that folks who want to use Fortran can build those libraries without
everybody else needing to do so.

p.




