Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9AEED7F8AC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 13:46:46 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id t5so5705312ilh.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 06:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=KPYKnSIvLraABK3+vLH4WMMi3NGojVp4gjDW8oFyW7w=;
	b=BxOfxKgzXmNCGMMrZF9EGkH7QUNBQw67xw9fYc3C2l27kSwqLVJhiZHXiE4Bb9N3JJ
	Qhzg9KNuVjCcT4p66NUw8pWBXtDw16UsTDuSMGMpaohrsBzzGDAK9ciHx4EU+G5optUE
	MkokqqYZ47DjynR5LloL0mVt+bcEyaez8DqjO4tMYtne17PfUnutJrns14XxOeh95C+h
	pveBqvIpcw2pVn7yww3ubA3Flp5aQKUIUvck+0k3i1K3lpfCjC7KHIEa0z9Qzora6Z7T
	fN+1BelsfkaYoq17Cai95PzmKJLxfSU/yhGW7fY8SXo1GcgyQDIsM1tgvJg0lFt+bybL
	yJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=KPYKnSIvLraABK3+vLH4WMMi3NGojVp4gjDW8oFyW7w=;
	b=hDUGqvDNxuu3acBMq2XsRgytVqvESE/8x06JD93VuwRNTAV3YdFOc8xiVoAkeLHYz9
	Fjg11IClhQPFiczlN/yV4rBdqY2JUWPWBLi223aEzrhjpd1k2gOxywKoDATWBRjEGNuc
	yqHZcPGNUZyTPAWWrxC3wAl6mEyfB0dv7B5IsyJ0/kt0v29Bbe3v85uA2uNuyAhLwdTI
	yjfIYsBGazE30cEAOX4kEF9Iqpqdns8l82KCp7JzoQTIkx3o40SozEbkJDVoISjNYVmF
	CdacAte3QYn5EBm6DnUpB/qoZQxsjowlHwpO2FlNC83MG72V30HdnuXtpA/UmLxuDG4R
	uY6Q==
X-Gm-Message-State: APjAAAVI8yFj33RiP/f4V2YqWe7uiJaMKNPSXiEe8Qpu3JiluK5+LX5Q
	dIKxss/lVSdcb49fUaRUcOEce2PgY7ZyZtVkm00=
X-Google-Smtp-Source: APXvYqwIqC5/XGZCE7E9HQdbVMq3kpj97zyRzyWVw+nQwshtLAfJAJrOG0YLj1Y3b0RwbGh1/S5NtpQ52UdKvogn6lM=
X-Received: by 2002:a92:9e08:: with SMTP id q8mr16215874ili.108.1572184007619; 
	Sun, 27 Oct 2019 06:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191026093404.19659-1-schnitzeltony@gmail.com>
	<20191026093404.19659-4-schnitzeltony@gmail.com>
	<CAMKF1sqBUTk01=tQ=V6ECnXz5jj6r9ARi1kMyJFL5Xp2-41UjQ@mail.gmail.com>
	<CALbNGRTurd2uh2fvu=eWk2hjeiJpJsQeiYd6zhjaY9r6fgXOyg@mail.gmail.com>
	<CAMKF1so25cP0PuM8nchSyY2JTLQQ3X=5_9nRr73mMXW3Ly92iw@mail.gmail.com>
In-Reply-To: <CAMKF1so25cP0PuM8nchSyY2JTLQQ3X=5_9nRr73mMXW3Ly92iw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sun, 27 Oct 2019 14:46:36 +0100
Message-ID: <CALbNGRQN588w14jTisMKbkbqsHOo2ffp4tnjEWRgfkPNKtfWHg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] zenity: rework recipe
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
X-List-Received-Date: Sun, 27 Oct 2019 13:46:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 27, 2019 at 7:05 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Oct 26, 2019 at 1:10 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > On Sat, Oct 26, 2019 at 11:43 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > I dropped https://patchwork.openembedded.org/patch/166178/ and took
> > > this one. It seems to include those changes as well.
> > >
> > Was not precise enough but that was my intention -thanks
> >
>
> this fails to compile e.g.
>
> https://errors.yoctoproject.org/Errors/Details/274743/
>
Interesting that this pops up now: It is caused by itstool patch [1]
and your build host's env not supporting -S. Will send a fix for in
the V3 series.

[1] http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-sup=
port/itstool/itstool/0001-Don-t-use-build-time-hardcoded-python-binary-path=
.patch

Andreas

