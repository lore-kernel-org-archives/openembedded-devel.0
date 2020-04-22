Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web10.2734.1587545993644514438
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2020 01:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=WWgRSoiw;
 spf=pass (domain: burtonini.com, ip: 209.85.208.195, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f195.google.com with SMTP id w20so1460049ljj.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2020 01:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=NSbuD3rLwOWfa4lh5LlDpb6hZWN+NBrANlsZFwJb2Og=;
        b=WWgRSoiwEYZay1mKOLrRMRrF81NbxF6co8MXZi9zBwNtoF8joddCpBjhcR2OhIsypQ
         V4t6ONYg7PjYxgnhOCdHWJ0bFSMHsYKUHsFDKTSrit3TJhqMHrv08oyT3d4I7BJdrBHb
         XGSqJebuu6zsllTarrgHqy3js9Ryt2PG7OrsScS1esTBKgVCTN8Sh+9xgDPX5Ca4636R
         WAYuL0yelM29lOTnDOkbitFYO5nH1Kv817J/P31o0Y7/qZaXdC/oztlWcWqbGRAGCgzj
         EkvVpaeta4T7bdhZI3xXD1sjvcDKF1vYWkGTLMpBLdD9HqtMUd7ULk6YEDq1uOFlZy4Y
         9BQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=NSbuD3rLwOWfa4lh5LlDpb6hZWN+NBrANlsZFwJb2Og=;
        b=SJmTXhWVogHwbgDNQEBx+V3r7xVJg/+qv9aj6r5hqFCXfi7mMnnt5zY3piGUBGeP7R
         My1YOLVl0Nh3Al6fr8cHvK8wnayCdk65i6tQknikfyDRLveiI9V4kvHA+l0D00/ajhMu
         IHsH7GJ02ganX+wLXnREN2C9o29brf3x70IyGRoZecZ1ojqxsOwVSrX2dWSO7OViGLeD
         76fbvAsEPBpAqLtPKFZfJDdEVJ2+NB5rx8wxz/cYF1VFRCFbfP5/hoJvzDTzBCLxIB7U
         d2jznEiDv7rOmb09XPmnt3OXADQqKp7/QSEXp8zTrXoYPGuIY25jBfCVB6Wz5pN6E1GC
         dCkg==
X-Gm-Message-State: AGi0Pub5jYyoSQFPobYVyoGMAWcCm64yj2oIv6DNRrqbIzbP2m4Gz+rT
	KkJUz1AR17dVO1I+8fMDEsXY/dUkb96KGIHB1BGm8Q==
X-Google-Smtp-Source: APiQypJQbYERN5SC5DtiXf7oge35ffKgKC9QszSgCn3B2D5IFP4Z4/r8Wgu00iipd7nfNbbewkKjBF8CMUtkEdIgFI0=
X-Received: by 2002:a2e:b248:: with SMTP id n8mr14901698ljm.207.1587545991785;
 Wed, 22 Apr 2020 01:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200421015855.7687-1-zangrc.fnst@cn.fujitsu.com>
 <20200421015855.7687-7-zangrc.fnst@cn.fujitsu.com> <CAAnfSTuCwoNpG++OLKgoPWzfwuWPERGN3txDEfM-nghbed1zFg@mail.gmail.com>
 <55ff716b-58fd-955d-13e2-ff2aaa595785@cn.fujitsu.com>
In-Reply-To: <55ff716b-58fd-955d-13e2-ff2aaa595785@cn.fujitsu.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 22 Apr 2020 09:59:40 +0100
Message-ID: <CAAnfSTt5QgGwosDrjaxGpUR3ugNRFzpt+3xKZ15X5cfWuO24MQ@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-msgpack: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

[ Re-adding oe-devel to the CC list. ]

On Wed, 22 Apr 2020 at 04:57, zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
> For the run-ptest file, I imitated the OSS with ptest enabled in meta-python, but for the test component of python, it is difficult to make the output format the same as automake.

For code using unittest, it's actually fairly simple, you just need a
new unittest reporter implementation (about 10 lines of code) and then
run the tests with that instead.  Pytest has plugins for TAP output so
automake-style output should be simple too.

I'd endorse putting a new unittest class into the python3 recipe and a
pytest plugin into the pytest recipe so that they are available for
everyone to use.


Ross
