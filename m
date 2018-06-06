Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 48E1374BBC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 17:13:15 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id p11-v6so13422506wmc.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2018 10:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ODG35Zkv5JSu6fqm16DwPuXHYaI2QC41z8soNLZ7wJQ=;
	b=PNHZoF19bc5fudhbOGLr8YviERbZQRL/4aCt9n9Gt9z60Qe5L5tl1H1cVC2ICJTKWs
	aKyHU4m2oHJlE/YICqs+L0Zpuo1EB+StkrnDqRcosy7PkxH3Ra5VoxaOl8exln2doumF
	0GFTRxoE3L5AX6Vk5a6GH8AxTggG7z6vogH/Kx0S1yAluh4oC1PPn9qDV34hum5m1inE
	rnrHXcTlQK4D5zdMh+LP75deNXX4QYGl32aJvhu6C9Yc3TRWq13uOor7WFD9Xqj/vq0Y
	9OSgy4XmvAMVqywWYpjidj5RmGk3Wb34NPyBL4VNkM+oS4IDsnyY6Qoayq6x5nebfg+f
	W1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ODG35Zkv5JSu6fqm16DwPuXHYaI2QC41z8soNLZ7wJQ=;
	b=lz9de1R2WaBw1werIC5bB+2bcxZTt9t4xfVr9+RhfH+TB8PVRcUrGg5vWmlEmcgzci
	q2s2Af35pgjfVfULSi6IgvUJYK+YEazE5muCpl8hzwcQDniB3LV5KAK850jufy1b1XW7
	q9cE0zJHc/R1tpbFa8k2Dj3PtIO53J/xvyQxspFoACRf/GHlW6Lj0uFHDdA/GuMVMOBa
	UbuBA596IFdrifDI3h2rX8z9evSAvYn6aXSk1prNjbXujkMD3dmJ/FUKu9tdJV+8ehhr
	uL6mnPumb/5/9l2UupVT1UzY31AVlkgUeApbzlVqamjZRNPjz2IRWqh65iapf40xcyAf
	Q0Tg==
X-Gm-Message-State: APt69E2UYcr3n7Dy8pmvBZAH1VufUlmfn19+xdMzq/4iLfZI72xIlgKP
	WItHS+s3djn1ATySidKqsHNeYz1/ttXthBobaJs=
X-Google-Smtp-Source: ADUXVKLTeYu3HBhAEu5xufZh4oA7xVRhVngHriTuzEQ25QcrrbVGu8y38hLvwPD0XhDd0dSgjlEWCKGiYK1SNLX1RFA=
X-Received: by 2002:a1c:8c55:: with SMTP id
	o82-v6mr1099470wmd.60.1528305195912; 
	Wed, 06 Jun 2018 10:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20180604223911.14561-1-schnitzeltony@gmail.com>
	<CALbNGRSg8kYPO6x_jgXtK9Gi1gQDX7v4KbpTWVaWAQCEc=NXSg@mail.gmail.com>
In-Reply-To: <CALbNGRSg8kYPO6x_jgXtK9Gi1gQDX7v4KbpTWVaWAQCEc=NXSg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 6 Jun 2018 19:13:04 +0200
Message-ID: <CA+chaQcz=Ckh2=zSUBi969N-v7dJG-K2F1OXLxtnG8JLUahXYQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtwebkit: do not skip build - use cmake as build system
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
X-List-Received-Date: Wed, 06 Jun 2018 17:13:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Andreas for taking care of this, I was planing to look at it later
and then I forgot about it when I wanted to push first 5.11 recipes.

With gcc8 I see small issue:
http://errors.yoctoproject.org/Errors/Details/179245/

In fedora they just added -fpermissive in:
https://bugzilla.redhat.com/show_bug.cgi?id=3D1582954

Are you interested in fixing it properly? I don't use qtwebkit
anywhere (switched
to qtwebengine long time ago), so I don't mind adding -fpermissive as well.

On Tue, Jun 5, 2018 at 1:23 AM Andreas M=C3=BCller <schnitzeltony@gmail.com=
>
wrote:

> On Tue, Jun 5, 2018 at 12:39 AM, Andreas M=C3=BCller <schnitzeltony@gmail=
.com>
> wrote:
> > log.do_configure says:
> >
> > | The WebKit build was disabled for the following reasons:
> > |     * cross-compilation of QtWebKit with qmake is not supported yet
> > |    * Missing cmake from PATH
> > |    * Using cmake version , but at least cmake 2.8.12 is required to
> build QtWebKit.
> >
> > and build was finished without errors (but surprisingly fast). Looking
> into
> > qtwebkit, it seems they have changed to cmake build system and
> Webkit.pro is
> > just a wrapper for preparing and running cmake.
> >
> > For the transition the packageconfigs were translated as close as
> possible.
> > 'libxcomposite' and 'libxrender' were merged to 'x11' - there is only o=
ne
> > option 'ENABLE_X11_TARGET' available for both.
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  .../0001-Do-not-skip-build-for-cross-compile.patch | 31 +++++++++++++
> >  recipes-qt/qt5/qtwebkit_git.bb                     | 51
> ++++++++++------------
> >  2 files changed, 54 insertions(+), 28 deletions(-)
> >  create mode 100644
> recipes-qt/qt5/qtwebkit/0001-Do-not-skip-build-for-cross-compile.patch
> >
> Cannot see (yet) what's wrong with this patch but now qtquick1 fails with=
:
>
> | error: QGraphicsWebView: No such file or directory
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

