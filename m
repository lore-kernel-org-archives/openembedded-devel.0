Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810E3C43334
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 01:58:24 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web08.23493.1658714301043484509
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jul 2022 18:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WJhAZ9RP;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id q3so6637740qvp.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jul 2022 18:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I7eI6gERYw+ahR4ZZ2xPXSwonYPlDtjmWXgN4Vdcqtk=;
        b=WJhAZ9RP2Z41qfTGZF86A7Nc0JMTytX9QdfAlpOn2A+jSIpFCqfsxOkiL+rncdLmUd
         /KCR/8TlUEq1CjxhY4I8UZXBK6BPExS1iCwVBPxuSBpvrm5mpxbtz3Jh046YhewRn6wr
         MZu/KNjj3gCn3ZvShSIdiOnsXKUcS/JdFVAUNgMS/M2PpNEEEMMKLt+qv2BLxJT8B++n
         NdJ6ZCqZ7hqn03e3UbS3NjpYPxZC/9gqP1LPWGoi+HYKYrmXpkU1m1eVIsS1820I/3Sv
         F9kLz/C9fZlurJ6Zp/HJPctCPou2njP9LQnCIOxTmTm+g/DLew51rj5xMRFNqtNgHDOl
         2IjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I7eI6gERYw+ahR4ZZ2xPXSwonYPlDtjmWXgN4Vdcqtk=;
        b=u/c42FFEBOzrtVtJ9gTIUVZwaTA3dffsv5Mv5P+7RLxBowuCqO2iD/w2nqLC8r9C3m
         43WjWN0UyLAP8WUtS55GOU+nCGAGV/BS4P2X/0zKsLcA+v+AdhbnIUdSt/Ant6RdkXX/
         9Tlm7ZpdGRlUtd9vBv1nPjj+d3yDGRYEt/UWrvooTVvHH5IZ+hlu3KzWaqWXvKhcFJds
         bzwrInT/UXbll5XfrPXqIUwENTPPQvLy88cFttidRXM1A8RtjPzoDoYQhw7Z67nmLgFm
         Jt/PRlWlsG4k6nmH1k4qptUb86M1rwQCLhay5JWDFi2VLR+NwiS7Yc6oqmYwTuzvaRPJ
         VNzA==
X-Gm-Message-State: AJIora8rSxWRCECTFMm2T/HpcDtKqpy/BkN1vm3aNW8+DGv7QcjQ8k4d
	yV+c3oyB81BB5peSVNsqN8MFsWz9O0r5y9JPnMw=
X-Google-Smtp-Source: 
 AGRyM1u1oolI3Pu2S6S6dAq3zmLc+EnOe0FC01+m0Vavc9Zs4bK89oJhJYNiUb9LyK1tbLFvAPK6Et1exa0tyJb2F1o=
X-Received: by 2002:a0c:8c4c:0:b0:473:11d7:6d3d with SMTP id
 o12-20020a0c8c4c000000b0047311d76d3dmr8466502qvb.110.1658714299911; Sun, 24
 Jul 2022 18:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220724194800.189798-1-tvgamblin@gmail.com>
In-Reply-To: <20220724194800.189798-1-tvgamblin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Jul 2022 21:57:53 -0400
Message-ID: 
 <CAMKF1sr-VXXh=315dtjqzi7_DMzQZGjLfeaSwS0rq0onw_e2=g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] README: Remove maintainer info for
 tvgamblin
To: Trevor Gamblin <tvgamblin@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Jul 2022 01:58:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97965

On Sun, Jul 24, 2022 at 3:48 PM Trevor Gamblin <tvgamblin@gmail.com> wrote:
>
> Signed-off-by: Trevor Gamblin <tvgamblin@gmail.com>
> ---
>  meta-python/README | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-python/README b/meta-python/README
> index 8b62ad32b..01c51dc88 100644
> --- a/meta-python/README
> +++ b/meta-python/README
> @@ -44,4 +44,3 @@ Maintenance
>  Layer maintainers:
>          Tim "moto-timo" Orling <TicoTimo@gmail.com>
>          Derek Straka <derek@asterius.io>
> -        Trevor Gamblin <trevor.gamblin@windriver.com>

Thanks for your work on maintaining meta-python Trevor, really appreciate it

> --
> 2.37.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97964): https://lists.openembedded.org/g/openembedded-devel/message/97964
> Mute This Topic: https://lists.openembedded.org/mt/92591366/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

