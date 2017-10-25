Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id C1B8B60938
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 02:55:55 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id n14so21142571pfh.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 19:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JMGHdSGQLS6SDCycx8DWGzmnfLWMiD2ALdOCv47P+/8=;
	b=iWgtfKZU0f7wyPCSzwQbF096hTTsADOp8LupZ+murXGG4BbUVKqK64NyqeoPh4TKI3
	akTE7eRiObqEiA9A2XPpMmoNNN/a1J2Ka/ihcE16wyp5CnMFUK1ZwjlLnb7xMEp9C4Ti
	DFpQE+HVGPKEwy36WL9XHDACfU53CKAFrQMpRKA1QIlKV7E1ozQRsmPxg8pei91WhQj9
	JFnXLm4KYHePmfzJnHCR+P/Ebq6Y8meYJ+RB552CvsGrUVtnULG53JsDwqzIrqWbsvTB
	N8g294f0nlwwtYIpyDzWCT6P6gaxzNy6jG8wNfXqxMoBg8OGYFZQbfq4ZiEpLL0L3+vl
	1MaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JMGHdSGQLS6SDCycx8DWGzmnfLWMiD2ALdOCv47P+/8=;
	b=RFiTHViKYrqKFDwHVP2qMDblhe+Oz3fGDwDuF7QK02tronNwoc5AzRZDdAXjtpUcgg
	NTY3itX7y2Y4A2u1vhuBqsIcG7nDIQJYzIsw5e7gpEZkleRXK/1cjTx3OyTIXVJr75XN
	xmaHMRT7zxU7MEwaxmifPEzX0cMAWDvEoqBtmQReFAJo5ciqd9VCLnFpaHIEAd7Bbg66
	sY1woIdHGHnQSkyEzK8XSFtBfLzcgD2CBAuxlkUNM2E9SOImA07SSQtsrN6dund8UoMA
	26SOsmH+lDGZHJrZrTSBbbcgidq9ceHh01e12UEjGyPbIHMvUAG5tviUB+dZxFrTWccb
	4PPw==
X-Gm-Message-State: AMCzsaWEPUSmq4KjWpYcvr7jZKtIyZIoszsT2pcprKGnRa4jXt9gh1/N
	vHrjcmMZxgniERz8rEBmDcwAMmxcFy+OkgJaxec=
X-Google-Smtp-Source: ABhQp+SU/GBsRC2bq4fekvNaz4alFJFp5ve2ikWypmtoQFdYql0O2VwdxIgOCSKejvQjQJBl/5H8k9ydjh5hm5Q0o0o=
X-Received: by 10.84.177.36 with SMTP id w33mr312159plb.215.1508900156556;
	Tue, 24 Oct 2017 19:55:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Tue, 24 Oct 2017 19:55:26 -0700 (PDT)
In-Reply-To: <CABR-LLfXBspMaoGXaJnT2iE=zAdyfMWE=zctbzarzfJbXFS1kg@mail.gmail.com>
References: <CABR-LLfMQQQvADAH6Z__-L+Pw0BEGnwn+-_E_C36XUwV+X9_8A@mail.gmail.com>
	<CAMKF1soLSiKO1kxSr0nt8HkYjzn_PpJdLmfRRWp6U6szML-YnA@mail.gmail.com>
	<CABR-LLfXBspMaoGXaJnT2iE=zAdyfMWE=zctbzarzfJbXFS1kg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Oct 2017 19:55:26 -0700
Message-ID: <CAMKF1spgp2wy04B+7YXN047HUBJaD9G1JyEV8L_9RN2K6iXNvQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 25 Oct 2017 02:55:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 24, 2017 at 6:47 PM, Wangchong Zhou <fffonion@gmail.com> wrote:
> Thanks! This should work.
>
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

I was looking for something like

 --with-off-t=${@bb.utils.contains('DISTRO_FEATURES','largefile','8','${PTRSIZE}',d)};

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
>>
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
>> >
>> > --with-off-t=${@bb.utils.contains('DISTRO_FEATURES','largefile','8','4',d)};
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
>> > wrote:
>> >>
>> >> Hi,
>> >> The nginx receipt hardcoded size of off_t to be same as ptrsize, which
>> > can break large files support on 32bit machines. The http range header
>> > will
>> > fail with a code 416 on files bigger than 2G. Changing it to 8 will fix
>> > the
>> > problem.
>> >>
>> >> I don't think hardcode off_t to 8 is a neat way of fixing this. Is
>> >> there
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
>
>
>
>
> --
> Regards
> fffonion (B607 2745 84E8 D5E5)

