Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6A0FE7E26B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 02:17:03 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id t132so16044033pgb.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2019 19:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=VJiON97yHpN8FDtftA1WHnboVNBURxtGvpPisWDaN1s=;
	b=sZFqbhBLGtFT7r368BCaDqSSYOAkcgPa2rx471xnRbQ8/oEYpKFON1KhAnXSqinZoX
	Oh8RqKby5CpsOsvv9W9njnGR/YyNWTjfkIvCLZieQaaXZOzr04hCZ57lcMAqE7MRlhI+
	6JBJi5ZGqehfUp4IYtJnNSVIuSm/84U7qvlpqot0XuInr7pBnceMl7HvDKX2EEag2ZFY
	wwgiumr8Gm/3kR2OSxnd833jcj2L06KjqfnzYsrvsjJ5ciDiAwAfqGleWXEx7TXGatLy
	YajsblunSVr8y8/B4JsQ1X+NyLowQfaycHvW+27amgEge1Q0apk3Uv7ygj5HNJHYumF7
	vkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=VJiON97yHpN8FDtftA1WHnboVNBURxtGvpPisWDaN1s=;
	b=naVXnNLZh/IpRLARPV7A2x0NIg6m9Nry4iWK+UGM3xPCyhiw9Vo/Kn2aIr6RVJSUsD
	p6xnzhGQ1pAQuyH39+Cf/RL714ryqxoDInu+FOQkNLr4iTu/YfDIVfMWMIRUFmjBiUxw
	5OrUk9SCDrDLObzOZDaXVtVMJAmnUWqRB+4OBU0zKVCv9rjer9zXBDkxhXvdJDAyCYEH
	g+KnjcheX23GiOjfmVyGs960aoE+cdEQX9nj+H/rib9tytuyqo/ty+4GcDpvMj8pd5VO
	oLT0hdSQT4oQ3dW3NP4ogCmOHbRrRnGAbRQKZNqADiFvIz3juk9ITq1wgTn5apoHmBtY
	0NfQ==
X-Gm-Message-State: APjAAAVvUiHKOu3NY7RSjUGihABgsTkJkvTcHv8Uzod7qMN2/xuFtdTz
	9wXUaDHkk7Esk9OmyBih2mrEVZKYtkA=
X-Google-Smtp-Source: APXvYqwCJ1kU1Wtpqb3v3XNHa/NBrr4Ees1dGl4C8kT8JhJmlCAa70DbtqbKWNyr+QEQroQeRsjq7A==
X-Received: by 2002:a63:69c1:: with SMTP id
	e184mr61541904pgc.198.1563675424081; 
	Sat, 20 Jul 2019 19:17:04 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::effc? ([2601:646:8500:6bc6::effc])
	by smtp.gmail.com with ESMTPSA id
	i9sm23941820pgg.38.2019.07.20.19.17.03
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sat, 20 Jul 2019 19:17:03 -0700 (PDT)
To: anatol.oe@belski.net, Anatol Belski <anbelski@microsoft.com>,
	openembedded-devel@lists.openembedded.org
References: <20190721013327.27634-1-anbelski@microsoft.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <497ba06b-0113-3430-f9be-8d80a6ed6fde@gmail.com>
Date: Sat, 20 Jul 2019 19:17:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190721013327.27634-1-anbelski@microsoft.com>
Subject: Re: [meta-oe][PATCH] Finer gperftools packaging
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
X-List-Received-Date: Sun, 21 Jul 2019 02:17:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Anatol

On 7/20/19 6:33 PM, Anatol Belski via Openembedded-devel wrote:
> This splits gperftools into
>
> - gperftools script
> - gperftools profiler and other libs
> - libtcmalloc-minimal
> - docs and other stuff
>
> Especially the libctmalloc-minimal is what is useful if only an improved
> allocator needs to be used. The gperftools package stays otherwise fully
> backward compatible, as it depends on any necessary lib packages.
> Though, the lib packages can be installed separately, which allows for
> more flexibility and for cleaner image contents.
>
> Signed-off-by: Anatol Belski <anbelski@microsoft.com>
> ---
>   .../gperftools/gperftools_2.7.bb              | 23 +++++++++++++++++++
>   1 file changed, 23 insertions(+)
>
> diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.7.bb b/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
> index c8b91278d..badf0d203 100644
> --- a/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
> +++ b/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
> @@ -28,3 +28,26 @@ COMPATIBLE_HOST_mipsarch_libc-glibc = "null"
>   ARM_INSTRUCTION_SET_armv5 = "arm"
>   ARM_INSTRUCTION_SET_toolchain-clang_arm = "arm"
>   
> +PACKAGES = "${PN} ${PN}-dbg ${PN}-doc ${PN}-libs ${PN}-libs-dev ${PN}-libs-staticdev libtcmalloc-minimal"
> +

some of these are default so instead of rewriting the variable 
completely lets add/delete whatever is needed

PACKAGE_BREFORE_PN += "libtcmalloc-minimal ${PN}-libs"

> +EXTRA_OECONF_append += " --enable-static"
> +
why do we need this ?
> +FILES_${PN} = "${bindir}/*"
> +FILES_${PN}-doc = "${docdir} ${mandir}"

we wont need these

> +FILES_${PN}-libs = "${libdir}/libprofiler*${SOLIBS} ${libdir}/libprofiler*${SOLIBS}\
> +		${libdir}/libtcmalloc${SOLIBS} \
> +		${libdir}/libtcmalloc_debug${SOLIBS} \
> +		${libdir}/libtcmalloc_and_profiler*${SOLIBS}"

do we need a separate libs package ? what does it give us ?

> +FILES_${PN}-libs-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/lib*.la ${libdir}/pkgconfig"
> +FILES_${PN}-libs-staticdev = "${libdir}/*.a"
not needed
> +FILES_libtcmalloc-minimal = "${libdir}/libtcmalloc_minimal*${SOLIBS} ${libdir}/libtcmalloc_minimal_debug*${SOLIBS}"
> +
> +RDEPENDS_${PN} = "${PN}-libs (= ${EXTENDPKGV})"
> +RDEPENDS_${PN}-libs = "libtcmalloc-minimal (= ${EXTENDPKGV})"
> +RDEPENDS_${PN}-libs-dev = "${PN}-libs (= ${EXTENDPKGV}) libtcmalloc-minimal (= ${EXTENDPKGV})"
> +RDEPENDS_${PN}-libs-staticdev = "${PN}-libs-dev (= ${EXTENDPKGV})"
> +
> +SECTION_${$PN}-doc = "doc"
> +SECTION_${PN}-libs-dev = "devel"
> +SECTION_${PN}-libs-staticdev = "devel"
> +

