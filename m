Received: from [209.85.220.216] (helo=mail-fx0-f216.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MZpCT-0007WO-2p
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Aug 2009 18:55:21 +0200
Received: by fxm12 with SMTP id 12so1821496fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Aug 2009 09:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=RoXfmp7df/OcrWjHAYrARZ2u02bh5c3M77P3RLUGE64=;
	b=d9QPIMB18rA2aJi4jpX34cMI6Qj77+EtNYAhCOlxeWKfAWIls0o8XN4X7GMhOoK6Gj
	kyxceqHphjou8ywRidEekdbqqhMMWBFsQV3iXhvlhhKIvCx+C+xAc6OyC3pmpAEWZp4w
	O9SdaA0jlWiO0R3mCCyFnpgFiU6C5LPROYqfQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=W2XNJK7YNs9KdcKrEc+vmIfhglGJNGgGpQd0/53HFj3JlEUetkc9oc8H0EJ4nMaX8r
	AsjL5gX/IGeT7gbV1pshcmGzpSmfx8nQXjl5lIplMn/N+5vFX5J8eJVaD4h8rL4gua9b
	Npn+FitsNWVb7VhC+QN7pNqveyUgJ5yDy0RZs=
MIME-Version: 1.0
Received: by 10.239.180.148 with SMTP id i20mr285647hbg.10.1249749559817; Sat, 
	08 Aug 2009 09:39:19 -0700 (PDT)
In-Reply-To: <91283b620908080116w426680e0y93f2bf5303b66fc2@mail.gmail.com>
References: <91283b620908080011k650f76f2w297e40b333f9b4e3@mail.gmail.com>
	<19c1b8a90908080040l3f31ea26l1ce5eba7b98d968a@mail.gmail.com>
	<91283b620908080116w426680e0y93f2bf5303b66fc2@mail.gmail.com>
Date: Sat, 8 Aug 2009 18:39:19 +0200
Message-ID: <c384c5ea0908080939ia0cba57s57186f618f972951@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: lighttpd - compile but the install does not seem to be correct
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
X-List-Received-Date: Sat, 08 Aug 2009 16:55:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Sat, Aug 8, 2009 at 10:16 AM, Stuart Gray<stuart68@gmail.com> wrote:
> Thanks I 'll let you know how it goes.
>
> 2009/8/8 Khem Raj <raj.khem@gmail.com>
>> each module is emitted as a separate ipk lighttpd-module-*
>> you need to specify them in your image recipe.
>>

lighttpd can be extended with plugins.
The modules that are enabled in its configuration file must be brought
into the filesystem,
and vice versa, you must specifically enable the modules in the config file.

There is a big chance you must adapt the default OpenEmbedded recipe
to your liking.

This can be done using the "recipe overlay" approach using "bitbake
collections".

Good luck,
-- 
Leon


