Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OyXAf-0008Sb-7K
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 23:48:11 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OyXAZ-0002n2-9M from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 14:48:03 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 22 Sep 2010 14:48:02 -0700
Received: from [172.30.80.208] ([172.30.80.208]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 22 Sep 2010 15:48:01 -0600
Message-ID: <4C9A798D.10904@mentor.com>
Date: Wed, 22 Sep 2010 14:47:57 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C9950D0.7000907@gmail.com> <i7dkar$2hg$1@dough.gmane.org>
In-Reply-To: <i7dkar$2hg$1@dough.gmane.org>
X-OriginalArrivalTime: 22 Sep 2010 21:48:02.0062 (UTC)
	FILETIME=[D4704AE0:01CB5A9F]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] at91bootstrap.inc: Mark COMPATIBLE_MACHINEs.
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
X-List-Received-Date: Wed, 22 Sep 2010 21:48:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> As a general remark to your current patch series, I think there is some
> confusion what COMPATIBLE_MACHINE is for. To me it's signals "this
> recipe is specific to a *machine*", not "this recipe is missing files to
> make it work without other archs/machines".

Let me just add that I agree, and talked with Graham on IRC a good bit 
after the patch series was posted (and before I noticed them on the ML).

I think what we need to do here is make a list of recipes that simply 
don't patch for all arches due to missing some usually easy "porting" 
work and putting that up on the janitors page as work that needs doing 
by someone.

> The cases:
> 
> spidermonkey/firefox/numpy: needs jsautocfg.h for each arch, no need for
> COMPATIBLE_MACHINE or COMPATIBLE_ARCH, people need to add support for
> their archs

And to further add, Debian has gone and made these files in some cases 
(mips/mipsel) and in others, it shouldn't be hard to craft it 
(translating autoconf variables into what mozilla wants) or if 
qemu-$arch works, dig out the program that generates the file and do so.

> u-boot-env/pivotboot: needs a file for each machine to work properly,
> but adding an (empty) fallback file is the way to go since it's only
> used in deploy/.

I gotta disagree here.  You're saying a valid and machine specific file 
needs adding for this to do something on a machine and a dummy fallback 
so it builds uselessly for all.  Isn't that a good reason to use the 
COMPATIBLE_MACHINE mask?

> Tacking on COMPATIBLE_{MACHINE,HOST} would just hide the problems and
> make fixing it more more tedious than it needs to be. For kernel and
> uboot C_M is used to make bitbake do the right thing since they all
> share the same PN.

Agreed.  These are heavy handed variables that need to be used with 
care.  This patchset does expose problems, which is good, it's just a 
matter of solving them well.

-- 
Tom Rini
Mentor Graphics Corporation


