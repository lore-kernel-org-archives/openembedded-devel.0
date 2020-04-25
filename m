Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web12.571.1587831902017832602
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Apr 2020 09:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@alistair23.me header.s=fm3 header.b=Aw7e9qLn;
 spf=none, err=permanent DNS error (domain: alistair23.me, ip: 66.111.4.27, mailfrom: alistair@alistair23.me)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 453D75C01A3
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Apr 2020 12:25:01 -0400 (EDT)
Received: from imap26 ([10.202.2.76])
  by compute3.internal (MEProxy); Sat, 25 Apr 2020 12:25:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm3; bh=kaT3h9Xxa+M0SZSHDFWeVRmj0jJRNoX
	Q+x9327hgIYs=; b=Aw7e9qLn1qry03yXzYZutJar1Ug+XMHIt8l3j9IHwkVJRXO
	hVB/kSKeTgAL/DZ69hyGl12WAcfhENrHDTEMhYhlhkba0qAc2SzMUC59huPF7X0Z
	FB3/dRrng4Cbt4BHrCkbGQrOx4L+J9ma1/U21ZvJgz0uLuCN6BD82wgoWX9b57Zk
	eFvDTu7l/OYYLUzrBFG8+9XtKTMizkgHfW6+l/OkvB0nway4z2YrPmCflbEqME+K
	ZM9KlMEq2fTZwkQRqW6X82qZLL6DUY4arB6XKIz1v/nHdCUc9xfi5Z72kwtCf3tw
	X+SzdHEAzvqn7kEDwrXL7o6Pqfqv3f+yLS46StQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kaT3h9
	Xxa+M0SZSHDFWeVRmj0jJRNoXQ+x9327hgIYs=; b=EqxTx3yHBCef/cAA4OyDW1
	dePNqE/syutp+MEglFqZJKxOyYeCCpTvZQDIEnyhoEL5an2GlbPDM5wRJg9DIAO9
	MujUNtJYFKcct3MBY3f+hy+CRyog1pPbkwwDgWNtMAqieDAN0xoqmmagRdIzj8Bi
	TSrW1mGnEmhJq9Jukg7GMRBAT9hlOwqMdCWS0ccCmOCRlgci0cXj1Z7EUcc8Oo9K
	kmxXvxomSVxO//BRC3nmp98M44VWM9ocUoO58I1ZDBYcRNDhzLcKjuQEmM07fIop
	oLt5sG106OvvZmZkNsaRsyfDQtJZLQk9ukDJDor5UTHXDNTWlaJ6Tay/C8gD7RiQ
	==
X-ME-Sender: <xms:XGSkXnO6APdwOJtMR-sVhFH53lFQRYZ5H0yUqNKpvEuiLAtNnr-UAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrheeggdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
    dtreertdenucfhrhhomheptehlihhsthgrihhruceorghlihhsthgrihhrsegrlhhishht
    rghirhdvfedrmhgvqeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpd
    hgihhthhhusgdrtghomhdpohhpvghnvghmsggvugguvggurdhorhhgnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlh
    hishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:XGSkXreXR6oTYRh9S_cor-f3UkBg-K9y2TEezcYxbFvKQg7aD2au-w>
    <xmx:XGSkXqgvMZT1SR-pTPb_7pk-bL3GicQagGqF8r871b674IczN6-AzQ>
    <xmx:XGSkXjSFH1c72U9gyKKHMD6yO-po5ShplkL0dE5npxMKYMLYk4YGzw>
    <xmx:XWSkXtdyKkO-mfZ7dgzKPTFg8zIhIK-xoVGeGunHA7WeVZT78y3GwA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C8CC614200A2; Sat, 25 Apr 2020 12:25:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <f1b7f208-b5c1-4f4a-9bd6-2b2c13475b56@www.fastmail.com>
In-Reply-To: <620ca6fb-ba03-0e57-aa7b-6d25e490a616@gmail.com>
References: <20200424063130.386675-1-alistair@alistair23.me>
 <CAMKF1srb+fSYRjhBjmA+dH7HN_M+rckXJj+f5y0T8JPn4fQ1hQ@mail.gmail.com>
 <ee033791-f139-45a9-b8b4-4cbd68962744@www.fastmail.com>
 <620ca6fb-ba03-0e57-aa7b-6d25e490a616@gmail.com>
Date: Sat, 25 Apr 2020 09:16:32 -0700
From: "Alistair" <alistair@alistair23.me>
To: 
 ";openembedded-devel@lists.openembedded.org;;;" <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH] libgit2: Update to v1.0.0
