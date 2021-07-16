Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.5059.1626436094708270052
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jul 2021 04:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=mTB++GVe;
 spf=pass (domain: burtonini.com, ip: 209.85.128.45, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f45.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso6893118wmc.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 04:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZxL7CTvrbAKVwjzBM57yPUEoshjSiVe3k3tIrh2QjMA=;
        b=mTB++GVe+FXuN4kG7F7R3vx+d9qLYxKqcmMSZv+s8d9Pb3/VhnvECwa2t3aKDl88je
         8EgBQH7MFH+M5nq0XWrkIfvROq5CUxTefn+LSl6++2MbzB6MqWMDRSQnlEmnGrpDSvBk
         cJKQxKW3IlK8TiYRSZtI3gdlBrLBAOd1IOYKK9cTr9UD+G4vcQ8RxU1oZpHdw4Nxqznl
         TOIQ+6NzFyC0xfE8SWkJga0X/MPvv/CqdQDtX9BF9nAAPl/MshsBTrSKhlHwrPQ0RXuJ
         5xey6o4sc2H366nHpceBYBlRIlFyaRo+hLT0AVFcvlf/KvVy9BJ6eEzOWGBJ2YHeaZbz
         3+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZxL7CTvrbAKVwjzBM57yPUEoshjSiVe3k3tIrh2QjMA=;
        b=mHPK8KdKtisF6KCZaaeKlr3R91/nBqTn3FNyep8eIaZd0T/qJILkTSlAKB8FgYPbhA
         Bay8W1YyhhqgrPWTg8qqwiE7kr42njp+jSdoJ1AzxiPNoiLsD/aFSECMFUrGBrV8guWA
         2n5EhLy5MP9vNWJAO1Pc2xTjyOWuDK8MU7M9u/nRX5v3J18qOcb4OvLQbJN1fjbp9+t0
         FGBDSJI/et3m7H2jDdClHYuFSV5PtehqTJHKBKHvEXPkUtDo8zdQ53k9vttMj59/spVw
         PhjPCWmbBxphuYbByOY7v3g/0T1cUbNcty3LKnTfLx6/ETFB+ACzzLSbATYyx+pV9yy/
         jPEA==
X-Gm-Message-State: AOAM533teR0fbXsLCVg2zQcJw4fjVPL2mXUpn1sE/jpmYP+S/p4QUQhN
	kmOs/7M2kUas8vWJlBqlK86qNwUgEscG5LXAz3u/Dw==
X-Google-Smtp-Source: ABdhPJx0hUYvsoHA+oegU41xeeS/ur+To6Qm8Rb6VnkTI2rGMpk3Fn2ZUJlOhEK7SmwP4x7HY9PX6zcMMqVUyUz4CT8=
X-Received: by 2002:a05:600c:1d04:: with SMTP id l4mr2798024wms.130.1626436093233;
 Fri, 16 Jul 2021 04:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210716103353.4318-1-ben.horgan@arm.com>
In-Reply-To: <20210716103353.4318-1-ben.horgan@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 16 Jul 2021 12:48:02 +0100
Message-ID: <CAAnfSTtQLewmg-yYv9JWdY57vzccFL3aSQBAZvbrkeVuf5v+Yw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cpputest: Add initial recipe. Version 4.0.
To: Ben Horgan <ben.horgan@arm.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Jul 2021 at 11:34, Ben Horgan <ben.horgan@arm.com> wrote:
> +SECTIONS = "libs"

SECTION, not SECTIONS.  Arguably, this is 'devel'.

> +PV = "4.0+git${SRCPV}"

The SRVREV is the 4.0 tag, so there's no need to put the SHA in the
PV.  Remove this line.

> +OECMAKE_GENERATOR = "Unix Makefiles"

Is this actually needed?  If so, is a bug filed upstream?

> +FILES_${PN} += "${libdir}/CppUTest/*"

There doesn't appear to be anything in this directory, or even this
package as there's only a static library built and no shared library.
Remove?

> +FILES_${PN}-dev += "${libdir}/CppUTest/cmake/*"

Really need to get cmake.bbclass to do this...

Ross
