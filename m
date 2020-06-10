Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web10.8989.1591790396378449477
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 04:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=MMoYGx0A;
 spf=pass (domain: burtonini.com, ip: 209.85.208.196, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f196.google.com with SMTP id c17so2085184lji.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2020 04:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0olgg+Eml9CAtG/CIFKbAsc7+nTuN7PNDe9rrMqQ8Rs=;
        b=MMoYGx0AwqzdDPmemT7yiaNMbvT2cV49q6uqr/WYqqQNIUZiM7PPt9DzIyHfFzUzXT
         02bxGUcyxBTEJP3Qe02vdxmi7oeDYohZnxtSCScipU33oY7u8GzxMQkFnvJ7n22LtVC9
         8e1gnADdZNQnnXvIebMbI1N9ePI5VE8bQCu+VAzWDAvj8LQiA5wPWTzaL4zN8jRqnq7d
         /EicOQKDNQDRTsGZwR6KiAUkt4zF5E6MLnU4g8SnAbmiO63+d9dlzYWw/GzNcQJj2JIA
         SrJDGdSskRh4sSVUmtxQpU1caNXDeIgIrYOFlTv6xEfT0HEG7X78CaMlNoJDF4mhmLO6
         rtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0olgg+Eml9CAtG/CIFKbAsc7+nTuN7PNDe9rrMqQ8Rs=;
        b=by9F2IwLG6jnbou7yKBloA+Eg0VGOSvZLAoamNhdpgfdd9EF4MkAnOjIc0IdmNyBcS
         UYsHRh3+MX2hOgAwufp0LV0sudS6ruW6ZyluFMmwzHEnHnHDb1ARA7GsokwDtmelHd6I
         EoAxD/oa5YwQCTlcrBrE22wuUZaTVALzXZLFRaHBX9Wpngs8hfvEOXjN2h5O9VOM7RTf
         Sf5DZts8H4V/hAr6PeodzQ1Iqd9eeYFRzEpu3PFBstenbvdIShW+KZfMa0gTUQ0QtE8X
         EWMzgFunjv+OnM70IY2dW6u6dEFXJbdG7Sq4tUjjouHLu7/HTjBuwTObF1DZ1J4TMqWE
         d8YA==
X-Gm-Message-State: AOAM531bVHKEZ6+9looNB4C5QWBBYXr9tJNX2CD3kIZy3gtQ84iruvmo
	/Zr88PPnbXr+akQxCSwWLvzUcHDuNatNwRjg4LlqTQ==
X-Google-Smtp-Source: ABdhPJx/q/XSb/D5RM+E+Vd4z+N2rhtwc11bhn2LcOgDnQQgJlhEEB+FcLUX5sDBuxg9eyUho7murA2B5Wa533XNYY4=
X-Received: by 2002:a2e:9a55:: with SMTP id k21mr1697511ljj.340.1591790394518;
 Wed, 10 Jun 2020 04:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200609142957.187352-1-arthur.she@linaro.org>
 <CAAnfSTsaMMCGGnGGYHf6dQ3Kdjtzf-NnPy7VoXDjffC-BFPHGw@mail.gmail.com> <20200609215534.GW17660@denix.org>
In-Reply-To: <20200609215534.GW17660@denix.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 10 Jun 2020 12:59:43 +0100
Message-ID: <CAAnfSTupFtc44EX0O6f=1xGX8TLeNhTk9w5J-y0WGPhdA3ZgAw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] igt-gpu-tools: add new package
To: Denys Dmytriyenko <denis@denix.org>
Cc: Arthur She <arthur.she@linaro.org>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jun 2020 at 22:55, Denys Dmytriyenko <denis@denix.org> wrote:
> Huh?

So that was the line that told me the recipe was basically copied from
the file in meta-intel:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/tree/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.25.bb

But it appears that the inclusion of the xorg-app.inc file has been
removed. If the recipe has been made standalone then cruft like that
needs to be fixed.

Ross
