Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC3D9C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 18:47:17 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.1988.1744742835231257172
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Apr 2025 11:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YPE8yfjs;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso3400747f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Apr 2025 11:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1744742834; x=1745347634; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5werSmTQHProWHld9/2nOditKr04tP4lbaTZpWIFDk=;
        b=YPE8yfjsqLVQOs5wxcVHdRUOPRyW1REZaj1ea7uZRkat45e40ka9YWejMGhR9kFt4S
         WH87i5JRufgfGcfSTbVwBg8KoS22bXw+M9hiKSpdeHmKALkuR6f8n80tGhPTI5P7xz3G
         G7WYtsK3M2LA7fUdVm7Sg3gTYWxjxf/L6AKmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742834; x=1745347634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5werSmTQHProWHld9/2nOditKr04tP4lbaTZpWIFDk=;
        b=N8wtwJ3pR8NC2z6K5tGxvEDo5IoIElk9lCdTVzO7PtPTkDkOn6I3pBAC4Ne98AiAnC
         EjzOhL6w08LuzqZrvFZV1+GLDQkVlvqNVyJrjVrxP9f9fBMJWg8EEYXV+/b2liKlqwNb
         TXauCzH4L1XLQtm7LCZB9uT9ULunGK1k9bibEmpVlVidxSk7Ok7o7/5nD3pXcha9oKhD
         5XcpL+Q6WPXjz62cWMUn8AD1YPUY80thgFToKZFzKt5Sn/ezJxRyWARBi43rIw12jC+L
         EgThwMYZaJI+blUnQSBBmx0nfmrVcmsQ8ZD3jTg+nni5aECeo3qaYzaZCR4gJAzi7BbU
         Utow==
X-Gm-Message-State: AOJu0YzywTkFnTX1jfSqPWdmLSiOcpVsU62q0OqF9LZwa4QluW6/1Ehw
	bydFhKtydvEF0lHhXOMMD4asGk1xoLrCBVrxFOAakMZi14VEOC0hFJf2MprjpyUlLJI6PJTOKG4
	M64MZPsyqAaU1Pg/hwhCfgYPH+kDEr8NHM7tZow==
X-Gm-Gg: ASbGncumurWEsJ7RH8ybezv9/UmLvYytPJh6hu/mTtvsbRw2+UCRZB+yjdSeB+cJmMx
	H+VN1Va+KgsqIzIBEjO3jSBpAROKorim8xxzJWaykK8ZOmPhjtXvAJI8l6yXBzaTM/ffB09UOtR
	2CeB9ogSQXhE4m+Om7kYFE3boO8a/TCdig419ZR18BYUfEBwFStwN+2ljTNIzczzSl5Q==
X-Google-Smtp-Source: AGHT+IF+n5KVjuOSiRlCY1eWCZSU9MN91JdlYVX9yv2oBcZjiJVEFuQJd5hOEN32YUPpJBSRMMu+J/8AwyzNCGma5Cg=
X-Received: by 2002:a05:6000:2586:b0:39a:ca40:7bfb with SMTP id
 ffacd0b85a97d-39ee276a1b6mr481986f8f.54.1744742833721; Tue, 15 Apr 2025
 11:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250415180540.1327811-1-schonm@gmail.com>
In-Reply-To: <20250415180540.1327811-1-schonm@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 15 Apr 2025 20:46:47 +0200
X-Gm-Features: ATxdqUG4jYsB_GLyUKvB51jiiajn478xK4lk4jsLuHz43AxXYEQ_SaaFFVKbqJc
Message-ID: <CAMSfU+5-75-+T0XVCwSfboGggYU3qOvBXoP8VxjjCynU-_PY4Q@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH] monkey: Update project website
To: schonm@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Apr 2025 18:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116868

Hello,

Le mar. 15 avr. 2025 =C3=A0 20:05, J. S. via lists.openembedded.org
<schonm=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
>
> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> ---
>  meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta-w=
ebserver/recipes-httpd/monkey/monkey_1.6.9.bb
> index a11af8129a..cdb6fb605c 100644
> --- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
> +++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Fast and Lightweight HTTP Server for Linux"
> -HOMEPAGE =3D "http://monkey-project.com"
> +HOMEPAGE =3D "https://github.com/monkey/monkey/issues/414"

I would put "HOMEPAGE =3D "https://github.com/monkey/monkey" (the main
github page, not the issue) citing the issue in the commit message.

Regards,

>  BUGTRACKER =3D "https://github.com/monkey/monkey/issues"
>
>  LICENSE =3D "Apache-2.0"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116865): https://lists.openembedded.org/g/openembedde=
d-devel/message/116865
> Mute This Topic: https://lists.openembedded.org/mt/112281725/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [y=
oann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Yoann Congal
Smile ECS

