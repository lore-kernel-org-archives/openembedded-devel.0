Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id A59B073D68
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 20:33:49 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so34551465igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 13:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=IHv9UP8DF7EMEzePqiVdmewxEo1oAindPE5UZR+9ySk=;
	b=gMaYCO8TK5Aqzo2sKs4s3iZA2pI1J+g79I0RX8nnze7Lygs28FxJGcJIib2NpFVMEp
	Br6FPu5+OaVokdcuNGx/pDFCTlqH1A5KtP4OP8GrJHT3QHCbrST/0EFIZmlZgJZnXNRb
	ZHNDM2+Eg/eFIf+xadrqYv1gqSP1rZKDuYw6FLEcogAb3rH2MBl52naA/PIIC7wkGxer
	axzJRj2Q10+V/06F+C8lxgEwn+pe85GUbf6TgT/v3eQXigE30FQkK7gV4j2UCeIXu0Uw
	R7/9Q2IuTVQYba5XXCN83GRx5DUxHZ+wm0wOYPGdHSxzK6lFXdOANaNfKfke04emFCzi
	lE6A==
MIME-Version: 1.0
X-Received: by 10.50.23.105 with SMTP id l9mr19592054igf.13.1428957230923;
	Mon, 13 Apr 2015 13:33:50 -0700 (PDT)
Received: by 10.50.117.7 with HTTP; Mon, 13 Apr 2015 13:33:50 -0700 (PDT)
Received: by 10.50.117.7 with HTTP; Mon, 13 Apr 2015 13:33:50 -0700 (PDT)
In-Reply-To: <1428910057-23647-3-git-send-email-sven.ebenfeld@gmail.com>
References: <1428910057-23647-1-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-2-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-3-git-send-email-sven.ebenfeld@gmail.com>
Date: Mon, 13 Apr 2015 13:33:50 -0700
Message-ID: <CAMKF1sq4OhOhTXD6fefKM=npk_dz+2JRibLd+uSu6L723rJtwA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-java][PATCH v2 2/7] icedtea7-native: fix build with gcc 4.9
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
X-List-Received-Date: Mon, 13 Apr 2015 20:33:53 -0000
Content-Type: text/plain; charset=UTF-8

On Apr 13, 2015 12:29 AM, "Sven Ebenfeld" <sven.ebenfeld@gmail.com> wrote:
>
> The stabs debug format is not supported by our toolchain. It works if we
> use gdb debug format.

Why ggdb should -g be enough?
>
> Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> ---
>  .../icedtea-change-to-gdb-debug-format.patch       | 29
++++++++++++++++++++++
>  recipes-core/icedtea/openjdk-7-release-03b147.inc  |  2 ++
>  2 files changed, 31 insertions(+)
>  create mode 100644
recipes-core/icedtea/openjdk-7-03b147/icedtea-change-to-gdb-debug-format.patch
>
> diff --git
a/recipes-core/icedtea/openjdk-7-03b147/icedtea-change-to-gdb-debug-format.patch
b/recipes-core/icedtea/openjdk-7-03b147/icedtea-change-to-gdb-debug-format.patch
> new file mode 100644
> index 0000000..c0a3c9f
> --- /dev/null
> +++
b/recipes-core/icedtea/openjdk-7-03b147/icedtea-change-to-gdb-debug-format.patch
> @@ -0,0 +1,29 @@
> +--- openjdk/hotspot/make/linux/makefiles/gcc.make      2015-04-02
08:02:31.301728214 +0200
> ++++ openjdk/hotspot/make/linux/makefiles/gcc.make.new  2015-04-02
08:19:55.502171268 +0200
> +@@ -233,7 +233,7 @@
> + DEBUG_CFLAGS/ppc   = -g
> + DEBUG_CFLAGS += $(DEBUG_CFLAGS/$(BUILDARCH))
> + ifeq ($(DEBUG_CFLAGS/$(BUILDARCH)),)
> +-DEBUG_CFLAGS += -gstabs
> ++DEBUG_CFLAGS += -ggdb
> + endif
> +
> + ifneq ($(OBJCOPY),)
> +@@ -244,7 +244,7 @@
> +   FASTDEBUG_CFLAGS/zero  = -g
> +   FASTDEBUG_CFLAGS += $(DEBUG_CFLAGS/$(BUILDARCH))
> +   ifeq ($(FASTDEBUG_CFLAGS/$(BUILDARCH)),)
> +-    FASTDEBUG_CFLAGS += -gstabs
> ++    FASTDEBUG_CFLAGS += -ggdb
> +   endif
> +
> +   OPT_CFLAGS/ia64  = -g
> +@@ -254,7 +254,7 @@
> +   OPT_CFLAGS/zero  = -g
> +   OPT_CFLAGS += $(OPT_CFLAGS/$(BUILDARCH))
> +   ifeq ($(OPT_CFLAGS/$(BUILDARCH)),)
> +-    OPT_CFLAGS += -gstabs
> ++    OPT_CFLAGS += -ggdb
> +   endif
> + endif
> +
> diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc
b/recipes-core/icedtea/openjdk-7-release-03b147.inc
> index 47813cd..01e7a3d 100644
> --- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
> +++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
> @@ -81,6 +81,7 @@ OPENJDK_PATCHES = " \
>          file://icedtea-jdk-sane-x86-arch.patch;apply=no \
>         file://icedtea-flags.patch;apply=no \
>
file://icedtea-openjdk-remove-currency-data-generation-expi.patch;apply=no \
> +       file://icedtea-change-to-gdb-debug-format.patch;apply=no \
>          "
>
>  export DISTRIBUTION_PATCHES = " \
> @@ -91,4 +92,5 @@ export DISTRIBUTION_PATCHES = " \
>          patches/icedtea-jdk-sane-x86-arch.patch \
>         patches/icedtea-flags.patch \
>
patches/icedtea-openjdk-remove-currency-data-generation-expi.patch \
> +       patches/icedtea-change-to-gdb-debug-format.patch \
>          "
> --
> 1.8.1.rc3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

