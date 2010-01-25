Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NZLi2-0004g1-UM for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 10:58:18 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NZLfm-0007l4-84
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 10:55:54 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2010 10:55:54 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2010 10:55:54 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 25 Jan 2010 10:55:23 +0100
Message-ID: <hjjpqa$dgo$1@ger.gmane.org>
References: <1264277173.3738.74.camel@mattotaupa.wohnung.familie-menzel.net>	<20100124070602.GA8642@denix.org>
	<hjh7f3$6v0$2@ger.gmane.org>	<20100125015636.GA9855@denix.org>
	<hjjk5q$rmc$1@ger.gmane.org> <20100125084340.GA18489@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100113 Shredder/3.0.2pre
In-Reply-To: <20100125084340.GA18489@denix.org>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Official policy to list checksums
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
X-List-Received-Date: Mon, 25 Jan 2010 09:58:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 25-01-10 09:43, Denys Dmytriyenko wrote:
> On Mon, Jan 25, 2010 at 09:19:07AM +0100, Koen Kooi wrote:
>>>> * it has no tools to autogenerate it
>>>
>>> Give me few minutes - I'll send something to address this point.
> 
> Do you have any feedback on the patch I sent? Does it make things any better?

It seems to automate things a bit more, but I haven't tested them yet.

> 
>>>> * has not been agreed on in any way.
>>>
>>> Actually, specifying checksums in corresponding recipes was agreed on during 
>>> the OEDEM in November. Using additional variable flags in base.bbclass was 
>>> added by Phil, since bitbake cannot handle SHA256 sums in SRC_URI. Although, 
>>> Richard mentioned he'd like to get it implemented in bitbake at some point:
>>> http://thread.gmane.org/gmane.comp.sysutils.bitbake.devel/1089/focus=1115
>>
>> Ah yes, stuff agreed at OEDEM, I see. I also remember that nearly
>> everything that was 'agreed' there got dis-agreed on the mailinglist here.
>> And I also remember that I said that to be consistent sane-srcrevs
>> should cease to exist as well :)
> 
> This way we won't get anywhere... :) I thought (maybe I'm wrong) everybody 
> agrees at least with the fact that central checksums.ini is not the best 
> approach.

It's not the best approach in a perfect world, but with the current
state of OE it is the best (or least bad) of the options out there.

> Keeping checksums in the metadata inside SRC_URI seemed like a 
> viable solution.

Yes, but there wasn't any agreement on this. The only thing that came
out of this is that Phil coded some stuff and committed it.

What started all this was that some people found using checksums.ini too
hard. We can argue about that, but anyway. Now we seem to end up with a
system that's actually harder to use (at least without your patches)
*and* is lacking the most basic docs. It's not in the wiki nor in the
in-tree docs.

> Are there any fundamental flaws with this method, besides 
> lacking some tools?

Complete lack of docs, e.g. what does the 'name' do? And why are people
doing http://foo.com/bar.c;name=tarball?

In ti/staging I've been giving them all unique names. Do I need to do
that? I 'name' even needed? I don't know and I suspect everyone minus
Phil doesn't either.

> BTW, I agree with you on the sane-srcrevs topic, if it's any consolation... :)

Good :) I want to be able to 'move' recipes between overlays and having
the checksums in the recipe itself is a step in the right direction,
having SRCREVs in the recipes themselves would be even better.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLXWqLMkyGM64RGpERAlHHAJ0ZrH+Q7vBIrxmQNbN1CpdETpRIEgCdGFSM
HoAqu5kPJ+8AEhruFIEq9Jg=
=hF0z
-----END PGP SIGNATURE-----



