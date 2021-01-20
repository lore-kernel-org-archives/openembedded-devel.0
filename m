Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web12.26138.1611138230060956226
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 02:23:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=eHihXQ11;
 spf=pass (domain: konsulko.com, ip: 209.85.161.42, mailfrom: paul.barker@konsulko.com)
Received: by mail-oo1-f42.google.com with SMTP id j8so5681249oon.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Jan 2021 02:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1hiLk4S3/9EeZSkEipSg+h3nxppBBDDuecDADYjTrXg=;
        b=eHihXQ11Vg4YZ7PlFnYsfrrD6J0CAb4fcsv9Y+0KN39CBKTtcc2kAgR7lSDlWXQXd3
         bcdKMCfcv+SLDLG1V1Tr3F5A40jy6tFN4FFAkI6BP5kMda5AwcCaY+dq3ZIhagqXl4nL
         vqjCUwuqmX0bOGVARs4vWPHY5NzxM1iiM05ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1hiLk4S3/9EeZSkEipSg+h3nxppBBDDuecDADYjTrXg=;
        b=KEEtSEHPIg1CFQCeX3oX9NMidSq6ofBnjuXNZccSFrDNRQlqJdM7E2rAkRieN0l2TX
         1HkzCvzQFRpanlbyY4p7Rs+RcY6YFoqO+r1/kIkw7JiRdpZgqaZs11H2ibV8332wltWa
         mILVX9f7FGB5H2yi100KHhqqWHIUGstlKmQUG9nwydTyVbPwweuWPclsoVur1jIWTNZ+
         bytW3HudJnfgxMhvK7awKlJpsETczryWQXuPFKekvT/+MvUOUBkUUC7udVlF6G4NuGNI
         DgC218lFia6rn3uEL+kJuvhyEWoguH8vIXuX59ykUGo8gYldxQHtqNPI7axcUz77iVLK
         m5xw==
X-Gm-Message-State: AOAM532aJtL8zJbDsgyQToSVpqgnKf/Ji9xvcr/ZviAG2dfe26f7UHQf
	amox4S+GRs3fXrVyFbngDycgrdVyFZbz9r3kLxkJ/w==
X-Google-Smtp-Source: ABdhPJwZVs+uR2l8rYYttAYbuO7d/Qd8heAdx6KD3jaeGRbunUA3yCh+xEHC02eWBYpj73rlWEs4Le5qL39tywQfH0k=
X-Received: by 2002:a4a:e9f2:: with SMTP id w18mr4823219ooc.88.1611138229380;
 Wed, 20 Jan 2021 02:23:49 -0800 (PST)
MIME-Version: 1.0
References: <20210120091836.2714687-1-peron.clem@gmail.com>
In-Reply-To: <20210120091836.2714687-1-peron.clem@gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Wed, 20 Jan 2021 10:23:40 +0000
Message-ID: <CAM9ZRVvAoWg_M3iVRq_RMz18TtCZaUBN-tDEyKFo1BrY9b4eKw@mail.gmail.com>
Subject: Re: [oe] [PATCH] Add Google RE2 library
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 20 Jan 2021 at 09:18, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com=
> wrote:
>
> Add Google RE2 regular expression library.
>
> This is used in new version of gRPC.
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>
> Hi,
>
> This is my first contribution to meta-openembedded.
>
> I would like to bump gRPC to new version but re2 library is required.
>
> I'm not sure if i should call the package re2 or libre2.

Hi Cl=C3=A9ment,

I'd use "re2" if that's the upstream name of the project.

You should also modify the commit summary to follow the format shown
in https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines.
So it'd be something like "re2: Add recipe for Google RE2 library".

Thanks,

--
Paul Barker
Konsulko Group
