Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 953EA65CF3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Oct 2018 11:56:49 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id n12so2264231qkh.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Oct 2018 04:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qy0JxM3tThnC1EnM2s3NOtByjuOQAdrC011PqLyL7Vk=;
	b=iJSKdaltO6B0bOVsC8kOd+0m9+0rg48q09bG+T1h8tkX3xMKpMrDL0WOMQ27X3elXM
	Z26JGfPlW3M+lYHf0Gtdz0QzPV7v2XMCkn00+FTg7F4ttA+933LHsMwFjxlahbIePqP6
	Ss3OjOJoJ9ddYqM+e3wODxP5Hc4DGRVYfFLpkW7Ca938A1ewkuK3nbs3G/uJbjG805X4
	agVj9kJJpQPPk3gWxFJ36Aj89R8T0dbhB+W5z5lMILl/KBPfx9y4tw6Zdc/Md6fdHfuh
	ci62g2wH6DY0fnBi60q9rUuQXzKKK1X2QumqWEKC5clDaB+E6r+BIelohQt+T6I+wVtD
	9CHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qy0JxM3tThnC1EnM2s3NOtByjuOQAdrC011PqLyL7Vk=;
	b=j3zi8w2EonXNZDkX9U1Ac+1wiIbpg00pyyn9Xrv6ZOn9SPGyoY8Kxw4qjQjsA3d78q
	SDT/WmOPlwHZx/Yockq4ui6P8RwlYwl4dRvJFqwhp7DEdobhjuseD9+uL87vGUfSHhhU
	0YKIjoKbbSSb1pLyCZVgJFd6ffinXSzWalBineA7Mm0ybH0wLFQ+1gjjU1xY+JBXxwWa
	0zpDst3lJpWGO/v4EbWDImSUvaIXPdgC7uXzxO+GGAbAkuqTrEu+HzaAX6A5AT7236NP
	73iUfJbLn7VShvjVuGT8kvA9tRtypozvI5bh8jBV6L/FjTkymMNUaKwmss0K8tor1q+L
	sg6A==
X-Gm-Message-State: AGRZ1gLESty/HNn0kjRmrZnc2109jV75O1VAD8RE/eNXAOJFSSR1W60o
	Rm4N/L/1jXuMEtGYwC+/yxMtO9i8avHvVOir8Aax0jfcOqbFJA==
X-Google-Smtp-Source: AJdET5dva9foza4ibgX6JAK4GumxictuVBKn5+8szj6sW5TVHCmOdNJ89+o3XpnOFQzczVYm0rYR+fJh6w63h71pLWU=
X-Received: by 2002:a37:5003:: with SMTP id
	e3-v6mr6442953qkb.102.1540641410216; 
	Sat, 27 Oct 2018 04:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540243091.git.paul.eggleton@linux.intel.com>
	<989d0e787f2adb3e7248aa0665b84384a01cd428.1540243091.git.paul.eggleton@linux.intel.com>
In-Reply-To: <989d0e787f2adb3e7248aa0665b84384a01cd428.1540243091.git.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 27 Oct 2018 04:56:24 -0700
Message-ID: <CAMKF1spPnAcmS9qOis2=Z58joHzUHRySB6XsS-Xe0-AWH4sjjg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] libssh: upgrade to 0.8.4
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
X-List-Received-Date: Sat, 27 Oct 2018 11:56:49 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Paul

Fails to build with thumb-1

see http://errors.yoctoproject.org/Errors/Details/197582/

TOPDIR/build/tmpfs/work/armv5te-yoe-linux-gnueabi/libssh/0.8.4-r0/git/src/channels.c:2632:1:
sorry, unimplemented: -fstack-check=specific for Thumb-1

I am fine if it was using ARM ISA form armv5

On Mon, Oct 22, 2018 at 2:20 PM Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
>
> Notable changes since 0.7.3:
>   * Fixed CVE-2018-10933 authentication bypass
>   * Removed support for deprecated SSHv1 protocol
>   * Added support for OpenSSL 1.1
>   * Added support for chacha20-poly1305 cipher
>   * Added ECDSA support with gcrypt backend
>   * Improved threading support (note: libssh_threads is now gone)
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  .../libssh/{libssh_0.7.3.bb => libssh_0.8.4.bb}               | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/libssh/{libssh_0.7.3.bb => libssh_0.8.4.bb} (86%)
>
> diff --git a/meta-oe/recipes-support/libssh/libssh_0.7.3.bb b/meta-oe/recipes-support/libssh/libssh_0.8.4.bb
> similarity index 86%
> rename from meta-oe/recipes-support/libssh/libssh_0.7.3.bb
> rename to meta-oe/recipes-support/libssh/libssh_0.8.4.bb
> index 6064969ae..8566741a3 100644
> --- a/meta-oe/recipes-support/libssh/libssh_0.7.3.bb
> +++ b/meta-oe/recipes-support/libssh/libssh_0.8.4.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=388a4fb1dea8ceae0be78ba9b01fc139"
>
>  DEPENDS = "zlib openssl libgcrypt"
>
> -SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=v0-7"
> -SRCREV = "cdf7690e038230623cbbf6b024ece62f41efa98d"
> +SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=stable-0.8"
> +SRCREV = "789df0b7d0c7abd6b85db9fc5247e146e3d4ddba"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.17.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

