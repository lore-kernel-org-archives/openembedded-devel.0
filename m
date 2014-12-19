Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 56DB072A7E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 23:07:37 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id x12so2487342wgg.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 15:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=4BcSY3jyA+5Iri4kHN+C5YL7Z+sS6andTAQDLQZKPrQ=;
	b=rwV+dOHQn7RNTMxRNx6+DPx8Z4MzfC+4HesI2jfkEvWR9DBc85SBWsGgGpGsH03DQf
	j5eZp/F/c6057w8/e/hHMX45PCsTg4SNfNiHZ8o/c3/Yp6V9I24d0/wISZj4+A/wNUNz
	LstZz/icD44BK1uiCFaqLHzbghB2x2idpvEipymz3ooKII6NxlCr7+7POwKWKlxDtCZN
	CjMRpqjYtifi+Pk0jiMV6JkkPgaGWQelSAoVuEPs+m59lYxcBOqdtmYYW66FiEmQO/li
	T5Zbx6zzcG7iKi+S+UT0mjm80yVypq6pdZwc3HDGArVFv08DPOM5ujCWQ/ljGGrfnZGu
	SQbQ==
MIME-Version: 1.0
X-Received: by 10.194.238.3 with SMTP id vg3mr18751499wjc.69.1419030458302;
	Fri, 19 Dec 2014 15:07:38 -0800 (PST)
Received: by 10.194.40.234 with HTTP; Fri, 19 Dec 2014 15:07:38 -0800 (PST)
In-Reply-To: <CAF7YWnxoQ22W85xbTfwmyLkQpf=vjwSmpbCvpG1oT-PeGa2GZg@mail.gmail.com>
References: <1416869955-13519-1-git-send-email-gary.robertson@linaro.org>
	<1416869955-13519-2-git-send-email-gary.robertson@linaro.org>
	<CAF7YWnxoQ22W85xbTfwmyLkQpf=vjwSmpbCvpG1oT-PeGa2GZg@mail.gmail.com>
Date: Sat, 20 Dec 2014 00:07:38 +0100
Message-ID: <CA+chaQdK8aEAHDnuPGak32bu+kNk74Vu-Z0XwoAxfxez-KKUbA@mail.gmail.com>
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
X-List-Received-Date: Fri, 19 Dec 2014 23:07:47 -0000
Content-Type: text/plain; charset=UTF-8

I've intentionally skipped it, because it failed to build.

Unfortunately I've reported the issue in reply to different patch which
wasn't the cause of the error:
http://lists.openembedded.org/pipermail/openembedded-devel/2014-December/099239.html

On Fri, Dec 19, 2014 at 10:29 PM, Gary Robertson <gary.robertson@linaro.org>
wrote:
>
> I am wondering if this patch was overlooked, as I have seen no commentary
> regarding it, and the two other patches which accompanied it have been
> merged into the meta-oe libhugetlbfs recipe already.
> I added explicit arch designators for the typically-used 32-bit intel
> architectures so the recipe could be built for those platforms and not just
> for 64-bit intel platforms.
>
> Thanks & have a happy holiday season!
>
> Gary Robertson
>
> On Mon, Nov 24, 2014 at 4:59 PM, Gary S. Robertson <
> gary.robertson@linaro.org> wrote:
> >
> > From: "Gary S. Robertson" <gary.robertson@linaro.org>
> >
> > COMPATIBLE_HOST included support for x86_64 but not for
> > 32-bit x86 architectures - added generic 32-bit x86 arch names
> >
> > Upstream Status - not applicable - recipe change only
> >
> > Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> > ---
> >  .../libhugetlbfs/libhugetlbfs_git.bb               |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > index c2262ea..737acb9 100644
> > --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > @@ -23,7 +23,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
> >
> >  S = "${WORKDIR}/git"
> >
> > -COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
> > +COMPATIBLE_HOST =
> > "(i386|i486|i586|i686|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
> >
> >  LIBARGS = "LIB32=${baselib} LIB64=${baselib}"
> >  LIBHUGETLBFS_ARCH = "${TARGET_ARCH}"
> > --
> > 1.7.9.5
> >
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

