Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id DC018744D2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2018 17:26:37 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id i7so9337523qtj.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2018 09:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hg4bOkKN6LIYaG+BAE8+MxQK+4NlH8jocgs3e50h2bQ=;
	b=Vzg9KTPcy5moWRHSJglfYqd9fNh3+UrHwIxXqnpcoi9qCWky9Cgh81+ozFSo63vE4K
	omN8YNWRpicSW58pGUe4H9IcOSzCjFcx/zHWqI6I64ZGOiv/eRHWM3lnwZ2UjwsadlF5
	wlFKBeh5cxoZI6i5Axw3RqJjFXQmglCE5MhOEqt7wqR84pe8bsCxxjEHIv0qC5EGIkVR
	msbhExTDWDEifnE4wrMOrPylJzCKTBERrU/KKTEwTBOHctQU5PsEBbX5e8uUmp5mM7uS
	+vB+8Bt7k+zbe+SZZccNVH3GNTgnD+PytZYB7lKbiHsO4I0EGkNErWRAT8XEhFz6rTiH
	H4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hg4bOkKN6LIYaG+BAE8+MxQK+4NlH8jocgs3e50h2bQ=;
	b=QrgqlH2TIcCvj7Ct/wiNCQ9gVagbglvORCwiP7kO7MpRFdp/+SNdRdNDON2iJ2cdcq
	6LKc941yTeq3vLp8YDbvvkVV7ZciythG3A4+DqLbzVnZV7GCCe3pVjzzJ2kLb8RV2CzY
	2q4gDldl8qqOufZMpqj3z1aYKU+FlQbbpP1jwpCkMLlezr+51PXg6GEL9sP1HpTzzUzl
	G2yebcJS1x1lnizuCtyxb5gfZvtRWYHb6VUgHjGw2GncHxC9aNZ8Eersw41keVRryYss
	R0CAaDdYszw6d1qbIBk2wl/wkG/0fFbfYv8kiFjtL3RGz/VCCrHpOw7sItzQKv8/eCPS
	m5yw==
X-Gm-Message-State: AJcUukfTnFZe/RbgDdR08aEwJA1+RI40qw2DyHd0AeFLXfgq63GZskU3
	Pe7pleU8i9+B52VoVnughhBa2e00QAtoV1nFCnQ=
X-Google-Smtp-Source: AFSGD/WXVdZQmc5iPpbkMx4mgH5831O7R80vx8p/5akOrgzg1j6xXOAfZ2k7DNDpM31Y5d6beTiNQWHxVes8en4aGeo=
X-Received: by 2002:aed:3eac:: with SMTP id n41mr6694624qtf.196.1545499598577; 
	Sat, 22 Dec 2018 09:26:38 -0800 (PST)
MIME-Version: 1.0
References: <1545488571-406-1-git-send-email-ankit.tarot@gmail.com>
	<CAMKF1spMgZDWJ61BeLkAWrG3ytgm=rHA9aOYWgpzbpHAjBx7kA@mail.gmail.com>
	<CAM_RqkNu6iqMW_7D2TRfir1KP8f4eg=3JqUJfYF2s_6D67ejmQ@mail.gmail.com>
