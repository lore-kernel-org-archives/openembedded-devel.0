Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.1379.1600752051680425057
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2020 22:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OZqfDjkr;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id c18so14652011qtw.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2020 22:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PC99D+EUpKbH/fNxOlPynID+gjo91lx/8gptSzYDARc=;
        b=OZqfDjkrJw1vg9HN/zpOrrmYfJb83q7JCzwY5+LoTpLUVcmUGQLK4kKXkBP+thtphP
         +aZoQBkAyn0zAqx9hB/TEgYBfOkiplKdxC/LpbHRLwrkXCm1y2k0f+jVraQjP/SXAyQa
         /cUg4ty/m1g3mgqyPILWUhHVM0N2ylDkgGq+E1qWcLjfw6NxfMapZFAQlf5y6ywzgWTr
         DQMIPmK6pp1LscrR89xqJxvvmG5d055MilqMiwK4EEjrrQW51Nlzf6QKKQcV5UZxE2hY
         IxwjxGwTmkZ4uDKbTKfRMpCPsonuZhz7hiD1SCr/6UWNkU6BQ3yEk9bmQhUnVfl53Aw8
         0SHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PC99D+EUpKbH/fNxOlPynID+gjo91lx/8gptSzYDARc=;
        b=Xflz7E2uzWyNgN1HOzlA6oVfMRfwEqzn/jjqM97D6jR5ptCNjEFjA/CKYg2ZqdazgD
         YDobU2Z3WC8fPFHfsS9rlu73hTtV/+cfG5JyIBmiQATgRtFCByLC3wX3Pi7UaHQmcSAT
         0+Kbs+Y9XUD7NbT3e4rqm9wdvsNET77IY/4E/xRz4PhZxKmlq29AN/VX3D2mUdImwNhx
         dDci0Rt/BxXn6JRjsF7u7+ooSg+aAVzEtTXJH8HSA+aXZUgvpB6WVgPe+vE8gyRgHeRQ
         Iw/RmNvK0UO276XCa3J/E/kC93A9rysJAyeCxfDU4zVwRiYDCLnjyKYgzD1K/4Oh5rye
         YuyQ==
X-Gm-Message-State: AOAM5315B6r3/KdfJ+I1kcPdoPdSbdm1/0v3jw+zwD2wrfUnSsp9vFRN
	ffYkIJ3fiCzRbwfVpak4V4Eh2STs6wqYlxkQhZc=
X-Google-Smtp-Source: ABdhPJxVOes38eVHA4gqX0NqIVI38I1dmWOWRwarWqvU+m6d3yOKuvdzv+OLRHrAsuMsX6z4U/nMiZASIki6I5y5WLA=
X-Received: by 2002:ac8:3f3d:: with SMTP id c58mr3134136qtk.53.1600752050728;
 Mon, 21 Sep 2020 22:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1600744944.git.akuster808@gmail.com>
In-Reply-To: <cover.1600744944.git.akuster808@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 21 Sep 2020 22:20:24 -0700
Message-ID: <CAMKF1sqec9PH=nd74khjDeaSwNfdFNGQbFM4n6J+tm=RAkTe6A@mail.gmail.com>
Subject: Re: [oe] [dunfell 0/5] Merge request Sept 21
To: akuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

merged now thanks

On Mon, Sep 21, 2020 at 8:24 PM akuster <akuster808@gmail.com> wrote:
>
> Please merge these to dunfell.
> This series was already on the list for review.
>
> The following changes since commit d7b41ced4b9a9a68083b0fcceff3b226298cff8b:
>
>   net-snmp: Fix CVE-2020-15861 and CVE-2020-15862 (2020-09-03 08:28:37 -0700)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded dunfell-next
>   http://cgit.openembedded.org/meta-openembedded/log/?h=dunfell-next
>
> Khem Raj (1):
>   iwd: Upgrade to 1.9
>
> Oleksandr Kravchuk (1):
>   iwd: update to 1.8
>
> Pierre-Jean Texier (1):
>   iwd: upgrade 1.6 -> 1.7
>
> Robert Joslyn (1):
>   postgresql: Update to 12.4
>
> Yi Zhao (1):
>   libldb: upgrade 1.5.7 -> 1.5.8
>
>  .../libldb/{libldb_1.5.7.bb => libldb_1.5.8.bb}               | 4 ++--
>  meta-oe/recipes-connectivity/iwd/{iwd_1.6.bb => iwd_1.9.bb}   | 2 +-
>  meta-oe/recipes-dbs/postgresql/postgresql.inc                 | 4 +---
>  .../postgresql/{postgresql_12.3.bb => postgresql_12.4.bb}     | 3 +--
>  4 files changed, 5 insertions(+), 8 deletions(-)
>  rename meta-networking/recipes-support/libldb/{libldb_1.5.7.bb => libldb_1.5.8.bb} (95%)
>  rename meta-oe/recipes-connectivity/iwd/{iwd_1.6.bb => iwd_1.9.bb} (96%)
>  rename meta-oe/recipes-dbs/postgresql/{postgresql_12.3.bb => postgresql_12.4.bb} (63%)
>
> --
> 2.17.1
>
>
> 
>
