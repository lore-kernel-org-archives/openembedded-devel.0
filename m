Return-Path: <zoltan.kuscsik@linaro.org>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4237D7702B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 06:31:46 +0000 (UTC)
Received: by wmec75 with SMTP id c75so4117133wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 22:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=FPqQr1xYuC6+KGlg/d2TN48JgPlDJ2mR4MuVXkYjax0=;
	b=JQaBAkXwZQVBRc7g8ciDT6eltdJ7GcCfpb8TnTmx9vk5aFjTjk8v+ijMx89YFGu+m4
	otrheWF6pjH7q279HtM7cLSGBGVQt08lHJh4QcLqwMDHAFJwEFVVZ0yU3Yv/uzX8APgc
	rJTVg1URxzNQhpJYVy36zOedJTjCbbNpCScM8+qP3BhKKWgx/4CEAjVcuxkSVYUX+oY4
	h7sK9Ob3o2AadIPGQtHvk4N4++eiQ8wzF6GxSJLLr3z1MeUWOOhTBw5CpSfUPEDmpbVw
	1Q99W5z3S9Q6a15uNEP798gO95rtueEDu2vTmPtw+j13Ci+L1CYs0uG/dyY0TBcKfr5V
	qy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=FPqQr1xYuC6+KGlg/d2TN48JgPlDJ2mR4MuVXkYjax0=;
	b=MUnVGnp3s4WtXASm1kpcsV6vjTpxDw07dZAaXc8XJm4XYBkQ7Xuttw0b45JW92KrG6
	3NUOTibNHY2qoXyM5P9WEFJIiWYHotVDPI+hJdh10N1TPp+eyUdW4emtDAvRU9j2PH/D
	IPGfmQPC8MKi5tJ/6+0C6R56XfdPR0dvG8l48AnerIIIf6UxgyZXgKjwJiVCaCR0Zy1R
	q8T+/MDQyJgo32mKh90qyt9c9HTk5JEDaR/hYW09a3P22XPZHmiT5wjCfSKYKrWrWcZN
	jYmiFt8hQm12CSTEaqDQ8tMDc1lQGBiGbRnpNwEetYpcevgzhLHt6Joq/iLBwgwfXzHm
	DgIg==
X-Gm-Message-State: ALoCoQm/8BP6rG0iaqT5L7ZuY0WVVpY+569usg9rbTIQp28e6ai0wJSE9UnUmo5+8Hbq/VqQLe3k
X-Received: by 10.28.146.136 with SMTP id u130mr1356946wmd.91.1446705105386;
	Wed, 04 Nov 2015 22:31:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.27.34.85 with HTTP; Wed, 4 Nov 2015 22:31:25 -0800 (PST)
In-Reply-To: <1E07998C-81FF-476F-A066-63266FFDDC1B@gmail.com>
References: <1446673803-2310-1-git-send-email-max.oss.09@gmail.com>
	<1E07998C-81FF-476F-A066-63266FFDDC1B@gmail.com>
From: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
Date: Thu, 5 Nov 2015 07:31:25 +0100
Message-ID: <CAAzKXnh3cJ7cLT4a48NUs7L0B-dYAfav3ckvwMds8aT=3PN+Gw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-browser][PATCH] chromium: fix gcc5 compile issues
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
X-List-Received-Date: Thu, 05 Nov 2015 06:31:48 -0000
Content-Type: text/plain; charset=UTF-8

Why not using pragma in both cases?
See the discussion on the issue in Chromium upstream:

https://groups.google.com/a/chromium.org/forum/#!topic/chromium-dev/3uwBwunIa7g

Z

On 5 November 2015 at 02:10, Khem Raj <raj.khem@gmail.com> wrote:

