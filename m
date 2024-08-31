Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43A8CD3421
	for <webhook@archiver.kernel.org>; Sat, 31 Aug 2024 19:00:03 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.2353.1725130796426478704
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Aug 2024 11:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I12GshKr;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: festevam@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f3edb2d908so30222821fa.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Aug 2024 11:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725130794; x=1725735594; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uP183cbbiHCF0OwFJ2+teWdLCtsxqkDhSBiZSfcJ9E=;
        b=I12GshKr7nQFlW0+lweVqQCSyIw6DFEDJ2447uvo/fb8WLa65GKjc0Jknax7eG/UN9
         KiKObnP/vMyjS0vraL1T+Lrx+eUtqzLabezuJVzQSXTjWZJd6TP3kA6lM8aqvdJ1AlKF
         SV3XOXrKDJQLYcYqkpVj2h1GqsyMT9epJ9+svIWCLr26SRIGWnlnbtYbUFDWECVtGN5Y
         WkbYdRlOr8uVT2Ezz/ErMeU0IYqc+AHkkX9cNLoDAMVwR3xo2lbvtdVu3CdfiR+vJpoX
         H8RpEJsb0ICEJUtFOv5FUW+McoIPtuU33EyHD+GZcjwbNLS8hhNUKhmV+eUApRGo76OU
         VnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725130794; x=1725735594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uP183cbbiHCF0OwFJ2+teWdLCtsxqkDhSBiZSfcJ9E=;
        b=ZTWo77Y0soLJUMUr+bJ89R3ZfVOv3ZXECHvgdJVqPgXIW+a/FyWFn0RRVF3Os2PBD0
         MI+n+urUeDhydDSwAyy0EE0MvPbrlSpFNivu7ZBJNxeuICqanCZvJBxhfVcqygToYo4V
         Ll7ia3kyGLpaIJTrbU/JVXtLS6bX6WXCp4n2O62+ykRqqHgsc0OhSBVRCuushdDtZ5kA
         I/VPhNUy+yrfyWInjTy/4yBGLyoMCG8ion4IqRA6KESW8AF6fcvTvDdyJwiNFm69KfFU
         xG2oQmfamO9E0chC2IB4szVcD2er134oRSevAOAu1fuXSOHRkiKQr39LKf5vnjryQ2Qy
         nwnQ==
X-Gm-Message-State: AOJu0YwOa3X4gClx2Np7dt2+ItsFkuUWz6AjsOPHKHctQfW2CwYrYwKm
	L9CArwQTVBkCU6gYaC46N4k4xILK1eK2d0X9P302XlXxqH0S7PWUO8zeOfRK3k59WJkqXKt/gjc
	vZ86nVt9MwjW+vCvzlCXYXIFwybU=
X-Google-Smtp-Source: AGHT+IElaO2XUi1kwpeUmsMjd5Bbozn9G0P3/kINI4Fs8prhez2RqjSBQl74hwcNF7r2vBBx8wPT/p0RtpiDvGK6GCo=
X-Received: by 2002:a2e:4a0a:0:b0:2f6:1d5a:709b with SMTP id
 38308e7fff4ca-2f61f2a1887mr32871731fa.43.1725130793815; Sat, 31 Aug 2024
 11:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240825153102.1055323-1-michael@amarulasolutions.com> <CAOf5uwkjXMfRjvdY5T1PPfDKkf-N8oTF3O9=5ZdwQ-H-SrQxOA@mail.gmail.com>
In-Reply-To: <CAOf5uwkjXMfRjvdY5T1PPfDKkf-N8oTF3O9=5ZdwQ-H-SrQxOA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 31 Aug 2024 15:59:42 -0300
Message-ID: <CAOMZO5Dz93jfO5D=rmsTcdoQpj-UrYDYAhz9v2yR3k0GOgDSQQ@mail.gmail.com>
Subject: Re: [oe] [PATCH V2] cpuset: Add recipe for cpuset tool 1.6.2
To: michael@amarulasolutions.com
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Aug 2024 19:00:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112064

Hi Michael,

On Sat, Aug 31, 2024 at 3:41=E2=80=AFPM Michael Nazzareno Trimarchi via
lists.openembedded.org
<michael=3Damarulasolutions.com@lists.openembedded.org> wrote:

> Anything more that I need to do. I'm really a newbie here

Your patch has been applied:

https://github.com/openembedded/meta-openembedded/commit/58a923c96877e5d6cf=
434d2d69108c5da1c3f552

