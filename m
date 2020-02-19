Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 26FB16164E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 23:07:38 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id i6so868415pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 15:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=4dTlt2r4I7M/CgVQDhx096YsBV7hAPdKfLVnOdhNXPc=;
	b=Kz91TzG5vSaEpxZDlOOEjAxWi9E3LlWGk9V97IPkV2DHb9/ri9cKQPZYuNV4Mz94cB
	SuFTWaQ/+oR72WkrCqVWJn5RvCjx6nyXbdtRWaOSHquEDXtpEemrtnvCeivDSkxQHZHw
	dGRuQOOr4ekhkM5BZKX7LaZYRE/2a6XRetV6GZ6TagLQaOxGHMFjGr/EQcc3YNvRstdw
	9Xp/5+TNqE0tzMrbBLSjgnUy2s8nEDWQV+qCvVbfFNF5uHPcJvsi1ne3AN0PsG8HL1ls
	4FaUFY7UncEalylV8s8HqiMtzU2C0bHjruiZAJL/+WV5NZmGvkY/DtsWEgKYwd17iQcZ
	358Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4dTlt2r4I7M/CgVQDhx096YsBV7hAPdKfLVnOdhNXPc=;
	b=HMR1xuWFWurf/Ji/cWxOAW8AbJSsc0YH4jRw2R24Kcyz8ULHeEGX9JiPIWlmxL2D20
	DisnjwDQbeVNB/2vdxEc0ruUTQqo4bVkCOB6Lv4lFbtZGlRC9ox9+3hgcDX00COKGSoN
	LBTmj35XjT4b4b/rtcVz6BeSUR8pfZkjxcK21b75a0bjNCKnDUgdqpk31uvXgYkBr2m9
	xJLE/QiGOvBNm9tVZwBWYOXfqlN5UPfXtR9CmlNqjLLHmUwC32xMH+PlHD2+suE3+Ois
	kptAcIY3tP53TMd7sN9wh1qOpwwIfP2/6hYdHQ5mlvoWBEDeS9a58w9YYvf+f2RCCsLK
	F7hw==
X-Gm-Message-State: APjAAAWuwRSbKlJcNgikWCDHzaI0mzVCOMcafWlJvV90A9aSEqhoXNlQ
	aws5tRqZuC2MkuqsIp9cPbFFBLpZbsg=
X-Google-Smtp-Source: APXvYqwymU8Pl1ASrbosYWY7nYJx5GcLWimOmFizWbCFngKIstdKJtykCbwtl5VrwUJfFbo+S9pnDg==
X-Received: by 2002:aa7:8805:: with SMTP id c5mr6333201pfo.142.1582153658940; 
	Wed, 19 Feb 2020 15:07:38 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:cca7:f312:1961:a4b9?
	([2601:646:9200:4e0:cca7:f312:1961:a4b9])
	by smtp.gmail.com with ESMTPSA id q8sm749728pgt.57.2020.02.19.15.07.38
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 19 Feb 2020 15:07:38 -0800 (PST)
To: Leo Yan <leo.yan@linaro.org>, openembedded-devel@lists.openembedded.org,
	Sumit Garg <sumit.garg@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>
References: <20200218052544.9467-1-leo.yan@linaro.org>
	<20200218052544.9467-3-leo.yan@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <d57ee3d3-c9e1-f263-9a3d-3415dde3ea1c@gmail.com>
Date: Wed, 19 Feb 2020 15:07:37 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200218052544.9467-3-leo.yan@linaro.org>
Subject: Re: [meta-oe][PATCH v1 2/4] luajit: Add luajit 2.1.0-beta3 recipe
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
X-List-Received-Date: Wed, 19 Feb 2020 23:07:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 2/17/20 9:25 PM, Leo Yan wrote:
> Since luajit 2.1.0-beta3 can support architecture aarch64 and the old
> misses to support aarch64, this patch adds recipe for luajit
> 2.1.0-beta3 building.
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>   .../recipes-devtools/luajit/luajit_2.1.0.bb   | 92 +++++++++++++++++++
>   1 file changed, 92 insertions(+)
>   create mode 100644 meta-oe/recipes-devtools/luajit/luajit_2.1.0.bb
> 
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.1.0.bb b/meta-oe/recipes-devtools/luajit/luajit_2.1.0.bb
> new file mode 100644
> index 000000000..167b5d229
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/luajit/luajit_2.1.0.bb
> @@ -0,0 +1,92 @@
> +SUMMARY = "Just-In-Time Compiler for Lua"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=10a96c93403affcc34765f4c2612bc22"
> +HOMEPAGE = "http://luajit.org"
> +
> +PV .= "+git${SRCPV}"

