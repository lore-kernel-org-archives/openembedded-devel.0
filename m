Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NCYw9-0003Cp-HS for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 14:26:40 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NCYul-0002GX-5s
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 14:25:11 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 14:25:11 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 14:25:11 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 23 Nov 2009 14:24:44 +0100
Message-ID: <hee2es$a4o$1@ger.gmane.org>
References: <20091115163618.GA3317@jama>	<hdr31n$8b0$1@ger.gmane.org>	<1258364356.5799.94.camel@dax.rpnet.com>	<20091122190547.GC3349@jama>	<hedfru$gol$1@ger.gmane.org>	<1258978516.10321.79.camel@dax.rpnet.com>
	<4B0A803D.8080600@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <4B0A803D.8080600@balister.org>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
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
X-List-Received-Date: Mon, 23 Nov 2009 13:26:40 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-11-09 13:29, Philip Balister wrote:
> On 11/23/2009 07:15 AM, Richard Purdie wrote:
>> On Mon, 2009-11-23 at 09:07 +0100, Koen Kooi wrote:
>>> On 22-11-09 20:05, Martin Jansa wrote:
>>>
>>>> Every git recipe in OE tree should have some sane hash stored in
>>>> conf/distro/include/sane-srcrevs.inc
>>>
>>> The cabal decided that checksums are "part of the metadata" and belongs
>>> in the recipes. I don't understand why SRCREVs are so different. For
>>> SRCREVs my life would be a lot easier if all SRCREV where put in their
>>> respective recipes. Distros can always do
>>>
>>> SRCREV_pn-foo = "bar"
>>> PV_pn-foo = "1.2.3+gitr$SRCPV"
>>>
>>> in their distro.conf if needed. Due to scoping we do need some include
>>> for EFL_SRCREV, since those recipes are tightly tied together.
>>
>> FWIW I dislike it that we have SRCREVs elsewhere. There is a problem
>> (bug?) with bitbake that makes this necessary though and that bug is
>> hard to fix :(.
>
> The difference between checksums and SRCREV's is that there is one
> checksum per file, but different distro's may use different versions of
> the same software.

And that makes it not part of the metadata?

regards,

Koen



