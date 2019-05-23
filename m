Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id DCD077E421
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 09:44:04 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id s20so4314083ioj.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 02:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=cfn1XzGquCI2IBNs0P8P6jH+uCX8rBGaY97GxyYJWBk=;
	b=BktKG5ffMY8ojRfjeKuctjHjz98mg/hEwHKgM3fvhGsl4FhQTgup/BwWIYr26CGoRm
	JeMy6j2HDw6mAGGZv+5FjqVfDS1Z/o3SH2Hzw3Ri4DMn2meUabBQsHUm0onoKeiGKK7S
	Nb7SOAJbK3rTTr90+gdunAUq/ZEEjxgB5mDfuN9zJRjsLVBk9nm1XaNEnh7AnOlN8iJf
	insZrLvUEt69uQ6t0v1jVXrLCPpMZhoLgpdW+nv/ANU6s9XybRhQcXGsuoE8R5sAULtT
	81Tq/4Y8espC9x+e+nYs6/KuOsOKYR8NRgLQ2TvG4zTrkV811mCgVj3Mhm0rb2v8msWJ
	ELpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=cfn1XzGquCI2IBNs0P8P6jH+uCX8rBGaY97GxyYJWBk=;
	b=nxsz2+hbmq2r26igw87J4xlQOQvQpyPUvZJ5j9G8higSFfTiDSodbzCGyCTEeRVdO9
	BOaWhrueWcwRYD95SbQeRoloUbvxn78T8ff8TBAWY1rL8qOV4x91L0rCb+B+3RTLtD0f
	cRzlU0bQZoX+B17zhbZ+/81xm7MBgA3BtqFL9Ia6rwNuQz+8AZlLBKF2DQTT3/co5H0R
	xzTDF2LEVF6NaWY+oMIfl09GiE7k83UqIuoQ5xHoPo5/PHz0+br5jF8v7zpIyrykpkyP
	Lh1Ps67PLxCbM5ZJw1cx2VZfimkArqf27Q1F3loiayiluwPXXsKpoTJ6LAKRaIPTYGP5
	lmGA==
X-Gm-Message-State: APjAAAXLnU/7wi7bap7TVHUeI5y5hAPmHckEAd+nvlJk8sKI8lTLdyuR
	vaET38KBWHB0Lr4+0LfnDQOyZQm6yh49reHYqOY=
X-Google-Smtp-Source: APXvYqzM1JDQHv6NTXRCzUNBiI1yvi5TK2qeYFussdNuQXHqMyVZo2cxaTApLkxGEk+jH5Nn/53yHNR+XIxtlmH4Mdw=
X-Received: by 2002:a5d:9a11:: with SMTP id s17mr28475263iol.267.1558604645943;
	Thu, 23 May 2019 02:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
	<20190523064859.24336-8-schnitzeltony@gmail.com>
	<191e6e9a53294aae82f66761b91f6382@XBOX04.axis.com>
In-Reply-To: <191e6e9a53294aae82f66761b91f6382@XBOX04.axis.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 23 May 2019 11:43:54 +0200
Message-ID: <CALbNGRSfLNCph672ddFLXEYKVzC+t+UzjmYt9FD240qy=YUG0A@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 07/41] gnome-help.bbclass: Handle gnome-help files with new distro feature 'helpfiles'
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
X-List-Received-Date: Thu, 23 May 2019 09:44:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2019 at 10:55 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> > devel-bounces@lists.openembedded.org> On Behalf Of Andreas M=C3=BCller
> > Sent: den 23 maj 2019 08:48
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] [PATCH 07/41] gnome-help.bbclass: Handle gnome-help files
> > with new distro feature 'helpfiles'
> >
> > Gnome help file generation cannot be configured so handle files
> > properly
> >
> > * Add a new distro feature 'helpfiles':
> >    If set: split help file into ${PN}-help-*
> >    If not set: delete help files on installation
> > * Append ${PN}-help-.* to PACKAGES_DYNAMIC
> >
> > Once accepted / applied it takes a on-line patch to add help files base=
d on
>
> I assume you mean "one-line"?
Your assumption is correct :)
>
> > IMAGE_LINGUAS.
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>
> //Peter
>
Andreas