In-Reply-To: <CAM_RqkNu6iqMW_7D2TRfir1KP8f4eg=3JqUJfYF2s_6D67ejmQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Dec 2018 09:26:12 -0800
Message-ID: <CAMKF1sr3wOLpao11MC_U2Vj9fnPSAT3CA+Sitq5hGzc2Ssu=BA@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] spirv-cross: Initial recipe for SPIRV-Cross
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
X-List-Received-Date: Sat, 22 Dec 2018 17:26:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 22, 2018 at 8:33 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
>
> Hi Raj,
>
> On Sat, Dec 22, 2018 at 9:40 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Sat, Dec 22, 2018 at 6:21 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
> > >
> > > Add generic recipe for SPIRV-Cross tool.
> > >
> > > Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> > > ---
> > >  ...0001-Add-install-PHONY-target-in-Makefile.patch | 31 ++++++++++++++++++++++
> > >  meta-oe/recipes-graphics/spir/spirv-cross_git.bb   | 22 +++++++++++++++
> > >  2 files changed, 53 insertions(+)
> > >  create mode 100644 meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-target-in-Makefile.patch
> > >  create mode 100644 meta-oe/recipes-graphics/spir/spirv-cross_git.bb
> > >
> > > diff --git a/meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-target-in-Makefile.patch b/meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-target-in-Makefile.patch
> > > new file mode 100644
> > > index 0000000..78598ea
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-target-in-Makefile.patch
> > > @@ -0,0 +1,31 @@
> > > +From 8d9870b66c3cfcf12ce7e8e013946e2a215bb722 Mon Sep 17 00:00:00 2001
> > > +From: Ankit Navik <ankit.tarot@gmail.com>
> > > +Date: Sat, 22 Dec 2018 19:16:02 +0530
> > > +Subject: [PATCH] Add install PHONY target in Makefile
> > > +
> > > +---
> > > + Makefile | 8 +++++++-
> > > + 1 file changed, 7 insertions(+), 1 deletion(-)
> > > +
> > > +diff --git a/Makefile b/Makefile
> > > +index 0564b65..0993372 100644
> > > +--- a/Makefile
> > > ++++ b/Makefile
> > > +@@ -35,7 +35,13 @@ $(STATIC_LIB): $(OBJECTS)
> > > + %.o: %.cpp
> > > +       $(CXX) -c -o $@ $< $(CXXFLAGS) -MMD
> > > +
> > > ++install:
> > > ++      mkdir -p $(TARGET_DIR_BIN)
> > > ++      mkdir -p $(TARGET_DIR_LIB)
> > > ++      cp $(TARGET) $(TARGET_DIR_BIN)/
> > > ++      cp $(STATIC_LIB) $(TARGET_DIR_LIB)/
> > > ++
> > > + clean:
> > > +       rm -f $(TARGET) $(OBJECTS) $(CLI_OBJECTS) $(STATIC_LIB) $(DEPS)
> > > +
> > > +-.PHONY: clean
> > > ++.PHONY: all install clean
> > > +--
> > > +2.7.4
> > > +
> > > diff --git a/meta-oe/recipes-graphics/spir/spirv-cross_git.bb b/meta-oe/recipes-graphics/spir/spirv-cross_git.bb
> > > new file mode 100644
> > > index 0000000..b787972
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-graphics/spir/spirv-cross_git.bb
> > > @@ -0,0 +1,22 @@
> > > +SUMMARY  = "SPIRV-Cross is a tool designed for parsing and converting SPIR-V \
> > > +to other shader languages"
> > > +LICENSE  = "Apache-2.0"
> > > +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> > > +SECTION = "graphics"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +SRCREV = "ed16b3e69985feaf565efbecea70a1cc2fca2a58"
> > > +SRC_URI = "git://github.com/KhronosGroup/SPIRV-Cross.git \
> > > +       file://0001-Add-install-PHONY-target-in-Makefile.patch \
> > > +"
> > > +
> > > +EXTRA_OEMAKE += 'TARGET_DIR_LIB="${D}${libdir}"'
> > > +EXTRA_OEMAKE += 'TARGET_DIR_BIN="${D}${bindir}"'
> > > +
> > > +do_compile () {
> > > +       cd ${S} && oe_runmake
> > > +}
> > > +
> > > +do_install () {
> > > +       cd ${S} && oe_runmake install
> > > +}
> >
> > this is not inheriting cross class, I think its better to rename it
> > something not cross
> > may be spirv-compiler or some such
> The SPIRV-cross is tool for parsing and converting from spirv to
> other shader language(s).
> I kept PN similar to github source.

Right, however -cross has slightly different semantics in OE cross
compiling world
where cross would indicate this package runs on build host and
generates code for
target host that OE defines. and there ares some assumptions bases on
that. May be
spirv-shader-generator is better.

> spirv-compiler may not be be a good idea, because there is a
> spirv-llvm (front end compiler).
> Let me know any other suggestion.
>
> Regards, Ankit

