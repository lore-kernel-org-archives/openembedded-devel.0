Return-Path: <raj.khem@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id BF15561756
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 22:21:01 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id s18so2939843iln.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 14:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=uz4fBAYRYrMpu+rRYHfIaOzwrC2GprbwxVcymH+P4QI=;
	b=VFHpzxDcbDPkAgMNWs7qVlVmSuZMZmL11Vl17kg5XTbdFWAPXYOmdGJzSIBQkMZYld
	pBkDcxCCuEQCddWBimbXMs+/FWxZc6nAEGRzX95ACIv6G/hpou8nERyw41b6tLY666WJ
	hWB3qjKipEvja3Ufty6Wuo01zjUKscXFbz2/gihqxoUE8/W2zLPIA0toonscETom+9s5
	xXab7E+ph5j3RGb9vtOxzs/AI+DzaGwwNdrpuJ0FUzSX+3ipcJoqPRIi7fRk+oznpyVE
	2rT8noVfWlQ7sKc+RJFG5UdU5omcIPaf/K341uDdtbT0vgymoHIycX9/Fv1QXK1qKMi5
	k9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=uz4fBAYRYrMpu+rRYHfIaOzwrC2GprbwxVcymH+P4QI=;
	b=TeCGHC7CSbnvMFTNhLR1N/QtteOfVbZ7MBfjeZ3wAEPluAmz3jVdQNB2DOfDSAry+n
	FemTh34bHXo3jPGOxKNZPCHfmQmCVnJQxoZToUawUqO/yVzwCLkAwv4BrE7DN4x89kss
	/DHQNc2V4qQQ5abEUqYn1X5RqZhhCsdjcLVJQYtqncEVv3gz2a+RYUqHoCkC2sCDmZtT
	YXlZ9t4hWS0d4Yhdil8SlLeKS8DuZyLbcLfZXePlNMvCEl9YkDZr6eBvj1yB2Q6zijzR
	mNBqiIE6uTQ5TzFnjke40Jh0ngh5mbayDakbFP1Gs/6GQk+Cp/8qduPGyRjxIbn9vMcR
	bW1Q==
X-Gm-Message-State: APjAAAVmHNDBVE9ZnWNQm5sI86wJMcML594kDUhfhvmaLJkiLDYLkglw
	HFyR9GsKuxTnBL6zJbUKs/s=
X-Google-Smtp-Source: APXvYqwS9+C0wGTwUqL2qdM6uk6sigzZGZrkTtBtSiz6jPloM4LDjGkaU2bF+bU1No9D/NNqLZFHHA==
X-Received: by 2002:a92:3989:: with SMTP id h9mr36941439ilf.156.1582323662400; 
	Fri, 21 Feb 2020 14:21:02 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:949d:f94a:fa18:f7b4?
	([2601:646:9200:4e0:949d:f94a:fa18:f7b4])
	by smtp.gmail.com with ESMTPSA id c3sm1026290ioc.63.2020.02.21.14.21.00
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 21 Feb 2020 14:21:01 -0800 (PST)
To: Leo Yan <leo.yan@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>
References: <20200221104340.21294-1-leo.yan@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <b9131d30-d9a2-a45c-726a-18be24be376e@gmail.com>
Date: Fri, 21 Feb 2020 14:20:59 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221104340.21294-1-leo.yan@linaro.org>
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
X-List-Received-Date: Fri, 21 Feb 2020 22:21:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Fails to build on mips

https://errors.yoctoproject.org/Errors/Details/392045/

On 2/21/20 2:43 AM, Leo Yan wrote:
> Ply is a light-weight eBPF tool which compiles ply script or one-liner
> to Linux BPF programs and attaches to kprobes and tracepoints.  It
> doesn't require external dependencies except libc, so it's very friendly
> for embedded system usage.
> 
> This patch adds the recipe to support ply building for git version.
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>   meta-oe/recipes-devtools/ply/ply_git.bb | 38 +++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
>   create mode 100644 meta-oe/recipes-devtools/ply/ply_git.bb
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
> 

