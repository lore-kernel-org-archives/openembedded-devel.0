Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 51BE360125
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Dec 2016 19:43:20 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m203so76281809wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Dec 2016 11:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=g9feWsS19Xz5UKr52oWdHFFrHe0hSeuxbInSdnXZgNM=;
	b=HIsgMY/80taCW2R6WhPu37mEq2F9JKBef+Baut1nlYBi1tWEvH8JAYdMwmMNRM/VOm
	oIvlZfb5mdGb+YNbigniGll3hKWr2eu8Qj3MkOYkBT7vzXQxmY37dCwE8Kbs8d4MaSRy
	sPogOmaWmosvQKXh+T6pplFmTtKtXPlaUXUSrJRzEnS5t41y8u8AxyHQqwRJ8DgUJvAW
	pHtUnH1SYFp809UZ+6ozblx9h0xFqIBCL20dK2YsYSuoVsrlfPu+rTwJ9/9+E3hkRmA1
	11n3Rd/fruPJJydk+JHjWIfzoADsWuCMAHnsIUzJftalpadcBnlrrETLh/FwNtXxTKSi
	iekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=g9feWsS19Xz5UKr52oWdHFFrHe0hSeuxbInSdnXZgNM=;
	b=A6iLYMvismh497X41uS8o/QeE4+am8GetGjO1PbVT56B/Ltm/cp5rt7g/anfWExr06
	239SsjMZ3gaxLhdHo7DDCHuq3Kc7A9N9QBcJcXs5R1p5+Ar696Mp7yBCMMeOom17cL/x
	VlAKHMhVH3QzH3c9UH+bppFU7/8TaT9sZ/xSVpoKxxz16M2MU7RT5ce9su/1Nm776UM+
	tZJVFWRd66puYdU1N2cmID4PYtYm8tbDtcwmkWU5l2LEbFdGzzzY7S8dmn4kNALaNed7
	/o4Bp8T8Ox6+3MwLLjwT7Hrf62j2pgoxvnjD/5xv78qn1+y0RIX8kCcxoDQNoMAZo2ns
	OyVg==
X-Gm-Message-State: AIkVDXJlzmwf8y+7l7cCSdlTWqxFXj9HT0H3CLM4WCQHeRrbEvap7dcaO6O9FaOUCVCAwiu+HyIUO2fUdAfugQ==
X-Received: by 10.28.16.65 with SMTP id 62mr50550869wmq.81.1483213400534; Sat,
	31 Dec 2016 11:43:20 -0800 (PST)
MIME-Version: 1.0
References: <20161230181124.3531-1-twoerner@gmail.com>
	<CAMKF1so+SskdmYtW_p9E_5CJQPeZ+45V_+1O6WQSM7E9pwNhjA@mail.gmail.com>
In-Reply-To: <CAMKF1so+SskdmYtW_p9E_5CJQPeZ+45V_+1O6WQSM7E9pwNhjA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 31 Dec 2016 19:43:10 +0000
Message-ID: <CA+chaQcr0NCmTp_Zprw4ky2X=gRSotVXTuhE5H2oAERVaKvc_g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH][meta-browser] chromium: add i586 (qemux86) support
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
X-List-Received-Date: Sat, 31 Dec 2016 19:43:22 -0000
Content-Type: text/plain; charset=UTF-8

I haven't tested this, but if you look at qemux86 failures in bitbake world
reports from last couple months, it was failing because -m32 was used also
when building native tools on 64bit builders and then failing to find
compatible libraries in native sysroot, so even when it's not clear from
the commit, this might fix that issue.

On Sat, Dec 31, 2016, 19:34 Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Dec 30, 2016 at 10:11 AM, Trevor Woerner <twoerner@gmail.com>
> wrote:
> > Build and run tested on qemux86 (i586) and turbot (x86-64).
> >
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >  recipes-browser/chromium/chromium_52.0.2743.76.bb |  2 ++
> >  recipes-browser/chromium/files/i586/x86-m32.patch | 42
> +++++++++++++++++++++++
> >  2 files changed, 44 insertions(+)
> >  create mode 100644 recipes-browser/chromium/files/i586/x86-m32.patch
> >
> > diff --git a/recipes-browser/chromium/chromium_52.0.2743.76.bb
> b/recipes-browser/chromium/chromium_52.0.2743.76.bb
> > index 5be3c32..bba1549 100644
> > --- a/recipes-browser/chromium/chromium_52.0.2743.76.bb
> > +++ b/recipes-browser/chromium/chromium_52.0.2743.76.bb
> > @@ -14,6 +14,8 @@ SRC_URI += "\
> >          ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context',
> 'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '',
> d)} \
> >  "
> >
> > +SRC_URI_append_i586 = "file://x86-m32.patch"
> > +
>
> it this 32bit x86 specific or i586 specific ? If its former then using
> x86 override would be more
> appropriate.secondly, what does removing -m32 fix ? I thought it would
> just be nop in case of
> 32bit
>
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
> >  SRC_URI[md5sum] = "0fee71466e1f2dc39ed4549d04b58ee2"
> >  SRC_URI[sha256sum] =
> "c54cdc11c3324152f3d5be98dcb4eae2bda0fc9dac7dd5f9010150458d68c18c"
> > diff --git a/recipes-browser/chromium/files/i586/x86-m32.patch
> b/recipes-browser/chromium/files/i586/x86-m32.patch
> > new file mode 100644
> > index 0000000..be08071
> > --- /dev/null
> > +++ b/recipes-browser/chromium/files/i586/x86-m32.patch
> > @@ -0,0 +1,42 @@
> > +Index: chromium-52.0.2743.76/build/common.gypi
> > +===================================================================
> > +--- chromium-52.0.2743.76.orig/build/common.gypi
> > ++++ chromium-52.0.2743.76/build/common.gypi
> > +@@ -3849,10 +3849,6 @@
> > +                   '-msse2',
> > +                   '-mfpmath=sse',
> > +                   '-mmmx',  # Allows mmintrin.h for MMX intrinsics.
> > +-                  '-m32',
> > +-                ],
> > +-                'ldflags': [
> > +-                  '-m32',
> > +                 ],
> > +                 'conditions': [
> > +                   # Use gold linker for Android ia32 target.
> > +Index: chromium-52.0.2743.76/build/config/compiler/BUILD.gn
> > +===================================================================
> > +--- chromium-52.0.2743.76.orig/build/config/compiler/BUILD.gn
> > ++++ chromium-52.0.2743.76/build/config/compiler/BUILD.gn
> > +@@ -502,8 +502,6 @@ config("compiler_cpu_abi") {
> > +       ]
> > +       ldflags += [ "-m64" ]
> > +     } else if (current_cpu == "x86") {
> > +-      cflags += [ "-m32" ]
> > +-      ldflags += [ "-m32" ]
> > +       if (!is_nacl) {
> > +         cflags += [
> > +           "-msse2",
> > +Index: chromium-52.0.2743.76/third_party/icu/icu.gyp
> > +===================================================================
> > +--- chromium-52.0.2743.76.orig/third_party/icu/icu.gyp
> > ++++ chromium-52.0.2743.76/third_party/icu/icu.gyp
> > +@@ -48,9 +48,6 @@
> > +          target_arch=="mipsel")', {
> > +         'target_conditions': [
> > +           ['_toolset=="host"', {
> > +-            'cflags': [ '-m32' ],
> > +-            'ldflags': [ '-m32' ],
> > +-            'asflags': [ '-32' ],
> > +             'xcode_settings': {
> > +               'ARCHS': [ 'i386' ],
> > +             },
> > --
> > 2.10.2
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

