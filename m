Return-Path: <max.oss.09@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 387EE75D4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 13:14:37 +0000 (UTC)
Received: by oiad129 with SMTP id d129so46340415oia.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2015 05:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=MXd144Ln3caYN0AQKF1ZiIxmiy5OM1mKAr02NdukVTM=;
	b=gAFQZH3zIBn8ToEyjSPA4ys2RtIPAHsKYJWLxbV73q2fMiYyw9Jh54fDKJSz35z6iJ
	2amZ8eGklncem4CEVTGHVBTlokw1S2q3jSViU8hHh1hI3RJxL1RZg628dghsjYTDHQQU
	ydN7qQfZne1D4u2hReduQpbIBm542vk1EYSSjaAVMNEpJEvPfRUqwgNUVbG4wm2HOKs2
	OB76vTw/JoJn+lT6xEgutH67/GkXTmKY08/OwoNTV7EYlXqX12mGQGhe2iCHkyV1njOO
	oYj9+vhGgKl3eQPNuxJN6hGHRpDQ8HO5qzbFVcmI+Bi7Lal0ggMLFwD+ev8x9/pE6Cgq
	ZxXQ==
MIME-Version: 1.0
X-Received: by 10.202.195.208 with SMTP id t199mr4132094oif.117.1446729277449; 
	Thu, 05 Nov 2015 05:14:37 -0800 (PST)
Received: by 10.202.177.86 with HTTP; Thu, 5 Nov 2015 05:14:37 -0800 (PST)
In-Reply-To: <CAAzKXnh3cJ7cLT4a48NUs7L0B-dYAfav3ckvwMds8aT=3PN+Gw@mail.gmail.com>
References: <1446673803-2310-1-git-send-email-max.oss.09@gmail.com>
	<1E07998C-81FF-476F-A066-63266FFDDC1B@gmail.com>
	<CAAzKXnh3cJ7cLT4a48NUs7L0B-dYAfav3ckvwMds8aT=3PN+Gw@mail.gmail.com>
Date: Thu, 5 Nov 2015 14:14:37 +0100
Message-ID: <CAEHkU3WR6yyGb80CGF9vFBVaYnzOJy8fih6zU5zf755pL7bvNg@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 05 Nov 2015 13:14:39 -0000
Content-Type: text/plain; charset=UTF-8

Hi Zoltan, Khem

2015-11-05 7:31 GMT+01:00 Zoltan Kuscsik <zoltan.kuscsik@linaro.org>:
> Why not using pragma in both cases?

Because I started bignum.cc and found a quick fix without the pragma.
And in the second case I did not.

I will rework the patch to silence the warning with a pragma in both
cases without touching the code.

> See the discussion on the issue in Chromium upstream:
>
> https://groups.google.com/a/chromium.org/forum/#!topic/chromium-dev/3uwBwunIa7g

I looked at the upstream git repo and googled but did not find the
discussion already going on.

I'll will rework the upstream status to point to this URL also.

>
> Z
>
> On 5 November 2015 at 02:10, Khem Raj <raj.khem@gmail.com> wrote:
>
>>
>> > On Nov 4, 2015, at 1:50 PM, Max Krummenacher <max.oss.09@gmail.com>
>> wrote:
>> >
>> > A chromium build with gcc5 fails with warnings treated as errors.
>> >
>> > bignum.cc, image_util.cc: strict-overflow warning
>> >
>> > Compiles and runs on qemux86-64 with gcc 5.2.0 and still compiles on
>> > armv7a with gcc linaro-4.9.4.
>> >
>>
>> this is ok

Thanks.

