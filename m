Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.9216.1612871577917136399
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Feb 2021 03:52:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vCVwN2Ry;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id u143so5522611pfc.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Feb 2021 03:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oWLCWjbNwDdSP9oWD7rCux5vUvh+2iM0anNv4ji7bDc=;
        b=vCVwN2Ry8bGJbkq41luulLudKF24HYS1Q0sbbgWN2cmylVF78p1oadqjG8VmpUDsyy
         hMenE78YHcnoYIo64nVF1xe3kKlQ0j3uvd6ArWubgORJGSwwE4mBfnugYa132DKVpspf
         wwiiI+MdBrwtYPX3CIOe2QZ48+W41MuViP7ehsJYA8x28HWRBS/Pe1pxu2zCLDJKtOoe
         IvdzbNcyDtNc1iPBg0rSN8+YDj2w1ASfCI+RGidhdmnCQvmRDVO/tSBzShjwtjgBRmKK
         AaPNYuH//BCogySMnpR+omdswOmXweDFFZ8r6EXhAoU+bEo0Bj7jtmwbvAoeIewgWfbm
         79aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oWLCWjbNwDdSP9oWD7rCux5vUvh+2iM0anNv4ji7bDc=;
        b=aa/jhVSDpQac0eOSB7EsqDoD+LLXlUrGFV6PjVb2k+b+4IkO0Y0cdumKjZNQ8xo0Bc
         IVYhBc0ayer8ix3wZ/PDaz4p/emP3fJITUFMbTTr+lBFKkoGaw1xA2tI7MlVOuDuPyfl
         QRUZAG1ll69lhfX5AS+Y2ri+4xyiZ29G82jOfLdThO4ckeMT9dFylg0zyx0bkAkkNfA8
         BTvMxzRnZciWWcIuy9SAsa+MdEA8Stu1TvXnGMDLhs68MdcNgXO68o0DoWoPry8qstIU
         cCaEyf0x4LoMGy0ZIo6GP/VF/SZEyZ941xWHCMIBjQ9ZMQxkdg5sXpBP+r2kv/TRbC2p
         zu0g==
X-Gm-Message-State: AOAM531f4oIeVvbXMkgBvpQ3yKGy1t6tApR0+6eW5Dak9gV8wj8irHXM
	HoFyleCkcxR0OkBvS8wL914ckHE+yxzC/9OTqq0=
X-Google-Smtp-Source: ABdhPJxurHqLQwX7AcmJlxlTEe2dLL996sXsAoGbaIOrZALyfHmcPkXfx6dRWNocienZB8Qywy19K/KOhJ1x01TaVMM=
X-Received: by 2002:a65:5283:: with SMTP id y3mr21280567pgp.174.1612871577336;
 Tue, 09 Feb 2021 03:52:57 -0800 (PST)
MIME-Version: 1.0
References: <20210209082652.89531-1-kai.kang@windriver.com>
In-Reply-To: <20210209082652.89531-1-kai.kang@windriver.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Tue, 9 Feb 2021 12:52:45 +0100
Message-ID: <CALbNGRRM3ZiFbXFEmo5w1XHtTMaqfYCFN35vMWsu126kGuheog@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] lxdm: support to change user password
To: kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 9, 2021 at 9:27 AM kai <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Update lxdm to support change user password when the password expired.
> It also add a label to show useful information to tell user that 'Authentication
> failed' or 'password expired' etc.
>
> It only work with distro feature 'pam'.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>

Hi Kai,

* I'm impressed
* Seems you are still looking for a dm and yes the gdm issue you
reported is still on my list but first I'd like to have more rust to
de-rotten gnome...

Cheers,

Andreas
