Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CEAC433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 16:19:08 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.170.1637079547468692079
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 08:19:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LDKR146J;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso3349408pjb.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 08:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OeuJNp8bQ7J4OBE/K5UhVxijuvVkJWMupTHuELJpRKw=;
        b=LDKR146J0bB83JgkHZyLm1BdNPltQSJvDKAsk0AbocD9Y+ecy4UCwcqJ4hCK0Ird31
         9ydIyTkKD4wxG04xZAC4eKJTXacJiI4byPuokzz5RidkcGnuRMH6r+0pVR7Eq43mXXp+
         TqXHB9og3dntlYNCWI6d/RHOZJErSlHH/EuJl0iH1E62/Aqd5a3jvrqIZHGZTgD5iLX9
         htjZvHngsDyY5Dz+DCh6w2TYEAdW2OEVprmvvsGAdXTHDOLsQF3BL4Es5EoVUG7TDBm7
         zN0R8lPPnHWZkFQhzUnn3e3sw5d1yzUlaJsrezCPRammRIo+kgVhD0DUGnFzETjELXKw
         uQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OeuJNp8bQ7J4OBE/K5UhVxijuvVkJWMupTHuELJpRKw=;
        b=bUJ8ocNOePGhIwf+8o2M7INHDAXZDa0eRsYiW2zAgHkwTBgSWFYayyhbATvH4W8Mv/
         wJyJU7y9untk0QAwXWSysa9o40btTPgs7EpbqlboGD4Bneo8OlzPKJnRDXefGyQTRR3a
         qBz+Ke07gE+JVKvTwDWyZvb86BCsIGWou07BuHay4H6fggLGwzNqqLw5UCps9n7HZOR5
         QOYz3DeeXun5xedmlvdNliIP3qQFVPIca7kgVF53DjwiXmScz6SIWd0DHyA169aPG9bS
         65rMF59PM1JGZXh6ldV7NJepXgfmuYbhTOxU1nvpb/KqTFfZb2nqZF7v9cWj8+NJbEqV
         W6Uw==
X-Gm-Message-State: AOAM532frQZsDg80mjEsG/ukMzUXslq8J163QyX7MyQ9dFpQG6LTwGxf
	c456mfjmAVW1osBZBpqPY8EO2/jdXfpxE1MB2TQ=
X-Google-Smtp-Source: 
 ABdhPJxWrDMDY3l+A1D82fJbUej+LKgOu7XZRSN1v0Ulrod5zUzKolnSHHSUcd+aNZac2fHhyBmwIjvVEZBueSyhVGI=
X-Received: by 2002:a17:90a:dc15:: with SMTP id
 i21mr161023pjv.183.1637079546646;
 Tue, 16 Nov 2021 08:19:06 -0800 (PST)
MIME-Version: 1.0
References: <1636501331-62287-1-git-send-email-wangmy@fujitsu.com>
 <1636501331-62287-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1636501331-62287-2-git-send-email-wangmy@fujitsu.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 16 Nov 2021 17:18:55 +0100
Message-ID: 
 <CA+chaQdSXg64n+yVLT6xfOP0=r6oeVXOy7UhAiPtoXqhQDY1Cg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] jsoncpp: upgrade 1.9.4 -> 1.9.5
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d8de9705d0ea48df"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Nov 2021 16:19:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93983

--000000000000d8de9705d0ea48df
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 10, 2021 at 12:42 AM wangmy <wangmy@fujitsu.com> wrote:

> Bug fixes:
>  Minor bug-fixes (including for cmake)
>  Support for Bazel
>  Dropped compile-time deprecation warnings
>

FYI: In case someone has some prebuilt binaries linking against libjsoncpp,
then these "minor" changes also bumped the soversion in:
https://github.com/open-source-parsers/jsoncpp/commit/c4904b2c0d461f84fba88a760161212651e4f536

--000000000000d8de9705d0ea48df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Nov 10, 2021 at 12:42 AM wangmy &=
lt;<a href=3D"mailto:wangmy@fujitsu.com">wangmy@fujitsu.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Bug fixes:<br>
=C2=A0Minor bug-fixes (including for cmake)<br>
=C2=A0Support for Bazel<br>
=C2=A0Dropped compile-time deprecation warnings<br></blockquote><div><br></=
div><div>FYI: In case someone has some prebuilt binaries linking against li=
bjsoncpp, then these &quot;minor&quot; changes also bumped the soversion in=
:</div><div><a href=3D"https://github.com/open-source-parsers/jsoncpp/commi=
t/c4904b2c0d461f84fba88a760161212651e4f536">https://github.com/open-source-=
parsers/jsoncpp/commit/c4904b2c0d461f84fba88a760161212651e4f536</a>=C2=A0</=
div></div></div>

--000000000000d8de9705d0ea48df--

