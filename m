Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6494C77B73
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 07:28:59 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.3595.1681457333168589384
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Apr 2023 00:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=GwqUyrSD;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-187878a90e6so7023904fac.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 00:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681457332; x=1684049332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6zH+ZLOWQnHf5ag8nBTScA+LYgUiVgV7k0MXGbrQL8=;
        b=GwqUyrSDW6A0M5fxowacGCzkDSGTJrYOUB+f4wNEAAZYZMNJ56HcSVkR/lns52KnNF
         NNwI7axeKmiZ2TMyCs7htuLoBLzfbMeLocMzZLGSLwB+F0WtVAwHD0zybKZKO622j54l
         IJxnNr/RfQu9mUbvJs+dru836/n3+rkOtbD82RVNmZMnFyeYyZ08MHljpqMC7sE9WnSD
         jQJOj7WM9DJsKCzIPj6tME/uesEUXlI7QozbXLwC+6vyMXOPTXus7Pj7QRPP9e5pD5Vo
         756cp4AtUI+/PWhISj9Whea52MXyTjyFtHJXyHCmbI+p5F3Ev/qH52mhqMIlqUvxuKMX
         9QXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681457332; x=1684049332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6zH+ZLOWQnHf5ag8nBTScA+LYgUiVgV7k0MXGbrQL8=;
        b=lDkFTScHgLemsS3aLrCy4czj1FXvsoeCpfpcqvXFnN7mFNn4Q/zGvNvGQi0C9Yw832
         jM7a3dPVVg5WebL+wzkaXh4bvhb9zOKpWSkakm2RNJ0MWC+Xd1DVvpzff58rOyvHFblg
         /mUxQkdcMa+P701rs2Ip1r/Cv80i7le1uDoqEMobOeyf6DBmIr8r9PKAHFxhjQVixXKs
         4YzOB6hHDzeYqQ3KgW7nBRL8y809suyjKeoNBqy/mgUBTOf9H3b9vAZDfnrAE78BWeIG
         Hjx+ZM+W6ChWkK8aDWlgl9h//q7qjfpetk6PVmziPcsbGrvEImMHjWw5mjVFefotMcpK
         7q3Q==
X-Gm-Message-State: AAQBX9eJTaTk25RF3TZQwmZCf/W+JXSGhPdjtsBZSTS71sItXlKgZdiX
	iTX45lRnFGt7t3kel2GwVf02jNYEl4K8oQR3w4A=
X-Google-Smtp-Source: AKy350YYny6TscbXS8Nh8XHWXfDZU9qcOgoV3Z/9UdBJk7Hs8DZ2qvmFnBLTWGZqEWaNP4YwYSij4IOEtbvBKNQuoGo=
X-Received: by 2002:a05:6870:9708:b0:183:fc80:7361 with SMTP id
 n8-20020a056870970800b00183fc807361mr2582450oaq.4.1681457332351; Fri, 14 Apr
 2023 00:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230411131518.401912-1-brgl@bgdev.pl> <20230411131518.401912-4-brgl@bgdev.pl>
 <CAMKF1spb_w1q6dy2GApO=UyoGm67jnuOfPG55dKbh78Dk6cPCg@mail.gmail.com> <CAMRc=Md6AsrBea7NE6odvAxG0bJ7j4Nm3+k48Xij-KPwO=Ps6w@mail.gmail.com>
In-Reply-To: <CAMRc=Md6AsrBea7NE6odvAxG0bJ7j4Nm3+k48Xij-KPwO=Ps6w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Apr 2023 00:28:26 -0700
Message-ID: <CAMKF1sraz6M2hVAL5wqwnFWpe4+V5dggn1FMCYyn4U0PfnPCzA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 4/4] libgpiod: update to v2.0.1
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 07:28:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102088

https://errors.yoctoproject.org/Errors/Details/699672/

On Thu, Apr 13, 2023 at 11:21=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> On Fri, Apr 14, 2023 at 3:19=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > still seeing these errors
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2659/=
steps/14/logs/stdio
> >
>
> Seems like this is from python3-gpiod. Can I see the recipe logs somewher=
e?
>
> Bart

