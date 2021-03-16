Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.126.1615923410311612164
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Mar 2021 12:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=0q2Eyx7r;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.218.46, mailfrom: brgl@bgdev.pl)
Received: by mail-ej1-f46.google.com with SMTP id si25so18440008ejb.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Mar 2021 12:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N47NP72WnO/cYEVWqc4T+eV4eqMXryQ/BSdo5CxVVys=;
        b=0q2Eyx7rBCsfnk0sc+FVwviGx1du01VzFJh51pUHvFdik2GPkjB+0P1943xmfEfGlY
         AiZzfzmO80HVntoQKK3FDFga30hfkyrB+jUyceI1hZghJ5Y2LF5Xtv7aplGoUNo87lMz
         ZIkxlvHh0s0PSnQkMrAA58wLNX/rFWOjQMn3oRUx5uXTIchCFYkpL50SV5Yq2MBsOW6Y
         8vutZH2DLUmn0b/jRjvfECm0z81t0swq1T0QXd1hfO3wXH7z3MAMbHWwpQaUF5TSHaXi
         ReVLbN5TZIJLjpvo7gaV6Gj+QUydtzbftQZT3eVCrcqm7cmd2ziUK6YfTKOlEJ3S5DQ1
         gprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N47NP72WnO/cYEVWqc4T+eV4eqMXryQ/BSdo5CxVVys=;
        b=hmk05tOx1YVZvsRs+iAGhSvr+IJ1vfqzj4LZoeHJzZJh81jZJ95XKZJFpLny5xq4a8
         Kwv5fYOPu8576G8CWAGwaUDcdMOPxHPIQNlI1QL3bxLK9gp6DfOR81s7rpu1PBQToGgq
         ZYesbXpJ0TZPtE6nKSjZYpu250XLDo+QfhludCOwDB7olJ/mlhGxpI0VHjv4dMx4VvJA
         FIOS9Tz2fJxXyU1VHjRaN5mFutz7ReTYeRry2zWG9iD2bxiPls4jbxivjejy+CsMxYnD
         1uCJyaqqfgaKtmBv7qbdFw2XJNeuyU1sUF87DFlCFeoPume8bWI5oAdMZETiAcDsSW+s
         DjnQ==
X-Gm-Message-State: AOAM530XvrN6f1JhHjN/aDxPdWD7b3ar9oePgXHI1gsj77yYyfYAZzD1
	sIIZY4A7J82z9T1q+6UV8tPNRHfhiH5CYZBzhzgt/w==
X-Google-Smtp-Source: ABdhPJy4JldKU8vOMHhrBWrRZFLdpEDB+Nb+meuU15PADw7KKCsX8t4f3Bhew5vAUFdRacXSXV/KIGRJYmcZ3fdL9MQ=
X-Received: by 2002:a17:906:3b48:: with SMTP id h8mr31346306ejf.261.1615923408609;
 Tue, 16 Mar 2021 12:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210316144242.5951-1-brgl@bgdev.pl> <4eead083-0413-1905-e77e-af261cf981bd@gmail.com>
In-Reply-To: <4eead083-0413-1905-e77e-af261cf981bd@gmail.com>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Tue, 16 Mar 2021 20:36:38 +0100
Message-ID: <CAMRc=McPCM2uYRJesURjm=6RnmqxVOS0YfZWbi3Ydqj5MLZP0g@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python3-pythonping: new package
To: Khem Raj <raj.khem@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>, Tim moto-timo Orling <TicoTimo@gmail.com>, 
	Derek Straka <derek@asterius.io>, Trevor Gamblin <trevor.gamblin@windriver.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 16, 2021 at 4:03 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> please add it to packagegroup-meta-python as well in a followup
>

Will do, thanks!

Bart
