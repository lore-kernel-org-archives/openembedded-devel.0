Return-Path: <koen.kooi@linaro.org>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id A9FB270393
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 15:04:47 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id n15so2903743lbi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 08:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=GqxNwVhAySm6dpNVoNgFjNSMRkQZ4J4j9qq2FAdNgb4=;
	b=dL3NSx9coHK+Usb9vIZNYA/h/+737Iq6Qe6jS6jnSBucuct3mUi22sMiO0QP9JHXsg
	A82ftRlaVpKzsmLKmNV2qmH9QrS2rFemilTAU6XmZwQnmK9np3NKDfPnrW4QBHRhlb9C
	pD8m++MlSQ1zNl8wxwUf9K+AvctjicF2yllhUFdG+EB9LGjie8XmPJAUQxQGI3vH+MpG
	PxCK9QcZCkwglRwG4TxEuQxbU7hV6fzeDbnEydpJMthaQ8p0ng8MlxiwT59UZe++Brgf
	yGwMSlJWPcy8qY1TAYbUEhznWNc/IrrXcVB/Ssj5zSVOEkslopPmcXwEyrOdSWa0RPnd
	iS/Q==
X-Gm-Message-State: ALoCoQmaraeL3OPrbpq8HLyXmMz5sBgnhur1fRAqtdXW5XLo/cl1xSDYgT66ikcatkAUjZcKmyGY
MIME-Version: 1.0
X-Received: by 10.112.165.1 with SMTP id yu1mr2189377lbb.68.1405350288603;
	Mon, 14 Jul 2014 08:04:48 -0700 (PDT)
Received: by 10.114.28.67 with HTTP; Mon, 14 Jul 2014 08:04:48 -0700 (PDT)
In-Reply-To: <20140714145409.GH2433@jama>
References: <1405327294-4030-1-git-send-email-koen.kooi@linaro.org>
	<1405327294-4030-2-git-send-email-koen.kooi@linaro.org>
	<20140714145409.GH2433@jama>
Date: Mon, 14 Jul 2014 17:04:48 +0200
Message-ID: <CAP0W-R=vm-7K+fZM2bbAqcPuUN4ZOdjiXGp9qCDywWMO7J+LPw@mail.gmail.com>
From: Koen Kooi <koen.kooi@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] libhugetlbfs: fix packaging
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
X-List-Received-Date: Mon, 14 Jul 2014 15:04:53 -0000
Content-Type: text/plain; charset=UTF-8

On 14 July 2014 16:54, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Mon, Jul 14, 2014 at 10:41:34AM +0200, Koen Kooi wrote:
> > Libhugetlbs doesn't generate proper .so.X libs, only two .so files.
> Package those in ${PN} and silence the resulting QA warning. This fixes:
> >
> >  ERROR: QA Issue: libhugetlbfs-tests rdepends on libhugetlbfs-dev
> >
> > Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> > ---
> >  meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > index af7ed3e..d3b64bf 100644
> > --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > @@ -25,6 +25,7 @@ COMPATIBLE_HOST =
> "(x86_64|powerpc|powerpc64|aarch64).*-linux*"
> >
> >  LIBARGS = "LIB32=${baselib} LIB64=${baselib}"
> >  EXTRA_OEMAKE = "'ARCH=${TARGET_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}'
> ${LIBARGS} V=1"
> > +PARALLEL_MAKE_pn-${PN} = ""
>
> Is _pn override really needed?
>

It isn't, I only moved the line without noticing the override. Do you want
me to respin?

