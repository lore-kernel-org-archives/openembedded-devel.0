Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5A5596AC6B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Oct 2014 21:53:10 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id 10so3333485lbg.18
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Oct 2014 14:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=WTaJSRgrCI2uQoEvTEm8c7d3DYDVssuyzDdjo21g3ZA=;
	b=mTxFedsj6tqBCdGLtfZfana1R71XsLD6NEUW4So9+cwI5Bax7kZb8O3HDXVV7KMNVo
	1RjH1ROnFvCrfRYMrzUFN2KQKzyOgGAsiiSryTCeJllNVnHQQVVsyQdIdZJnrIHYU75V
	0mojJpuxCa7W0HuV8Jx+8aVCegH0xp9D5RnH2RQOkQK1cnoy3uKKuaRcSLfA2h+AtWgk
	VuroXa0aplld0RBfGfNqfzkxBgi3bW78zAVYmDG2QvzAuHKXomm6lsdYbHmjju2uI117
	2L+RKwOgD1WRgbVoC6C66CA7ECajbDEwEhbcjnOBvMaa0qnjqr/jnP8T+TBzpVeOVhIa
	63oQ==
MIME-Version: 1.0
X-Received: by 10.112.54.130 with SMTP id j2mr19491305lbp.41.1412545990108;
	Sun, 05 Oct 2014 14:53:10 -0700 (PDT)
Received: by 10.112.189.38 with HTTP; Sun, 5 Oct 2014 14:53:10 -0700 (PDT)
In-Reply-To: <20141005214342.GS25706@jama>
References: <1412543993-30871-1-git-send-email-andrea.adami@gmail.com>
	<20141005214342.GS25706@jama>
Date: Sun, 5 Oct 2014 23:53:10 +0200
Message-ID: <CAAQYJAuPr0hajJNDwrTjTY1JoCCcyS6sKbXF5SkMQnkgWsujgg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-handheld][PATCH] encdec-updater: remove COMPATIBLE_MACHINE
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
X-List-Received-Date: Sun, 05 Oct 2014 21:53:17 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 5, 2014 at 11:43 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Sun, Oct 05, 2014 at 11:19:53PM +0200, Andrea Adami wrote:
> > The recipe is using BBCLASSEXTEND = "native" and as it is not buildable:
> >
> > NOTE: Resolving any missing task queue dependencies
> > ERROR: Nothing PROVIDES 'encdec-updater-native'
> >  (but /oe/meta-handheld/recipes-bsp/zaurus-utils/zaurus-updater.bb
> >   DEPENDS on or otherwise requires it)
> > ERROR: encdec-updater-native was skipped: incompatible with machine
> poodle
> >  (not in COMPATIBLE_MACHINE)
> > ERROR: Required build target 'zaurus-installer' has no buildable
> providers.
> > Missing or unbuildable dependency chain was:
> >  ['zaurus-installer', 'zaurus-updater', 'encdec-updater-native']
> >
> > Remove COMPAIBLE_MACHINE alltogether.
> > While there, remove PR remnant.
> >
> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > ---
> >  recipes-bsp/zaurus-utils/encdec-updater.bb | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/recipes-bsp/zaurus-utils/encdec-updater.bb
> b/recipes-bsp/zaurus-utils/encdec-updater.bb
> > index 1ee2e77..138cd26 100644
> > --- a/recipes-bsp/zaurus-utils/encdec-updater.bb
> > +++ b/recipes-bsp/zaurus-utils/encdec-updater.bb
> > @@ -2,7 +2,6 @@ DESCRIPTION = "A tool to encode and decode the Sharp
> Zaurus updater.sh script"
> >  SECTION = "console/utils"
> >  LICENSE = "GPLv2+"
> >  LIC_FILES_CHKSUM =
> "file://encsh.c;endline=15;md5=d73360c98c2885be19245f2a8c728f38"
> > -PR = "r2"
>
> That would make the version going backwards.
>
> There are absolutely no changes


>  SRC_URI = "
> http://distro.ibiblio.org/pub/linux/distributions/pdaxrom/download/1.1.0beta4/src/survive-1.1.0.tar.bz2
> "
> >
> > @@ -21,6 +20,3 @@ do_install() {
> >  }
> >
> >  BBCLASSEXTEND = "native"
> > -
> > -COMPATIBLE_MACHINE = "(poodle|c7x0|spitz|akita|tosa)"
>
> Why don't you keep it with _class-target override?
>
>
I first did that adding COMPATIBLE_MACHINE_class-native = "" or the
oppopsite COMPATIBLE_MACHINE_class-target =
"(poodle|c7x0|spitz|akita|tosa)" but finally the updater itself is not
machine-specific and can be built for any target (using it on non-Zaurus
would be bizarre, though).

So I decided to remove it alltogether for the sake of simplicity.

What's interesting is why did error was not shown before...this is one of
OE's oldest recipes...

Cheers

Andrea


> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

