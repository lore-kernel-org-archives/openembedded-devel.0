Received: from mail-yx0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NSp6L-0005Wn-E8
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 10:56:24 +0100
Received: by yxe1 with SMTP id 1so16927873yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2010 01:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bXZO4as4FuDgJRdLI1hW2iE/anrnwzvLM6ASeeEFV7I=;
	b=JhkvSHwZFKtOwmT4RwtQ/v6ZNabzg7y9QkBCmeGMykFLCFLLRaMxeLAyu5a7XoszYl
	aB3nfKhEr+tNefoWK4yYNUEmvj0z5uUwRboxzFzf3eO2pLYWxTdDBZl7/mnh1pCRrnE6
	4gT6MmcENEXEpWL1hHkOmojU9u+Y9RD5NtQt8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BY4vX38jfI5i1XA4f0ULwN4Nb0Zs4pZWG2S6o++M7KgXfyL/gr6dzdzkuVbe7yzIvU
	p13ZxKVaxQrcgbaumzVaozIOHF7UFVzpvQi/RJJR1ifJZHf78HKBGm7r0X+oX6nRZfmB
	naoNO9AMF4BW4iWbOo1QjR8Q3vR1fTwoa6FoM=
MIME-Version: 1.0
Received: by 10.101.168.12 with SMTP id v12mr8191660ano.122.1262858055834; 
	Thu, 07 Jan 2010 01:54:15 -0800 (PST)
In-Reply-To: <hi4a73$gpt$2@ger.gmane.org>
References: <201001060507.31754.holger+oe@freyther.de>
	<hi31m7$hc3$1@ger.gmane.org>
	<20100107084341.GB1950@xora-vm2.xora.org.uk>
	<ac9c93b11001070050i67af2caem7ac6d7164b130c@mail.gmail.com>
	<20100107092121.GC1950@xora-vm2.xora.org.uk>
	<ac9c93b11001070135v3ec3e542m892c8a0fc014f4f6@mail.gmail.com>
	<hi4a73$gpt$2@ger.gmane.org>
Date: Thu, 7 Jan 2010 10:54:15 +0100
Message-ID: <ac9c93b11001070154u1cbc1f06xfdb127aadd8bc42d@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.171
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: QA Goals for OpenEmbedded
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
X-List-Received-Date: Thu, 07 Jan 2010 09:56:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/7 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 07-01-10 10:35, Frans Meulenbroeks wrote:
>> 2010/1/7 Graeme Gregory <dp@xora.org.uk>:
>>> On Thu, Jan 07, 2010 at 09:50:36AM +0100, Frans Meulenbroeks wrote:
>>>> 2010/1/7 Graeme Gregory <dp@xora.org.uk>:
>>>>> On Wed, Jan 06, 2010 at 11:09:10PM +0100, Rolf Leggewie wrote:
>>>>>> allergic to COMPATIBLE_MACHINE for no particular reason). =A0Bitbake=
 can't
>>>>>> do versioned depends and so we can't say that $bb2-$version does not
>>>>>> compile with gcc less than 3.4.x, for example. =A0Those are just two
>>>>>> examples. =A0XorA "solved" this in a hackish way with angsstrom.bbcl=
ass.
>>>>>>
>>>>> No he didnt and no its not a hack. Its a blacklist of packages that f=
or
>>>>> various reasons Angstrom NEVER wants built.
>>>>
>>>> Should we have such a blacklist per machine?
>>>> My sheevaplug rungs angstrom, but as it has no display it has no need
>>>> for an X server, nor for ide or pci or sata tools.
>>>>
>>> It follows the standard overide rules (or should do) so you should
>>> be able to blacklist per machine.
>>>
>>> Of course you chose a bad example as I know quite a few people are usin=
g
>>> the sheeva with usb displaylink adapters.
>>
>> Ah ok, I don't know any of them, but let's stay on safe grounds and
>> take pci or sata tools as an example ;-)
>
> You don't like usb2sata adaptors?

Ok the grounds were not as safe as I hoped  :-)
Do they expose as sata drives? I know about usb2sata adaptors to
connect a sata disk via usb, but afaik it shows to the system as a usb
peripheral not as a sata peripheral.

Guess pci is a safer example (but if someone knows a usb to pci or
mini-pci adaptor I'd be glad to learn about it).

And sorry for dragging this off-topic, but eventually probably the
question remains whether everything should be supported on every hw.
(I'm also thinking about sw like compiz, sw for dedicated, platform
specific hw (e.g. fpga), etc)

FM
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFLRawjMkyGM64RGpERAoFSAKCds8QU/tPv0gOIpDIshm1FZ/cJVQCgnoMl
> 3J3CPrd7P7UyYBDhCOebPfQ=3D
> =3Dcmr3
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