Content-Type: text/plain

On Fri, Apr 24, 2020, at 6:04 PM, Khem Raj wrote:
> 
> 
> On 4/24/20 5:39 PM, Alistair wrote:
> > On Fri, Apr 24, 2020, at 2:16 PM, Khem Raj wrote:
> >> This update has some issues
> >>
> >> Fails on qemux86/clang
> >> https://errors.yoctoproject.org/Errors/Details/407382/
> > 
> > I tried to reproduce this with:
> > 
> > MACHINE=qemux86 TOOLCHAIN="clang" bitbake libgit2
> 
> I think you need meta-clang in layer mix. and then set TOOLCHAIN =
> "clang" in local.conf, I will try to see as well, it seems its finding a
> library in native sysroot :( which should otherwise be in target sysroot

Yep, I checked and I have meta-clang and set TOOLCHAIN.

> 
> and the reason is that its happily adding libraries in linker cmdline.
> So something is in CMakefile which is not differentiating native sysroot
> from target sysroot.

Is it possible the build wasn't clean before hand? In my testing I saw some linker issues which was fixed by cleaning the build files.

> 
> -Wl,-rpath,TOPDIR/build/tmp/work/core2-32-yoe-linux/libgit2/1.0.0-r0/recipe-sysroot-native/usr/lib
> ...
> 
> TOPDIR/build/tmp/work/core2-32-yoe-linux/libgit2/1.0.0-r0/recipe-sysroot-native/usr/lib/libpcre.so
> TOPDIR/build/tmp/work/core2-32-yoe-linux/libgit2/1.0.0-r0/recipe-sysroot-native/usr/lib/libpcreposix.so
> 
> ...
> 
> 
> core2-32-yoe-linux/libgit2/1.0.0-r0/recipe-sysroot-native/usr/lib/libpcre.so:
> error adding symbols: file in wrong format

I don't see the error and I'm not really sure what to do.

Alistair

> 
> > 
> > but it build for me. What am I missing?
> > 
> >>
> >> for glibc/musl there is another failure which is caused by this
> >>
> >> https://errors.yoctoproject.org/Errors/Details/407386/
> > 
> > I have a patch for this. I'll send it out with v2.
> > 
> 
> OK
> 
> > Alistair
> > 
> >>
> >> On Thu, Apr 23, 2020 at 11:31 PM Alistair <alistair@alistair23.me> wrote:
> >>>
> >>> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> >>> ---
> >>> .../libgit2/{libgit2_0.28.4.bb => libgit2_1.0.0.bb} | 6 +++---
> >>> 1 file changed, 3 insertions(+), 3 deletions(-)
> >>> rename meta-oe/recipes-support/libgit2/{libgit2_0.28.4.bb => libgit2_1.0.0.bb} (64%)
> >>>
> >>> diff --git a/meta-oe/recipes-support/libgit2/libgit2_0.28.4.bb b/meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
> >>> similarity index 64%
> >>> rename from meta-oe/recipes-support/libgit2/libgit2_0.28.4.bb
> >>> rename to meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
> >>> index 9b9c19104..fd26a0fe9 100644
> >>> --- a/meta-oe/recipes-support/libgit2/libgit2_0.28.4.bb
> >>> +++ b/meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
> >>> @@ -1,12 +1,12 @@
> >>> SUMMARY = "the Git linkable library"
> >>> HOMEPAGE = "http://libgit2.github.com/"
> >>> LICENSE = "GPL-2.0-with-GCC-exception & MIT"
> >>> -LIC_FILES_CHKSUM = "file://COPYING;md5=3f2cd5d3cccd71d62066ba619614592b"
> >>> +LIC_FILES_CHKSUM = "file://COPYING;md5=5b002a195fb7ea2d8d583f07eaff3a8e"
> >>>
> >>> DEPENDS = "curl openssl zlib libssh2 libgcrypt"
> >>>
> >>> -SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v0.28"
> >>> -SRCREV = "106a5f27586504ea371528191f0ea3aac2ad432b"
> >>> +SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.0"
> >>> +SRCREV = "7d3c7057f0e774aecd6fc4ef8333e69e5c4873e0"
> >>>
> >>> S = "${WORKDIR}/git"
> >>>
> >>> --
> >>> 2.26.0
> >>>
> >>>
> >>
> >>
> >>
> >>
> >> 
> 
> 
> 
> 
> 
> *Attachments:*
>  * signature.asc
