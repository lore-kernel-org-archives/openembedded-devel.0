Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 216BD6C1D5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 17:35:03 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id u12so10960284iop.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 10:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yAtWCr20xehEJTQkTtU7Z6dIO0sfN5dpWQHsn1LOZgQ=;
	b=SeZZFntZR4Rnpbd3jCK2EvwyV7bcLDHLdig65PDJynL/DVIupiKK+ZJeDNy00u8yIJ
	ZkYb+7buPDuN3O9cJLqgdnVvigZTf7IaJ1UbRfEFcihx4v30blgh0f1Mxd3TYhJLGXge
	gbDHkKdHJ3beStpkhcTLuOLg29XXCq+oI2VLsizz61Lm+DbtjCY2VTNUWLankp1j6Gg/
	ehrsVCVIbKcOfK5sEJYnqapuCQmYaxiRbBoiEj9+794KrfFm7dpR2QOLIY2DObsDDicI
	8d+5Crljb2pE703SUG06cFcA5owDhYyovlrWOfFm8aPa1fpEHI1jci9XBrq2+dCdHRlP
	C5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yAtWCr20xehEJTQkTtU7Z6dIO0sfN5dpWQHsn1LOZgQ=;
	b=bQrzxFYTFEAcuq00nH3R03od/S3BMbUWsVCxe+NR1rLCqgTKcg0t6ydfEfxWF9yDoh
	tie8v9raIPleAEb4a5Sui9/JPpe4ptoGBIG+fe2LmBORJlIT0AI6zpoY1/kwrXN9//sv
	wKrlK/q4FJwKRAXG2cNAC0rmUZbUHtbzQS60EEaOR/7jaZqsF5TsI2OO172bgdNRSC0S
	f8EXuVGTHkOXEiqm18stcsNfywX7BqOs19+c8MN1zugxEHOWrcg7cLTo+mPH+m/Cu6MI
	o2LkTNBcnTCvYXIptkM9YUx+KJjujO8D+ePw3aqG19bO4WYMK8NF8wdfwapVuR1FG1BO
	3f5Q==
X-Gm-Message-State: APjAAAWZI6xSXW+I8qO4TJJHjDHlgQYUQXWRrAK2KN8XRaOLUqPyQsW+
	YyhimLqfC58rcGvgy3+WMQhlGZ/panyyp5+eM8w=
X-Google-Smtp-Source: APXvYqwGsRtZBxNqcEWYku433qHF6RRa+qvS+cPdvAZilrwf/1feOGutyyfxzq+GebWjPko9feeB5ExVJy0YlUVBs4o=
X-Received: by 2002:a5d:8d92:: with SMTP id b18mr5702728ioj.272.1552757704028; 
	Sat, 16 Mar 2019 10:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190316080428.36688-1-raj.khem@gmail.com>
	<CALbNGRQwWcwBjXPmtusLirywo=Tw2gV40PFDxCF6Kn8ZkS5F1A@mail.gmail.com>
	<CALbNGRRz4k-xRCBSOOF1PsoJ1p_porgc7kKcOoW4ctXCD9HFvg@mail.gmail.com>
	<CAMKF1spX7gfga6kz6mzigtLwv4nMOfhHtNRBeM_b9XU1kmeD4Q@mail.gmail.com>
In-Reply-To: <CAMKF1spX7gfga6kz6mzigtLwv4nMOfhHtNRBeM_b9XU1kmeD4Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 16 Mar 2019 18:34:52 +0100
Message-ID: <CALbNGRRm1JTNQqwrKkS2i+mrTWPxvPJRJRiw=ZF7R4XPtwdv0Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-mixer: Remove recipe
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
X-List-Received-Date: Sat, 16 Mar 2019 17:35:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 16, 2019 at 5:55 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Mar 16, 2019 at 2:32 AM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > On Sat, Mar 16, 2019 at 10:09 AM Andreas M=C3=BCller <schnitzeltony@gma=
il.com> wrote:
> > >
> > > On Sat, Mar 16, 2019 at 9:04 AM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > xfce4-mixer can be replaced with xfce4-pulseaudio-plugin
> > > >
> > > NAK - it works perfectly fine and xfce4-pulseaudio-plugin is not a
> > > replacement because it is sitting on top of pulseaudio. Pulseaudio is
> > > poison if you want to produce music (alll the jack based  stuff)
> > >
> > I am tired of useless discussions - seems the priorities of this
> > project do not match mine anymore: I'll create a layer for gstreamer /
> > xfce-mixer and all the music stuff I collected in meta-qt5-extra.
> >
> There is a reason why I Cc'ed you on the patches and that is to
> consider your priorities on the contrary.
> Adrian summed it up, but the motivation was to remove gstreamer 0.10
> and this is only recipe which require it, so I was wondering if there was
> a better way to deal with it, e.g. may be xfc4-mixer has  support for
> gstreamer 1.x or some such. as gst 0.10.x get aged, it is often that
> it
> has to be fixed to keep going as we change things like compiler verisons
> adding new architectures which don't support it etc.
Problem with xfce4-mixer is that it uses the mixer interface which was
removed in gstreamer 1.0 [1]. I would like to port xfce4-mixer to use
alsa directly but did not find enough time yet.

For oe: I have created a layer meta-musicians (not published yet)
where I added xfce-mixer together with a very reduced set of gstreamer
0.10 and much stuff from meta-qt5-extra because that layer grew too
big over the time.

So I'm fine - no problem in removing.

[1] https://simon.shimmerproject.org/2016/10/

Andreas