I think its best to call it 2.0.5+${SRCPV}

> +SRCREV = "v2.1.0-beta3"

Please use corresponding SHA1 here instead of tags

> +SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig binconfig siteinfo
> +
> +BBCLASSEXTEND = "native"
> +
> +# http://luajit.org/install.html#cross
> +# Host luajit needs to be compiled with the same pointer size
> +# If you want to cross-compile to any 32 bit target on an x64 OS,
> +# you need to install the multilib development package (e.g.
> +# libc6-dev-i386 on Debian/Ubuntu) and build a 32 bit host part
> +# (HOST_CC="gcc -m32").
> +BUILD_CC_ARCH_append = " ${@['-m32',''][d.getVar('SITEINFO_BITS') != '32']}"
> +
> +# The lua makefiles expect the TARGET_SYS to be from uname -s
> +# Values: Windows, Linux, Darwin, iOS, SunOS, PS3, GNU/kFreeBSD
> +LUA_TARGET_OS = "Unknown"
> +LUA_TARGET_OS_darwin = "Darwin"
> +LUA_TARGET_OS_linux = "Linux"
> +LUA_TARGET_OS_linux-gnueabi = "Linux"
> +LUA_TARGET_OS_mingw32 = "Windows"
> +
> +# We don't want the lua buildsystem's compiler optimizations, or its
> +# stripping, and we don't want it to pick up CFLAGS or LDFLAGS, as those apply
> +# to both host and target compiles
> +EXTRA_OEMAKE = "\
> +    Q= E='@:' \
> +    \
> +    CCOPT= CCOPT_x86= CFLAGS= LDFLAGS= TARGET_STRIP='@:' \
> +    \
> +    'TARGET_SYS=${LUA_TARGET_OS}' \
> +    \
> +    'CC=${CC}' \
> +    'TARGET_AR=${AR} rcus' \
> +    'TARGET_CFLAGS=${CFLAGS}' \
> +    'TARGET_LDFLAGS=${LDFLAGS}' \
> +    'TARGET_SHLDFLAGS=${LDFLAGS}' \
> +    'HOST_CC=${BUILD_CC}' \
> +    'HOST_CFLAGS=${BUILD_CFLAGS}' \
> +    \
> +    'PREFIX=${prefix}' \
> +    'MULTILIB=${baselib}' \
> +    'LDCONFIG=:' \
> +"
> +
> +do_compile () {
> +    oe_runmake
> +}
> +
> +# There's INSTALL_LIB and INSTALL_SHARE also, but the lua binary hardcodes the
> +# '/share' and '/' + LUA_MULTILIB paths, so we don't want to break those
> +# expectations.
> +EXTRA_OEMAKEINST = "\
> +    'DESTDIR=${D}' \
> +    'INSTALL_BIN=${D}${bindir}' \
> +    'INSTALL_INC=${D}${includedir}/luajit-$(MAJVER).$(MINVER)' \
> +    'INSTALL_MAN=${D}${mandir}/man1' \
> +"
> +do_install () {
> +    oe_runmake ${EXTRA_OEMAKEINST} install
> +    rmdir ${D}${datadir}/lua/5.* \
> +          ${D}${datadir}/lua \
> +          ${D}${libdir}/lua/5.* \
> +          ${D}${libdir}/lua
> +}
> +
> +PACKAGES += 'luajit-common'
> +
> +# See the comment for EXTRA_OEMAKEINST. This is needed to ensure the hardcoded
> +# paths are packaged regardless of what the libdir and datadir paths are.
> +FILES_${PN} += "${prefix}/${baselib} ${prefix}/share"
> +FILES_${PN} += "${libdir}/libluajit-5.1.so.2 \
> +    ${libdir}/libluajit-5.1.so.${PV} \
> +"
> +FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
> +    ${libdir}/libluajit-5.1.so \
> +    ${libdir}/pkgconfig/luajit.pc \
> +"
> +FILES_luajit-common = "${datadir}/${BPN}-${PV}"
> +
> +# mips64 is not supported in this release
> +COMPATIBLE_HOST_mipsarchn32 = "null"
> +COMPATIBLE_HOST_mipsarchn64 = "null"

sync this with latest changes to 5.0.4 recipe there are more arches 
where it is not ported yet.

Also delete the old recipe in the same patch.

> 

