Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1OpLK0-0005YF-Pu
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 15:19:51 +0200
Received: (qmail 17866 invoked by uid 1003); 28 Aug 2010 13:19:11 -0000
Received: from pool-96-240-180-89.ronkva.east.verizon.net (HELO
	?192.168.1.167?) (philip@opensdr.com@96.240.180.89)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	28 Aug 2010 13:19:11 -0000
Message-ID: <4C790CCD.9060403@balister.org>
Date: Sat, 28 Aug 2010 09:19:09 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.8) Gecko/20100806 Fedora/3.1.2-1.fc13 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>	<i586bt$t12$1@dough.gmane.org>	<AANLkTikWe-88_U7FmV2mi4=J6XV-A3-nYUqJdjDNzOA9@mail.gmail.com>	<i5aoas$sja$2@dough.gmane.org>
	<AANLkTi=stV1ahzagn-7Fzq73pL3xYDDBZpAsfRUbA86v@mail.gmail.com>
In-Reply-To: <AANLkTi=stV1ahzagn-7Fzq73pL3xYDDBZpAsfRUbA86v@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] recipes: Update recipes to get 'bitbake world' parse and calculate runqueue successfully.
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
X-List-Received-Date: Sat, 28 Aug 2010 13:19:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/28/2010 07:51 AM, Frans Meulenbroeks wrote:
> 2010/8/28 Koen Kooi<k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Your patch does too many things at once, to recipes I maintain, so
>> please split it up per recipe and I'll ack/nack the seperate patches.
>> I'm getting suck of such jumbo patches that can't be reverted cleanly.
>> I'm still dealing with the fallout from the crappy deletions frans did,
>> so patches like this aren't helping.
>
> Ehm, I did not see a request to revert any of the deletions.
> There have been two issues (openssl and docbook-sgml-dtd, and both
> have been reverted in 16 hrs or so. (and later on one or two other
> deletions have been reverted on request of the recipe owners, but
> these did not cause any breakage afaik).
> So I really don't know what fallout you are dealing with.
> And my deletions were not exactly jumbo patches and were very easy to
> revert if needed.
>
> And as I already wrote before: dev head is bleeding edge, so sometimes
> things go wrong. Can happen. No big deal if resolved quickly. That is
> the risk of living on the edge. If you can't live with that use the
> stable branch or create your own branch where you are in full control.
> The root cause is that you do what can be considered production work
> on dev head. Most seasoned software engineers will agree that that is
> not very wise and
>
> BTW apparently your perception on my work apparently is a minority
> viewpoint. If I recall correctly two people complained to me and at
> least 5 mentioned to me that they appreciated my activity.

Add my voice to the "minority". You've been pushing some large patches 
that work for you, but may not for others. There is always work in 
progress in .dev, so all recipes may not meet your standards.

Philip


>
> Frans.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


