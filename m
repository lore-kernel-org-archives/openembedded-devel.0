Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id F07E275549
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2018 21:16:22 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id z16-v6so5136255uaz.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2018 14:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9v62dUuXa4uwSpPvaSOMu5ihSXRE9IRfF1oEKT/mJTY=;
	b=gt7170q97mqhe8Fe75tvHpffQ4cu95Fe+6kqyvqSsewulq/PE/HFEHWpqTFU6vOYz1
	wNlb45H0ofkpLn92MIPVbqTJUYe8EIKKdW7cZYL150sQR/GkzHKnwWhgOS0i25IZbWp5
	3DPKh5+2Awn/39tenMmMSmRHk/t2HcLYkgpbYmq2bljszBIaDUeDnflGD2okUJaL2jTm
	gsLVRMbeWgOXLTFE18ojgkMYIbYdKOuFfTpiVr8fTddjz9RYyghxmPbIeJFoeD3b1GrH
	jNBeG6PeT+YuYsiNLD3+zIOcVZXBkvllBw3vgM01k3vwg3W+6KjmzC+RL7nyNMKQFFLe
	iRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9v62dUuXa4uwSpPvaSOMu5ihSXRE9IRfF1oEKT/mJTY=;
	b=A3NFSmD0xjv958x59HRskDZBS9qthKEjK8sDrlFjm5hI+OF0HcbBmEW0SNOFm42JhS
	c+oGAYeSnEvj91XhAyVxpGmonTj+rUbKVzVBm2c8zywF/nevIwrvz26nMVB8DPzxD9r8
	4P9DEJA7nISwst45khnUZrMvDUM0YoqCrInAPHf5U9+0QsBb+dHPlEcEnlU/CWTkXpuJ
	NYWCAnBGaPEB9U4WE0nF+advHhov7ufcUtWgyhYtjfChLzKx6IqmzrMxLkb8xkOLmihC
	PUwKvHtD5gwOn6B46DhMdygReb/AecewgFY/y0d6cd5SYgOIHrM/UFXckD84FFVjqkIG
	hWVw==
X-Gm-Message-State: APt69E0Csklsa7ox6PUa1R4KTf852rx5wkONEIhiQ/cR7mAz2bfUxiWz
	PgDi0+xDbkP2I/JyYFwKc8oSggz5pCEJ3yPgyjMo9w==
X-Google-Smtp-Source: ADUXVKIHOqXS/zNSNahokXccmL4oqPQwJuqIccqrX7cDpDcNVeEcTQW9XHfzDrO6sQXYSCFrbNwStBTso+O6O7LTULM=
X-Received: by 2002:a9f:3b9b:: with SMTP id
	r27-v6mr2101699uah.191.1529702183575; 
	Fri, 22 Jun 2018 14:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <20180504070916.11024-1-andrew@aj.id.au>
	<ab208a40-d4eb-4807-8f38-824738aff34b@intel.com>
	<1525420516.2510070.1360549248.0F065DEC@webmail.messagingengine.com>
In-Reply-To: <1525420516.2510070.1360549248.0F065DEC@webmail.messagingengine.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jun 2018 14:16:08 -0700
Message-ID: <CAMKF1sr9TbKeDPZq96mpNujYct-ONcr7rjsWm7Cb_sB1Po8m4A@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [RESEND][meta-python][PATCH 1/3] meta-python: Add python-pyflame recipe
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
X-List-Received-Date: Fri, 22 Jun 2018 21:16:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 4, 2018 at 12:55 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hi Anuj,
>
> Thanks for the quick review!
>
> On Fri, 4 May 2018, at 17:20, Anuj Mittal wrote:
> > On 05/04/2018 03:09 PM, Andrew Jeffery wrote:
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > ---
> > >  meta-python/recipes-devtools/python/python-pyflame.inc      | 9 +++++++++
> > >  meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb | 5 +++++
> > >  2 files changed, 14 insertions(+)
> > >  create mode 100644 meta-python/recipes-devtools/python/python-pyflame.inc
> > >  create mode 100644 meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
> > >
> > > diff --git a/meta-python/recipes-devtools/python/python-pyflame.inc b/meta-python/recipes-devtools/python/python-pyflame.inc
> > > new file mode 100644
> > > index 000000000000..37ceab888533
> > > --- /dev/null
> > > +++ b/meta-python/recipes-devtools/python/python-pyflame.inc
> > > @@ -0,0 +1,9 @@
> > > +S = "${WORKDIR}/pyflame-${PV}"
> > > +
> > > +LICENSE = "Apache-2.0"
> > > +LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
> > > +
> > > +DEPENDS = "python"
> > > +
> > > +inherit pkgconfig autotools
> > > +
> > > diff --git a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
> > > new file mode 100644
> > > index 000000000000..c902e121231b
> > > --- /dev/null
> > > +++ b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
> > > @@ -0,0 +1,5 @@
> > > +require python-pyflame.inc
> > > +
> > > +SRC_URI = "https://github.com/uber/pyflame/archive/v${PV}.tar.gz"
> >
> > Archive tarball checksums are known to change. Perhaps you can consider
> > using the release tarball instead?
> >
> > https://github.com/uber/pyflame/releases
>
> What exact URL should I use? I got the URL used in the recipe through the releases page by copying the tar.gz link.

here I think you need to use git fetcher instead of wget fetcher and
point SRCREV = "sha of tag" something like below

SRC_URI = "git://github.com/uber/pyflame"
# v1.6.6
SRCREV = "8a9d8c2acc3b3bb027475b738134f1e6fff14e6c"
S = "${WORKDIR}/git"
UPSTREAM_CHECK_URI = "https://github.com/uber/pyflame/releases"

