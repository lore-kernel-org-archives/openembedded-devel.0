Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8F92A61681
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 16:41:26 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id n17so6980594qtv.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 08:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XzZ8hidbRqUjThuWsBlOAYHNYeOVZAlS2pmHVV3Ar9k=;
	b=vLTzE/7Jxb3yxPXJQS4UyqU5EjMfDSs9otI7LP1qglg5xD/Vogh3Rupc54RnYLI0cu
	Zm+VLHoBlzSaB3E4tz6uC/i0Udt/UnAJapolAQ6Qur7YR0bzWxZFEQrgpxYj1FRpLDpF
	czKavseHg39FdYa6KYjpvw4oExu/odvTv/hCKv5CbJXQaLP/KP7K+QuuDCInZulC3FIF
	RRvKkj2kmAuNAoU5+s58aCFsMaMW6SzeWstOCZx9iPssJe5HmmZO7k5BuZ7A3osdivCO
	fDo+v2z2gAL0YkVruSzY6X5KtDksmBWlbZtkBSLhfRfQyLOiLvbEJ3j+0dqG1tk+FU+9
	MQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XzZ8hidbRqUjThuWsBlOAYHNYeOVZAlS2pmHVV3Ar9k=;
	b=MgZf/Pxbqvo6UuDqxa/Uevo83+xKV1JRVzTJ8GQXkVoLk+Gjct9Dnmxgxj7a/DcQ+C
	p4lbf72BFW3kS3nLZQwBx3vMf1gKyUl3C59X5g+FyiD6cmRcL+fmZe/sGMlgm0nQb/Qo
	PtEkFozGBOHZhejXue3/VFH3nVJSqdBfxmqsrn3iTQRl+hyJL28Bt3DQZFzDjeN2hnOr
	Nb8bwexnipOOAO5aoo2czh9t+r+pyf+5EmaBuF9EYSeAfx42L9jtBHoRle1PI0S4JzXm
	S3oClfJojkf/A6YOdxqdT4jTkSHsSCjDVRcSdMaVLLSNn4SJIlKJNKPhPvKULygXjb6r
	cWdA==
X-Gm-Message-State: APjAAAW0nI1dCjM1H4hwaYVbh6dE8Ujwyj1X8hQuqY4OAB9Mka9AOHJV
	pjsgFN5P3rxY1jmPBisSfNLCXlqlUuKi4ywqGAk=
X-Google-Smtp-Source: APXvYqxwP3WhGl8TZzQOLjh/9+K6bys8ZFTKqmJXZvvGJVCFV0fjMpjcmawGHn7R7/l4b6PID7RsGL5NVuZI/ZBT0UE=
X-Received: by 2002:ac8:3fd7:: with SMTP id v23mr48883754qtk.293.1582562485965;
	Mon, 24 Feb 2020 08:41:25 -0800 (PST)
MIME-Version: 1.0
References: <1582544446-241334-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1582544446-241334-1-git-send-email-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Feb 2020 08:40:59 -0800
Message-ID: <CAMKF1so3CU_NMnOKGmUJsrgaUsAF+SKM5XeFQAoX4NrFzRv07w@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCH] nginx.service: sleep 0.1 after nginx start
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
X-List-Received-Date: Mon, 24 Feb 2020 16:41:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 24, 2020 at 3:41 AM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Fix error info:
> nginx.service: failed to parse pid from file /run/nginx/nginx.pid:
> invalid argument
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-webserver/recipes-httpd/nginx/files/nginx.service | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service b/meta-webserver/recipes-httpd/nginx/files/nginx.service
> index 9a6ca96..65c7752 100644
> --- a/meta-webserver/recipes-httpd/nginx/files/nginx.service
> +++ b/meta-webserver/recipes-httpd/nginx/files/nginx.service
> @@ -7,6 +7,7 @@ Type=forking
>  PIDFile=/run/nginx/nginx.pid
>  ExecStartPre=@SBINDIR@/nginx -t
>  ExecStart=@SBINDIR@/nginx
> +ExecStartPost=/bin/sleep 0.1

I dont thiink we should be adding sleeps instead try to lock the dependencies
so it happens correctly. or perhaps change the logic in code itself if
dependencies
can not handle it.

>  ExecReload=@SBINDIR@/nginx -s reload
>  ExecStop=@BASE_BINDIR@/kill -s QUIT $MAINPID
>  PrivateTmp=true
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

