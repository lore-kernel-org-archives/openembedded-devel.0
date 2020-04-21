Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.6068.1587465479965973597
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Apr 2020 03:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=oDnnxyII;
 spf=pass (domain: burtonini.com, ip: 209.85.167.45, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f45.google.com with SMTP id h6so10729445lfc.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2020 03:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OoRFweL3NQd9n12NjERi28nmXeKSYY58h8p+5NkRGTI=;
        b=oDnnxyII14SK06L/4iUJOgAxuzmRiW1rZ897yJ/QgSVXEb9OQlAqhbOXbr4HG8W+qy
         Ymn83KSt3ws4+VuUN6jSlQfo6QQIUeODlz0mW1U3Cyhev7bESGNePsu+iE78dKHvKK9h
         HP08hHQkS6if/6cApYcb32L9IFg7RbflaDRgVGMWrSq50KDTGKf3YPI+axqVtUXu9RtC
         DAEBSqNkcW0lh2QYqHrsyb7XB3PyE+0UwiGteAi6I5hdGDNsstiddaIC5dQg+cn4ERjq
         SwLS+EgT2EwonFAqKcHnnDhIY31rsEWZDwdZDDrkbkjdIt+IDaxjyQzEo1Y/MzPP5Tip
         DXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OoRFweL3NQd9n12NjERi28nmXeKSYY58h8p+5NkRGTI=;
        b=iC9+zj7aPSWjQkBrVsyVjOG27agLb9TCtZsa0ESUilbTS7lddphI4NOLFqSzS5RHnr
         XCh70DVmkejfSYObYJJJ46g8evu3Wgag/TkpfZDLoksk1sGAV8hv6DR3IJd/uXoeDYoS
         yHxBeNo4IFpKrwy2vPVQH1M+IkuNLqJOe4suOSfPidNA+vORCJyB72jiMHVCUbERogfQ
         UXRSUgigGEWiysRN/6xjotvZz+wNs0APlGWsY543jm9EO2/LHLWRacWZ7+O2oINjyPeB
         AcOm83sqJ8UtRUyr9Pc3keaQ2citVA4UYkWuP9gZ0S1TjmSL7KOrfo8FHggba4jPr+U0
         /RMQ==
X-Gm-Message-State: AGi0Pua8QUqeMJQ2z0xSzwzkzb7SBmWgnPzUpgMtSZG3i21/N2a92NF2
	FxKExEDNuy/SLkqXNHYJT0CYMMW/SFZ+x55bMEs9kw==
X-Google-Smtp-Source: APiQypKMq5ja9O7Ra1QN8+/82q2zpnOKAxb6++tww3N+M9GzHOvFeD+iyqtmv534yIoSzzezaFy9OwbNBLm29hUgDuw=
X-Received: by 2002:a19:ad45:: with SMTP id s5mr13383115lfd.106.1587465478074;
 Tue, 21 Apr 2020 03:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200421015855.7687-1-zangrc.fnst@cn.fujitsu.com> <20200421015855.7687-7-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20200421015855.7687-7-zangrc.fnst@cn.fujitsu.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 21 Apr 2020 11:37:46 +0100
Message-ID: <CAAnfSTuCwoNpG++OLKgoPWzfwuWPERGN3txDEfM-nghbed1zFg@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-msgpack: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Apr 2020 at 03:01, zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
> +#!/bin/sh
> +
> +pytest

What is the format of the output of this?  The expected output from
ptest is the same as automake's simple format,
https://www.gnu.org/software/automake/manual/automake.html#Simple-Tests.

Ross
