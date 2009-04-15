Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lu1pC-0005mM-Mx
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 11:54:39 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lu1lV-0005lt-TG
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 09:50:45 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 15 Apr 2009 09:50:45 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Apr 2009 09:50:45 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 15 Apr 2009 11:50:30 +0200
Message-ID: <gs4al7$76r$1@ger.gmane.org>
References: <1239788125.3467.8.camel@x60.spackhandychoptubes.co.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090407 Shredder/3.0b3pre
In-Reply-To: <1239788125.3467.8.camel@x60.spackhandychoptubes.co.uk>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: kexec-tools-static build failue for zaurus collie
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
X-List-Received-Date: Wed, 15 Apr 2009 09:54:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-04-09 11:35, Chris Sykes wrote:
> Hi,
>
> I'm currently failing in my attempts to get OE built for my Zaurus
> collie.  I'm using an up-to-date git checkout on the stable 2009 branch.
>
> OE Build Configuration:
> BB_VERSION        = "1.8.12"
> METADATA_BRANCH   = "stable2009"
> METADATA_REVISION = "272ae318b03bcd062f8b43258ce54a2cd96b9f45"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux"
> MACHINE           = "collie"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "2009.X-test-20090415"
> TARGET_FPU        = "soft"
>
> Interestingly (or perhaps not), the kexec-tools build seems to go just
> fine, it's just kexec-tools-static that has a problem.
>
> It seems to be an include path problem as 'mach/memory.h' is not found.

Looks like kexectools-static doesn't account for the big arm header move 
in the kernel yet.

regards,

Koen



