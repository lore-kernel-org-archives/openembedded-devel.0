Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f177.google.com (mail-yw0-f177.google.com
	[209.85.161.177])
	by mail.openembedded.org (Postfix) with ESMTP id 50BEA77CF9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 21:29:27 +0000 (UTC)
Received: by mail-yw0-f177.google.com with SMTP id 63so24705060ywr.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 14:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Mh07Cm/R6VKmHnss2hxSQ4zfjKVNx1aXNiCuWCXJHfw=;
	b=LJYjMx6fVZSM11IJojeYrrbicSHvbsnlWA55kAEpjm5CcN2/ONvOmjXa/OLFiaCcco
	WKOBm2pfQQfcJCGcKNYlwVTX4AznbgSNwHGNfxGuiuxn7j0T7tSiyB4hEdERo/y0VJ7t
	v9dnpxpfzdSJrh0q6Xhnow0V+li06GPWU2KuuAwebAKB4WMurS8l45YljBHSuQQ722Oe
	Z/58p4FGnHmWtSz2QvggCxo7kC90kpqmlL75Y2f2+U4nw3k+fNZ9DbwpmcBGOgon71bY
	zVEHVibkhVt73M5kEKzlAFEag8mowV2OfZ7Xu00n8n5ArEmhJDRYi9UXmj3qgBNG6Iu6
	jmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Mh07Cm/R6VKmHnss2hxSQ4zfjKVNx1aXNiCuWCXJHfw=;
	b=FSvTUInkVrk33WOKBxJf8OP8rXxRytjn0Ag0AQD5au5LlMMFfmsc1DDsvSepZXLyG4
	b96AXw5C1fAOMcW3YXb6rpTH8PJZ+JAc5f2UedoU80gURy9ZaRZ8rXh8ZYzb1JmIMdxw
	hUZLngbNegwa+m6Xc8mWqBv69ibWHbZYEZF+pUGKFHH2UX7H5HyPXvj0edS5FmZ155SQ
	HRCUH0gwNNlsEVbu18yeTTMlJv2gjFwCPrIjPJ6niUjM7bkuzE+lSb63fyOwctJpFdFS
	elrQ6m0lc2aTLnf+Ra4317dR4/T5OHxZWSo8W4TFpNnKgamrOFS5xYew64VXsl1e+EYD
	A29A==
X-Gm-Message-State: AKS2vOzT+fIbTHOa9MBOPZw1p8FmyfCChGEFr+lnRmj+lVBLhbDaq0Yb
	wNr1JifEfN2cij4MU4QZyE50I6ijEw==
X-Received: by 10.129.62.28 with SMTP id l28mr9920997ywa.130.1497648568844;
	Fri, 16 Jun 2017 14:29:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Fri, 16 Jun 2017 14:29:28 -0700 (PDT)
In-Reply-To: <20170616140611.15494-1-Martin.Jansa@gmail.com>
References: <20170616140611.15494-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 16 Jun 2017 23:29:28 +0200
Message-ID: <CA+chaQdyLDc38rC-geZay6JO_QcsUZn0ZUJPVzqWXcO-wxP2ww@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Fri, 16 Jun 2017 21:29:28 -0000
Content-Type: text/plain; charset="UTF-8"

I've tested this with chromium, but for chromium-wayland few more changes
are needed from that v8 change.

