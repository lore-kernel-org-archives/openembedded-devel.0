Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.3094.1585680516596080334
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2020 11:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=taST3zIJ;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id k9so22919590iov.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2020 11:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9UYpF14PYTc/HVMMUE0F/h3OjRVpuVM7tBBhx85FFLI=;
        b=taST3zIJuftrBmz68aEvOgD4ydcQUhYstMuolY2Uz2nBq7XKQf9BRVS149qxwm7cDJ
         Rj58wUqvbCx+PDpcsgwmjVZGIT2hAA4MsysjfrDTU+kZpnl1jhZobHOBQ3ulEsPa8PO1
         Ktctdw5pIYNUZfyTR3NIK2kq1i/Fg8q4dkiA35LMrQp4BfC+tiEMNNHoPi4o93bU9cVV
         PeSpralquhTmYMdjm+f7elrSTFhDnSSEAk3SHbNWA0xEwpvc5H7oD4Yh3RogARBU29yJ
         wdnVEa3gdgKwvm2Qz69vXCrUIFrFMnW4gnqoC0kNP5gUOHb8BOTfMmH6HxWbaG/B95Mv
         tO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9UYpF14PYTc/HVMMUE0F/h3OjRVpuVM7tBBhx85FFLI=;
        b=KlQzmZnFoXAfw3Z//GLmyYoz1rCI18fCtprRZpgfDSkPMe7wQHMRYx9q/FR0p1sn8J
         c3rOH14NJN27ZMZWs0IJheeMZYK4r/rOsQ6w4CJJseYSw36+2UyrEh6AJRoFgtTzNUeh
         iJyvZgEPNxGH3p+GayUBSbxTjhswKvzy5Jz27g7E30DpHYkJ9eW7aejrxsMPgbzZ5++n
         2WqhpUhUXcuiYNgb5X9ycpfZVBq9DbDkWfZpVI4LRO+D45+pDKa7SEQIPtppmnhMnE5F
         4BKhsmIWum/3SOhOAPlMr9vR79oDe/7zw26KX4VofOz8ScGCuQOIPorgPOP/HD4VvpkC
         Leng==
X-Gm-Message-State: ANhLgQ2xpsIiEgyugicu0s2Qy2xwF9w43ZR/wL3st11+kdsby5aQp3W9
	4lch+WA19JrrjMOeZBLXI87Qtbwvi8WKUyRmwpI=
X-Google-Smtp-Source: ADFU+vu+g0K7EHasTTgZisptucLr1sSXhsbN8xwZUnVDM6vzn7K5EcvzMhw072Gyf+uYumtX6jQthe9pg7RPQlbsQz4=
X-Received: by 2002:a6b:7419:: with SMTP id s25mr16774822iog.45.1585680515970;
 Tue, 31 Mar 2020 11:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200330222616.2354-1-schnitzeltony@gmail.com> <CAMKF1sry1VWmFTZEVt_Xj6GsVetGbaYLZd8_x3=J3YTUM9m7og@mail.gmail.com>
In-Reply-To: <CAMKF1sry1VWmFTZEVt_Xj6GsVetGbaYLZd8_x3=J3YTUM9m7og@mail.gmail.com>
From: "Andreas M?ller" <schnitzeltony@gmail.com>
Date: Tue, 31 Mar 2020 20:48:24 +0200
Message-ID: <CALbNGRTqzjA=P8C0dqBEVP3PU4SuizjyBx-4k+FVfPexT+cP3Q@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/6] wxwidgets: initial add 3.1.3
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 31, 2020 at 6:58 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Fails on musl
>
> https://errors.yoctoproject.org/Errors/Details/399768/
Will look into...

Andreas
