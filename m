Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NwYWc-0005tb-CA for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 12:18:23 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NwYTT-0000e8-VX for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 12:15:07 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Mar 2010 12:15:07 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Mar 2010 12:15:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 30 Mar 2010 12:14:56 +0200
Message-ID: <hosiv0$875$1@dough.gmane.org>
References: <1269878004.1681.331.camel@rex>	<20100329174253.GC25428@gmail.com>
	<1269898959.1681.692.camel@rex>	<hosgi3$v83$1@dough.gmane.org>
	<1269942145.1681.859.camel@rex>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100318 Shredder/3.0.5pre
In-Reply-To: <1269942145.1681.859.camel@rex>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Standalone gcc library builds
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
X-List-Received-Date: Tue, 30 Mar 2010 10:18:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 30-03-10 11:42, Richard Purdie wrote:
> On Tue, 2010-03-30 at 11:33 +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 29-03-10 23:42, Richard Purdie wrote:
>>> On Mon, 2010-03-29 at 10:42 -0700, Khem Raj wrote:
>>>> I have had gcc build all runtimes libraries separately. I think we should
>>>> device gcc build and we can disable building certain directories via
>>>> --disable-<dir>. We dont have to stash libgcc. Its not a big library and
>>>> its probably better to rebuild it along with rest of runtime libraries IMO
>>>> and probably we should have packages for each language runtime so people
>>>> who dont need C++ or Java or fortran dont have to build those. The same
>>>> should be tunable in gcc builds too.
>>>
>>> I talked with Khem on irc but just for the record here, I've done some
>>> testing with gcc 4.3.3 in Poky and have pushed my results to:
>>>
>>> http://git.pokylinux.org/cgit.cgi/poky/log/?h=master-gcc-runtime-testing
>>>
>>> This adds a gcc-runtime recipe which builds libgcc, libssp and libstdc++
>>> as test cases. It will be possible to build other runtime libs
>>> conditionally on whether they're enabled like libfortran easily enough.
>>
>> Can't we have seperate recipes for ssp, stdc++, fortran, java, etc? I
>> don't think we need USEFLAGs for this when we build them seperately anyway.
> 
> We'd not be using USEFLAGS, we'd just be looking at the line which tells
> gcc itself which bits to build. Having separate recipes doesn't solve
> the problem since we'd still have to work out whether the compiler for a
> given lib was built and then we enter a dependency nightmare working out
> which packages need which combinations of compilers and compiler libs.
> 
> So we can have separate recipes but think through the issues and see
> whether you still like the idea... 

Let's put it in a different way:

Can we stop artificially limiting the toolchain options and have people
opt-out instead of opt-in for stuff? I really need a full featured
toolchain :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLsc8gMkyGM64RGpERAspvAJkBUOMCqc6Z4hB7eU0lmzRGStBHBQCglZw/
CDixQmIv66vduo4Yoi2SQGk=
=dIFy
-----END PGP SIGNATURE-----



