Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 17729605C3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jun 2017 01:08:42 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id u195so23110461wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 18:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=70ud5f4QVOVSfI4alz2X7ttb35gkxMrg4n6eyJpcx5Q=;
	b=C3pFVnLzTUIVBcjH+KTVLq9ew/UpGptCVtUZ7vY1+63eTeQ51yu6LMtNEEqTRQSXKI
	0UrAkOdrotQTyKXust0TZKVaOQfpi9LCEHJNrMI6ZdQnYBDWmIgfzJ+3Bxu9Lxi+tGgX
	uJWwwYzW7JRVlp7my8FfLXG6yvh6LLEETKVL6qICk/9lWizrbg1iQILsOm/hjUrkOywn
	qfca1pVxFi67lrCVtvPI7XmjstjZQR/pvJUqRIY0cXtKq8n7rEi0g0X14je/0ohr8ggQ
	q43W85Bap5vNpt9TIuYkPLbicnL+Qp3R8DMvwLoiRA7gWcI8RlOMCiQL7bAs8AukdvKh
	6scA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=70ud5f4QVOVSfI4alz2X7ttb35gkxMrg4n6eyJpcx5Q=;
	b=dIetZYXnKcxD84VpzVlUNvc97UXmqNGKJYAJyRAfq4JxQ3M2eJzcRuKte6Dnc2Cs7w
	KiRzq94OgLJwrFHJCMF1WvRuL7I0mBbFxWnlrkEVETv/XqBApwtFG3aKeHDsZYdm3BPg
	PDxMrw2Eih3ghEGTOCGsLc/a5DHL4rath6go28nfRLeesqG/kNJSRz0o4sNKYuqrux6X
	IcAPNsmwcjam6Kxub3E1t0jNf5miKRLQOgm2kUQhBas/V0DyOW21KmaJNT2mkNFF4V7y
	r+5DFu2jBU1Q2zhcWhP259iUZJf19XaGbuEfzbcWbbGaxLy9iLGbcfsAUcLrsJqzp4n6
	RoJw==
X-Gm-Message-State: AKS2vOyePR0og0vxDq1o6buM1odCIfDujRZLh6+NDSdIZzRP+I7VTmtG
	rPqcfVxxgiAT1sLQSb84LWi/t+yQnw==
X-Received: by 10.80.137.36 with SMTP id e33mr8982378ede.67.1497661723248;
	Fri, 16 Jun 2017 18:08:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Fri, 16 Jun 2017 18:08:12 -0700 (PDT)
In-Reply-To: <20170616140611.15494-1-Martin.Jansa@gmail.com>
References: <20170616140611.15494-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Jun 2017 18:08:12 -0700
Message-ID: <CAMKF1sqr3Z9JcDZR0oVfoMG4jPAd5H-FbD0K=UXAS2Ou6UwFBw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][WIP][PATCH] chromium(-wayland): Fix build with gcc7
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
X-List-Received-Date: Sat, 17 Jun 2017 01:08:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 16, 2017 at 7:06 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * add 2 patches to fix issues detected by gcc7
>

