Return-Path: <nickdademo@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id EB05D60196
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 13:57:28 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id uy5so1217899obc.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 06:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=A8zQh6iOHAzkxoUb0SkdR50syF/Qzt6MT7IJ10jcE/I=;
	b=VPiUWbWdqK9DM6fR6ApqJAeY0hvidLxqmsktmYbL82zIn6XKvRWsWBVmWFSpA9vp8O
	YQI8TEdUDsPHx0Q73bLjIHjuyCQVKEJNlc8T7IqWogC7jKRaxxM7HfCvhQFZtbjcnjrD
	Tld6i72Y/FvGPf8DukRs8Zn65iGMmyXPEef/fpGB9oR0dmc4ujdeWV5plE0/q8NiMzr7
	kZ7C0w9Nexre0dah406QMrDf9UbgWucKdWzy/jhzyOQhvsg35HM1V2yRQ8sn3XlhIK+X
	+bnNnaxf5y5FnDUZtOafXbUP5SoKcIhxIxsRA9+pGfI1t3EAr+Rx7IXTxItvw5DKLW1g
	VmeQ==
X-Received: by 10.60.142.229 with SMTP id rz5mr46111541oeb.1.1399471049389;
	Wed, 07 May 2014 06:57:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.85.33 with HTTP; Wed, 7 May 2014 06:57:09 -0700 (PDT)
In-Reply-To: <20140506222845.GE30955@jama>
References: <1399414836-16702-1-git-send-email-nickdademo@gmail.com>
	<20140506222845.GE30955@jama>
From: "Nick D'Ademo" <nickdademo@gmail.com>
Date: Wed, 7 May 2014 23:57:09 +1000
Message-ID: <CANR6C555Le4jbMW=h3wrSedJgHKWZDnW6WZoz48GJo2dDwd_4A@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] opencv: Bump SRCREV to 2.4.9 release tag, PV is now 2.4.9+git.
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
X-List-Received-Date: Wed, 07 May 2014 13:57:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

The recipe successfully builds without errors (multilib build) - however, I
also had no dependencies issues with the previous version of the recipe
either (2.4.8+git).


On Wed, May 7, 2014 at 8:28 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Wed, May 07, 2014 at 08:20:36AM +1000, Nick D'Ademo wrote:
> > Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
>
> Does it fix this issue reported in test-dependencies report?
>
> opencv/libopencv-highgui/latest lost dependency on  jasper libdc1394
>
> > ---
> >  meta-oe/recipes-support/opencv/opencv_2.4.bb |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bbb/meta-oe/recipes-support/opencv/
> opencv_2.4.bb
> > index df512f6..43e6a2b 100644
> > --- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
> > +++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
> > @@ -9,12 +9,12 @@ ARM_INSTRUCTION_SET = "arm"
> >
> >  DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib
> glib-2.0"
> >
> > -SRCREV = "a4b34e7ae10351fc4d30dc55995679340efc488e"
> > +SRCREV = "df8e28283f09825cca0c2902160b7abebcfe1b64"
> >  SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4 \
> >             file://opencv-fix-pkgconfig-generation.patch \
> >  "
> >
> > -PV = "2.4.8+git${SRCPV}"
> > +PV = "2.4.9+git${SRCPV}"
> >
> >  S = "${WORKDIR}/git"
> >
> > --
> > 1.7.9.5
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

