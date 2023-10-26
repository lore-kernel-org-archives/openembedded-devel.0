Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DB9C25B6B
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 20:12:49 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.81329.1698351168650145166
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 13:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cPvBs4QK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-32da4ffd7e5so802222f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 13:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698351167; x=1698955967; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjxq59v1EmzU2GHuShDLRwWxvofUXjbAn7/2I37tVfo=;
        b=cPvBs4QKIQ6QSivL8eW9D5erv5CtOanZhuwjnkuRIgCxzxvisp+BYPTubA9xFLtXeW
         tTXo3CVMf6DYinhDbM7DKjv725q89Sf3tv5IxyHhrHEFdZ9xFr9vJNoMS/6iWCoSxMJG
         Eoi7710X/490GfB6gbQ38BIULg1DLT5agCh2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698351167; x=1698955967;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vjxq59v1EmzU2GHuShDLRwWxvofUXjbAn7/2I37tVfo=;
        b=t8Mqx3ujf55ZkoH00i5YBCazej/V7S4/6RG9ug2pLZ7Anzc+3dQvv9fBPgONeqDHrK
         JpjrGvg7LgX86CecqQd9+JZ+BmkuU1w7jDIXGBB457VoV9WUM6xlbbpr4ajUVn+lbBVQ
         C0tikZPusDvOpcgz6ClIkCd3puHrPJwmEyio2vI2kkEbSGd4ImTowTrM6yMBiGBpCSdL
         qC8EqVI71pQ2NDz0OcLnlxswtATCdL4xfceHACCkiYIhurT6E4pvj7EFRx9z/USsei1B
         ksXNwQhudRcAE2r176t9IF0nDoyIp57S3Xj1Rh1UEowH3TFFkxgGb/Rg27hfHZQaeuYd
         CC8A==
X-Gm-Message-State: AOJu0YyDyj+H937sNeP5zKL9ovU14F1PbvEYL6KEJb0Ju93Hw9iokqo3
	JhYReOmoMlKkGlfxNQupanSZfA==
X-Google-Smtp-Source: AGHT+IGikdurSC+CUyU94kr2secwmYmMAQPNC9Tl32jDzaWWyF/qjXKDNcPftNXryfhr8+CdnYD/KQ==
X-Received: by 2002:a5d:51c1:0:b0:31f:afeb:4e7d with SMTP id n1-20020a5d51c1000000b0031fafeb4e7dmr885121wrv.18.1698351166983;
        Thu, 26 Oct 2023 13:12:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:35e4:65b9:f46b:317d? ([2001:8b0:aba:5f3c:35e4:65b9:f46b:317d])
        by smtp.gmail.com with ESMTPSA id a15-20020adfed0f000000b0032d88e370basm175349wro.34.2023.10.26.13.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 13:12:46 -0700 (PDT)
Message-ID: <2cbe64d28d7e2655f109b45d0fcf8b4317367c72.camel@linuxfoundation.org>
Subject: Re: [oe] [meta-networking][PATCH 2/2] mosquitto: Support building
 for native again
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	openembedded-devel@lists.openembedded.org
Date: Thu, 26 Oct 2023 21:12:45 +0100
In-Reply-To: <20231026132203.3840009-2-pkj@axis.com>
References: <20231026132203.3840009-1-pkj@axis.com>
	 <20231026132203.3840009-2-pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 20:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105765

On Thu, 2023-10-26 at 15:22 +0200, Peter Kjellerstedt wrote:
> Support for building from native was removed in commit e1b332f2e
> (meta-networking: Drop broken BBCLASSEXTEND variants), most likely due
> to no support for building libwebsockets-native. That support has now
> been added, so it is now possible to build mosquitto-native again.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  .../recipes-connectivity/mosquitto/mosquitto_2.0.18.bb          | 2 ++
>  1 file changed, 2 insertions(+)

I'm a little curious how this was being used given that libwebsockets-
native was missing? Local changes?

Cheers,

Richard

