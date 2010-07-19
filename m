Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OatU1-0003dk-Sx
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jul 2010 18:46:27 +0200
Received: from [62.7.80.98] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OatTu-0000cz-E3
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jul 2010 17:46:18 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1OatTu-0005u2-6u
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jul 2010 17:46:18 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTikuwarIRXUIOX1L2A2LBD7D-Rhglsd-Rur8QaOO@mail.gmail.com>
References: <1279527857-12295-1-git-send-email-raj.khem@gmail.com>
	<1279549587.2345.2154.camel@mill.internal.reciva.com>
	<AANLkTikuwarIRXUIOX1L2A2LBD7D-Rhglsd-Rur8QaOO@mail.gmail.com>
Date: Mon, 19 Jul 2010 17:46:17 +0100
Message-ID: <1279557977.2345.2174.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-Broken-Reverse-DNS: no host name found for IP address 62.7.80.98
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sane-toolchain.inc: THUMB_INTERWORK should not be defined for armv4 and add armv4 to ARM EABI supporting architectures.
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
X-List-Received-Date: Mon, 19 Jul 2010 16:46:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-07-19 at 09:29 -0700, Khem Raj wrote:
> On Mon, Jul 19, 2010 at 7:26 AM, Phil Blundell <philb@gnu.org> wrote:
> > On Mon, 2010-07-19 at 01:24 -0700, Khem Raj wrote:
> >> -THUMB_INTERWORK = "yes"
> >> +# armv4 does not have thumb instruction set therefore no interworking instructions
> >> +# so if machine is based on armv4 we dont have choice.
> >> +
> >> +THUMB_INTERWORK_armv4 = "no"
> >> +THUMB_INTERWORK ?= "yes"
> >
> > I don't think this is necessary or desirable.  If you are building for
> > v4 then the BX instructions ought to be fixed up during final link.
> 
> Yes with --fix-v4bx/--fix-v4bx-interworking its possible.
> 
> 
> Is
> > there a particular problem that you're trying to solve?
> >
> 
> Not any particular case but some versions of compiler do not pass
> flags to --fix-v4bx-interworking ld.

True.  But this is sane-toolchain we're talking about, and the version
that it selects by default (4.4.4) does get this right.  So I don't
think it's going to be a big deal in practice.

p.




