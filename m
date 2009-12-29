Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NPko1-00020q-KJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Dec 2009 23:44:48 +0100
Received: by iwn32 with SMTP id 32so7743277iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Dec 2009 14:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=Q5kgTknbEsIeb/UGH6J2Fb4ZmFM3tAG9aA+SrrXmang=;
	b=uLf6lXrxeM4iTr+pUlUZLaTRxLOHjgRKOaLrSJb6NlXSUXHEsNhcwpu1Ak1ABFZhk2
	3biy5ecJESwE5tYlp4WgAZMLuNR7CNFArIbCa6KGKqU6GiFnoYuRo779LuHsp1Eu/Jxt
	HXY+MDOSaPXpeCHoQY0lZS0zNOXqD7mhar7+c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=uuPsw6tmRz1GmqeEPtp8UyNrKAyGumfAHzA+932VCqEmJulcs9TO2p6XO/AXqyZLX8
	XOU6H6ChXH1a4dnjGlYJ9k7Q/1ijxCcqu+CrNJYsz6X9goQMjDoamg272UqdMlu0PHiE
	nRGtMbwtV8fA0ISaqWt4QKXIMZxXnx+MC8UYI=
MIME-Version: 1.0
Received: by 10.231.123.41 with SMTP id n41mr1793909ibr.46.1262126566892; Tue, 
	29 Dec 2009 14:42:46 -0800 (PST)
In-Reply-To: <c384c5ea0912291144p3c800d9fq4975f94494a04e1f@mail.gmail.com>
References: <c384c5ea0912290715l24b705fat6700077741b1cc5b@mail.gmail.com>
	<hhdipd$25q$2@ger.gmane.org>
	<c384c5ea0912291144p3c800d9fq4975f94494a04e1f@mail.gmail.com>
Date: Tue, 29 Dec 2009 14:42:46 -0800
Message-ID: <19c1b8a90912291442q426ddd95n9acff7b8df592092@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Move IMAGE_BOOT stuff into distro's?
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
X-List-Received-Date: Tue, 29 Dec 2009 22:44:48 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 29, 2009 at 11:44 AM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> Hello Koen,
>
> On Tue, Dec 29, 2009 at 7:46 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 29-12-09 16:15, Leon Woestenberg wrote:
>>> Why do we hardcode names of default packages in the "image.bbclass"?
>>>
>>> Now every image recipe that doesn't want these has to know the
>>> variables it has to override.
>>>
>>> Shouldn't this be distro material instead?
>>
>> No, since these are things you want to be able to manage on a per image
>> basis, not distro wide. I don't want to create a whole 'new' distro just
>> to try mdev instead of udev or use tinylogin instead of shadow, etc.
>> When we made that change we discussed what the default values for those
>> vars should be and it was agreed they should provide sane defaults.
>>
> OK understood, apparantly we want to have a generic image base
> containing udev, a login, shadow etc.
> that is distro-indepent.
>
> Can we remove that from the image class, and move into a
> image-boot.inc or something?

or create a class base-image without these defaults
and let image class include base-image plus these IMAGE_* defaults
that way you dont have to modiy recipes which inherit image which are many
instead one can modify the recipes which dont need the IMAGE_* defaults
to inherit from base-image

-Khem


