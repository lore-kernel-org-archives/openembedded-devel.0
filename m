Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4A97A6C0E8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2018 17:33:20 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id c123so4070362pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2018 09:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FQUE6rUrkMMaPbVqPHA2SkwJEG6YM40T257HDu3YZ9s=;
	b=OTgw1Xw8vSnDYSR06yUsHfsUt/Ma3OI7uBcJQ2IfNlxfNGC1nQlFSMorAsYDXAi+Jf
	cXzG334PThUH7BbdGl5zaKtny7WnE3IyrR48B9YCgvCSkD3jByxnkj7rlvrceQaCUKYM
	vO81myIduolUzxkPRJhY71XMRXG6CZrOgXjbAEvSpezT/6VP6EF/JAtMOuIZpCLSC6A0
	rgzk0OOm+c2Xr8rIF8n2uEs7l+XG7ikqBT6qIs1laTIOCOn2dJ2JKEW+0jGaE94nkIEG
	2OelLve3o3mjQxM786dbwzsL0kbboY4BUgjjzHruvfScEPO/3BRUzxc2I9bmThpxJGUh
	NmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FQUE6rUrkMMaPbVqPHA2SkwJEG6YM40T257HDu3YZ9s=;
	b=iPidCPjAXz176mm+bNOASN9f1Yc8W33S1+l6omEKpBcsQd5q6TeMzbKSC6o5D4C6yz
	0P58G87bI4B1rF90fE+Me2YHCaGujOfJVCAzWs7Pp5lk3E7B3NJ1/iXrMy9GnWRN8rdP
	SI+V58wyHnWc1x/zzYWVCZbpBGrrvVbQjTgYFYXvuj69F2TDm/oJsfBgR1eD1bYueFU7
	J73oXwqlnTPbeCDmDuvoah/hvFZ5F6ILzNtRRIbM1T9cHwyD+e8/5PdlznTfk7GqZaXM
	Qvnua/ENu17F1/tSbEGdU1DO+W9/C46u+VLl8/x1DH02KreCgbo+Jq5gnaFehyTlpiaZ
	dDEA==
X-Gm-Message-State: AJcUukfNXzJvFeXJkC1vBLiyRyBSKYS36VvzdC7JaoEk3K/793wETFID
	jv1Vy55M9t0ofoMOzlYM//XjqUyo32uK41FZziI=
X-Google-Smtp-Source: ALg8bN5va9ES5Lh0mLTo3OjsNzDt5to88c1FLPB20gM1r/0Rr5sAsMGuzOpzHx0w5yDxDQx3++hxHwf2JB5wuGVbY+4=
X-Received: by 2002:a63:8742:: with SMTP id i63mr6784573pge.298.1545500001181; 
	Sat, 22 Dec 2018 09:33:21 -0800 (PST)
MIME-Version: 1.0
References: <1545488571-406-1-git-send-email-ankit.tarot@gmail.com>
	<CAMKF1spMgZDWJ61BeLkAWrG3ytgm=rHA9aOYWgpzbpHAjBx7kA@mail.gmail.com>
	<CAM_RqkNu6iqMW_7D2TRfir1KP8f4eg=3JqUJfYF2s_6D67ejmQ@mail.gmail.com>
	<CAMKF1sr3wOLpao11MC_U2Vj9fnPSAT3CA+Sitq5hGzc2Ssu=BA@mail.gmail.com>
In-Reply-To: <CAMKF1sr3wOLpao11MC_U2Vj9fnPSAT3CA+Sitq5hGzc2Ssu=BA@mail.gmail.com>
From: Ankit Navik <ankit.tarot@gmail.com>
Date: Sat, 22 Dec 2018 23:03:09 +0530
Message-ID: <CAM_RqkNCQfvTkd6q9EihT1vf9kS+aGnUJqBYiRgccfsyRH7-Pg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Sat, 22 Dec 2018 17:33:20 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Raj,