On Fri, Jun 16, 2017 at 4:06 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> * add 2 patches to fix issues detected by gcc7
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-browser/chromium/chromium-browser.inc      |  2 ++
>  .../files/0001-v8-fix-build-with-gcc7.patch        | 20 ++++++++++++++
>  .../files/0002-WebKit-fix-build-with-gcc7.patch    | 31
> ++++++++++++++++++++++
>  3 files changed, 53 insertions(+)
>  create mode 100644 recipes-browser/chromium/files/0001-v8-fix-build-with-
> gcc7.patch
>  create mode 100644 recipes-browser/chromium/files/0002-WebKit-fix-build-
> with-gcc7.patch
>
> diff --git a/recipes-browser/chromium/chromium-browser.inc
> b/recipes-browser/chromium/chromium-browser.inc
> index ad8e497..08853b1 100644
> --- a/recipes-browser/chromium/chromium-browser.inc
> +++ b/recipes-browser/chromium/chromium-browser.inc
> @@ -26,6 +26,8 @@ SRC_URI = "\
>          ${@bb.utils.contains('PACKAGECONFIG',
> 'disable-api-keys-info-bar', 'file://api-keys.patch;patchdir=${WORKDIR}',
> '', d)} \
>          file://google-chrome.desktop \
>          file://unset-madv-free.patch \
> +        file://0001-v8-fix-build-with-gcc7.patch \
> +        file://0002-WebKit-fix-build-with-gcc7.patch \
>  "
>
>  S = "${WORKDIR}/chromium-${PV}"
> diff --git a/recipes-browser/chromium/files/0001-v8-fix-build-with-gcc7.patch
> b/recipes-browser/chromium/files/0001-v8-fix-build-with-gcc7.patch
> new file mode 100644
> index 0000000..0fc5bfb
> --- /dev/null
> +++ b/recipes-browser/chromium/files/0001-v8-fix-build-with-gcc7.patch
> @@ -0,0 +1,20 @@
> +Use the fix from nodejs:
> +https://github.com/nodejs/node/commit/2a2a5565c298639b823250b571101f
> 51210c50e8
> +
> +* fixes:
> +| ../../git/src/v8/src/objects-body-descriptors.h: In static member
> function 'static void v8::internal::FixedBodyDescriptor<start_offset,
> end_offset, size>::IterateBody(v8::internal::HeapObject*, int)':
> +| ../../git/src/v8/src/objects-body-descriptors.h:102:20: error: no
> matching function for call to 'v8::internal::FixedBodyDescriptor<start_offset,
> end_offset, size>::IterateBody(v8::internal::HeapObject*&)'
> +|      IterateBody(obj);
> +|                     ^
> +
> +--- chromium-54.0.2810.2.orig/v8/src/objects-body-descriptors.h
> 2016-07-28 12:17:37.000000000 -1000
> ++++ chromium-54.0.2810.2/v8/src/objects-body-descriptors.h
>  2017-06-16 01:20:50.026665439 -1000
> +@@ -99,7 +99,7 @@
> +
> +   template <typename StaticVisitor>
> +   static inline void IterateBody(HeapObject* obj, int object_size) {
> +-    IterateBody(obj);
> ++    IterateBody<StaticVisitor>(obj);
> +   }
> + };
> +
> diff --git a/recipes-browser/chromium/files/0002-WebKit-fix-build-with-gcc7.patch
> b/recipes-browser/chromium/files/0002-WebKit-fix-build-with-gcc7.patch
> new file mode 100644
> index 0000000..284a83c
> --- /dev/null
> +++ b/recipes-browser/chromium/files/0002-WebKit-fix-build-with-gcc7.patch
> @@ -0,0 +1,31 @@
> +Based on qtwebengine-opensource-src-5.8.0-wtf-gcc7.patch from
> +http://git.net/ml/scm-fedora-commits/2017-03/msg15697.html
> +
> +* Fixes:
> +In file included from ../../git/src/third_party/
> WebKit/Source/platform/heap/ThreadingTraits.h:14:0,
> +                 from ../../git/src/third_party/
> WebKit/Source/platform/heap/ThreadState.h:37,
> +                 from ../../git/src/third_party/
> WebKit/Source/platform/heap/GarbageCollected.h:8,
> +                 from ../../git/src/third_party/
> WebKit/Source/platform/heap/Visitor.h:35,
> +                 from ../../git/src/third_party/
> WebKit/Source/platform/heap/GCInfo.h:8,
> +                 from ../../git/src/third_party/
> WebKit/Source/platform/heap/Heap.h:35,
> +                 from ../../git/src/third_party/
> WebKit/Source/platform/heap/Handle.h:34,
> +                 from ../../git/src/third_party/WebKit/public/platform/
> WebPrivatePtr.h:38,
> +                 from ../../git/src/third_party/WebKit/public/platform/
> WebString.h:35,
> +                 from ../../git/src/third_party/WebKit/Source/platform/
> exported/FilePathConversion.cpp:8:
> +../../git/src/third_party/WebKit/Source/wtf/LinkedHashSet.h: In member
> function 'void WTF::LinkedHashSet<Value, HashFunctions, HashTraits,
> Allocator>::swap(WTF::LinkedHashSet<Value, HashFunctions, HashTraits,
> Allocator>&)':
> +../../git/src/third_party/WebKit/Source/wtf/LinkedHashSet.h:549:5:
> error: there are no arguments to 'swapAnchor' that depend on a template
> parameter, so a declaration of 'swapAnchor' must be available [-fpermissive]
> +     swapAnchor(m_anchor, other.m_anchor);
> +     ^~~~~~~~~~
> +../../git/src/third_party/WebKit/Source/wtf/LinkedHashSet.h:549:5: note:
> (if you use '-fpermissive', G++ will accept your code, but allowing the use
> of an undeclared name is deprecated)
> +
> +--- chromium-54.0.2810.2.orig/third_party/WebKit/Source/wtf/LinkedHashSet.h
>   2016-07-28 12:16:12.000000000 -1000
> ++++ chromium-54.0.2810.2/third_party/WebKit/Source/wtf/LinkedHashSet.h
> 2017-06-16 02:19:37.928797121 -1000
> +@@ -542,6 +542,8 @@
> +     return *this;
> + }
> +
> ++inline void swapAnchor(LinkedHashSetNodeBase& a, LinkedHashSetNodeBase&
> b);
> ++
> + template<typename T, typename U, typename V, typename W>
> + inline void LinkedHashSet<T, U, V, W>::swap(LinkedHashSet& other)
> + {
> --
> 2.13.1
>
>

