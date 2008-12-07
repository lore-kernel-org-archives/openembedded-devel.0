Received: from [209.85.128.188] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1L9Pmn-0005go-2j
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Dec 2008 20:59:25 +0100
Received: by fk-out-0910.google.com with SMTP id 19so959284fkr.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Dec 2008 11:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=ilm0Wne91KuRoZq10buCE1uZRHaP8hHoA4Azh7ghuCU=;
	b=mcr0L1pEGHIiHI8G+W8Jlp/M11524DJiY2mLsM2dEod5MNRLpvyWnRLzBoo7T6xtYX
	xwOeZJZIf2jmL7Dz95wXB1V3W2kN7wjLYxQqpH9V8tgkv6JhusyXdyPiuAJSlF2DZQVj
	Q00sIrSpLYqDrsxnzN/fcIc5y+u07yRXds9XI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=b+sgyYth50lnONHVbmtwETmuGE/qttVlmlCW3k6gLTeqeJ2lGgZj3lD4/z6pTEHDHK
	0bvtbgcQfdn9eFfSu7xUDIe5d4PpCu+LCSVhUsd1pN3tBrSdj4CiT146qjvzcMp3EM1h
	BAeKwlplcGSKRELmrqIvevmIRZJ1QbyvWtnhQ=
Received: by 10.223.103.145 with SMTP id k17mr1163907fao.1.1228679736637;
	Sun, 07 Dec 2008 11:55:36 -0800 (PST)
Received: by 10.223.115.200 with HTTP; Sun, 7 Dec 2008 11:55:36 -0800 (PST)
Message-ID: <c384c5ea0812071155k45880240heba43426d39a2ff6@mail.gmail.com>
Date: Sun, 7 Dec 2008 20:55:36 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d1b08f940812070258l25a1b54cg91b2b00a5fbafcaf@mail.gmail.com>
MIME-Version: 1.0
References: <c384c5ea0812061551j27c4e7eagb10e01f64d9e8668@mail.gmail.com>
	<d1b08f940812070258l25a1b54cg91b2b00a5fbafcaf@mail.gmail.com>
Subject: Re: BUG? Some files in the build end up without read permission (mostly in .pc/)
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
X-List-Received-Date: Sun, 07 Dec 2008 19:59:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Sun, Dec 7, 2008 at 11:58 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
>
> yes, I noticed this trying to copy the whole tmp/angstrom dir.
>
> permission denied   /input/keyboard/sharpsl_rc.c
> ...input/touchscreen/tsc2101_ts.c
> .../arm/mach-pxa/poodle_pm.c
> ...asm-arm/arch-pxa/hx2750.h
>
> The whole list here:
>
> http://www.pastebin.ca/1278657
>
> I suspect this in not intended...
>
Thanks for the confirmation.

I have no idea where the missing permissions are created, but I
strongly suspect a missing third argument to open(path, ...O_CREAT
..., );
which typically gives these results.


Anyone: is this quilt who writes these files there?

Regards,
-- 
Leon