On Sat, Dec 22, 2018 at 10:56 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Dec 22, 2018 at 8:33 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
> >
> > Hi Raj,
> >
> > On Sat, Dec 22, 2018 at 9:40 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Sat, Dec 22, 2018 at 6:21 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
> > > >
> > > > Add generic recipe for SPIRV-Cross tool.
> > > >
> > > > Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> > > > ---
> > > >  ...0001-Add-install-PHONY-target-in-Makefile.patch | 31 ++++++++++++++++++++++
> > > >  meta-oe/recipes-graphics/spir/spirv-cross_git.bb   | 22 +++++++++++++++
> > > >  2 files changed, 53 insertions(+)
> > > >  create mode 100644 meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-target-in-Makefile.patch
> > > >  create mode 100644 meta-oe/recipes-graphics/spir/spirv-cross_git.bb
> > > >
> > > > diff --git a/meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-target-in-Makefile.patch b/meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-target-in-Makefile.patch
> > > > new file mode 100644
> > > > index 0000000..78598ea
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-target-in-Makefile.patch
> > > > @@ -0,0 +1,31 @@
> > > > +From 8d9870b66c3cfcf12ce7e8e013946e2a215bb722 Mon Sep 17 00:00:00 2001
> > > > +From: Ankit Navik <ankit.tarot@gmail.com>
> > > > +Date: Sat, 22 Dec 2018 19:16:02 +0530
> > > > +Subject: [PATCH] Add install PHONY target in Makefile
> > > > +
> > > > +---
> > > > + Makefile | 8 +++++++-
> > > > + 1 file changed, 7 insertions(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/Makefile b/Makefile
> > > > +index 0564b65..0993372 100644
> > > > +--- a/Makefile
> > > > ++++ b/Makefile
> > > > +@@ -35,7 +35,13 @@ $(STATIC_LIB): $(OBJECTS)
> > > > + %.o: %.cpp
> > > > +       $(CXX) -c -o $@ $< $(CXXFLAGS) -MMD
> > > > +
> > > > ++install:
> > > > ++      mkdir -p $(TARGET_DIR_BIN)
> > > > ++      mkdir -p $(TARGET_DIR_LIB)
> > > > ++      cp $(TARGET) $(TARGET_DIR_BIN)/
> > > > ++      cp $(STATIC_LIB) $(TARGET_DIR_LIB)/
> > > > ++
> > > > + clean:
> > > > +       rm -f $(TARGET) $(OBJECTS) $(CLI_OBJECTS) $(STATIC_LIB) $(DEPS)
> > > > +
> > > > +-.PHONY: clean
> > > > ++.PHONY: all install clean
> > > > +--
> > > > +2.7.4
> > > > +
> > > > diff --git a/meta-oe/recipes-graphics/spir/spirv-cross_git.bb b/meta-oe/recipes-graphics/spir/spirv-cross_git.bb
> > > > new file mode 100644
> > > > index 0000000..b787972
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-graphics/spir/spirv-cross_git.bb
> > > > @@ -0,0 +1,22 @@
> > > > +SUMMARY  = "SPIRV-Cross is a tool designed for parsing and converting SPIR-V \
> > > > +to other shader languages"
> > > > +LICENSE  = "Apache-2.0"
> > > > +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> > > > +SECTION = "graphics"
> > > > +
> > > > +S = "${WORKDIR}/git"
> > > > +SRCREV = "ed16b3e69985feaf565efbecea70a1cc2fca2a58"
> > > > +SRC_URI = "git://github.com/KhronosGroup/SPIRV-Cross.git \
> > > > +       file://0001-Add-install-PHONY-target-in-Makefile.patch \
> > > > +"
> > > > +
> > > > +EXTRA_OEMAKE += 'TARGET_DIR_LIB="${D}${libdir}"'
> > > > +EXTRA_OEMAKE += 'TARGET_DIR_BIN="${D}${bindir}"'
> > > > +
> > > > +do_compile () {
> > > > +       cd ${S} && oe_runmake
> > > > +}
> > > > +
> > > > +do_install () {
> > > > +       cd ${S} && oe_runmake install
> > > > +}
> > >
> > > this is not inheriting cross class, I think its better to rename it
> > > something not cross
> > > may be spirv-compiler or some such
> > The SPIRV-cross is tool for parsing and converting from spirv to
> > other shader language(s).
> > I kept PN similar to github source.
>
> Right, however -cross has slightly different semantics in OE cross
> compiling world
> where cross would indicate this package runs on build host and
> generates code for
> target host that OE defines. and there ares some assumptions bases on
> that. May be
> spirv-shader-generator is better.

Thank you for the clarification.
Will incorporate in v2 patch.
Regards, Ankit
>
> > spirv-compiler may not be be a good idea, because there is a
> > spirv-llvm (front end compiler).
> > Let me know any other suggestion.
> >
> > Regards, Ankit

