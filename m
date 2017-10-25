Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2D75E71A8E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 00:32:21 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a8so20919509pfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 17:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t1AClfZC/BszesRSvXnFcxrhR1+U9tQFBXLnATddKkk=;
	b=mkZBy4I6T5hM/MaZwDzJCiK2lnPLf/yVMbUxhyysR7FrehKB1r9ZNlnNyEWRkW7yyM
	nI/gtojkB4790xKuBsFKokvrU2P4ImGR0oTpx1fe44gjVl7dmLDBMNcaBeAbieZiPumS
	fFREEjyCRt+rjQXHAGXPEq26AOFBBjX/J9CSXnC02g4zcQCIaxVRST7/sNmSwihS7u+I
	0MryqOtndKAJJjOXKLK8C7fowx/ecMRJUciUYEavpVmBnw5+PrPfdZVhHgAJKgmE/IGM
	4yorYmmQmLHkPhJenFjei/yh4jkrx3Mh39lTaQHR1SoUZ50IyNWXUrdr9heMqW8+OuF8
	qPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t1AClfZC/BszesRSvXnFcxrhR1+U9tQFBXLnATddKkk=;
	b=J6dVyB/Z8AfCjhmvzuU9pCxpdvz66jA+hCwLUvooUUIFflqXnQ2tx9KkrKkqQXxgra
	oggO+zuQ68VcYEhbrt5pcnNLC+QOP2bO8d4JiLuM+Cdo+1QTwhO6/TWCG8evp0+54z2l
	yzk+12TpvrmOfRfylYIugNAniD8U55qb0MwiYafYB2ckclf+7irv/hfvY6pcvwY9/S9p
	DXFCMptV53SYoXpZ/vNRPpBDT/JXfKUmUL9vy9oRdGakfLHAGgVRihvEyPG6XjAxofEj
	DNBbOQapkxFvQPalbg8+FDDFuUdwQMaGdV6XeInzalgGqhdwJYATkDu7VAwm4Ofgj1mQ
	qlRQ==
X-Gm-Message-State: AMCzsaVGkmGrz2FQgH6YH3cU/F84WU1JbFvUt1Qm1C8fw4cg9SjgUKg9
	oLDP4nhKwXh0mPjHcWIe2mSir0aOAoZ3wbeCrcs=
X-Google-Smtp-Source: ABhQp+QLAWlU/ZwMjA7Nvrs/FUdh8m/poIj/ThDzmwclbEirWOd08l4GdhMaNWjEfxLVcfh6mLx2pYflC4tu9+Bi/P4=
X-Received: by 10.98.102.132 with SMTP id s4mr426638pfj.168.1508891543002;
	Tue, 24 Oct 2017 17:32:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Tue, 24 Oct 2017 17:31:52 -0700 (PDT)
In-Reply-To: <CABR-LLfMQQQvADAH6Z__-L+Pw0BEGnwn+-_E_C36XUwV+X9_8A@mail.gmail.com>
References: <CABR-LLfMQQQvADAH6Z__-L+Pw0BEGnwn+-_E_C36XUwV+X9_8A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Oct 2017 17:31:52 -0700
Message-ID: <CAMKF1soLSiKO1kxSr0nt8HkYjzn_PpJdLmfRRWp6U6szML-YnA@mail.gmail.com>
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
X-List-Received-Date: Wed, 25 Oct 2017 00:32:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 24, 2017 at 3:27 PM, Wangchong Zhou <fffonion@gmail.com> wrote:
> Resend a patch using largefile DISTRO_FEATURES.
>
>
> Signed-off-by: Wangchong Zhou <fffonion@gmail.com>
> ---
>  meta-webserver/recipes-httpd/nginx/nginx.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
> b/meta-webserver/recipes-httpd/nginx/nginx.inc
> index 4a97e2670..84ce0fb4d 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> @@ -57,7 +57,7 @@ do_configure () {
>      --with-ptr-size=${PTRSIZE} \
>      --with-sig-atomic-t=${PTRSIZE} \
>      --with-size-t=${PTRSIZE} \
> -    --with-off-t=${PTRSIZE} \
> +
>  --with-off-t=${@bb.utils.contains('DISTRO_FEATURES','largefile','8','4',d)};
> \

Could you still keep using PTRSIZE in else case above ?

>      --with-time-t=${PTRSIZE} \
>      --with-sys-nerr=132 \
>      --conf-path=${sysconfdir}/nginx/nginx.conf \
> --
> 2.13.5
>
> On Tue, Oct 24, 2017 at 2:28 PM, Wangchong Zhou <fffonion@gmail.com> wrote:
>>
>> Hi,
>> The nginx receipt hardcoded size of off_t to be same as ptrsize, which
> can break large files support on 32bit machines. The http range header will
> fail with a code 416 on files bigger than 2G. Changing it to 8 will fix the
> problem.
>>
>> I don't think hardcode off_t to 8 is a neat way of fixing this. Is there
> a better way to detect large files support?
>>
>>
>> Author: Wangchong Zhou <fffonion@gmail.com>
>> Date:   Tue Oct 24 14:21:35 2017 -0400
>>
>>     fix large files support in nginx by setting off_t to 8 bytes
>>
>>     Signed-off-by: Wangchong Zhou <fffonion@gmail.com>
>>
>> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
> b/meta-webserver/recipes-httpd/nginx/nginx.inc
>> index 4a97e2670..4cdf892c7 100644
>> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
>> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
>> @@ -57,7 +57,7 @@ do_configure () {
>>      --with-ptr-size=${PTRSIZE} \
>>      --with-sig-atomic-t=${PTRSIZE} \
>>      --with-size-t=${PTRSIZE} \
>> -    --with-off-t=${PTRSIZE} \
>> +    --with-off-t=8 \
>>      --with-time-t=${PTRSIZE} \
>>      --with-sys-nerr=132 \
>>      --conf-path=${sysconfdir}/nginx/nginx.conf \
>>
>>
>
>
>
> --
> Regards
> fffonion (B607 2745 84E8 D5E5)
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

