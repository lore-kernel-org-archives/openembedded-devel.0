Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OWmSw-00073k-4d
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jul 2010 10:28:28 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OWmNx-0003PB-5G
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jul 2010 09:23:09 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTilH4HHsk0ftnGdTN43qWb70aDZvYt1o6557tAH4@mail.gmail.com>
References: <1278527926-5065-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTikso9BfJHslU0Ss6nQ5SfnOdgy8RIU0WF383jXX@mail.gmail.com>
	<1278529036.4413.67.camel@lenovo.internal.reciva.com>
	<AANLkTil6ZzCLdFEKksqKwjzCj_DV2DT7eifCJakP1HhR@mail.gmail.com>
	<1278531880.4413.70.camel@lenovo.internal.reciva.com>
	<AANLkTilH4HHsk0ftnGdTN43qWb70aDZvYt1o6557tAH4@mail.gmail.com>
Date: Thu, 08 Jul 2010 09:23:18 +0100
Message-ID: <1278577398.15825.1.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] classes/base.bbclass: add INCOMPATIBLE_MACHINE
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
X-List-Received-Date: Thu, 08 Jul 2010 08:28:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2010-07-08 at 08:49 +0200, Frans Meulenbroeks wrote: 
> The only concern I have is the name COMPATIBLE_TARGET
> for me TARGET is the board so COMPATIBLE_TARGET for me more or less
> equates to COMPATIBLE_MACHINE.
> What about COMPATIBLE_ARCH or COMPATIBLE_ARCHITECTURE?

I think the variable that you want to match against (in the specific
case of cross.bbclass) is ${TARGET_SYS}.  Having the matching variable
be named COMPATIBLE_ARCH would imply that it's going to match
${HOST_ARCH}, which obviously isn't what you want.

I would have thought that confusion with ${MACHINE} should be minimal
since that nomenclature is already quite well established in OE.  But
you could name it COMPATIBLE_TARGET_SYS if you wanted to make the name
completely explicit.

p.




