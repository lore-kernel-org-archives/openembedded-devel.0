Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id ACAA678875
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:34:16 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id 139-v6so1823651ywg.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gDyAORK6Y3+BbXAGj95AL4QvGYfSK81mOIwHfNsBBqs=;
	b=aNS/ER5bxva7orRQRq+gEka6n5H+8+pWvtbUL6AMNVfdLsI8RLSRRkp/9h8O46qVcU
	gwLrzD9xcHg5VqPueAEYCeAEHvApnaHwzIXFTQ30ez7eArCmjNu+yunw2uYPCXrCbmMe
	i8tPDDWjkHVR1RuhmgoP4fRfPitAJCeODUUdcfOFpzXabrzNQIbrcAwnJgxcnLkHQJPE
	iKLvXnPqMNPL+5fgIF7j95ePf3iGXMvua6/g8p1o1DLD5BWs5wdgrtnf9NwCoo8VDRiu
	myPOa4p71mfCwh+8GERZyRB3v++phdjVpD+attUtH00y8cAvmrKTA+568Sa7Rede//+D
	K0zQ==
X-Gm-Message-State: AOUpUlEv4FeLmq9YVXy7jcr7dKbJveY36E2gV3jSXbIytdFyCMUeixCd
	8pKZSw3LiHRi8AvPu9hgiOxLonWU
X-Google-Smtp-Source: AA+uWPxVzN3qy9zba0QctjJV+wOzz/lHODLir+oRgSkAOAyjyuPkGRC22WfJq3EElWEqk19r78sxKg==
X-Received: by 2002:a5b:84a:: with SMTP id
	v10-v6mr1639685ybq.225.1533742457305; 
	Wed, 08 Aug 2018 08:34:17 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	d10-v6sm2277319ywh.87.2018.08.08.08.34.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 Aug 2018 08:34:16 -0700 (PDT)
Message-ID: <d60f120766c341344fc6be4f53cb5f477c330b73.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 08 Aug 2018 16:34:14 +0100
In-Reply-To: <91ee3513-e8d1-b3e7-4872-fefaa87cf35d@skidata.com>
References: <20180614224904.21590-1-richard.leitner@skidata.com>
	<20180614224904.21590-2-richard.leitner@skidata.com>
	<91ee3513-e8d1-b3e7-4872-fefaa87cf35d@skidata.com>
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH 1/2] openjdk-8: fix build for gcc8.x
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
X-List-Received-Date: Wed, 08 Aug 2018 15:34:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

It appears that this patch has broken native builds with gcc 6:

| At global scope:
| cc1plus: error: unrecognized command line option ‘-Wno-stringop-overflow’ [-Werror]

Might be better to add a patch to address the warning, rather than trying to
silence gcc with an option that not all versions support.


Cheers,
Andre'


On Fri, 2018-06-15 at 10:45 +0200, Richard Leitner wrote:
> Hi,
> this is a note to let you know that I've just added this patch to the
> master-next branch of the meta-java repository at
> 	git://git.yoctoproject.org/meta-java
> 
> As soon as it has gone through some more testing it will likely be
> merged to the master branch.
> 
> If you have any questions, please let me know.
> 
> regards;Richard.L
> 
> On 06/15/2018 12:49 AM, Richard Leitner wrote:
> > Currently oe-core/YoctoProject migrated to gcc8.x. This update broke our
> > openjdk-8 and openjre-8 build. This patch avoids this problem by
> > disabling
> > the problematic gcc warnings and errors.
> > 
> > Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> > ---
> >  recipes-core/openjdk/openjdk-8-release-16xbyy.inc   |  1 +
> >  .../patches-openjdk-8/hotspot_fix_gcc8x_build.patch | 21
> > +++++++++++++++++++++
> >  2 files changed, 22 insertions(+)
> >  create mode 100644 recipes-core/openjdk/patches-openjdk-
> > 8/hotspot_fix_gcc8x_build.patch
> > 
> > diff --git a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
> > b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
> > index bd4a349..7ca0997 100644
> > --- a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
> > +++ b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
> > @@ -16,6 +16,7 @@ PATCHES_URI = "\
> >      file://0008-jdk-use-correct-include-for-signal.patch \
> >      file://0009-jdk-disable-backtrace-musl-build-fix.patch \
> >      file://0010-build-fix-build-on-as-needed-toolchains-generic.patch \
> > +    file://hotspot_fix_gcc8x_build.patch \
> >  "
> >  # some patches extracted from http://cr.openjdk.java.net/~rkennke/shark
> > -build-hotspot/webrev.01/hotspot.patch
> >  # reported via http://mail.openjdk.java.net/pipermail/build-dev/2015-Ja
> > nuary/013972.html
> > diff --git a/recipes-core/openjdk/patches-openjdk-
> > 8/hotspot_fix_gcc8x_build.patch b/recipes-core/openjdk/patches-openjdk-
> > 8/hotspot_fix_gcc8x_build.patch
> > new file mode 100644
> > index 0000000..1a406f2
> > --- /dev/null
> > +++ b/recipes-core/openjdk/patches-openjdk-
> > 8/hotspot_fix_gcc8x_build.patch
> > @@ -0,0 +1,21 @@
> > +From: Richard Leitner <richard.leitner@skidata.com>
> > +Date: Thu, 14 Jun 2018 23:42:11 +0200
> > +Subject: [PATCH] openjdk-8: hotspot: fix gcc8 compilation
> > +
> > +As oe-core/yocto-project master migrated to gcc8.x we need to support
> > this.
> > +Therefore disable following gcc warnings/errors which caused the build
> > to fail:
> > +  + stringop-overflow
> > +  + return-type
> > +---
> > +
> > +--- a/hotspot/make/linux/makefiles/gcc.make
> > ++++ b/hotspot/make/linux/makefiles/gcc.make
> > +@@ -197,7 +197,7 @@
> > + endif
> > + 
> > + # Compiler warnings are treated as errors
> > +-WARNINGS_ARE_ERRORS = -Werror
> > ++WARNINGS_ARE_ERRORS = -Werror -Wno-stringop-overflow -Wno-
> > error=return-type
> > + 
> > + ifeq ($(USE_CLANG), true)
> > +   # However we need to clean the code up before we can unrestrictedly
> > enable this option with Clang
> > 

