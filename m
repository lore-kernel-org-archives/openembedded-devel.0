Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NMeFZ-00016e-0i for openembedded-devel@lists.openembedded.org;
	Mon, 21 Dec 2009 10:08:24 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NMeDn-0006JG-J7
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Dec 2009 10:06:31 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2009 10:06:31 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2009 10:06:31 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 21 Dec 2009 10:06:08 +0100
Message-ID: <hgndpv$i9t$1@ger.gmane.org>
References: <1261080453-12752-1-git-send-email-raj.khem@gmail.com>	<1261081378.6896.472.camel@lenovo.internal.reciva.com>	<hglsfj$2vi$1@ger.gmane.org>
	<19c1b8a90912201813i54c9e5d9r6e1545a3a9106f74@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.5) Gecko/20091219 Shredder/3.0.1pre
In-Reply-To: <19c1b8a90912201813i54c9e5d9r6e1545a3a9106f74@mail.gmail.com>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] conf/machine: Add x86_64 machine.
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
X-List-Received-Date: Mon, 21 Dec 2009 09:08:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 21-12-09 03:13, Khem Raj wrote:
> On Sun, Dec 20, 2009 at 11:04 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>>> On Thu, 2009-12-17 at 12:07 -0800, Khem Raj wrote:
>>>>
>>>> * This is not supporting multilib
>>>> * Only 64-bit userspace can be built.
>>>>
>>>> --- /dev/null
>>>> +++ b/conf/machine/include/tune-x86_64.inc
>>>> @@ -0,0 +1,4 @@
>>>> +TARGET_CC_ARCH = "-mtune=generic"
>>>> +BASE_PACKAGE_ARCH = "x86_64"
>>>> +FEED_ARCH = "x86_64"
>>>> +PACKAGE_EXTRA_ARCHS += "x86 i386 i486 i586 i686"
>>
>> NAK! Don't use underscores in machine names since it's what bitbake is using
>> to mark overrides. I fell into that trap twice already :(
>>
>> Also, please explain to me what you plan to do with 'FEED_ARCH'.
> 
> I was thinking of using amd64 but ARCH has to be
> x86_64 at least for gcc so I think we can not avoid
> it. may be we should make bitbake ignore certain
> overrides like x86_64 if thats possible at all.

We re-write arch already for kernel recipes, so why can't we do the same
for gcc?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLLzqAMkyGM64RGpERAtuHAJ9YxU54qCR7lAiUbjkxRqBi7ISycACeOkMG
yrR9wiUNLhHC4im/yz7j92s=
=Lk4J
-----END PGP SIGNATURE-----



