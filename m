Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NhJya-0001DQ-1c for openembedded-devel@lists.openembedded.org;
	Tue, 16 Feb 2010 10:44:19 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NhJw2-0005es-Oy for openembedded-devel@lists.openembedded.org;
	Tue, 16 Feb 2010 10:41:38 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 10:41:38 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 10:41:38 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 16 Feb 2010 10:41:17 +0100
Message-ID: <hldp7r$l5b$1@ger.gmane.org>
References: <b6ebd0a51002151538o524cdf17s228535e93b28d4d4@mail.gmail.com>	<hldk2b$5tt$2@ger.gmane.org>
	<ac9c93b11002160039j717d1611wbdd1d2fac220dd55@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100204 Shredder/3.0.2pre
In-Reply-To: <ac9c93b11002160039j717d1611wbdd1d2fac220dd55@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Cleanup / janitors
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
X-List-Received-Date: Tue, 16 Feb 2010 09:44:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 16-02-10 09:39, Frans Meulenbroeks wrote:
> 2010/2/16 Koen Kooi <k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 16-02-10 00:38, Chris Larson wrote:
>>> Greetings all,
>>>
>>> Per discussion in the TSC meeting this month, I'm sending out this email as
>>> a probe.  Would anyone on the list benefit from a "janitors" type project,
>>> to outline and document specific cleanup tasks and how they should be done?
>>> There are many tasks that need doing which involve editing of large amounts
>>> of files in relatively simple ways, and I suspect, but am not yet certain,
>>> that there are a group of individuals who wish to contribute to the project,
>>> but are new enough that they don't feel confident diving into anything
>>> invasive.  This sort of a task could be a starting point for that sort of
>>> individual.  Thoughts?  Anyone out there in that camp currently that would
>>> benefit from something like this?
>>
>> The first project that comes to mind is converting simple recipes (e.g.
>> not perl) to new style staging. It's a fairly simple job that has a huge
>> impact.
> 
> Problem is to do that reliable.
> It is easy to remove the do_stage section from a recipe, and it is
> easy to verify that it builds, but it is already becoming less trivial
> to verify that everything that depends on it builds too,

A simpile first step is:

1) build recipe
2) bump PR
3) fix staging
4) build recipe
5) diff the 2 packaged-staging recipes

If the result of 4) is a superset of 1) then you most likely did the
right thing.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLemg9MkyGM64RGpERAsJhAKCVNBO2i/El72HF3YNgz9qdm8QenQCfbwg9
g2/Zq8mnEUP7Z5OqNdYX7xA=
=pT6Y
-----END PGP SIGNATURE-----



