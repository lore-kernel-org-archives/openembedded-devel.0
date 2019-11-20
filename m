Return-Path: <pdmorrow@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 594FB7F83B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 16:03:49 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 15so13527676pgh.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 08:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WUnc8WQFIOIPTsyOP22wds9tVZAgMJqVaA2Fulrdris=;
	b=aVjYGw0JH176sytkUYekU3U5cZovnHHL4pLGKfcadoYRyrwIk4mw2Q9lqI3hohRqtO
	yV3qShuDzRizO9v0Q0mI3oDKVQ0f2BSKb/Y9HnSXCt41B40Mnn9JaH04745S2nP8P4SF
	amPdM+/6m4qxr7HPYwpvsx6ewTfaZdZEl1k/bQQrRuOPNVi15JUoYm8D1d1o00G3KO1R
	3p6Mg+JOFlx2Q1djZBaWS/nIi0MOJ7iMic/IVKZiWbEi+gQ4sOcQ1mFfyoZUQOixoqrI
	aATrzOk0QgtP++58HMec+g03hY3sRva6S65FLMGvzlrI5RC8EQrabtedwxk6FFS/N165
	sr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WUnc8WQFIOIPTsyOP22wds9tVZAgMJqVaA2Fulrdris=;
	b=UFuL+533aw+UkPrb8k29K6AJOsZ66eV7wi8yxf1jUuI95DT87Nk8Yaz0ZVF3pVXla0
	vrMB4Oq1eWtkFzIqLjgYtidcBkV6sqyYquNq3HxGv+TIpn07jZdAKHUV/na0xFR4eIMU
	evCzc1EhA0NHPXLzXgIS//TE2ZGU3YXwadqL3wW3N4GntHKFCUpTwYaNfAECoUs0CvUu
	MQ8yCjr6xA5GGeGRN62v2tryGdjUJiHORIhFwhMpWjtS8j3mpFNnkv6WO3UxVIbMfNR2
	uaV8UNdTt8j9T2LwBQQAZX4IO7A4BmRxYSDtkBNadhDveZB2CMi4CFbnRlXEOWuCODYI
	aVow==
X-Gm-Message-State: APjAAAVWiFDNy8/xXvCQku1MEzbavAt79DWAet5FXUTScWilNLTuT7OQ
	02s8+XOoe8xl32og80akWFpF4xWLKM5Gvf5eWEE=
X-Google-Smtp-Source: APXvYqyAfvycjkJ6s2YO1mG2tEERcgD+UE56uyfumoTzH0HDp0FllQWEXbq36GMSM8HX+20ClkavLkTIgJhJjvHPu0A=
X-Received: by 2002:a63:1f08:: with SMTP id f8mr4164521pgf.145.1574265830336; 
	Wed, 20 Nov 2019 08:03:50 -0800 (PST)
MIME-Version: 1.0
References: <20191119154539.22200-1-pdmorrow@gmail.com>
	<CAMKF1sqkHJK9gv-=TrCV=HSTwbdS7WC1G6jSReVxQtj_ZHyZuA@mail.gmail.com>
In-Reply-To: <CAMKF1sqkHJK9gv-=TrCV=HSTwbdS7WC1G6jSReVxQtj_ZHyZuA@mail.gmail.com>
From: Peter Morrow <pdmorrow@gmail.com>
Date: Wed, 20 Nov 2019 16:03:39 +0000
Message-ID: <CAFcZKTyvjHeoJHDN_wj0M0bSRt9ns6ZgM7Yj6FWncH-qs5TTig@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Peter Morrow <peter.morrow@microsoft.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] chrony: install chrony-wait.service
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Nov 2019 16:03:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Nov 2019 at 14:39, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Nov 19, 2019 at 7:46 AM <pdmorrow@gmail.com> wrote:
> >
> > From: Peter Morrow <peter.morrow@microsoft.com>
> >
> > Any systemd service which needs to wait on ntp synchronization before
> > starting can order themselves after chrony-wait.service.  It's useful
> > to install this service as part of the recipe as it saves needing to
> > install it via a bbappend file.  Note that even if the service is
> > installed no start up delay is introduced unless another service
> > orders itself after the systemd target time-sync.target.
> >
> > Signed-off-by: Peter Morrow <peter.morrow@microsoft.com>
> > ---
> >  meta-networking/recipes-support/chrony/chrony_3.5.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta-networking/recipes-support/chrony/chrony_3.5.bb b/meta-networking/recipes-support/chrony/chrony_3.5.bb
> > index 7c6356d26..fa11c443e 100644
> > --- a/meta-networking/recipes-support/chrony/chrony_3.5.bb
> > +++ b/meta-networking/recipes-support/chrony/chrony_3.5.bb
> > @@ -103,6 +103,9 @@ do_install() {
> >      install -d ${D}${systemd_unitdir}/system
> >      install -m 0644 ${S}/examples/chronyd.service ${D}${systemd_unitdir}/system/
> >
> > +    # systemd chronyd synchronization unit configuration file
> > +    install -m 0644 ${S}/examples/chrony-wait.service ${D}${systemd_unitdir}/system/
> > +
>
> thiis needs to be packages as well something like
>
> FILES_${PN} = "${systemd_unitdir}/system/"

Thanks Khem.  Strange my build did not show this up, I'll do some more
testing and re-submit.

> > +
> >      # Variable data (for drift and/or rtc file)
> >      install -d ${D}${localstatedir}/lib/chrony
> >
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

