Received: from smtp-4.concepts.nl ([213.197.30.111])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1OtLaS-00029l-ST
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 16:25:21 +0200
Received: from c3404277.ftth.concepts.nl ([195.64.66.119]
	helo=mx1.grimmerink.nl) by smtp-4.concepts.nl with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1OtLLG-0002An-Mn
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 16:09:38 +0200
Received: from [10.9.0.12] (unknown [10.9.0.12])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.grimmerink.nl (Postfix) with ESMTPSA id 2546D6A07D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Sep 2010 16:09:34 +0200 (CEST)
From: pieterg <pieterg@gmx.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 8 Sep 2010 16:09:32 +0200
User-Agent: KMail/1.9.9
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>
	<AANLkTi=o8sM5eBxtMLbB3WVk4vQ8r5mL7g5SKSrK0h34@mail.gmail.com>
	<i6629i$d5c$1@dough.gmane.org>
In-Reply-To: <i6629i$d5c$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201009081609.32135.pieterg@gmx.com>
X-Concepts-MailScanner-Information: Please contact abuse@concepts.nl for more
	information
X-Concepts-MailScanner-ID: 1OtLLG-0002An-Mn
X-Concepts-MailScanner: Found to be clean
X-Concepts-MailScanner-SpamCheck: 
X-Concepts-MailScanner-From: pieterg@gmx.com
X-SA-Exim-Connect-IP: 213.197.30.111
X-SA-Exim-Mail-From: pieterg@gmx.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Images no longer automatically include libstdc++6
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
X-List-Received-Date: Wed, 08 Sep 2010 14:25:22 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 07 September 2010 21:03:14 Koen Kooi wrote:
> On 07-09-10 18:18, Khem Raj wrote:
> > On Tue, Sep 7, 2010 at 5:52 AM, Koen Kooi <k.kooi@student.utwente.nl> 
wrote:
> >> it happens when you build 'gcc' after 'gcc-cross', gcc will doesn't
> >> create a libstdc6++ package, but it does create a libstdc-dev package.
> >
> > I see thats plausible. I think its time to look into separating gcc
> > runtime from gcc on the lines of poky.
>
> I put back libgcc and libstdc++ for the time being:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=241b8865f20
>b9e3c3beb334535e6cd8452cbf47d
>
> I have a feeling the others needs to put back as well (e.g. fortran),
> but this fixes the immediate problem.

Not for me, after a clean build today packages are still missing libstdc++ 
in their deps (and as a result the images are still missing libstdc++).
So there must be more to it.

Rgds, Pieter


