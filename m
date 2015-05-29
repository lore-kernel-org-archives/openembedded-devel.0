Return-Path: <naresh.bhat@linaro.org>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 64C4975768
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 May 2015 20:37:50 +0000 (UTC)
Received: by ykfr66 with SMTP id r66so25750688ykf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 May 2015 13:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=5Eq8fdGy8bmYgzsVtG+UU9Vvan/pcLs7KgHHK4u18Gc=;
	b=nIEUyioV98WY3l0yr8/gP/2eV466V3z3JHxWYjw1T3RKqzNhr2rokQpvs0RLXhB9uh
	3/aL0PHrYMdzmUAunl47VjayqP+UxBAHl/RO5i9FRhi4FEP6nuEn+peWd7TDciw5hXq5
	/QdSQh0hBimcRaWr8QlunZ20X++XaF5hzmYkk1nUqxm44f21VJGp5VbK52c5p7CFaRMT
	1qrSXVPZbadlI0kt1l1+n/p+OYSEDNhF6QVQtkPvwXMOHy+E39imMXGxXREluEPJdnOd
	u645RTEaUdCB1rqA7Qbm8m+bp4HcTwme4HbyUWlMA3leMyrX3lqj/vRx5b28uWAQyfYS
	VwVg==
X-Gm-Message-State: ALoCoQmlxPmoyx62yay6LzksCXWQkB3FtKx0s8kIpm/E6/LUfPay5Pr08JqEdTFMUL8EsjL+m0FO
MIME-Version: 1.0
X-Received: by 10.170.202.66 with SMTP id t63mr11654184yke.75.1432931871034;
	Fri, 29 May 2015 13:37:51 -0700 (PDT)
Received: by 10.129.56.6 with HTTP; Fri, 29 May 2015 13:37:51 -0700 (PDT)
In-Reply-To: <CAMKF1spr+JyN-wngYn9JgxvGtNny+EL_QrZe2EF2DLkFFEFG=w@mail.gmail.com>
References: <1432891017-8483-1-git-send-email-naresh.bhat@linaro.org>
	<CAMKF1spr+JyN-wngYn9JgxvGtNny+EL_QrZe2EF2DLkFFEFG=w@mail.gmail.com>
Date: Sat, 30 May 2015 02:07:51 +0530
Message-ID: <CAFoFrHY-GheypE_xv9jw4L9J+ge2GS0dSUn9Nbpu_5g8fQDr9A@mail.gmail.com>
From: Naresh Bhat <naresh.bhat@linaro.org>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-filesystems][PATCH] xorriso: Add xorriso v1.4.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 May 2015 20:37:50 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem Raj

On Saturday, May 30, 2015, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, May 29, 2015 at 2:16 AM, Naresh Bhat <naresh.bhat@linaro.org
> <javascript:;>> wrote:
> > +do_configure () {
> > +    touch NEWS
> > +    libtoolize --force
> > +    aclocal
> > +    autoheader
> > +    automake --force-missing --add-missing
> > +    autoconf
> > +    oe_runconf
> > +}
> > +
>
> couldnt this be done via some do_confgure_prepend () ?
> --

It should be possible. I will try it.
Thanks

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


-- 
