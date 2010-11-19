Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PJRmL-00055G-0V for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 15:17:29 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PJRlB-0005tg-DU for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 15:16:17 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 15:16:17 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 15:16:17 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 19 Nov 2010 15:16:02 +0100
Message-ID: <ic60r2$hrs$1@dough.gmane.org>
References: <AANLkTinVj9oh0p9xp9ZUtBijB63Fy7O8LcXc5-tUF9v6@mail.gmail.com>	<ic5jrc$ksc$1@dough.gmane.org>
	<4CE67FA1.6020901@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <4CE67FA1.6020901@mentor.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release-2010.12 branch ready for testing
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
X-List-Received-Date: Fri, 19 Nov 2010 14:17:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 19-11-10 14:46, Tom Rini wrote:
> On 11/19/2010 03:34 AM, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 18-11-10 22:27, Khem Raj wrote:
>>> Hello all,
>>>
>>> The work branch for upcoming 2010.12 release has been created.
>>
>> Why was this created? We were *very* clear at OEDEM that there would be
>> no branch, only a tag.
>>
>> Why was this changed? I only see some vague handwaving from the TSC
>> (well, from Phil, saying it was the TSC) who didn't consult the OE
>> developers at all.
>>
>> The whole point of releases was that they are based of a tag from .dev,
>> not some random branch. Again, why was that changed?
> 
> At least for making a release tag exist, if we can't have a freeze on
> .dev (or otherwise an agreement that .dev should focus on making the
> testing packages build and work, over new work) making a temporary
> branch to cherry-pick into seems to be the next possible solution.
> Otherwise the release tag is just another testing tag...

Well, that was the whole point. The release is supposed to be only a
testing tag...

We were very clear at OEDEM, no *branch* only a tag. If .dev isn't
working, find a testing tag in the past that does work and use that as a
release.

It seems people are trying to polarize issues, when they shouldn't. So
no "freeze .dev", but "pay more attention to .dev" and no "release
branch" but "encourage getting more green into tinderbox".

The idea was to get a release out and see how people are using it to
improve the process and test conditions, not making a kneejerk process
for this release.

I've seen no discussion on this list why we need a branch or a freeze
instead of following the OEDEM plam, only people stating that we need
it. So what's wrong with the original plan of getting the release out
and using actual experience as feedback for future releases?


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFM5oahMkyGM64RGpERAk1OAJ9Oo6sMLydFi5HYoVQAfQr4AoVVrQCfRd0V
v06+p6STeoj35fihSo/Lu2I=
=d9+8
-----END PGP SIGNATURE-----



