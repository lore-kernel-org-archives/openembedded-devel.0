Return-Path: <alex.kiernan@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 24B7F616E0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 17:08:32 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id b15so2212703iln.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 09:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7KiGCNwWgn+GrxZajuV1vzbPVuvTFAPXn6Tz8ulrHjE=;
	b=hQ6l08g8MII5VK/zRc5i50dK49no8twSM+9AE+FEN/jWWR0jDK33jFN+56Tl3d+lAh
	kOYg+t1yuw4JQXCRsJejl4njCg1kKY2buPhQYtcZuc/Ew9Xz9ZcxFTw2rO8A1qtoxm71
	a57bTtQ+ip5Nc0GcF2elm0ihmNF1SWdw1rhqoV3mh+ldQH3QHMjWSXbOFoPlteNe2AFU
	/eBJfYsQHetSds5GoAhYBibRcvL9ENBZ543k3XM5tbSoH0vNxN5cRDgvAtU5VIGgmSQv
	Bpvyrr+0W40bNDjSKtI7KMz6Lv8ZFsxRTtQWnuH4avN+kA0+2/KTQ4ZlleqrKSLqWWTS
	ouUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7KiGCNwWgn+GrxZajuV1vzbPVuvTFAPXn6Tz8ulrHjE=;
	b=X1076ffw5MiRY1Ji6sujBBrsmczNFM8rvc0Z7SnlxaNq5xntxcaU7JiCsk1utE93tq
	iUoRQQ9bwC8NaE/W29EdGeSSIMyhCPsVTEMEp/zMGmJCUQoGPn7+8GkN7+7iV9Y5RHxk
	QMldSHAWVm7Dxz6LKACWdO4Ee45jYy3qn5yhfEro3chPIt4uD0pP/A80+8g9CcE8mEcS
	FrSo0BUA598B9LVHQJZGXjrprrJnvdTzsq2gRRJW+4++3EvYdnd/ixm+Z7PPhGSAalmO
	NpHzfWD+bSXppbW/+PzVm0Hm9xA1NCgDxKlHGg8VONnZUZd93nPxTZApx5z/hlk1EG1C
	T1ZA==
X-Gm-Message-State: APjAAAX7johruG3OgGjxb13/TDYHsp8rqIhxIEl6W/uXBuitO5CX1wUH
	8hbwuBxYnK2fIBtodFPOT/O2CrlbuRYWx43AVgs=
X-Google-Smtp-Source: APXvYqzxBE0WcByiqtJqtupgYSZ0e2K6UD6bbLq4Jrjj8jNytxTJAsG4YnAkY7eNln9Jgf02aue7Mm4RE8ycjoNTA38=
X-Received: by 2002:a92:af08:: with SMTP id n8mr37093104ili.217.1582304913933; 
	Fri, 21 Feb 2020 09:08:33 -0800 (PST)
MIME-Version: 1.0
References: <20200221104340.21294-1-leo.yan@linaro.org>
In-Reply-To: <20200221104340.21294-1-leo.yan@linaro.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 21 Feb 2020 17:08:22 +0000
Message-ID: <CAO5Uq5QWcpy11_ibDE-nFJQpakdXEwE8GJZn+SGJdxPx4Bgm5g@mail.gmail.com>
To: Leo Yan <leo.yan@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] Ply: Add recipe for git version
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
X-List-Received-Date: Fri, 21 Feb 2020 17:08:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 21, 2020 at 10:44 AM Leo Yan <leo.yan@linaro.org> wrote:
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
>  meta-oe/recipes-devtools/ply/ply_git.bb | 38 +++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/ply/ply_git.bb
>
> diff --git a/meta-oe/recipes-devtools/ply/ply_git.bb b/meta-oe/recipes-devtools/ply/ply_git.bb
> new file mode 100644
> index 000000000..21395885c
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/ply/ply_git.bb
> @@ -0,0 +1,38 @@
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
> +

Can't all of these do_...  steps be replaced with `inherit autotools-brokensep`?


> +do_install_append() {
> +    chrpath -d ${D}${prefix}/sbin/ply
> +}
> +
> +# x86, mips32/64, riscv64 are not supported in this release
> +COMPATIBLE_HOST_i586 = 'null'
> +COMPATIBLE_HOST_i686 = 'null'
> +COMPATIBLE_HOST_mipsarchn32 = "null"
> +COMPATIBLE_HOST_mipsarchn64 = "null"
> +COMPATIBLE_HOST_riscv64 = "null"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



--
Alex Kiernan

