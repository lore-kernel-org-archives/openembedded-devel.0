Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 63DF27F440
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Sep 2019 00:17:23 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id q203so7535834qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2019 17:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZYwIpA2UhQ6YM0lR7QzyPaItAj36IeUjkUW0COBcqlQ=;
	b=W6mKYDR1K3ha6wAz9xHaYsd/nYBB1AH2l5CaK0eG4/x/UEGSLRSq/vs9iGgMdFgfDF
	34x2G8z+Vqm0bmCTGZRJJ1lBiQfiocKVjH2ku8t3j951vLc3moAIl9Tc58mHPT7yvsvr
	eMKai/3R7uhgbVJ3D8yrGUtcHiamHQzoNMSTVvI2MCZL/Sax8zNmPiRTgVky7yZjxnZ3
	gFqn8q3jNb8sN/sNd067Npyeo6bZTsd5f4YJ10F1MYm13bgVjbLfJ0r1GbCN7UG9eNQn
	TDld0LQF1LNoMkTSLgXRH2UdKcgpkuB3QhYDeRcXgo6RREsm2uZhX0xDo1FklJ7Lyex5
	64mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZYwIpA2UhQ6YM0lR7QzyPaItAj36IeUjkUW0COBcqlQ=;
	b=QRx16kfC6b/vkAZw99q1SDLmxZHUlCayAIT5XVFcOR4e51LAyTdLd+UHKKJ2n1Zlzi
	ix7z+fu2tujMjvBnY9O8V03kzyK1bTyNk03/0FhpwVmnDBS0Q4e4bdgT4dyn4yhlCwst
	9Gu8px8q3IF18ENldtqcqlG4dIAfQJhBm/Z3dM3IiSwQqeSTlYbeXkDoOdAHV+XDyvHy
	mrp2WWzknMoH7e4pd/WKx/ZPhuWbTTsX1Iw47MyGlY0Du4ug4e1tl0UPIGJy4EEB1xe+
	fMnESVV9Fndk9QwpM6+aFz14QwfcmULg5XzqXBWdrs4Nn5m6dp0L3QOab7U/bSJnQ6qn
	vm3g==
X-Gm-Message-State: APjAAAW0e+24RALUBQdFj+Hnaz3W9X7vORwiTNsT+plbMkZPK6dII81d
	T4ZN+8DcUDUQvXCoroqH5cL2bt8h2oAIY3aUe50=
X-Google-Smtp-Source: APXvYqyGn+fZw0A+y7hpwomVNqXx+9BWGbRiSMLf5FEdWX/thq43B9DoK8GBJnK7giZ720Iok1uDvB/nyYcrTkDxHxY=
X-Received: by 2002:a37:e40b:: with SMTP id y11mr10397303qkf.9.1567815443961; 
	Fri, 06 Sep 2019 17:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190906212513.16415-1-raj.khem@gmail.com>
	<c74a44cc-b085-e526-eabb-bb56441a5362@gmail.com>
In-Reply-To: <c74a44cc-b085-e526-eabb-bb56441a5362@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Sep 2019 17:17:13 -0700
Message-ID: <CAMKF1sqDBJF47G9pmr8Ciqy68h-s3Dn07qyO-pwz8b=bsAWYwg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ltrace: Fix build on mips
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
X-List-Received-Date: Sat, 07 Sep 2019 00:17:23 -0000
Content-Type: text/plain; charset="UTF-8"

I think yes

On Fri, Sep 6, 2019 at 5:12 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 9/6/19 2:25 PM, Khem Raj wrote:
> > Newer kernel UAPI headers for mips have moved these needed defines
> > around
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> warrior too?
> > ---
> >  .../ltrace/ltrace/include_unistd_nr.patch     | 30 +++++++++++++++++++
> >  meta-oe/recipes-devtools/ltrace/ltrace_git.bb |  1 +
> >  2 files changed, 31 insertions(+)
> >  create mode 100644
> meta-oe/recipes-devtools/ltrace/ltrace/include_unistd_nr.patch
> >
> > diff --git
> a/meta-oe/recipes-devtools/ltrace/ltrace/include_unistd_nr.patch
> b/meta-oe/recipes-devtools/ltrace/ltrace/include_unistd_nr.patch
> > new file mode 100644
> > index 0000000000..e4490bbb9e
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/ltrace/ltrace/include_unistd_nr.patch
> > @@ -0,0 +1,30 @@
> > +kernel headers have restructured mips syscall generation in kernel
> > +in recent versions, however, ltrace still has logic to define the
> > +syscall numbers based on old logic, this patch includes the legacy
> > +UAPI headers to get these defines
> > +
> > +Fixes errors e.g.
> > +../../../../git/sysdeps/linux-gnu/mips/trace.c:138:29: error:
> '__NR_O32_Linux' undeclared (first use in this function)
> > +  const int syscallbase[] = {__NR_O32_Linux, __NR_N32_Linux,
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +--- a/sysdeps/linux-gnu/mips/trace.c
> > ++++ b/sysdeps/linux-gnu/mips/trace.c
> > +@@ -34,6 +34,16 @@
> > + #include <assert.h>
> > + #include <asm/unistd.h>
> > +
> > ++#ifndef __NR_O32_Linux
> > ++#include <asm/unistd_nr_o32.h>
> > ++#endif
> > ++#ifndef __NR_N32_Linux
> > ++#include <asm/unistd_nr_n64.h>
> > ++#endif
> > ++#ifndef __NR_N64_Linux
> > ++#include <asm/unistd_nr_n32.h>
> > ++#endif
> > ++
> > + #include "backend.h"
> > + #include "common.h"
> > + #include "debug.h"
> > diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> > index 3dc269c80e..ead637cb7e 100644
> > --- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> > +++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> > @@ -27,6 +27,7 @@ SRC_URI = "git://
> github.com/sparkleholic/ltrace.git;branch=master;protocol=http
> >             file://0001-mips-plt.c-Delete-include-error.h.patch \
> >
>  file://0001-move-fprintf-into-same-block-where-modname-and-symna.patch \
> >             file://0001-hook-Do-not-append-int-to-std-string.patch \
> > +           file://include_unistd_nr.patch \
> >             "
> >  S = "${WORKDIR}/git"
> >
>
>

