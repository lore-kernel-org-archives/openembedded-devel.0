Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 85A986028A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 08:03:02 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id e16so2980329lan.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Aug 2014 01:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=zKG8GwsMKAQPVBBsnDhUQjP7qMivvIy0kLC7k89Cn3o=;
	b=sGIdhuzBHmq/dCeT43KTUBrLJn/IkRSG7aXug4Mn/rzAWM74qSZdvPbcd8cKDMZd7w
	wFUk2D+80nJNC4qxxxzsXxNxQZtbaHc20RCkm7VvvLOeSuIk+BFFQpSmfQIYIfVWceIo
	ip9XPuJiO6mpp6ZpHPrV8SzCiX8QzUjLaxO8z58Y4CSQqwwXcbz4TZV/rSe6/n6cmB6V
	gWKM+YE7FPTmeGOos0QrMEd0tWXhF5Gs2RHmpbeKWLrC9G7ESmUttg1c5n89vvcgTkGH
	oGGXiwZP6IC7qiqFUuwq9QMRWcG1S3rjjZTr7tDdX89/wL9/apXLYAyDu7lKZxVCy3Qc
	ta9A==
MIME-Version: 1.0
X-Received: by 10.112.161.72 with SMTP id xq8mr3474967lbb.18.1406880183481;
	Fri, 01 Aug 2014 01:03:03 -0700 (PDT)
Received: by 10.112.207.9 with HTTP; Fri, 1 Aug 2014 01:03:03 -0700 (PDT)
In-Reply-To: <53DAC99F.6070701@mlbassoc.com>
References: <1406846802-1311-1-git-send-email-andrea.adami@gmail.com>
	<53DAC99F.6070701@mlbassoc.com>
Date: Fri, 1 Aug 2014 10:03:03 +0200
Message-ID: <CAAQYJAv97nF8AX9CKT5at+82gen1NhZnQ3tc5yJrz4ng=ypgYA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH] kexecboot: remove trailing slash in do_install
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Aug 2014 08:03:03 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 1, 2014 at 12:56 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2014-07-31 16:46, Andrea Adami wrote:
>>
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ---
>>   meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
>> b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
>> index d0176c5..1fb5f0d 100644
>> --- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
>> +++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
>> @@ -48,7 +48,7 @@ EXTRA_OECONF = "--enable-delay=2
>> --enable-evdev-rate=1000,250"
>>
>>   do_install () {
>>       install -d ${D}${bindir}
>> -    install -m 0755 kexecboot ${D}${bindir}/
>> +    install -m 0755 kexecboot ${D}${bindir}
>>       install -d ${D}/proc
>>       install -d ${D}/mnt
>>       install -d ${D}/dev
>>
>
> What is the reason for this change.  Using XXX/ is quite common
> in OE recipes.
>

Hi Gary,

thanks for reviewing, I recently spotted this slash and imho is just
one extra unnecessary char.

About the 'best practice' here, the POSIX synopsis seems not
describing an ending slash for <target>
http://pubs.opengroup.org/onlinepubs/9699919799/utilities/cp.html

Cheers

Andrea


> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

