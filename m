Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
	[209.85.167.50])
	by mail.openembedded.org (Postfix) with ESMTP id 388FB7D72B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 20:24:22 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id t30so14105569lfd.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 13:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Vj+HIB/Ti4+7MuIIFA+hC4Ky61mCDFRgJbqFkbjks6A=;
	b=GVMYltssI/p13VtOjy3vznz2rk7IT2xiPaN9nk2ZlBaAlV6e0bIbOD97BdMuAPKvz/
	/LfVsK0W8ZEZqOWZUTgWtBD/yToaBGJBsHYbfKFMBgQLBOAr1g8d2uxQEjW48WapaW5z
	SSRMQJ+yG9VcfIj49HAkjgjfekcACxtzLdKDiAbcUrW8YKx2lrPauN2V1lqrp5wLXLGe
	4UOvPc9WvkmjFqu83HyPRrAnYc3JqCQpXph3/bhX//3lSaXSnk9lEIdtE1kBprSDJeyr
	2fdlkxtqtjXbyy2wrXUwnwcPn8Q+jg/90SdCQMVjX6RYR3uGej8H/buwaal19FOs6VlT
	1XCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Vj+HIB/Ti4+7MuIIFA+hC4Ky61mCDFRgJbqFkbjks6A=;
	b=V9rtkf8f7UiSA/YFWNoyRSTBT08iOlhp9dljnUyIMZDo51Lmj4D/ly6S2bY4UzgoBv
	tURqEIdjqXWweNXUJQRJbSpdwiBDB2h0N3hR0PsgqM6D1GtwacyGGXGusKBPX/oTvg5S
	vc7IsOfwhLs18EjeKcO0vMwte+D0cTraamjf3ptQQtInH8MBrWZX0BE4VpXEh2Oc0BAd
	ZAqvVlqhFV/urs50kLKfDNgx3hJOOtOkrlRYj9jVyn/G1Kv/4bIgWN18LhG1hZYnvsqG
	xr83DDPsCMyiKfuYhSDFrfL8vyke2tzzXz4wYb1+5hFy0IQenmctBvzHuOn57Q0O6F2n
	SAXA==
X-Gm-Message-State: APjAAAUBDdf70T4VprgrXvOK0VQnqJKLAOHLyE4lVCUuzmeYHCtpF6IM
	HvZCIwuJ/8AjvhNuJux79odayXpo6L7KoRjiy8w=
X-Google-Smtp-Source: APXvYqzNHggtdAEWtUXhLT2SEWkMExsBtpbIGY+aG6zfINISfVMge3i4OTmxi0b76V8Jvxk2PqSaaFgioqzFn3Tt6F0=
X-Received: by 2002:ac2:528e:: with SMTP id q14mr552251lfm.83.1555359862722;
	Mon, 15 Apr 2019 13:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190415185146.14189-1-alistair.francis@wdc.com>
	<CAMKF1sqhZc8Y9KMPpadR0EgzGkh4bYreo2KOsnFB_ObBkYeNuA@mail.gmail.com>
In-Reply-To: <CAMKF1sqhZc8Y9KMPpadR0EgzGkh4bYreo2KOsnFB_ObBkYeNuA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Apr 2019 13:22:37 -0700
Message-ID: <CAKmqyKOB8OES414EocPqiDJe-TrJ2naiVC7zg2F++Yxp4majqg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Mon, 15 Apr 2019 20:24:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 15, 2019 at 1:00 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Apr 15, 2019 at 11:53 AM Alistair Francis <Alistair.Francis@wdc.com>
> wrote:
>
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  .../recipes-multimedia/mycroft/files/mycroft.service         | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git
> > a/meta-multimedia/recipes-multimedia/mycroft/files/mycroft.service
> > b/meta-multimedia/recipes-multimedia/mycroft/files/mycroft.service
> > index 04cf43620..28729f6b1 100644
> > --- a/meta-multimedia/recipes-multimedia/mycroft/files/mycroft.service
> > +++ b/meta-multimedia/recipes-multimedia/mycroft/files/mycroft.service
> > @@ -1,10 +1,11 @@
> >  [Unit]
> >  Description=Mycroft
> > -DefaultDependencies=no
> > -After=mycroft-setup
> > +RequiresMountsFor=/var
>
>
> Does this mean it should be a separate mount point

I'm not sure what you mean. We just need to ensure that /var is
accessible before starting.

Alistair

>
> >
> > +After=mycroft-setup.service
> >
> >  [Service]
> >  Type=forking
> > +WorkingDirectory=@LIBDIR@/mycroft
> >  ExecStartPre=mkdir -p /var/log/mycroft
> >  ExecStart=@LIBDIR@/mycroft/start-mycroft.sh all
> >  ExecStop=@LIBDIR@/mycroft/stop-mycroft.sh all
> > --
> > 2.21.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

