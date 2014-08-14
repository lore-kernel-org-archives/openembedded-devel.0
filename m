Return-Path: <gary.robertson@linaro.org>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id B7CAB60424
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 19:04:59 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id f8so9385427wiw.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 12:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=3r/QGDeffiNGbOcnS5P+40WzErUCjLkGLuP4Mmhep08=;
	b=SXwpZPfHKVVCW4duSKQxqNE80UeNpuzdZIGwZfDzR/GT26dkQGsDe8PTTefXeCkyqP
	RJior312xxPGd24826LJKV1wIWjTIn36ZYBtMmjeXXNM4A67d6f6ZYFj9zhoXKTH7PsZ
	uwmyqS61UdHR5xFNvYlZL5ZGYzzLOqAgsw0/77ghyf9JdmQiWVlZR7bAC+ewtxN5rPEr
	9monzytncYpTJ83FnaQW5aABzgx4PXWpOHcyYYKyxK8GTD8OsGD9acWBzTW4yv/tpW9x
	k9tjd+Iw/Qo5bR4lS0zmIPmYQrikWVWCVDR0BPdXyHo0bamdv+SGaPU78tsL/V5GRPgH
	xBNg==
X-Gm-Message-State: ALoCoQkhoWNliaYsqFznhNhwjNNOAEi2+t6jUiemFjOK/r1KCEDfi9PC4okJeviDHVhyJu4c14R/
MIME-Version: 1.0
X-Received: by 10.180.188.203 with SMTP id gc11mr47789791wic.59.1408043098232; 
	Thu, 14 Aug 2014 12:04:58 -0700 (PDT)
Received: by 10.216.120.72 with HTTP; Thu, 14 Aug 2014 12:04:58 -0700 (PDT)
In-Reply-To: <1407868378-26155-1-git-send-email-gary.robertson@linaro.org>
References: <1407868378-26155-1-git-send-email-gary.robertson@linaro.org>
Date: Thu, 14 Aug 2014 14:04:58 -0500
Message-ID: <CAF7YWnxeFrzp1EOojxezpa0-f+ivKPKmKnp1evdFr=pmd53npw@mail.gmail.com>
From: Gary Robertson <gary.robertson@linaro.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][master][PATCH] libhugetlbfs: Extend arm32 support to include BE variants
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
X-List-Received-Date: Thu, 14 Aug 2014 19:05:02 -0000
Content-Type: text/plain; charset=UTF-8

The patch to add support for all arm 32-bit variants has now been accepted
by the libhugetlbfs project - but as yet I have received no feedback on
adding the patch to the OE libhugetlbfs recipe.  Did I format the patch or
the subject line improperly?  I am new to this mailing list so I'm not too
confident that I have adhered to its common practices.

Gary Robertson


On Tue, Aug 12, 2014 at 1:32 PM, Gary S. Robertson <
gary.robertson@linaro.org> wrote:

> From: "Gary S. Robertson" <gary.robertson@linaro.org>
>
> Upstream Status: Submitted
>
> This patch applies the same technique used by Koen Kool in the following
> patch
> which was accepted by the libhugetlbfs project:
>
> [0a4f6] Add aarch64_be_support 2014-03-31 10:52:37
>
> It modifies the libhugetlbfs Makefile to mark all 32-bit arm architectures
> as supported by the libhugetlbfs build.  Builds and successful functional
> tests have been performed for armv7a LE and BE runtime platforms.
>
> This patch replaces and renders obsolete the following patch:
> arm32-support.patch by: Chunrong Guo <B40290@freescale.com>
>
> Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> ---
>  ...tend-arm32-support-to-include-BE-variants.patch |   38
> ++++++++++++++++++++
>  .../libhugetlbfs/files/arm32-support.patch         |   29 ---------------
>  .../libhugetlbfs/libhugetlbfs_git.bb               |    2 +-
>  3 files changed, 39 insertions(+), 30 deletions(-)
>  create mode 100644
> meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Extend-arm32-support-to-include-BE-variants.patch
>  delete mode 100644
> meta-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.patch
>
> diff --git
> a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Extend-arm32-support-to-include-BE-variants.patch
> b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Extend-arm32-support-to-include-BE-variants.patch
> new file mode 100644
> index 0000000..f6147cb
> --- /dev/null
> +++
> b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Extend-arm32-support-to-include-BE-variants.patch
> @@ -0,0 +1,38 @@
> +From 5af6dec8764375ca4f13bd9fed96af090228351a Mon Sep 17 00:00:00 2001
> +From: "Gary S. Robertson" <gary.robertson@linaro.org>
> +Date: Mon, 11 Aug 2014 11:06:04 -0500
> +Subject: [libhugetlbfs][PATCH] Extend arm32 support to include BE variants
> +
> +This patch applies the same technique used by Koen Kool in the following
> patch
> +which was accepted by the libhugetlbfs project:
> +
> +[0a4f6] Add aarch64_be_support 2014-03-31 10:52:37
> +
> +It modifies the libhugetlbfs Makefile to mark all 32-bit arm architectures
> +as supported by the libhugetlbfs build.  Builds and successful functional
> +tests have been performed for armv7a LE and BE runtime platforms.
> +
> +This patch replaces and renders obsolete the following patch:
> +arm32-support.patch submitted by: Chunrong Guo <B40290@freescale.com>
> +
> +Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> +---
> + Makefile |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 91502e1..ba79607 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -59,7 +59,7 @@ ELF32 = elf32ppclinux
> + TMPLIB32 = lib
> + CPPFLAGS += -DPPC_NO_SEGMENTS
> + else
> +-ifeq ($(ARCH),armv7l)
> ++ifneq (,$(findstring arm,$(ARCH)))
> + CC32 = $(CC)
> + TMPLIB32 = lib
> + ELF32 += armelf_linux_eabi
> +--
> +1.7.9.5
> +
> diff --git
> a/meta-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.patch
> b/meta-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.patch
> deleted file mode 100644
> index 96f162d..0000000
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -Upstream-Status: Submitted
> -
> -This patch adds support for arm32.
> -
> -Signed-off-by: Chunrong Guo <B40290@freescale.com>
> -
> ---- a/Makefileold      2014-06-17 21:55:23.131058918 -0500
> -+++ b/Makefile 2014-06-17 21:56:08.726098531 -0500
> -@@ -59,6 +59,12 @@
> - TMPLIB32 = lib
> - CPPFLAGS += -DPPC_NO_SEGMENTS
> - else
> -+ifeq ($(ARCH),arm)
> -+CC32 = $(CC)
> -+TMPLIB32 = lib
> -+ELF32 += armelf_linux_eabi
> -+CUSTOM_LDSCRIPTS = no
> -+else
> - ifeq ($(ARCH),armv7l)
> - CC32 = $(CC)
> - TMPLIB32 = lib
> -@@ -116,6 +122,7 @@
> - endif
> - endif
> - endif
> -+endif
> -
> - ifdef CC32
> - OBJDIRS += obj32
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> index 315863d..851b050 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> @@ -17,7 +17,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
>      file://0001-aarch64-fix-cross-compilation.patch \
>      file://0001-aarch64-fix-page-size-not-properly-computed.patch \
>
>  file://0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch \
> -    file://arm32-support.patch \
> +    file://0001-Extend-arm32-support-to-include-BE-variants.patch \
>  "
>
>  S = "${WORKDIR}/git"
> --
> 1.7.9.5
>
>

