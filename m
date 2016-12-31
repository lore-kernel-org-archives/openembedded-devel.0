Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2AC9B6022F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Dec 2016 18:33:16 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id i68so27777680uad.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Dec 2016 10:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=XaKgRC+o9UBdRKZd0m8d/kr4Y3HTyYenZHYY+3tIQeA=;
	b=VdRcpu6Dpss0cDY4B11oQH6Eq8v3DGqrub1vbqAvEhPZqILLQemBqPhM2O+1Fp/+3Z
	cWFTR6A43a9Ur6isr8Dtjr8rdI5Rdl9BHCcMo6zPsrI+9kNi9GXV9Ah6se8QFHLEyzYv
	BPu/HignpxUs3d57JLeEAkeAYDrlqPSDLBf69ttGakwc4mTTnu54VrRqPFJ+VX4/+J8H
	imZCzze/2GbWfCsci0LspwsUDIAKrQEgNIT4HN8Iv2RF22sqbyTLcqSg10be0fGV/5nJ
	TLANvriKACb+XBnVTugi6bDUQ1wKStjKlgIaLCuFDG/17X4locVkhT98Rro1olk6jL4n
	MC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=XaKgRC+o9UBdRKZd0m8d/kr4Y3HTyYenZHYY+3tIQeA=;
	b=WRZGvYWVOQViDXtEp+WfZVUaFBpSR4piIzucO3UNzamaHBULf4+CYfaGszdAe7YO6d
	Fs+KbRdr69yIwRumEIVHcmvAioCL9XyR0+zYO4NVbBxOFaYxyDrEJwau1tYQK2GEtLmi
	sw/PP6/0Qr6lk1hRFqRkuv6cvSHNAXRp4yzmomBjg74ODJVA5jjGhftCPIgztFc5/Wo5
	IyCrJuVuYlBLWeYYDqZpxXubyjj8oHjsfOohIbK9NMB86BQ8Ra9keU/UJy805IAz5Wx/
	ANH/yBK17+XO4HKGQYRV6tm9wE3KwRiAwTMtk7udqt4bpAAqVcAExYfXm1awPXCpysqE
	IvAg==
X-Gm-Message-State: AIkVDXKR54frngF1DbrbvA1GveX5k4916BBQ2shMtKrKf2W8suLFdhqPej9to/D3qp8Kw9cHEcRN4T/UziQHYw==
X-Received: by 10.159.32.99 with SMTP id 90mr32723767uam.138.1483209197488;
	Sat, 31 Dec 2016 10:33:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Sat, 31 Dec 2016 10:32:47 -0800 (PST)
In-Reply-To: <20161230181124.3531-1-twoerner@gmail.com>
References: <20161230181124.3531-1-twoerner@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 31 Dec 2016 10:32:47 -0800
Message-ID: <CAMKF1so+SskdmYtW_p9E_5CJQPeZ+45V_+1O6WQSM7E9pwNhjA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Sat, 31 Dec 2016 18:33:19 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 30, 2016 at 10:11 AM, Trevor Woerner <twoerner@gmail.com> wrote:
> Build and run tested on qemux86 (i586) and turbot (x86-64).
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  recipes-browser/chromium/chromium_52.0.2743.76.bb |  2 ++
>  recipes-browser/chromium/files/i586/x86-m32.patch | 42 +++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
>  create mode 100644 recipes-browser/chromium/files/i586/x86-m32.patch
>
> diff --git a/recipes-browser/chromium/chromium_52.0.2743.76.bb b/recipes-browser/chromium/chromium_52.0.2743.76.bb
> index 5be3c32..bba1549 100644
> --- a/recipes-browser/chromium/chromium_52.0.2743.76.bb
> +++ b/recipes-browser/chromium/chromium_52.0.2743.76.bb
> @@ -14,6 +14,8 @@ SRC_URI += "\
>          ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
>  "
>
> +SRC_URI_append_i586 = "file://x86-m32.patch"
> +

it this 32bit x86 specific or i586 specific ? If its former then using
x86 override would be more
appropriate.secondly, what does removing -m32 fix ? I thought it would
just be nop in case of
32bit

>  LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
>  SRC_URI[md5sum] = "0fee71466e1f2dc39ed4549d04b58ee2"
>  SRC_URI[sha256sum] = "c54cdc11c3324152f3d5be98dcb4eae2bda0fc9dac7dd5f9010150458d68c18c"
> diff --git a/recipes-browser/chromium/files/i586/x86-m32.patch b/recipes-browser/chromium/files/i586/x86-m32.patch
> new file mode 100644
> index 0000000..be08071
> --- /dev/null
> +++ b/recipes-browser/chromium/files/i586/x86-m32.patch
> @@ -0,0 +1,42 @@
> +Index: chromium-52.0.2743.76/build/common.gypi
> +===================================================================
> +--- chromium-52.0.2743.76.orig/build/common.gypi
> ++++ chromium-52.0.2743.76/build/common.gypi
> +@@ -3849,10 +3849,6 @@
> +                   '-msse2',
> +                   '-mfpmath=sse',
> +                   '-mmmx',  # Allows mmintrin.h for MMX intrinsics.
> +-                  '-m32',
> +-                ],
> +-                'ldflags': [
> +-                  '-m32',
> +                 ],
> +                 'conditions': [
> +                   # Use gold linker for Android ia32 target.
> +Index: chromium-52.0.2743.76/build/config/compiler/BUILD.gn
> +===================================================================
> +--- chromium-52.0.2743.76.orig/build/config/compiler/BUILD.gn
> ++++ chromium-52.0.2743.76/build/config/compiler/BUILD.gn
> +@@ -502,8 +502,6 @@ config("compiler_cpu_abi") {
> +       ]
> +       ldflags += [ "-m64" ]
> +     } else if (current_cpu == "x86") {
> +-      cflags += [ "-m32" ]
> +-      ldflags += [ "-m32" ]
> +       if (!is_nacl) {
> +         cflags += [
> +           "-msse2",
> +Index: chromium-52.0.2743.76/third_party/icu/icu.gyp
> +===================================================================
> +--- chromium-52.0.2743.76.orig/third_party/icu/icu.gyp
> ++++ chromium-52.0.2743.76/third_party/icu/icu.gyp
> +@@ -48,9 +48,6 @@
> +          target_arch=="mipsel")', {
> +         'target_conditions': [
> +           ['_toolset=="host"', {
> +-            'cflags': [ '-m32' ],
> +-            'ldflags': [ '-m32' ],
> +-            'asflags': [ '-32' ],
> +             'xcode_settings': {
> +               'ARCHS': [ 'i386' ],
> +             },
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

