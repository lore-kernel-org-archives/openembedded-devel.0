Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.1518.1615508327445618677
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Mar 2021 16:18:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CLhNFML0;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id by2so3479186qvb.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Mar 2021 16:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g1HXFQvI8Y1EzX0gMzkydbV4lnIqK5AA26QsC1bqa/Q=;
        b=CLhNFML0fDyby08DftBuheCnUHhw7wo9clFkkGX3wvcbZqknm0gdsI4YyMFgdTey1F
         iH6QRBT8N1iMNIxDy39A3McTA/9SzYhKth1TJ1fCWZSnNvlqgM5sky62l45LcdMFBJax
         YOWY/MMUjsAO/E+taeJmRYjBbh2qA0B8ekeS+5GmLL2Tt60EVpzncmtQWD4XgyIgw+Cn
         TH4+wXuG+EsC6pCPSMTyAn8h1/DMcZZiL9/dULfDSAyW2yKbIEa9U6BCeIG0u3tIahg3
         PH0WKUWkpfXr3T7bE7ivD07eEGleG1P/hpNZB9ISP6W6/zKgViDlfp/qmqnJfH2x0Efv
         jYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g1HXFQvI8Y1EzX0gMzkydbV4lnIqK5AA26QsC1bqa/Q=;
        b=a6hxhzIyHGHClVOm13Bpd4LJRONkRwJAHn4hD9uvSvsbc6smGv++2JjQKOGNj8Nm49
         baS6NBeUE4cfy+jfX9G+8Yvo4DB8aK3+1rApHhkLZxbOoW9hCwmw0ZXFBbFwRuzFjTUy
         n/Mu0hIveOtSl0Pay/wwtFuxudVPPz6pAGKrjZlRky0VuUXauaw70gTkJQmhyBv1eGwZ
         Ykv22EGUfT8ONAP/T9XUMGQE5P3EUBllVkRPO5dBw/EsdFrP2IbA3qHITqb1lhvbiNTU
         tTuhDIvOMruflnspVZztlv1Dt7aCiNwd1DIuanBWMVwcdfGRoO0mJpZmcE0HpaaXUJSO
         speA==
X-Gm-Message-State: AOAM531xwZvE2kPLnTk4sV2Pt5nuZMZmhjE2STsSNnb2qJ2aysd5OwPp
	2/KQ6nPdK984zZ6JyWueXWkUBHLzWuIel23RCM0=
X-Google-Smtp-Source: ABdhPJzkxxolbzn3SU8TxhPmjxPzsGC62RU4jDQ5R5+UcfS8M8w9wRlUScMCPtGivIYIYtGm6jtE64pQo4jDlnc6HcE=
X-Received: by 2002:a05:6214:1c47:: with SMTP id if7mr10205082qvb.50.1615508326537;
 Thu, 11 Mar 2021 16:18:46 -0800 (PST)
MIME-Version: 1.0
References: <1615507926-7525-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1615507926-7525-1-git-send-email-wangmy@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 11 Mar 2021 16:18:20 -0800
Message-ID: <CAMKF1srwmviXc6fe60180wP1Yb8qqK5ZVk6NM3g7NX-hu2+r5A@mail.gmail.com>
Subject: Re: [oe] [PATCH] czmq: use update-alternatives for sha1.h
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 11, 2021 at 4:12 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> libmd also uses the doc 'sha1.h'.
>
> libmd has a priority of 100.
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
> index e742d2a1c4..bd40fb92f7 100644
> --- a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
> +++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
> @@ -30,3 +30,8 @@ PACKAGECONFIG[systemd] = ",-DCMAKE_DISABLE_FIND_PACKAGE_systemd=TRUE,systemd"
>
>  BBCLASSEXTEND = "nativesdk"
>
> +inherit update-alternatives
> +
> +ALTERNATIVE_PRIORITY = "60"
> +ALTERNATIVE_${PN}-doc = "sha1.h"
> +ALTERNATIVE_LINK_NAME[sha1.h] = "${includedir}/sha1.h"

usually update-alternative mechanism is for executables, for
development files and libs, its better to package them in there own
subdirs
e.g. this file could live as ${includedir}/czmq/sha1.h and of course
adjust the apps using them to detect right header via pkgconfig or
some such mechanism

> --
> 2.25.1
>
>
> 
>
