Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NCY4f-000288-0J
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 13:31:24 +0100
Received: (qmail 5416 invoked by uid 1003); 23 Nov 2009 12:29:51 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 23 Nov 2009 12:29:50 -0000
Message-ID: <4B0A803D.8080600@balister.org>
Date: Mon, 23 Nov 2009 07:29:49 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20091115163618.GA3317@jama>
	<hdr31n$8b0$1@ger.gmane.org>	<1258364356.5799.94.camel@dax.rpnet.com>
	<20091122190547.GC3349@jama>	<hedfru$gol$1@ger.gmane.org>
	<1258978516.10321.79.camel@dax.rpnet.com>
In-Reply-To: <1258978516.10321.79.camel@dax.rpnet.com>
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
X-List-Received-Date: Mon, 23 Nov 2009 12:31:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/2009 07:15 AM, Richard Purdie wrote:
> On Mon, 2009-11-23 at 09:07 +0100, Koen Kooi wrote:
>> On 22-11-09 20:05, Martin Jansa wrote:
>>
>>> Every git recipe in OE tree should have some sane hash stored in
>>> conf/distro/include/sane-srcrevs.inc
>>
>> The cabal decided that checksums are "part of the metadata" and belongs
>> in the recipes. I don't understand why SRCREVs are so different. For
>> SRCREVs my life would be a lot easier if all SRCREV where put in their
>> respective recipes. Distros can always do
>>
>> SRCREV_pn-foo = "bar"
>> PV_pn-foo = "1.2.3+gitr$SRCPV"
>>
>> in their distro.conf if needed. Due to scoping we do need some include
>> for EFL_SRCREV, since those recipes are tightly tied together.
>
> FWIW I dislike it that we have SRCREVs elsewhere. There is a problem
> (bug?) with bitbake that makes this necessary though and that bug is
> hard to fix :(.

The difference between checksums and SRCREV's is that there is one 
checksum per file, but different distro's may use different versions of 
the same software.

As Koen noted a little later, before SRCPV goes into dev, it should be 
well worked out. I'm finding the email threads hard to follow :(

Philip


>
>>   >  But be carefull with persistent cache file
>>   >  something like this:
>>   >  tmpdir-dev-shr/cache/om-gta02/bb_persist_data.sqlite
>>
>> So if I build pixman_git.bb for om-gta02 weekly, but monthly for
>> beagleboard or om-gta01 I'll also get different numbers, right?
>> I think the count should only be in a machine specific database if the
>> SRC_URI/SRCREV is machine specific.
>
> As I understand it you'll lock locking down the local build revisions
> with Angstrom anyway?
>
> If we try and solve every issue all at once with this, I doubt we're
> going to get anywhere fast. If we take the issues one at a time and chip
> away at them we may end up somewhere better.
>
> The whole SRCREV thing is a can of worms. Its no secret I dislike the
> thing and the fact we've never had a totally clean way to implement it.
> I also recognise its useful though, I use it myself :/. SRCPV is a step
> to fixing a number of problems, we just need to be careful we don't
> create many others.
>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