both patches look ok to me

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-browser/chromium/chromium-browser.inc      |  2 ++
>  .../files/0001-v8-fix-build-with-gcc7.patch        | 20 ++++++++++++++
>  .../files/0002-WebKit-fix-build-with-gcc7.patch    | 31 ++++++++++++++++++++++
>  3 files changed, 53 insertions(+)
>  create mode 100644 recipes-browser/chromium/files/0001-v8-fix-build-with-gcc7.patch
>  create mode 100644 recipes-browser/chromium/files/0002-WebKit-fix-build-with-gcc7.patch
>
> diff --git a/recipes-browser/chromium/chromium-browser.inc b/recipes-browser/chromium/chromium-browser.inc
> index ad8e497..08853b1 100644
> --- a/recipes-browser/chromium/chromium-browser.inc
> +++ b/recipes-browser/chromium/chromium-browser.inc
> @@ -26,6 +26,8 @@ SRC_URI = "\
>          ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar', 'file://api-keys.patch;patchdir=${WORKDIR}', '', d)} \
>          file://google-chrome.desktop \
>          file://unset-madv-free.patch \
> +        file://0001-v8-fix-build-with-gcc7.patch \
> +        file://0002-WebKit-fix-build-with-gcc7.patch \
>  "
>
>  S = "${WORKDIR}/chromium-${PV}"
> diff --git a/recipes-browser/chromium/files/0001-v8-fix-build-with-gcc7.patch b/recipes-browser/chromium/files/0001-v8-fix-build-with-gcc7.patch
> new file mode 100644
> index 0000000..0fc5bfb
> --- /dev/null
> +++ b/recipes-browser/chromium/files/0001-v8-fix-build-with-gcc7.patch
> @@ -0,0 +1,20 @@
> +Use the fix from nodejs:
> +https://github.com/nodejs/node/commit/2a2a5565c298639b823250b571101f51210c50e8
> +
> +* fixes:
> +| ../../git/src/v8/src/objects-body-descriptors.h: In static member function 'static void v8::internal::FixedBodyDescriptor<start_offset, end_offset, size>::IterateBody(v8::internal::HeapObject*, int)':
> +| ../../git/src/v8/src/objects-body-descriptors.h:102:20: error: no matching function for call to 'v8::internal::FixedBodyDescriptor<start_offset, end_offset, size>::IterateBody(v8::internal::HeapObject*&)'
> +|      IterateBody(obj);
> +|                     ^
> +
> +--- chromium-54.0.2810.2.orig/v8/src/objects-body-descriptors.h        2016-07-28 12:17:37.000000000 -1000
> ++++ chromium-54.0.2810.2/v8/src/objects-body-descriptors.h     2017-06-16 01:20:50.026665439 -1000
> +@@ -99,7 +99,7 @@
> +
> +   template <typename StaticVisitor>
> +   static inline void IterateBody(HeapObject* obj, int object_size) {
> +-    IterateBody(obj);
> ++    IterateBody<StaticVisitor>(obj);
> +   }
> + };
> +
> diff --git a/recipes-browser/chromium/files/0002-WebKit-fix-build-with-gcc7.patch b/recipes-browser/chromium/files/0002-WebKit-fix-build-with-gcc7.patch
> new file mode 100644
> index 0000000..284a83c
> --- /dev/null
> +++ b/recipes-browser/chromium/files/0002-WebKit-fix-build-with-gcc7.patch
> @@ -0,0 +1,31 @@
> +Based on qtwebengine-opensource-src-5.8.0-wtf-gcc7.patch from
> +http://git.net/ml/scm-fedora-commits/2017-03/msg15697.html
> +
> +* Fixes:
> +In file included from ../../git/src/third_party/WebKit/Source/platform/heap/ThreadingTraits.h:14:0,
> +                 from ../../git/src/third_party/WebKit/Source/platform/heap/ThreadState.h:37,
> +                 from ../../git/src/third_party/WebKit/Source/platform/heap/GarbageCollected.h:8,
> +                 from ../../git/src/third_party/WebKit/Source/platform/heap/Visitor.h:35,
> +                 from ../../git/src/third_party/WebKit/Source/platform/heap/GCInfo.h:8,
> +                 from ../../git/src/third_party/WebKit/Source/platform/heap/Heap.h:35,
> +                 from ../../git/src/third_party/WebKit/Source/platform/heap/Handle.h:34,
> +                 from ../../git/src/third_party/WebKit/public/platform/WebPrivatePtr.h:38,
> +                 from ../../git/src/third_party/WebKit/public/platform/WebString.h:35,
> +                 from ../../git/src/third_party/WebKit/Source/platform/exported/FilePathConversion.cpp:8:
> +../../git/src/third_party/WebKit/Source/wtf/LinkedHashSet.h: In member function 'void WTF::LinkedHashSet<Value, HashFunctions, HashTraits, Allocator>::swap(WTF::LinkedHashSet<Value, HashFunctions, HashTraits, Allocator>&)':
> +../../git/src/third_party/WebKit/Source/wtf/LinkedHashSet.h:549:5: error: there are no arguments to 'swapAnchor' that depend on a template parameter, so a declaration of 'swapAnchor' must be available [-fpermissive]
> +     swapAnchor(m_anchor, other.m_anchor);
> +     ^~~~~~~~~~
> +../../git/src/third_party/WebKit/Source/wtf/LinkedHashSet.h:549:5: note: (if you use '-fpermissive', G++ will accept your code, but allowing the use of an undeclared name is deprecated)
> +
> +--- chromium-54.0.2810.2.orig/third_party/WebKit/Source/wtf/LinkedHashSet.h    2016-07-28 12:16:12.000000000 -1000
> ++++ chromium-54.0.2810.2/third_party/WebKit/Source/wtf/LinkedHashSet.h 2017-06-16 02:19:37.928797121 -1000
> +@@ -542,6 +542,8 @@
> +     return *this;
> + }
> +
> ++inline void swapAnchor(LinkedHashSetNodeBase& a, LinkedHashSetNodeBase& b);
> ++
> + template<typename T, typename U, typename V, typename W>
> + inline void LinkedHashSet<T, U, V, W>::swap(LinkedHashSet& other)
> + {
> --
> 2.13.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

