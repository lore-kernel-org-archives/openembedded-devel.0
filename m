Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by mail.openembedded.org (Postfix) with ESMTP id 455CA7F88D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 16:11:59 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id q19so118891qvs.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 08:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SRyDj0irOJW6N21QvcmnAaUw7BpDkPWfUjzR36t0mvg=;
	b=OjLI3COMUIyDO+/EpclmwtfkG35mlguIRL4zqcER6WM4SKZuXdhuBTLS83LGKm3zUL
	QL1Ev6pwPBelroktqfXuX8mlVyqz8XS9c4jQz+lOjGvDBhUSO++Ikue2Qi4vrU0Zg6gO
	63IaWMydqh3U/NlYnkSGPNOD4xDJRfspI4JeOtlhwlUYMYMHdCE/Wctpqx6Mnkpsi1gu
	pw9ks5nVRMbeytdi7zb8EfsilzbmMmxNvegeQD9dpwcB3oCTJgRtFT1Bv9oTuXUzzEGC
	o5DNG80v+ExC9tPrG5BdvDjL2cRji5NZAd+YdFdqEpBZih3ADwApfY6dj0v16OUUWJpt
	DjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SRyDj0irOJW6N21QvcmnAaUw7BpDkPWfUjzR36t0mvg=;
	b=TpXe2CZfnJCuVBy5k1l2T7xkIjVGHah/CXVGumYufshAJuQbkIRtB+HA+n2A/Q7xFp
	6FFBVKGsBMHM0Cfr8hc1pauQAPgabbOV0HMbjlm6GrhgjEiutcLUNcSqbxfJ8z0Qs1ft
	t6azvPDP5NfOeMZuX+Q4Ebfb8egrW4bnkAMML4i0yheD7WPOnX3EUqka5WOfGHWNx7sU
	Z41msNKRXTZQfVgE56BK8jzouFp1xSmVacHkETI5t44vdYHq3ZEiZ4XZHJtvNXNkMD3n
	yWLsa9n1ZDuIInNcsQ9k4VSmfm1TAvXBZhZ3OCmeHs6YzSMwfbdebsZgPUMVZkaVP4Jm
	qMhg==
X-Gm-Message-State: APjAAAUAsHUNQJ6S4ch8M0kT6BwvrJ8BRhpEgiULuoAYkNZaXZnJT3sw
	1Jy8K9KFwCeOTk1QDE4gwW3g03i08B2PWAwMwKo=
X-Google-Smtp-Source: APXvYqzOaUKwy+8WCDc6TZRX5FYkOBClOpUmF613QXBX9g1W6V4FiuPVcqiIVWBQoW46wygVFaHO5P02sWeXJOQlwxs=
X-Received: by 2002:a0c:fe69:: with SMTP id b9mr3299572qvv.206.1574266320080; 
	Wed, 20 Nov 2019 08:12:00 -0800 (PST)
MIME-Version: 1.0
References: <20191119154539.22200-1-pdmorrow@gmail.com>
	<CAMKF1sqkHJK9gv-=TrCV=HSTwbdS7WC1G6jSReVxQtj_ZHyZuA@mail.gmail.com>
	<CAFcZKTyvjHeoJHDN_wj0M0bSRt9ns6ZgM7Yj6FWncH-qs5TTig@mail.gmail.com>
In-Reply-To: <CAFcZKTyvjHeoJHDN_wj0M0bSRt9ns6ZgM7Yj6FWncH-qs5TTig@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Nov 2019 08:11:33 -0800
Message-ID: <CAMKF1spy56crTMXsqDodLjqn7=BzOqmZtMGAGrsP+M+yChr9Fg@mail.gmail.com>
To: Peter Morrow <pdmorrow@gmail.com>
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
X-List-Received-Date: Wed, 20 Nov 2019 16:12:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 20, 2019 at 8:03 AM Peter Morrow <pdmorrow@gmail.com> wrote:
>
> On Wed, 20 Nov 2019 at 14:39, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Tue, Nov 19, 2019 at 7:46 AM <pdmorrow@gmail.com> wrote:
> > >
> > > From: Peter Morrow <peter.morrow@microsoft.com>
> > >
> > > Any systemd service which needs to wait on ntp synchronization before
> > > starting can order themselves after chrony-wait.service.  It's useful
> > > to install this service as part of the recipe as it saves needing to
> > > install it via a bbappend file.  Note that even if the service is
> > > installed no start up delay is introduced unless another service
> > > orders itself after the systemd target time-sync.target.
> > >
> > > Signed-off-by: Peter Morrow <peter.morrow@microsoft.com>
> > > ---
> > >  meta-networking/recipes-support/chrony/chrony_3.5.bb | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/meta-networking/recipes-support/chrony/chrony_3.5.bb b/meta-networking/recipes-support/chrony/chrony_3.5.bb
> > > index 7c6356d26..fa11c443e 100644
> > > --- a/meta-networking/recipes-support/chrony/chrony_3.5.bb
> > > +++ b/meta-networking/recipes-support/chrony/chrony_3.5.bb
> > > @@ -103,6 +103,9 @@ do_install() {
> > >      install -d ${D}${systemd_unitdir}/system
> > >      install -m 0644 ${S}/examples/chronyd.service ${D}${systemd_unitdir}/system/
> > >
> > > +    # systemd chronyd synchronization unit configuration file
> > > +    install -m 0644 ${S}/examples/chrony-wait.service ${D}${systemd_unitdir}/system/
> > > +
> >
> > thiis needs to be packages as well something like
> >
> > FILES_${PN} = "${systemd_unitdir}/system/"
>
> Thanks Khem.  Strange my build did not show this up, I'll do some more
> testing and re-submit.

I also wonder, how this was tested as well if it never showed up on
image. Please describe the testing part as well.

>
> > > +
> > >      # Variable data (for drift and/or rtc file)
> > >      install -d ${D}${localstatedir}/lib/chrony
> > >
> > > --
> > > 2.20.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

