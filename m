Return-Path: <martin.jansa@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 245366F57E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Mar 2014 14:32:26 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 20so6885641yks.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Mar 2014 06:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=HCmEsAW5PXbvSwrNmQ4/XkopQSJFT+ewNmN7J73KZwI=;
	b=H2sEMzlpgwVEgSiFh6zUouU9ifsbsnVDriAJ8XgnPnB6ob9KLTVKq2B7MsyvKUzx+C
	HlNx3nbHbTc1ZEs9P75dd2SCD7i3aq1GUE5iV5kB2d4ddzKFija/qSeO0sOqJjq2bQgi
	CtcLJ1+uEZiFnYnWwQJZDzhoB4MDACjjZL/W1I2+foJf7Oabm4ODctfb0dTN99IUhIw1
	H/5Cz/rmRYHekZLxNlrBZdOaTl8tn5bi2izWoa70uMGOwlnzd3xAmYtpiRSVQE50weum
	gfTYw1kxFGzWUdYK/6O+i7wjEbhqnggmdsSyk2mnKqtLHDEqqfYPw8Ovr0Y/B+lFhdBK
	njbA==
MIME-Version: 1.0
X-Received: by 10.236.93.43 with SMTP id k31mr15172532yhf.88.1394116346475;
	Thu, 06 Mar 2014 06:32:26 -0800 (PST)
Received: by 10.170.159.197 with HTTP; Thu, 6 Mar 2014 06:32:26 -0800 (PST)
In-Reply-To: <CALbNGRQWbBfSLrCHespVnOvywa+ah+dBhy2A3Mz9XCKvj6WY_w@mail.gmail.com>
References: <1393348614-15618-1-git-send-email-schnitzeltony@googlemail.com>
	<1393348614-15618-2-git-send-email-schnitzeltony@googlemail.com>
	<20140225172747.GR26981@jama>
	<CALbNGRSk-Cbv8nyEhUANsJ+ib2U7xfTDqTYogVoohFb=17WB5Q@mail.gmail.com>
	<CALbNGRQWbBfSLrCHespVnOvywa+ah+dBhy2A3Mz9XCKvj6WY_w@mail.gmail.com>
Date: Thu, 6 Mar 2014 15:32:26 +0100
Message-ID: <CA+chaQeACTZVM8BAuZ0p-_g4YoUkw_HSza2Skb=ZAY1pxU-v6Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH][meta-qt5][jansa/qt5-5.2.1] qtbase.inc: set virtual/mesa and virtual/egl as dependency in PACKAGECONFIG[kms]
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
X-List-Received-Date: Thu, 06 Mar 2014 14:32:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

It's already in master-next, will be merged soon, sorry for delay.


On Thu, Mar 6, 2014 at 3:00 PM, Andreas M=C3=BCller <schnitzeltony@googlema=
il.com
> wrote:

> On Tue, Feb 25, 2014 at 8:06 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> > On Tue, Feb 25, 2014 at 6:27 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >> On Tue, Feb 25, 2014 at 06:16:54PM +0100, Andreas M=C3=BCller wrote:
> >>> * there is no kms around
> >>> * mesa is the default implementation for (lib)gbm (see
> config.tests/qpa/kms)
> >>> * in configure we find:
> >>>   | if [ "$CFG_KMS" =3D "yes" ]; then
> >>>   |     if [ "$CFG_EGL" =3D "no" ]; then
> >>>   |         echo "The KMS plugin requires EGL support and cannot be
> built"
> >>>   |         exit 101
> >>>   |     fi
> >>>   | fi
> >>>
> >>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> >>> ---
> >>>  recipes-qt/qt5/qtbase.inc | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> >>> index 116c86f..6c6ec5a 100644
> >>> --- a/recipes-qt/qt5/qtbase.inc
> >>> +++ b/recipes-qt/qt5/qtbase.inc
> >>> @@ -108,7 +108,7 @@ PACKAGECONFIG[gtkstyle] =3D
> "-gtkstyle,-no-gtkstyle,gtk+"
> >>>  PACKAGECONFIG[directfb] =3D "-directfb,-no-directfb,directfb"
> >>>  PACKAGECONFIG[linuxfb] =3D "-linuxfb,-no-linuxfb"
> >>>  PACKAGECONFIG[mitshm] =3D "-mitshm,-no-mitshm,mitshm"
> >>> -PACKAGECONFIG[kms] =3D "-kms,-no-kms,kms"
> >>> +PACKAGECONFIG[kms] =3D "-kms,-no-kms,virtual/mesa virtual/egl"
> >>
> >> Maybe we should introduce some virtual/gbm later, but I'm ok with
> >> virtual/mesa until we have it.
> > virtual/mesa has different meanings gbm / wayland-egl - it took me a
> > while to get mesa-free...
> >>
> >> Also there is no virtual/mesa in oe-core/dylan, but I guess that there
> >> is minimum user with dylan who also want kms.
> >>
> ping for master?
>
> Andreas
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

