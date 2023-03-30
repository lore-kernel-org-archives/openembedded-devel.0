Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12EB3C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 17:37:53 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.32303.1680197870174108282
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Mar 2023 10:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K66qKVP8;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id bx10so2103395ljb.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 10:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680197868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2z5Ia07m1QcNYbHdMiI5qk+PEAafDc1qPWv5tz4Fva4=;
        b=K66qKVP87eaG0nNxvbb39L9w0nfiIZRyZf+/89grHUI1Sxga2hIhpeY8yCcqJEUAjg
         LEU1HogNhs2CFM/y0887dI3fKYuqHvrruLCXl1HnQxH9JGzaiFPBIOw7OZC6QyUEGiAm
         d/AwPE6yktJaMGdsmPjnoNALjUAVE5wekmnwO7BmOJsD7tufve8pwC5MrM5b4nkd/UgP
         kjP/z2adwDOS4jfUZ/S+j3/qPUSv7ivB60zDislo43EimqNQSzyW9sdjB92BgMLDCerC
         3SxLOK8IR0MJB/3/mTkBhxXZMM4IRQ0p/zIGFa/RbHNIwt/ivrYeSs5IF3hNulSyI9e/
         msng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680197868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2z5Ia07m1QcNYbHdMiI5qk+PEAafDc1qPWv5tz4Fva4=;
        b=ha3FswjsHK03VIlh058wDtFP1Hz2k2zIH1YFCFo37+C87R0HvNdMfUHKNgZddMGacU
         9zrK85luXyN3MbWctjuiZjec/7KghAvkY9EVb3uoyTfapBFy576pM4jk6g8TdBwah8pD
         nfPNeXR5W7XYhgKMexGUN8ucPsOiVfMrCSSxpIRQ8fS3vODoVKZqg27Lz0AOM6VwjPx4
         dEnRdAU9RHieDx5amX211GGOF2TwO6bCAdjwI8pGct2l+9wDpFaJi3NnBePJJqFnL5oK
         Y/BHKoropKhMIhjzeSQyp31RBW9tW2KbS74TMMD7vH5jXe8j6dugOEht/oa9DVif22x0
         VK/A==
X-Gm-Message-State: AAQBX9csUL5UA33bxK8Vy1vGA17993Olc7+imhJYddLDkf4C72/+dz12
	RU9FF8DCmsdjYiXf2fltW3OvJIX/38ENizfNe/A=
X-Google-Smtp-Source: AKy350Z6Jf9/b2c15qXdBl64nQhE+BrkHbjDR468sgcqT7I4O+SA/y33ixQJzpirlmcpNo5es5aWMjBXQ8BPq1nJQ7o=
X-Received: by 2002:a2e:9586:0:b0:2a4:eb14:249b with SMTP id
 w6-20020a2e9586000000b002a4eb14249bmr6141558ljh.7.1680197868339; Thu, 30 Mar
 2023 10:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230330134302.2789448-1-zboszor@gmail.com> <20230330134302.2789448-2-zboszor@gmail.com>
 <CANNYZj9hC+JgW7F-WWbtQ-_Qf5WDcvyPy38pi1BNqgBPJVAUxw@mail.gmail.com>
 <09b3c1e8-50fc-dbed-45a4-b78699a1ea3d@gmail.com> <CANNYZj-_qD8qog7s7zvdHZA9NM2Yfnftn70pA6tcAo0HAAMF6g@mail.gmail.com>
 <ea869437-321c-0917-9e27-da36738cbf62@gmail.com>
In-Reply-To: <ea869437-321c-0917-9e27-da36738cbf62@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Mar 2023 19:37:37 +0200
Message-ID: <CANNYZj8q136mS-ERJ3NPvSDm-3kD5bb2FrLTPeq9US07OzG=QQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] libfprint: New recipe
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 17:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101845

On Thu, 30 Mar 2023 at 19:20, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
>
> 2023. 03. 30. 17:40 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
> > How do libfprint's meson rules for producing the executable and then
> > running it look like?
>
> Here are the two generators:
> https://gitlab.freedesktop.org/libfprint/libfprint/-/blob/master/libfprin=
t/meson.build#L310
> https://gitlab.freedesktop.org/libfprint/libfprint/-/blob/master/libfprin=
t/meson.build#L325

Right. Welcome to:
https://github.com/mesonbuild/meson/issues/11029

I'm not sure what rules in meson do use the exe_wrapper setting, if
you can investigate that and see if one of them can be used in this
case, would be great. Or those two generators can be patched to prefix
the wrapper.

Alex

