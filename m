Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9F1D87E3F0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2019 18:08:31 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id i11so23082333edq.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2019 11:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SP9rXjTkqDg92TKQr1dmUUPKqrrzyxskE7OqzA0yDPs=;
	b=F+MslDxxK+v8mRKDhAP8xgXPGdwBF4NRXpjS4jsW6Ri6gTEJn2gIdTg9kY1JaVbR3y
	0LmPy0IoUwbZkJGTEeuMbe+7IDRap6uICG4YtTlsWrNOAl8lZHIHtLWCTuVdpBLErk3g
	tAfb/a9QV/X5ljs6DvJuz9vEEUOFuL013H+eVAFGcZrtPJi8C9U5NRemXJCWRrPgT7sM
	qTmc2Qy3pk79lYmZA0maFe+DzJEGZRZjoNILL++qSce5xMtNkOxm5C8jDdZmOReGiX6V
	NwVK/iSa4oTknF+2BFFU+mBqCqcCxeYs+f5NLhI5SM9D5Jz99Zv0pGu1pwznBgPCSlJm
	SMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SP9rXjTkqDg92TKQr1dmUUPKqrrzyxskE7OqzA0yDPs=;
	b=suSus1DCyTkLkF/V4WhsmJ5lHxjA8yV4Sceq6YwWCExWMj0kWAO5zyOKsozolAdnPS
	dZUE/A3wuamH5m9aLPcpiq4hSYtV/WQ1HIPj94ApUIqaAbTsd356w/yP0W7xl4DfhOe7
	tZll9MErEGfL5svqMrhR7Ccl7NlUG05DCaf1w/IbcLp8C0qm2gvEdugRJsbAlToAo84z
	A9Zedof6Ojy3d5XEdWCAVWludCZOyrOOcNNK80WC80ym++O59GwWhu8awtVgDPdXazSx
	vOCavSr2mExc1GvvmreYiBP8yHSsuVeCEXUzWnGt0XCysgPZObU/t+r64Z9TmcEzFPNg
	3aBQ==
X-Gm-Message-State: APjAAAXYPQWPSHfPro74aYw+e0IfRyccIbj9FgXuLPNFzkaaMOmVWuwc
	soHGYFLVLUpV3AOcDR1AZaPpP4frvtPbAZBG1os=
X-Google-Smtp-Source: APXvYqyycBP/SGTkQrEpH/0VCJM7hZYjBbtS2IOhmjAAXB3D0hsExQ5fUYnFUYDvAx1nTG5nTYl+r/PvXgw42mlezAU=
X-Received: by 2002:a05:6402:6d0:: with SMTP id
	n16mr15852494edy.168.1561399712248; 
	Mon, 24 Jun 2019 11:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190617102305.20150-1-pascal.bach@siemens.com>
In-Reply-To: <20190617102305.20150-1-pascal.bach@siemens.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 24 Jun 2019 20:08:22 +0200
Message-ID: <CA+chaQc4CwpKA2E4rHM-baNj-2pdWA9rKmocut-47_QR3CfSow@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv4 1/3] protobuf: 3.6.1 -> 3.8.0
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
X-List-Received-Date: Mon, 24 Jun 2019 18:08:32 -0000
Content-Type: text/plain; charset="UTF-8"

With the upgrade now merged in master I'm seeing following failure:

./.libs/libprotoc.so: error: undefined reference to
'descriptor_table_google_2fprotobuf_2fdescriptor_2eproto'
./.libs/libprotoc.so: error: undefined reference to
'scc_info_FileDescriptorProto_google_2fprotobuf_2fdescriptor_2eproto'
collect2: error: ld returned 1 exit status
Makefile:3923: recipe for target 'protoc' failed

My guess it's caused by gold linker being used in my builds (with
ld-is-gold DISTRO_FEATURE).

Anyone else seeing this?

On Mon, Jun 17, 2019 at 12:23 PM Pascal Bach <pascal.bach@siemens.com>
wrote:

