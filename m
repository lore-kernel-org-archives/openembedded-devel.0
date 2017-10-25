Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C6497719B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 03:01:20 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u138so19024723wmu.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 20:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0nVzTB8LzpEXMW2IMaUVTWUoS/Kf3JtQp9mvOSEMkHk=;
	b=Gkr/Nh5eOwIGH5GNSBorqpAKJiOOoTV8S+q6THYiQOgwJiOB/UURoRmApubGpn/rJd
	kLEEfBEQFuW/3/MwgEw7i3n8q+Z/NTeBOGBsDSxSQb/FP1BiISUu9BPbRqrhnUANiRee
	j+PADLISRk1Sa6beCoBX8fB7/hv9Ia1Arh6VxvcPNGlYGImBDsQFuSCSh/OcTtfSWAGB
	20K0PGtO/J+07wD0VQSf1roPC0CLBZG+4wbCvihcDH9boXf8NiaxQMY89byFkHGhJUNO
	iwDqZjNzWVwMf68bXaA7IZXPyegYkR+8VMyceoX7F7xh5MRy9M1Zi9VRp0BS7y2pA8r0
	3EOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0nVzTB8LzpEXMW2IMaUVTWUoS/Kf3JtQp9mvOSEMkHk=;
	b=WOwaH8NHy7MwCz+xRHO3gTwQrlT++38A6vynAnshKEbU4o/32dT6+laauv0ySZt/4c
	diLQzrdC/dZeMYD4JNVMk8/xb4VjEkPRWQ8fni6CERRcWqQB3JMYJQcMmxq9JoUYkjOI
	PuwmflFTdAZwkClHFmCVclZWs+cM8LZjTOBeHQuR3ogA4E47XQ/6Ss9aMo7ZBTgmyLmp
	Pv52NJohcMgh9A3exNJAoPq9oPEukM7GEiRUoFHkGqKamrrZ5Y7if11IOsHVYy4lklWW
	Q0jsx4vxX4+1gwoyLV9GXSgzeSfFNgurRq5rYsF5IkrK+bQ3PfiPemJf7Og71vtoQ8wz
	tnlg==
X-Gm-Message-State: AMCzsaVuGei7ipKACIS1Chbe8G9nXn36YX/K/Mt8qf1CP6/f5zJkAX3m
	gYlnTy9jlwfk7u8zxmrlY+dqvRqrvo8ZhwC7O13IRA==
X-Google-Smtp-Source: ABhQp+QPD+QydRKrcjTs8s8Q3EyPRtEF+bNoL26BQT/NLC5ppMfsfEvNmI8uWTdqW0i7Q/5A+8pQnwvjet63UpNfEdc=
X-Received: by 10.28.54.89 with SMTP id d86mr185451wma.101.1508900481287; Tue,
	24 Oct 2017 20:01:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Tue, 24 Oct 2017 20:01:20 -0700 (PDT)
In-Reply-To: <CABR-LLfXBspMaoGXaJnT2iE=zAdyfMWE=zctbzarzfJbXFS1kg@mail.gmail.com>
References: <CABR-LLfMQQQvADAH6Z__-L+Pw0BEGnwn+-_E_C36XUwV+X9_8A@mail.gmail.com>
	<CAMKF1soLSiKO1kxSr0nt8HkYjzn_PpJdLmfRRWp6U6szML-YnA@mail.gmail.com>
	<CABR-LLfXBspMaoGXaJnT2iE=zAdyfMWE=zctbzarzfJbXFS1kg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 24 Oct 2017 20:01:20 -0700
Message-ID: <CAJ86T=U9L2-+xZ_1_8u3NJjHsWgh=Xhs4wGun06AizHyPThMuw@mail.gmail.com>
To: Wangchong Zhou <fffonion@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver] [PATCH] fix nginx with large files support
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
X-List-Received-Date: Wed, 25 Oct 2017 03:01:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 24, 2017 at 6:47 PM, Wangchong Zhou <fffonion@gmail.com> wrote:
> Thanks! This should work.

Note that disabling the largefile distro feature isn't supported in
oe-core any more (the conditional tests have been removed, so all
recipes in oe-core build with LFS enabled even if you disable the
largefile distro feature).

  http://git.openembedded.org/openembedded-core/commit/?id=a75ccaea77c8aad8d46e87e8ed4af2e2e0ad5327

It's perhaps not the right approach to be adding new conditional tests
now in meta-oe.

