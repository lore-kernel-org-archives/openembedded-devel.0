Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9841C7290D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Dec 2014 11:12:57 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id em10so4035895wid.17
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Dec 2014 03:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=cc4NZ+coiDxj7Xtig94u1Zlgxv0wz0xysDQWadRfuQI=;
	b=l1p/8B2Y83Cy/1Tg0b4V+GrrzaKi0e9PeXhSme5jM8P7lq8cTRHeRbTUTJ0n4fGjVY
	mKRgol51ImY+k2AWkLXS36emkCPOc6rUPPi9fIxoyeWqZDysQR/9CWqMfoI16jAnhUGn
	Rl3359XGVk22WKSObOhtWA8sz7nTBlNeqW279G8EeF43snT4Abht5U3baFHUkQFZ1peC
	Zqtrg+K+NoVDcVuzzg2Zb/ncjLKMsbFx8KFSTE6qKxTZ2C8YnIK5VMUIMP7JvBkhaaqb
	MpnKvD89GCoNiazNjbh8inwMjEU6FJVHRTnbEjoYATcDi88yLipUj2vUzXXP/Fjxf9HI
	8iOw==
MIME-Version: 1.0
X-Received: by 10.180.109.130 with SMTP id hs2mr14074976wib.54.1419073977518; 
	Sat, 20 Dec 2014 03:12:57 -0800 (PST)
Received: by 10.194.40.234 with HTTP; Sat, 20 Dec 2014 03:12:57 -0800 (PST)
In-Reply-To: <CAF7YWnwe1=jcfh=Xx5swt_3ug+GXdc8sfSQ76QRaaNuHT-8OAQ@mail.gmail.com>
References: <1416869955-13519-1-git-send-email-gary.robertson@linaro.org>
	<1416869955-13519-2-git-send-email-gary.robertson@linaro.org>
	<CAF7YWnxoQ22W85xbTfwmyLkQpf=vjwSmpbCvpG1oT-PeGa2GZg@mail.gmail.com>
	<CA+chaQdK8aEAHDnuPGak32bu+kNk74Vu-Z0XwoAxfxez-KKUbA@mail.gmail.com>
	<CAF7YWnwe1=jcfh=Xx5swt_3ug+GXdc8sfSQ76QRaaNuHT-8OAQ@mail.gmail.com>
Date: Sat, 20 Dec 2014 12:12:57 +0100
Message-ID: <CA+chaQdOQKZRW7QH0qHS-ta8+oZDspRVGguF3iMDgOyrPAxg_Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 1/3] libhugetlbfs: Add ix86 to list of compatible host architectures
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Dec 2014 11:12:58 -0000
Content-Type: text/plain; charset=UTF-8

> So could I ask you to give this patch another try with the other patches
already in place?

I'll do that if I don't forget, but I'm pretty sure that first it was
failing with both your patches applied together and then again with all 3
pending libhugetlbfs together.

You have submitted it correctly and it was applied correctly, I always
trigger the build with as many cherry-picked changes as possible, only
after discovering the qemux86 build issue I've tried to remove this 1/3
patch from master-next to confirm that this is the root cause for the build
issue and then I've applied the rest, because it was building fine again.

Regards,



On Sat, Dec 20, 2014 at 6:56 AM, Gary Robertson <gary.robertson@linaro.org>
wrote:

> Hmm...  Perhaps I goofed with the way I submitted the patches -
> I'm afraid I'm a relative noob at patch submission, and still learning best
> practices.
>
> The recipe won't build for qemux86 without also applying the Makefile patch
> in
> '[meta-oe][PATCH 2/3] libhugetlbfs: Make cross-devel recognize all ix86
> arches'
> (BTW, that Makefile patch has now also been merged into libhugetlbfs.)
>
> So if the patches were applied and tested separately in numerical sequence,
> I would expect the qemux86 build to fail with only the first patch applied.
>
> However, I generated these patches specifically to enable me to build
> libhugetlbfs for qemux86, and with both patches in place I have been
> building successfully for both i586 (qemux86) and x86_64 intel
> architectures.
>
> Just for confirmation I rebuilt tonight for qemux86, and had no problems.
> So could I ask you to give this patch another try with the other patches
> already in place?
>
> Thanks again - and thanks also for the fast reply... looking at the OE
> lists
> I know there is lots of activity to be dealt with.
>
> Gay Robertson
>
> On Fri, Dec 19, 2014 at 5:07 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > I've intentionally skipped it, because it failed to build.
> >
> > Unfortunately I've reported the issue in reply to different patch which
> > wasn't the cause of the error:
> >
> >
> http://lists.openembedded.org/pipermail/openembedded-devel/2014-December/099239.html
> >
> > On Fri, Dec 19, 2014 at 10:29 PM, Gary Robertson <
> > gary.robertson@linaro.org>
> > wrote:
> > >
> > > I am wondering if this patch was overlooked, as I have seen no
> commentary
> > > regarding it, and the two other patches which accompanied it have been
> > > merged into the meta-oe libhugetlbfs recipe already.
> > > I added explicit arch designators for the typically-used 32-bit intel
> > > architectures so the recipe could be built for those platforms and not
> > just
> > > for 64-bit intel platforms.
> > >
> > > Thanks & have a happy holiday season!
> > >
> > > Gary Robertson
> > >
> > > On Mon, Nov 24, 2014 at 4:59 PM, Gary S. Robertson <
> > > gary.robertson@linaro.org> wrote:
> > > >
> > > > From: "Gary S. Robertson" <gary.robertson@linaro.org>
> > > >
> > > > COMPATIBLE_HOST included support for x86_64 but not for
> > > > 32-bit x86 architectures - added generic 32-bit x86 arch names
> > > >
> > > > Upstream Status - not applicable - recipe change only
> > > >
> > > > Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> > > > ---
> > > >  .../libhugetlbfs/libhugetlbfs_git.bb               |    2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/
> > libhugetlbfs_git.bb
> > > > b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > > > index c2262ea..737acb9 100644
> > > > --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > > > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > > > @@ -23,7 +23,7 @@ SRC_URI = "git://
> git.code.sf.net/p/libhugetlbfs/code
> > \
> > > >
> > > >  S = "${WORKDIR}/git"
> > > >
> > > > -COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
> > > > +COMPATIBLE_HOST =
> > > > "(i386|i486|i586|i686|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
> > > >
> > > >  LIBARGS = "LIB32=${baselib} LIB64=${baselib}"
> > > >  LIBHUGETLBFS_ARCH = "${TARGET_ARCH}"
> > > > --
> > > > 1.7.9.5
> > > >
> > > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
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
>

