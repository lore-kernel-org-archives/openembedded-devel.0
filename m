Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7778FCD1283
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 16:05:35 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.225.1711641929604737333
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Mar 2024 09:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZUShfBis;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-221e6bf537dso695701fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711641929; x=1712246729; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2umx8ZUeljiVrC3hDwKYKVkqxHUmJ2VW+bHP4F237Q=;
        b=ZUShfBismExwMia8OLfcS/0mrmp1L8i236omdhhSUxu6/kzP58nI4UXg8RFhWQ0MtR
         GvUB0FiLpbL3RYZObASPKXD9UqgLKtvPWEnbhyyui11VfBunlEEFpHLUWd4s4Ep48Vup
         htgZ98guRXX9dwtA6OKNVhtNrqrsNfKoLOULCeVA3MGoKDE0cAGVprgD1fVnPlK+Mhaj
         vENUjoEYhTwYMBlKtfbTnwh5JOmoGxnk9xnYTpxg0sNmIxcm+vTQWjAXs+hZgHOqmWzq
         ijG1Xgkdev6FBniQRhd7XqduiOMNpGqhzEvIz6OwVLDK/r91X2jtNUCV97G9/t2dUEd/
         wczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641929; x=1712246729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2umx8ZUeljiVrC3hDwKYKVkqxHUmJ2VW+bHP4F237Q=;
        b=ke8r/0Uh2iepRiJ1N62OXiCkyqtDtuuc1WZCDeUKui1xH3yEQDKK9YQKLpuauoVnX7
         tFfEiBnZUrietRbBAi9Tg2JlwFozjvnijqdd0vFQzU9qiw9ivCONA29LWAOvWGrBzBL0
         JQk776Pmaz+zDp3pN/ZYFa5O9JKz9eiHooHBKDqadIGLRffbv8I8TQRwX0lrRcSUfEQx
         GLKRVPoEZO8YNZkzdeOaasfXh+SjHOkBt437jTxUOP2hO3+OJqsLHaT3o+uWcMf5/nez
         Aq7whV5mApPHqT2dw8pMYoHzmpVYOIEEqKKlYUw38/tflclbUaYf7nr6mDjNAQ7TJBSh
         Z58A==
X-Gm-Message-State: AOJu0Yyonrj5PrIyqqolH1YrqUcOXhPlk4e4qo2Jq7BFPbO54ULN0V4W
	CEbwtPZZVV979O+ADOo9ddjMYD8fxHdm2pGfKSRzMktJVhEwHCbMtevzlh8h2BRQNNLBuSUDqE/
	vUg0Kj9VrrrLRnaiLImOTPFRv4lM=
X-Google-Smtp-Source: AGHT+IFTGTfBBU3KdCbCzEMdqJwZ6FdW+A0V7WbzOceag2P8VuGzqWjqy4u3zzNPgZZ8yas/FZTa0L295rXbWsQ5w6E=
X-Received: by 2002:a05:6870:304c:b0:222:6240:6e72 with SMTP id
 u12-20020a056870304c00b0022262406e72mr3595768oau.0.1711641928833; Thu, 28 Mar
 2024 09:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <17C0EF38D333F803.24962@lists.openembedded.org>
 <WX62BS.0Y0GW21RF67J3@t-online.de> <CAMKF1srn0kN66kGhqHB0Dq0jUVPnPNqwo8G056r=zwsyEumq5g@mail.gmail.com>
 <VIE2BS.1L1HE6R12V8E2@t-online.de>
In-Reply-To: <VIE2BS.1L1HE6R12V8E2@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Mar 2024 09:05:02 -0700
Message-ID: <CAMKF1sphoXFgo7Kq_8+DHQYLttznhkmqkicYRtTPKfK4TLJwOQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCHv6] gnome-user-share: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 16:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109673

mod-dnssd recipe has PV =3D "0.6"  it is better to rename the recipe to
mod-dnssd_0.6.bb and remove PV

On Thu, Mar 28, 2024 at 8:47=E2=80=AFAM <f_l_k@t-online.de> wrote:
>
> On Thu, Mar 28 2024 at 07:59:03 AM -07:00:00, Khem Raj <raj.khem@gmail.co=
m> wrote:
>
> I do not see v7
>
>
> v6 is the latest one

