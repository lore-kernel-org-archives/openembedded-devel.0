Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PLBSe-0008D9-PE for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 10:16:21 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PLBRU-0003Vz-RS for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 10:15:08 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 10:15:08 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 10:15:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 24 Nov 2010 10:14:55 +0100
Message-ID: <icil2f$6jr$1@dough.gmane.org>
References: <AANLkTim3cKQRr0e1VQRiLf=95jOHC5=TGPQfXbDoZCmj@mail.gmail.com>	<ich10v$f5b$1@dough.gmane.org>
	<AANLkTimuLxR88D2jRH=-Ky0BRLK5GkbyqUcSO8FhK=KW@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <AANLkTimuLxR88D2jRH=-Ky0BRLK5GkbyqUcSO8FhK=KW@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BitBake parallel parsing testing
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
X-List-Received-Date: Wed, 24 Nov 2010 09:16:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-11-10 19:42, Chris Larson wrote:
> On Tue, Nov 23, 2010 at 11:26 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>> On 23-11-10 15:29, Chris Larson wrote:
>>
>>> Thanks for your time, and do let me know what you think, either of the
>>> code, performance in general, or the new progress bar (shows an ETA),
>>
>> The heuristic for the progress needs some work, it currently seems to
>> take in account all the parsed recipes instead of the last N recipes.
> 
> That's what our progress display always did, it's just more obvious now.

That's not what I meant :) I meant that the progressbar will jump to 75%
since that was already parsed and the ETA heuristic gets thrown off by
the "75% in 1 second".

regards,

Koen

> 
>> Try ctrl-c'ing it at 75% and restarting, you'll see the ETA taking weird
>> values. In my case it stayed on "10 seconds" for more than a minute.
> 
> The issue is one I've discussed with foerster a fair bit already.
> When you're fully cached, the majority of the time isn't in the
> parsing, it's in the loading of the cache file from disk, which isn't
> part of our progress at all right now.  Either we stall for seconds
> before the progress bar comes up, or we don't appear to stall, but the
> ETA is a bit off.
> 
> Long term the intent is to properly integrate cache loading into this
> progress bar, or into its own -- see
> https://github.com/foerster/bitbake/commit/320b114d92181b3f944776b7e8c8db4b868ee3f1
> for foerster's initial work on this.
> 
> After thinking about what you mentioned about the recipe count being
> parsed, and given the fact that cached recipes aren't "parsed",
> they're loaded from disk and then added to our CacheData, perhaps we
> should change the parsing progress display to truly only show the
> recipes being *parsed*, which is what you implied, and add a "Loading
> cache..." message before the progress bar comes up, so we don't appear
> to stall, then add a proper progress bar for the cache file loading as
> a second step.
> 
> Alternatively, we change the progress display to truly indicate what's
> being done.. if we consider all recipes, it's not *parsing* that we're
> doing, its .. perhaps.. processing?
> 
> *ponders*

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFM7NePMkyGM64RGpERAqWGAJoDVbAtMbIibKGGzLw03IBQMipa3QCghnTK
wq00iIWQlV+R+SKupneaC7o=
=IUFS
-----END PGP SIGNATURE-----



