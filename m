Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C945B74734;
	Wed, 30 May 2018 13:28:08 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f8-v6so47830668wmc.4;
	Wed, 30 May 2018 06:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HoTl69Fvwj+El/DWajGln8U/kNj2vg1qeLfS6330bzU=;
	b=ofGKKhJJLzTg/PKZqmFzNxeHTW/7875wJKDAHhOm2DeKaPPNuZQAJkcZsapEMBXYHg
	eYfO5SbZAaDSEaIiNhCvb0QlD+WKXibzaw5Ktud9u4VstnGypVCNhjtaSU6Z/TGdzsI7
	qMRuMjTX1Q2BweWAmH7zxenLLR5VNnjcrqiZ8fd4E9YT3rgazyMOvsRtwPJvWW0lTmKG
	u2T1BWWdkk1g/LFhfBuItBm/2GOBmwEqY/hgnig0Dx8CErr4251ephJWjAGUbShc0PlA
	u/4aQt/lSHNeYc4RRBc8fCdaOu7UyNGqDy6aXXfn8JZCYqYVVfPpSGm0AFr25C9JNOR7
	EEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HoTl69Fvwj+El/DWajGln8U/kNj2vg1qeLfS6330bzU=;
	b=qhRlCzYtC9wqDhgJYSqWCWIHnZWMSiSBh79bJyQ20anWpTkvXlnf0JWawCzECDbpYy
	tZVM+srtV/CHL2P6DBZPK7IeGyOzJ3M51ITV1hygW4aC0cxNkEl+Y+hsEdJrqloOYzba
	39yslobsowBPAYJ39F0RBTJXGei2FOyje/Oz7sRglkXHSI6wtnN4vTbVB0AGavwsmUxS
	O5uu+I+cvUbCUY4VPXQei3IlJGhA74Pe0Lus63jfVyQXhcX6hzkgkwbAllZxIjb5433D
	33jZ57od0VFQpd0o16CBMdf9OYErmQ3+PZdc3mfuEgZJDe2Uv5IvSJbKbyFgq5rkpYs1
	517w==
X-Gm-Message-State: ALKqPwd6+aujgwaND47PXHMCUtrxqv0EEVHV7I5sDXZaUhhhK9RhK0uY
	ROE9SaT5zi7c6O4B48Ky7xCWNUydHavl1l2REmY=
X-Google-Smtp-Source: ADUXVKLI29AVz2OGL7pS9QLb/JWYn17E967KQ0CyRPCa3mgcKgUumnoQzjuxERxUG4U8a65RUoBuKLPcMDa7tdnV/Zs=
X-Received: by 2002:a1c:988d:: with SMTP id
	a135-v6mr1597591wme.79.1527686889448; 
	Wed, 30 May 2018 06:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <20180530130016.18864-1-george.mccollister@gmail.com>
	<CA+chaQfsqr6opc79LGEswd48uodj2ergv_8Lfb1A8iGPXQgqTw@mail.gmail.com>
	<CAFSKS=NAcDnZFjEy7qFC-NXiTftT7Y0mWeqf7hyY5LQhhxxNcg@mail.gmail.com>
In-Reply-To: <CAFSKS=NAcDnZFjEy7qFC-NXiTftT7Y0mWeqf7hyY5LQhhxxNcg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 May 2018 15:27:58 +0200
Message-ID: <CA+chaQdPWd7aikLRiQYBWuUfG-4n+RTPfbqzJZ5eim8OggNh0Q@mail.gmail.com>
To: george.mccollister@gmail.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][rocko][PATCH] protobuf: fix SRC_URI by removing branch
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
X-List-Received-Date: Wed, 30 May 2018 13:28:09 -0000
Content-Type: text/plain; charset="UTF-8"

The change itself is OK, but you should update the commit message so that
other people won't get bad idea about how the fetcher works.

Also please don't send meta-oe patches to both lists, it should go just to
openembedded-devel (to prevent both patchwork instances picking this
change).

On Wed, May 30, 2018 at 3:19 PM George McCollister <
george.mccollister@gmail.com> wrote:

> On Wed, May 30, 2018 at 8:08 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > This doesn't just rely on SRCREV (bitbake fetcher would be complaining if
> > the SRCREV isn't found in the branch used in SRC_URI), it relies on this
> > SRCREV to be in master branch (which is the default branch for git
> fetcher):
>
> Okay, point taken.
>
> >
> > docker-shr @ ~/projects/protobuf $ git branch -a --contains
> > b04e5cba356212e4e8c66c61bbe0c3a20537c5b9
> > * master
>
> Since it's in master the patch should work fine anyway. Should I
> update the commit message and add branch=master or just leave it as
> is?
>
> >   remotes/origin/3.5.1.1
> >   remotes/origin/3.5.x
> >   remotes/origin/3.6.x
> >   remotes/origin/HEAD -> origin/master
> >   remotes/origin/cython_protobuf
> >   remotes/origin/master
> >   remotes/origin/php-generated-dev
> >   remotes/origin/python-wheel
> >   remotes/origin/python_deps
> >
> >
> > On Wed, May 30, 2018 at 3:01 PM George McCollister
> > <george.mccollister@gmail.com> wrote:
> >>
> >> The 3.4.x branch was removed upstream but the commit referenced in
> >> SRCREV is the 3.4.1 release and is still available:
> >> https://github.com/google/protobuf/releases/tag/v3.4.1
> >>
> >> Drop branch=3.4.x from SRC_URI and just rely on SRCREV.
> >>
> >> Signed-off-by: George McCollister <george.mccollister@gmail.com>
> >> ---
> >>  meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
> >> b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
> >> index fae7c18a1..fe28f475a 100644
> >> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
> >> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
> >> @@ -18,7 +18,7 @@ SRCREV = "b04e5cba356212e4e8c66c61bbe0c3a20537c5b9"
> >>
> >>  PV = "3.4.1+git${SRCPV}"
> >>
> >> -SRC_URI = "git://github.com/google/protobuf.git;branch=3.4.x"
> >> +SRC_URI = "git://github.com/google/protobuf.git"
> >>
> >>  EXTRA_OECONF += " --with-protoc=echo"
> >>
> >> --
> >> 2.11.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> Regards,
> George
>

