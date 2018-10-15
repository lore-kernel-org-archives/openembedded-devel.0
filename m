Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7E54671BF9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 10:43:13 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id 23-v6so8971806pgc.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 03:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XFfp65hLwP1lurYom5+JLxJTnJu6YkoBzFokHdhc0vg=;
	b=PZIVMrWfx8NbYaBpj3NTQdRdwptZfxgkM36Zx0bm4R9ScD5G/cY1Sib4qlpyD7ODKt
	dsHsdDueRwj7QKTi/8gTRJ0WRppw9ysjrVt/EvbBt6NyLfUSpyF5s16HONnze2eQx3X5
	DhmDFh5f2d8ZHbxxG7XIkS/19atUPxcAM+2gdJph/qWdFRQi//VGQ9cAluN0Z/r/5tRH
	JnbijHa7Tm9UhRVahzVTmqhtTTxPs7y3mt6nYQE7FPBIedC38YviKT6jbwX8iETYDBOe
	iiZBrPJLjaPvAmCOEZpV1NLOADmfxdOUaoXV+k0OjFyg83RDvQQoDv6m66wzvNy8GRFZ
	b9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XFfp65hLwP1lurYom5+JLxJTnJu6YkoBzFokHdhc0vg=;
	b=clafYp2t7PTPxNod9Dv8XB20oMWSCp6ZaEonLd5fsuS2sZRiQpmWk7IV1ALFNfTnX5
	auUk/QMHI/E18jpONVyfQyH0ex+QjHIZEASko9x+yEpP07LEX5hvukTiIynGaRqQQnUg
	UufFMk5Hzpi1SRUnzpZ3OkvOvNDPiRJw3xJTQ828bDTo+etGyUdLZADj/OZZp12VOjSw
	53KFaNfVFynsXCUKpzlrFOBUfTaVWigWHI31T0M+HJ/qOlaXnIwMQg43gU4UXeSp1bZw
	Zik/RvJQXLuyj2EskoUpV+GYBKCiwJ1Rr4WjA9pk79LUu1dPuf1rgHLYT0HfF3XB8Gtd
	1a9g==
X-Gm-Message-State: ABuFfogQkdWkDGNb/Q7IB1hQpH2MiS2r8LFXbno4JVMYu6IFB8HAHmGh
	d0L3FpXhOZWv/446sGhcXdbCmI33a0H/aNTZDUc=
X-Google-Smtp-Source: ACcGV62eU7Vc8amkecfZBOWDEBRHKkvetoe7K9pCwOMQxll60uI/WruY/xAF4oLQnKRUSaPgV/n87L53R/dojpH4BbI=
X-Received: by 2002:a63:88c1:: with SMTP id
	l184-v6mr15260444pgd.431.1539600194353; 
	Mon, 15 Oct 2018 03:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <1538581223-13647-1-git-send-email-ankit.tarot@gmail.com>
	<b0446aaa-3f8a-54c1-539f-887f671b9cb5@gmail.com>
	<CAM_RqkOLurOJ7DSHwAeQ3OzXE4u-mVGDE02Vc5izuRgRU=SXEg@mail.gmail.com>
	<CAMKF1spEdZOse-9yh6f3ia+evHJ_+6OJni+FePF_jEDSXvE4vg@mail.gmail.com>
	<20181015031245.GB7186@denix.org>
In-Reply-To: <20181015031245.GB7186@denix.org>
From: Ankit Navik <ankit.tarot@gmail.com>
Date: Mon, 15 Oct 2018 16:13:03 +0530
Message-ID: <CAM_RqkPb0pFu57guB7gL5NLni-+pvdwqyLS2vL1rB8-q8Jbimg@mail.gmail.com>
To: denis@denix.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] opencl-headers: Initial recipe for OpenCL headers
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
X-List-Received-Date: Mon, 15 Oct 2018 10:43:13 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Denis,
On Mon, Oct 15, 2018 at 8:42 AM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Sun, Oct 14, 2018 at 11:29:26AM -0700, Khem Raj wrote:
> > On Sat, Oct 6, 2018 at 1:49 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
> > >
> > > Hi Armin,
> > >
> > > On Thu, Oct 4, 2018 at 4:40 AM akuster808 <akuster808@gmail.com> wrote:
> > > >
> > > >
> > > >
> > > > On 10/03/2018 08:40 AM, Ankit Navik wrote:
> > > > > Add generic recipe for OpenCL API headers.
> > > > >
> > > > > Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> > > > > ---
> > > > >  .../recipes-core/opencl-headers/opencl-headers_git.bb | 19 +++++++++++++++++++
> > > > >  1 file changed, 19 insertions(+)
> > > > >  create mode 100644 meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
> > > > >
> > > > > diff --git a/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
> > > > > new file mode 100644
> > > > > index 0000000..16bc247
> > > > > --- /dev/null
> > > > > +++ b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
> > > > > @@ -0,0 +1,19 @@
> > > > > +SUMMARY  = "OpenCL API Headers"
> > > > > +DESCRIPTION = "OpenCL compute API headers from Khronos Group"
> > > > > +LICENSE  = "CLOSED"
> > > > There is a license file at the repo. Would adding a "Khronos" license be
> > > > more appropriate?
> > > >
> > > > https://github.com/KhronosGroup/OpenCL-Headers/blob/master/LICENSE
> > > >
> > > > - armin
> > >
> > > I have tried adding "Khronos", but it was throwing QA error for
> > > license. Hence kept it as closed.
> > > Any other suggestion for license ?
> > >
> >
> > Please add a template for this license into meta-oe/licenses and then
> > reference it in relevant recipes.
> >
> > > Regards, Ankit
> > > >
> > > > > +LIC_FILES_CHKSUM = "file://CL/opencl.h;beginline=1;endline=27;md5=687394644e8c4ec4fd3d77f2f86bc042"
> > > > > +SECTION = "base"
> > > > > +
> > > > > +S = "${WORKDIR}/git"
> > > > > +SRCREV = "40c5d226c7c0706f0176884e9b94b3886679c983"
> > > > > +SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git"
> > > > > +
> > > > > +do_configure[noexec] = "1"
> > > > > +do_compile[noexec] = "1"
> > > > > +
> > > > > +do_install () {
> > > > > +     install -d ${D}${includedir}/CL/
> > > > > +     for f in ${S}/CL/*.h; do
> > > > > +             install -m 0644 $f ${D}${includedir}/CL/
>
> Single file install? Not very optimized...
Its not a single file, Installing all the header files.

Regards, Ankit
>
>
> > > > > +     done
> > > > > +}
> > > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

