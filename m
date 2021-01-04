Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.14937.1609774165528730945
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 07:29:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uHih2OLK;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id n3so56509pjm.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Jan 2021 07:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=3m4zZ9+WGI2grn1L7HWovevnRRVuTs1HLvhRkKLD4Hk=;
        b=uHih2OLKznrs6NLI6E4bV2tDLps78rDzzf3C02qwlzegx7ydys6xngJynTQdCyzgft
         9wLxlqpk5n15j2kvuXB1ft4wXHTnKG2R064OMficBN3UuuvcbsHIhilJa2WA7Q0SxiaF
         v99kN4YkPMUfmH7qHLMzcMCBidVx2/9wrVvyiDKS0vS3tUIdJQpxiOW54iYO8Az4Ychj
         qRAnwa4owMcpGYj9TYyBPrk6z6b+ynR0rkk+C/xSQskY7JrDXEabQ0zHXkkHRlOmtUgg
         cDjbXJvYY21Y8dyD7tGHrnWU3jHpxDTSZvH/QMan+9vfSphie6V+a1lgb+QqhGgdqZ7H
         OJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=3m4zZ9+WGI2grn1L7HWovevnRRVuTs1HLvhRkKLD4Hk=;
        b=McjvUVXBZIYGuo8BeVJ86MHD0jSBljUsBYICs4UCeQ+eWQTHXz7jvnpNExoiZ7Z95m
         ReWA07JEF7KTclFNIfd7DO1nWS4yZipAFOgDgcQVzT3BeeMZYtE8vZ5EP1A5wLXCedyz
         0XKO1Vbj243aKv/uPpDpy8D28zb5eldUnJv7PMA+AZ5iFCxwDdkCtAmltJf6vL+tBBwf
         wkfJ5PcC3UkoXJEARMjQLU5gJ0VIOfAASqIxqRVo/72fOnEg2dUZAV09mwuRZxwhtxf6
         50PrHmdt4x1mK0CM6lor/Rmcqq0Xs4sUr7PcaE3C4EA0c4760UL3gVvLiv236MPzCO1e
         t+PA==
X-Gm-Message-State: AOAM532BS6efa+yds98iV9aw0c2pHH6pzP7aZDloLlMG/BAPSsQ0wsMU
	WErWCTicKSrExiilSfL9FYJ1TRDqu0vX0nMKcaiKVppQtktwFw==
X-Google-Smtp-Source: ABdhPJzXtZnuh6RNVt4zQipzDr6iHhTb2W8WlzEYD6taVPVUFMAn/2kyCcUblAxuDn240rf5LD4xL/6yJ8OTnD6ToRw=
X-Received: by 2002:a17:90a:a10e:: with SMTP id s14mr29494205pjp.133.1609774165084;
 Mon, 04 Jan 2021 07:29:25 -0800 (PST)
MIME-Version: 1.0
References: <1656BE5346705D0F.2058@lists.openembedded.org>
In-Reply-To: <1656BE5346705D0F.2058@lists.openembedded.org>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Mon, 4 Jan 2021 16:29:13 +0100
Message-ID: <CALbNGRQw1vFTfY=NmL=Z74XRA=87uNwuYNMXzTbdoSC5HnzpZw@mail.gmail.com>
Subject: Re: [oe] [PATCH][V2 00/16] xfce pre 4.16 batch
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Kang Kai <kai.kang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 3, 2021 at 3:13 PM Andreas M=C3=BCller via
lists.openembedded.org
<schnitzeltony=3Dgmail.com@lists.openembedded.org> wrote:
>
> Upgrade apps and panel-plugins / tested before upgrading XFCE core compon=
ents to
> 4.16
Just to avoid double efforts: Have prepared Xfce 4.16 patches [1]. But
they need:

* Some longer run-tests
* Some panel-plugins fail to build due to dropped Gtk2 support. Did
send some notes here and there - maybe they get fixed soon...

[1] https://github.com/schnitzeltony/meta-openembedded

Cheers

Andreas
