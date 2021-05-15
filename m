Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.3561.1621064557783866878
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 00:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gvbQpP9s;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id v11-20020a17090a6b0bb029015cba7c6bdeso957923pjj.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 00:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aE0MZvEcEvo9Dy8ECi0ERQis5o0/NGtIxmg526fM2BM=;
        b=gvbQpP9sODaqk3C0I+qioHWbs3qssqpWwW9AT/GLo4R9Hlqf4c2z+3x1zUgcur/jWV
         lYu0BStbThpVurLe4W2PPwvSThAfiMP9E+eu3r3vNkq9bD70RdllrsnVkOjtV2aoTcdd
         y8WYsmNhT0n8GHsxybRiIEnZcJuQB+nv9gHA2IMtckVGLWhKSlr1eAg7QKNxTj2Emcrq
         4khfBm2FETSjIrKqxPNsyQePKSCvgQj9vRzVZgllHHTMR9d6tNwtvlc9FEPpU3mUOEIl
         zF3aC7pdmxLqDvaQ407rhUn9RA3eCT93JTOFNiyza6/FZvHQeA68elPFFRXn3kIO7aiz
         OXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aE0MZvEcEvo9Dy8ECi0ERQis5o0/NGtIxmg526fM2BM=;
        b=QrHJ9FBulzpPN65YqAVhzD5RCAR2K+HqjOmNTFvgYGgwcVs3mLh5gHy1Yh2cKx4nbW
         5U9YypDrK93gxYG9VZWZfL+AWoe39yWc0NaZ+ExhcKa601KwNGV7F1sjd8bVSaW2oAko
         Y09/VBese0yBd1lczGFViqRSIcxGT8ML+JGN9fwkZ4JznjLEmMn1uEK4wm7ntbW4JSw5
         RCSzc8zAuBMQcgyjrMic9Zkv38jXPcr0iS0ANrTnzTfFEPWVhPPAyNpxLEcDMzIC+sZn
         W+JSHVJJihZu0iBW/Lwh9FNie0nq0lyiQ/iPQk7xwbN5pffVzcCeM/ssb5wo0pXayAB+
         c7Aw==
X-Gm-Message-State: AOAM532kNkGwC2QXlLC3tDfFBOWJu2dusl/8VjxlkTX/VGPrNMxsY2M0
	YJlgcfr3p+Hk7cN5JsRqOmvbW62ZlQuotNYH/Bo=
X-Google-Smtp-Source: ABdhPJw54ak+dUO3zOR3zC0mZgKFviW0OW2JruBS+PJuI5U00ptE2tAXWj9J8nsTDGf26w/ANAcMJNCyXkA/uN/4MlE=
X-Received: by 2002:a17:90a:a78d:: with SMTP id f13mr38200650pjq.161.1621064557259;
 Sat, 15 May 2021 00:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210514153705.3040536-1-raj.khem@gmail.com>
In-Reply-To: <20210514153705.3040536-1-raj.khem@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sat, 15 May 2021 09:42:25 +0200
Message-ID: <CALbNGRQ0O=CGu6rZUA23u0LjRJpkNcWSEEz256zPyLC4pQoNog@mail.gmail.com>
Subject: Re: [meta-gnome][PATCH] nautilus: Exclude from builds
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 14, 2021 at 5:37 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> It does not build with latest meson upgrades from OE-core
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
Please wait with this. I have fixing upgrade under test.

Cheers.

Andreas
