Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web12.6995.1591708921574330116
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 06:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mbKSrPqT;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: schnitzeltony@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id a13so20282733ilh.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2020 06:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IJG5r+FqYSFY9VuFw5EgoLJMOhcXXN0xh4luLKra5D0=;
        b=mbKSrPqTuRkTqjkwWKIm9rDTY2SW/aujieLNTyRWYK8IOZXUBD2p11e40trzZOPWgy
         U1rJuT01ph0zGXvzTMHTGfLMejQsqPxr5yQ5ofWgO9Bm1P+Q+Dt7a+j/kqBQXDW5m8z3
         PPZX3SQOOwc4sb/dL4yCkqZzbz9c5a+xocgMPVsCGmVR1CIG2Ym0g2lBP0afv10Mddn3
         Dqu78szEbFuh2xMDXgP9jPlr2PGk322HBpqJbNDB8lbwQCGuAoA82NUHKMifs0k4P0Er
         /qZAohYH5zinGyQkJ7zUwP/btEkIVdOZtLews9/FlX91tD7rBJpsqSL4cUTOeoWCgt4Y
         HuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IJG5r+FqYSFY9VuFw5EgoLJMOhcXXN0xh4luLKra5D0=;
        b=FoVO1lJh5PTEVXGfSMxdtqCz6mKi4ULI2Kb70GTcn8fNneVr4lirML97NCO+ousWrA
         62nTIKE2eF/A65TEJg5ZzfwdbWdT8gP4wAt1pVotiVZwYpjiieOrnB43/VwsknGTT/jl
         NPctMC0ttnSIGqgOqEbwQHiTSPwFroEGuSl4qiMEJOuhGiviStTIcl4gv+Qj83fkbSjE
         ejWStfcehWIbA8LyBSK4ITf0TdH/rrdyGaT8WzWQTq8mfMOxcVvIAEAg/SQgh7zabUDK
         1X7Qy/9iDhRodVQEgSWfj68Q4omn3qY4kToJ4kYTVvzA/CNIigUW/jGnl1LEWwv+W5Lb
         jijw==
X-Gm-Message-State: AOAM532x/eGibi5njjcYw9tT+erirBkdh0ndOtINGB+QVGqIau2bavsa
	2UgNND6Toly6G/sNwf86+3c8Y2dDXViWoBSd438=
X-Google-Smtp-Source: ABdhPJwkQpdj8FIbXP8GeTuxE+NwA5lqbRfUojBX0yEyKFRrdhi2ofgvTp5bVa5z+Hq2sP4jMhRFeHezbft/W/ngjl0=
X-Received: by 2002:a92:cf48:: with SMTP id c8mr6606427ilr.147.1591708921007;
 Tue, 09 Jun 2020 06:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200609063212.3788-1-ceggers@arri.de> <20200609063212.3788-3-ceggers@arri.de>
In-Reply-To: <20200609063212.3788-3-ceggers@arri.de>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Tue, 9 Jun 2020 15:21:50 +0200
Message-ID: <CALbNGRSJb8fUA23=C+ecLN5-VpXb=sh2=cBCy8nR1_2shuBS4Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/4] ttf-dejavu: Extend for native and nativesdk
To: Christian Eggers <ceggers@arri.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 9, 2020 at 3:06 PM Christian Eggers <ceggers@arri.de> wrote:
>
> When using doxygen together with the "dot" tool (graphviz package), a
> ttf font package is additionally required.
>
> Probably this change could also be moved to ttf.inc.
Extend an allarch recipe to native - sounds odd to me...

Andreas