>
> > On Nov 4, 2015, at 1:50 PM, Max Krummenacher <max.oss.09@gmail.com>
> wrote:
> >
> > A chromium build with gcc5 fails with warnings treated as errors.
> >
> > bignum.cc, image_util.cc: strict-overflow warning
> >
> > Compiles and runs on qemux86-64 with gcc 5.2.0 and still compiles on
> > armv7a with gcc linaro-4.9.4.
> >
>
> this is ok
>
> > Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
> > ---
> > .../0001-bignum.cc-fix-warning-from-gcc-5.patch    | 56
> ++++++++++++++++++++++
> > ...-image_util.cc-disable-warning-from-gcc-5.patch | 37 ++++++++++++++
> > recipes-browser/chromium/chromium_40.0.2214.91.bb  |  3 ++
> > 3 files changed, 96 insertions(+)
> > create mode 100644
> recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-fix-warning-from-gcc-5.patch
> > create mode 100644
> recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch
> >
> > diff --git
> a/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-fix-warning-from-gcc-5.patch
> b/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-fix-warning-from-gcc-5.patch
> > new file mode 100644
> > index 0000000..f3d7f77
> > --- /dev/null
> > +++
> b/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-fix-warning-from-gcc-5.patch
> > @@ -0,0 +1,56 @@
> > +From 689576b2f5c6398f6ef5203fe52edcf86b452790 Mon Sep 17 00:00:00 2001
> > +From: Max Krummenacher <max.oss.09@gmail.com>
> > +Date: Tue, 3 Nov 2015 20:51:04 +0100
> > +Subject: [PATCH 1/2] bignum.cc: fix warning from gcc 5
> > +
> > +Refactoring the source seems to workaround the compiler warning.
> > +
> > +addresses:
> > +  ../../third_party/WebKit/Source/wtf/dtoa/bignum.cc:105:10: error:
> assuming
> > +  signed overflow does not occur when assuming that (X + c) < X is
> always
> > +  false [-Werror=strict-overflow]
> > +      void Bignum::AssignDecimalString(Vector<const char> value) {
> > +           ^
> > +
> > +Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
> > +Upstream-Status: Pending
> > +
> > +---
> > + third_party/WebKit/Source/wtf/dtoa/bignum.cc | 15 +++++++--------
> > + 1 file changed, 7 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/third_party/WebKit/Source/wtf/dtoa/bignum.cc
> b/third_party/WebKit/Source/wtf/dtoa/bignum.cc
> > +index a000b46..e5426dd 100644
> > +--- a/third_party/WebKit/Source/wtf/dtoa/bignum.cc
> > ++++ b/third_party/WebKit/Source/wtf/dtoa/bignum.cc
> > +@@ -105,20 +105,19 @@ namespace double_conversion {
> > +     void Bignum::AssignDecimalString(Vector<const char> value) {
> > +         // 2^64 = 18446744073709551616 > 10^19
> > +         const int kMaxUint64DecimalDigits = 19;
> > ++        int currentLen;
> > +         Zero();
> > +         int length = value.length();
> > +         int pos = 0;
> > +         // Let's just say that each digit needs 4 bits.
> > +-        while (length >= kMaxUint64DecimalDigits) {
> > +-            uint64_t digits = ReadUInt64(value, pos,
> kMaxUint64DecimalDigits);
> > +-            pos += kMaxUint64DecimalDigits;
> > +-            length -= kMaxUint64DecimalDigits;
> > +-            MultiplyByPowerOfTen(kMaxUint64DecimalDigits);
> > ++        while (length > 0) {
> > ++            currentLen = length > kMaxUint64DecimalDigits ?
> kMaxUint64DecimalDigits : length;
> > ++            uint64_t digits = ReadUInt64(value, pos, currentLen);
> > ++            MultiplyByPowerOfTen(currentLen);
> > +             AddUInt64(digits);
> > ++            pos += currentLen;
> > ++            length -= currentLen;
> > +         }
> > +-        uint64_t digits = ReadUInt64(value, pos, length);
> > +-        MultiplyByPowerOfTen(length);
> > +-        AddUInt64(digits);
> > +         Clamp();
> > +     }
> > +
> > +--
> > +1.8.4.5
> > +
> > diff --git
> a/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch
> b/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch
> > new file mode 100644
> > index 0000000..d62645b
> > --- /dev/null
> > +++
> b/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch
> > @@ -0,0 +1,37 @@
> > +From 2f674d980a116075dc7123a3e243b1451e4a732d Mon Sep 17 00:00:00 2001
> > +From: Max Krummenacher <max.oss.09@gmail.com>
> > +Date: Tue, 3 Nov 2015 22:13:40 +0100
> > +Subject: [PATCH 2/2] image_util.cc: disable warning from gcc 5
> > +
> > +addresses:
> > +  ../../ui/gfx/image/image_util.cc:50:6: error: assuming signed
> overflow does
> > +  not occur when assuming that (X - c) <= X is always true
> > +  [-Werror=strict-overflow]
> > +  bool VisibleMargins(const ImageSkia& image, int* leading, int*
> trailing) {
> > +       ^
> > +
> > +Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
> > +Upstream-Status: Pending
> > +
> > +---
> > + ui/gfx/image/image_util.cc | 3 +++
> > + 1 file changed, 3 insertions(+)
> > +
> > +diff --git a/ui/gfx/image/image_util.cc b/ui/gfx/image/image_util.cc
> > +index 89a3f8c..d595da3 100644
> > +--- a/ui/gfx/image/image_util.cc
> > ++++ b/ui/gfx/image/image_util.cc
> > +@@ -68,7 +68,10 @@ bool VisibleMargins(const ImageSkia& image, int*
> leading, int* trailing) {
> > +   int inner_min = bitmap.width();
> > +   for (int x = 0; x < bitmap.width(); ++x) {
> > +     for (int y = 0; y < bitmap.height(); ++y) {
> > ++#pragma GCC diagnostic push
> > ++#pragma GCC diagnostic warning "-Wstrict-overflow"
> > +       if (SkColorGetA(bitmap.getColor(x, y)) > kMinimumVisibleOpacity)
> {
> > ++#pragma GCC diagnostic pop
> > +         inner_min = x;
> > +         break;
> > +       }
> > +--
> > +1.8.4.5
> > +
> > diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb
> b/recipes-browser/chromium/chromium_40.0.2214.91.bb
> > index 8bc05ee..3e00b8d 100644
> > --- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
> > +++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
> > @@ -28,7 +28,10 @@ SRC_URI = "\
> >         file://google-chrome.desktop \
> >         file://chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch \
> >         file://chromium-40/add_missing_stat_h_include.patch \
> > +        file://chromium-40/0001-bignum.cc-fix-warning-from-gcc-5.patch \
> > +
> file://chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch \
> > "
> > +
> > #
> > # * use-egl : Without this packageconfig, the Chromium build will use
> GLX for creating an OpenGL context in X11,
> > #             and regular OpenGL for painting operations. Neither are
> desirable on embedded platforms. With this
> > --
> > 1.8.4.5
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


-- 
Zoltan Kuscsik

Senior Software Developer, Linaro Digital Home Group
email: zoltan.kuscsik@linaro.org
IRC: zoli_ on irc.linaro.org

