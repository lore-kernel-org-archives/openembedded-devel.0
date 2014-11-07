Return-Path: <gary.robertson@linaro.org>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id DACF365C91
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2014 01:38:22 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id z12so2590314wgg.37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Nov 2014 17:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=vNeBYD6pbmYjZAuJ42XybJNNJF9Fa712G+1d0BwTikk=;
	b=YmvXYVuNqK3GePD7dp2YiJpCs9k6s9+JGJXX1VqshVmOzEFTBLJZT+dvUjIhVNsAVT
	+rcYEso4B0KtMXyuV0ISlhwu7jCPbivyEKqDQV8qSwFZmpOAofv8Lnc6nBmDMBZWjxAB
	0woIQgdM0t3ntkYnNIbQhu1WY4gy4fsrUkUkST6TxFzjpwQ6y2RXsDM2iErQkWuJN0BX
	j7xeyb+1lJzIKXHYt5tv8r1CKhe1gyAe6xVRRTon4aZ4lWjZqVHl7q42gCLnXVLAOcDE
	Ym6SG//rFKvbFkanw7SM4jmNw1bqQRXajbEBcOErUALGTzOsuHnsiPd935CeXIdni82d
	xFtQ==
X-Gm-Message-State: ALoCoQk5Nn68PQGUHYnUllUNasU3kXj+Qini+u6ohZ+JpHAFAbQ1e9MXSXOgvH10ekU8huKVEEll
MIME-Version: 1.0
X-Received: by 10.180.109.100 with SMTP id hr4mr205718wib.39.1415324302707;
	Thu, 06 Nov 2014 17:38:22 -0800 (PST)
Received: by 10.216.180.73 with HTTP; Thu, 6 Nov 2014 17:38:22 -0800 (PST)
In-Reply-To: <1415301783-5342-3-git-send-email-gary.robertson@linaro.org>
References: <1415301783-5342-1-git-send-email-gary.robertson@linaro.org>
	<1415301783-5342-3-git-send-email-gary.robertson@linaro.org>
Date: Thu, 6 Nov 2014 19:38:22 -0600
Message-ID: <CAF7YWnx=o1pV6YDCmt6xB7r5WjiOXHH7A9G6zXwFC_L9knp-Sw@mail.gmail.com>
From: Gary Robertson <gary.robertson@linaro.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 2/3] libhugetlbfs: Recognize all ix86 arches
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
X-List-Received-Date: Fri, 07 Nov 2014 01:38:23 -0000
Content-Type: text/plain; charset=UTF-8

As per the other patches sent in this series, please ignore for now...
looks like it may be better to update the version of libhugetlbfs used in
the recipe after these patches are accepted there.

On Thu, Nov 6, 2014 at 1:23 PM, Gary S. Robertson <gary.robertson@linaro.org
> wrote:

> From: "Gary S. Robertson" <gary.robertson@linaro.org>
>
> The makefile for libhugetlbfs recognized only i386 or x86_64 arch
> designators.
> Extended this to also recognize i486, i586, and i686
>
> Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> ---
>  ...01-libhugetlbfs-Recognize-all-ix86-arches.patch |   31
> ++++++++++++++++++++
>  .../libhugetlbfs/libhugetlbfs_git.bb               |    1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644
> meta-oe/recipes-benchmark/libhugetlbfs/files/0001-libhugetlbfs-Recognize-all-ix86-arches.patch
>
> diff --git
> a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-libhugetlbfs-Recognize-all-ix86-arches.patch
> b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-libhugetlbfs-Recognize-all-ix86-arches.patch
> new file mode 100644
> index 0000000..4eade89
> --- /dev/null
> +++
> b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-libhugetlbfs-Recognize-all-ix86-arches.patch
> @@ -0,0 +1,31 @@
> +From fcb166479d3ccd9b79fd07e89b1ed2d8899b4391 Mon Sep 17 00:00:00 2001
> +From: "Gary S. Robertson" <gary.robertson@linaro.org>
> +Date: Wed, 24 Sep 2014 15:27:31 -0500
> +Subject: [libhugetlbfs][PATCH] Recognize all ix86 arches
> +
> +The makefile only recognized i386 or x86_64 arches.  Added support
> +to recognize i486, i586, i686.
> +
> +Upstream Status: Submitted
> +
> +Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> +---
> + Makefile |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 91502e1..0bfaee8 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -71,7 +71,7 @@ ELF64 = aarch64elf
> + TMPLIB64 = lib64
> + CUSTOM_LDSCRIPTS = no
> + else
> +-ifeq ($(ARCH),i386)
> ++ifneq (,$(filter i386 i486 i586 i686,$(ARCH)))
> + CC32 = $(CC)
> + ELF32 = elf_i386
> + TMPLIB32 = lib
> +--
> +1.7.9.5
> +
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> index 737acb9..0af77f1 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> @@ -19,6 +19,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
>      file://0001-aarch64-fix-page-size-not-properly-computed.patch \
>
>  file://0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch \
>      file://0001-Extend-arm32-support-to-include-BE-variants.patch \
> +    file://0001-libhugetlbfs-Recognize-all-ix86-arches.patch \
>  "
>
>  S = "${WORKDIR}/git"
> --
> 1.7.9.5
>
>

