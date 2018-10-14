Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 87561745AC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Oct 2018 18:29:51 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id q40-v6so19190842qte.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Oct 2018 11:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0LOVWasgWsqILoDw618tF1nut6PjLno1yd2S9SSyGF8=;
	b=Ry4SJGIO9RvDDnM9qviirkkhl4Mz36pJPLHY05Gbu5JrI1ikv6HaONVvYU0RasRLXv
	7aZnPll+LjfiInQovdp7ZH/Q80Wiv+Wd3hjQOnBTNng4rMukBa36XOXBXHRZDimO7Lz+
	oomL8zSieOuDUWICi5XWMW86CPEnjRnBowcIvGn2sykwg55MV0tpMzzovDv89ZU108FH
	nhfTAq/5C0UN4oOBZNwndJLuQL4/lGlr8DFp4ukZvym6skohHSTf5YgapfAZxbgmHEDg
	tkB1+oe9hUNdBQd4nsJQws4hkPWKVAuRnxTNKlxKF1iOJEObRsfwZNbPIKLsVAAYv4ZD
	Pgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0LOVWasgWsqILoDw618tF1nut6PjLno1yd2S9SSyGF8=;
	b=m4jNsccxW6CuoAqCvfit1iBlEcb7347/4SvOvuoBaHBgAOvxYcVCujKCS4hpg0PZgk
	WDiU4ZSYt4yTFt+Ju2y2fFRcT3UbJKHkIPGo/EFxBcGmxkUD6v8/zymhpVcwn6Ee48X2
	6mZYWXOzWsDCHo0dhApZAAfdxsOxN0mcigV2f+3kKzcD6b2wQEuuGCiz1AIb6nMPnDQV
	6s9F4vlsYOmhygBid7SWajh1u4X4M/dr5Im4JBf+gFeHXGh+6HmPL9fZionNay3vzfua
	PxUn3BzdVE4jr7lc/aI9t344sUe4hzVOL3qOdzKPpczV5mKuD0sGIDyIZzuDyqmjdPfI
	t7+g==
X-Gm-Message-State: ABuFfoggHMzNbjJAQwPKmHthNEqpKxJEfYD1OHF1+ItQT+yWcpZSbUJ2
	qStvARUwugGEgv/qxhUxYLv8wRWU9lcIiwUh5xY=
X-Google-Smtp-Source: ACcGV62Z8J7Vrgk2N7227ESOg9O+5pEzCx2hFEw0m7mD4vE/KvcattJ9oOdhfsvM4lS1GhIRnZtddHBWWmoafIqeCZc=
X-Received: by 2002:ac8:36bd:: with SMTP id
	a58-v6mr13128597qtc.236.1539541792228; 
	Sun, 14 Oct 2018 11:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <1538581223-13647-1-git-send-email-ankit.tarot@gmail.com>
	<b0446aaa-3f8a-54c1-539f-887f671b9cb5@gmail.com>
	<CAM_RqkOLurOJ7DSHwAeQ3OzXE4u-mVGDE02Vc5izuRgRU=SXEg@mail.gmail.com>
In-Reply-To: <CAM_RqkOLurOJ7DSHwAeQ3OzXE4u-mVGDE02Vc5izuRgRU=SXEg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Oct 2018 11:29:26 -0700
Message-ID: <CAMKF1spEdZOse-9yh6f3ia+evHJ_+6OJni+FePF_jEDSXvE4vg@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Sun, 14 Oct 2018 18:29:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 6, 2018 at 1:49 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
>
> Hi Armin,
>
> On Thu, Oct 4, 2018 at 4:40 AM akuster808 <akuster808@gmail.com> wrote:
> >
> >
> >
> > On 10/03/2018 08:40 AM, Ankit Navik wrote:
> > > Add generic recipe for OpenCL API headers.
> > >
> > > Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> > > ---
> > >  .../recipes-core/opencl-headers/opencl-headers_git.bb | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >  create mode 100644 meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
> > >
> > > diff --git a/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
> > > new file mode 100644
> > > index 0000000..16bc247
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
> > > @@ -0,0 +1,19 @@
> > > +SUMMARY  = "OpenCL API Headers"
> > > +DESCRIPTION = "OpenCL compute API headers from Khronos Group"
> > > +LICENSE  = "CLOSED"
> > There is a license file at the repo. Would adding a "Khronos" license be
> > more appropriate?
> >
> > https://github.com/KhronosGroup/OpenCL-Headers/blob/master/LICENSE
> >
> > - armin
>
> I have tried adding "Khronos", but it was throwing QA error for
> license. Hence kept it as closed.
> Any other suggestion for license ?
>

Please add a template for this license into meta-oe/licenses and then
reference it in relevant recipes.

> Regards, Ankit
> >
> > > +LIC_FILES_CHKSUM = "file://CL/opencl.h;beginline=1;endline=27;md5=687394644e8c4ec4fd3d77f2f86bc042"
> > > +SECTION = "base"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +SRCREV = "40c5d226c7c0706f0176884e9b94b3886679c983"
> > > +SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git"
> > > +
> > > +do_configure[noexec] = "1"
> > > +do_compile[noexec] = "1"
> > > +
> > > +do_install () {
> > > +     install -d ${D}${includedir}/CL/
> > > +     for f in ${S}/CL/*.h; do
> > > +             install -m 0644 $f ${D}${includedir}/CL/
> > > +     done
> > > +}
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

