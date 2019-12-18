Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 080667F811
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 03:23:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47d0hw3tGqzQ3;
	Wed, 18 Dec 2019 04:23:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1576639424;
	bh=PmePCxfXjTQ2jWiZM0xKGVWV4If0QKUO0071YQ2k3Ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r9PN3ENJbAO8kL8ow8i2CkdjYfCYEhpz1Sqb6uQxmQnGqF07f7pYpcvm17PjChhjn
	biZncZc+E/6OduAU2vfQxJmYPyWoxOqCx6W1tXTf7V+WaTf195snalDahLceF4UOZM
	gS7kqlXefnYhmh7z9QF7LpxdtIdq0zDUtx1cluFE1RN66OasjX9KXlxryo1yxcokdp
	BlRwXpV2WUPb/XbDy8eycqFmg4mA73JTGRn/FtA3Uttsk2kTZwY7bRqYV8A0FY8bXQ
	temOX7RYP+Od3tFDIKiWHO3rcKN9ki9JLCehc1gzriRrVUCR/HIBjDlmDz+KSKa3zq
	QxMGIIP/O4fiWHEijinBvip5HeZ8X270OE80DZCUqEvmMfc0IpXFHOS3u27EtJ6SAj
	RNp45z4wm5Dd3rXerrXDUD7QIvuUzw1wFH8bh7v6g+O8wMDD8n4MVcOVmryQAbk5Ym
	lqKodWZNx55DRfBq5NXdSVOZarpl1u377dLtAVs16tA7A45gbXAgM7/MrwHWNO4L/W
	FQfVjpJxKcNFJQcG3ahVgKk5bN/70vTlObyWNZNHCOSJ6NwOodEA4X+qAyPhqJuu2c
	Gi9qQFsw9loCgBOlz4As9A0/8NGO16Je4DsgE1R4gQ/JC6M1Lez0n4CQySh9iqDWx1
	9hTCA9TaU5mZSWS+X1KtBuYA=
Date: Wed, 18 Dec 2019 05:23:42 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191218032342.GB1997@localhost>
References: <20191218024810.2874990-1-raj.khem@gmail.com>
	<20191218024810.2874990-2-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191218024810.2874990-2-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/3] libqb: Add --enable-nosection-fallback with mips64/clang
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
X-List-Received-Date: Wed, 18 Dec 2019 03:23:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Dec 17, 2019 at 06:48:09PM -0800, Khem Raj wrote:
> Same issue happens with clang/mips64 so extend the gold fix to cover for
> this case
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-extended/libqb/libqb_1.0.5.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-extended/libqb/libqb_1.0.5.bb b/meta-oe/recipes-extended/libqb/libqb_1.0.5.bb
> index b205186e0b..82503a168b 100644
> --- a/meta-oe/recipes-extended/libqb/libqb_1.0.5.bb
> +++ b/meta-oe/recipes-extended/libqb/libqb_1.0.5.bb
> @@ -22,9 +22,13 @@ S = "${WORKDIR}/git"
>  # WORKDIR/libqb/1.0.3+gitAUTOINC+c235284b5f-r0/recipe-sysroot-native/usr/bin/i586-oe-linux/../../libexec/i586-oe-linux/gcc/i586-oe-linux/8.1.0/ld: error: conftest.ld: SECTIONS seen after other input files; try -T/--script
>  # WORKDIR/libqb/1.0.3+gitAUTOINC+c235284b5f-r0/recipe-sysroot-native/usr/bin/i586-oe-linux/../../libexec/i586-oe-linux/gcc/i586-oe-linux/8.1.0/ld: internal error in write_sections, at ../../gold/reloc.cc:791
>  # collect2: error: ld returned 1 exit status
> -EXTRA_OECONF_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' --enable-nosection-fallback', '', d)}"
> +NOSECTION_FALLBACK = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-nosection-fallback', '', d)}"
> +NOSECTION_FALLBACK_toolchain-clang_mips64 = "--enable-nosection-fallback"
>...

Removing these fragile linker tricks is the main change in the 1.9.0 
(pre-)release, upgrading might be a better option than collecting more
cases where the removed code broke.

cu
Adrian

