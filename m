Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 859AE6C0DB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2018 16:33:22 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id z23so3900942plo.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2018 08:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Bj4KXRYPSe7s/j9BJeDfkRsGD2rcIwxH4Hgr09jfDeY=;
	b=ZJee54sv09jaC1Fj6SaumbUMpRlQykZxAuc+yH7ZDenc6RX2ZgJ+3jKAws/62U5WZ3
	6Ek4yvFD5xAfHq1ZCehVgx8LqYqsX3vkEia9dTjnE2DehdPkgpWGP0qCA19TUB6tJlOT
	nl75oY1aMlavwmypRK8Ziu3UG771WzuyBeOXccp62pv4il8FNz8i1i3z2/7wp4fIaLtR
	4Q26JLOEQgP5Hnger1bjFAoX2NeVJcQ3ZCp6M58WKKpiNrtwtPayUSF08yr+hiE/rweS
	6Nbxj2cI4UaveBGpKekL7LxFCF6srmng9z1H4va8nKtIHyUsLO055wq4yInwWZrrBS/x
	Ml3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Bj4KXRYPSe7s/j9BJeDfkRsGD2rcIwxH4Hgr09jfDeY=;
	b=NWOPcBVI7/E6KfHAmwxBRgTktXBrlt8M0Pt/YA7WnCigAjKNfMSjtLNtFfSWy/wKuD
	tR6Gl/RhpYuw3eteRISHFKkf8PDBQQGjJmWFUxIzaIKVqlllQjtx6FiNcBWtfkJkJe5A
	xklkEP5UEkzzudbv+DbJK7sTjQkG7WrKO4C1giuiE8MqiX4Vww7oqKLUMRZwsVmfBUBK
	am60WYNRtF32rAXQHuTWomZAlcHyQREmbK8fa6i4gvn3Blw0sep7JipSBkvRjAmFYh5B
	bwEy/cJvEi48wYhWYtjtrvCnMJumAlPut4O0RAPyMbKlogYOwciNO+QelqVpn588UJav
	ba9g==
X-Gm-Message-State: AJcUukf78FO6d4Ftx5KViWRncfdbDLw34+TEUGarADMmn06odJ0gBC98
	7zx/ZY51vtaVVG5bzprnBfWIgKpgs6XVVmlRYRM=
X-Google-Smtp-Source: ALg8bN4ZSzWtkLO85/6tUK6G1wUpERcav0XhBrqZ/L44aPU5b4OabdJGP6z/Npa83pqWXz2Rq0qiF3oZuao1Y8s7iug=
X-Received: by 2002:a17:902:7d82:: with SMTP id
	a2mr7023675plm.163.1545496403301; 
	Sat, 22 Dec 2018 08:33:23 -0800 (PST)
MIME-Version: 1.0
References: <1545488571-406-1-git-send-email-ankit.tarot@gmail.com>
	<CAMKF1spMgZDWJ61BeLkAWrG3ytgm=rHA9aOYWgpzbpHAjBx7kA@mail.gmail.com>
In-Reply-To: <CAMKF1spMgZDWJ61BeLkAWrG3ytgm=rHA9aOYWgpzbpHAjBx7kA@mail.gmail.com>
From: Ankit Navik <ankit.tarot@gmail.com>
Date: Sat, 22 Dec 2018 22:03:11 +0530
Message-ID: <CAM_RqkNu6iqMW_7D2TRfir1KP8f4eg=3JqUJfYF2s_6D67ejmQ@mail.gmail.com>
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
X-List-Received-Date: Sat, 22 Dec 2018 16:33:22 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Raj,

On Sat, Dec 22, 2018 at 9:40 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Dec 22, 2018 at 6:21 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
> >
> > Add generic recipe for SPIRV-Cross tool.
> >
> > Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> > ---
> >  ...0001-Add-install-PHONY-target-in-Makefile.patch | 31 ++++++++++++++++++++++
> >  meta-oe/recipes-graphics/spir/spirv-cross_git.bb   | 22 +++++++++++++++
> >  2 files changed, 53 insertions(+)
> >  create mode 100644 meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-target-in-Makefile.patch
> >  create mode 100644 meta-oe/recipes-graphics/spir/spirv-cross_git.bb
> >
> > diff --git a/meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-target-in-Makefile.patch b/meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-target-in-Makefile.patch
> > new file mode 100644
> > index 0000000..78598ea
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-target-in-Makefile.patch
> > @@ -0,0 +1,31 @@
> > +From 8d9870b66c3cfcf12ce7e8e013946e2a215bb722 Mon Sep 17 00:00:00 2001
> > +From: Ankit Navik <ankit.tarot@gmail.com>
> > +Date: Sat, 22 Dec 2018 19:16:02 +0530
> > +Subject: [PATCH] Add install PHONY target in Makefile
> > +
> > +---
> > + Makefile | 8 +++++++-
> > + 1 file changed, 7 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 0564b65..0993372 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -35,7 +35,13 @@ $(STATIC_LIB): $(OBJECTS)
> > + %.o: %.cpp
> > +       $(CXX) -c -o $@ $< $(CXXFLAGS) -MMD
> > +
> > ++install:
> > ++      mkdir -p $(TARGET_DIR_BIN)
> > ++      mkdir -p $(TARGET_DIR_LIB)
> > ++      cp $(TARGET) $(TARGET_DIR_BIN)/
> > ++      cp $(STATIC_LIB) $(TARGET_DIR_LIB)/
> > ++
> > + clean:
> > +       rm -f $(TARGET) $(OBJECTS) $(CLI_OBJECTS) $(STATIC_LIB) $(DEPS)
> > +
> > +-.PHONY: clean
> > ++.PHONY: all install clean
> > +--
> > +2.7.4
> > +
> > diff --git a/meta-oe/recipes-graphics/spir/spirv-cross_git.bb b/meta-oe/recipes-graphics/spir/spirv-cross_git.bb
> > new file mode 100644
> > index 0000000..b787972
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/spir/spirv-cross_git.bb
> > @@ -0,0 +1,22 @@
> > +SUMMARY  = "SPIRV-Cross is a tool designed for parsing and converting SPIR-V \
> > +to other shader languages"
> > +LICENSE  = "Apache-2.0"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> > +SECTION = "graphics"
> > +
> > +S = "${WORKDIR}/git"
> > +SRCREV = "ed16b3e69985feaf565efbecea70a1cc2fca2a58"
> > +SRC_URI = "git://github.com/KhronosGroup/SPIRV-Cross.git \
> > +       file://0001-Add-install-PHONY-target-in-Makefile.patch \
> > +"
> > +
> > +EXTRA_OEMAKE += 'TARGET_DIR_LIB="${D}${libdir}"'
> > +EXTRA_OEMAKE += 'TARGET_DIR_BIN="${D}${bindir}"'
> > +
> > +do_compile () {
> > +       cd ${S} && oe_runmake
> > +}
> > +
> > +do_install () {
> > +       cd ${S} && oe_runmake install
> > +}
>
> this is not inheriting cross class, I think its better to rename it
> something not cross
> may be spirv-compiler or some such
The SPIRV-cross is tool for parsing and converting from spirv to
other shader language(s).
I kept PN similar to github source.
spirv-compiler may not be be a good idea, because there is a
spirv-llvm (front end compiler).
Let me know any other suggestion.

Regards, Ankit

