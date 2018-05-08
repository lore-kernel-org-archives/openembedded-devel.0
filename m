Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3D76B74ED2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 May 2018 21:40:39 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id f3so21674762uan.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 May 2018 14:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mJypszB99FVggIrdtYdZzCZI1anSiNKCxorQOoRe5eI=;
	b=TJeflh7Y1gMPlkvFkKU3PgUKf5lQhbLvx9ep/9Y0OWr1qQDCF3nRyr1257gI3sPXg2
	zq+yYUhJN7r/zb6mAyGVovEMIuVVJr78M3Kks6mNto32nBhuwXABpkvRNIZmZcA1yT75
	+sJinq7uGXGFuKdDxUA07px/v/kYeG14yo1UrYcN2RGhA9RDluN/wbjaPdQGhClfEvIr
	YX4qOGBiYtgEJCIbypyN1DQySyCZ7z/q5LM/LSOa5RaTL/tmHkxyGbHbfPJC0S0K44Bn
	V2IiAXqvbW40ZjLGM8LAfXeNwtCvjBxhS2b2UEZAMWPl1HWyAn9W7+wgwQz9lzf/QivN
	weXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mJypszB99FVggIrdtYdZzCZI1anSiNKCxorQOoRe5eI=;
	b=XIFiD/S+HAymu8VvTRUZiIutTy0PU4g8A2pcDZ4jfWPLMyL7pHTJuhU34AXWyCB6f0
	3phklaxNjf+W7TNH0hk8HwEOrt4EkO7os+GAxgvYG5/FyTkgnoGXyl+H6stS/VR5oxmJ
	u4SmVs2HzfgN04dn6LUneKfnVrLHd0O0dbGgUAJ1ZtFq55wTsks4g6x9yeMRxXDnTfAY
	vPMqsW8LJ6jPrs0tYmjVmPT+ShyJpMy0ssZQ6w7nljytrvMTA7fzhTKdNM+qvrOjdJCx
	FdRCTOOcKkv+kJ8bvI7szs34wYHUSuXz3HJz5barj3stnTuS7hTxmCPO5DSgi2b//eJP
	g+rw==
X-Gm-Message-State: ALQs6tDU48N4jNjG2KWgx538532JJnRZ2jd/HcEMuwN2qToGY1oGbA1y
	K/jmlyj+TiEcWPU2A9uOVqbRDJryXK5MiZHun4M=
X-Google-Smtp-Source: AB8JxZqlbmHfmm3AZYnNJS7Tafm0wh3/lETiB3gSMLrBtr5BVy/j3G/w00Rso212/dQvvpweaYL6ot1EVr/lcCT12B0=
X-Received: by 10.176.21.103 with SMTP id p36mr36296299uae.81.1525815640817;
	Tue, 08 May 2018 14:40:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.148 with HTTP; Tue, 8 May 2018 14:40:40 -0700 (PDT)
In-Reply-To: <CAAQYJAsPMCY8q3yJq9uPwRgT+b3Feop8E8xXtV955j9RZqm96g@mail.gmail.com>
References: <1525475357-8521-1-git-send-email-armccurdy@gmail.com>
	<CAAQYJAsPMCY8q3yJq9uPwRgT+b3Feop8E8xXtV955j9RZqm96g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 8 May 2018 14:40:40 -0700
Message-ID: <CAJ86T=VOTqTriX0-Jgng9tCdn4FX0qG1kKCbyd8eX2PW0oV5+g@mail.gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] openobex: explicitly set ASNEEDED from openobex recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 May 2018 21:40:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 8, 2018 at 2:24 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> On Sat, May 5, 2018 at 1:09 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Up to now, an openobex specific over-ride for ASNEEDED has been
>> provided by oe-core (from as-needed.inc). If ASNEEDED does need to be
>> over-ridden in order to build openobex it's not ideal that the
>> over-ride comes from a different layer so define it directly in the
>> meta-oe recipe.
>>
> Hi,
>
> don't we have a special include for this purpose?
>  /meta/conf/distro/include/as-needed.inc
> What want we do? ASNEEDED in the recipe or include the as_needed.inc?

We want to move the ASNEEDED over-ride from as_needed.inc into the
recipe. For a short time during the transition the over-ride will be
applied from both places.

> For me, patch is ok, all in the recipe (there are just few cases).
>
> Cheers
> Andrea
>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
>> index 2db48f3..1b56685 100644
>> --- a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
>> +++ b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
>> @@ -25,6 +25,8 @@ EXTRA_OECMAKE += "-DBUILD_DOCUMENTATION=OFF"
>>
>>  #--enable-apps --enable-syslog
>>
>> +ASNEEDED = ""
>> +
>>  do_install_append () {
>>      rmdir ${D}${bindir}
>>  }
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

