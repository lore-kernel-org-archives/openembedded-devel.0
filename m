Received: from mail-yx0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NcwZq-0003zd-4f
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Feb 2010 08:56:41 +0100
Received: by yxe1 with SMTP id 1so2067870yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Feb 2010 23:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=B8RneeuPPe3Cf2ilJs3pdmcsR4dQ1GzOK8h86Z20CPE=;
	b=A4Qp5vYDsuAZqAip5A6ZiVgw9CTok+tgk0DLvkHbeKoMZAKc9TkkuUHeXCKCtz/cGh
	byFm4xRly5pwI3wZR8fVShXFUxSQmDG2oXIN1nVNKZptciR8egxGsYs5XzbUNfSlel/W
	cqLyKaSwm5pH4m29bwE3nEyRONvqWCFFq8Tzc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=bYecstH5j20oClZPvJr8+Sf+YL5fUyDfTUt/xsujmU5caMUi5MU60G4S4g/vQTT01I
	TeQr+a4wjesSXfNmM6tF1I2RCUrm+r3BRCUUXCMjbOc9SyxFN9mxhCACmdGXFjuD7ZXJ
	Xm1EFuwJr5E14khaXmxqWyaCPvalAYKUtdoSw=
MIME-Version: 1.0
Received: by 10.101.170.12 with SMTP id x12mr900679ano.127.1265270049205; Wed, 
	03 Feb 2010 23:54:09 -0800 (PST)
In-Reply-To: <hkdu2c$cfg$1@ger.gmane.org>
References: <1265189276.5591.40.camel@mattotaupa>
	<ac9c93b11002031422t18df39f6m77de57c50241227@mail.gmail.com>
	<hkdu2c$cfg$1@ger.gmane.org>
Date: Thu, 4 Feb 2010 08:54:09 +0100
Message-ID: <ac9c93b11002032354i1f48758ao25a0f5df038c49a8@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.171
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: =?UTF-8?B?UmU6IEFzdXMgRWVlIFBDIDcwMSA0RywgcGVyZm9ybWFuY2UgYW5kIGluY2x1c2lvbiBpbnRvIMOFbmdzdHLDtm0=?=
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
X-List-Received-Date: Thu, 04 Feb 2010 07:56:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/2/4 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 03-02-10 23:22, Frans Meulenbroeks wrote:
>> 2010/2/3 Paul Menzel <paulepanter@users.sourceforge.net>:
>>> Dear Denis and OE developers,
>>>
>>>
>>> Denis committed support for Asus Eee PC 701 4G [2] some days ago [1].
>>>
>>> 1. Denis, could tell us something about the performance of OE on this
>>> netbook compared to the distribution you ran on there before.
>>>
>>> 2. Is it possible to include this machine in the =C5ngstr=F6m online bu=
ilder
>>> [3]?
>>>
>>
>> Here is a patch for narcissus
>> Sorry that it is an attachment but had to beat gmails line wrapping.
>>
>> Koen, can you review and apply if ok?
>
> Applied with one small changes (unstable/*.ipk -> configs/unstable/*.ipk)=
.

Ouch, overlooked that one. Guess it was too late when I made it.

BTW the eeepc 701 did not build out of the box for me (libx11), that
has been fixed and pushed too.

Frans


