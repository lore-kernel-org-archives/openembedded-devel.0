Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0FA6D78F1A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 14:25:42 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id r184-v6so13669352ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 07:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6K/SoKbKxe9jP/ncpM61897PAXvvu8+WcGDVHsl3JQ8=;
	b=EYHpIfmCl9WgHi47tJQn/XwFjzH0eKbXvicZjc2V2iIzjE6Egu3akmqS5H4X2VL777
	BDxLLLnc28FhrUY8vyLlcR2urxgsAGqEjiLKXLuvvMcRADZYkJjFTzBNhq5bGFeYFN9g
	GZhrgVtZ2sEiJmYXEA09RwdCUq0ly/c+vPEf5yL824ur+oOYhGbUFVDtNsdFdqNYlukV
	YL5FVCRcciXUaKfioW0RAR67EQV5kYcxTyxMIhCmfzrnXV8TKRx/qcWJes1rjTGi3vCk
	TI0HQ1N22SfeLGwLNkggekLrnf3oU/io7dyyIO+8MZ6FIyeaZTqebErUOC741ro7PXzp
	CcLQ==
X-Gm-Message-State: AOUpUlGc5/LOL4/LwHvsqJ8Gku3ZVfcav6vd0pwdWD15Cyb938XUHuFz
	f8bhpv40F57xyJd4lMpCLtMlVwei
X-Google-Smtp-Source: AA+uWPzKHieeoVK1eFk+zoxq6XCSDRnkBVpA+Np14bW2u/ftV4TPF524hkOCdl1Ek0W4p4Yz9OSJeg==
X-Received: by 2002:a25:aa8d:: with SMTP id
	t13-v6mr9139578ybi.465.1534170343681; 
	Mon, 13 Aug 2018 07:25:43 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i204-v6sm8283652ywe.102.2018.08.13.07.25.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Aug 2018 07:25:42 -0700 (PDT)
Message-ID: <33e520ccafa4deccadc50cadd592bf4de1a63b9e.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Leitner <richard.leitner@skidata.com>, 
	openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 15:25:41 +0100
In-Reply-To: <665bfde0-e444-200f-2d07-9013c2a7d4e1@skidata.com>
References: <20180813100936.23663-1-git@andred.net>
	<20180813100936.23663-7-git@andred.net>
	<665bfde0-e444-200f-2d07-9013c2a7d4e1@skidata.com>
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH 6/9] openjdk-8: gcc-8 fix #2: silence build warnings/errors (return-type)
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
X-List-Received-Date: Mon, 13 Aug 2018 14:25:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-08-13 at 15:03 +0200, Richard Leitner wrote:
> Hi André,
> just some nitpicking:
> 
> On 8/13/18 12:09 PM, André Draszik wrote:
> > From: André Draszik <andre.draszik@jci.com>
> > 
> > Similar to the patch just reverted, we wilence the build warnings
> > regarding return type of functions, but we only do this for gcc versions
> > where it matters, now that our infrastructure for doing so works again:
> 
> I guess with "the patch just reverted" you refer to the [PATCH 7/9] which
> will be applied afterwards.
> 
> Is it OK for you if I apply Patch #7 before Patch #6 so the commit message
> works out?

You're right. I had them in a different order when I wrote the commit
message, but then decided to fix the bugs first and remove the work-around
afterwards.

Up to you :-)

> Furthermore I'll change "wilence" to "silence" if it's OK for you? ;-)

Sure :-)

A.

> 
> > 
> >     |
> > <<PKGBUILDDIR>>/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp
> > :223:32: error: control reaches end of non-void function [-
> > Werror=return-type]
> >     |  #define BREAKPOINT ::breakpoint()
> >     |                     ~~~~~~~~~~~~^~
> >     | <<PKGBUILDDIR>>/hotspot/src/share/vm/utilities/debug.hpp:192:3:
> > note: in expansion of macro 'BREAKPOINT'
> >     |    BREAKPOINT;                                                    
> >             \
> >     |    ^~~~~~~~~~
> >     |
> > <<PKGBUILDDIR>>/hotspot/src/cpu/aarch64/vm/c1_LIRAssembler_aarch64.cpp:1
> > 97:2: note: in expansion of macro 'ShouldNotReachHere'
> >     |   ShouldNotReachHere();
> >     |   ^~~~~~~~~~~~~~~~~~
> >     etc.
> > 
> > Signed-off-by: André Draszik <andre.draszik@jci.com>
> > ---
> >  recipes-core/openjdk/openjdk-8-common.inc | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-
> > core/openjdk/openjdk-8-common.inc
> > index fb97e97..77d905d 100644
> > --- a/recipes-core/openjdk/openjdk-8-common.inc
> > +++ b/recipes-core/openjdk/openjdk-8-common.inc
> > @@ -216,6 +216,7 @@ EXTRA_OECONF_append = "\
> >  # of these changes.
> >  FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
> >  FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
> > +FLAGS_GCC8 = "-Wno-error=return-type"
> >  
> >  # All supported cross compilers support the compiler flags that were
> >  # added to make compilation with gcc6 work. But the host compiler for
> > 
> 
> regards;Richard.L