> Simple update to latest release
>
> The patch is needed to make python3-protobuf compile
> as otherwise a file it expects is missing.
>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  ...s-map_util.h-to-list-of-installed-headers.patch | 52
> ++++++++++++++++++++++
>  .../{protobuf_3.6.1.bb => protobuf_3.8.0.bb}       |  7 ++-
>  2 files changed, 55 insertions(+), 4 deletions(-)
>  create mode 100644
> meta-oe/recipes-devtools/protobuf/protobuf/0001-Added-stubs-map_util.h-to-list-of-installed-headers.patch
>  rename meta-oe/recipes-devtools/protobuf/{protobuf_3.6.1.bb =>
> protobuf_3.8.0.bb} (93%)
>
> diff --git
> a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Added-stubs-map_util.h-to-list-of-installed-headers.patch
> b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Added-stubs-map_util.h-to-list-of-installed-headers.patch
> new file mode 100644
> index 000000000..a160e5e97
> --- /dev/null
> +++
> b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Added-stubs-map_util.h-to-list-of-installed-headers.patch
> @@ -0,0 +1,52 @@
> +From ea6e776e50971c89ad2293046b6ae2a6a9753c56 Mon Sep 17 00:00:00 2001
> +From: Adam Cozzette <acozzette@google.com>
> +Date: Thu, 6 Jun 2019 10:29:58 -0700
> +Subject: [PATCH] Added stubs/map_util.h to list of installed headers
> +
> +This should fix issue #6186. I also had to remove a couple unnecessary
> +const keywords in map_util.h because the no_warning_test was showing
> +errors about those.
> +
> +Upstream-Status: Submitted [
> https://github.com/protocolbuffers/protobuf/pull/6223]
> +---
> + src/Makefile.am                      | 1 +
> + src/google/protobuf/stubs/map_util.h | 4 ++--
> + 2 files changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index be18ba76..1689e221 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -72,6 +72,7 @@ nobase_include_HEADERS =
>          \
> +   google/protobuf/stubs/hash.h                                   \
> +   google/protobuf/stubs/logging.h                                \
> +   google/protobuf/stubs/macros.h                                 \
> ++  google/protobuf/stubs/map_util.h                               \
> +   google/protobuf/stubs/mutex.h                                  \
> +   google/protobuf/stubs/once.h                                   \
> +   google/protobuf/stubs/platform_macros.h                        \
> +diff --git a/src/google/protobuf/stubs/map_util.h
> b/src/google/protobuf/stubs/map_util.h
> +index 2313e1f5..b04d9d46 100644
> +--- a/src/google/protobuf/stubs/map_util.h
> ++++ b/src/google/protobuf/stubs/map_util.h
> +@@ -620,7 +620,7 @@ bool UpdateReturnCopy(Collection* const collection,
> + // twice. Unlike UpdateReturnCopy this also does not come with the issue
> of an
> + // undefined previous* in case new data was inserted.
> + template <class Collection>
> +-typename Collection::value_type::second_type* const
> ++typename Collection::value_type::second_type*
> + InsertOrReturnExisting(Collection* const collection,
> +                        const typename Collection::value_type& vt) {
> +   std::pair<typename Collection::iterator, bool> ret =
> collection->insert(vt);
> +@@ -633,7 +633,7 @@ InsertOrReturnExisting(Collection* const collection,
> +
> + // Same as above, except for explicit key and data.
> + template <class Collection>
> +-typename Collection::value_type::second_type* const
> ++typename Collection::value_type::second_type*
> + InsertOrReturnExisting(
> +     Collection* const collection,
> +     const typename Collection::value_type::first_type& key,
> +--
> +2.11.0
> +
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
> b/meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
> similarity index 93%
> rename from meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
> index cf72d9ca7..476d1e309 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
> @@ -10,13 +10,12 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
>  DEPENDS = "zlib"
>  DEPENDS_append_class-target = " protobuf-native"
>
> -PV .= "+git${SRCPV}"
> +SRCREV = "09745575a923640154bcf307fba8aedff47f240a"
>
> -SRCREV = "48cb18e5c419ddd23d9badcfe4e9df7bde1979b2"
> -
> -SRC_URI = "git://github.com/google/protobuf.git;branch=3.6.x \
> +SRC_URI = "git://github.com/google/protobuf.git;branch=3.8.x \
>             file://run-ptest \
>             file://0001-protobuf-fix-configure-error.patch \
> +
>  file://0001-Added-stubs-map_util.h-to-list-of-installed-headers.patch \
>  "
>  S = "${WORKDIR}/git"
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

