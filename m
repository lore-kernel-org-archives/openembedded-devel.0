Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 104127D736
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 20:58:51 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id z16so20908061qtn.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 13:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4ZBF3KMrXI2tOxHAYXNhMfUWfxipF5LZYHHs9feAZMk=;
	b=KSjWiBe88P1vNivJPjWi46iwt59C/+f9lMFMZ2EjxkK4pivb8oROwohGmfnEfmzUC4
	nOH7BsESB4pX31Mj0Prd7c6SbVYDQ4aHDFdgChqVmHzQJDF3Xcah3njDERTlG8Vk3p+i
	JFKbBtv+s4EpxFWy0d7M73juQ3zEcaABB5hi3LFE5bFcN/MDPl6YZRWu5dZ9aDbf4vSf
	ONvsJyr13I1lvTPUyLswVbjAoB+r2pUQTYAdceY1KJIHKRUs08e8nVfC16rrDlxmGQbW
	toO9zXl2h6jQsdTWosatyLo0XUhdJ3Fhtt7Nq5O/hHPa5iS2yJNNSv72S1dijlk3mpNW
	UGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4ZBF3KMrXI2tOxHAYXNhMfUWfxipF5LZYHHs9feAZMk=;
	b=Kl1nxEj2tGsi3WH9Ggo5yjqPUdaZx6nnpiWd7RuMpSzA5KbtWzzZNUDhRXFKmXPCA/
	kglo+VndYr8/pY3sbvKikiQ1ETxCpBvIbi7KTaSJSyFxa3UyKkaaEqiIjADTkK2TicPN
	2eY6dskZhCrpLCbLPHZi/1B/6c1rH9+rSm88zVB7/fk+bi4kgpcF8B4WUGoSlIaII8TD
	Rt/wy346mxkVMKcsSz3KzRnXIXEFXLttT2BksEjY8wbINUu69OXFIpO2DpSw8sO8CBKT
	vZmfF7SBP9PsnjyuFeCvBDoRFR0u9Llguytl6Q5g9X2RHUtoGif5iW/UR5pndD8cCyr0
	yQxQ==
X-Gm-Message-State: APjAAAUQXCZAL+dfiFnPx1N7eSyzKknx28LjfI8nd4kRfUeYpyx0ze2U
	S5HaYb+D/jVY0KntB8MV+u4F4amdN4GM6s9MCIU=
X-Google-Smtp-Source: APXvYqx9OWSLUKejup07njuGg45vzfqDXeRAobALwgqCeVmmJK7sqI+uo0wXpH5gEZ79n8hA5QPeMB7JQlEuQhDVKbo=
X-Received: by 2002:ac8:1833:: with SMTP id q48mr62200769qtj.133.1555361932692;
	Mon, 15 Apr 2019 13:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190415185146.14189-1-alistair.francis@wdc.com>
	<CAMKF1sqhZc8Y9KMPpadR0EgzGkh4bYreo2KOsnFB_ObBkYeNuA@mail.gmail.com>
	<CAKmqyKOB8OES414EocPqiDJe-TrJ2naiVC7zg2F++Yxp4majqg@mail.gmail.com>
In-Reply-To: <CAKmqyKOB8OES414EocPqiDJe-TrJ2naiVC7zg2F++Yxp4majqg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Apr 2019 13:58:26 -0700
Message-ID: <CAMKF1spRnYjN5grriwuWB0oxZQ87j3uS+6AA9WipSQDjRe=m2g@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH 1/2] mycroft: Update the systemd service to ensure we are ready to start
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
X-List-Received-Date: Mon, 15 Apr 2019 20:58:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 15, 2019 at 1:24 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Mon, Apr 15, 2019 at 1:00 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Mon, Apr 15, 2019 at 11:53 AM Alistair Francis <Alistair.Francis@wdc.com>
> > wrote:
> >
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  .../recipes-multimedia/mycroft/files/mycroft.service         | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git
> > > a/meta-multimedia/recipes-multimedia/mycroft/files/mycroft.service
> > > b/meta-multimedia/recipes-multimedia/mycroft/files/mycroft.service
> > > index 04cf43620..28729f6b1 100644
> > > --- a/meta-multimedia/recipes-multimedia/mycroft/files/mycroft.service
> > > +++ b/meta-multimedia/recipes-multimedia/mycroft/files/mycroft.service
> > > @@ -1,10 +1,11 @@
> > >  [Unit]
> > >  Description=Mycroft
> > > -DefaultDependencies=no
> > > -After=mycroft-setup
> > > +RequiresMountsFor=/var
> >
> >
> > Does this mean it should be a separate mount point
>
> I'm not sure what you mean. We just need to ensure that /var is
> accessible before starting.
>

I guess, I found it for myself that all mount units required to access
the specified path will be added to After= and Requires=
field. So this would work in cases where /var is a separate mount or
simply a directory under / so this seems to be fine.

> Alistair
>
> >
> > >
> > > +After=mycroft-setup.service
> > >
> > >  [Service]
> > >  Type=forking
> > > +WorkingDirectory=@LIBDIR@/mycroft
> > >  ExecStartPre=mkdir -p /var/log/mycroft
> > >  ExecStart=@LIBDIR@/mycroft/start-mycroft.sh all
> > >  ExecStop=@LIBDIR@/mycroft/stop-mycroft.sh all
> > > --
> > > 2.21.0
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

