Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5A71C7F2B6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 15:27:48 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id d26so2539921qkk.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2019 08:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=F1OpMR2SOLOPy5Nm28pOdEjmtPhZiR2o7l6V3+mYCh0=;
	b=oREmf2TFbpR29NYISpaJ5pbsF/0j59WPkCHUE2CE5ZrT334ZGn5GvPdoZD6Z0rc4zM
	+dYsMcKoSZkDOaBvdnXJx69lzf/xB8b18hz7Brub959WFQLodTgb/fzvOy5gnx+lClPg
	tSpIoe3LaxLfJqKhZ6Mi0XwkT2xVZYzM9bQ/BjaPUfGdKnMfTlCHLYTi7jaISD4htvPE
	2r8UvydJQCJ+T/u3nsdbkVWCaX1549gITzOMNy2WT1slBSuAz++hqKynUb7gaegFAZ3P
	HompRO7rumzbknHTfYfNvFfxJ2wJOxdiougGq85Cinbym7B2uqCQKLqTvgw1mfV9jnwK
	3NYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=F1OpMR2SOLOPy5Nm28pOdEjmtPhZiR2o7l6V3+mYCh0=;
	b=RaMU9nuT87q7DuXOncOf8aF9qSAD9ISZivq7zLYRAk8stYOofSkLiZPuxRlxw990Zq
	UQaT9epo8ZeBk1tLGIFY4Q/r/qPemi1DYerlLpxi9gcIFDIwKQtvS28K2UTT75flOOZZ
	iabgPhQEGFyL6byYk3e+ohD+qYjjlYPYbHrLaGFYSkodsyqK+lkqESzBvrT38Y2OuVX1
	HzHwKq9mZLvTCWqFeJ0gZF+k7BeYlVhHQ+23E7IjiqMCiHF/w4fpGaaUfiBur3ncbtUk
	rUCj7LpKqsBQUEQHdsOUv4VCliZhyKaQfzfLNlY4jQCUlzZHW6qWuxdZIaVBOZpLOJXn
	bZxA==
X-Gm-Message-State: APjAAAXdzjbcPl0Nz0Gk4wjs+5YdnoVRAOQ3KbX0p+4sleILCOCbQx05
	u7SYyEUO2FeSiRHEZ3rGP9QsUYyCLkphjEWDVfE=
X-Google-Smtp-Source: APXvYqwuwYwhw5Sfn2WPbMWwzgTFACVYJIg8YK2jZiJ6jKM2LC7nbqnTUZTrF94Hux8YUNPFqOQD8Y9hB1z05a00PgM=
X-Received: by 2002:a37:c403:: with SMTP id d3mr3506460qki.212.1567697268887; 
	Thu, 05 Sep 2019 08:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <1567663249-96567-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1567663249-96567-1-git-send-email-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Sep 2019 08:27:22 -0700
Message-ID: <CAMKF1spoXjNuZj1nZKO+8uWA2NXoGoafwA6RqcucJeyB6rA9Qg@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH] xfsdump: support usrmerge
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
X-List-Received-Date: Thu, 05 Sep 2019 15:27:48 -0000
Content-Type: text/plain; charset="UTF-8"

this fails in a non usrmerge case e.g.

https://errors.yoctoproject.org/Errors/Details/268439/

On Wed, Sep 4, 2019 at 11:01 PM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../files/0001-xfsdump-support-usrmerge.patch      | 48 ++++++++++++++++++++++
>  .../recipes-utils/xfsdump/xfsdump_3.1.8.bb         |  2 +-
>  2 files changed, 49 insertions(+), 1 deletion(-)
>  create mode 100644 meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-support-usrmerge.patch
>
> diff --git a/meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-support-usrmerge.patch b/meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-support-usrmerge.patch
> new file mode 100644
> index 0000000..04ec7b3
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-support-usrmerge.patch
> @@ -0,0 +1,48 @@
> +From 2da4cfe17b994d7f10017561ca8efe6b6bd5f3cf Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 5 Sep 2019 11:17:15 +0800
> +Subject: [PATCH] xfsdump: support usrmerge
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + dump/Makefile    | 4 +---
> + restore/Makefile | 4 +---
> + 2 files changed, 2 insertions(+), 6 deletions(-)
> +
> +diff --git a/dump/Makefile b/dump/Makefile
> +index 97879fa..14da664 100644
> +--- a/dump/Makefile
> ++++ b/dump/Makefile
> +@@ -97,10 +97,8 @@ default: depend $(LTCOMMAND)
> + include $(BUILDRULES)
> +
> + install: default
> +-      $(INSTALL) -m 755 -d $(PKG_ROOT_SBIN_DIR)
> +-      $(LTINSTALL) -m 755 $(LTCOMMAND) $(PKG_ROOT_SBIN_DIR)
> +       $(INSTALL) -m 755 -d $(PKG_SBIN_DIR)
> +-      $(INSTALL) -S $(PKG_ROOT_SBIN_DIR)/$(LTCOMMAND) $(PKG_SBIN_DIR)/$(LTCOMMAND)
> ++      $(LTINSTALL) -m 755 $(LTCOMMAND) $(PKG_SBIN_DIR)
> + install-dev:
> +
> + .dep: $(COMMINCL) $(COMMON) $(INVINCL) $(INVCOMMON)
> +diff --git a/restore/Makefile b/restore/Makefile
> +index c6f3f25..7835ecc 100644
> +--- a/restore/Makefile
> ++++ b/restore/Makefile
> +@@ -107,10 +107,8 @@ default: depend $(LTCOMMAND)
> + include $(BUILDRULES)
> +
> + install: default
> +-      $(INSTALL) -m 755 -d $(PKG_ROOT_SBIN_DIR)
> +-      $(LTINSTALL) -m 755 $(LTCOMMAND) $(PKG_ROOT_SBIN_DIR)
> +       $(INSTALL) -m 755 -d $(PKG_SBIN_DIR)
> +-      $(INSTALL) -S $(PKG_ROOT_SBIN_DIR)/$(LTCOMMAND) $(PKG_SBIN_DIR)/$(LTCOMMAND)
> ++      $(LTINSTALL) -m 755 $(LTCOMMAND) $(PKG_SBIN_DIR)
> + install-dev:
> +
> + .dep: $(COMMINCL) $(COMMON) $(INVINCL) $(INVCOMMON)
> +--
> +2.7.4
> +
> diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.8.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.8.bb
> index 0421aa0..9c8e78e 100644
> --- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.8.bb
> +++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.8.bb
> @@ -12,7 +12,7 @@ DEPENDS = "xfsprogs attr"
>
>  SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsdump/${BP}.tar.xz \
>             file://remove-install-as-user.patch \
> -           file://work-with-new-version-of-xfsprogs.patch \
> +           ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-xfsdump-support-usrmerge.patch','',d)} \
>             "
>  SRC_URI[md5sum] = "84d3bc287b4a2bb5d16b2320a47049a7"
>  SRC_URI[sha256sum] = "ed14e67ae5b273c2698e767b43a46f033d361e540fe13feaaf9b110ee0edc585"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

