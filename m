Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.17994.1599564683003413222
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Sep 2020 04:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iKj4h+2q;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id w186so9823798pgb.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2020 04:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cS7prGTlz7dwXWJaBgtEzv6LMJhKvna0EwvSJ0xjOWw=;
        b=iKj4h+2qbBFvi9MuhdpGRosMHVg1xV5p7scjaNY2DFHLMWzL/auLPQuaPmcaVBzg8F
         0J1uJAqWAqk1V9SN63Q6WO0DpeEIZqp9t1JBd6VP9viCegqHtJiGUTfrAXdxQuz1un2t
         huzcELb3jAUgnIJDd6mVMOhne9U5Co7JxQ5bQUK3NG29gh80ucTQS2D4A19yaMgWYc3i
         KWftr6WwLWgdMzh7h/7k0S2k/n3dD2nUJ7RW3867jeLohHApwjDMwffnXCS3G34kOHvg
         9/IzHCvYCThWaun71cxY3mRaVcDn5T1PX2khLbDUpeZNjeRk8/GXXKQTATx8glL05kAU
         TzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cS7prGTlz7dwXWJaBgtEzv6LMJhKvna0EwvSJ0xjOWw=;
        b=jwYLlOeztII3uzdAW/uEBYxcHA5GTLpl0RElfI/FVGm2tPTEKGp/usP2jCUeQBtEvq
         ZIkRxtqC31oCUA5FXg0c0rTiP2pn4nbbH/UhH1GwulAgJpn03V9xJ5uPGBO8l4M10fxx
         HMZE4F/0vx84sJguQAG28YNox5v1e/1WmZkmZT0oaJ7CE6RsjNc0KaNCUHigIPdeOyTV
         rWdgERzRUacX5Yc16qSFilxQRU545O2mV8ZL8GEnQku3HQgz7lBWdXinv8flfzDrfvNj
         g+IXFtyybCB52MCaVIosBQjUezGMuT1ksxgqAOixjs5bbbqhSN3IUZFhCMM0G8ps9qFe
         GUZQ==
X-Gm-Message-State: AOAM532agvEDn7pWjWkVldAyrqya1ISJ6GRET0OaVWdbEsr+fSTMPxtc
	t4opjaTeSm8CTa5K1lGkyhBQD8AcWicQNAIlCGQ=
X-Google-Smtp-Source: ABdhPJxmTX7YgaXzT7/IMFK/0o/4Jxs+sh2nkK4gFrkd1V7B5VY+ZmGAPpUvvbdixXuNu6L1whhYNJmvC0I0UJkVgl0=
X-Received: by 2002:a17:902:8209:: with SMTP id x9mr8968959pln.55.1599564682437;
 Tue, 08 Sep 2020 04:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1599324864.git.akuster808@gmail.com> <060d218f82af9070a8e79cefe1093f9b0e6bd7b8.1599324864.git.akuster808@gmail.com>
In-Reply-To: <060d218f82af9070a8e79cefe1093f9b0e6bd7b8.1599324864.git.akuster808@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Tue, 8 Sep 2020 13:31:11 +0200
Message-ID: <CALbNGRSguQ_U3S684j_2yiaMQYVeixaMj6Furkzk7wuZAwi=Bw@mail.gmail.com>
Subject: Re: [oe] [dunfell 11/20] samba: upgrade 4.10.15 -> 4.10.17
To: akuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 5, 2020 at 6:56 PM akuster <akuster808@gmail.com> wrote:
>
> From: Yi Zhao <yi.zhao@windriver.com>
>
> This is a security release in order to address the following defects:
>
> CVE-2020-10730: NULL pointer de-reference and use-after-free in Samba AD
>                 DC LDAP Server with ASQ, VLV and paged_results.
> CVE-2020-10745: Parsing and packing of NBT and DNS packets can consume
>                 excessive CPU
> CVE-2020-10760: LDAP Use-after-free in Samba AD DC Global Catalog with
>                 paged_results and VLV.
> CVE-2020-14303: Empty UDP packet DoS in Samba AD DC nbtd.
>
> Also backport 3 patches to fix build error with musl.
>
Maybe I messed something but it fails for me i recent dunfell with:

| Checking for system pyldb-util.cpython-38-arm-linux-gnueabi (>=1.5.8
<=1.5.999)   : not found
| ERROR: System library pyldb-util.cpython-38-arm-linux-gnueabi of
version 1.5.8 not found, and bundling disabled
| WARNING: /home/superandy/tmp/oe-core-glibc/work/cortexa9t2hf-neon-mortsgna-linux-gnueabi/samba/4.10.17-r0/temp/run.do_configure.2978665:1
exit 1 from '${CONFIG_CMD} --cross-answers="${CROSS_ANSWERS}"'

Suggestions welcome

Andreas
