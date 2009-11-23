Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NCaVk-00038p-22
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 16:07:31 +0100
Received: (qmail 1901 invoked by uid 1003); 23 Nov 2009 15:05:58 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 23 Nov 2009 15:05:58 -0000
Message-ID: <4B0AA4D5.8020507@balister.org>
Date: Mon, 23 Nov 2009 10:05:57 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20091115163618.GA3317@jama>
	<hdr31n$8b0$1@ger.gmane.org>	<1258364356.5799.94.camel@dax.rpnet.com>
	<20091122190547.GC3349@jama>	<hedfru$gol$1@ger.gmane.org>
	<1258978516.10321.79.camel@dax.rpnet.com>	<hee2r8$bav$1@ger.gmane.org>
	<1258986598.10321.99.camel@dax.rpnet.com>
In-Reply-To: <1258986598.10321.99.camel@dax.rpnet.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SRCPV migration - How SRCPV works!
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
X-List-Received-Date: Mon, 23 Nov 2009 15:07:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/2009 09:29 AM, Richard Purdie wrote:
> On Mon, 2009-11-23 at 14:31 +0100, Koen Kooi wrote:
>> On 23-11-09 13:15, Richard Purdie wrote:
>>
>>> As I understand it you'll lock locking down the local build revisions
>>> with Angstrom anyway?
>>
>> Dunno about that, ideally the SRCPV merge should have no impact at all
>> on existing distros, but it looks like everyone will be forced to lock
>> revisions/counts down.
>
> How is locking the counts down using LOCALCOUNT any different to the
> current situation?
>
>> If there is a way to convert the database to a .inc file then we'd be a
>> step closer to coordinating counts between buildhosts (or rebuilds from
>> scratch).
>
> Any method using .inc files is going to race. The only solution that is
> likely to work is a single server allocating numbers in some form.
>
>> Currently the SRCPV looks like a major step backwards to the current
>> situation unless you are on a single buildhost *and* never delete TMPDIR
>> *and* use AUTOREV *and* care about upgrade paths.
>
> Well this clearly isn't the case.
>
> Its intended to be a neural step (apart from some PE issues) for
> everyone except for the users of AUTOREV who it helps. Their use case is
> limited to a single autobuilder model where they need to keep one file
> in TMPDIR but can otherwise delete it.

Given the only concrete benefit I can see is that it makes it easier for 
people using AUTOREV and git, can we examine the use case for this and 
see if there are alternatives? If this is needed for people doing 
development work, wouldn't it make more sense to focus in sdk issues?

Philip



>
>> It would be a lot better if bitbake could just do the revlog | wc -l
>> trick after do_fetch has run. Or at least use that as localcount if a
>> snapshot exists in TMPDIR during parsing.
>
> As you're more than well aware, two different behaviours depending on
> whether "a snapshot exists in TMPDIR during parsing" is maintenance and
> reproducibility nightmare.
>
> The first suggestion would be nice, patches welcome.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


