Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2779A745A3
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 14:17:57 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id o15-v6so1986386qtk.6
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6K4leVlxuZDJMl5BOoLoSR/PVUPyZgB30Bht2LNrDZ8=;
	b=MNfqpic8SD/HcZ+zMjFXumthWbwtOYfklCF5j54AWGycz3a/L2mFZ1333QpRmpJroJ
	AFtI6hrHKjY5aWKGBtlMAXDCZT1HCxA4Goi06U80KfOK6LHuYWOGQIUS9tm4FYC2aT1H
	h6VzF4sElaFvMMrt20wO5hQnH5sSkFLiXyDTChhZxUsxQDZ6Vrqurs0U9JIgn93DSGq5
	u+I+v0121bbCcdTiOk8y+8T/wasJ5osE5rlkbRReQv6ASEfB5dtQKs7DGEQ/6unOpEqd
	JmosWE8Rf9rTvwRqZhS8nLq0fmFIsfI5kBwI8AzlCp+TbdhVXUqmGQUlCiv123I1bYWY
	s+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6K4leVlxuZDJMl5BOoLoSR/PVUPyZgB30Bht2LNrDZ8=;
	b=snDJ0jYr4ifUN17RzYX5CE8sqU/yDhKWX/i/ZKASgmRHv7M6LD+NBUK+6VbU0sG0/C
	kGEAVW7dGp5muGERlT6ufOpP8HeZ9fnmLfAqPo0TZmFbwkbUQRAFwvD7P5CADUUGhXil
	5+zHYxRYPuTduJAYRjvyL7ygUQsyUDo8gQ7RxC3n9uXMQuEQeD4ysp7ws+LyE3Xq/XTr
	JdR9OLoRO6/ilxGUMdIcsC1h5u3tiAUxtXSR4l/2jcULc3j0rSYazxvuZQsd/j6E7DF1
	r4NXpVs405LF8Uh4qn4X+yTxNYmAqqVRB68QmOK8ypSFudJRmclGfT7PMMa5aTrg5LyM
	m6yg==
X-Gm-Message-State: APzg51Bi6RYJwM6B7ZegemBTES30DQt+vkneXCzETQR/d44ktxEukevZ
	94y0nQw/9BaVEY8CD03tgrXTpE2q7T8Mz/fYIjo=
X-Google-Smtp-Source: ANB0VdaQ9gfTLztX+nzuBY697ZSMQuPmI02l/6MZzOPPwtVE0xOoHhl2puwlp/FlUAucSmC4ojfI4DNk1GmAFohPZBs=
X-Received: by 2002:ac8:6c8:: with SMTP id j8-v6mr1602233qth.314.1536761877866;
	Wed, 12 Sep 2018 07:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1srNXih5E5Jfxzqi1BhUpduwLYYPBgjVKcix60c-JyL-tA@mail.gmail.com>
	<CALbNGRScj8Y5e1ssAfM4dJvEA7KPaMPCrsbBwAET6rL=C=y+QQ@mail.gmail.com>
In-Reply-To: <CALbNGRScj8Y5e1ssAfM4dJvEA7KPaMPCrsbBwAET6rL=C=y+QQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Sep 2018 07:17:30 -0700
Message-ID: <CAMKF1sosPRPTkYXL_=MKw88GQc_stX0Ti_xx0zPGQcWrgs4E=A@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: State of the world, 2018-09-11
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
X-List-Received-Date: Wed, 12 Sep 2018 14:17:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 12, 2018 at 1:00 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Wed, Sep 12, 2018 at 7:34 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >
> > =3D=3D Number of issues - stats =3D=3D
> > {| class=3D'wikitable'
> > !|Date     !!colspan=3D'4'|Failed tasks    !!|Signatures
> > !!colspan=3D'15'|QA !!Comment
> > |-
> > || ||qemuarm ||qemuarm64 ||qemux86 ||qemux86_64 ||all
> > ||already-stripped ||libdir ||textrel ||build-deps ||file-rdeps
> > ||version-going-backwards ||host-user-contaminated
> > ||installed-vs-shipped ||unknown-configure-option ||symlink-to-sysroot
> > ||invalid-pkgconfig ||pkgname ||ldflags ||compile-host-path
> > ||qa_pseudo ||
> > |-
> > ||2018-09-11 ||6 ||3 ||14 ||3 ||0 ||0 ||0 ||6 ||0 ||0 ||32 ||0 ||0 ||1
> > ||0 ||0 ||0 ||0 ||0 ||0 ||
> > |}
> >
> > =3D=3D Failed tasks 2018-09-11 =3D=3D
> >
> > INFO: jenkins-job.sh-1.8.45 Complete log available at
> > http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.report.20180911=
_192508.log
> >
> > =3D=3D=3D common (2) =3D=3D=3D
> >     * sources/meta-96boards/recipes-graphics/wayland/weston_4.%.bbappen=
d
> ^ meta-96boards in world builds - interesting. Yet another graphics
> BLOB / intellectual-property-mania victim?

I build world for non qemu machines as well and this layer has tools
to resize sd-card which works
well on most of SD based images so thats one use of this layer.

