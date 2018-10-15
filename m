Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 05EA3795F7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 19:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0AD7420CEB;
	Mon, 15 Oct 2018 19:00:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 2jouFNR35IzP; Mon, 15 Oct 2018 19:00:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CCF6520CD4;
	Mon, 15 Oct 2018 19:00:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3D857164801; Mon, 15 Oct 2018 15:00:52 -0400 (EDT)
Date: Mon, 15 Oct 2018 15:00:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181015190052.GG7186@denix.org>
References: <1538581223-13647-1-git-send-email-ankit.tarot@gmail.com>
	<b0446aaa-3f8a-54c1-539f-887f671b9cb5@gmail.com>
	<CAM_RqkOLurOJ7DSHwAeQ3OzXE4u-mVGDE02Vc5izuRgRU=SXEg@mail.gmail.com>
	<CAMKF1spEdZOse-9yh6f3ia+evHJ_+6OJni+FePF_jEDSXvE4vg@mail.gmail.com>
	<20181015031245.GB7186@denix.org>
	<CAM_RqkPb0pFu57guB7gL5NLni-+pvdwqyLS2vL1rB8-q8Jbimg@mail.gmail.com>
	<20181015181410.GF7186@denix.org>
	<CAMKF1srW5-fDXbsEsFYS3Dj1AAPCCNfEhVpeYzBod66jaZu=EA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srW5-fDXbsEsFYS3Dj1AAPCCNfEhVpeYzBod66jaZu=EA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Mon, 15 Oct 2018 19:00:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 15, 2018 at 11:19:37AM -0700, Khem Raj wrote:
> On Mon, Oct 15, 2018 at 11:14 AM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > On Mon, Oct 15, 2018 at 04:13:03PM +0530, Ankit Navik wrote:
> > > Hi Denis,
> > > On Mon, Oct 15, 2018 at 8:42 AM Denys Dmytriyenko <denis@denix.org> wrote:
> > > >
> > > > On Sun, Oct 14, 2018 at 11:29:26AM -0700, Khem Raj wrote:
> > > > > On Sat, Oct 6, 2018 at 1:49 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
> > > > > >
> > > > > > Hi Armin,
> > > > > >
> > > > > > On Thu, Oct 4, 2018 at 4:40 AM akuster808 <akuster808@gmail.com> wrote:
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > On 10/03/2018 08:40 AM, Ankit Navik wrote:
> > > > > > > > Add generic recipe for OpenCL API headers.
> > > > > > > >
> > > > > > > > Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> > > > > > > > ---
> > > > > > > >  .../recipes-core/opencl-headers/opencl-headers_git.bb | 19 +++++++++++++++++++
> > > > > > > >  1 file changed, 19 insertions(+)
> > > > > > > >  create mode 100644 meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
> > > > > > > >
> > > > > > > > diff --git a/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
> > > > > > > > new file mode 100644
> > > > > > > > index 0000000..16bc247
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
> > > > > > > > @@ -0,0 +1,19 @@
> > > > > > > > +SUMMARY  = "OpenCL API Headers"
> > > > > > > > +DESCRIPTION = "OpenCL compute API headers from Khronos Group"
> > > > > > > > +LICENSE  = "CLOSED"
> > > > > > > There is a license file at the repo. Would adding a "Khronos" license be
> > > > > > > more appropriate?
> > > > > > >
> > > > > > > https://github.com/KhronosGroup/OpenCL-Headers/blob/master/LICENSE
> > > > > > >
> > > > > > > - armin
> > > > > >
> > > > > > I have tried adding "Khronos", but it was throwing QA error for
> > > > > > license. Hence kept it as closed.
> > > > > > Any other suggestion for license ?
> > > > > >
> > > > >
> > > > > Please add a template for this license into meta-oe/licenses and then
> > > > > reference it in relevant recipes.
> > > > >
> > > > > > Regards, Ankit
> > > > > > >
> > > > > > > > +LIC_FILES_CHKSUM = "file://CL/opencl.h;beginline=1;endline=27;md5=687394644e8c4ec4fd3d77f2f86bc042"
> > > > > > > > +SECTION = "base"
> > > > > > > > +
> > > > > > > > +S = "${WORKDIR}/git"
> > > > > > > > +SRCREV = "40c5d226c7c0706f0176884e9b94b3886679c983"
> > > > > > > > +SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git"
> > > > > > > > +
> > > > > > > > +do_configure[noexec] = "1"
> > > > > > > > +do_compile[noexec] = "1"
> > > > > > > > +
> > > > > > > > +do_install () {
> > > > > > > > +     install -d ${D}${includedir}/CL/
> > > > > > > > +     for f in ${S}/CL/*.h; do
> > > > > > > > +             install -m 0644 $f ${D}${includedir}/CL/
> > > >
> > > > Single file install? Not very optimized...
> >
> > > Its not a single file, Installing all the header files.
> >
> > It's a single file install in a for loop, hence my comment about being
> > unoptimal. Why not use "cp *.h"?
> 
>  I agree its suboptimal use here. May be
> 
> install [OPTION]... -t DIRECTORY SOURCE
> 
> could be tamed to make it better.
> however cp messes the file permissions up if not used with right opts.
> So I would not prefer it unless used with right
> options to respect the file perms. Install does it correctly,

Agree, cp would require passing correct options, but there are plenty of 
examples alreay.

-- 
Denys

