Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com
	[209.85.161.174])
	by mail.openembedded.org (Postfix) with ESMTP id C3365601F2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jun 2017 08:16:29 +0000 (UTC)
Received: by mail-yw0-f174.google.com with SMTP id e142so11124613ywa.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jun 2017 01:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O3GMbjbCbGxDipLS4NAOFj2nE+VIb15/hkKSCEYMh2w=;
	b=OzXeFsUTdiIVdAizstNzLF6VsMR/dCB51oFdLnEH0HjGPpvUDMpOzlGBzpLCqzoBVS
	vtYAzH9pLbvF3RJ1JujdfpMub5AaM1R1d3AwvI8X+mvOkLTjLwPCkdEHZPH6ZP1Dv0Fj
	nmPt5p9MZpnMj+059C+uKoxLNLpSulsDJnDdfKuVoQkzhE5QRqG4yDaY00ovUFd2nhxv
	WG2m4Q56y5ZBo6K1hLkU8hZS4keSDyWerzD1WtWlQyRz7ydTlMizxf2olHfWjdAfmrkH
	HB5q7vwTPst91QhS0Xr4cYALYX2i1FCk8fw7ZWjx5lexxVk6NczP2RCREZCKRjUEcEiN
	LUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O3GMbjbCbGxDipLS4NAOFj2nE+VIb15/hkKSCEYMh2w=;
	b=EQ8+lEKuMiPZxZA4MvSMHsbPfYh1iKr85wOIc1P+RgNjDPqy+zxE8PTvwav97KVJ0F
	v53PXF+Vta4TB7f0OXZfmPNGKbDnnE3ZVqpDQAhACayEyJxqmM6QyF/02Nobf4EsgZu7
	9GztilyYnmIJHR6bNqID6rTyeZGvFSZLGh3eiJmhMjoPCxlt27aRh7IIGYHweh0dmK6p
	oAjGDMZPId3Sednh41u0EqbNJ80X5prQuKy35vCofcjb9uo9+cDODi6OwpKoMn7zgQxY
	O1eiPXKidk2JyxQCkAbF8ir30lJ5FSNB4bFnp1F61gcw4vpNQjSs5gShw+rGP1aIHKxY
	MP7g==
X-Gm-Message-State: AODbwcDKh6L7TU+F7ap++FKprM2QJP+pea9djORL58RUW9XHch/dHL6G
	8Va9ufFi/pUFOcno3esBrajrOj2o2g==
X-Received: by 10.129.37.11 with SMTP id l11mr11264347ywl.2.1496996190600;
	Fri, 09 Jun 2017 01:16:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Fri, 9 Jun 2017 01:16:30 -0700 (PDT)
In-Reply-To: <CABXoSoWZBLfn4K2DcHED90U3Bvcj8GRLX9Qa5XL844hZB0+Tzg@mail.gmail.com>
References: <1496925018-5300-1-git-send-email-samuli.piippo@qt.io>
	<91dc3ff5-ad3a-ff4c-163a-4b82bb721422@gmail.com>
	<CA+chaQe9JFMTrZ8HcOPyVqj7VDvg4N_8VKGRf3X3vDuwC37f8w@mail.gmail.com>
	<CA+chaQe=8hRDdymjoqn0wRo03XUF0cTdvNiLQTUuvqzLsL2Q2w@mail.gmail.com>
	<CABXoSoWZBLfn4K2DcHED90U3Bvcj8GRLX9Qa5XL844hZB0+Tzg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 9 Jun 2017 10:16:30 +0200
Message-ID: <CA+chaQc8V+tVZ4g+B7CAeR49wbDgs4+Uo+B++8ieKgG8HA4Zig@mail.gmail.com>
To: Samuli Piippo <samuli.piippo@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v3] Upgrade to Qt 5.9.0
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
X-List-Received-Date: Fri, 09 Jun 2017 08:16:29 -0000
Content-Type: text/plain; charset="UTF-8"

Then why does it work for chromium which used to have the same issue?

On Fri, Jun 9, 2017 at 7:15 AM, Samuli Piippo <samuli.piippo@gmail.com>
wrote:

> That's done on purpose, the tools are built with same bitness as the
> target.
> This is why you need to have gcc-multilib available on the build host.
>
> On Thu, Jun 8, 2017 at 10:50 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > Still passes incorrect -m32 when building host tools on 64bit when the
> > target is 32bit e.g. qemux86
> >
> > http://errors.yoctoproject.org/Errors/Details/144181/
> >
> > On Thu, Jun 8, 2017 at 2:53 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >>
> >> Thanks, will include v3 in next build.
> >>
> >> Full report with v2 included:
> >>
> >> http://lists.openembedded.org/pipermail/openembedded-devel/
> 2017-June/113073.html
> >>
> >> There is another issue in qtwebview, which should have the same
> >> restriction as qtwebengine otherwise for qemuarm it causes:
> >>
> >>     * ERROR: Nothing PROVIDES 'qtwebengine' (but
> >> /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/q
> twebview_git.bb
> >> DEPENDS on or otherwise requires it)
> >>     * ERROR: qtwebengine was skipped: incompatible with machine qemuarm
> >> (not in COMPATIBLE_MACHINE)
> >>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable
> >> providers.
> >>
> >>
> >>
> >> On Thu, Jun 8, 2017 at 2:47 PM, Samuli Piippo <samuli.piippo@gmail.com>
> >> wrote:
> >>>
> >>> Patch updated to fix build issues with qtlocation and qtremoteobjects
> >>>
> >>> On 08.06.2017 15:30, Samuli Piippo wrote:
> >>>>
> >>>> * adapt QtWebEngine recipe to use GN instead of GYP
> >>>> * add QtRemoteObjects and QtWebView as a new Qt modules
> >>>> * update available QtBase configure arguments
> >>>> * remove obsolete patches
> >>>> * patch all .pc files to remove build paths
> >>>> * include generated QML cache files in packages
> >>>> * the patch "configure paths for target qmake properly" could not
> >>>>    be applied anymore and support must be done differently
> >>>>
> >>>> * QtWebEngine now requires gcc-multilib to be installed
> >>>>    on the host system
> >>>>
> >>>> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> >>>> ---
> >>>
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >>
> >
>