> Signed-off-by: Wangchong Zhou <fffonion@gmail.com>
> ---
>  meta-webserver/recipes-httpd/nginx/nginx.inc | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
> b/meta-webserver/recipes-httpd/nginx/nginx.inc
> index 4a97e2670..00ce132b3 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> @@ -41,6 +41,12 @@ do_configure () {
>      else
>          PTRSIZE=4
>      fi
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'true',
> 'false', d)}; then
> +        OFFTSIZE=8
> +    else
> +        OFFTSIZE=${PTRSIZE}
> +    fi
> +
>
>      echo $CFLAGS
>      echo $LDFLAGS
> @@ -57,7 +63,7 @@ do_configure () {
>      --with-ptr-size=${PTRSIZE} \
>      --with-sig-atomic-t=${PTRSIZE} \
>      --with-size-t=${PTRSIZE} \
> -    --with-off-t=${PTRSIZE} \
> +    --with-off-t=${OFFTSIZE} \
>      --with-time-t=${PTRSIZE} \
>      --with-sys-nerr=132 \
>      --conf-path=${sysconfdir}/nginx/nginx.conf \
> --
> 2.13.5
>
> On Tue, Oct 24, 2017 at 8:31 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Tue, Oct 24, 2017 at 3:27 PM, Wangchong Zhou <fffonion@gmail.com>
>> wrote:
>> > Resend a patch using largefile DISTRO_FEATURES.
>> >
>> >
>> > Signed-off-by: Wangchong Zhou <fffonion@gmail.com>
>> > ---
>> >  meta-webserver/recipes-httpd/nginx/nginx.inc | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
>> > b/meta-webserver/recipes-httpd/nginx/nginx.inc
>> > index 4a97e2670..84ce0fb4d 100644
>> > --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
>> > +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
>> > @@ -57,7 +57,7 @@ do_configure () {
>> >      --with-ptr-size=${PTRSIZE} \
>> >      --with-sig-atomic-t=${PTRSIZE} \
>> >      --with-size-t=${PTRSIZE} \
>> > -    --with-off-t=${PTRSIZE} \
>> > +
>> >  --with-off-t=${@bb.utils.contains('DISTRO_FEATURES','
>> largefile','8','4',d)};
>> > \
>>
>> Could you still keep using PTRSIZE in else case above ?
>>
>> >      --with-time-t=${PTRSIZE} \
>> >      --with-sys-nerr=132 \
>> >      --conf-path=${sysconfdir}/nginx/nginx.conf \
>> > --
>> > 2.13.5
>> >
>> > On Tue, Oct 24, 2017 at 2:28 PM, Wangchong Zhou <fffonion@gmail.com>
>> wrote:
>> >>
>> >> Hi,
>> >> The nginx receipt hardcoded size of off_t to be same as ptrsize, which
>> > can break large files support on 32bit machines. The http range header
>> will
>> > fail with a code 416 on files bigger than 2G. Changing it to 8 will fix
>> the
>> > problem.
>> >>
>> >> I don't think hardcode off_t to 8 is a neat way of fixing this. Is there
>> > a better way to detect large files support?
>> >>
>> >>
>> >> Author: Wangchong Zhou <fffonion@gmail.com>
>> >> Date:   Tue Oct 24 14:21:35 2017 -0400
>> >>
>> >>     fix large files support in nginx by setting off_t to 8 bytes
>> >>
>> >>     Signed-off-by: Wangchong Zhou <fffonion@gmail.com>
>> >>
>> >> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
>> > b/meta-webserver/recipes-httpd/nginx/nginx.inc
>> >> index 4a97e2670..4cdf892c7 100644
>> >> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
>> >> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
>> >> @@ -57,7 +57,7 @@ do_configure () {
>> >>      --with-ptr-size=${PTRSIZE} \
>> >>      --with-sig-atomic-t=${PTRSIZE} \
>> >>      --with-size-t=${PTRSIZE} \
>> >> -    --with-off-t=${PTRSIZE} \
>> >> +    --with-off-t=8 \
>> >>      --with-time-t=${PTRSIZE} \
>> >>      --with-sys-nerr=132 \
>> >>      --conf-path=${sysconfdir}/nginx/nginx.conf \
>> >>
>> >>
>> >
>> >
>> >
>> > --
>> > Regards
>> > fffonion (B607 2745 84E8 D5E5)
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>
>
> --
> Regards
> fffonion (B607 2745 84E8 D5E5 <https://yooooo.us/gpg.txt>)
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

