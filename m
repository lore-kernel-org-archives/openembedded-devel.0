Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A773C433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 02:31:04 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.18424.1651285859755484475
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Apr 2022 19:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XOyx8V70;
 spf=pass (domain: gmail.com, ip: 209.85.222.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id f186so7201041qke.8
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Apr 2022 19:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hL+jsGTMcTGYsZ77k1SOhv/3knDknls7vbmlhmXnnYc=;
        b=XOyx8V70E5WRg+5i4DbG8xg3vEj1xOhfSLbXJ4z14GLMRFFuy6fCv5vANDY3q1zilo
         9iepbsdSJvNyO1NQuqc72dI/NCooe5hJ0jEO49PpYzB0wDCYl8qtbPLURlGxGfzEuLlt
         P1Nkf/RvjusOmJbXYxn6frpPM1cHFZDwWYfUWR6bL2U4p/vLRm3O/6WnrvqRBf5JNJnu
         bcHAsoXCB/CGgaPtoCw6eE0dxPCknsSBJetMDxDv8O+JixCoUIGDpipk9jEE0OYMWKGr
         4quI1FMEDBpaqHVEn3Ts0zDdB3ThjufK1nFsiahhFLoqLmCX650Au9Vwbt15RsR4TePi
         NPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hL+jsGTMcTGYsZ77k1SOhv/3knDknls7vbmlhmXnnYc=;
        b=vGxMhDvXTuU2sTXDf8zye7xyeUVTaOVKC8e7XBirGf6/V1NMHR+0ClszuZZwPqr5s3
         h3Jgq+ZDmVedTr4TwdAsOJbFpwIf1opcOSue4N4VdTv4CAbacw5Aq1V1bjOnG12hnDAD
         YtmSQK2dzHhfMb7E1OXeT0eIkUeCh5S/LtgVmqjyDjMZlvwno1aB/ZphyKkZ7/+QGq1C
         u9kRySG7G7aqpkvuqc/DsAXtvHX0L1ftPxT4pWOxEka9I2PLltVVsrSCp9YgzReDwwyn
         IQqJri7WQU9nfxjuxgovr0+unzNTE0wywkYMiTUZP1QsS3kqyaMQauLFkjdFaGE9/2RH
         YbZQ==
X-Gm-Message-State: AOAM531q/4mwMlGUd8F310ItxQ6/h9xNCXRlBZZZj4K0o6DZF8CTkCY+
	SMlD1SRxyIFZPyCEWiKeHnYOM17dh0wbAZjvjC0=
X-Google-Smtp-Source: 
 ABdhPJx8D0d3v3CFLSJ9ZH1iXZMqL/SNrkg+xzqCUJqagHWFgyi4A7WGVwkEPb+/wzPR/tHE3cUCfdRSgcJwe9L0EMo=
X-Received: by 2002:a05:620a:17ac:b0:69e:b8d5:3fd2 with SMTP id
 ay44-20020a05620a17ac00b0069eb8d53fd2mr1494833qkb.227.1651285858794; Fri, 29
 Apr 2022 19:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <2263ff4b-de14-730d-56fb-03da92a32a4b@gmail.com>
In-Reply-To: <2263ff4b-de14-730d-56fb-03da92a32a4b@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Apr 2022 19:30:32 -0700
Message-ID: 
 <CAMKF1so8QdBrM63-vXBn+JqPqMemMr909Ax78wGggz0Fkra71A@mail.gmail.com>
Subject: Re: dunfell merge request: April 29
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 02:31:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96862

merged thanks

On Fri, Apr 29, 2022 at 6:51 PM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit fdd1dfe6b4b2412cc536c26450ce126c960d8107:
>
>    mongodb: Pass OBJCOPY to scons so it does not use it from host
> (2022-04-18 07:37:42 -0700)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 8ff12bfffcf0840d5518788a53d88d708ad3aae0:
>
>    postgresql: Fix build on riscv (2022-04-19 10:15:37 -0700)
>
> ----------------------------------------------------------------
> Khem Raj (1):
>        postgresql: Fix build on riscv
>
>   meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch | 38
> +++++++++++++++++++++++++++++++++
>   meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb           |  1 +
>   2 files changed, 39 insertions(+)
>   create mode 100644
> meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch
>

