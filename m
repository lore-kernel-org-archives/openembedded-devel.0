Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id E11EC61604
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 15:42:00 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id c20so3981136qkm.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 07:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JtOvvwvXNsSIz5RWRn40hU02JOBFBuwpbBsyhy7qzPI=;
	b=LsDMZUjQt2NCD9i1k6El/ZBnC60DCvEfYtu40lc7yZKxzUGdOxqlygkIbrFTUZfuHx
	q87T2xYLqH4xjHi8f3sL2plg+qwLge6xmhznSBu63eYTfddUQUYeKoazxGHjPf7Hj8Qy
	cBA/w8FthYUuf8/j/GVQ1mFSESheHFni6sDYcIN4G9ctaLT4FPzjZZFVPWYYcYw/cvOW
	LHBj92BaQj6GQU9G2eF9OPVcI0rQf4rB7+9b/D5koovpPR7JPeARTPLCujGOGurZRoLz
	sSU7vxrLiFszAGf8AgWE7kubB8/dx39wrhNguvYi4I872+0KDX+Sv24iQb3e80jMe9Q+
	sgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JtOvvwvXNsSIz5RWRn40hU02JOBFBuwpbBsyhy7qzPI=;
	b=WxPh8uBqVkMCOu23lseHdW0BmgNEPfHWwgjbSImlW7CdhsavOEcUnNDnO9EYvsbTAn
	DOdlNc8ATHnVu6nL6AkwVv2vX8xQ/aJup1xFxBpruiZdXr/QpO5aXH4Dk2iQPdCjO7/y
	xMmv6cxym3On6XWo/ECGRXiSxBG727P65C8+A1KzPibW8jWIpqxvsbxbY2n8R7gtb0Nn
	k6wrFx+vtWEIiuLXIRMuxGAsg4W/PUX485DFfsoLta2RyEwo6OoryYbPsv3K0T2k1UZK
	ClcZYO3G+yi2xgkaQRG52RruqwyZJwBAzEUiP8YcH5kAPad489SuFM4DsIkY2k0+FkJx
	BJqQ==
X-Gm-Message-State: APjAAAXNK2ImHGDpB+abiZrqlIM22QLWAfDqgfJ4sdtsNZsyhvJ+/HQS
	A+75gdNu/xHHJovQJ7f3683wsXd085VnTjY9Go0=
X-Google-Smtp-Source: APXvYqwVrqItavh4UkJwpq3b8FtAJo5HOahsRkzrG3G4Us4sNdUIkmqtweuTHCHK8w/CDXSmHfOdSAZLxC3fYVzeaKs=
X-Received: by 2002:a37:47c4:: with SMTP id
	u187mr29290071qka.165.1582213321413; 
	Thu, 20 Feb 2020 07:42:01 -0800 (PST)
MIME-Version: 1.0
References: <20200218052544.9467-1-leo.yan@linaro.org>
	<20200218052544.9467-2-leo.yan@linaro.org>
In-Reply-To: <20200218052544.9467-2-leo.yan@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Feb 2020 07:41:35 -0800
Message-ID: <CAMKF1sordwdPV8=vvtakN4vb=MugUqY0f4k9P3ewpyR_9x63ZA@mail.gmail.com>
To: Leo Yan <leo.yan@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v1 1/4] Ply: Add recipe for git version
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
X-List-Received-Date: Thu, 20 Feb 2020 15:42:01 -0000
Content-Type: text/plain; charset="UTF-8"

fails to build fot x86/musl
http://errors.yoctoproject.org/Errors/Details/391871/

On Mon, Feb 17, 2020 at 9:26 PM Leo Yan <leo.yan@linaro.org> wrote:
>
> Ply is a light-weight eBPF tool which compiles ply script or one-liner
> to Linux BPF programs and attaches to kprobes and tracepoints.  It
> doesn't require external dependencies except libc, so it's very friendly
> for embedded system usage.
>
> This patch adds the recipe to support ply building for git version.
>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  meta-oe/recipes-devtools/ply/ply_git.bb | 27 +++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/ply/ply_git.bb
>
> diff --git a/meta-oe/recipes-devtools/ply/ply_git.bb b/meta-oe/recipes-devtools/ply/ply_git.bb
> new file mode 100644
> index 000000000..b8295386c
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/ply/ply_git.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "Ply: A light-weight dynamic tracer for eBPF"
> +HOMEPAGE = "https://github.com/iovisor/ply"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +DEPENDS += "bison-native"
> +
> +SRC_URI = "git://github.com/iovisor/ply"
> +SRCREV = "aa5b9ac31307ec1acece818be334ef801c802a12"
> +
> +S = "${WORKDIR}/git"
> +
> +do_configure_prepend() {
> +    ( cd ${S}; ./autogen.sh; cd - )
> +}
> +
> +do_configure() {
> +    ( cd ${S}; ./configure --host=${TARGET_SYS} --prefix=${D}${prefix}; cd - )
> +}
> +
> +do_compile() {
> +    ( cd ${S}; oe_runmake; cd - )
> +}
> +
> +do_install() {
> +    ( cd ${S}; oe_runmake install; cd - )
> +}
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

