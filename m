Return-Path: <gary.robertson@linaro.org>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 49A2072A0C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Dec 2014 05:56:03 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id l15so3783387wiw.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 21:56:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=ubeOBb6BFfJQA4kuOLeL8LGDAtLQ4q40eqBb+w5hGZs=;
	b=YUNa5ZtlmU+FPSaMN60TT92iVdvLza7NeRAllBTJzwtsmKyBkq2PV1DnOY9u3GTdSW
	BuNh813fh/5dRTCWoJYsV6SeMlG1cP9Fu9RzO/wQReOY1aySkUIozuGRjubX50HQXN5g
	C921bzt9h5pUiofi0R6WDcRVtNqJQfxH29Qru5UpjgRsIgAys+zje1UkModD6yigrGHZ
	iaDe7fFfhH+TgZ5H1tf9AUNMc1wCKLPMj9XcLvL0BX6eK6DVqBQryeJksybDHLBpSRfN
	ovWWc+XRw3xgtYVS5Chqs3ajdV2OwZFL4rC263FliOQdd89myFXA195hGL+Y4SuvZapB
	PqCA==
X-Gm-Message-State: ALoCoQnojvdeHomnihrzxRuYAwQSYxx/TML9A26EZsZk7vaY951ewtQmXyudo7G9LHPUX4dCD1au
MIME-Version: 1.0
X-Received: by 10.194.20.98 with SMTP id m2mr21446563wje.52.1419054963719;
	Fri, 19 Dec 2014 21:56:03 -0800 (PST)
Received: by 10.27.39.5 with HTTP; Fri, 19 Dec 2014 21:56:03 -0800 (PST)
In-Reply-To: <CA+chaQdK8aEAHDnuPGak32bu+kNk74Vu-Z0XwoAxfxez-KKUbA@mail.gmail.com>
References: <1416869955-13519-1-git-send-email-gary.robertson@linaro.org>
	<1416869955-13519-2-git-send-email-gary.robertson@linaro.org>
	<CAF7YWnxoQ22W85xbTfwmyLkQpf=vjwSmpbCvpG1oT-PeGa2GZg@mail.gmail.com>
	<CA+chaQdK8aEAHDnuPGak32bu+kNk74Vu-Z0XwoAxfxez-KKUbA@mail.gmail.com>
Date: Fri, 19 Dec 2014 23:56:03 -0600
Message-ID: <CAF7YWnwe1=jcfh=Xx5swt_3ug+GXdc8sfSQ76QRaaNuHT-8OAQ@mail.gmail.com>
From: Gary Robertson <gary.robertson@linaro.org>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Sat, 20 Dec 2014 05:56:12 -0000
Content-Type: text/plain; charset=UTF-8

Hmm...  Perhaps I goofed with the way I submitted the patches -
I'm afraid I'm a relative noob at patch submission, and still learning best
practices.

The recipe won't build for qemux86 without also applying the Makefile patch
in
'[meta-oe][PATCH 2/3] libhugetlbfs: Make cross-devel recognize all ix86
arches'
(BTW, that Makefile patch has now also been merged into libhugetlbfs.)

So if the patches were applied and tested separately in numerical sequence,
I would expect the qemux86 build to fail with only the first patch applied.

However, I generated these patches specifically to enable me to build
libhugetlbfs for qemux86, and with both patches in place I have been
building successfully for both i586 (qemux86) and x86_64 intel
architectures.

Just for confirmation I rebuilt tonight for qemux86, and had no problems.
So could I ask you to give this patch another try with the other patches
already in place?

Thanks again - and thanks also for the fast reply... looking at the OE lists
I know there is lots of activity to be dealt with.

Gay Robertson

On Fri, Dec 19, 2014 at 5:07 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:
>
> I've intentionally skipped it, because it failed to build.
>
> Unfortunately I've reported the issue in reply to different patch which
> wasn't the cause of the error:
>
> http://lists.openembedded.org/pipermail/openembedded-devel/2014-December/099239.html
>
> On Fri, Dec 19, 2014 at 10:29 PM, Gary Robertson <
> gary.robertson@linaro.org>
> wrote:
> >
> > I am wondering if this patch was overlooked, as I have seen no commentary
> > regarding it, and the two other patches which accompanied it have been
> > merged into the meta-oe libhugetlbfs recipe already.
> > I added explicit arch designators for the typically-used 32-bit intel
> > architectures so the recipe could be built for those platforms and not
> just
> > for 64-bit intel platforms.
> >
> > Thanks & have a happy holiday season!
> >
> > Gary Robertson
> >
> > On Mon, Nov 24, 2014 at 4:59 PM, Gary S. Robertson <
> > gary.robertson@linaro.org> wrote:
> > >
> > > From: "Gary S. Robertson" <gary.robertson@linaro.org>
> > >
> > > COMPATIBLE_HOST included support for x86_64 but not for
> > > 32-bit x86 architectures - added generic 32-bit x86 arch names
> > >
> > > Upstream Status - not applicable - recipe change only
> > >
> > > Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> > > ---
> > >  .../libhugetlbfs/libhugetlbfs_git.bb               |    2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/
> libhugetlbfs_git.bb
> > > b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > > index c2262ea..737acb9 100644
> > > --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > > @@ -23,7 +23,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code
> \
> > >
> > >  S = "${WORKDIR}/git"
> > >
> > > -COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
> > > +COMPATIBLE_HOST =
> > > "(i386|i486|i586|i686|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
> > >
> > >  LIBARGS = "LIB32=${baselib} LIB64=${baselib}"
> > >  LIBHUGETLBFS_ARCH = "${TARGET_ARCH}"
> > > --
> > > 1.7.9.5
> > >
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

