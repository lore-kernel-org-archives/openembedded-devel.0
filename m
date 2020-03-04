Return-Path: <scott.murray@konsulko.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9B98A60B0E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 16:06:12 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id 59so1753779qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2020 08:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:in-reply-to:message-id:references
	:user-agent:mime-version;
	bh=4JYghgOX3mpXo8WjUBqhoOG+8Q4Af/Kuev6SWS7QKPQ=;
	b=dAXPXCgMErhumFUzhdjxoFNG3pLsSOKddY0tafKOstUcUsOy/f++QgYQBKf0BFdbVJ
	ApSUFvViQVBM2W4h6v/GD7CICV0AEX58rlLyBKpbW4ARgBOxmj8rNInoHtZu7t3onrLR
	5WXXGAMIqq4lU2a+OK6Rd1Ut5kHePuaWp/rLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
	:references:user-agent:mime-version;
	bh=4JYghgOX3mpXo8WjUBqhoOG+8Q4Af/Kuev6SWS7QKPQ=;
	b=bd5VaHAuMRet4xKU4JsSwD3tog93KNTdPuSPCx9+ZKuC2vMrua3qmjxovcRQBsHNaG
	p9w+gwxt3qOoT+VcHCkjIfesDYVHyPKsI70DUEjmbaUKLXGqqf3Fye7cXY4Mfv5trMfz
	5YCfmKSMnk/q5nAo1yqMnZ5uTxypZlqTI54tg8jJ65ypIES9Y9gTZLRm9hJodAyDqw5t
	7Qtt+dH+fxDwbjsaojH1ipc2kRbIegej5e1lKRqshr4yCYhneH7Xo51IbCLWyqrgXfFK
	48S3EZgoMPYTHkazUANQMLm8GIjfVsx82zNE3UvUfFpcQLuhuO/aEkfQlqbBAiKy82Lb
	Jo/w==
X-Gm-Message-State: ANhLgQ2x/mbh6vYgGUsvyePDMb7ZVr1IwVBVmSQRoRe6SRwQMMZLcgpM
	KG6uxpHEWmvhzPVGDLs8r66AAA==
X-Google-Smtp-Source: ADFU+vtgTgu+hyzpfotT23fervNMefmvfGDTPP9v9f722CO4Z2e6GSIULJ50/ww+OpamorDOb3p9GA==
X-Received: by 2002:aed:2169:: with SMTP id 96mr3090670qtc.124.1583337973327; 
	Wed, 04 Mar 2020 08:06:13 -0800 (PST)
Received: from godzilla (198-84-179-103.cpe.teksavvy.com. [198.84.179.103])
	by smtp.gmail.com with ESMTPSA id
	p126sm14273548qkd.108.2020.03.04.08.06.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 08:06:12 -0800 (PST)
Date: Wed, 4 Mar 2020 11:05:58 -0500 (EST)
From: Scott Murray <scott.murray@konsulko.com>
X-X-Sender: scottm@godzilla.spiteful.org
To: Leo Yan <leo.yan@linaro.org>
In-Reply-To: <20200304122811.16655-1-leo.yan@linaro.org>
Message-ID: <alpine.LFD.2.21.2003041103340.29352@godzilla.spiteful.org>
References: <20200304122811.16655-1-leo.yan@linaro.org>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Cc: Mike Leach <mike.leach@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v1] OpenCSD: Support for Arm CoreSight decode lib
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
X-List-Received-Date: Wed, 04 Mar 2020 16:06:12 -0000
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Mar 2020, Leo Yan wrote:

> This recipe is to support OpenCSD, which is an open source
> CoreSight trace decode library and utility.

Just a thought, this seems like the kind of thing that might make sense
for the new meta-arm layer that Jon has been working up?

> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  .../recipes-devtools/opencsd/opencsd_git.bb   | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/opencsd/opencsd_git.bb
>
> diff --git a/meta-oe/recipes-devtools/opencsd/opencsd_git.bb b/meta-oe/recipes-devtools/opencsd/opencsd_git.bb
> new file mode 100644
> index 000000000..0c3b4837d
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/opencsd/opencsd_git.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = "OpenCSD - An open source CoreSight(tm) Trace Decode library"
> +HOMEPAGE = "https://github.com/Linaro/OpenCSD"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ad8cb685eb324d2fa2530b985a43f3e5"
> +
> +SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=http;branch=master"
> +SRCREV = "03c194117971e4ad0598df29395757ced2e6e9bd"
> +
> +S = "${WORKDIR}/git"
> +
> +COMPATIBLE_HOST = "(x86_64.*|aarch64.*)-linux"
> +
> +EXTRA_OEMAKE = "ARCH='${TARGET_ARCH}' \
> +                CROSS_COMPILE='${TARGET_SYS}-' \
> +                CC='${CC}' \
> +                CXX='${CXX}' \
> +                LINKER='${CXX}' \
> +                LINUX64=1 \
> +                DEBUG=1 \
> +                "
> +
> +do_compile() {
> +    ( cd ${S}/decoder/build/linux; oe_runmake ${EXTRA_OEMAKE}; cd - )
> +}
> +
> +do_install() {
> +    ( cd ${S}/decoder/build/linux; oe_runmake PREFIX=${D}/usr install; cd - )
> +}
>

