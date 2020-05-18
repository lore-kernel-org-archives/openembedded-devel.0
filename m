Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.529.1589819912583358854
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 09:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=q/u2Q7r7;
 spf=pass (domain: konsulko.com, ip: 209.85.210.43, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f43.google.com with SMTP id f18so4485575otq.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 09:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4qQ3DpOgpJDhuHvTI7Dk6Jn6Fof0/io8bE28FmNxHZ8=;
        b=q/u2Q7r700uow0vmnJBJUeR6ZN4gmP4OJOIpqPFfL4TJHWnXUqOAAC1Dla3Qa8zkP+
         5E70DjON6UFSQCoYZXvHuSpS306JpJWiLxInn2asTqEVvEijxWt/oKq+v1Y23qEI+ga1
         tuBnjWc5nqnUWtvbpbRLQ+rm+4vEjFNscZc8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4qQ3DpOgpJDhuHvTI7Dk6Jn6Fof0/io8bE28FmNxHZ8=;
        b=JDMfYIBuouoU4KL/28s+NFS45gBN37YTL4GXVFNgMEgkz5Ezn04+Rc3F7pkGVp0tFJ
         q/xz3e6VBCU+GLyRZNf0xcVFlipqQ8bzULIuKPGinn8nAwbX+QqZzAbfmNKB1pelnIqy
         4popGnTLtOfxTe2ir2Tih1DBE8xN+qBOaZP1ldA2pFiciYJlmjT0IE4SS4b35AnD09AZ
         OloL5dVch99SjDFEYB+5Utl9XK+P3a1kD2crI4Qhv8a1v7PL+6kFq170wDuWpYLgeosQ
         XepXKCnHqybjbXaNjA3rz8rha7np7TZo3mN2y26U1YTgxwgo9owKh773QEgOHz70xDey
         pNYg==
X-Gm-Message-State: AOAM533s3/6FMkg0PVAgUBM/bazEMwzAoUAlo6nqGduQ3hpiS2R3N6Fb
	sqmZ80MmR1e0dcrevj2zLwVVxHukNnnRE+slZrJrdg==
X-Google-Smtp-Source: ABdhPJxaW7/9VZhGH1Se8jTCs6aE1tP3ZIJd+F0dX/owq3uSi3D0/RUk6t+Vn8GFSLF5763erH9Q1ynwP25yj5RswNo=
X-Received: by 2002:a05:6830:54f:: with SMTP id l15mr11913765otb.305.1589819911935;
 Mon, 18 May 2020 09:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <161026DF21C4386A.31912@lists.openembedded.org> <b838142d-d955-add1-5bf5-a0f192d1e606@gmail.com>
In-Reply-To: <b838142d-d955-add1-5bf5-a0f192d1e606@gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 18 May 2020 17:38:21 +0100
Message-ID: <CAM9ZRVuXMmD-1Xm6vwFmKw0P6sXyezXJmVvUBnBAiEhw9EYHjQ@mail.gmail.com>
Subject: Re: [oe] [dunfell 00/57] Patch review
To: akuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 May 2020 at 17:12, akuster <akuster808@gmail.com> wrote:
>
> Groups.io has a limit on the number of emails in a given time.
>
> this patch set exceeded that limit  so patches 39-57 got dropped.
>
>
> "500 We have received more than 40 messages in 30 minutes from you. To
> guard against autoresponder mail loops, we must reject additional
> messages from you temporarily. Please try again later. "

May be better just sending the pull request emails in the future if
groups.io chokes on large patch serieses.

Thanks,
Paul