>>
>> > Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
>> > ---
>> > .../0001-bignum.cc-fix-warning-from-gcc-5.patch    | 56
>> ++++++++++++++++++++++
>> > ...-image_util.cc-disable-warning-from-gcc-5.patch | 37 ++++++++++++++
>> > recipes-browser/chromium/chromium_40.0.2214.91.bb  |  3 ++
>> > 3 files changed, 96 insertions(+)
>> > create mode 100644
>> recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-fix-warning-from-gcc-5.patch
>> > create mode 100644
>> recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch
>> >
>> > diff --git
>> a/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-fix-warning-from-gcc-5.patch
>> b/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-fix-warning-from-gcc-5.patch
>> > new file mode 100644
>> > index 0000000..f3d7f77
>> > --- /dev/null
>> > +++
>> b/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-fix-warning-from-gcc-5.patch
>> > @@ -0,0 +1,56 @@
>> > +From 689576b2f5c6398f6ef5203fe52edcf86b452790 Mon Sep 17 00:00:00 2001
>> > +From: Max Krummenacher <max.oss.09@gmail.com>
>> > +Date: Tue, 3 Nov 2015 20:51:04 +0100
>> > +Subject: [PATCH 1/2] bignum.cc: fix warning from gcc 5
>> > +
>> > +Refactoring the source seems to workaround the compiler warning.
>> > +
>> > +addresses:
>> > +  ../../third_party/WebKit/Source/wtf/dtoa/bignum.cc:105:10: error:
>> assuming
>> > +  signed overflow does not occur when assuming that (X + c) < X is
>> always
>> > +  false [-Werror=strict-overflow]
>> > +      void Bignum::AssignDecimalString(Vector<const char> value) {
>> > +           ^
>> > +
>> > +Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
>> > +Upstream-Status: Pending
>> > +
>> > +---
>> > + third_party/WebKit/Source/wtf/dtoa/bignum.cc | 15 +++++++--------
>> > + 1 file changed, 7 insertions(+), 8 deletions(-)
>> > +
>> > +diff --git a/third_party/WebKit/Source/wtf/dtoa/bignum.cc
>> b/third_party/WebKit/Source/wtf/dtoa/bignum.cc
>> > +index a000b46..e5426dd 100644
>> > +--- a/third_party/WebKit/Source/wtf/dtoa/bignum.cc
>> > ++++ b/third_party/WebKit/Source/wtf/dtoa/bignum.cc
>> > +@@ -105,20 +105,19 @@ namespace double_conversion {
>> > +     void Bignum::AssignDecimalString(Vector<const char> value) {
>> > +         // 2^64 = 18446744073709551616 > 10^19
>> > +         const int kMaxUint64DecimalDigits = 19;
>> > ++        int currentLen;
>> > +         Zero();
>> > +         int length = value.length();
>> > +         int pos = 0;
>> > +         // Let's just say that each digit needs 4 bits.
>> > +-        while (length >= kMaxUint64DecimalDigits) {
>> > +-            uint64_t digits = ReadUInt64(value, pos,
>> kMaxUint64DecimalDigits);
>> > +-            pos += kMaxUint64DecimalDigits;
>> > +-            length -= kMaxUint64DecimalDigits;
>> > +-            MultiplyByPowerOfTen(kMaxUint64DecimalDigits);
>> > ++        while (length > 0) {
>> > ++            currentLen = length > kMaxUint64DecimalDigits ?
>> kMaxUint64DecimalDigits : length;
>> > ++            uint64_t digits = ReadUInt64(value, pos, currentLen);
>> > ++            MultiplyByPowerOfTen(currentLen);
>> > +             AddUInt64(digits);
>> > ++            pos += currentLen;
>> > ++            length -= currentLen;
>> > +         }
>> > +-        uint64_t digits = ReadUInt64(value, pos, length);
>> > +-        MultiplyByPowerOfTen(length);
>> > +-        AddUInt64(digits);
>> > +         Clamp();
>> > +     }
>> > +
>> > +--
>> > +1.8.4.5
>> > +
>> > diff --git
>> a/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch
>> b/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch
>> > new file mode 100644
>> > index 0000000..d62645b
>> > --- /dev/null
>> > +++
>> b/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch
>> > @@ -0,0 +1,37 @@
>> > +From 2f674d980a116075dc7123a3e243b1451e4a732d Mon Sep 17 00:00:00 2001
>> > +From: Max Krummenacher <max.oss.09@gmail.com>
>> > +Date: Tue, 3 Nov 2015 22:13:40 +0100
>> > +Subject: [PATCH 2/2] image_util.cc: disable warning from gcc 5
>> > +
>> > +addresses:
>> > +  ../../ui/gfx/image/image_util.cc:50:6: error: assuming signed
>> overflow does
>> > +  not occur when assuming that (X - c) <= X is always true
>> > +  [-Werror=strict-overflow]
>> > +  bool VisibleMargins(const ImageSkia& image, int* leading, int*
>> trailing) {
>> > +       ^
>> > +
>> > +Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
>> > +Upstream-Status: Pending
>> > +
>> > +---
>> > + ui/gfx/image/image_util.cc | 3 +++
>> > + 1 file changed, 3 insertions(+)
>> > +
>> > +diff --git a/ui/gfx/image/image_util.cc b/ui/gfx/image/image_util.cc
>> > +index 89a3f8c..d595da3 100644
>> > +--- a/ui/gfx/image/image_util.cc
>> > ++++ b/ui/gfx/image/image_util.cc
>> > +@@ -68,7 +68,10 @@ bool VisibleMargins(const ImageSkia& image, int*
>> leading, int* trailing) {
>> > +   int inner_min = bitmap.width();
>> > +   for (int x = 0; x < bitmap.width(); ++x) {
>> > +     for (int y = 0; y < bitmap.height(); ++y) {
>> > ++#pragma GCC diagnostic push
>> > ++#pragma GCC diagnostic warning "-Wstrict-overflow"
>> > +       if (SkColorGetA(bitmap.getColor(x, y)) > kMinimumVisibleOpacity)
>> {
>> > ++#pragma GCC diagnostic pop
>> > +         inner_min = x;
>> > +         break;
>> > +       }
>> > +--
>> > +1.8.4.5
>> > +
>> > diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb
>> b/recipes-browser/chromium/chromium_40.0.2214.91.bb
>> > index 8bc05ee..3e00b8d 100644
>> > --- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
>> > +++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
>> > @@ -28,7 +28,10 @@ SRC_URI = "\
>> >         file://google-chrome.desktop \
>> >         file://chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch \
>> >         file://chromium-40/add_missing_stat_h_include.patch \
>> > +        file://chromium-40/0001-bignum.cc-fix-warning-from-gcc-5.patch \
>> > +
>> file://chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch \
>> > "
>> > +
>> > #
>> > # * use-egl : Without this packageconfig, the Chromium build will use
>> GLX for creating an OpenGL context in X11,
>> > #             and regular OpenGL for painting operations. Neither are
>> desirable on embedded platforms. With this
>> > --
>> > 1.8.4.5
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>>
>
>
> --
> Zoltan Kuscsik
>
> Senior Software Developer, Linaro Digital Home Group
> email: zoltan.kuscsik@linaro.org
> IRC: zoli_ on irc.linaro.org
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

Regards
Max

