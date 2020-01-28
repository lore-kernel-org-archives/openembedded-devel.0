Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1027A7FE96
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 07:24:10 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id y6so13638622lji.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 23:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=6QtrNmCjO0HCcIuqcuGT13ABqfH8hfeOkqExslsBtgc=;
	b=cEEcuzD/XDMnnJ/hM7KN8Tbm61eVfHonqMKhzY85P6rEajnSNELduWYCkIfBlPNCT/
	NNencMLf/PvrN9dIy0v68NThkUMaUIRjRcwdvFMB8o2H5D4PV/9PGKMyEwWv1ZVJw418
	4h+N7A/TGDgbDhkc6kKG3v2izuCvXh7mUxdRz4+CTNERFWEgz4m8myHbxW0nsWndNJi4
	e0ZituVYEuulRMXbzd/nTI8Az81pFa0Gwj3p6YFTfr4UTl1I/+2RuWtHNdUFOsXsOJU0
	en9IbONeICTY7rym8JVVsrBszut4Rg64GSqlYAQGrKZTXW0aFIQeEm0FgEYFQEZHNmks
	Fw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6QtrNmCjO0HCcIuqcuGT13ABqfH8hfeOkqExslsBtgc=;
	b=A3vuR36HBfqQtvlbnmdbXS787yHpGi8vR2QXtett6DE70lG2UoAojaxxMpz+nCC+Dm
	Aq92pUkWmozrLpLIJpccjNGMRAmpbTT6wQ7BNQ3JhwruHZEWPX9uJlyyxc9D3HpRJx3w
	nX/RErNpn0Su/tCw7WEm2Mt5W265GFgyhdCmTHFNM3VynniEVuI6YcTPDZZ+U0YmbfwH
	LL4RvmOTdHDPXe3L0Kug+Mu7l06/iL3s54aLSRUKvTbPNzPph+5BdL+3vYEAKb1WfidJ
	t/BtRDH8VtGheiwempoM29vwbvDWA+HIER6mMvdnhBaWtjO/9i48DguDt1QgUgDGriqr
	juow==
X-Gm-Message-State: APjAAAXoWQzuK2UeDsaXh+jhS1ymwfgrfruHPXWh6wj3/c7+gBSOBTMY
	qxNfg7mUwq+fXzP0d2t6533MkLAd
X-Google-Smtp-Source: APXvYqwEzeTi+/JwHp5Wm2yvFwy08Hp2oweiCnMPr1Tf6jktrXDHwf8SJXdOxt+H3CD/9aSSjYrvNQ==
X-Received: by 2002:a2e:2201:: with SMTP id i1mr12397226lji.110.1580196251159; 
	Mon, 27 Jan 2020 23:24:11 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	u16sm11398382lfi.36.2020.01.27.23.24.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 27 Jan 2020 23:24:10 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <20200128052225.2455848-1-richard.leitner@skidata.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <e4120acd-f334-c9fb-5503-526a81786ba0@gmail.com>
Date: Tue, 28 Jan 2020 08:24:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200128052225.2455848-1-richard.leitner@skidata.com>
Subject: Re: [meta-java][PATCH v2 0/4] openjdk-8: update to jdk8u242ga
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
X-List-Received-Date: Tue, 28 Jan 2020 07:24:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Richard,

