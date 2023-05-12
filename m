Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FF7C77B7F
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 18:32:54 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.32499.1683916365914023259
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 May 2023 11:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=WwjJWIpt;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-50db7ec8188so7866065a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 May 2023 11:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683916364; x=1686508364;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TJES2qYfybEUGsz0huEdLmkIj1MLZ2CbAnu75ANfSIg=;
        b=WwjJWIptHt5ZL9pD6DIhLk2MRU1oodIuDdwPSm939M/6z1+sh4T4moG1kHuv1eVXIC
         3BGqI1w3b8RQ8sA8kuLsYJS0dlqRcsfeiGcRyIH6SDqSEo01SvzeKekzeMjTRMUWDJy1
         zwnWsRQADYH5oHHdA6NmQJO8ozBuRZJol99cqetg0TlVgdRZ9LGqFnWa5An2GhtGf6M6
         iVf3gp2VM7NB/VoDT/rATMAIeG3+CNMwjQX8G3u97KuHisU6SR393m2t9++6pUwecM1H
         KVQjAMdi3FF+BsHjw4BlVOWYaveXxM1uTtOXfvpWrWuxaRu1kDuia9M0xLd5UcjAf30K
         DY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683916364; x=1686508364;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJES2qYfybEUGsz0huEdLmkIj1MLZ2CbAnu75ANfSIg=;
        b=kSkDQqNb2ZbOIWoWIJnwhkg2VxoxNfd+Cz7t9jHQHQABLYVX9yNc25r0l9w631+v7U
         a/UDlgKQC4uos8rE1ir7U56yQXvMUGLmE9K2s2lWiQAR3LdVXwKl2dcWe+dCLXI0IcpG
         gp4pgjZAc4imJpr6mtX8DZoD8cL7vC9DnxovkaMXMQeY2rVoSzl8IRvRexMVMb6fhYQU
         c/LrAEJw7M8VUKv50RRURIj1Y+sOeoG2kZEVp+A1uwXTDEBiJIlcuCLeOjxb6eTdr/2I
         6qY8sgqcdrhMU0HM2l9u3jNuUD/rpwVrLTG27YLnPKRdJBUP9GzcA7wafw9W0kHCvMQg
         /GbQ==
X-Gm-Message-State: AC+VfDxbZPS49kgN0fY4hpomem9fz6zODH8PTf4Shpu366Na44OUtP+m
	Pq2z/bRUogKd7qrlXSyHvLs=
X-Google-Smtp-Source: ACHHUZ6sUaiQ/apQeWr8b7cKzxMxEhhyLs0DQ0K6TWeJxMMWYeuzP7pHhY/Mg1H/qRvR8Lg41P9coA==
X-Received: by 2002:a05:6402:414:b0:50b:c0ce:d55 with SMTP id q20-20020a056402041400b0050bc0ce0d55mr18048246edv.3.1683916364047;
        Fri, 12 May 2023 11:32:44 -0700 (PDT)
Received: from [127.0.0.1] ([165.225.94.222])
        by smtp.gmail.com with ESMTPSA id d11-20020a05640208cb00b0050bd4b8ca8fsm4092050edz.14.2023.05.12.11.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 11:32:43 -0700 (PDT)
Message-ID: <6ef48dfeb218986c6227fadef69959b1493157cd.camel@gmail.com>
Subject: Re: bug: meta-networking: networkmanager: Langdale: duplicate
 NetworkManager services at runtime
From: adrian.freihofer@gmail.com
To: Ken Sloat <ken.s@variscite.com>, 
	"openembedded-devel@lists.openembedded.org"
	 <openembedded-devel@lists.openembedded.org>
Cc: "raj.khem@gmail.com" <raj.khem@gmail.com>, Nate Drude
 <Nate.D@variscite.com>,  Eran Matityahu <eran.m@variscite.com>
Date: Fri, 12 May 2023 20:32:42 +0200
In-Reply-To: <AS8PR08MB7991C9BCB6430700B4E846CBEC759@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: 
	<AS8PR08MB7991C9BCB6430700B4E846CBEC759@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 May 2023 18:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102558

Hi Ken

We are using NetworkManager with systemd without facing this issue. If
the problematic init script ends up on the target device I would expect
that it is also installed in the packages-split folder. But I cannot
see that for the builds which I have available. (The path is something
like build/tmp/work/cortexa8.../networkmanager/1.40.0-r0/packages-
split/networkmanager-daemon/etc.)

There is no subfolder init.d in the etc folder. This is to be expected
since the rm_sysvinit_initddir function of systemd.bbclass is supposed
to delete this folder when systemd is in the DISTRO_FEATURES variable.

Does it look different for you?

Regards
Adrian


