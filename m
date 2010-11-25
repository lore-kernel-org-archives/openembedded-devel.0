Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjaquez@igalia.com>) id 1PLYeP-0000FP-DY
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 11:02:02 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApsEAObC7UxbdWOb/2dsb2JhbACjer1YhUcEjXA
X-IronPort-AV: E=Sophos;i="4.59,253,1288566000"; d="scan'208";a="702990433"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 25 Nov 2010 11:00:48 +0100
Received: from [192.168.12.206] (helo=lit.local.igalia.com)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PLYdE-0002na-6D; Thu, 25 Nov 2010 11:00:48 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>)
	id 1PLYdD-0006W5-6T; Thu, 25 Nov 2010 11:00:47 +0100
Date: Thu, 25 Nov 2010 11:00:46 +0100
From: =?iso-8859-1?Q?V=EDctor_M=2E_J=E1quez_L=2E?= <vjaquez@igalia.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
Message-ID: <20101125100046.GA32024@lit.local.igalia.com>
References: <20101123113706.GA3533@lit.local.igalia.com>
	<4CEBD252.7000502@mentor.com>
	<20101123145713.GA3032@lit.local.igalia.com>
	<4CEBDABB.1060607@mentor.com>
	<6EB1C564-9BA3-4833-B7F3-72EA4B2F8C51@dominion.thruhere.net>
	<20101123160525.GB3032@lit.local.igalia.com>
	<ich14q$f5b$2@dough.gmane.org> <4CEC15EF.3090906@mentor.com>
	<AANLkTi=r-WTGRKTOb_0W89fUyrq67W9u-S_uPQ14dSrX@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=r-WTGRKTOb_0W89fUyrq67W9u-S_uPQ14dSrX@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 212.51.32.151
X-SA-Exim-Mail-From: vjaquez@igalia.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>,
	openembedded-devel@lists.openembedded.org
Subject: Re: external-toolchain-csl-1.0-r6 fails
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
X-List-Received-Date: Thu, 25 Nov 2010 10:02:02 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Nov 24, 2010 at 11:22:44PM -0500, Ben Gardiner wrote:
> Hi All,
> 
> Sorry to jump in so late.
> 
> On Tue, Nov 23, 2010 at 2:28 PM, Tom Rini <tom_rini@mentor.com> wrote:
> > So to be clear, there is, or is not, another solution for using a
> > non-angstrom toolchain to build angstrom?
> 
> I ran into this once and I'm happy to say that there is a solution
> [1]. It was committed [2] by Denys Dmytriyenko and Signed off by Koen
> Kooi [3].
> 
> 2010/11/23 Víctor M. Jáquez L. <vjaquez@igalia.com>:
> > I'm using the openembedded's branch org.openembedded.dev (HEAD)
> >
> > my local.conf
> > [...]
> > # enable following line to use CodeSourcery Lite
> > TARGET_VENDOR := "-none"
> > TOOLCHAIN_TYPE := "external"
> > TOOLCHAIN_BRAND := "csl"
> 
> I think you'll find that you are able to build using CSL if you use
> TOOLCHAIN_VENDOR instead of TARGET_VENDOR in your local.conf. I tested
> with CSL's 2009q1 -- YMMV.

It works! Thanks a lot for the clarification and sorry for the noise.

vmjl

> 
> Best Regards,
> Ben Gardiner
> 
> [1] http://article.gmane.org/gmane.comp.handhelds.openembedded/38201
> [2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=f3b29a03710280fda6561b37313a56dd759befac
> [3] http://article.gmane.org/gmane.comp.handhelds.openembedded/38212
> 
> ---
> Nanometrics Inc.
> http://www.nanometrics.ca
> 