On 1/28/20 6:22 AM, Richard Leitner wrote:
> This series updates Openjdk 8 to the latest "ga" release 242.
> 
> Successful testing has been done on a fedora-31 build host for
> qemuarm64, qemux86-64, qemuarm32 and armv7a.
> 
> CHANGES v2:
>   - remove openjre debuginfo fixup completely as it targeted JDK_HOME
>     instead of JRE_HOME and jre doen't create debuginfo files.
> 
> Richard Leitner (4):
>    openjdk-8: update to latest ga version 242
>    docs: add update8checksums.sh and mention it in UPDATING.md
>    openjre-8: remove debuginfo fixup from do_install
>    openjdk-8: fix jdk linking for non aarch architectures
> 
>   docs/UPDATING.md                              |   16 +
>   docs/update8checksums.sh                      |   64 +
>   recipes-core/openjdk/openjdk-8-common.inc     |   13 +-
>   recipes-core/openjdk/openjdk-8-cross.inc      |   27 +-
>   recipes-core/openjdk/openjdk-8-native.inc     |    5 +-
>   .../openjdk/openjdk-8-native_172b11.bb        |    2 -
>   recipes-core/openjdk/openjdk-8-native_242.bb  |    2 +
>   .../openjdk-8-release-172b11-aarch32.inc      |   58 -
>   .../openjdk-8-release-172b11-aarch64.inc      |   35 -
>   .../openjdk/openjdk-8-release-172b11.inc      |   39 -
>   .../openjdk/openjdk-8-release-aarch32.inc     |   60 +
>   .../openjdk/openjdk-8-release-aarch64.inc     |   37 +
>   ...ommon.inc => openjdk-8-release-common.inc} |  102 +-
>   recipes-core/openjdk/openjdk-8-release.inc    |   39 +
>   .../{openjdk-8_172b11.bb => openjdk-8_242.bb} |    4 +-
>   .../{openjre-8_172b11.bb => openjre-8_242.bb} |    3 +-
>   ...low-using-a-system-installed-libjpeg.patch |   77 +
>   ...llow-using-a-system-installed-libpng.patch |   80 +
>   ...pilation-with-security-flags-enabled.patch |   41 -
>   ...ild-on-as-needed-toolchains-generic.patch} |   12 +-
>   ... => 0004-don-t-expect-fqpn-for-make.patch} |   21 +-
>   ...llow-using-a-system-installed-libpng.patch |  148 -
>   ...005-autoconf-filter-aclocal-copy-too.patch |   25 +
>   ...> 0006-autoconf-handle-extra-output.patch} |   19 +-
>   ...-assembler-flag-handling-in-makefile.patch |   36 +
>   ...0008-autoconf-fix-shark-build-common.patch |   37 +
>   ...-in-favour-of-openembedded-package-.patch} |   98 +-
>   ...ove-shell-variables-from-autoheader.patch} |   25 +-
>   ...conf-fix-CC-with-arguments-detection.patch |   43 +
>   ...onf-NativeCompilation-remove-sysroot.patch |   24 +
>   ...4-fix-undefined-behaviour-gcc-v8-fix.patch |   41 -
>   ...o-fix-undefined-behaviour-gcc-v8-fix.patch |   42 -
>   ...g-build-after-8062808-Turn-on-the-Wr.patch |   47 -
>   ...-HotSpot-builds-on-5.x-Linux-kernels.patch |   43 -
>   ...tspot-fix-crash-on-JNI_CreateJavaVM.patch} |   13 +-
>   ...otspot-use-correct-include-for-poll.patch} |   24 +-
>   ...tspot-don-t-rely-on-old-SysV-SIGCLD.patch} |   12 +-
>   ...patch-to-fix-misuses-of-strncpy-str.patch} |   63 +-
>   ...rn-type-issues-introduced-by-806165.patch} |   21 +-
>   ...ro-build-requires-disabled-warnings.patch} |   36 +-
>   ...eturn-statement-in-__sync_val_compa.patch} |   18 +-
>   ...ot-Turn-on-the-Wreturn-type-warning.patch} |   70 +-
>   ...otspot-handle-format-error-for-GCC-7.patch |   34 +
>   ...atch => 1010-hotspot-fix-adlc-flags.patch} |   33 +-
>   ...1011-hotspot-fix-shark-build-common.patch} |  322 +-
>   ...1012-hotspot-restrict-to-staging-dir.patch |   26 +
>   ...parison-between-pointer-and-integer.patch} |   34 +-
>   ...ow-using-a-system-installed-libjpeg.patch} |   84 +-
>   ...llow-using-a-system-installed-libpng.patch |   83 +
>   ...04-jdk-use-correct-include-for-poll.patch} |   47 +-
>   ...-jdk-use-correct-include-for-signal.patch} |   23 +-
>   ...dk-disable-backtrace-musl-build-fix.patch} |   13 +-
>   .../2007-jdk-no-genx11-in-headless.patch      |   32 +
>   ...ps.patch => 2008-jdk-no-unused-deps.patch} |   66 +-
>   ...f-ld-to-link-genSocketOptionRegistry.patch |   13 +
>   ...2-hotspot-fix-missing-return-values.patch} |    0
>   ...aarch32-hotspot-fix-shark-build-pt2.patch} |    0
>   ...arch32-hotspot-remaining-musl-fixes.patch} |    0
>   ...ix-further-functions-with-a-missing.patch} |    0
>   ...arch64-hotspot-remaining-musl-fixes.patch} |    0
>   .../filter-aclocal-copy-too.patch             |   11 -
>   .../hotspot-handle-gcc7-format-overflow.patch |   25 -
>   .../openjdk8-add-missing-linker-flags.patch   |   57 -
>   ...enjdk8-find-compiler-fix-env-respect.patch |  140 -
>   ...-assembler-flag-handling-in-makefile.patch |   20 -
>   .../openjdk8-fix-libpng-neon-build.patch      |   29 -
>   .../openjdk8-fix-shark-build-pt2.patch        |   35 +-
>   .../openjdk8-fix-shark-stdc++11.patch         | 2631 -----------------
>   .../openjdk8-no-genx11-in-headless.patch      |   17 -
>   .../openjdk8-restrict-to-staging-dir.patch    |   11 -
>   70 files changed, 1390 insertions(+), 4018 deletions(-)
>   create mode 100644 docs/UPDATING.md
>   create mode 100755 docs/update8checksums.sh
>   delete mode 100644 recipes-core/openjdk/openjdk-8-native_172b11.bb
>   create mode 100644 recipes-core/openjdk/openjdk-8-native_242.bb
>   delete mode 100644 recipes-core/openjdk/openjdk-8-release-172b11-aarch32.inc
>   delete mode 100644 recipes-core/openjdk/openjdk-8-release-172b11-aarch64.inc
>   delete mode 100644 recipes-core/openjdk/openjdk-8-release-172b11.inc
>   create mode 100644 recipes-core/openjdk/openjdk-8-release-aarch32.inc
>   create mode 100644 recipes-core/openjdk/openjdk-8-release-aarch64.inc
>   rename recipes-core/openjdk/{openjdk-8-release-172b11-common.inc => openjdk-8-release-common.inc} (57%)
>   create mode 100644 recipes-core/openjdk/openjdk-8-release.inc
>   rename recipes-core/openjdk/{openjdk-8_172b11.bb => openjdk-8_242.bb} (92%)
>   rename recipes-core/openjdk/{openjre-8_172b11.bb => openjre-8_242.bb} (90%)
>   create mode 100644 recipes-core/openjdk/patches-openjdk-8/0001-Allow-using-a-system-installed-libjpeg.patch
>   create mode 100644 recipes-core/openjdk/patches-openjdk-8/0002-Allow-using-a-system-installed-libpng.patch
>   delete mode 100644 recipes-core/openjdk/patches-openjdk-8/0002-hotspot-fix-compilation-with-security-flags-enabled.patch
>   rename recipes-core/openjdk/patches-openjdk-8/{0010-build-fix-build-on-as-needed-toolchains-generic.patch => 0003-build-fix-build-on-as-needed-toolchains-generic.patch} (94%)
>   rename recipes-core/openjdk/patches-openjdk-8/{dont-expect-fqpn-for-make.patch => 0004-don-t-expect-fqpn-for-make.patch} (54%)
>   delete mode 100644 recipes-core/openjdk/patches-openjdk-8/0004-jdk-Allow-using-a-system-installed-libpng.patch
>   create mode 100644 recipes-core/openjdk/patches-openjdk-8/0005-autoconf-filter-aclocal-copy-too.patch
>   rename recipes-core/openjdk/patches-openjdk-8/{handle_extra_output.patch => 0006-autoconf-handle-extra-output.patch} (57%)
>   create mode 100644 recipes-core/openjdk/patches-openjdk-8/0007-fix-assembler-flag-handling-in-makefile.patch
>   create mode 100644 recipes-core/openjdk/patches-openjdk-8/0008-autoconf-fix-shark-build-common.patch
>   rename recipes-core/openjdk/patches-openjdk-8/{openjdk8-prevent-debuginfo-in-favour-of-openembedded-package-split.patch => 0009-prevent-debuginfo-in-favour-of-openembedded-package-.patch} (51%)
>   rename recipes-core/openjdk/patches-openjdk-8/{remove-shell-variables-from-autoheader.patch => 0010-autoconf-remove-shell-variables-from-autoheader.patch} (69%)
>   create mode 100644 recipes-core/openjdk/patches-openjdk-8/0011-autoconf-fix-CC-with-arguments-detection.patch
>   create mode 100644 recipes-core/openjdk/patches-openjdk-8/0012-autoconf-NativeCompilation-remove-sysroot.patch
>   delete mode 100644 recipes-core/openjdk/patches-openjdk-8/0012-hotspot-aarch64-fix-undefined-behaviour-gcc-v8-fix.patch
>   delete mode 100644 recipes-core/openjdk/patches-openjdk-8/0014-hotspot-zero-fix-undefined-behaviour-gcc-v8-fix.patch
>   delete mode 100644 recipes-core/openjdk/patches-openjdk-8/0018-hotspot-Fix-debug-build-after-8062808-Turn-on-the-Wr.patch
>   delete mode 100644 recipes-core/openjdk/patches-openjdk-8/0020-Enable-HotSpot-builds-on-5.x-Linux-kernels.patch
>   rename recipes-core/openjdk/patches-openjdk-8/{0001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch => 1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch} (80%)
>   rename recipes-core/openjdk/patches-openjdk-8/{0005-hotspot-use-correct-include-for-poll.patch => 1002-hotspot-use-correct-include-for-poll.patch} (81%)
>   rename recipes-core/openjdk/patches-openjdk-8/{0006-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch => 1003-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch} (82%)
>   rename recipes-core/openjdk/patches-openjdk-8/{0011-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch => 1004-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch} (77%)
>   rename recipes-core/openjdk/patches-openjdk-8/{0015-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch => 1005-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch} (82%)
>   rename recipes-core/openjdk/patches-openjdk-8/{0016-hotspot-Zero-build-requires-disabled-warnings.patch => 1006-hotspot-Zero-build-requires-disabled-warnings.patch} (83%)
>   rename recipes-core/openjdk/patches-openjdk-8/{0017-hotspot-Missing-return-statement-in-__sync_val_compa.patch => 1007-hotspot-Missing-return-statement-in-__sync_val_compa.patch} (80%)
>   rename recipes-core/openjdk/patches-openjdk-8/{0019-hotspot-Turn-on-the-Wreturn-type-warning.patch => 1008-hotspot-Turn-on-the-Wreturn-type-warning.patch} (86%)
>   create mode 100644 recipes-core/openjdk/patches-openjdk-8/1009-hotspot-handle-format-error-for-GCC-7.patch
>   rename recipes-core/openjdk/patches-openjdk-8/{openjdk8-fix-adlc-flags.patch => 1010-hotspot-fix-adlc-flags.patch} (55%)
>   rename recipes-core/openjdk/patches-openjdk-8/{openjdk8-fix-shark-build-common.patch => 1011-hotspot-fix-shark-build-common.patch} (65%)
>   create mode 100644 recipes-core/openjdk/patches-openjdk-8/1012-hotspot-restrict-to-staging-dir.patch
>   rename recipes-core/openjdk/patches-openjdk-8/{0001-jdk-comparison-between-pointer-and-integer.patch => 2001-jdk-comparison-between-pointer-and-integer.patch} (86%)
>   rename recipes-core/openjdk/patches-openjdk-8/{0003-jdk-Allow-using-a-system-installed-libjpeg.patch => 2002-jdk-Allow-using-a-system-installed-libjpeg.patch} (77%)
>   create mode 100644 recipes-core/openjdk/patches-openjdk-8/2003-jdk-Allow-using-a-system-installed-libpng.patch
>   rename recipes-core/openjdk/patches-openjdk-8/{0007-jdk-use-correct-include-for-poll.patch => 2004-jdk-use-correct-include-for-poll.patch} (81%)
>   rename recipes-core/openjdk/patches-openjdk-8/{0008-jdk-use-correct-include-for-signal.patch => 2005-jdk-use-correct-include-for-signal.patch} (83%)
>   rename recipes-core/openjdk/patches-openjdk-8/{0009-jdk-disable-backtrace-musl-build-fix.patch => 2006-jdk-disable-backtrace-musl-build-fix.patch} (75%)
>   create mode 100644 recipes-core/openjdk/patches-openjdk-8/2007-jdk-no-genx11-in-headless.patch
>   rename recipes-core/openjdk/patches-openjdk-8/{openjdk8-no-unused-deps.patch => 2008-jdk-no-unused-deps.patch} (58%)
>   create mode 100644 recipes-core/openjdk/patches-openjdk-8/2009-jdk-use-gcc-instead-of-ld-to-link-genSocketOptionRegistry.patch
>   rename recipes-core/openjdk/patches-openjdk-8/{0001-hotspot-aarch32-fix-missing-return-values.patch => aarch32-hotspot-fix-missing-return-values.patch} (100%)
>   rename recipes-core/openjdk/patches-openjdk-8/{openjdk8-fix-shark-build-pt2-aarch32.patch => aarch32-hotspot-fix-shark-build-pt2.patch} (100%)
>   rename recipes-core/openjdk/patches-openjdk-8/{hotspot-remaining-musl-fixes-aarch32.patch => aarch32-hotspot-remaining-musl-fixes.patch} (100%)
>   rename recipes-core/openjdk/patches-openjdk-8/{0013-hotspot-aarch64-Fix-further-functions-with-a-missing.patch => aarch64-hotspot-Fix-further-functions-with-a-missing.patch} (100%)
>   rename recipes-core/openjdk/patches-openjdk-8/{hotspot-remaining-musl-fixes-aarch64.patch => aarch64-hotspot-remaining-musl-fixes.patch} (100%)
>   delete mode 100644 recipes-core/openjdk/patches-openjdk-8/filter-aclocal-copy-too.patch
>   delete mode 100644 recipes-core/openjdk/patches-openjdk-8/hotspot-handle-gcc7-format-overflow.patch
>   delete mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-add-missing-linker-flags.patch
>   delete mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-find-compiler-fix-env-respect.patch
>   delete mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-assembler-flag-handling-in-makefile.patch
>   delete mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-libpng-neon-build.patch
>   delete mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-stdc++11.patch
>   delete mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-no-genx11-in-headless.patch
>   delete mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-restrict-to-staging-dir.patch
> 


Thanks for doing this work. How about just squashing all the commits 
into a single one ? Should also make it easier to backport the update to 
zeus etc.

Thanks,
Jacob

