Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5204E6063B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:58:46 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id v201so2315649lfa.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=HV8u4lPa7k/UrrIbyMbqjTV/S6nzpOc0zYMj/dKvb1Y=;
	b=mvn+h31t+8t1iY8fifyKp4YfmzrvVTfsWwEI0BElSqYA8SzsA7dkBW+/LO2+UO7Lkn
	X8axm2smCZoP4yH3NvBslX/L4PZlfUrObBqdbbdndNQFlHoh+D+hs4RSdllZfpk5yVbA
	4RvRrNf6yMj696O+fVniuhBLw2xCCmhgR/8YqrmX+PluRA6WudROfP1HpzNFuNAazwaN
	PFcCOQoD8Lph2GetLeuG0pQSKZRkEMkoEw2eAy34xP4LblDmBqwxuZc3jker1dpTeO0c
	saneEZazWf8qL3YsV0DpQazttVvPfEJ3YACRHtr8c0bD0dlzrwKXdT7gNLCwmogk+Auh
	YQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=HV8u4lPa7k/UrrIbyMbqjTV/S6nzpOc0zYMj/dKvb1Y=;
	b=iOiNxobLy2qND5j0sgZXmT3CnJi0f8ZEcSxRQEBnl9A+OaRiNT5579b0/OAHTf+zPY
	Rt7zyABUxgTmL2VYKhwe3lpUThF0mb3ihrGyQvt6cw6EKfP/pxA2G9+OKdBXy0SpgdcE
	Duf/ouBm/HgBAr8B4o5O4cETFsWh1MVHloojfacNmzwX/rmT7f5eJlV8sJbirAF7A+fk
	LmIjmSGSezVAKjGoKwn3Q6i5MFLuI5FmZCXk0gQu7495kcuMWJgUBDd7FtGWNmc2z/Yi
	KrJ9NKz8//UxvJ953m+4I6q3KIwydnHSmU30qKPBmLQ9t5FW4rm6SS4yIEdvaJUlo/BH
	WZUA==
X-Gm-Message-State: APjAAAVocLP9JW2/dpmVP30RcENXgUZ/mrlKmbddmAb3yYTPXLVV2KvJ
	AfWwjdCY3V/b46/9vCwUhdBXjVP+
X-Google-Smtp-Source: APXvYqy4YI+LiLcxwX/4cQaKnvg7xCQq9S3UlMh833LFjRKwM6mTA+Y4ayO5ctp/C//Vf39T78X7yA==
X-Received: by 2002:a19:228c:: with SMTP id i134mr671306lfi.2.1580332672479;
	Wed, 29 Jan 2020 13:17:52 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	z205sm1590421lfa.52.2020.01.29.13.17.50
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 29 Jan 2020 13:17:50 -0800 (PST)
To: openembedded-devel@lists.openembedded.org,
	Richard Leitner <richard.leitner@skidata.com>
References: <20200128052225.2455848-1-richard.leitner@skidata.com>
	<20200128052225.2455848-2-richard.leitner@skidata.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <530aea13-2ab8-054d-795e-64c0121c7fe4@gmail.com>
Date: Wed, 29 Jan 2020 22:17:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200128052225.2455848-2-richard.leitner@skidata.com>
Subject: Re: [meta-java][PATCH v2 1/4] openjdk-8: update to latest ga version 242
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 1/28/20 6:22 AM, Richard Leitner wrote:
> As OpenJDK-8 is now tagging "ga" versions in addition to the "build"
> version the recipes are adapted to use those "ga" versions.
> 
> All existing patches got re-applied and renamed. For better handling Hotspot
> patches now start at patch number 1001 and jdk patches at 2001.
> 
> Furthermore architecture dependent patches are prefixed with the
> architecture they apply on.
> 
> Following patches/hunks were completely dropped:
> - 0002-hotspot-fix-compilation-with-security-flags-enabled.patch
>      got backported to hotspot jdk8u
>      https://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/c40a28e54185
> - 0011-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch
>      ostream.cpp:112 got fixed in hotspot jdk8u
>      https://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/f3108e56b502
> - 0014-hotspot-zero-fix-undefined-behaviour-gcc-v8-fix.patch
>      got backported to hotspot jdk8u
>      https://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/ca4663e58916
> - 0018-hotspot-Fix-debug-build-after-8062808-Turn-on-the-Wr.patch
>      fixed in hotspot jdk8u
>      https://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/32bc598624bd
> - 0020-Enable-HotSpot-builds-on-5.x-Linux-kernels.patch
>      fixed in hotspot jdk8u
>      https://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/5af8ec63c21c
> - openjdk8-add-missing-linker-flags.patch
>      fixed in hotspot jdk8u
>      https://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/f175513c2c3a
> - openjdk8-fix-shark-stdc++11.patch
>      fixed in hotspot jdk8u
> - openjdk8-fix-libpng-neon-build.patch
>      fixed in jdk
>      https://hg.openjdk.java.net/jdk8u/jdk8u/jdk/rev/5d57817931e1
> - aarch64-hotspot-fix-undefined-behaviour-gcc-v8-fix.patch
>      got backported to hotspot jdk8u
> 
> Following patches were newly added:
> - 0011-autoconf-fix-CC-with-arguments-detection.patch
>      needed because of jdk8u commit "8038340: Cleanup and fix sysroot and devkit handling on Linux and Solaris"
> - 0012-autoconf-NativeCompilation-remove-sysroot.patch
>      needed because of jdk8u commit "8038340: Cleanup and fix sysroot and devkit handling on Linux and Solaris"
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>   docs/UPDATING.md                              |   18 +
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
>   ...ommon.inc => openjdk-8-release-common.inc} |   96 +-
>   recipes-core/openjdk/openjdk-8-release.inc    |   39 +
>   .../{openjdk-8_172b11.bb => openjdk-8_242.bb} |    4 +-
>   .../{openjre-8_172b11.bb => openjre-8_242.bb} |    4 +-
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
>   68 files changed, 1310 insertions(+), 4018 deletions(-)
>   create mode 100644 docs/UPDATING.md
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
> diff --git a/docs/UPDATING.md b/docs/UPDATING.md
> new file mode 100644
> index 0000000..a08cf02
> --- /dev/null
> +++ b/docs/UPDATING.md
> @@ -0,0 +1,18 @@
> +# HowTo Update OpenJDK 8 #
> +
> +1. Determine latest ga version:
> +     curl -s "https://hg.openjdk.java.net/jdk8u/jdk8u/tags" | grep -m 1 "jdk8u.*ga" | sed 's/-ga$//g'
> +2. Rename OpenJDK/OpenJRE bb files to the matching release version
> +3. Adapt the CHANGESET_ID for aarch32 based on:
> +     curl -s https://hg.openjdk.java.net/aarch32-port/jdk8u/tags | grep "jdk8u.*ga-aarch32-"
> +4. Adapt the CHANGESET_ID for aarch64 based on:
> +     curl -s https://hg.openjdk.java.net/aarch64-port/jdk8u-shenandoah/tags | grep "aarch64-shenandoah-jdk8u.*-"
> +5. Adapt checksums in
> +   * openjdk-8-release.inc
> +   * openjdk-8-release-aarch32.inc
> +   * openjdk-8-release-aarch64.inc
> +6. Check if any patch got upstreamed (and remove if so)
> +7. Re-apply all other patches and format them again
> +    for git: git format-patch --src-prefix=a/y/ --dst-prefix=b/y/ -n --start-number=x jdk8uXXX-ga
> +8. Test for x86_64, aarch32 & aarch64 (at least using testimage in qemu)
> +9. Send a patch ;-)
> diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
> index 1fbe7fe..0ef4750 100644
> --- a/recipes-core/openjdk/openjdk-8-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-common.inc
> @@ -8,13 +8,13 @@ require openjdk-common.inc
>   
>   AUTOTOOLS_SCRIPT_PATH = "${S}/common/autoconf/"
>   export AUTOCONF_DIR="${AUTOTOOLS_SCRIPT_PATH}"
> -
>   FILESPATH =. "${FILE_DIRNAME}/patches-openjdk-8:"
>   
>   # for weird openjdk-common.inc
>   S = "${WORKDIR}/${OPENJDK_HG_U}-${OPENJDK_CHANGESET}"
> +export TOPDIR="${S}"

This "export TOPDIR" breaks creating the sstate cache.

>   
> -SRC_URI = " \
> +SRC_URI = "\
>       ${OPENJDK_URI} \
>       ${HOTSPOT_URI} \
>       ${CORBA_URI} \
> @@ -155,16 +155,12 @@ def jdk_configure_options(d):
>   do_unpack[postfuncs] += "do_unpack_extract_submodules"
>   do_unpack[postfuncs] += "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'do_unpack_delete_X11_wrappers', d)}"
>   
> -do_configure_prepend() {
> -        export ${@jdk_environment_options(d)}
> -}
> -
>   export DEBUG_BINARIES = "true"
>   
>   ALTERNATIVE_PRIORITY = "50"
>   
> -OPENJDK_UPDATE_VERSION = "${@d.getVar('PV').split('b')[0]}"
> -OPENJDK_BUILD_NUMBER = "b${@d.getVar('PV').split('b')[1]}"
> +OPENJDK_UPDATE_VERSION = "${PV}"
> +OPENJDK_BUILD_NUMBER = "ga"
>   EXTRA_OECONF_append = "\
>           --with-build-number=${OPENJDK_BUILD_NUMBER} \
>           --with-update-version=${OPENJDK_UPDATE_VERSION} \
> @@ -176,6 +172,7 @@ EXTRA_OECONF_append = "\
>   FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
>   FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
>   FLAGS_GCC8 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
> +FLAGS_GCC9 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
>   
>   # flags for -native, and for bits that need a host-tool during -cross
>   BUILD_CFLAGS_append = " ${@openjdk_build_helper_get_build_cflags(d)}"
> diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
> index 18b99fd..6c0f949 100644
> --- a/recipes-core/openjdk/openjdk-8-cross.inc
> +++ b/recipes-core/openjdk/openjdk-8-cross.inc
> @@ -13,6 +13,7 @@ PRIVATE_LIBS = "\
>       libjdwp.so libjli.so libjpeg.so libjsdt.so libjsig.so libjvm.so liblcms.so \
>       libmanagement.so libmlib_image.so libnet.so libnio.so libnpt.so libsaproc.so \
>       libsctp.so libsplashscreen.so libsunec.so libunpack.so libverify.so libzip.so \
> +    libfreetype.so.6 \
>   "
>   
>   PACKAGECONFIG ??= " \
> @@ -42,23 +43,22 @@ PACKAGECONFIG[repack] = ",,,"
>   
>   PACKAGECONFIG[kerberos] = ",,krb5"
>   
> -CACHED_CONFIGUREVARS = " \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'ac_x_includes=${STAGING_INCDIR}', '', d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'ac_x_libraries=${STAGING_LIBDIR}', '', d)} \
> -"
> -
>   require openjdk-8-common.inc
>   
>   JAVA_HOME[unexport] = "1"
>   
>   SRC_URI_append = "\
>       file://jvm.cfg \
> +    file://0011-autoconf-fix-CC-with-arguments-detection.patch \
> +    file://0012-autoconf-NativeCompilation-remove-sysroot.patch \
>   "
>   
> +BUILD_CFLAGS_append = " -Wno-stringop-overflow -Wno-error"
> +TARGET_CFLAGS_append = " -Wno-stringop-overflow -Wno-error"
> +
>   EXTRA_OECONF_append = "\
>       --with-jobs=${@openjdk_build_helper_get_parallel_make(d)} \
>       \
> -    --with-sys-root=${STAGING_DIR_HOST} \
>       --with-tools-dir=${STAGING_DIR_NATIVE} \
>       --with-boot-jdk=${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native \
>       --with-cacerts-file=${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native/jre/lib/security/cacerts \
> @@ -66,13 +66,21 @@ EXTRA_OECONF_append = "\
>       --disable-precompiled-headers \
>       --disable-zip-debug-info \
>       \
> +    --with-sys-root=${STAGING_DIR_HOST} \
>       --with-extra-cflags='${CFLAGS}' \
>       --with-extra-cxxflags='${CXXFLAGS}' \
>       --with-extra-ldflags='${LDFLAGS}' \
> +    --with-freetype-include=${STAGING_INCDIR}/freetype2 \
> +    --with-freetype-lib=${STAGING_LIBDIR} \
>       \
>       ${@jdk_configure_options(d)} \
>   "
>   
> +do_configure_prepend() {
> +    export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS}"
> +    export ${@jdk_environment_options(d)}
> +}
> +
>   do_configure_append() {
>       sed -i -e 's,POST_STRIP_CMD:=.*,POST_STRIP_CMD:=,g' ${B}/spec.gmk
>   }
> @@ -97,8 +105,6 @@ do_install_append() {
>   export MAKE_VERBOSE = "y"
>   export MFLAGS="${@jdk_make_options(d)} MAKE_VERBOSE=y QUIETLY= VERBOSE=-s LOG_LEVEL=trace STRIP_POLICY=no_strip"
>   
> -BUILD_LD="${BUILD_CCLD}"
> -
>   EXTRA_OEMAKE_append = '\
>       ${@jdk_make_options(d)} \
>       ALT_SDT_H="${STAGING_INCDIR}" \
> @@ -125,5 +131,6 @@ python remove_debuglink() {
>   
>   PACKAGE_PREPROCESS_FUNCS += "remove_debuglink"
>   
> -# There is a symlink to a .so but this one is valid.
> -INSANE_SKIP_${PN} = "dev-so"
> +# FIXME libjsig.so is a symlink to a .so but this one is valid
> +# FIXME libfreetype.so.6 is copied from STAGING_LIBDIR which is already stripped
> +INSANE_SKIP_${PN} = "dev-so already-stripped"
> diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/openjdk/openjdk-8-native.inc
> index bae5d09..321a43d 100644
> --- a/recipes-core/openjdk/openjdk-8-native.inc
> +++ b/recipes-core/openjdk/openjdk-8-native.inc
> @@ -20,12 +20,13 @@ PACKAGECONFIG[zlib] = "--with-zlib=system,--with-zlib=bundled,zlib-native"
>   EXTRA_OECONF_append = "\
>       --with-jobs=${@openjdk_build_helper_get_parallel_make(d)} \
>       \
> -    --with-sys-root=${STAGING_DIR_NATIVE} \
>       --with-tools-dir=${STAGING_DIR_NATIVE} \
>       --with-boot-jdk=${STAGING_LIBDIR_NATIVE}/jvm/icedtea7-native \
>       --with-extra-cflags='${CFLAGS}' \
>       --with-extra-cxxflags='${CXXFLAGS}' \
>       --with-extra-ldflags='${LDFLAGS}' \
> +    --with-freetype-include=${STAGING_INCDIR_NATIVE}/freetype2 \
> +    --with-freetype-lib=${STAGING_LIBDIR_NATIVE} \
>       --with-stdc++lib=dynamic \
>       ${@jdk_configure_options(d)} \
>   "
> @@ -51,6 +52,8 @@ EXTRA_OEMAKE_append = ' \
>   
>   do_configure_prepend() {
>       export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS}"
> +    export ${@jdk_environment_options(d)}
> +    unset CC CXX
>   }
>   
>   do_compile_prepend() {
> diff --git a/recipes-core/openjdk/openjdk-8-native_172b11.bb b/recipes-core/openjdk/openjdk-8-native_172b11.bb
> deleted file mode 100644
> index e7eb21c..0000000
> --- a/recipes-core/openjdk/openjdk-8-native_172b11.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require openjdk-8-release-${PV}.inc
> -require openjdk-8-native.inc
> diff --git a/recipes-core/openjdk/openjdk-8-native_242.bb b/recipes-core/openjdk/openjdk-8-native_242.bb
> new file mode 100644
> index 0000000..39321f2
> --- /dev/null
> +++ b/recipes-core/openjdk/openjdk-8-native_242.bb
> @@ -0,0 +1,2 @@
> +require openjdk-8-release.inc
> +require openjdk-8-native.inc
> diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-aarch32.inc b/recipes-core/openjdk/openjdk-8-release-172b11-aarch32.inc
> deleted file mode 100644
> index 9cc2083..0000000
> --- a/recipes-core/openjdk/openjdk-8-release-172b11-aarch32.inc
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -require openjdk-8-release-172b11-common.inc
> -
> -COMPATIBLE_HOST = "^$"
> -COMPATIBLE_HOST_armv7a = "arm"
> -COMPATIBLE_HOST_armv7ve = "arm"
> -
> -CORBA_CHANGESET_arm = "jdk8u172-b11-aarch32-180511"
> -SRC_URI[corba.md5sum] = "557b94847d8fade14c048cb0a96ed035"
> -SRC_URI[corba.sha256sum] = "366fa9aaf11d75f74e8c6bdf9cab9214cf66b0eac1ca40f2789b3ba442929708"
> -
> -HOTSPOT_CHANGESET_arm = "jdk8u172-b11-aarch32-180511"
> -SRC_URI[hotspot.md5sum] = "37d796794234f38fa71339ba78368b80"
> -SRC_URI[hotspot.sha256sum] = "5f89f8ba9a099a2d84b4ca6bd49553ce4efe1b29d55de9134809b7b59b6c9ce3"
> -
> -JAXP_CHANGESET_arm = "jdk8u172-b11-aarch32-180511"
> -SRC_URI[jaxp.md5sum] = "2dc311a7c0d6483226cdc5e501b1f8d0"
> -SRC_URI[jaxp.sha256sum] = "f62db09a41213b5b5d1886c1aeabe43def09235de1d60af518213b9acea4fdca"
> -
> -JAXWS_CHANGESET_arm = "jdk8u172-b11-aarch32-180511"
> -SRC_URI[jaxws.md5sum] = "fbd81e288d1ee5df631f213c130f21bb"
> -SRC_URI[jaxws.sha256sum] = "bac66e848ee48c6fef6130db4bb6879dbd64c550c1f42e4676ab6a2c3ee4fab8"
> -
> -JDK_CHANGESET_arm = "jdk8u172-b11-aarch32-180511"
> -SRC_URI[jdk.md5sum] = "b8003e6f1714617461f3eb7ee8b1efee"
> -SRC_URI[jdk.sha256sum] = "0a7eef6fef2b457bef3bd1d24031234bbb9d74a5fca2f65e1603278cd9d393a0"
> -
> -LANGTOOLS_CHANGESET_arm = "jdk8u172-b11-aarch32-180511"
> -SRC_URI[langtools.md5sum] = "e38f50b0113b3a956ac4917720655e93"
> -SRC_URI[langtools.sha256sum] = "9ca88fcfe5a07861de693ff3b38d03f063a7937576cd93116ea6b4a4bd7894d5"
> -
> -NASHORN_CHANGESET_arm = "jdk8u172-b11-aarch32-180511"
> -SRC_URI[nashorn.md5sum] = "c191cc92996fcb271254fc0a4f3eb7c9"
> -SRC_URI[nashorn.sha256sum] = "853bb3162fefa989fa0c31848cb990d8e5698ccd8a2a336dbf98bde35eb5241d"
> -
> -OPENJDK_CHANGESET_arm = "jdk8u172-b11-aarch32-180511"
> -SRC_URI[openjdk.md5sum] = "25398ccf25633a878dca54a8d606e48e"
> -SRC_URI[openjdk.sha256sum] = "8c8e515ebcceded4b90187b4bdaf129b63ae6e64ddfe4f05a60df0694235b9e7"
> -
> -PACKAGECONFIG_append_armv7a = " client"
> -PACKAGECONFIG_append_armv7ve = " client"
> -
> -do_install_append() {
> -    if [ -d ${D}${JDK_HOME} ] ; then
> -        sed -e 's,^\(-server ERROR$\),# \1,' \
> -            -e 's,^-client IGNORE,-client ERROR,' \
> -            -e 's,ALIASED_TO -server,ALIASED_TO -client,' \
> -            -i ${D}${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
> -    fi
> -    if [ -d ${D}${JRE_HOME} ] ; then
> -        sed -e 's,^\(-server ERROR$\),# \1,' \
> -            -e 's,^-client IGNORE,-client ERROR,' \
> -            -e 's,ALIASED_TO -server,ALIASED_TO -client,' \
> -            -i ${D}${JRE_HOME}/lib/${JDK_ARCH}/jvm.cfg
> -    fi
> -}
> -
> -JDK_ARCH_armv7a = "aarch32"
> -JDK_ARCH_armv7ve = "aarch32"
> diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-aarch64.inc b/recipes-core/openjdk/openjdk-8-release-172b11-aarch64.inc
> deleted file mode 100644
> index f0f4655..0000000
> --- a/recipes-core/openjdk/openjdk-8-release-172b11-aarch64.inc
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -require openjdk-8-release-172b11-common.inc
> -
> -COMPATIBLE_HOST = "aarch64"
> -
> -CORBA_CHANGESET_aarch64 = "3a04a7c080af"
> -SRC_URI[corba.md5sum] = "758b29d6cf714fd894df8674afd78e17"
> -SRC_URI[corba.sha256sum] = "564113dbeadc57ac5831ccc056e0b920adbd3b74558cf750aa899f5de25ceb5e"
> -
> -HOTSPOT_CHANGESET_aarch64 = "1ced2ae00e35"
> -SRC_URI[hotspot.md5sum] = "1db8a0e5e63352f1743e9d41ab6ed5cf"
> -SRC_URI[hotspot.sha256sum] = "6993c3138035a7c0d2782b1ca7aabdb43452b1abbcc60448042f5c9207b03ab5"
> -
> -JAXP_CHANGESET_aarch64 = "ab8087f496fe"
> -SRC_URI[jaxp.md5sum] = "0e7d8755af72aaf9ec7521514d8bb541"
> -SRC_URI[jaxp.sha256sum] = "6e70c1535d738dc2c4e3a2fb9e6e11c660172b6d2ce905ec33e8924f8c208978"
> -
> -JAXWS_CHANGESET_aarch64 = "1e71aeefeecf"
> -SRC_URI[jaxws.md5sum] = "16ff9ba1007aee21ad3df472b1f5c55e"
> -SRC_URI[jaxws.sha256sum] = "b6ccb2855c2e9cd5778b193b5ad47f2e13496cbbbad74497c70216cd04b4c7dc"
> -
> -JDK_CHANGESET_aarch64 = "e8e6553e7ca9"
> -SRC_URI[jdk.md5sum] = "52b35732c17e9048e506b7b46c1282f8"
> -SRC_URI[jdk.sha256sum] = "ffaa79dad3b126af77ac9c230c54805b224c5d6517830a37c7272678407c99da"
> -
> -LANGTOOLS_CHANGESET_aarch64 = "14d381cbe563"
> -SRC_URI[langtools.md5sum] = "d14425cc0334ed46ce695c9930bff6d5"
> -SRC_URI[langtools.sha256sum] = "a4334c8859fe48bf2eae3b076785ff2e36a5ae80cf5840aef32731c3099a2274"
> -
> -NASHORN_CHANGESET_aarch64 = "c667b467b394"
> -SRC_URI[nashorn.md5sum] = "0389c953bdd14c804d873d95ff4b3033"
> -SRC_URI[nashorn.sha256sum] = "7cd87e641f0781481635593c144c8030f20d97cfc048ca57bd56381bab8e7d92"
> -
> -OPENJDK_CHANGESET_aarch64 = "74564d40b0d6"
> -SRC_URI[openjdk.md5sum] = "13f7f15386f7aa0cc3383e9d1e98d2f1"
> -SRC_URI[openjdk.sha256sum] = "a6425e11700edcdc0761df9da75b28b48adc664f3d8259c49ced1c85af3dc502"
> diff --git a/recipes-core/openjdk/openjdk-8-release-172b11.inc b/recipes-core/openjdk/openjdk-8-release-172b11.inc
> deleted file mode 100644
> index b308e50..0000000
> --- a/recipes-core/openjdk/openjdk-8-release-172b11.inc
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -require openjdk-8-release-172b11-common.inc
> -
> -# We do not yet work for aarch64, and we make sure
> -# to use the aarch32 port for ARMv7.
> -COMPATIBLE_HOST = "^(?!(aarch64)).*$"
> -COMPATIBLE_HOST_armv7a = "^$"
> -COMPATIBLE_HOST_armv7ve = "^$"
> -
> -CORBA_CHANGESET = "875a75c440cd"
> -SRC_URI[corba.md5sum] = "66242dd6e749f39a5ef6add34f5ecb2f"
> -SRC_URI[corba.sha256sum] = "f1618be7ad88619c7d7c1eed9800c528d0646e1c9f039e20a57b3e72ae3d3512"
> -
> -HOTSPOT_CHANGESET = "32ba4d2121c1"
> -SRC_URI[hotspot.md5sum] = "a3e1d2f91ba8873f71e9a72043e2644a"
> -SRC_URI[hotspot.sha256sum] = "680b1f5100786910bfceeef90ce28d74fcf6eacfdd3b92dfc76dcf3216060e99"
> -
> -JAXP_CHANGESET = "30586bb50743"
> -SRC_URI[jaxp.md5sum] = "b413b1cb709d74e513f13c586215366d"
> -SRC_URI[jaxp.sha256sum] = "ba36dd8ad72ff3d8bda38b7d6773037e18c3c68ebadd61f1e1f7fc167a506baa"
> -
> -JAXWS_CHANGESET = "452a6a5a878e"
> -SRC_URI[jaxws.md5sum] = "5c3c4d1fec19398128cf818aef5486a9"
> -SRC_URI[jaxws.sha256sum] = "89aa34e6bc3410a85ea697aa4ae70c21f7099efdacef78a6e5a46747421e86f9"
> -
> -JDK_CHANGESET = "5ccc572f4ffe"
> -SRC_URI[jdk.md5sum] = "29dd4772e3862193e56007a0bb0d6886"
> -SRC_URI[jdk.sha256sum] = "4d1758ceec155fcd2cd786f11071ed614947a9720373d704221d78ed98beadec"
> -
> -LANGTOOLS_CHANGESET = "34ee52bc68a4"
> -SRC_URI[langtools.md5sum] = "b195802f2aaa5c95c06cc50021bb42a6"
> -SRC_URI[langtools.sha256sum] = "0403bd2c9a45e4c0dc2148907028e0cdfd087be512e6d6b3763a01411936663a"
> -
> -NASHORN_CHANGESET = "7efd6152328e"
> -SRC_URI[nashorn.md5sum] = "3aa4b31fdbf330baf28194e21697b8d6"
> -SRC_URI[nashorn.sha256sum] = "8b5cbd29e9dbace477a57d7c07a127312dd3cf6b8e648b0b64026616d12c6862"
> -
> -OPENJDK_CHANGESET = "33d274a7dda0"
> -SRC_URI[openjdk.md5sum] = "105f62e8f22a68b8c4151c68a447f76e"
> -SRC_URI[openjdk.sha256sum] = "bf49215fe1e43e6f110470c911fce32722c843e03efb68e40cc7a832eb80faea"
> diff --git a/recipes-core/openjdk/openjdk-8-release-aarch32.inc b/recipes-core/openjdk/openjdk-8-release-aarch32.inc
> new file mode 100644
> index 0000000..686b562
> --- /dev/null
> +++ b/recipes-core/openjdk/openjdk-8-release-aarch32.inc
> @@ -0,0 +1,60 @@
> +require openjdk-8-release-common.inc
> +
> +COMPATIBLE_HOST = "^$"
> +COMPATIBLE_HOST_armv7a = "arm"
> +COMPATIBLE_HOST_armv7ve = "arm"
> +
> +CHANGESET_ID="200120"
> +
> +CORBA_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
> +SRC_URI[corba.md5sum]    = "2abf6d5394d9c5310af1e4ca6cec4355"
> +SRC_URI[corba.sha256sum] = "52e83dfa2fa4fcc8c71f3b2959cca2136099b9c575d3726148c02b9cf7d06324"
> +
> +HOTSPOT_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
> +SRC_URI[hotspot.md5sum]    = "e252af6c20d6190e0613f39c6066e3cc"
> +SRC_URI[hotspot.sha256sum] = "bfff2ef23ee80acd73a0774e7011028c3598e75d2ee8b3271524ec8ea54801ae"
> +
> +JAXP_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
> +SRC_URI[jaxp.md5sum]    = "56dc7a99589582b18bbbb5c4464022c8"
> +SRC_URI[jaxp.sha256sum] = "430e49ba485737c02312557f4deb8562853e58be19ed175ea63b396307f140ce"
> +
> +JAXWS_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
> +SRC_URI[jaxws.md5sum]    = "2bbcba759f24f5dcec0c33cd62382e4f"
> +SRC_URI[jaxws.sha256sum] = "c350716ff8782cc311ca17450e2d198d707d3fb71de9dc3394df39766979559f"
> +
> +JDK_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
> +SRC_URI[jdk.md5sum]    = "e17f3f4ea8a409e4a1b09a12b3b5309d"
> +SRC_URI[jdk.sha256sum] = "dfa4a7e7f8ab8daf34343b1c33544b6209e422c74d5be1dbbd8ef80e2365c8aa"
> +
> +LANGTOOLS_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
> +SRC_URI[langtools.md5sum]    = "06ca78c1d4e058f277876f4e6177d9b0"
> +SRC_URI[langtools.sha256sum] = "59ccafa433f5510c91835efcafbe9ff9c707034ec3305dc3a4c1a85fac65ab0c"
> +
> +NASHORN_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
> +SRC_URI[nashorn.md5sum]    = "1958e204f3984abeb2cf9e7c57aa7839"
> +SRC_URI[nashorn.sha256sum] = "e964721e539807a38bdcbce7259d235f873974a686badbc274b7368a288f0021"
> +
> +OPENJDK_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
> +SRC_URI[openjdk.md5sum]    = "9aceb3b4cd710cdda55be4fe6a5303c9"
> +SRC_URI[openjdk.sha256sum] = "9691291b26a650d854ce0feacf32dfb3b956165c5d2db6e1ff46dd44f4c517cf"
> +
> +PACKAGECONFIG_append_armv7a = " client"
> +PACKAGECONFIG_append_armv7ve = " client"
> +
> +do_install_append() {
> +    if [ -d ${D}${JDK_HOME} ] ; then
> +        sed -e 's,^\(-server ERROR$\),# \1,' \
> +            -e 's,^-client IGNORE,-client ERROR,' \
> +            -e 's,ALIASED_TO -server,ALIASED_TO -client,' \
> +            -i ${D}${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
> +    fi
> +    if [ -d ${D}${JRE_HOME} ] ; then
> +        sed -e 's,^\(-server ERROR$\),# \1,' \
> +            -e 's,^-client IGNORE,-client ERROR,' \
> +            -e 's,ALIASED_TO -server,ALIASED_TO -client,' \
> +            -i ${D}${JRE_HOME}/lib/${JDK_ARCH}/jvm.cfg
> +    fi
> +}
> +
> +JDK_ARCH_armv7a = "aarch32"
> +JDK_ARCH_armv7ve = "aarch32"
> diff --git a/recipes-core/openjdk/openjdk-8-release-aarch64.inc b/recipes-core/openjdk/openjdk-8-release-aarch64.inc
> new file mode 100644
> index 0000000..d08892d
> --- /dev/null
> +++ b/recipes-core/openjdk/openjdk-8-release-aarch64.inc
> @@ -0,0 +1,37 @@
> +require openjdk-8-release-common.inc
> +
> +COMPATIBLE_HOST = "aarch64"
> +
> +CHANGESET_ID="b07"
> +
> +CORBA_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
> +SRC_URI[corba.md5sum]    = "d6dfd6f0c3bf4c6dc1f867dc7bcf8730"
> +SRC_URI[corba.sha256sum] = "e80dae94f21ca9de2269bc9de72f1098d417e9f7d6ff69d047e26669e31b1bc4"
> +
> +HOTSPOT_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
> +SRC_URI[hotspot.md5sum]    = "44731f82f6e2a0697f414ae62f9eff54"
> +SRC_URI[hotspot.sha256sum] = "3acb0bfa3eda0137e3c70ab10b59f139e0720116ed6ecf3f9c8633ebc36947b1"
> +
> +JAXP_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
> +SRC_URI[jaxp.md5sum]    = "7fb4207ba9277e109439101961223fc7"
> +SRC_URI[jaxp.sha256sum] = "22616e56825c611c70968c34a229661d4cb910fdb0c3936ae3c75de2330abfb5"
> +
> +JAXWS_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
> +SRC_URI[jaxws.md5sum]    = "a27379cbd6253408eee4aa0b8a551042"
> +SRC_URI[jaxws.sha256sum] = "b6eb69d867694002284712a28058770170d885e6de6872cba260061d001b77ae"
> +
> +JDK_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
> +SRC_URI[jdk.md5sum]    = "2e64397ef1f35309aa7de00d46c2c751"
> +SRC_URI[jdk.sha256sum] = "d470d24eddc314e5c30035881f3af6f0c48a3360accc0644ec26d9d32d9ea0e6"
> +
> +LANGTOOLS_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
> +SRC_URI[langtools.md5sum]    = "71c2ce819538b0acc443c0519dfa43c1"
> +SRC_URI[langtools.sha256sum] = "219919b7980d863cc26abd87341012f4802dd12a11a45f6627309ec365a9e838"
> +
> +NASHORN_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
> +SRC_URI[nashorn.md5sum]    = "6ee9418598ca411fe0b2339fa1a3a272"
> +SRC_URI[nashorn.sha256sum] = "6d86c23301d2cbc1ea72474730336e089eb4c3d3014bdf0f3a9d3b5976a75f58"
> +
> +OPENJDK_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
> +SRC_URI[openjdk.md5sum]    = "188b5d7ef0976cfc1a4258d1dc8ccce0"
> +SRC_URI[openjdk.sha256sum] = "7c32399a85f56bda2c740fc6834b8b5d648e75271a5376c2fa968bd713e3fec8"
> diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc b/recipes-core/openjdk/openjdk-8-release-common.inc
> similarity index 57%
> rename from recipes-core/openjdk/openjdk-8-release-172b11-common.inc
> rename to recipes-core/openjdk/openjdk-8-release-common.inc
> index f50b494..a8a653b 100644
> --- a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-release-common.inc
> @@ -1,61 +1,52 @@
>   PATCHES_URI = "\
> -    file://remove-shell-variables-from-autoheader.patch;striplevel=0 \
> -    file://filter-aclocal-copy-too.patch;striplevel=0 \
> -    file://dont-expect-fqpn-for-make.patch;striplevel=0 \
> -    file://openjdk8-no-genx11-in-headless.patch;striplevel=0 \
> -    file://openjdk8-no-unused-deps.patch;striplevel=0 \
> -    file://openjdk8-find-compiler-fix-env-respect.patch;striplevel=0 \
> -    file://openjdk8-prevent-debuginfo-in-favour-of-openembedded-package-split.patch;striplevel=0 \
> -    file://0001-jdk-comparison-between-pointer-and-integer.patch \
> -    file://0002-hotspot-fix-compilation-with-security-flags-enabled.patch \
> -    file://0003-jdk-Allow-using-a-system-installed-libjpeg.patch \
> -    file://0004-jdk-Allow-using-a-system-installed-libpng.patch \
> -    file://0005-hotspot-use-correct-include-for-poll.patch \
> -    file://0006-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch \
> -    file://0007-jdk-use-correct-include-for-poll.patch \
> -    file://0008-jdk-use-correct-include-for-signal.patch \
> -    file://0009-jdk-disable-backtrace-musl-build-fix.patch \
> -    file://0010-build-fix-build-on-as-needed-toolchains-generic.patch \
> -    file://0011-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch \
> +    file://0001-Allow-using-a-system-installed-libjpeg.patch \
> +    file://0002-Allow-using-a-system-installed-libpng.patch \
> +    file://0003-build-fix-build-on-as-needed-toolchains-generic.patch \
> +    file://0004-don-t-expect-fqpn-for-make.patch \
> +    file://0005-autoconf-filter-aclocal-copy-too.patch \
> +    file://0006-autoconf-handle-extra-output.patch \
> +    file://0007-fix-assembler-flag-handling-in-makefile.patch \
> +    file://0008-autoconf-fix-shark-build-common.patch \
> +    file://0009-prevent-debuginfo-in-favour-of-openembedded-package-.patch \
> +    file://0010-autoconf-remove-shell-variables-from-autoheader.patch \
>       ${HOTSPOT_UB_PATCH} \
> -    ${LIBPNG_NEON_PATCH} \
> -    file://handle_extra_output.patch \
> -    file://hotspot-handle-gcc7-format-overflow.patch \
> -    file://0001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch \
> +    file://2001-jdk-comparison-between-pointer-and-integer.patch \
> +    file://2002-jdk-Allow-using-a-system-installed-libjpeg.patch \
> +    file://2003-jdk-Allow-using-a-system-installed-libpng.patch \
> +    file://2004-jdk-use-correct-include-for-poll.patch \
> +    file://2005-jdk-use-correct-include-for-signal.patch \
> +    file://2006-jdk-disable-backtrace-musl-build-fix.patch \
> +    file://2007-jdk-no-genx11-in-headless.patch \
> +    file://2008-jdk-no-unused-deps.patch \
>   "
>   HOTSPOT_UB_PATCH = "\
> -    file://0014-hotspot-zero-fix-undefined-behaviour-gcc-v8-fix.patch \
> -    file://0015-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch \
> -    file://0016-hotspot-Zero-build-requires-disabled-warnings.patch \
> -    file://0017-hotspot-Missing-return-statement-in-__sync_val_compa.patch \
> -    file://0018-hotspot-Fix-debug-build-after-8062808-Turn-on-the-Wr.patch \
> -    file://0019-hotspot-Turn-on-the-Wreturn-type-warning.patch \
> -    file://0020-Enable-HotSpot-builds-on-5.x-Linux-kernels.patch \
> +    file://1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch \
> +    file://1002-hotspot-use-correct-include-for-poll.patch \
> +    file://1003-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch \
> +    file://1004-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch \
> +    file://1005-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch \
> +    file://1006-hotspot-Zero-build-requires-disabled-warnings.patch \
> +    file://1007-hotspot-Missing-return-statement-in-__sync_val_compa.patch \
> +    file://1008-hotspot-Turn-on-the-Wreturn-type-warning.patch \
> +    file://1009-hotspot-handle-format-error-for-GCC-7.patch \
> +"
> +HOTSPOT_UB_PATCH_append_class-target = "\
> +    file://1010-hotspot-fix-adlc-flags.patch \
> +    file://1011-hotspot-fix-shark-build-common.patch \
> +    file://1012-hotspot-restrict-to-staging-dir.patch \
>   "
>   HOTSPOT_UB_PATCH_prepend_aarch64 = "\
> -    file://0012-hotspot-aarch64-fix-undefined-behaviour-gcc-v8-fix.patch \
> -    file://0013-hotspot-aarch64-Fix-further-functions-with-a-missing.patch \
> +    file://aarch64-hotspot-Fix-further-functions-with-a-missing.patch \
>   "
> -HOTSPOT_UB_PATCH_append_armv7a = " file://0001-hotspot-aarch32-fix-missing-return-values.patch"
> -HOTSPOT_UB_PATCH_append_armv7ve = " file://0001-hotspot-aarch32-fix-missing-return-values.patch"
> -# some patches extracted from http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.patch
> -# reported via http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
> -# by Roman Kennke (rkennke at redhat.com)
> -LIBPNG_NEON_PATCH = "file://openjdk8-fix-libpng-neon-build.patch;striplevel=0"
> -LIBPNG_NEON_PATCH_aarch64 = ""
> +HOTSPOT_UB_PATCH_append_armv7a = " file://aarch32-hotspot-fix-missing-return-values.patch"
> +HOTSPOT_UB_PATCH_append_armv7ve = " file://aarch32-hotspot-fix-missing-return-values.patch"
>   
>   PATCHES_URI_append_class-target = "\
> -    file://openjdk8-restrict-to-staging-dir.patch;striplevel=0 \
> -    file://openjdk8-fix-shark-build-common.patch;striplevel=0 \
>       ${FIX_SHARK_BUILD_PT2_PATCH} \
> -    file://openjdk8-fix-shark-stdc++11.patch;striplevel=0 \
> -    file://openjdk8-fix-assembler-flag-handling-in-makefile.patch;striplevel=0 \
> -    file://openjdk8-fix-adlc-flags.patch;striplevel=0 \
> -    file://openjdk8-add-missing-linker-flags.patch;striplevel=0 \
>   "
>   FIX_SHARK_BUILD_PT2_PATCH = "file://openjdk8-fix-shark-build-pt2.patch;striplevel=0"
> -FIX_SHARK_BUILD_PT2_PATCH_armv7a = "file://openjdk8-fix-shark-build-pt2-aarch32.patch;striplevel=0"
> -FIX_SHARK_BUILD_PT2_PATCH_armv7ve = "file://openjdk8-fix-shark-build-pt2-aarch32.patch;striplevel=0"
> +FIX_SHARK_BUILD_PT2_PATCH_armv7a = "file://aarch32-hotspot-fix-shark-build-pt2.patch;striplevel=0"
> +FIX_SHARK_BUILD_PT2_PATCH_armv7ve = "file://aarch32-hotspot-fix-shark-build-pt2.patch;striplevel=0"
>   
>   PATCHES_URI_append_libc-musl = "\
>       ${OBSOLETE_ISNANF_PATCH} \
> @@ -80,9 +71,9 @@ REMOVE_GLIBC_DEPENDENCIES_PT2 = "file://musl-0006-hotspot-os_linux-remove-glibc-
>   REMOVE_GLIBC_DEPENDENCIES_PT2_armv7a = "file://musl-0006-hotspot-os_linux-remove-glibc-dependencies-pt2-aarch.patch"
>   REMOVE_GLIBC_DEPENDENCIES_PT2_armv7ve = "file://musl-0006-hotspot-os_linux-remove-glibc-dependencies-pt2-aarch.patch"
>   
> -PATCHES_URI_append_libc-musl_armv7a = " file://hotspot-remaining-musl-fixes-aarch32.patch"
> -PATCHES_URI_append_libc-musl_armv7ve = " file://hotspot-remaining-musl-fixes-aarch32.patch"
> -PATCHES_URI_append_libc-musl_aarch64 = " file://hotspot-remaining-musl-fixes-aarch64.patch"
> +PATCHES_URI_append_libc-musl_armv7a = " file://aarch32-hotspot-remaining-musl-fixes.patch"
> +PATCHES_URI_append_libc-musl_armv7ve = " file://aarch32-hotspot-remaining-musl-fixes.patch"
> +PATCHES_URI_append_libc-musl_aarch64 = " file://aarch64-hotspot-remaining-musl-fixes.patch"
>   
>   # Name of the directory containing the compiled output
>   BUILD_DIR = "openjdk.build"
> @@ -111,7 +102,12 @@ OPENJDK_ARCH_PORT_aarch64 = "aarch64-port"
>   OPENJDK_ARCH_PORT_armv7a = "aarch32-port"
>   OPENJDK_ARCH_PORT_armv7ve = "aarch32-port"
>   OPENJDK_HG_U = "jdk8u"
> -OPENJDK_HG_URL = "http://hg.openjdk.java.net/${OPENJDK_ARCH_PORT}/${OPENJDK_HG_U}"
> +
> +# the aarch64 port moved, for more information see:
> +# https://mail.openjdk.java.net/pipermail/aarch64-port-dev/2018-August/006265.html
> +OPENJDK_HG_U_aarch64 = "jdk8u-shenandoah"
> +
> +OPENJDK_HG_URL = "https://hg.openjdk.java.net/${OPENJDK_ARCH_PORT}/${OPENJDK_HG_U}"
>   
>   OPENJDK_FILE = "${OPENJDK_CHANGESET}.tar.bz2"
>   OPENJDK_FILE_LOCAL = "openjdk8-${PV}-jdk8u-${OPENJDK_FILE}"
> diff --git a/recipes-core/openjdk/openjdk-8-release.inc b/recipes-core/openjdk/openjdk-8-release.inc
> new file mode 100644
> index 0000000..170338f
> --- /dev/null
> +++ b/recipes-core/openjdk/openjdk-8-release.inc
> @@ -0,0 +1,39 @@
> +require openjdk-8-release-common.inc
> +
> +# We do not yet work for aarch64, and we make sure
> +# to use the aarch32 port for ARMv7.
> +COMPATIBLE_HOST = "^(?!(aarch64)).*$"
> +COMPATIBLE_HOST_armv7a = "^$"
> +COMPATIBLE_HOST_armv7ve = "^$"
> +
> +CORBA_CHANGESET = "jdk8u${PV}-ga"
> +SRC_URI[corba.md5sum]    = "e269b1b01c00bec6c9f2684d7e3e6540"
> +SRC_URI[corba.sha256sum] = "45433c179dd5ee117b8097c75f475feb5a2d2fae052be3e582c59511696a5d0e"
> +
> +HOTSPOT_CHANGESET = "jdk8u${PV}-ga"
> +SRC_URI[hotspot.md5sum]    = "105c2a6bdfecc2f1fe09aac65748bf47"
> +SRC_URI[hotspot.sha256sum] = "08729033233b3a42bf1fa3d2a2c0cdf1c950c682cc27bd486f7c19ae28d34ef7"
> +
> +JAXP_CHANGESET = "jdk8u${PV}-ga"
> +SRC_URI[jaxp.md5sum]    = "a9fb321b6c466e83b9ad23da0d9674c5"
> +SRC_URI[jaxp.sha256sum] = "8e52661976169fca3fe567b269be5852dff378cb2e66e9f8a4e9f40aaa8d89e4"
> +
> +JAXWS_CHANGESET = "jdk8u${PV}-ga"
> +SRC_URI[jaxws.md5sum]    = "6ee14ea4974b93bff075499cd820413b"
> +SRC_URI[jaxws.sha256sum] = "95a14275db59e0c1a8fa4ca4861b8761b1598f0ed7f3ef2f2cef7c619df1eb83"
> +
> +JDK_CHANGESET = "jdk8u${PV}-ga"
> +SRC_URI[jdk.md5sum]    = "57d2bc331d9506fa652fac686c6b64c1"
> +SRC_URI[jdk.sha256sum] = "3ecb62288df04d05f541a26da32464c04558a951b2962290f08b149d614ae020"
> +
> +LANGTOOLS_CHANGESET = "jdk8u${PV}-ga"
> +SRC_URI[langtools.md5sum]    = "5456b86c13a21c8e73a088af5723ba06"
> +SRC_URI[langtools.sha256sum] = "ffaf18753935cd03b2d581f17789172f4cfdc093d62ca764bf14068d7e30599c"
> +
> +NASHORN_CHANGESET = "jdk8u${PV}-ga"
> +SRC_URI[nashorn.md5sum]    = "0716fb438451ac45285a0cd8c17cc27b"
> +SRC_URI[nashorn.sha256sum] = "3a572a5d5c2e8b590c9ac2c65905069a991f7e168f5bbe15e7dbb924b10ab96d"
> +
> +OPENJDK_CHANGESET = "jdk8u${PV}-ga"
> +SRC_URI[openjdk.md5sum]    = "5f5cf2638bba1b4f9b4915be9973077e"
> +SRC_URI[openjdk.sha256sum] = "633f1d20d4d8d36fea1680140b5514ab153096a19c306b812fbbd19314c8dece"
> diff --git a/recipes-core/openjdk/openjdk-8_172b11.bb b/recipes-core/openjdk/openjdk-8_242.bb
> similarity index 92%
> rename from recipes-core/openjdk/openjdk-8_172b11.bb
> rename to recipes-core/openjdk/openjdk-8_242.bb
> index 72f208e..bc6ce51 100644
> --- a/recipes-core/openjdk/openjdk-8_172b11.bb
> +++ b/recipes-core/openjdk/openjdk-8_242.bb
> @@ -2,7 +2,7 @@ INC_FILE_SUFFIX = ""
>   INC_FILE_SUFFIX_aarch64 = "-aarch64"
>   INC_FILE_SUFFIX_armv7a = "-aarch32"
>   INC_FILE_SUFFIX_armv7ve = "-aarch32"
> -require openjdk-8-release-${PV}${INC_FILE_SUFFIX}.inc
> +require openjdk-8-release${INC_FILE_SUFFIX}.inc
>   require openjdk-8-cross.inc
>   
>   do_install() {
> @@ -11,7 +11,7 @@ do_install() {
>       cp -rp ${B}/images/j2sdk-image/* ${D}${JDK_HOME}
>       chown -R root:root ${D}${JDK_HOME}
>       install -m644 ${WORKDIR}/jvm.cfg  ${D}${JDK_HOME}/jre/lib/${JDK_ARCH}/
> -    find ${D}${JDK_HOME} -name "*.debuginfo" -print0 | xargs -0 rm
> +    find ${D}${JDK_HOME} -name "*.debuginfo" -exec rm {} \;
>   }
>   
>   PACKAGES_append = " \
> diff --git a/recipes-core/openjdk/openjre-8_172b11.bb b/recipes-core/openjdk/openjre-8_242.bb
> similarity index 90%
> rename from recipes-core/openjdk/openjre-8_172b11.bb
> rename to recipes-core/openjdk/openjre-8_242.bb
> index e9b930b..4ed2e6b 100644
> --- a/recipes-core/openjdk/openjre-8_172b11.bb
> +++ b/recipes-core/openjdk/openjre-8_242.bb
> @@ -2,7 +2,7 @@ INC_FILE_SUFFIX = ""
>   INC_FILE_SUFFIX_aarch64 = "-aarch64"
>   INC_FILE_SUFFIX_armv7a = "-aarch32"
>   INC_FILE_SUFFIX_armv7ve = "-aarch32"
> -require openjdk-8-release-${PV}${INC_FILE_SUFFIX}.inc
> +require openjdk-8-release${INC_FILE_SUFFIX}.inc
>   require openjdk-8-cross.inc
>   
>   do_install() {
> @@ -11,7 +11,7 @@ do_install() {
>       cp -rp ${B}/images/j2re-image/* ${D}${JRE_HOME}
>       chown -R root:root ${D}${JRE_HOME}
>       install -m644 ${WORKDIR}/jvm.cfg  ${D}${JRE_HOME}/lib/${JDK_ARCH}/
> -    find ${D}${JRE_HOME} -name "*.debuginfo" -print0 | xargs -0 rm
> +    find ${D}${JDK_HOME} -name "*.debuginfo" -exec rm {} \;
>   }
>   
>   FILES_${PN}_append = "\
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0001-Allow-using-a-system-installed-libjpeg.patch b/recipes-core/openjdk/patches-openjdk-8/0001-Allow-using-a-system-installed-libjpeg.patch
> new file mode 100644
> index 0000000..e9662eb
> --- /dev/null
> +++ b/recipes-core/openjdk/patches-openjdk-8/0001-Allow-using-a-system-installed-libjpeg.patch
> @@ -0,0 +1,77 @@
> +From 836aad60652299a26341b46a4a9a2e6c418b6947 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
> +Date: Tue, 27 Feb 2018 13:36:53 +0000
> +Subject: [PATCH 01/10] Allow using a system-installed libjpeg
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Patch stolen (and some typos corrected) from debian patch,
> +which itself was a backport from:
> +  http://hg.openjdk.java.net/jdk9/client/rev/bfd9a3e1aeb5
> +  http://hg.openjdk.java.net/jdk9/client/jdk/rev/320743f0b4fc
> +
> +Issues fixed on top of debian patch:
> +  * imageIOJPEG.c -> imageioJPEG.c
> +  * $(LIBJPEG_LIBS) must be added to LDFLAGS_SUFFIX, not
> +    LDFLAGS as it otherwise doesn't make it into the linker
> +    command line and then fails when using -Wl,-z,now in
> +    LDFLAGS (as done when 'security' is enabled)
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: André Draszik <andre.draszik@jci.com>
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> +---
> + common/autoconf/libraries.m4 | 35 ++++++++++++++++++++++++++++++-----
> + 1 file changed, 30 insertions(+), 5 deletions(-)
> +
> +diff --git a/common/autoconf/libraries.m4 b/common/autoconf/libraries.m4
> +index 6d803f9..d2732eb 100644
> +--- a/common/autoconf/libraries.m4
> ++++ b/common/autoconf/libraries.m4
> +@@ -774,11 +774,36 @@ AC_DEFUN_ONCE([LIB_SETUP_MISC_LIBS],
> +   # Check for the jpeg library
> +   #
> +
> +-  USE_EXTERNAL_LIBJPEG=true
> +-  AC_CHECK_LIB(jpeg, main, [],
> +-      [ USE_EXTERNAL_LIBJPEG=false
> +-      AC_MSG_NOTICE([Will use jpeg decoder bundled with the OpenJDK source])
> +-  ])
> ++  AC_ARG_WITH(libjpeg, [AS_HELP_STRING([--with-libjpeg],
> ++      [use libjpeg from build system or OpenJDK source (system, bundled) @<:@bundled@:>@])])
> ++
> ++  AC_MSG_CHECKING([for which libjpeg to use])
> ++
> ++  # default is bundled
> ++  DEFAULT_LIBJPEG=bundled
> ++
> ++  #
> ++  # if user didn't specify, use DEFAULT_LIBJPEG
> ++  #
> ++  if test "x${with_libjpeg}" = "x"; then
> ++    with_libjpeg=${DEFAULT_LIBJPEG}
> ++  fi
> ++
> ++  AC_MSG_RESULT(${with_libjpeg})
> ++
> ++  if test "x${with_libjpeg}" = "xbundled"; then
> ++    USE_EXTERNAL_LIBJPEG=false
> ++  elif test "x${with_libjpeg}" = "xsystem"; then
> ++    AC_CHECK_HEADER(jpeglib.h, [],
> ++        [ AC_MSG_ERROR([--with-libjpeg=system specified, but jpeglib.h not found!])])
> ++    AC_CHECK_LIB(jpeg, jpeg_CreateDecompress, [],
> ++        [ AC_MSG_ERROR([--with-libjpeg=system specified, but no libjpeg found])])
> ++
> ++    USE_EXTERNAL_LIBJPEG=true
> ++  else
> ++    AC_MSG_ERROR([Invalid use of --with-libjpeg: ${with_libjpeg}, use 'system' or 'bundled'])
> ++  fi
> ++
> +   AC_SUBST(USE_EXTERNAL_LIBJPEG)
> +
> +   ###############################################################################
> +--
> +2.24.1
> +
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0002-Allow-using-a-system-installed-libpng.patch b/recipes-core/openjdk/patches-openjdk-8/0002-Allow-using-a-system-installed-libpng.patch
> new file mode 100644
> index 0000000..ed8ecfa
> --- /dev/null
> +++ b/recipes-core/openjdk/patches-openjdk-8/0002-Allow-using-a-system-installed-libpng.patch
> @@ -0,0 +1,80 @@
> +From ed79dc49323cc08e81b3699817825f66b1af0ce2 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
> +Date: Thu, 2 Jan 2020 13:40:50 +0100
> +Subject: [PATCH 02/10] Allow using a system-installed libpng
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Patch stolen (and some typos corrected) from debian patch,
> +which itself was a backport from:
> +  http://hg.openjdk.java.net/jdk9/jdk9/rev/bfc1c131e540
> +  http://hg.openjdk.java.net/jdk9/jdk9/jdk/rev/5e503831b142
> +
> +Issues fixed on top of debian patch:
> +  * the default when --with-libpng= is not given works
> +  * using the bundled libpng works
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: André Draszik <andre.draszik@jci.com>
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> +---
> + common/autoconf/libraries.m4 | 41 ++++++++++++++++++++++++++++++++++++
> + 1 file changed, 41 insertions(+)
> +
> +diff --git a/common/autoconf/libraries.m4 b/common/autoconf/libraries.m4
> +index d2732eb..727f018 100644
> +--- a/common/autoconf/libraries.m4
> ++++ b/common/autoconf/libraries.m4
> +@@ -843,6 +843,47 @@ AC_DEFUN_ONCE([LIB_SETUP_MISC_LIBS],
> +   fi
> +   AC_SUBST(USE_EXTERNAL_LIBGIF)
> +
> ++  ###############################################################################
> ++  #
> ++  # Check for the png library
> ++  #
> ++
> ++  AC_ARG_WITH(libpng, [AS_HELP_STRING([--with-libpng],
> ++     [use libpng from build system or OpenJDK source (system, bundled) @<:@bundled@:>@])])
> ++
> ++  AC_CHECK_LIB(png, png_sig_cmp,
> ++               [ LIBPNG_FOUND=yes ],
> ++               [ LIBPNG_FOUND=no ])
> ++
> ++  AC_MSG_CHECKING([for which libpng to use])
> ++
> ++  # default is bundled
> ++  DEFAULT_LIBPNG=bundled
> ++
> ++  #
> ++  # if user didn't specify, use DEFAULT_LIBPNG
> ++  #
> ++  if test "x${with_libpng}" = "x"; then
> ++      with_libpng=${DEFAULT_LIBPNG}
> ++  fi
> ++
> ++
> ++  if test "x${with_libpng}" = "xbundled"; then
> ++      USE_EXTERNAL_LIBPNG=false
> ++      AC_MSG_RESULT([bundled])
> ++  elif test "x${with_libpng}" = "xsystem"; then
> ++      if test "x${LIBPNG_FOUND}" = "xyes"; then
> ++          USE_EXTERNAL_LIBPNG=true
> ++          AC_MSG_RESULT([system])
> ++      else
> ++          AC_MSG_RESULT([system not found])
> ++          AC_MSG_ERROR([--with-libpng=system specified, but no libpng found!])
> ++      fi
> ++  else
> ++      AC_MSG_ERROR([Invalid value of --with-libpng: ${with_libpng}, use 'system' or 'bundled'])
> ++  fi
> ++  AC_SUBST(USE_EXTERNAL_LIBPNG)
> ++
> +   ###############################################################################
> +   #
> +   # Check for the zlib library
> +--
> +2.24.1
> +
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0002-hotspot-fix-compilation-with-security-flags-enabled.patch b/recipes-core/openjdk/patches-openjdk-8/0002-hotspot-fix-compilation-with-security-flags-enabled.patch
> deleted file mode 100644
> index a94e90f..0000000
> --- a/recipes-core/openjdk/patches-openjdk-8/0002-hotspot-fix-compilation-with-security-flags-enabled.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From bdea8cf299313388ec41ea20281deca6dc4f764d Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
> -Date: Tue, 27 Feb 2018 14:41:06 +0000
> -Subject: [PATCH 2/9] hotspot: fix compilation with security flags enabled
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -| hotspot/src/share/vm/code/dependencies.cpp: In function 'static void Dependencies::write_dependency_to(xmlStream*, Dependencies::DepType, GrowableArray<Dependencies::DepArgument>*, Klass*)':
> -| hotspot/src/share/vm/code/dependencies.cpp:498:6: error: '%d' directive writing between 1 and 10 bytes into a region of size 9 [-Werror=format-overflow=]
> -|  void Dependencies::write_dependency_to(xmlStream* xtty,
> -|       ^~~~~~~~~~~~
> -| hotspot/src/share/vm/code/dependencies.cpp:498:6: note: directive argument in the range [0, 2147483647]
> -| hotspot/src/share/vm/code/dependencies.cpp:528:27: note: 'sprintf' output between 3 and 12 bytes into a destination of size 10
> -|        char xn[10]; sprintf(xn, "x%d", j);
> -|                     ~~~~~~~^~~~~~~~~~~~~~
> -
> -Backport a patch to fix this.
> -
> -Upstream-Status: Backport [http://hg.openjdk.java.net/jdk10/jdk10/hotspot/rev/eb11b3f0ae65]
> -Signed-off-by: André Draszik <andre.draszik@jci.com>
> ----
> - hotspot/src/share/vm/code/dependencies.cpp | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/hotspot/src/share/vm/code/dependencies.cpp b/hotspot/src/share/vm/code/dependencies.cpp
> -index 7317036d..c71d921d 100644
> ---- a/hotspot/src/share/vm/code/dependencies.cpp
> -+++ b/hotspot/src/share/vm/code/dependencies.cpp
> -@@ -525,7 +525,7 @@ void Dependencies::write_dependency_to(xmlStream* xtty,
> -         xtty->object("x", arg.metadata_value());
> -       }
> -     } else {
> --      char xn[10]; sprintf(xn, "x%d", j);
> -+      char xn[12]; sprintf(xn, "x%d", j);
> -       if (arg.is_oop()) {
> -         xtty->object(xn, arg.oop_value());
> -       } else {
> ---
> -2.16.2
> -
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0010-build-fix-build-on-as-needed-toolchains-generic.patch b/recipes-core/openjdk/patches-openjdk-8/0003-build-fix-build-on-as-needed-toolchains-generic.patch
> similarity index 94%
> rename from recipes-core/openjdk/patches-openjdk-8/0010-build-fix-build-on-as-needed-toolchains-generic.patch
> rename to recipes-core/openjdk/patches-openjdk-8/0003-build-fix-build-on-as-needed-toolchains-generic.patch
> index 2d02b7c..0e3359c 100644
> --- a/recipes-core/openjdk/patches-openjdk-8/0010-build-fix-build-on-as-needed-toolchains-generic.patch
> +++ b/recipes-core/openjdk/patches-openjdk-8/0003-build-fix-build-on-as-needed-toolchains-generic.patch
> @@ -1,7 +1,7 @@
> -From 84bcdb9cdab0e0be9cdfededfb518d3cea9009e3 Mon Sep 17 00:00:00 2001
> +From 4cde9ea2adf8c57168a299f11625083d1822b0de Mon Sep 17 00:00:00 2001
>   From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
>   Date: Mon, 12 Mar 2018 15:40:58 +0000
> -Subject: [PATCH] build: fix build on --as-needed toolchains (generic)
> +Subject: [PATCH 03/10] build: fix build on --as-needed toolchains (generic)
>   MIME-Version: 1.0
>   Content-Type: text/plain; charset=UTF-8
>   Content-Transfer-Encoding: 8bit
> @@ -65,16 +65,16 @@ any additional libraries, so as to fix this once and for
>   all.
>   
>   Signed-off-by: André Draszik <andre.draszik@jci.com>
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>   ---
> -Upstream-Status: Pending
>    make/common/NativeCompilation.gmk | 5 ++---
>    1 file changed, 2 insertions(+), 3 deletions(-)
>   
>   diff --git a/make/common/NativeCompilation.gmk b/make/common/NativeCompilation.gmk
> -index e7ea22ce..79f081fd 100644
> +index d961cf3..92f8033 100644
>   --- a/make/common/NativeCompilation.gmk
>   +++ b/make/common/NativeCompilation.gmk
> -@@ -477,9 +477,8 @@ define SetupNativeCompilation
> +@@ -618,9 +618,8 @@ endif # no MacOS X support yet
>    
>        $$($1_TARGET) : $$($1_EXPECTED_OBJS) $$($1_RES) $$($1_GEN_MANIFEST)
>    	$$(call LINKING_EXE_MSG,$$($1_BASENAME))
> @@ -87,5 +87,5 @@ index e7ea22ce..79f081fd 100644
>    	  $(MT) -nologo -manifest $$($1_GEN_MANIFEST) -outputresource:$$@;#1
>            endif
>   --
> -2.16.2
> +2.24.1
>   
> diff --git a/recipes-core/openjdk/patches-openjdk-8/dont-expect-fqpn-for-make.patch b/recipes-core/openjdk/patches-openjdk-8/0004-don-t-expect-fqpn-for-make.patch
> similarity index 54%
> rename from recipes-core/openjdk/patches-openjdk-8/dont-expect-fqpn-for-make.patch
> rename to recipes-core/openjdk/patches-openjdk-8/0004-don-t-expect-fqpn-for-make.patch
> index 5192d1a..db00b24 100644
> --- a/recipes-core/openjdk/patches-openjdk-8/dont-expect-fqpn-for-make.patch
> +++ b/recipes-core/openjdk/patches-openjdk-8/0004-don-t-expect-fqpn-for-make.patch
> @@ -1,6 +1,18 @@
> ---- common/autoconf/basics.m4.orig
> -+++ common/autoconf/basics.m4
> -@@ -555,10 +555,12 @@ AC_DEFUN([BASIC_CHECK_GNU_MAKE],
> +From f4c93547119c7550626e1b2ae2b750ea4f83b3fe Mon Sep 17 00:00:00 2001
> +From: Jens Rehsack <rehsack@gmail.com>
> +Date: Thu, 2 Jan 2020 13:42:43 +0100
> +Subject: [PATCH 04/10] don't expect fqpn for make
> +
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> +---
> + common/autoconf/basics.m4 | 8 +++++---
> + 1 file changed, 5 insertions(+), 3 deletions(-)
> +
> +diff --git a/common/autoconf/basics.m4 b/common/autoconf/basics.m4
> +index 4ee9cdd..c20ea76 100644
> +--- a/common/autoconf/basics.m4
> ++++ b/common/autoconf/basics.m4
> +@@ -740,10 +740,12 @@ AC_DEFUN([BASIC_CHECK_GNU_MAKE],
>      # We need to find a recent version of GNU make. Especially on Solaris, this can be tricky.
>      if test "x$MAKE" != x; then
>        # User has supplied a make, test it.
> @@ -16,3 +28,6 @@
>        if test "x$FOUND_MAKE" = x; then
>          AC_MSG_ERROR([The specified make (by MAKE=$MAKE) is not GNU make 3.81 or newer.])
>        fi
> +--
> +2.24.1
> +
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0004-jdk-Allow-using-a-system-installed-libpng.patch b/recipes-core/openjdk/patches-openjdk-8/0004-jdk-Allow-using-a-system-installed-libpng.patch
> deleted file mode 100644
> index 658ba32..0000000
> --- a/recipes-core/openjdk/patches-openjdk-8/0004-jdk-Allow-using-a-system-installed-libpng.patch
> +++ /dev/null
> @@ -1,148 +0,0 @@
> -From 549100e3e687d2c844eeebe22a7dcbf7ed50406e Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
> -Date: Tue, 27 Feb 2018 13:43:04 +0000
> -Subject: [PATCH 4/9] jdk: Allow using a system-installed libpng
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Patch stolen (and some typos corrected) from debian patch,
> -which itself was a backport from:
> -  http://hg.openjdk.java.net/jdk9/jdk9/rev/bfc1c131e540
> -  http://hg.openjdk.java.net/jdk9/jdk9/jdk/rev/5e503831b142
> -
> -Issues fixed on top of debian patch:
> -  * the default when --with-libpng= is not given works
> -  * using the bundled libpng works
> -
> -Upstream-Status: Backport
> -Signed-off-by: André Draszik <andre.draszik@jci.com>
> ----
> - common/autoconf/libraries.m4                       | 41 ++++++++++++++++++++++
> - common/autoconf/spec.gmk.in                        |  1 +
> - jdk/make/lib/Awt2dLibraries.gmk                    | 12 +++++--
> - .../native/sun/awt/splashscreen/splashscreen_png.c |  3 +-
> - 4 files changed, 52 insertions(+), 5 deletions(-)
> -
> -diff --git a/common/autoconf/libraries.m4 b/common/autoconf/libraries.m4
> -index 3f5f69b1..e419a050 100644
> ---- a/common/autoconf/libraries.m4
> -+++ b/common/autoconf/libraries.m4
> -@@ -664,6 +664,47 @@ AC_DEFUN_ONCE([LIB_SETUP_MISC_LIBS],
> -   fi
> -   AC_SUBST(USE_EXTERNAL_LIBGIF)
> -
> -+  ###############################################################################
> -+  #
> -+  # Check for the png library
> -+  #
> -+
> -+  AC_ARG_WITH(libpng, [AS_HELP_STRING([--with-libpng],
> -+     [use libpng from build system or OpenJDK source (system, bundled) @<:@bundled@:>@])])
> -+
> -+  AC_CHECK_LIB(png, png_sig_cmp,
> -+               [ LIBPNG_FOUND=yes ],
> -+               [ LIBPNG_FOUND=no ])
> -+
> -+  AC_MSG_CHECKING([for which libpng to use])
> -+
> -+  # default is bundled
> -+  DEFAULT_LIBPNG=bundled
> -+
> -+  #
> -+  # if user didn't specify, use DEFAULT_LIBPNG
> -+  #
> -+  if test "x${with_libpng}" = "x"; then
> -+      with_libpng=${DEFAULT_LIBPNG}
> -+  fi
> -+
> -+
> -+  if test "x${with_libpng}" = "xbundled"; then
> -+      USE_EXTERNAL_LIBPNG=false
> -+      AC_MSG_RESULT([bundled])
> -+  elif test "x${with_libpng}" = "xsystem"; then
> -+      if test "x${LIBPNG_FOUND}" = "xyes"; then
> -+          USE_EXTERNAL_LIBPNG=true
> -+          AC_MSG_RESULT([system])
> -+      else
> -+          AC_MSG_RESULT([system not found])
> -+          AC_MSG_ERROR([--with-libpng=system specified, but no libpng found!])
> -+      fi
> -+  else
> -+      AC_MSG_ERROR([Invalid value of --with-libpng: ${with_libpng}, use 'system' or 'bundled'])
> -+  fi
> -+  AC_SUBST(USE_EXTERNAL_LIBPNG)
> -+
> -   ###############################################################################
> -   #
> -   # Check for the zlib library
> -diff --git a/common/autoconf/spec.gmk.in b/common/autoconf/spec.gmk.in
> -index 1c418f29..2c802c0a 100644
> ---- a/common/autoconf/spec.gmk.in
> -+++ b/common/autoconf/spec.gmk.in
> -@@ -567,6 +567,7 @@ endif
> - ENABLE_JFR=@ENABLE_JFR@
> - ENABLE_INTREE_EC=@ENABLE_INTREE_EC@
> - USE_EXTERNAL_LIBJPEG:=@USE_EXTERNAL_LIBJPEG@
> -+USE_EXTERNAL_LIBPNG:=@USE_EXTERNAL_LIBPNG@
> - USE_EXTERNAL_LIBGIF:=@USE_EXTERNAL_LIBGIF@
> - USE_EXTERNAL_LIBZ:=@USE_EXTERNAL_LIBZ@
> - LIBZIP_CAN_USE_MMAP:=@LIBZIP_CAN_USE_MMAP@
> -diff --git a/jdk/make/lib/Awt2dLibraries.gmk b/jdk/make/lib/Awt2dLibraries.gmk
> -index 8872a8e8..c577951a 100644
> ---- a/jdk/make/lib/Awt2dLibraries.gmk
> -+++ b/jdk/make/lib/Awt2dLibraries.gmk
> -@@ -1219,7 +1219,6 @@ endif
> - ifndef BUILD_HEADLESS_ONLY
> -   LIBSPLASHSCREEN_DIRS := \
> -     $(JDK_TOPDIR)/src/share/native/sun/awt/image/jpeg \
> --    $(JDK_TOPDIR)/src/share/native/sun/awt/libpng \
> -     $(JDK_TOPDIR)/src/share/native/sun/awt/splashscreen
> -
> -   ifeq ($(USE_EXTERNAL_LIBGIF), true)
> -@@ -1236,6 +1235,13 @@ ifndef BUILD_HEADLESS_ONLY
> -     LIBJPEG_CFLAGS := -I$(JDK_TOPDIR)/src/share/native/sun/awt/image/jpeg
> -   endif
> -
> -+  ifeq ($(USE_EXTERNAL_LIBPNG), true)
> -+    LIBPNG_LDFLAGS := -lpng
> -+  else
> -+    LIBSPLASHSCREEN_DIRS += $(JDK_TOPDIR)/src/share/native/sun/awt/libpng
> -+    LIBPNG_CFLAGS := -I$(JDK_TOPDIR)/src/share/native/sun/awt/libpng
> -+  endif
> -+
> -   ifneq ($(OPENJDK_TARGET_OS), macosx)
> -     LIBSPLASHSCREEN_DIRS += $(JDK_TOPDIR)/src/$(OPENJDK_TARGET_OS_API_DIR)/native/sun/awt/splashscreen
> -   else
> -@@ -1297,12 +1303,12 @@ ifndef BUILD_HEADLESS_ONLY
> -       LANG := C, \
> -       OPTIMIZATION := LOW, \
> -       CFLAGS := $(LIBSPLASHSCREEN_CFLAGS) $(CFLAGS_JDKLIB) \
> --                $(GIFLIB_CFLAGS) $(LIBJPEG_CFLAGS), \
> -+                $(GIFLIB_CFLAGS) $(LIBJPEG_CFLAGS) $(LIBPNG_CFLAGS), \
> -       MAPFILE := $(JDK_TOPDIR)/make/mapfiles/libsplashscreen/mapfile-vers, \
> -       LDFLAGS := $(LDFLAGS_JDKLIB) \
> -           $(call SET_SHARED_LIBRARY_ORIGIN), \
> -       LDFLAGS_SUFFIX := $(LIBSPLASHSCREEN_LDFLAGS_SUFFIX) $(LIBZ) \
> --                        $(GIFLIB_LDFLAGS) $(LIBJPEG_LDFLAGS), \
> -+                        $(GIFLIB_LDFLAGS) $(LIBJPEG_LDFLAGS) $(LIBPNG_LDFLAGS), \
> -       LDFLAGS_SUFFIX_solaris := -lc, \
> -       VERSIONINFO_RESOURCE := $(JDK_TOPDIR)/src/windows/resource/version.rc, \
> -       RC_FLAGS := $(RC_FLAGS) \
> -diff --git a/jdk/src/share/native/sun/awt/splashscreen/splashscreen_png.c b/jdk/src/share/native/sun/awt/splashscreen/splashscreen_png.c
> -index 3599433e..5bf002ea 100644
> ---- a/jdk/src/share/native/sun/awt/splashscreen/splashscreen_png.c
> -+++ b/jdk/src/share/native/sun/awt/splashscreen/splashscreen_png.c
> -@@ -25,8 +25,7 @@
> -
> - #include "splashscreen_impl.h"
> -
> --#include "../libpng/png.h"
> --
> -+#include <png.h>
> - #include <setjmp.h>
> -
> - #define SIG_BYTES 8
> ---
> -2.16.2
> -
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0005-autoconf-filter-aclocal-copy-too.patch b/recipes-core/openjdk/patches-openjdk-8/0005-autoconf-filter-aclocal-copy-too.patch
> new file mode 100644
> index 0000000..262f0b7
> --- /dev/null
> +++ b/recipes-core/openjdk/patches-openjdk-8/0005-autoconf-filter-aclocal-copy-too.patch
> @@ -0,0 +1,25 @@
> +From b8bab47b58be4a0102011825c2ee3dd2c6427d08 Mon Sep 17 00:00:00 2001
> +From: Jens Rehsack <rehsack@gmail.com>
> +Date: Thu, 2 Jan 2020 13:44:25 +0100
> +Subject: [PATCH 05/10] autoconf: filter aclocal copy too
> +
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> +---
> + common/autoconf/basics.m4 | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/common/autoconf/basics.m4 b/common/autoconf/basics.m4
> +index c20ea76..8e06cd2 100644
> +--- a/common/autoconf/basics.m4
> ++++ b/common/autoconf/basics.m4
> +@@ -636,6 +636,7 @@ AC_DEFUN_ONCE([BASIC_SETUP_OUTPUT_DIR],
> +           | $SED -e 's/config.log//g' \
> + 	      -e 's/confdefs.h//g' \
> + 	      -e 's/fixpath.exe//g' \
> ++	      -e 's,aclocal-copy,,g' \
> + 	      -e 's/ //g' \
> +           | $TR -d '\n'`
> +       if test "x$filtered_files" != x; then
> +--
> +2.24.1
> +
> diff --git a/recipes-core/openjdk/patches-openjdk-8/handle_extra_output.patch b/recipes-core/openjdk/patches-openjdk-8/0006-autoconf-handle-extra-output.patch
> similarity index 57%
> rename from recipes-core/openjdk/patches-openjdk-8/handle_extra_output.patch
> rename to recipes-core/openjdk/patches-openjdk-8/0006-autoconf-handle-extra-output.patch
> index a8d2786..c5fa4bf 100644
> --- a/recipes-core/openjdk/patches-openjdk-8/handle_extra_output.patch
> +++ b/recipes-core/openjdk/patches-openjdk-8/0006-autoconf-handle-extra-output.patch
> @@ -1,9 +1,21 @@
> +From cf40c00dfd6d2299055c0e8415525d2da5e7cd4a Mon Sep 17 00:00:00 2001
> +From: Haiqing Bai <Haiqing.Bai@windriver.com>
> +Date: Thu, 2 Jan 2020 13:45:42 +0100
> +Subject: [PATCH 06/10] autoconf: handle extra output
> +
>   When adding the environment variable JAVA_TOOL_OPTIONS an extra line
>   in the output from 'java -version' is produced. As this output is
>   parsed by configure script the extra line has to be filtered out.
>   
> ---- jdk8u-4be07cb28b21.orig/common/autoconf/boot-jdk.m4
> -+++ jdk8u-4be07cb28b21/common/autoconf/boot-jdk.m4
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> +---
> + common/autoconf/boot-jdk.m4 | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/common/autoconf/boot-jdk.m4 b/common/autoconf/boot-jdk.m4
> +index 5be15b8..0d1a6e1 100644
> +--- a/common/autoconf/boot-jdk.m4
> ++++ b/common/autoconf/boot-jdk.m4
>   @@ -51,7 +51,7 @@ AC_DEFUN([BOOTJDK_DO_CHECK],
>                BOOT_JDK_FOUND=no
>              else
> @@ -13,3 +25,6 @@ parsed by configure script the extra line has to be filtered out.
>    
>                # Extra M4 quote needed to protect [] in grep expression.
>                [FOUND_VERSION_78=`echo $BOOT_JDK_VERSION | grep  '\"1\.[78]\.'`]
> +--
> +2.24.1
> +
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0007-fix-assembler-flag-handling-in-makefile.patch b/recipes-core/openjdk/patches-openjdk-8/0007-fix-assembler-flag-handling-in-makefile.patch
> new file mode 100644
> index 0000000..c99d599
> --- /dev/null
> +++ b/recipes-core/openjdk/patches-openjdk-8/0007-fix-assembler-flag-handling-in-makefile.patch
> @@ -0,0 +1,36 @@
> +From ec3aa8ae1159ff5ef37fae1ba470cf1886aa8d79 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Erkka=20K=C3=A4=C3=A4ri=C3=A4?= <erkka.kaaria@intel.com>
> +Date: Thu, 2 Jan 2020 13:49:02 +0100
> +Subject: [PATCH 07/10] fix assembler flag handling in makefile
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Delay $CXX insertion until after make has evaluated the comma-separated
> +list, as any comma separated parameters in CXX (such as assembler arguments)
> +would break the build
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Erkka Kääriä <erkka.kaaria@intel.com>
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> +---
> + make/common/NativeCompilation.gmk | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/make/common/NativeCompilation.gmk b/make/common/NativeCompilation.gmk
> +index 92f8033..46a1be9 100644
> +--- a/make/common/NativeCompilation.gmk
> ++++ b/make/common/NativeCompilation.gmk
> +@@ -391,7 +391,7 @@ define SetupNativeCompilation
> +   $$(foreach p,$$($1_SRCS), \
> +       $$(eval $$(call add_native_source,$1,$$p,$$($1_OBJECT_DIR), \
> +           $$($1_CFLAGS) $$($1_EXTRA_CFLAGS),$$($1_CC), \
> +-          $$($1_CXXFLAGS) $$($1_EXTRA_CXXFLAGS),$(CXX),$$($1_ASFLAGS))))
> ++          $$($1_CXXFLAGS) $$($1_EXTRA_CXXFLAGS),$$(CXX),$$($1_ASFLAGS))))
> +
> +   # On windows we need to create a resource file
> +   ifeq ($(OPENJDK_TARGET_OS), windows)
> +--
> +2.24.1
> +
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0008-autoconf-fix-shark-build-common.patch b/recipes-core/openjdk/patches-openjdk-8/0008-autoconf-fix-shark-build-common.patch
> new file mode 100644
> index 0000000..b783613
> --- /dev/null
> +++ b/recipes-core/openjdk/patches-openjdk-8/0008-autoconf-fix-shark-build-common.patch
> @@ -0,0 +1,37 @@
> +From c530da1c0269d1e9a875670943446876227fdb71 Mon Sep 17 00:00:00 2001
> +From: Jens Rehsack <rehsack@gmail.com>
> +Date: Thu, 2 Jan 2020 13:51:40 +0100
> +Subject: [PATCH 08/10] autoconf: fix shark build (common)
> +
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> +---
> + common/autoconf/libraries.m4 | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/common/autoconf/libraries.m4 b/common/autoconf/libraries.m4
> +index 727f018..91d2b5c 100644
> +--- a/common/autoconf/libraries.m4
> ++++ b/common/autoconf/libraries.m4
> +@@ -1079,8 +1079,9 @@ AC_DEFUN_ONCE([LIB_SETUP_STATIC_LINK_LIBSTDCPP],
> +         fi
> +       fi
> +     done
> +-    llvm_version=$("${LLVM_CONFIG}" --version | sed 's/\.//; s/svn.*//')
> ++    llvm_version=$("${LLVM_CONFIG}" --version | sed 's/\.//; s/svn.*//; s/\..*$//')
> +     LLVM_CFLAGS="${LLVM_CFLAGS} -DSHARK_LLVM_VERSION=${llvm_version}"
> ++    AS_IF([test $llvm_version -ge 34], [LLVM_CFLAGS="${LLVM_CFLAGS} -std=gnu++11"])
> +
> +     unset LLVM_LDFLAGS
> +     for flag in $("${LLVM_CONFIG}" --ldflags); do
> +@@ -1093,7 +1094,7 @@ AC_DEFUN_ONCE([LIB_SETUP_STATIC_LINK_LIBSTDCPP],
> +     done
> +
> +     unset LLVM_LIBS
> +-    for flag in $("${LLVM_CONFIG}" --libs ${llvm_components}); do
> ++    for flag in $("${LLVM_CONFIG}" --libs --system-libs ${llvm_components}); do
> +       if echo "${flag}" | grep -q '^-l'; then
> +         if test "${LLVM_LIBS}" != ""; then
> +           LLVM_LIBS="${LLVM_LIBS} "
> +--
> +2.24.1
> +
> diff --git a/recipes-core/openjdk/patches-openjdk-8/openjdk8-prevent-debuginfo-in-favour-of-openembedded-package-split.patch b/recipes-core/openjdk/patches-openjdk-8/0009-prevent-debuginfo-in-favour-of-openembedded-package-.patch
> similarity index 51%
> rename from recipes-core/openjdk/patches-openjdk-8/openjdk8-prevent-debuginfo-in-favour-of-openembedded-package-split.patch
> rename to recipes-core/openjdk/patches-openjdk-8/0009-prevent-debuginfo-in-favour-of-openembedded-package-.patch
> index 7d340a8..14fccd1 100644
> --- a/recipes-core/openjdk/patches-openjdk-8/openjdk8-prevent-debuginfo-in-favour-of-openembedded-package-split.patch
> +++ b/recipes-core/openjdk/patches-openjdk-8/0009-prevent-debuginfo-in-favour-of-openembedded-package-.patch
> @@ -1,40 +1,59 @@
> ---- make/common/NativeCompilation.gmk.orig
> -+++ make/common/NativeCompilation.gmk
> -@@ -438,58 +438,6 @@ define SetupNativeCompilation
> -           $$($1_OUTPUT_DIR)/% : $$($1_OBJECT_DIR)/%
> +From a5f2646a9dd0f7191e9e0aa5eba5fdd9d70d1671 Mon Sep 17 00:00:00 2001
> +From: Jens Rehsack <rehsack@gmail.com>
> +Date: Thu, 2 Jan 2020 13:53:50 +0100
> +Subject: [PATCH 09/10] prevent debuginfo in favour of openembedded package
> + split
> +
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> +---
> + make/common/NativeCompilation.gmk | 122 ------------------------------
> + 1 file changed, 122 deletions(-)
> +
> +diff --git a/make/common/NativeCompilation.gmk b/make/common/NativeCompilation.gmk
> +index 46a1be9..b4ea2c6 100644
> +--- a/make/common/NativeCompilation.gmk
> ++++ b/make/common/NativeCompilation.gmk
> +@@ -456,67 +456,6 @@ define SetupNativeCompilation
>    		$(CP) $$< $$@
>            endif
> --
> +
>   -        ifneq ($(OPENJDK_TARGET_OS), macosx)   # OBJCOPY is not used on MacOS X
>   -          ifneq ($(OPENJDK_TARGET_OS), windows)  # nor on Windows
>   -            ifeq ($(OPENJDK_TARGET_OS), solaris)
> --              # gobjcopy crashes on "empty" section headers with the SHF_ALLOC flag set.
> --              # Use $(FIX_EMPTY_SEC_HDR_FLAGS) to clear the SHF_ALLOC flag (if set) from
> --              # empty section headers until a fixed $(OBJCOPY) is available.
> --              # An empty section header has sh_addr == 0 and sh_size == 0.
> --              # This problem has only been seen on Solaris X64, but we call this tool
> --              # on all Solaris builds just in case.
> --              #
> --              # $(OBJCOPY) --add-gnu-debuglink=... corrupts SUNW_* sections.
> --              # Use $(ADD_GNU_DEBUGLINK) until a fixed $(OBJCOPY) is available.
> --              $$($1_OBJECT_DIR)/$$(LIBRARY_PREFIX)$$($1_LIBRARY).debuginfo : $$($1_TARGET) \
> +-              ifneq ($$($1_STRIP_POLICY), no_strip)
> +-                # gobjcopy crashes on "empty" section headers with the SHF_ALLOC flag set.
> +-                # Use $(FIX_EMPTY_SEC_HDR_FLAGS) to clear the SHF_ALLOC flag (if set) from
> +-                # empty section headers until a fixed $(OBJCOPY) is available.
> +-                # An empty section header has sh_addr == 0 and sh_size == 0.
> +-                # This problem has only been seen on Solaris X64, but we call this tool
> +-                # on all Solaris builds just in case.
> +-                #
> +-                # $(OBJCOPY) --add-gnu-debuglink=... corrupts SUNW_* sections.
> +-                # Use $(ADD_GNU_DEBUGLINK) until a fixed $(OBJCOPY) is available.
> +-                $$($1_OBJECT_DIR)/$$(LIBRARY_PREFIX)$$($1_LIBRARY).debuginfo : $$($1_TARGET) \
>   -				$(FIX_EMPTY_SEC_HDR_FLAGS) $(ADD_GNU_DEBUGLINK)
>   -		$(RM) $$@
>   -		$(FIX_EMPTY_SEC_HDR_FLAGS) $(LOG_INFO) $$<
>   -		$(OBJCOPY) --only-keep-debug $$< $$@
>   -		$(CD) $$(@D) && $(ADD_GNU_DEBUGLINK) $(LOG_INFO) $$(@F) $$<
> +-              endif
>   -            else # not solaris
> --              $$($1_OBJECT_DIR)/$$(LIBRARY_PREFIX)$$($1_LIBRARY).debuginfo : $$($1_TARGET)
> +-              ifneq ($$($1_STRIP_POLICY), no_strip)
> +-                $$($1_OBJECT_DIR)/$$(LIBRARY_PREFIX)$$($1_LIBRARY).debuginfo : $$($1_TARGET)
>   -		$(RM) $$@
>   -		$(OBJCOPY) --only-keep-debug $$< $$@
>   -		$(CD) $$(@D) && $(OBJCOPY) --add-gnu-debuglink=$$(@F) $$<
> +-              endif
>   -            endif # Touch to not retrigger rule on rebuild
> +-            ifneq ($$($1_STRIP_POLICY), no_strip)
>   -		$(TOUCH) $$@
> +-            endif
>   -          endif # !windows
>   -        endif # !macosx
>   -
>   -        ifeq ($(ZIP_DEBUGINFO_FILES), true)
>   -ifneq ($(OPENJDK_TARGET_OS), macosx) # no MacOS X support yet
> +-ifneq ($$($1_STRIP_POLICY), no_strip)
>   -          $1 += $$($1_OUTPUT_DIR)/$$(LIBRARY_PREFIX)$$($1_LIBRARY).diz
>   -
>   -          ifeq ($(OPENJDK_TARGET_OS), windows)
> @@ -47,53 +66,62 @@
>   -		$(CD) $$($1_OBJECT_DIR) \
>   -		&& $(ZIP) -q $$@ $$(LIBRARY_PREFIX)$$($1_LIBRARY).debuginfo
>   -          endif
> +-endif # not possible when stripping is disabled
>   -endif # no MacOS X support yet
>   -        else
>   -          ifeq ($(OPENJDK_TARGET_OS), windows)
>   -            $1 += $$($1_OUTPUT_DIR)/$$($1_LIBRARY).map \
>   -                $$($1_OUTPUT_DIR)/$$($1_LIBRARY).pdb
>   -          else ifneq ($(OPENJDK_TARGET_OS), macosx) # MacOS X does not use .debuginfo files
> --            $1 += $$($1_OUTPUT_DIR)/$$(LIBRARY_PREFIX)$$($1_LIBRARY).debuginfo
> +-            ifneq ($$($1_STRIP_POLICY), no_strip)
> +-              $1 += $$($1_OUTPUT_DIR)/$$(LIBRARY_PREFIX)$$($1_LIBRARY).debuginfo
> +-            endif
>   -          endif
>   -        endif
>          endif
>        endif
>    
> -@@ -522,58 +470,6 @@ endif # no MacOS X support yet
> -           $$($1_OUTPUT_DIR)/% : $$($1_OBJECT_DIR)/%
> +@@ -550,67 +489,6 @@ endif # no MacOS X support yet
>    		$(CP) $$< $$@
>            endif
> --
> +
>   -        ifneq ($(OPENJDK_TARGET_OS), macosx)   # OBJCOPY is not used on MacOS X
>   -          ifneq ($(OPENJDK_TARGET_OS), windows)  # nor on Windows
>   -            ifeq ($(OPENJDK_TARGET_OS), solaris)
> --              # gobjcopy crashes on "empty" section headers with the SHF_ALLOC flag set.
> --              # Use $(FIX_EMPTY_SEC_HDR_FLAGS) to clear the SHF_ALLOC flag (if set) from
> --              # empty section headers until a fixed $(OBJCOPY) is available.
> --              # An empty section header has sh_addr == 0 and sh_size == 0.
> --              # This problem has only been seen on Solaris X64, but we call this tool
> --              # on all Solaris builds just in case.
> --              #
> --              # $(OBJCOPY) --add-gnu-debuglink=... corrupts SUNW_* sections.
> --              # Use $(ADD_GNU_DEBUGLINK) until a fixed $(OBJCOPY) is available.
> --              $$($1_OBJECT_DIR)/$$($1_PROGRAM).debuginfo : $$($1_TARGET) \
> +-              ifneq ($$($1_STRIP_POLICY), no_strip)
> +-                # gobjcopy crashes on "empty" section headers with the SHF_ALLOC flag set.
> +-                # Use $(FIX_EMPTY_SEC_HDR_FLAGS) to clear the SHF_ALLOC flag (if set) from
> +-                # empty section headers until a fixed $(OBJCOPY) is available.
> +-                # An empty section header has sh_addr == 0 and sh_size == 0.
> +-                # This problem has only been seen on Solaris X64, but we call this tool
> +-                # on all Solaris builds just in case.
> +-                #
> +-                # $(OBJCOPY) --add-gnu-debuglink=... corrupts SUNW_* sections.
> +-                # Use $(ADD_GNU_DEBUGLINK) until a fixed $(OBJCOPY) is available.
> +-                $$($1_OBJECT_DIR)/$$($1_PROGRAM).debuginfo : $$($1_TARGET) \
>   -				$(FIX_EMPTY_SEC_HDR_FLAGS) $(ADD_GNU_DEBUGLINK)
>   -		$(RM) $$@
>   -		$(FIX_EMPTY_SEC_HDR_FLAGS) $(LOG_INFO) $$<
>   -		$(OBJCOPY) --only-keep-debug $$< $$@
>   -		$(CD) $$(@D) && $(ADD_GNU_DEBUGLINK) $(LOG_INFO) $$(@F) $$<
> +-              endif
>   -            else # not solaris
> --              $$($1_OBJECT_DIR)/$$($1_PROGRAM).debuginfo : $$($1_TARGET)
> +-              ifneq ($$($1_STRIP_POLICY), no_strip)
> +-                $$($1_OBJECT_DIR)/$$($1_PROGRAM).debuginfo : $$($1_TARGET)
>   -		$(RM) $$@
>   -		$(OBJCOPY) --only-keep-debug $$< $$@
>   -		$(CD) $$(@D) && $(OBJCOPY) --add-gnu-debuglink=$$(@F) $$<
> +-              endif
>   -            endif
> +-            ifneq ($$($1_STRIP_POLICY), no_strip)
>   -		$(TOUCH) $$@
> +-            endif
>   -          endif # !windows
>   -        endif # !macosx
>   -
>   -        ifeq ($(ZIP_DEBUGINFO_FILES), true)
>   -ifneq ($(OPENJDK_TARGET_OS), macosx) # no MacOS X support yet
> +-ifneq ($$($1_STRIP_POLICY), no_strip)
>   -          $1 += $$($1_OUTPUT_DIR)/$$($1_PROGRAM).diz
>   -
>   -          ifeq ($(OPENJDK_TARGET_OS), windows)
> @@ -106,15 +134,21 @@
>   -		$(CD) $$($1_OBJECT_DIR) \
>   -		&& $(ZIP) -q $$@ $$($1_PROGRAM).debuginfo
>   -          endif
> +-endif
>   -endif # no MacOS X support yet
>   -        else
>   -          ifeq ($(OPENJDK_TARGET_OS), windows)
>   -            $1 += $$($1_OUTPUT_DIR)/$$($1_PROGRAM).map \
>   -                $$($1_OUTPUT_DIR)/$$($1_PROGRAM).pdb
>   -          else ifneq ($(OPENJDK_TARGET_OS), macosx) # MacOS X does not use .debuginfo files
> --            $1 += $$($1_OUTPUT_DIR)/$$($1_PROGRAM).debuginfo
> +-            ifneq ($$($1_STRIP_POLICY), no_strip)
> +-              $1 += $$($1_OUTPUT_DIR)/$$($1_PROGRAM).debuginfo
> +-            endif
>   -          endif
>   -        endif
>          endif
>        endif
>    
> +--
> +2.24.1
> +
> diff --git a/recipes-core/openjdk/patches-openjdk-8/remove-shell-variables-from-autoheader.patch b/recipes-core/openjdk/patches-openjdk-8/0010-autoconf-remove-shell-variables-from-autoheader.patch
> similarity index 69%
> rename from recipes-core/openjdk/patches-openjdk-8/remove-shell-variables-from-autoheader.patch
> rename to recipes-core/openjdk/patches-openjdk-8/0010-autoconf-remove-shell-variables-from-autoheader.patch
> index 5e2f78b..57099ec 100644
> --- a/recipes-core/openjdk/patches-openjdk-8/remove-shell-variables-from-autoheader.patch
> +++ b/recipes-core/openjdk/patches-openjdk-8/0010-autoconf-remove-shell-variables-from-autoheader.patch
> @@ -1,6 +1,18 @@
> ---- common/autoconf/basics.m4.orig
> -+++ common/autoconf/basics.m4
> -@@ -472,21 +472,21 @@ AC_DEFUN_ONCE([BASIC_SETUP_OUTPUT_DIR],
> +From 0d22dccb4de73d274b90e2647702b92958374bc1 Mon Sep 17 00:00:00 2001
> +From: Jens Rehsack <rehsack@gmail.com>
> +Date: Thu, 2 Jan 2020 13:55:29 +0100
> +Subject: [PATCH 10/10] autoconf: remove shell variables from autoheader
> +
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> +---
> + common/autoconf/basics.m4 | 14 +++++++-------
> + 1 file changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/common/autoconf/basics.m4 b/common/autoconf/basics.m4
> +index 8e06cd2..c220bba 100644
> +--- a/common/autoconf/basics.m4
> ++++ b/common/autoconf/basics.m4
> +@@ -661,21 +661,21 @@ AC_DEFUN_ONCE([BASIC_SETUP_OUTPUT_DIR],
>      AC_SUBST(OUTPUT_ROOT, $OUTPUT_ROOT)
>    
>      # Most of the probed defines are put into config.h
> @@ -26,6 +38,9 @@
>      # which will look for generated configurations
>   -  AC_CONFIG_FILES([$OUTPUT_ROOT/Makefile:$AUTOCONF_DIR/Makefile.in])
>   +  AC_CONFIG_FILES([Makefile:Makefile.in])
> + ])
>    
> -   # Save the arguments given to us
> -   echo "$CONFIGURE_COMMAND_LINE" > $OUTPUT_ROOT/configure-arguments
> + AC_DEFUN_ONCE([BASIC_SETUP_LOGGING],
> +--
> +2.24.1
> +
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0011-autoconf-fix-CC-with-arguments-detection.patch b/recipes-core/openjdk/patches-openjdk-8/0011-autoconf-fix-CC-with-arguments-detection.patch
> new file mode 100644
> index 0000000..f1de194
> --- /dev/null
> +++ b/recipes-core/openjdk/patches-openjdk-8/0011-autoconf-fix-CC-with-arguments-detection.patch
> @@ -0,0 +1,43 @@
> +diff --git a/common/autoconf/toolchain.m4 b/common/autoconf/toolchain.m4
> +index e3a82c8..705e3e7 100644
> +--- a/common/autoconf/toolchain.m4
> ++++ b/common/autoconf/toolchain.m4
> +@@ -478,23 +478,30 @@ AC_DEFUN([TOOLCHAIN_FIND_COMPILER],
> +   SEARCH_LIST="$3"
> +
> +   if test "x[$]$1" != x; then
> ++    # split compiler program and arguments
> ++    CBIN=`cut -d ' ' -f1 <<<"[$]$1"`
> ++    CARGS=`cut -d ' ' -f2- <<<"[$]$1"`
> ++
> +     # User has supplied compiler name already, always let that override.
> +-    AC_MSG_NOTICE([Will use user supplied compiler $1=[$]$1])
> +-    if test "x`basename [$]$1`" = "x[$]$1"; then
> ++    AC_MSG_NOTICE([Will use user supplied compiler ($CBIN) $1=[$]$1])
> ++    if test "x`basename $CBIN`" = "x$CBIN"; then
> +       # A command without a complete path is provided, search $PATH.
> +
> +-      AC_PATH_PROGS(POTENTIAL_$1, [$]$1)
> +-      if test "x$POTENTIAL_$1" != x; then
> +-        $1=$POTENTIAL_$1
> ++      AC_PATH_PROGS(POTENTIAL_CBIN, $CBIN)
> ++      if test "x$POTENTIAL_CBIN" != x; then
> ++        CBIN=$POTENTIAL_CBIN
> +       else
> +-        AC_MSG_ERROR([User supplied compiler $1=[$]$1 could not be found])
> ++        AC_MSG_ERROR([User supplied compiler $1=$CBIN could not be found])
> +       fi
> +     else
> +       # Otherwise it might already be a complete path
> +-      if test ! -x "[$]$1"; then
> +-        AC_MSG_ERROR([User supplied compiler $1=[$]$1 does not exist])
> ++      if test ! -x "$CBIN"; then
> ++        AC_MSG_ERROR([User supplied compiler $1=$CBIN does not exist])
> +       fi
> +     fi
> ++
> ++    $1="$CBIN $CARGS"
> ++    AC_MSG_NOTICE([Mapped user supplied compiler to $1=[$]$1])
> +   else
> +     # No user supplied value. Locate compiler ourselves.
> +
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0012-autoconf-NativeCompilation-remove-sysroot.patch b/recipes-core/openjdk/patches-openjdk-8/0012-autoconf-NativeCompilation-remove-sysroot.patch
> new file mode 100644
> index 0000000..39179d4
> --- /dev/null
> +++ b/recipes-core/openjdk/patches-openjdk-8/0012-autoconf-NativeCompilation-remove-sysroot.patch
> @@ -0,0 +1,24 @@
> +diff --git a/make/common/NativeCompilation.gmk b/make/common/NativeCompilation.gmk
> +index d961cf3..9679f97 100644
> +--- a/make/common/NativeCompilation.gmk
> ++++ b/make/common/NativeCompilation.gmk
> +@@ -383,10 +383,6 @@ define SetupNativeCompilation
> +     $$(error Unknown value for OPTIMIZATION: $$($1_OPTIMIZATION))
> +   endif
> +
> +-  # Add sys root specific cflags last
> +-  $1_EXTRA_CFLAGS += $(SYSROOT_CFLAGS)
> +-  $1_EXTRA_CXXFLAGS += $(SYSROOT_CFLAGS)
> +-
> +   # Now call add_native_source for each source file we are going to compile.
> +   $$(foreach p,$$($1_SRCS), \
> +       $$(eval $$(call add_native_source,$1,$$p,$$($1_OBJECT_DIR), \
> +@@ -432,8 +428,6 @@ define SetupNativeCompilation
> +     $1_EXTRA_LDFLAGS += $(call SET_SHARED_LIBRARY_MAPFILE,$$($1_REAL_MAPFILE))
> +   endif
> +
> +-  $1_EXTRA_LDFLAGS += $(SYSROOT_LDFLAGS)
> +-
> +   $1 := $$($1_TARGET)
> +   ifneq (,$$($1_LIBRARY))
> +     # Generating a dynamic library.
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0012-hotspot-aarch64-fix-undefined-behaviour-gcc-v8-fix.patch b/recipes-core/openjdk/patches-openjdk-8/0012-hotspot-aarch64-fix-undefined-behaviour-gcc-v8-fix.patch
> deleted file mode 100644
> index e11c19c..0000000
> --- a/recipes-core/openjdk/patches-openjdk-8/0012-hotspot-aarch64-fix-undefined-behaviour-gcc-v8-fix.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 1fa1097d45afa2fe2bfd989fbd90578f5c5fc540 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
> -Date: Mon, 13 Aug 2018 12:14:21 +0100
> -Subject: [PATCH] hotspot/aarch64: fix undefined behaviour (gcc v8 fix)
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Backport patch from
> -  http://hg.openjdk.java.net/aarch64-port/jdk8u/hotspot/rev/253b0c304db6
> -to address segfaults due to undefined behaviour.
> -
> -|# HG changeset patch
> -|# User shade
> -|# Date 1526068247 -7200
> -|# Node ID 253b0c304db6d31be3d3d7cf7cf1b3561a16dc3a
> -|# Parent  1ced2ae00e35e6f855175fc44500b37fbac9e314
> -UB in os_linux_aarch64.cpp SpinPause
> -Reviewed-by: aph, shade, adinn
> -
> -Signed-off-by: André Draszik <andre.draszik@jci.com>
> -Upstream-Status: Backport [http://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/ca4663e58916]
> ----
> - hotspot/src/os_cpu/linux_aarch64/vm/os_linux_aarch64.cpp | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/hotspot/src/os_cpu/linux_aarch64/vm/os_linux_aarch64.cpp b/hotspot/src/os_cpu/linux_aarch64/vm/os_linux_aarch64.cpp
> -index 8b985693..f536817e 100644
> ---- a/hotspot/src/os_cpu/linux_aarch64/vm/os_linux_aarch64.cpp
> -+++ b/hotspot/src/os_cpu/linux_aarch64/vm/os_linux_aarch64.cpp
> -@@ -699,6 +699,7 @@ void os::verify_stack_alignment() {
> -
> - extern "C" {
> -   int SpinPause() {
> -+    return 0;
> -   }
> -
> -   void _Copy_conjoint_jshorts_atomic(jshort* from, jshort* to, size_t count) {
> ---
> -2.18.0
> -
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0014-hotspot-zero-fix-undefined-behaviour-gcc-v8-fix.patch b/recipes-core/openjdk/patches-openjdk-8/0014-hotspot-zero-fix-undefined-behaviour-gcc-v8-fix.patch
> deleted file mode 100644
> index 467a1cd..0000000
> --- a/recipes-core/openjdk/patches-openjdk-8/0014-hotspot-zero-fix-undefined-behaviour-gcc-v8-fix.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 3bd88f93a90876f8ead05de40816da0bd1e39aac Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
> -Date: Mon, 13 Aug 2018 11:49:26 +0100
> -Subject: [PATCH] hotspot/zero: fix undefined behaviour (gcc v8 fix)
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Backport patch from
> -  https://bugs.openjdk.java.net/browse/JDK-8202600
> -  http://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/ca4663e58916
> -to address segfaults due to undefined behaviour.
> -
> -|# HG changeset patch
> -|# User sgehwolf
> -|# Date 1525366788 -7200
> -|# Node ID ca4663e589160509d6aef8ec890815e1330b97bc
> -|# Parent  a27880c1288ba776f65748b68c198df97427f950
> -8202600: [Zero] Undefined behaviour in src/os_cpu/linux_zero/vm/os_linux_zero.cpp
> -Reviewed-by: stuefe, shade, dholmes
> -
> -Signed-off-by: André Draszik <andre.draszik@jci.com>
> -Upstream-Status: Backport [http://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/ca4663e58916]
> ----
> - hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp b/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp
> -index 1d069c6d..8dcf9d44 100644
> ---- a/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp
> -+++ b/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp
> -@@ -408,6 +408,7 @@ void os::print_register_info(outputStream *st, void *context) {
> -
> - extern "C" {
> -   int SpinPause() {
> -+    return 0; // Shouldn't matter.
> -   }
> -
> -
> ---
> -2.18.0
> -
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0018-hotspot-Fix-debug-build-after-8062808-Turn-on-the-Wr.patch b/recipes-core/openjdk/patches-openjdk-8/0018-hotspot-Fix-debug-build-after-8062808-Turn-on-the-Wr.patch
> deleted file mode 100644
> index 1421963..0000000
> --- a/recipes-core/openjdk/patches-openjdk-8/0018-hotspot-Fix-debug-build-after-8062808-Turn-on-the-Wr.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From dbf31e2dfd00e20ab49af70f3533a348e8a6515e Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
> -Date: Mon, 13 Aug 2018 16:47:25 +0100
> -Subject: [PATCH 4/5] hotspot: Fix debug build after 8062808: Turn on the
> - -Wreturn-type warning
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -|# HG changeset patch
> -|# User goetz
> -|# Date 1415873641 -3600
> -|#      Thu Nov 13 11:14:01 2014 +0100
> -|# Node ID 1878c4c1d04e1f3c6f67a19d36c35863d6b5f906
> -|# Parent  533473c67de6ff767710594639033c8e83523fe5
> -8064786, PR3599: Fix debug build after 8062808: Turn on the -Wreturn-type warning
> -Reviewed-by: stefank, tschatzl
> -
> -Signed-off-by: André Draszik <andre.draszik@jci.com>
> -Upstream-Status: Backport
> ----
> - hotspot/src/share/vm/prims/jni.cpp | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/hotspot/src/share/vm/prims/jni.cpp b/hotspot/src/share/vm/prims/jni.cpp
> -index 6a6ab936..e2f2ad3b 100644
> ---- a/hotspot/src/share/vm/prims/jni.cpp
> -+++ b/hotspot/src/share/vm/prims/jni.cpp
> -@@ -708,6 +708,7 @@ JNI_ENTRY(jint, jni_Throw(JNIEnv *env, jthrowable obj))
> -
> -   THROW_OOP_(JNIHandles::resolve(obj), JNI_OK);
> -   ShouldNotReachHere();
> -+  return 0;  // Mute compiler.
> - JNI_END
> -
> - #ifndef USDT2
> -@@ -734,6 +735,7 @@ JNI_ENTRY(jint, jni_ThrowNew(JNIEnv *env, jclass clazz, const char *message))
> -   Handle protection_domain (THREAD, k->protection_domain());
> -   THROW_MSG_LOADER_(name, (char *)message, class_loader, protection_domain, JNI_OK);
> -   ShouldNotReachHere();
> -+  return 0;  // Mute compiler.
> - JNI_END
> -
> -
> ---
> -2.18.0
> -
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0020-Enable-HotSpot-builds-on-5.x-Linux-kernels.patch b/recipes-core/openjdk/patches-openjdk-8/0020-Enable-HotSpot-builds-on-5.x-Linux-kernels.patch
> deleted file mode 100644
> index f9feca0..0000000
> --- a/recipes-core/openjdk/patches-openjdk-8/0020-Enable-HotSpot-builds-on-5.x-Linux-kernels.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 90220d41f65910b108c901977eefe78fc1edecc5 Mon Sep 17 00:00:00 2001
> -From: Nicola Lunghi <nicola.lunghi@jci.com>
> -Date: Mon, 17 Jun 2019 13:59:26 +0100
> -Subject: [PATCH] Enable HotSpot builds on 5.x Linux kernels
> -
> -8217753: Enable HotSpot builds on 5.x Linux kernels
> -Summary: Remove Linux kernel version check as very unlikely a kernel older than 2.4 will be used.
> -Reviewed-by: erikj
> -
> -Upstream-Status: Backport (http://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/5af8ec63c21c)
> ----
> - hotspot/make/linux/Makefile | 15 +--------------
> - 1 file changed, 1 insertion(+), 14 deletions(-)
> -
> -diff --git a/hotspot/make/linux/Makefile b/hotspot/make/linux/Makefile
> -index 17c14097..e8f20104 100644
> ---- a/hotspot/make/linux/Makefile
> -+++ b/hotspot/make/linux/Makefile
> -@@ -227,20 +227,7 @@ all:
> - 	@echo "  $(TARGETS_SHARK)"
> - 	@echo "  $(TARGETS_MINIMAL1)"
> -
> --checks: check_os_version check_j2se_version
> --
> --# We do not want people accidentally building on old systems (e.g. Linux 2.2.x,
> --# Solaris 2.5.1, 2.6).
> --# Disable this check by setting DISABLE_HOTSPOT_OS_VERSION_CHECK=ok.
> --
> --SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 3% 4%
> --OS_VERSION := $(shell uname -r)
> --EMPTY_IF_NOT_SUPPORTED = $(filter $(SUPPORTED_OS_VERSION),$(OS_VERSION))
> --
> --check_os_version:
> --ifeq ($(DISABLE_HOTSPOT_OS_VERSION_CHECK)$(EMPTY_IF_NOT_SUPPORTED),)
> --	$(QUIETLY) >&2 echo "*** This OS is not supported:" `uname -a`; exit 1;
> --endif
> -+checks: check_j2se_version
> -
> - # jvmti.make requires XSLT (J2SE 1.4.x or newer):
> - XSLT_CHECK	= $(REMOTE) $(RUN.JAVAP) javax.xml.transform.TransformerFactory
> ---
> -2.20.1
> -
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch b/recipes-core/openjdk/patches-openjdk-8/1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch
> similarity index 80%
> rename from recipes-core/openjdk/patches-openjdk-8/0001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch
> rename to recipes-core/openjdk/patches-openjdk-8/1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch
> index 4618b6b..280ee60 100644
> --- a/recipes-core/openjdk/patches-openjdk-8/0001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch
> +++ b/recipes-core/openjdk/patches-openjdk-8/1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch
> @@ -1,7 +1,7 @@
> -From d0ebd6f108df9b0f9533de6f16280ceec136d8e6 Mon Sep 17 00:00:00 2001
> +From 5e8080a8dd56205f550f7c490f864c95dc8e509b Mon Sep 17 00:00:00 2001
>   From: Wenlin Kang <wenlin.kang@windriver.com>
>   Date: Sun, 17 Feb 2019 22:38:33 -0800
> -Subject: [PATCH] hotspot: fix crash on JNI_CreateJavaVM
> +Subject: [PATCH 1001/1012] hotspot: fix crash on JNI_CreateJavaVM
>   
>   In function os::pd_create_stack_guard_pages(char* addr, size_t size),
>   when addr < os::Linux::initial_thread_stack_bottom(), usually munmap()
> @@ -13,15 +13,16 @@ cause segment(we have reproduced it on linux_PPC).
>   Upstream-Status: Pending
>   
>   Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>   ---
> - hotspot/src/os/linux/vm/os_linux.cpp | 3 ++-
> + src/os/linux/vm/os_linux.cpp | 3 ++-
>    1 file changed, 2 insertions(+), 1 deletion(-)
>   
>   diff --git a/hotspot/src/os/linux/vm/os_linux.cpp b/hotspot/src/os/linux/vm/os_linux.cpp
> -index 044a70a6..b8246ce4 100644
> +index 03cabfefb..4f28cc1fb 100644
>   --- a/hotspot/src/os/linux/vm/os_linux.cpp
>   +++ b/hotspot/src/os/linux/vm/os_linux.cpp
> -@@ -3078,7 +3078,8 @@ bool os::pd_create_stack_guard_pages(char* addr, size_t size) {
> +@@ -3192,7 +3192,8 @@ bool os::pd_create_stack_guard_pages(char* addr, size_t size) {
>        uintptr_t stack_extent = (uintptr_t) os::Linux::initial_thread_stack_bottom();
>        unsigned char vec[1];
>    
> @@ -32,5 +33,5 @@ index 044a70a6..b8246ce4 100644
>          stack_extent = (uintptr_t) get_stack_commited_bottom(
>                                        os::Linux::initial_thread_stack_bottom(),
>   --
> -2.17.1
> +2.24.1
>   
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0005-hotspot-use-correct-include-for-poll.patch b/recipes-core/openjdk/patches-openjdk-8/1002-hotspot-use-correct-include-for-poll.patch
> similarity index 81%
> rename from recipes-core/openjdk/patches-openjdk-8/0005-hotspot-use-correct-include-for-poll.patch
> rename to recipes-core/openjdk/patches-openjdk-8/1002-hotspot-use-correct-include-for-poll.patch
> index 45573e4..3f678dd 100644
> --- a/recipes-core/openjdk/patches-openjdk-8/0005-hotspot-use-correct-include-for-poll.patch
> +++ b/recipes-core/openjdk/patches-openjdk-8/1002-hotspot-use-correct-include-for-poll.patch
> @@ -1,7 +1,7 @@
> -From 79e35bd203b40979e1d241a04d6d9df373327bef Mon Sep 17 00:00:00 2001
> +From df566df123c8af8252c0e113c41c32482834923e Mon Sep 17 00:00:00 2001
>   From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
>   Date: Tue, 27 Feb 2018 09:28:06 +0000
> -Subject: [PATCH 5/9] hotspot: use correct include for poll
> +Subject: [PATCH 1002/1012] hotspot: use correct include for poll
>   MIME-Version: 1.0
>   Content-Type: text/plain; charset=UTF-8
>   Content-Transfer-Encoding: 8bit
> @@ -20,16 +20,18 @@ the following command:
>       done
>   
>   Upstream-Status: Pending
> +
>   Signed-off-by: André Draszik <andre.draszik@jci.com>
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>   ---
> - hotspot/src/os/aix/vm/os_aix.inline.hpp         | 2 +-
> - hotspot/src/os/bsd/vm/os_bsd.inline.hpp         | 2 +-
> - hotspot/src/os/linux/vm/os_linux.inline.hpp     | 2 +-
> - hotspot/src/os/solaris/vm/os_solaris.inline.hpp | 2 +-
> + src/os/aix/vm/os_aix.inline.hpp         | 2 +-
> + src/os/bsd/vm/os_bsd.inline.hpp         | 2 +-
> + src/os/linux/vm/os_linux.inline.hpp     | 2 +-
> + src/os/solaris/vm/os_solaris.inline.hpp | 2 +-
>    4 files changed, 4 insertions(+), 4 deletions(-)
>   
>   diff --git a/hotspot/src/os/aix/vm/os_aix.inline.hpp b/hotspot/src/os/aix/vm/os_aix.inline.hpp
> -index a97c94c0..e2974ee1 100644
> +index 421ea342e..9a1e1e096 100644
>   --- a/hotspot/src/os/aix/vm/os_aix.inline.hpp
>   +++ b/hotspot/src/os/aix/vm/os_aix.inline.hpp
>   @@ -34,7 +34,7 @@
> @@ -42,7 +44,7 @@ index a97c94c0..e2974ee1 100644
>    #include <netdb.h>
>    
>   diff --git a/hotspot/src/os/bsd/vm/os_bsd.inline.hpp b/hotspot/src/os/bsd/vm/os_bsd.inline.hpp
> -index 10b39941..3144a29c 100644
> +index c35abf486..8ff584aee 100644
>   --- a/hotspot/src/os/bsd/vm/os_bsd.inline.hpp
>   +++ b/hotspot/src/os/bsd/vm/os_bsd.inline.hpp
>   @@ -33,7 +33,7 @@
> @@ -55,7 +57,7 @@ index 10b39941..3144a29c 100644
>    
>    inline void* os::thread_local_storage_at(int index) {
>   diff --git a/hotspot/src/os/linux/vm/os_linux.inline.hpp b/hotspot/src/os/linux/vm/os_linux.inline.hpp
> -index 10d56d89..b9b2b775 100644
> +index a23bd5631..9d56de0ef 100644
>   --- a/hotspot/src/os/linux/vm/os_linux.inline.hpp
>   +++ b/hotspot/src/os/linux/vm/os_linux.inline.hpp
>   @@ -33,7 +33,7 @@
> @@ -68,7 +70,7 @@ index 10d56d89..b9b2b775 100644
>    
>    inline void* os::thread_local_storage_at(int index) {
>   diff --git a/hotspot/src/os/solaris/vm/os_solaris.inline.hpp b/hotspot/src/os/solaris/vm/os_solaris.inline.hpp
> -index 921fcf7c..5d80a7d0 100644
> +index 8e095ab69..ce37e9a12 100644
>   --- a/hotspot/src/os/solaris/vm/os_solaris.inline.hpp
>   +++ b/hotspot/src/os/solaris/vm/os_solaris.inline.hpp
>   @@ -33,7 +33,7 @@
> @@ -81,5 +83,5 @@ index 921fcf7c..5d80a7d0 100644
>    #include <unistd.h>
>    #include <netdb.h>
>   --
> -2.16.2
> +2.24.1
>   
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0006-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch b/recipes-core/openjdk/patches-openjdk-8/1003-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch
> similarity index 82%
> rename from recipes-core/openjdk/patches-openjdk-8/0006-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch
> rename to recipes-core/openjdk/patches-openjdk-8/1003-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch
> index f6af83e..8e31461 100644
> --- a/recipes-core/openjdk/patches-openjdk-8/0006-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch
> +++ b/recipes-core/openjdk/patches-openjdk-8/1003-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch
> @@ -1,7 +1,7 @@
> -From 4ed4b58270dcd3d897adef605893c104944c4f3a Mon Sep 17 00:00:00 2001
> +From e5bf672f4e10997789f2a447fd95a88703dbd332 Mon Sep 17 00:00:00 2001
>   From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
>   Date: Tue, 27 Feb 2018 15:00:55 +0000
> -Subject: [PATCH 6/9] hotspot: don't rely on old SysV SIGCLD
> +Subject: [PATCH 1003/1012] hotspot: don't rely on old SysV SIGCLD
>   MIME-Version: 1.0
>   Content-Type: text/plain; charset=UTF-8
>   Content-Transfer-Encoding: 8bit
> @@ -17,13 +17,15 @@ leads to the following compilation error:
>   Just make it conditional, so the code compiles everywhere.
>   
>   Upstream-Status: Pending
> +
>   Signed-off-by: André Draszik <andre.draszik@jci.com>
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>   ---
> - hotspot/src/os/linux/vm/jvm_linux.cpp | 2 ++
> + src/os/linux/vm/jvm_linux.cpp | 2 ++
>    1 file changed, 2 insertions(+)
>   
>   diff --git a/hotspot/src/os/linux/vm/jvm_linux.cpp b/hotspot/src/os/linux/vm/jvm_linux.cpp
> -index ba84788a..c22281f7 100644
> +index ba84788a1..c22281f7c 100644
>   --- a/hotspot/src/os/linux/vm/jvm_linux.cpp
>   +++ b/hotspot/src/os/linux/vm/jvm_linux.cpp
>   @@ -154,7 +154,9 @@ struct siglabel siglabels[] = {
> @@ -37,5 +39,5 @@ index ba84788a..c22281f7 100644
>      "CONT",       SIGCONT,        /* Continue (POSIX).  */
>      "STOP",       SIGSTOP,        /* Stop, unblockable (POSIX).  */
>   --
> -2.16.2
> +2.24.1
>   
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0011-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch b/recipes-core/openjdk/patches-openjdk-8/1004-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch
> similarity index 77%
> rename from recipes-core/openjdk/patches-openjdk-8/0011-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch
> rename to recipes-core/openjdk/patches-openjdk-8/1004-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch
> index 4ab0d7a..ad480e3 100644
> --- a/recipes-core/openjdk/patches-openjdk-8/0011-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch
> +++ b/recipes-core/openjdk/patches-openjdk-8/1004-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch
> @@ -1,7 +1,8 @@
> -From cc8fb308b36d323ee8a1e3a60e4c2ac006f710ab Mon Sep 17 00:00:00 2001
> +From 3a6eef99b27b7dd750e7a02eb3ada71db99d9345 Mon Sep 17 00:00:00 2001
>   From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
>   Date: Fri, 10 Aug 2018 14:54:45 +0100
> -Subject: [PATCH] hotspot: backport patch to fix misuses of strncpy/strncat
> +Subject: [PATCH 1004/1012] hotspot: backport patch to fix misuses of
> + strncpy/strncat
>   MIME-Version: 1.0
>   Content-Type: text/plain; charset=UTF-8
>   Content-Transfer-Encoding: 8bit
> @@ -15,23 +16,22 @@ Fix them using a backport from openjdk-10
>   Modelled after http://hg.openjdk.java.net/jdk-updates/jdk10u/rev/b1608535e50f
>   
>   Signed-off-by: André Draszik <andre.draszik@jci.com>
> -
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>   ---
> -Upstream-Status: Backport [http://hg.openjdk.java.net/jdk-updates/jdk10u/rev/b1608535e50f]
> - hotspot/agent/src/os/linux/libproc_impl.c       |  7 ++++++-
> - hotspot/src/share/tools/hsdis/hsdis.c           |  1 +
> - hotspot/src/share/vm/compiler/compileBroker.hpp |  3 ++-
> - hotspot/src/share/vm/compiler/disassembler.cpp  |  1 +
> - hotspot/src/share/vm/runtime/arguments.cpp      | 13 ++++++-------
> - hotspot/src/share/vm/utilities/ostream.cpp      | 14 +++++++++-----
> - hotspot/src/share/vm/utilities/vmError.cpp      |  9 +--------
> - 7 files changed, 26 insertions(+), 22 deletions(-)
> + agent/src/os/linux/libproc_impl.c       |  7 ++++++-
> + src/share/tools/hsdis/hsdis.c           |  1 +
> + src/share/vm/compiler/compileBroker.hpp |  3 ++-
> + src/share/vm/compiler/disassembler.cpp  |  1 +
> + src/share/vm/runtime/arguments.cpp      | 13 ++++++-------
> + src/share/vm/utilities/ostream.cpp      | 12 ++++++++----
> + src/share/vm/utilities/vmError.cpp      |  9 +--------
> + 7 files changed, 25 insertions(+), 21 deletions(-)
>   
>   diff --git a/hotspot/agent/src/os/linux/libproc_impl.c b/hotspot/agent/src/os/linux/libproc_impl.c
> -index 2ea0d0f8..ab23fb16 100644
> +index ca791c95d..73a15ce35 100644
>   --- a/hotspot/agent/src/os/linux/libproc_impl.c
>   +++ b/hotspot/agent/src/os/linux/libproc_impl.c
> -@@ -162,7 +162,12 @@ lib_info* add_lib_info_fd(struct ps_prochandle* ph, const char* libname, int fd,
> +@@ -159,7 +159,12 @@ lib_info* add_lib_info_fd(struct ps_prochandle* ph, const char* libname, int fd,
>          return NULL;
>       }
>    
> @@ -46,10 +46,10 @@ index 2ea0d0f8..ab23fb16 100644
>    
>       if (fd == -1) {
>   diff --git a/hotspot/src/share/tools/hsdis/hsdis.c b/hotspot/src/share/tools/hsdis/hsdis.c
> -index b56330e4..4e6fd9af 100644
> +index 7bef1040f..1907d479e 100644
>   --- a/hotspot/src/share/tools/hsdis/hsdis.c
>   +++ b/hotspot/src/share/tools/hsdis/hsdis.c
> -@@ -410,6 +410,7 @@ static void parse_caller_options(struct hsdis_app_data* app_data, const char* ca
> +@@ -438,6 +438,7 @@ static void parse_caller_options(struct hsdis_app_data* app_data, const char* ca
>        }
>        p = q;
>      }
> @@ -58,7 +58,7 @@ index b56330e4..4e6fd9af 100644
>    
>    static void print_help(struct hsdis_app_data* app_data,
>   diff --git a/hotspot/src/share/vm/compiler/compileBroker.hpp b/hotspot/src/share/vm/compiler/compileBroker.hpp
> -index 7a381cd3..2aea6dd1 100644
> +index ad37ff173..16e0ba3aa 100644
>   --- a/hotspot/src/share/vm/compiler/compileBroker.hpp
>   +++ b/hotspot/src/share/vm/compiler/compileBroker.hpp
>   @@ -173,7 +173,8 @@ class CompilerCounters : public CHeapObj<mtCompiler> {
> @@ -72,10 +72,10 @@ index 7a381cd3..2aea6dd1 100644
>        }
>    
>   diff --git a/hotspot/src/share/vm/compiler/disassembler.cpp b/hotspot/src/share/vm/compiler/disassembler.cpp
> -index 69974763..111214a9 100644
> +index 93cd9e854..e7b32cd6b 100644
>   --- a/hotspot/src/share/vm/compiler/disassembler.cpp
>   +++ b/hotspot/src/share/vm/compiler/disassembler.cpp
> -@@ -298,6 +298,7 @@ address decode_env::handle_event(const char* event, address arg) {
> +@@ -295,6 +295,7 @@ address decode_env::handle_event(const char* event, address arg) {
>            strlen((const char*)arg) > sizeof(buffer) - 1) {
>          // Only print this when the mach changes
>          strncpy(buffer, (const char*)arg, sizeof(buffer) - 1);
> @@ -84,10 +84,10 @@ index 69974763..111214a9 100644
>        }
>      } else if (match(event, "format bytes-per-line")) {
>   diff --git a/hotspot/src/share/vm/runtime/arguments.cpp b/hotspot/src/share/vm/runtime/arguments.cpp
> -index cccff7a8..7589b443 100644
> +index 2665b6b8c..5a9294677 100644
>   --- a/hotspot/src/share/vm/runtime/arguments.cpp
>   +++ b/hotspot/src/share/vm/runtime/arguments.cpp
> -@@ -3430,7 +3430,7 @@ void Arguments::fix_appclasspath() {
> +@@ -3455,7 +3455,7 @@ void Arguments::fix_appclasspath() {
>        }
>    
>        char* copy = AllocateHeap(strlen(src) + 1, mtInternal);
> @@ -96,7 +96,7 @@ index cccff7a8..7589b443 100644
>    
>        // trim all trailing empty paths
>        for (char* tail = copy + strlen(copy) - 1; tail >= copy && *tail == separator; tail--) {
> -@@ -3804,17 +3804,16 @@ static char* get_shared_archive_path() {
> +@@ -3834,17 +3834,16 @@ static char* get_shared_archive_path() {
>        if (end != NULL) *end = '\0';
>        size_t jvm_path_len = strlen(jvm_path);
>        size_t file_sep_len = strlen(os::file_separator());
> @@ -120,19 +120,10 @@ index cccff7a8..7589b443 100644
>      }
>      return shared_archive_path;
>   diff --git a/hotspot/src/share/vm/utilities/ostream.cpp b/hotspot/src/share/vm/utilities/ostream.cpp
> -index 44ce683d..bc3773fe 100644
> +index 1b00f829a..4daea2b7e 100644
>   --- a/hotspot/src/share/vm/utilities/ostream.cpp
>   +++ b/hotspot/src/share/vm/utilities/ostream.cpp
> -@@ -112,7 +112,7 @@ const char* outputStream::do_vsnprintf(char* buffer, size_t buflen,
> -   }
> -   if (add_cr) {
> -     if (result != buffer) {
> --      strncpy(buffer, result, buflen);
> -+      memcpy(buffer, result, result_len);
> -       result = buffer;
> -     }
> -     buffer[result_len++] = '\n';
> -@@ -337,15 +337,19 @@ void stringStream::write(const char* s, size_t len) {
> +@@ -342,15 +342,19 @@ void stringStream::write(const char* s, size_t len) {
>          assert(rm == NULL || Thread::current()->current_resource_mark() == rm,
>                 "stringStream is re-allocated with a different ResourceMark");
>          buffer = NEW_RESOURCE_ARRAY(char, end);
> @@ -157,10 +148,10 @@ index 44ce683d..bc3773fe 100644
>      // Note that the following does not depend on write_len.
>      // This means that position and count get updated
>   diff --git a/hotspot/src/share/vm/utilities/vmError.cpp b/hotspot/src/share/vm/utilities/vmError.cpp
> -index 15f6bf48..4ab85f5d 100644
> +index ef3bb5cee..c11fef472 100644
>   --- a/hotspot/src/share/vm/utilities/vmError.cpp
>   +++ b/hotspot/src/share/vm/utilities/vmError.cpp
> -@@ -421,14 +421,7 @@ void VMError::report(outputStream* st) {
> +@@ -450,14 +450,7 @@ void VMError::report(outputStream* st) {
>    #else
>             const char *file = _filename;
>    #endif
> @@ -177,5 +168,5 @@ index 15f6bf48..4ab85f5d 100644
>             st->print(" (0x%x)", _id);
>           }
>   --
> -2.18.0
> +2.24.1
>   
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0015-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch b/recipes-core/openjdk/patches-openjdk-8/1005-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch
> similarity index 82%
> rename from recipes-core/openjdk/patches-openjdk-8/0015-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch
> rename to recipes-core/openjdk/patches-openjdk-8/1005-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch
> index fb7bb59..81177d0 100644
> --- a/recipes-core/openjdk/patches-openjdk-8/0015-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch
> +++ b/recipes-core/openjdk/patches-openjdk-8/1005-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch
> @@ -1,7 +1,8 @@
> -From f6424c46b4af08d0662eec1a5897d5502270a3b1 Mon Sep 17 00:00:00 2001
> +From bce7b39095a839b8e77fe068e87150e855224705 Mon Sep 17 00:00:00 2001
>   From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
>   Date: Mon, 13 Aug 2018 16:40:34 +0100
> -Subject: [PATCH 1/5] hotspot: fix -Wreturn-type issues introduced by 8061651
> +Subject: [PATCH 1005/1012] hotspot: fix -Wreturn-type issues introduced by
> + 8061651
>   MIME-Version: 1.0
>   Content-Type: text/plain; charset=UTF-8
>   Content-Transfer-Encoding: 8bit
> @@ -14,17 +15,19 @@ Content-Transfer-Encoding: 8bit
>   |# Parent  30520d5018b509b0ae68f5fcc9a5c540e3e5b2de
>   PR3601: Fix additional -Wreturn-type issues introduced by 8061651
>   
> -Signed-off-by: André Draszik <andre.draszik@jci.com>
>   Upstream-Status: Backport
> +
> +Signed-off-by: André Draszik <andre.draszik@jci.com>
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>   ---
> - hotspot/src/share/vm/prims/jvm.cpp | 6 +++---
> + src/share/vm/prims/jvm.cpp | 6 +++---
>    1 file changed, 3 insertions(+), 3 deletions(-)
>   
>   diff --git a/hotspot/src/share/vm/prims/jvm.cpp b/hotspot/src/share/vm/prims/jvm.cpp
> -index 07c36de8..067fd3ac 100644
> +index f43dc5ed7..8d7523c55 100644
>   --- a/hotspot/src/share/vm/prims/jvm.cpp
>   +++ b/hotspot/src/share/vm/prims/jvm.cpp
> -@@ -835,7 +835,7 @@ JVM_END
> +@@ -908,7 +908,7 @@ JVM_END
>    JVM_ENTRY(jboolean, JVM_KnownToNotExist(JNIEnv *env, jobject loader, const char *classname))
>      JVMWrapper("JVM_KnownToNotExist");
>    #if INCLUDE_CDS
> @@ -33,7 +36,7 @@ index 07c36de8..067fd3ac 100644
>    #else
>      return false;
>    #endif
> -@@ -845,7 +845,7 @@ JVM_END
> +@@ -918,7 +918,7 @@ JVM_END
>    JVM_ENTRY(jobjectArray, JVM_GetResourceLookupCacheURLs(JNIEnv *env, jobject loader))
>      JVMWrapper("JVM_GetResourceLookupCacheURLs");
>    #if INCLUDE_CDS
> @@ -42,7 +45,7 @@ index 07c36de8..067fd3ac 100644
>    #else
>      return NULL;
>    #endif
> -@@ -855,7 +855,7 @@ JVM_END
> +@@ -928,7 +928,7 @@ JVM_END
>    JVM_ENTRY(jintArray, JVM_GetResourceLookupCache(JNIEnv *env, jobject loader, const char *resource_name))
>      JVMWrapper("JVM_GetResourceLookupCache");
>    #if INCLUDE_CDS
> @@ -52,5 +55,5 @@ index 07c36de8..067fd3ac 100644
>      return NULL;
>    #endif
>   --
> -2.18.0
> +2.24.1
>   
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0016-hotspot-Zero-build-requires-disabled-warnings.patch b/recipes-core/openjdk/patches-openjdk-8/1006-hotspot-Zero-build-requires-disabled-warnings.patch
> similarity index 83%
> rename from recipes-core/openjdk/patches-openjdk-8/0016-hotspot-Zero-build-requires-disabled-warnings.patch
> rename to recipes-core/openjdk/patches-openjdk-8/1006-hotspot-Zero-build-requires-disabled-warnings.patch
> index d6bedbc..38067cb 100644
> --- a/recipes-core/openjdk/patches-openjdk-8/0016-hotspot-Zero-build-requires-disabled-warnings.patch
> +++ b/recipes-core/openjdk/patches-openjdk-8/1006-hotspot-Zero-build-requires-disabled-warnings.patch
> @@ -1,7 +1,7 @@
> -From 43c1f744e5f6171df3158baf88dd0a64c4b5e439 Mon Sep 17 00:00:00 2001
> +From 84fc6448f44cd45a5448d0e88df8ccabfa10dcc5 Mon Sep 17 00:00:00 2001
>   From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
>   Date: Mon, 13 Aug 2018 16:45:24 +0100
> -Subject: [PATCH 2/5] hotspot: Zero build requires disabled warnings
> +Subject: [PATCH 1006/1012] hotspot: Zero build requires disabled warnings
>   MIME-Version: 1.0
>   Content-Type: text/plain; charset=UTF-8
>   Content-Transfer-Encoding: 8bit
> @@ -15,17 +15,19 @@ Content-Transfer-Encoding: 8bit
>   8143245, PR3548: Zero build requires disabled warnings
>   Reviewed-by: dholmes, coleenp
>   
> -Signed-off-by: André Draszik <andre.draszik@jci.com>
>   Upstream-Status: Backport
> +
> +Signed-off-by: André Draszik <andre.draszik@jci.com>
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>   ---
> - hotspot/src/cpu/zero/vm/cppInterpreter_zero.cpp  |  2 +-
> - hotspot/src/cpu/zero/vm/interpreterRT_zero.cpp   |  4 ++--
> - .../src/os_cpu/linux_zero/vm/os_linux_zero.cpp   | 16 +++++++++++++---
> - .../os_cpu/linux_zero/vm/thread_linux_zero.hpp   |  3 ++-
> - 4 files changed, 18 insertions(+), 7 deletions(-)
> + src/cpu/zero/vm/cppInterpreter_zero.cpp        |  2 +-
> + src/cpu/zero/vm/interpreterRT_zero.cpp         |  4 ++--
> + src/os_cpu/linux_zero/vm/os_linux_zero.cpp     | 14 ++++++++++++--
> + src/os_cpu/linux_zero/vm/thread_linux_zero.hpp |  3 ++-
> + 4 files changed, 17 insertions(+), 6 deletions(-)
>   
>   diff --git a/hotspot/src/cpu/zero/vm/cppInterpreter_zero.cpp b/hotspot/src/cpu/zero/vm/cppInterpreter_zero.cpp
> -index 242ce1cf..065471af 100644
> +index 525031eb9..d47422b8c 100644
>   --- a/hotspot/src/cpu/zero/vm/cppInterpreter_zero.cpp
>   +++ b/hotspot/src/cpu/zero/vm/cppInterpreter_zero.cpp
>   @@ -100,7 +100,7 @@ intptr_t narrow(BasicType type, intptr_t result) {
> @@ -38,7 +40,7 @@ index 242ce1cf..065471af 100644
>    }
>    
>   diff --git a/hotspot/src/cpu/zero/vm/interpreterRT_zero.cpp b/hotspot/src/cpu/zero/vm/interpreterRT_zero.cpp
> -index e23e3eaa..061ed8ce 100644
> +index e23e3eaa9..061ed8ce8 100644
>   --- a/hotspot/src/cpu/zero/vm/interpreterRT_zero.cpp
>   +++ b/hotspot/src/cpu/zero/vm/interpreterRT_zero.cpp
>   @@ -1,5 +1,5 @@
> @@ -58,17 +60,9 @@ index e23e3eaa..061ed8ce 100644
>      case T_VOID:
>        ftype = &ffi_type_void;
>   diff --git a/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp b/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp
> -index 8dcf9d44..508eb172 100644
> +index d22ea1141..cbee43baa 100644
>   --- a/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp
>   +++ b/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp
> -@@ -1,6 +1,6 @@
> - /*
> -  * Copyright (c) 2003, 2013, Oracle and/or its affiliates. All rights reserved.
> -- * Copyright 2007, 2008, 2009, 2010 Red Hat, Inc.
> -+ * Copyright 2016 Red Hat, Inc.
> -  * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
> -  *
> -  * This code is free software; you can redistribute it and/or modify it
>   @@ -61,6 +61,7 @@ address os::current_stack_pointer() {
>    
>    frame os::get_sender_for_C_frame(frame* fr) {
> @@ -125,7 +119,7 @@ index 8dcf9d44..508eb172 100644
>    
>    void os::Linux::set_fpu_control_word(int fpu) {
>   diff --git a/hotspot/src/os_cpu/linux_zero/vm/thread_linux_zero.hpp b/hotspot/src/os_cpu/linux_zero/vm/thread_linux_zero.hpp
> -index 39f77f85..b9c73dc4 100644
> +index 39f77f858..b9c73dc48 100644
>   --- a/hotspot/src/os_cpu/linux_zero/vm/thread_linux_zero.hpp
>   +++ b/hotspot/src/os_cpu/linux_zero/vm/thread_linux_zero.hpp
>   @@ -1,5 +1,5 @@
> @@ -144,5 +138,5 @@ index 39f77f85..b9c73dc4 100644
>    
>      // These routines are only used on cpu architectures that
>   --
> -2.18.0
> +2.24.1
>   
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0017-hotspot-Missing-return-statement-in-__sync_val_compa.patch b/recipes-core/openjdk/patches-openjdk-8/1007-hotspot-Missing-return-statement-in-__sync_val_compa.patch
> similarity index 80%
> rename from recipes-core/openjdk/patches-openjdk-8/0017-hotspot-Missing-return-statement-in-__sync_val_compa.patch
> rename to recipes-core/openjdk/patches-openjdk-8/1007-hotspot-Missing-return-statement-in-__sync_val_compa.patch
> index 001e905..6692200 100644
> --- a/recipes-core/openjdk/patches-openjdk-8/0017-hotspot-Missing-return-statement-in-__sync_val_compa.patch
> +++ b/recipes-core/openjdk/patches-openjdk-8/1007-hotspot-Missing-return-statement-in-__sync_val_compa.patch
> @@ -1,7 +1,7 @@
> -From 6e1d92639787ac8f506f810776a3f1c35f2cd070 Mon Sep 17 00:00:00 2001
> +From 996a1e3d53773f41e9098117a69a060722972269 Mon Sep 17 00:00:00 2001
>   From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
>   Date: Mon, 13 Aug 2018 16:46:33 +0100
> -Subject: [PATCH 3/5] hotspot: Missing return statement in
> +Subject: [PATCH 1007/1012] hotspot: Missing return statement in
>    __sync_val_compare_and_swap_8
>   MIME-Version: 1.0
>   Content-Type: text/plain; charset=UTF-8
> @@ -17,15 +17,17 @@ Content-Transfer-Encoding: 8bit
>   Summary: Fix issue discovered by -Wreturn-type on systems without LP64.
>   Reviewed-by: aph
>   
> -Signed-off-by: André Draszik <andre.draszik@jci.com>
>   Upstream-Status: Backport
> +
> +Signed-off-by: André Draszik <andre.draszik@jci.com>
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>   ---
> - hotspot/src/os_cpu/bsd_zero/vm/os_bsd_zero.cpp     | 1 +
> - hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp | 1 +
> + src/os_cpu/bsd_zero/vm/os_bsd_zero.cpp     | 1 +
> + src/os_cpu/linux_zero/vm/os_linux_zero.cpp | 1 +
>    2 files changed, 2 insertions(+)
>   
>   diff --git a/hotspot/src/os_cpu/bsd_zero/vm/os_bsd_zero.cpp b/hotspot/src/os_cpu/bsd_zero/vm/os_bsd_zero.cpp
> -index c857b552..4aaf78b1 100644
> +index c857b5526..4aaf78b1d 100644
>   --- a/hotspot/src/os_cpu/bsd_zero/vm/os_bsd_zero.cpp
>   +++ b/hotspot/src/os_cpu/bsd_zero/vm/os_bsd_zero.cpp
>   @@ -457,6 +457,7 @@ extern "C" {
> @@ -37,7 +39,7 @@ index c857b552..4aaf78b1 100644
>    };
>    #endif // !_LP64
>   diff --git a/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp b/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp
> -index 508eb172..bb8fa1f1 100644
> +index cbee43baa..136d4d3de 100644
>   --- a/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp
>   +++ b/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp
>   @@ -498,6 +498,7 @@ extern "C" {
> @@ -49,5 +51,5 @@ index 508eb172..bb8fa1f1 100644
>    };
>    #endif // !_LP64
>   --
> -2.18.0
> +2.24.1
>   
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0019-hotspot-Turn-on-the-Wreturn-type-warning.patch b/recipes-core/openjdk/patches-openjdk-8/1008-hotspot-Turn-on-the-Wreturn-type-warning.patch
> similarity index 86%
> rename from recipes-core/openjdk/patches-openjdk-8/0019-hotspot-Turn-on-the-Wreturn-type-warning.patch
> rename to recipes-core/openjdk/patches-openjdk-8/1008-hotspot-Turn-on-the-Wreturn-type-warning.patch
> index 0156978..10dd0f7 100644
> --- a/recipes-core/openjdk/patches-openjdk-8/0019-hotspot-Turn-on-the-Wreturn-type-warning.patch
> +++ b/recipes-core/openjdk/patches-openjdk-8/1008-hotspot-Turn-on-the-Wreturn-type-warning.patch
> @@ -1,7 +1,7 @@
> -From cc0d371f17c0ab060eb1e6b42d4bf053a2cbc3ba Mon Sep 17 00:00:00 2001
> +From 2cce90259f9de7b5fba7f3380cdc90b3a586aa75 Mon Sep 17 00:00:00 2001
>   From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
>   Date: Mon, 13 Aug 2018 16:48:32 +0100
> -Subject: [PATCH 5/5] hotspot: Turn on the -Wreturn-type warning
> +Subject: [PATCH 1008/1012] hotspot: Turn on the -Wreturn-type warning
>   MIME-Version: 1.0
>   Content-Type: text/plain; charset=UTF-8
>   Content-Transfer-Encoding: 8bit
> @@ -15,29 +15,31 @@ Content-Transfer-Encoding: 8bit
>   8062808, PR3548: Turn on the -Wreturn-type warning
>   Reviewed-by: mgerdin, tschatzl, coleenp, jrose, kbarrett
>   
> -Signed-off-by: André Draszik <andre.draszik@jci.com>
>   Upstream-Status: Backport
> +
> +Signed-off-by: André Draszik <andre.draszik@jci.com>
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>   ---
> - hotspot/make/linux/makefiles/gcc.make               | 2 +-
> - hotspot/src/cpu/x86/vm/x86_32.ad                    | 1 +
> - hotspot/src/os_cpu/linux_x86/vm/os_linux_x86.cpp    | 1 +
> - hotspot/src/share/vm/classfile/defaultMethods.cpp   | 4 ++--
> - hotspot/src/share/vm/classfile/symbolTable.cpp      | 4 ++--
> - hotspot/src/share/vm/classfile/systemDictionary.cpp | 6 +++---
> - hotspot/src/share/vm/memory/heapInspection.hpp      | 2 +-
> - hotspot/src/share/vm/memory/metaspaceShared.hpp     | 2 +-
> - hotspot/src/share/vm/oops/constantPool.hpp          | 2 +-
> - hotspot/src/share/vm/prims/jvm.cpp                  | 2 +-
> - hotspot/src/share/vm/runtime/reflection.cpp         | 2 +-
> - hotspot/src/share/vm/runtime/sharedRuntime.cpp      | 2 +-
> - hotspot/src/share/vm/services/memTracker.hpp        | 2 +-
> + make/linux/makefiles/gcc.make               | 2 +-
> + src/cpu/x86/vm/x86_32.ad                    | 1 +
> + src/os_cpu/linux_x86/vm/os_linux_x86.cpp    | 1 +
> + src/share/vm/classfile/defaultMethods.cpp   | 4 ++--
> + src/share/vm/classfile/symbolTable.cpp      | 4 ++--
> + src/share/vm/classfile/systemDictionary.cpp | 6 +++---
> + src/share/vm/memory/heapInspection.hpp      | 2 +-
> + src/share/vm/memory/metaspaceShared.hpp     | 2 +-
> + src/share/vm/oops/constantPool.hpp          | 2 +-
> + src/share/vm/prims/jvm.cpp                  | 2 +-
> + src/share/vm/runtime/reflection.cpp         | 2 +-
> + src/share/vm/runtime/sharedRuntime.cpp      | 2 +-
> + src/share/vm/services/memTracker.hpp        | 2 +-
>    13 files changed, 17 insertions(+), 15 deletions(-)
>   
>   diff --git a/hotspot/make/linux/makefiles/gcc.make b/hotspot/make/linux/makefiles/gcc.make
> -index 272afcea..157afff2 100644
> +index 36b3c8ba9..cd9511e50 100644
>   --- a/hotspot/make/linux/makefiles/gcc.make
>   +++ b/hotspot/make/linux/makefiles/gcc.make
> -@@ -207,7 +207,7 @@ ifeq ($(USE_CLANG), true)
> +@@ -211,7 +211,7 @@ ifeq ($(USE_CLANG), true)
>      WARNINGS_ARE_ERRORS += -Wno-return-type -Wno-empty-body
>    endif
>    
> @@ -47,7 +49,7 @@ index 272afcea..157afff2 100644
>    ifeq ($(USE_CLANG),)
>      # Since GCC 4.3, -Wconversion has changed its meanings to warn these implicit
>   diff --git a/hotspot/src/cpu/x86/vm/x86_32.ad b/hotspot/src/cpu/x86/vm/x86_32.ad
> -index f42d1a28..c8f4ee16 100644
> +index f42d1a288..c8f4ee161 100644
>   --- a/hotspot/src/cpu/x86/vm/x86_32.ad
>   +++ b/hotspot/src/cpu/x86/vm/x86_32.ad
>   @@ -1250,6 +1250,7 @@ uint MachSpillCopyNode::implementation( CodeBuffer *cbuf, PhaseRegAlloc *ra_, bo
> @@ -59,7 +61,7 @@ index f42d1a28..c8f4ee16 100644
>    
>    #ifndef PRODUCT
>   diff --git a/hotspot/src/os_cpu/linux_x86/vm/os_linux_x86.cpp b/hotspot/src/os_cpu/linux_x86/vm/os_linux_x86.cpp
> -index fb96738a..4cdeb372 100644
> +index 1a7375afc..fbf51b040 100644
>   --- a/hotspot/src/os_cpu/linux_x86/vm/os_linux_x86.cpp
>   +++ b/hotspot/src/os_cpu/linux_x86/vm/os_linux_x86.cpp
>   @@ -541,6 +541,7 @@ JVM_handle_linux_signal(int sig,
> @@ -71,7 +73,7 @@ index fb96738a..4cdeb372 100644
>    
>    void os::Linux::init_thread_fpu_state(void) {
>   diff --git a/hotspot/src/share/vm/classfile/defaultMethods.cpp b/hotspot/src/share/vm/classfile/defaultMethods.cpp
> -index 0e3d5d7b..d3df1d15 100644
> +index 4b4b4e250..196622aed 100644
>   --- a/hotspot/src/share/vm/classfile/defaultMethods.cpp
>   +++ b/hotspot/src/share/vm/classfile/defaultMethods.cpp
>   @@ -506,7 +506,7 @@ Symbol* MethodFamily::generate_method_message(Symbol *klass_name, Method* method
> @@ -93,7 +95,7 @@ index 0e3d5d7b..d3df1d15 100644
>    
>    
>   diff --git a/hotspot/src/share/vm/classfile/symbolTable.cpp b/hotspot/src/share/vm/classfile/symbolTable.cpp
> -index ec97077b..2621a7d6 100644
> +index ec97077b7..2621a7d62 100644
>   --- a/hotspot/src/share/vm/classfile/symbolTable.cpp
>   +++ b/hotspot/src/share/vm/classfile/symbolTable.cpp
>   @@ -249,7 +249,7 @@ Symbol* SymbolTable::lookup(const char* name, int len, TRAPS) {
> @@ -115,7 +117,7 @@ index ec97077b..2621a7d6 100644
>    
>    Symbol* SymbolTable::lookup_only(const char* name, int len,
>   diff --git a/hotspot/src/share/vm/classfile/systemDictionary.cpp b/hotspot/src/share/vm/classfile/systemDictionary.cpp
> -index 8d2e7f49..62bdba3e 100644
> +index da2717d36..5253afc22 100644
>   --- a/hotspot/src/share/vm/classfile/systemDictionary.cpp
>   +++ b/hotspot/src/share/vm/classfile/systemDictionary.cpp
>   @@ -229,15 +229,15 @@ Klass* SystemDictionary::resolve_or_null(Symbol* class_name, Handle class_loader
> @@ -138,7 +140,7 @@ index 8d2e7f49..62bdba3e 100644
>    }
>    
>   diff --git a/hotspot/src/share/vm/memory/heapInspection.hpp b/hotspot/src/share/vm/memory/heapInspection.hpp
> -index 09ee6602..c5fec15c 100644
> +index 09ee6602e..c5fec15c3 100644
>   --- a/hotspot/src/share/vm/memory/heapInspection.hpp
>   +++ b/hotspot/src/share/vm/memory/heapInspection.hpp
>   @@ -367,7 +367,7 @@ class HeapInspection : public StackObj {
> @@ -151,7 +153,7 @@ index 09ee6602..c5fec15c 100644
>     private:
>      void iterate_over_heap(KlassInfoTable* cit, BoolObjectClosure* filter = NULL);
>   diff --git a/hotspot/src/share/vm/memory/metaspaceShared.hpp b/hotspot/src/share/vm/memory/metaspaceShared.hpp
> -index 2f3abae6..d58ebecb 100644
> +index 2f3abae6a..d58ebecb2 100644
>   --- a/hotspot/src/share/vm/memory/metaspaceShared.hpp
>   +++ b/hotspot/src/share/vm/memory/metaspaceShared.hpp
>   @@ -93,7 +93,7 @@ class MetaspaceShared : AllStatic {
> @@ -164,10 +166,10 @@ index 2f3abae6..d58ebecb 100644
>      static ReservedSpace* shared_rs() {
>        CDS_ONLY(return _shared_rs);
>   diff --git a/hotspot/src/share/vm/oops/constantPool.hpp b/hotspot/src/share/vm/oops/constantPool.hpp
> -index f170decc..a1e168b2 100644
> +index 0698eb40e..354293924 100644
>   --- a/hotspot/src/share/vm/oops/constantPool.hpp
>   +++ b/hotspot/src/share/vm/oops/constantPool.hpp
> -@@ -349,7 +349,7 @@ class ConstantPool : public Metadata {
> +@@ -350,7 +350,7 @@ class ConstantPool : public Metadata {
>    
>      Klass* klass_at(int which, TRAPS) {
>        constantPoolHandle h_this(THREAD, this);
> @@ -177,10 +179,10 @@ index f170decc..a1e168b2 100644
>    
>      Symbol* klass_name_at(int which);  // Returns the name, w/o resolving.
>   diff --git a/hotspot/src/share/vm/prims/jvm.cpp b/hotspot/src/share/vm/prims/jvm.cpp
> -index 067fd3ac..b9e5b322 100644
> +index 8d7523c55..4034a8589 100644
>   --- a/hotspot/src/share/vm/prims/jvm.cpp
>   +++ b/hotspot/src/share/vm/prims/jvm.cpp
> -@@ -4280,7 +4280,7 @@ JVM_ENTRY(jlong,JVM_DTraceActivate(
> +@@ -4343,7 +4343,7 @@ JVM_ENTRY(jlong,JVM_DTraceActivate(
>        JVM_DTraceProvider* providers))
>      JVMWrapper("JVM_DTraceActivate");
>      return DTraceJSDT::activate(
> @@ -190,7 +192,7 @@ index 067fd3ac..b9e5b322 100644
>    
>    JVM_ENTRY(jboolean,JVM_DTraceIsProbeEnabled(JNIEnv* env, jmethodID method))
>   diff --git a/hotspot/src/share/vm/runtime/reflection.cpp b/hotspot/src/share/vm/runtime/reflection.cpp
> -index e2f282ee..679e1775 100644
> +index 4b39d8ccb..9cd7b0dcb 100644
>   --- a/hotspot/src/share/vm/runtime/reflection.cpp
>   +++ b/hotspot/src/share/vm/runtime/reflection.cpp
>   @@ -1093,7 +1093,7 @@ oop Reflection::invoke(instanceKlassHandle klass, methodHandle reflected_method,
> @@ -203,10 +205,10 @@ index e2f282ee..679e1775 100644
>    }
>    
>   diff --git a/hotspot/src/share/vm/runtime/sharedRuntime.cpp b/hotspot/src/share/vm/runtime/sharedRuntime.cpp
> -index 8ffa8ab3..219bcd5c 100644
> +index d5bea29c3..50578ad63 100644
>   --- a/hotspot/src/share/vm/runtime/sharedRuntime.cpp
>   +++ b/hotspot/src/share/vm/runtime/sharedRuntime.cpp
> -@@ -1038,7 +1038,7 @@ Handle SharedRuntime::find_callee_info(JavaThread* thread, Bytecodes::Code& bc,
> +@@ -1041,7 +1041,7 @@ Handle SharedRuntime::find_callee_info(JavaThread* thread, Bytecodes::Code& bc,
>      // last java frame on stack (which includes native call frames)
>      vframeStream vfst(thread, true);  // Do not skip and javaCalls
>    
> @@ -216,7 +218,7 @@ index 8ffa8ab3..219bcd5c 100644
>    
>    
>   diff --git a/hotspot/src/share/vm/services/memTracker.hpp b/hotspot/src/share/vm/services/memTracker.hpp
> -index 38a027ea..13436a4b 100644
> +index 7ad2b71f4..182084373 100644
>   --- a/hotspot/src/share/vm/services/memTracker.hpp
>   +++ b/hotspot/src/share/vm/services/memTracker.hpp
>   @@ -64,7 +64,7 @@ class MemTracker : AllStatic {
> @@ -229,5 +231,5 @@ index 38a027ea..13436a4b 100644
>      static inline void record_thread_stack(void* addr, size_t size) { }
>      static inline void release_thread_stack(void* addr, size_t size) { }
>   --
> -2.18.0
> +2.24.1
>   
> diff --git a/recipes-core/openjdk/patches-openjdk-8/1009-hotspot-handle-format-error-for-GCC-7.patch b/recipes-core/openjdk/patches-openjdk-8/1009-hotspot-handle-format-error-for-GCC-7.patch
> new file mode 100644
> index 0000000..ee950cd
> --- /dev/null
> +++ b/recipes-core/openjdk/patches-openjdk-8/1009-hotspot-handle-format-error-for-GCC-7.patch
> @@ -0,0 +1,34 @@
> +From d085dcce6f8700fd8ddda475357496ea6da323dc Mon Sep 17 00:00:00 2001
> +From: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
> +Date: Fri, 21 Sep 2018 10:44:06 +0200
> +Subject: [PATCH 1009/1012] hotspot: handle format error for GCC >= 7
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> +---
> + src/share/vm/adlc/output_c.cpp | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/hotspot/src/share/vm/adlc/output_c.cpp b/hotspot/src/share/vm/adlc/output_c.cpp
> +index b3766636d..eba08d2f0 100644
> +--- a/hotspot/src/share/vm/adlc/output_c.cpp
> ++++ b/hotspot/src/share/vm/adlc/output_c.cpp
> +@@ -436,9 +436,11 @@ static int pipeline_res_mask_initializer(
> +   for (i = maxcycleused; i > 0; i /= 10)
> +     cycledigit++;
> +
> +-  int maskdigit = 0;
> +-  for (i = rescount; i > 0; i /= 10)
> ++  int maskdigit = 1;
> ++  for (i = rescount / 10; i > 0; i /= 10)
> +     maskdigit++;
> ++  if (maskdigit > 10)
> ++    maskdigit = 10;
> +
> +   static const char* pipeline_use_cycle_mask = "Pipeline_Use_Cycle_Mask";
> +   static const char* pipeline_use_element    = "Pipeline_Use_Element";
> +--
> +2.24.1
> +
> diff --git a/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-adlc-flags.patch b/recipes-core/openjdk/patches-openjdk-8/1010-hotspot-fix-adlc-flags.patch
> similarity index 55%
> rename from recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-adlc-flags.patch
> rename to recipes-core/openjdk/patches-openjdk-8/1010-hotspot-fix-adlc-flags.patch
> index fa26d04..03f8660 100644
> --- a/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-adlc-flags.patch
> +++ b/recipes-core/openjdk/patches-openjdk-8/1010-hotspot-fix-adlc-flags.patch
> @@ -1,22 +1,30 @@
> +From 89408e465d92657de8c54d4622f1810c28c3d700 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Erkka=20K=C3=A4=C3=A4ri=C3=A4?= <erkka.kaaria@intel.com>
> +Date: Thu, 2 Jan 2020 10:19:29 +0100
> +Subject: [PATCH 1010/1012] hotspot: fix adlc flags
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
>   adlc is built using the native toolchain, not the crosscompiler. It however
>   was incorrectly using flags meant for the crosscompiler.
>   
> -Signed-off-by: Erkka Kääriä <erkka.kaaria@intel.com>
> -
>   Upstream-Status: Inappropriate [Yocto-specific fixes]
>   
> +Signed-off-by: Erkka Kääriä <erkka.kaaria@intel.com>
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>   ---
> - hotspot/make/linux/makefiles/adlc.make | 10 ++++++++++
> + make/linux/makefiles/adlc.make | 10 ++++++++++
>    1 file changed, 10 insertions(+)
>   
> -diff --git hotspot/make/linux/makefiles/adlc.make hotspot/make/linux/makefiles/adlc.make
> -index 8a86691..2789c03 100644
> ---- hotspot/make/linux/makefiles/adlc.make
> -+++ hotspot/make/linux/makefiles/adlc.make
> +diff --git a/hotspot/make/linux/makefiles/adlc.make b/hotspot/make/linux/makefiles/adlc.make
> +index 92b8b9b39..ae0aa0082 100644
> +--- a/hotspot/make/linux/makefiles/adlc.make
> ++++ b/hotspot/make/linux/makefiles/adlc.make
>   @@ -28,6 +28,16 @@
> -
> +
>    include $(GAMMADIR)/make/$(Platform_os_family)/makefiles/rules.make
> -
> +
>   +# Yocto specific fix - remove target machine flags and replace them with
>   +# build machine flags, as this part is built using the native toolchain
>   +CXXFLAGS:=$(filter-out $(TARGET_CXXFLAGS),$(CXXFLAGS))
> @@ -28,7 +36,8 @@ index 8a86691..2789c03 100644
>   +
>   +
>    # #########################################################################
> -
> +
>    # OUTDIR must be the same as AD_Dir = $(GENERATED)/adfiles in top.make:
> ---
> -1.9.1
> +--
> +2.24.1
> +
> diff --git a/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-common.patch b/recipes-core/openjdk/patches-openjdk-8/1011-hotspot-fix-shark-build-common.patch
> similarity index 65%
> rename from recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-common.patch
> rename to recipes-core/openjdk/patches-openjdk-8/1011-hotspot-fix-shark-build-common.patch
> index ece7f14..8fe5489 100644
> --- a/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-common.patch
> +++ b/recipes-core/openjdk/patches-openjdk-8/1011-hotspot-fix-shark-build-common.patch
> @@ -1,6 +1,31 @@
> ---- hotspot/make/Makefile.orig
> -+++ hotspot/make/Makefile
> -@@ -525,7 +525,7 @@ $(EXPORT_INCLUDE_DIR)/%:			$(SHARK_BUILD
> +From 1015cc718ba25cabf613b96fd58baa8dfb8492fe Mon Sep 17 00:00:00 2001
> +From: Jens Rehsack <rehsack@gmail.com>
> +Date: Thu, 2 Jan 2020 10:22:19 +0100
> +Subject: [PATCH 1011/1012] hotspot: fix shark build (common)
> +
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> +---
> + make/Makefile                               |  2 +-
> + src/cpu/zero/vm/interpreter_zero.cpp        |  2 +-
> + src/share/vm/ci/ciTypeFlow.cpp              |  4 ++
> + src/share/vm/classfile/systemDictionary.cpp |  4 ++
> + src/share/vm/runtime/handles.inline.hpp     |  8 +++-
> + src/share/vm/shark/llvmHeaders.hpp          |  4 ++
> + src/share/vm/shark/sharkCompiler.cpp        | 39 ++++++++++++++++---
> + src/share/vm/shark/sharkCompiler.hpp        |  2 +
> + src/share/vm/shark/sharkContext.cpp         |  9 ++++-
> + src/share/vm/shark/sharkContext.hpp         | 43 ++++++++++++++++++++-
> + src/share/vm/shark/sharkEntry.hpp           |  1 +
> + src/share/vm/shark/sharkIntrinsics.cpp      |  4 ++
> + src/share/vm/shark/sharkRuntime.cpp         |  1 +
> + src/share/vm/shark/sharkTopLevelBlock.cpp   | 12 ++++++
> + 14 files changed, 123 insertions(+), 12 deletions(-)
> +
> +diff --git a/hotspot/make/Makefile b/hotspot/make/Makefile
> +index 5765f1e36..f8ff9ecd9 100644
> +--- a/hotspot/make/Makefile
> ++++ b/hotspot/make/Makefile
> +@@ -525,7 +525,7 @@ $(EXPORT_INCLUDE_DIR)/%:			$(SHARK_BUILD_DIR)/../generated/jvmtifiles/%
>    # Unix
>    $(EXPORT_JRE_LIB_ARCH_DIR)/%.$(LIBRARY_SUFFIX): $(SHARK_BUILD_DIR)/%.$(LIBRARY_SUFFIX)
>    	$(install-file)
> @@ -9,8 +34,23 @@
>    	$(install-file)
>    $(EXPORT_JRE_LIB_ARCH_DIR)/%.diz:		$(SHARK_BUILD_DIR)/%.diz
>    	$(install-file)
> ---- hotspot/src/share/vm/ci/ciTypeFlow.cpp.orig
> -+++ hotspot/src/share/vm/ci/ciTypeFlow.cpp
> +diff --git a/hotspot/src/cpu/zero/vm/interpreter_zero.cpp b/hotspot/src/cpu/zero/vm/interpreter_zero.cpp
> +index 7172443db..5a4b4ad56 100644
> +--- a/hotspot/src/cpu/zero/vm/interpreter_zero.cpp
> ++++ b/hotspot/src/cpu/zero/vm/interpreter_zero.cpp
> +@@ -49,7 +49,7 @@
> + #ifdef COMPILER1
> + #include "c1/c1_Runtime1.hpp"
> + #endif
> +-#ifdef CC_INTERP
> ++#if defined(CC_INTERP) || defined(SHARK)
> + #include "interpreter/cppInterpreter.hpp"
> + #endif
> +
> +diff --git a/hotspot/src/share/vm/ci/ciTypeFlow.cpp b/hotspot/src/share/vm/ci/ciTypeFlow.cpp
> +index 4707cc96e..a2b297ca0 100644
> +--- a/hotspot/src/share/vm/ci/ciTypeFlow.cpp
> ++++ b/hotspot/src/share/vm/ci/ciTypeFlow.cpp
>   @@ -35,8 +35,10 @@
>    #include "interpreter/bytecode.hpp"
>    #include "interpreter/bytecodes.hpp"
> @@ -22,7 +62,7 @@
>    #include "runtime/deoptimization.hpp"
>    #include "utilities/growableArray.hpp"
>    
> -@@ -2648,6 +2650,7 @@ void ciTypeFlow::df_flow_types(Block* st
> +@@ -2648,6 +2650,7 @@ void ciTypeFlow::df_flow_types(Block* start,
>          assert (!blk->has_pre_order(), "");
>          blk->set_next_pre_order();
>    
> @@ -30,7 +70,7 @@
>          if (_next_pre_order >= (int)Compile::current()->max_node_limit() / 2) {
>            // Too many basic blocks.  Bail out.
>            // This can happen when try/finally constructs are nested to depth N,
> -@@ -2657,6 +2660,7 @@ void ciTypeFlow::df_flow_types(Block* st
> +@@ -2657,6 +2660,7 @@ void ciTypeFlow::df_flow_types(Block* start,
>            record_failure("too many basic blocks");
>            return;
>          }
> @@ -38,9 +78,11 @@
>          if (do_flow) {
>            flow_block(blk, temp_vector, temp_set);
>            if (failing()) return; // Watch for bailouts.
> ---- hotspot/src/share/vm/classfile/systemDictionary.cpp.orig
> -+++ hotspot/src/share/vm/classfile/systemDictionary.cpp
> -@@ -2289,6 +2289,7 @@ methodHandle SystemDictionary::find_meth
> +diff --git a/hotspot/src/share/vm/classfile/systemDictionary.cpp b/hotspot/src/share/vm/classfile/systemDictionary.cpp
> +index 5253afc22..ecb30cdef 100644
> +--- a/hotspot/src/share/vm/classfile/systemDictionary.cpp
> ++++ b/hotspot/src/share/vm/classfile/systemDictionary.cpp
> +@@ -2300,6 +2300,7 @@ methodHandle SystemDictionary::find_method_handle_intrinsic(vmIntrinsics::ID iid
>        spe = NULL;
>        // Must create lots of stuff here, but outside of the SystemDictionary lock.
>        m = Method::make_method_handle_intrinsic(iid, signature, CHECK_(empty));
> @@ -48,7 +90,7 @@
>        if (!Arguments::is_interpreter_only()) {
>          // Generate a compiled form of the MH intrinsic.
>          AdapterHandlerLibrary::create_native_wrapper(m);
> -@@ -2298,6 +2299,7 @@ methodHandle SystemDictionary::find_meth
> +@@ -2309,6 +2310,7 @@ methodHandle SystemDictionary::find_method_handle_intrinsic(vmIntrinsics::ID iid
>                       "out of space in CodeCache for method handle intrinsic", empty);
>          }
>        }
> @@ -56,7 +98,7 @@
>        // Now grab the lock.  We might have to throw away the new method,
>        // if a racing thread has managed to install one at the same time.
>        {
> -@@ -2311,9 +2313,11 @@ methodHandle SystemDictionary::find_meth
> +@@ -2322,9 +2324,11 @@ methodHandle SystemDictionary::find_method_handle_intrinsic(vmIntrinsics::ID iid
>      }
>    
>      assert(spe != NULL && spe->method() != NULL, "");
> @@ -68,9 +110,11 @@
>      return spe->method();
>    }
>    
> ---- hotspot/src/share/vm/runtime/handles.inline.hpp.orig
> -+++ hotspot/src/share/vm/runtime/handles.inline.hpp
> -@@ -51,6 +51,12 @@ inline Handle::Handle(Thread* thread, oo
> +diff --git a/hotspot/src/share/vm/runtime/handles.inline.hpp b/hotspot/src/share/vm/runtime/handles.inline.hpp
> +index 761596a50..ca950c154 100644
> +--- a/hotspot/src/share/vm/runtime/handles.inline.hpp
> ++++ b/hotspot/src/share/vm/runtime/handles.inline.hpp
> +@@ -51,6 +51,12 @@ inline Handle::Handle(Thread* thread, oop obj) {
>    }
>    #endif // ASSERT
>    
> @@ -83,7 +127,7 @@
>    // Constructors for metadata handles
>    #define DEF_METADATA_HANDLE_FN(name, type) \
>    inline name##Handle::name##Handle(type* obj) : _value(obj), _thread(NULL) {       \
> -@@ -79,7 +85,7 @@ inline name##Handle::name##Handle(const
> +@@ -79,7 +85,7 @@ inline name##Handle::name##Handle(const name##Handle &h) {             \
>        } else {                                                           \
>          _thread = Thread::current();                                     \
>        }                                                                  \
> @@ -92,18 +136,10 @@
>        _thread->metadata_handles()->push((Metadata*)_value);              \
>      } else {                                                             \
>        _thread = NULL;                                                    \
> ---- hotspot/src/share/vm/shark/sharkEntry.hpp.orig
> -+++ hotspot/src/share/vm/shark/sharkEntry.hpp
> -@@ -27,6 +27,7 @@
> - #define SHARE_VM_SHARK_SHARKENTRY_HPP
> -
> - #include "shark/llvmHeaders.hpp"
> -+#include "entry_zero.hpp"
> -
> - class SharkContext;
> -
> ---- hotspot/src/share/vm/shark/llvmHeaders.hpp.orig
> -+++ hotspot/src/share/vm/shark/llvmHeaders.hpp
> +diff --git a/hotspot/src/share/vm/shark/llvmHeaders.hpp b/hotspot/src/share/vm/shark/llvmHeaders.hpp
> +index 05ef7fea1..4d40ae3dd 100644
> +--- a/hotspot/src/share/vm/shark/llvmHeaders.hpp
> ++++ b/hotspot/src/share/vm/shark/llvmHeaders.hpp
>   @@ -35,7 +35,11 @@
>      #undef DEBUG
>    #endif
> @@ -116,114 +152,10 @@
>    #include <llvm/ExecutionEngine/ExecutionEngine.h>
>    
>    // includes specific to each version
> ---- common/autoconf/libraries.m4.orig
> -+++ common/autoconf/libraries.m4
> -@@ -834,8 +834,9 @@ AC_DEFUN_ONCE([LIB_SETUP_STATIC_LINK_LIB
> -         fi
> -       fi
> -     done
> --    llvm_version=$("${LLVM_CONFIG}" --version | sed 's/\.//; s/svn.*//')
> -+    llvm_version=$("${LLVM_CONFIG}" --version | sed 's/\.//; s/svn.*//; s/\..*$//')
> -     LLVM_CFLAGS="${LLVM_CFLAGS} -DSHARK_LLVM_VERSION=${llvm_version}"
> -+    AS_IF([test $llvm_version -ge 34], [LLVM_CFLAGS="${LLVM_CFLAGS} -std=gnu++11"])
> -
> -     unset LLVM_LDFLAGS
> -     for flag in $("${LLVM_CONFIG}" --ldflags); do
> -@@ -848,7 +849,7 @@ AC_DEFUN_ONCE([LIB_SETUP_STATIC_LINK_LIB
> -     done
> -
> -     unset LLVM_LIBS
> --    for flag in $("${LLVM_CONFIG}" --libs ${llvm_components}); do
> -+    for flag in $("${LLVM_CONFIG}" --libs --system-libs ${llvm_components}); do
> -       if echo "${flag}" | grep -q '^-l'; then
> -         if test "${LLVM_LIBS}" != ""; then
> -           LLVM_LIBS="${LLVM_LIBS} "
> ---- hotspot/src/share/vm/shark/sharkIntrinsics.cpp.orig
> -+++ hotspot/src/share/vm/shark/sharkIntrinsics.cpp
> -@@ -265,7 +265,11 @@ void SharkIntrinsics::do_Unsafe_compareA
> -     "addr");
> -
> -   // Perform the operation
> -+#if SHARK_LLVM_VERSION <= 34
> -   Value *result = builder()->CreateAtomicCmpXchg(addr, e, x, llvm::SequentiallyConsistent);
> -+#else
> -+  Value *result = builder()->CreateAtomicCmpXchg(addr, e, x, llvm::SequentiallyConsistent, llvm::SequentiallyConsistent);
> -+  #endif
> -   // Push the result
> -   state()->push(
> -     SharkValue::create_jint(
> ---- hotspot/src/share/vm/shark/sharkRuntime.cpp.orig
> -+++ hotspot/src/share/vm/shark/sharkRuntime.cpp
> -@@ -32,6 +32,7 @@
> - #ifdef TARGET_ARCH_zero
> - # include "stack_zero.inline.hpp"
> - #endif
> -+#include "memory/oopFactory.hpp"
> -
> - using namespace llvm;
> -
> ---- hotspot/src/share/vm/shark/sharkTopLevelBlock.cpp.orig
> -+++ hotspot/src/share/vm/shark/sharkTopLevelBlock.cpp
> -@@ -1732,7 +1732,11 @@ void SharkTopLevelBlock::do_new() {
> -     heap_object = builder()->CreateIntToPtr(
> -       old_top, SharkType::oop_type(), "heap_object");
> -
> -+#if SHARK_LLVM_VERSION <= 34
> -     Value *check = builder()->CreateAtomicCmpXchg(top_addr, old_top, new_top, llvm::SequentiallyConsistent);
> -+#else
> -+    Value *check = builder()->CreateAtomicCmpXchg(top_addr, old_top, new_top, llvm::SequentiallyConsistent, llvm::SequentiallyConsistent);
> -+#endif
> -     builder()->CreateCondBr(
> -       builder()->CreateICmpEQ(old_top, check),
> -       initialize, retry);
> -@@ -1933,7 +1937,11 @@ void SharkTopLevelBlock::acquire_lock(Va
> -
> -   Value *lock = builder()->CreatePtrToInt(
> -     monitor_header_addr, SharkType::intptr_type());
> -+#if SHARK_LLVM_VERSION <= 34
> -   Value *check = builder()->CreateAtomicCmpXchg(mark_addr, disp, lock, llvm::Acquire);
> -+#else
> -+  Value *check = builder()->CreateAtomicCmpXchg(mark_addr, disp, lock, llvm::Acquire, llvm::Acquire);
> -+#endif
> -   builder()->CreateCondBr(
> -     builder()->CreateICmpEQ(disp, check),
> -     acquired_fast, try_recursive);
> -@@ -2018,7 +2026,11 @@ void SharkTopLevelBlock::release_lock(in
> -     PointerType::getUnqual(SharkType::intptr_type()),
> -     "mark_addr");
> -
> -+#if SHARK_LLVM_VERSION <= 34
> -   Value *check = builder()->CreateAtomicCmpXchg(mark_addr, lock, disp, llvm::Release);
> -+#else
> -+  Value *check = builder()->CreateAtomicCmpXchg(mark_addr, lock, disp, llvm::Release, llvm::Monotonic);
> -+#endif
> -   builder()->CreateCondBr(
> -     builder()->CreateICmpEQ(lock, check),
> -     released_fast, slow_path);
> ---- hotspot/src/cpu/zero/vm/interpreter_zero.cpp.orig
> -+++ hotspot/src/cpu/zero/vm/interpreter_zero.cpp
> -@@ -49,7 +49,7 @@
> - #ifdef COMPILER1
> - #include "c1/c1_Runtime1.hpp"
> - #endif
> --#ifdef CC_INTERP
> -+#if defined(CC_INTERP) || defined(SHARK)
> - #include "interpreter/cppInterpreter.hpp"
> - #endif
> -
> ---- hotspot/src/share/vm/shark/sharkCompiler.hpp.orig
> -+++ hotspot/src/share/vm/shark/sharkCompiler.hpp
> -@@ -40,6 +40,8 @@ class SharkCompiler : public AbstractCom
> -   // Creation
> -   SharkCompiler();
> -
> -+  void init_llvm();
> -+
> -   // Name of this compiler
> -   const char *name()     { return "shark"; }
> -
> ---- hotspot/src/share/vm/shark/sharkCompiler.cpp.orig
> -+++ hotspot/src/share/vm/shark/sharkCompiler.cpp
> +diff --git a/hotspot/src/share/vm/shark/sharkCompiler.cpp b/hotspot/src/share/vm/shark/sharkCompiler.cpp
> +index 86c09932a..462eb98a7 100644
> +--- a/hotspot/src/share/vm/shark/sharkCompiler.cpp
> ++++ b/hotspot/src/share/vm/shark/sharkCompiler.cpp
>   @@ -61,11 +61,25 @@ SharkCompiler::SharkCompiler()
>      : AbstractCompiler() {
>      // Create the lock to protect the memory manager and execution engine
> @@ -285,7 +217,7 @@
>    }
>    
>    void SharkCompiler::initialize() {
> -@@ -165,7 +183,7 @@ void SharkCompiler::compile_method(ciEnv
> +@@ -165,7 +183,7 @@ void SharkCompiler::compile_method(ciEnv*    env,
>      }
>    
>      // Create the recorders
> @@ -294,7 +226,7 @@
>      env->set_oop_recorder(new OopRecorder(&arena));
>      OopMapSet oopmaps;
>      env->set_debug_info(new DebugInformationRecorder(env->oop_recorder()));
> -@@ -268,7 +286,12 @@ void SharkCompiler::generate_native_code
> +@@ -268,7 +286,12 @@ void SharkCompiler::generate_native_code(SharkEntry* entry,
>    
>      if (SharkVerifyFunction != NULL) {
>        if (!fnmatch(SharkVerifyFunction, name, 0)) {
> @@ -307,7 +239,7 @@
>        }
>      }
>    
> -@@ -298,7 +321,11 @@ void SharkCompiler::generate_native_code
> +@@ -298,7 +321,11 @@ void SharkCompiler::generate_native_code(SharkEntry* entry,
>    #endif
>    #endif // !NDEBUG
>        memory_manager()->set_entry_for_function(function, entry);
> @@ -319,8 +251,23 @@
>      }
>      assert(code != NULL, "code must be != NULL");
>      entry->set_entry_point(code);
> ---- hotspot/src/share/vm/shark/sharkContext.cpp.orig
> -+++ hotspot/src/share/vm/shark/sharkContext.cpp
> +diff --git a/hotspot/src/share/vm/shark/sharkCompiler.hpp b/hotspot/src/share/vm/shark/sharkCompiler.hpp
> +index 974002988..36b5b2427 100644
> +--- a/hotspot/src/share/vm/shark/sharkCompiler.hpp
> ++++ b/hotspot/src/share/vm/shark/sharkCompiler.hpp
> +@@ -40,6 +40,8 @@ class SharkCompiler : public AbstractCompiler {
> +   // Creation
> +   SharkCompiler();
> +
> ++  void init_llvm();
> ++
> +   // Name of this compiler
> +   const char *name()     { return "shark"; }
> +
> +diff --git a/hotspot/src/share/vm/shark/sharkContext.cpp b/hotspot/src/share/vm/shark/sharkContext.cpp
> +index 0fc86f0b1..e16318ccf 100644
> +--- a/hotspot/src/share/vm/shark/sharkContext.cpp
> ++++ b/hotspot/src/share/vm/shark/sharkContext.cpp
>   @@ -34,8 +34,13 @@
>    using namespace llvm;
>    
> @@ -337,8 +284,10 @@
>      // Create a module to build our functions into
>      _module = new Module(name, *this);
>    
> ---- hotspot/src/share/vm/shark/sharkContext.hpp.orig
> -+++ hotspot/src/share/vm/shark/sharkContext.hpp
> +diff --git a/hotspot/src/share/vm/shark/sharkContext.hpp b/hotspot/src/share/vm/shark/sharkContext.hpp
> +index 952cf13b7..85b48e99a 100644
> +--- a/hotspot/src/share/vm/shark/sharkContext.hpp
> ++++ b/hotspot/src/share/vm/shark/sharkContext.hpp
>   @@ -29,6 +29,8 @@
>    #include "shark/llvmHeaders.hpp"
>    #include "shark/sharkCompiler.hpp"
> @@ -348,7 +297,7 @@
>    // The LLVMContext class allows multiple instances of LLVM to operate
>    // independently of each other in a multithreaded context.  We extend
>    // this here to store things in Shark that are LLVMContext-specific.
> -@@ -41,12 +43,28 @@ class SharkContext : public llvm::LLVMCo
> +@@ -41,12 +43,28 @@ class SharkContext : public llvm::LLVMContext {
>    
>     private:
>      llvm::Module* _module;
> @@ -377,7 +326,7 @@
>      // Get this thread's SharkContext
>     public:
>      static SharkContext& current() {
> -@@ -55,12 +73,35 @@ class SharkContext : public llvm::LLVMCo
> +@@ -55,12 +73,35 @@ class SharkContext : public llvm::LLVMContext {
>    
>      // Module accessors
>     public:
> @@ -414,3 +363,86 @@
>      }
>    
>      // Basic types
> +diff --git a/hotspot/src/share/vm/shark/sharkEntry.hpp b/hotspot/src/share/vm/shark/sharkEntry.hpp
> +index e0f535c69..c079e255a 100644
> +--- a/hotspot/src/share/vm/shark/sharkEntry.hpp
> ++++ b/hotspot/src/share/vm/shark/sharkEntry.hpp
> +@@ -27,6 +27,7 @@
> + #define SHARE_VM_SHARK_SHARKENTRY_HPP
> +
> + #include "shark/llvmHeaders.hpp"
> ++#include "entry_zero.hpp"
> +
> + class SharkContext;
> +
> +diff --git a/hotspot/src/share/vm/shark/sharkIntrinsics.cpp b/hotspot/src/share/vm/shark/sharkIntrinsics.cpp
> +index 9ad91c96d..560bb83f4 100644
> +--- a/hotspot/src/share/vm/shark/sharkIntrinsics.cpp
> ++++ b/hotspot/src/share/vm/shark/sharkIntrinsics.cpp
> +@@ -265,7 +265,11 @@ void SharkIntrinsics::do_Unsafe_compareAndSwapInt() {
> +     "addr");
> +
> +   // Perform the operation
> ++#if SHARK_LLVM_VERSION <= 34
> +   Value *result = builder()->CreateAtomicCmpXchg(addr, e, x, llvm::SequentiallyConsistent);
> ++#else
> ++  Value *result = builder()->CreateAtomicCmpXchg(addr, e, x, llvm::SequentiallyConsistent, llvm::SequentiallyConsistent);
> ++  #endif
> +   // Push the result
> +   state()->push(
> +     SharkValue::create_jint(
> +diff --git a/hotspot/src/share/vm/shark/sharkRuntime.cpp b/hotspot/src/share/vm/shark/sharkRuntime.cpp
> +index fd9916e11..1ae03753e 100644
> +--- a/hotspot/src/share/vm/shark/sharkRuntime.cpp
> ++++ b/hotspot/src/share/vm/shark/sharkRuntime.cpp
> +@@ -32,6 +32,7 @@
> + #ifdef TARGET_ARCH_zero
> + # include "stack_zero.inline.hpp"
> + #endif
> ++#include "memory/oopFactory.hpp"
> +
> + using namespace llvm;
> +
> +diff --git a/hotspot/src/share/vm/shark/sharkTopLevelBlock.cpp b/hotspot/src/share/vm/shark/sharkTopLevelBlock.cpp
> +index 243183c07..601ca7925 100644
> +--- a/hotspot/src/share/vm/shark/sharkTopLevelBlock.cpp
> ++++ b/hotspot/src/share/vm/shark/sharkTopLevelBlock.cpp
> +@@ -1732,7 +1732,11 @@ void SharkTopLevelBlock::do_new() {
> +     heap_object = builder()->CreateIntToPtr(
> +       old_top, SharkType::oop_type(), "heap_object");
> +
> ++#if SHARK_LLVM_VERSION <= 34
> +     Value *check = builder()->CreateAtomicCmpXchg(top_addr, old_top, new_top, llvm::SequentiallyConsistent);
> ++#else
> ++    Value *check = builder()->CreateAtomicCmpXchg(top_addr, old_top, new_top, llvm::SequentiallyConsistent, llvm::SequentiallyConsistent);
> ++#endif
> +     builder()->CreateCondBr(
> +       builder()->CreateICmpEQ(old_top, check),
> +       initialize, retry);
> +@@ -1933,7 +1937,11 @@ void SharkTopLevelBlock::acquire_lock(Value *lockee, int exception_action) {
> +
> +   Value *lock = builder()->CreatePtrToInt(
> +     monitor_header_addr, SharkType::intptr_type());
> ++#if SHARK_LLVM_VERSION <= 34
> +   Value *check = builder()->CreateAtomicCmpXchg(mark_addr, disp, lock, llvm::Acquire);
> ++#else
> ++  Value *check = builder()->CreateAtomicCmpXchg(mark_addr, disp, lock, llvm::Acquire, llvm::Acquire);
> ++#endif
> +   builder()->CreateCondBr(
> +     builder()->CreateICmpEQ(disp, check),
> +     acquired_fast, try_recursive);
> +@@ -2018,7 +2026,11 @@ void SharkTopLevelBlock::release_lock(int exception_action) {
> +     PointerType::getUnqual(SharkType::intptr_type()),
> +     "mark_addr");
> +
> ++#if SHARK_LLVM_VERSION <= 34
> +   Value *check = builder()->CreateAtomicCmpXchg(mark_addr, lock, disp, llvm::Release);
> ++#else
> ++  Value *check = builder()->CreateAtomicCmpXchg(mark_addr, lock, disp, llvm::Release, llvm::Monotonic);
> ++#endif
> +   builder()->CreateCondBr(
> +     builder()->CreateICmpEQ(lock, check),
> +     released_fast, slow_path);
> +--
> +2.24.1
> +
> diff --git a/recipes-core/openjdk/patches-openjdk-8/1012-hotspot-restrict-to-staging-dir.patch b/recipes-core/openjdk/patches-openjdk-8/1012-hotspot-restrict-to-staging-dir.patch
> new file mode 100644
> index 0000000..b61f664
> --- /dev/null
> +++ b/recipes-core/openjdk/patches-openjdk-8/1012-hotspot-restrict-to-staging-dir.patch
> @@ -0,0 +1,26 @@
> +From e4c080e29afa3f93383c1e046273cd20ec835ca3 Mon Sep 17 00:00:00 2001
> +From: Jens Rehsack <rehsack@gmail.com>
> +Date: Thu, 2 Jan 2020 10:23:38 +0100
> +Subject: [PATCH 1012/1012] hotspot: restrict to staging dir
> +
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> +---
> + make/linux/makefiles/dtrace.make | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/hotspot/make/linux/makefiles/dtrace.make b/hotspot/make/linux/makefiles/dtrace.make
> +index 386e94b1f..7642a67f8 100644
> +--- a/hotspot/make/linux/makefiles/dtrace.make
> ++++ b/hotspot/make/linux/makefiles/dtrace.make
> +@@ -40,7 +40,7 @@ else
> + ifneq ($(ALT_SDT_H),)
> +   SDT_H_FILE = $(ALT_SDT_H)
> + else
> +-  SDT_H_FILE = /usr/include/sys/sdt.h
> ++  SDT_H_FILE = $(SYS_ROOT)/usr/include/sys/sdt.h
> + endif
> + DTRACE_ENABLED = $(shell test -f $(SDT_H_FILE) && echo $(SDT_H_FILE))
> + REASON = "$(SDT_H_FILE) not found"
> +--
> +2.24.1
> +
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0001-jdk-comparison-between-pointer-and-integer.patch b/recipes-core/openjdk/patches-openjdk-8/2001-jdk-comparison-between-pointer-and-integer.patch
> similarity index 86%
> rename from recipes-core/openjdk/patches-openjdk-8/0001-jdk-comparison-between-pointer-and-integer.patch
> rename to recipes-core/openjdk/patches-openjdk-8/2001-jdk-comparison-between-pointer-and-integer.patch
> index b310598..38d3019 100644
> --- a/recipes-core/openjdk/patches-openjdk-8/0001-jdk-comparison-between-pointer-and-integer.patch
> +++ b/recipes-core/openjdk/patches-openjdk-8/2001-jdk-comparison-between-pointer-and-integer.patch
> @@ -1,7 +1,7 @@
> -From 97d6911fb581f9e44785db29abbf97ce77713f50 Mon Sep 17 00:00:00 2001
> +From 46ea1c28b53bf5fd2be03fa1d78936f6a1e70fc4 Mon Sep 17 00:00:00 2001
>   From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
>   Date: Fri, 2 Mar 2018 11:13:08 +0000
> -Subject: [PATCH 1/9] jdk: comparison between pointer and integer
> +Subject: [PATCH 2001/2008] jdk: comparison between pointer and integer
>   MIME-Version: 1.0
>   Content-Type: text/plain; charset=UTF-8
>   Content-Transfer-Encoding: 8bit
> @@ -18,15 +18,17 @@ jdk/src/share/native/java/net/net_util.c:225:13: note: in expansion of macro 'CH
>   Backport a patch to fix this.
>   
>   Upstream-Status: Backport [http://hg.openjdk.java.net/jdk9/jdk9/jdk/rev/90c643593ed7]
> +
>   Signed-off-by: André Draszik <andre.draszik@jci.com>
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>   ---
> - jdk/src/share/native/java/net/net_util.c           | 15 +++++++--------
> - jdk/src/share/native/java/net/net_util.h           |  8 ++++----
> - jdk/src/solaris/native/java/net/Inet6AddressImpl.c |  4 ++--
> + src/share/native/java/net/net_util.c           | 15 +++++++--------
> + src/share/native/java/net/net_util.h           |  8 ++++----
> + src/solaris/native/java/net/Inet6AddressImpl.c |  4 ++--
>    3 files changed, 13 insertions(+), 14 deletions(-)
>   
>   diff --git a/jdk/src/share/native/java/net/net_util.c b/jdk/src/share/native/java/net/net_util.c
> -index 2194e2e6..00c9e2ac 100644
> +index b1b8223a6..2eee6261a 100644
>   --- a/jdk/src/share/native/java/net/net_util.c
>   +++ b/jdk/src/share/native/java/net/net_util.c
>   @@ -108,7 +108,7 @@ jobject getInet6Address_scopeifname(JNIEnv *env, jobject iaObj) {
> @@ -65,7 +67,7 @@ index 2194e2e6..00c9e2ac 100644
>        jobject holder;
>        jbyteArray addr;
>    
> -@@ -202,7 +202,6 @@ NET_SockaddrToInetAddress(JNIEnv *env, struct sockaddr *him, int *port) {
> +@@ -208,7 +208,6 @@ NET_SockaddrToInetAddress(JNIEnv *env, struct sockaddr *him, int *port) {
>        jobject iaObj;
>    #ifdef AF_INET6
>        if (him->sa_family == AF_INET6) {
> @@ -73,8 +75,8 @@ index 2194e2e6..00c9e2ac 100644
>    #ifdef WIN32
>            struct SOCKADDR_IN6 *him6 = (struct SOCKADDR_IN6 *)him;
>    #else
> -@@ -218,11 +217,12 @@ NET_SockaddrToInetAddress(JNIEnv *env, struct sockaddr *him, int *port) {
> -             setInetAddress_family(env, iaObj, IPv4);
> +@@ -226,11 +225,12 @@ NET_SockaddrToInetAddress(JNIEnv *env, struct sockaddr *him, int *port) {
> +             JNU_CHECK_EXCEPTION_RETURN(env, NULL);
>            } else {
>                jint scope;
>   -            int ret;
> @@ -86,9 +88,9 @@ index 2194e2e6..00c9e2ac 100644
>   +            if (ret == JNI_FALSE)
>   +                return NULL;
>                setInetAddress_family(env, iaObj, IPv6);
> +             JNU_CHECK_EXCEPTION_RETURN(env, NULL);
>                scope = getScopeID(him);
> -             setInet6Address_scopeid(env, iaObj, scope);
> -@@ -269,7 +269,6 @@ NET_SockaddrEqualsInetAddress(JNIEnv *env, struct sockaddr *him, jobject iaObj)
> +@@ -282,7 +282,6 @@ NET_SockaddrEqualsInetAddress(JNIEnv *env, struct sockaddr *him, jobject iaObj)
>                    return JNI_FALSE;
>                }
>            } else {
> @@ -97,7 +99,7 @@ index 2194e2e6..00c9e2ac 100644
>                int scope;
>    
>   diff --git a/jdk/src/share/native/java/net/net_util.h b/jdk/src/share/native/java/net/net_util.h
> -index c8a5e68c..176ca586 100644
> +index c8a5e68c4..176ca586e 100644
>   --- a/jdk/src/share/native/java/net/net_util.h
>   +++ b/jdk/src/share/native/java/net/net_util.h
>   @@ -64,12 +64,12 @@ JNIEXPORT void JNICALL initInetAddressIDs(JNIEnv *env);
> @@ -118,10 +120,10 @@ index c8a5e68c..176ca586 100644
>    extern void setInetAddress_addr(JNIEnv *env, jobject iaObj, int address);
>    extern void setInetAddress_family(JNIEnv *env, jobject iaObj, int family);
>   diff --git a/jdk/src/solaris/native/java/net/Inet6AddressImpl.c b/jdk/src/solaris/native/java/net/Inet6AddressImpl.c
> -index e29a25da..23ec2985 100644
> +index 0a51a365f..dcc348cf1 100644
>   --- a/jdk/src/solaris/native/java/net/Inet6AddressImpl.c
>   +++ b/jdk/src/solaris/native/java/net/Inet6AddressImpl.c
> -@@ -403,7 +403,7 @@ Java_java_net_Inet6AddressImpl_lookupAllHostAddr(JNIEnv *env, jobject this,
> +@@ -392,7 +392,7 @@ Java_java_net_Inet6AddressImpl_lookupAllHostAddr(JNIEnv *env, jobject this,
>            }
>    
>            while (iterator != NULL) {
> @@ -130,7 +132,7 @@ index e29a25da..23ec2985 100644
>                if (iterator->ai_family == AF_INET) {
>                    jobject iaObj = (*env)->NewObject(env, ia4_class, ia4_ctrID);
>                    if (IS_NULL(iaObj)) {
> -@@ -423,7 +423,7 @@ Java_java_net_Inet6AddressImpl_lookupAllHostAddr(JNIEnv *env, jobject this,
> +@@ -416,7 +416,7 @@ Java_java_net_Inet6AddressImpl_lookupAllHostAddr(JNIEnv *env, jobject this,
>                        goto cleanupAndReturn;
>                    }
>                    ret1 = setInet6Address_ipaddress(env, iaObj, (char *)&(((struct sockaddr_in6*)iterator->ai_addr)->sin6_addr));
> @@ -140,5 +142,5 @@ index e29a25da..23ec2985 100644
>                        goto cleanupAndReturn;
>                    }
>   --
> -2.16.2
> +2.24.1
>   
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0003-jdk-Allow-using-a-system-installed-libjpeg.patch b/recipes-core/openjdk/patches-openjdk-8/2002-jdk-Allow-using-a-system-installed-libjpeg.patch
> similarity index 77%
> rename from recipes-core/openjdk/patches-openjdk-8/0003-jdk-Allow-using-a-system-installed-libjpeg.patch
> rename to recipes-core/openjdk/patches-openjdk-8/2002-jdk-Allow-using-a-system-installed-libjpeg.patch
> index e189278..4d1df8a 100644
> --- a/recipes-core/openjdk/patches-openjdk-8/0003-jdk-Allow-using-a-system-installed-libjpeg.patch
> +++ b/recipes-core/openjdk/patches-openjdk-8/2002-jdk-Allow-using-a-system-installed-libjpeg.patch
> @@ -1,7 +1,7 @@
> -From a6746c1ee43a63e79b5405e40c463d00160bc02e Mon Sep 17 00:00:00 2001
> +From aef9a3f955f6e189b2a24b9f79ccb396275d4fa3 Mon Sep 17 00:00:00 2001
>   From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
>   Date: Tue, 27 Feb 2018 13:36:53 +0000
> -Subject: [PATCH 3/9] jdk: Allow using a system-installed libjpeg
> +Subject: [PATCH 2002/2008] jdk: Allow using a system-installed libjpeg
>   MIME-Version: 1.0
>   Content-Type: text/plain; charset=UTF-8
>   Content-Transfer-Encoding: 8bit
> @@ -20,66 +20,20 @@ Issues fixed on top of debian patch:
>   
>   Upstream-Status: Backport
>   Signed-off-by: André Draszik <andre.draszik@jci.com>
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>   ---
> - common/autoconf/libraries.m4                       | 35 +++++++++--
> - jdk/make/lib/Awt2dLibraries.gmk                    | 69 +++++++++++++++-------
> - .../sun/imageio/plugins/jpeg/JPEGImageReader.java  |  2 +-
> - .../sun/imageio/plugins/jpeg/JPEGImageWriter.java  |  2 +-
> - .../classes/sun/awt/image/JPEGImageDecoder.java    |  2 +-
> - .../share/native/sun/awt/image/jpeg/imageioJPEG.c  |  2 +-
> - 6 files changed, 81 insertions(+), 31 deletions(-)
> + make/lib/Awt2dLibraries.gmk                   | 69 +++++++++++++------
> + .../imageio/plugins/jpeg/JPEGImageReader.java |  2 +-
> + .../imageio/plugins/jpeg/JPEGImageWriter.java |  2 +-
> + .../sun/awt/image/JPEGImageDecoder.java       |  2 +-
> + .../native/sun/awt/image/jpeg/imageioJPEG.c   |  2 +-
> + 5 files changed, 51 insertions(+), 26 deletions(-)
>   
> -diff --git a/common/autoconf/libraries.m4 b/common/autoconf/libraries.m4
> -index 91b8ed7f..3f5f69b1 100644
> ---- a/common/autoconf/libraries.m4
> -+++ b/common/autoconf/libraries.m4
> -@@ -595,11 +595,36 @@ AC_DEFUN_ONCE([LIB_SETUP_MISC_LIBS],
> -   # Check for the jpeg library
> -   #
> -
> --  USE_EXTERNAL_LIBJPEG=true
> --  AC_CHECK_LIB(jpeg, main, [],
> --      [ USE_EXTERNAL_LIBJPEG=false
> --      AC_MSG_NOTICE([Will use jpeg decoder bundled with the OpenJDK source])
> --  ])
> -+  AC_ARG_WITH(libjpeg, [AS_HELP_STRING([--with-libjpeg],
> -+      [use libjpeg from build system or OpenJDK source (system, bundled) @<:@bundled@:>@])])
> -+
> -+  AC_MSG_CHECKING([for which libjpeg to use])
> -+
> -+  # default is bundled
> -+  DEFAULT_LIBJPEG=bundled
> -+
> -+  #
> -+  # if user didn't specify, use DEFAULT_LIBJPEG
> -+  #
> -+  if test "x${with_libjpeg}" = "x"; then
> -+    with_libjpeg=${DEFAULT_LIBJPEG}
> -+  fi
> -+
> -+  AC_MSG_RESULT(${with_libjpeg})
> -+
> -+  if test "x${with_libjpeg}" = "xbundled"; then
> -+    USE_EXTERNAL_LIBJPEG=false
> -+  elif test "x${with_libjpeg}" = "xsystem"; then
> -+    AC_CHECK_HEADER(jpeglib.h, [],
> -+        [ AC_MSG_ERROR([--with-libjpeg=system specified, but jpeglib.h not found!])])
> -+    AC_CHECK_LIB(jpeg, jpeg_CreateDecompress, [],
> -+        [ AC_MSG_ERROR([--with-libjpeg=system specified, but no libjpeg found])])
> -+
> -+    USE_EXTERNAL_LIBJPEG=true
> -+  else
> -+    AC_MSG_ERROR([Invalid use of --with-libjpeg: ${with_libjpeg}, use 'system' or 'bundled'])
> -+  fi
> -+
> -   AC_SUBST(USE_EXTERNAL_LIBJPEG)
> -
> -   ###############################################################################
>   diff --git a/jdk/make/lib/Awt2dLibraries.gmk b/jdk/make/lib/Awt2dLibraries.gmk
> -index aa7efc4a..8872a8e8 100644
> +index a06bfd6db..12b9da11d 100644
>   --- a/jdk/make/lib/Awt2dLibraries.gmk
>   +++ b/jdk/make/lib/Awt2dLibraries.gmk
> -@@ -707,21 +707,24 @@ $(BUILD_LIBLCMS): $(BUILD_LIBAWT)
> +@@ -695,21 +695,24 @@ $(BUILD_LIBLCMS): $(BUILD_LIBAWT)
>    
>    ##########################################################################################
>    
> @@ -110,7 +64,7 @@ index aa7efc4a..8872a8e8 100644
>    # Suppress gcc warnings like "variable might be clobbered by 'longjmp'
>    # or 'vfork'": this warning indicates that some variable is placed to
>    # a register by optimized compiler and it's value might be lost on longjmp().
> -@@ -733,37 +736,50 @@ endif
> +@@ -721,37 +724,50 @@ endif
>    #      $(shell $(EXPR) $(CC_MAJORVER) \> 4 \| \
>    #          \( $(CC_MAJORVER) = 4 \& $(CC_MINORVER) \>= 3 \) )
>    #  ifeq ($(CC_43_OR_NEWER), 1)
> @@ -175,7 +129,7 @@ index aa7efc4a..8872a8e8 100644
>    
>    ##########################################################################################
>    
> -@@ -1213,6 +1229,13 @@ ifndef BUILD_HEADLESS_ONLY
> +@@ -1142,6 +1158,13 @@ ifndef BUILD_HEADLESS_ONLY
>        GIFLIB_CFLAGS := -I$(JDK_TOPDIR)/src/share/native/sun/awt/giflib
>      endif
>    
> @@ -189,7 +143,7 @@ index aa7efc4a..8872a8e8 100644
>      ifneq ($(OPENJDK_TARGET_OS), macosx)
>        LIBSPLASHSCREEN_DIRS += $(JDK_TOPDIR)/src/$(OPENJDK_TARGET_OS_API_DIR)/native/sun/awt/splashscreen
>      else
> -@@ -1273,11 +1296,13 @@ ifndef BUILD_HEADLESS_ONLY
> +@@ -1198,11 +1221,13 @@ ifndef BUILD_HEADLESS_ONLY
>          EXCLUDE_FILES := imageioJPEG.c jpegdecoder.c pngtest.c, \
>          LANG := C, \
>          OPTIMIZATION := LOW, \
> @@ -206,7 +160,7 @@ index aa7efc4a..8872a8e8 100644
>          VERSIONINFO_RESOURCE := $(JDK_TOPDIR)/src/windows/resource/version.rc, \
>          RC_FLAGS := $(RC_FLAGS) \
>   diff --git a/jdk/src/share/classes/com/sun/imageio/plugins/jpeg/JPEGImageReader.java b/jdk/src/share/classes/com/sun/imageio/plugins/jpeg/JPEGImageReader.java
> -index 5c93d89e..5efc00a7 100644
> +index 8f58f5b3e..fcbab8260 100644
>   --- a/jdk/src/share/classes/com/sun/imageio/plugins/jpeg/JPEGImageReader.java
>   +++ b/jdk/src/share/classes/com/sun/imageio/plugins/jpeg/JPEGImageReader.java
>   @@ -89,7 +89,7 @@ public class JPEGImageReader extends ImageReader {
> @@ -219,7 +173,7 @@ index 5c93d89e..5efc00a7 100644
>                    }
>                });
>   diff --git a/jdk/src/share/classes/com/sun/imageio/plugins/jpeg/JPEGImageWriter.java b/jdk/src/share/classes/com/sun/imageio/plugins/jpeg/JPEGImageWriter.java
> -index 6a33bd5a..dca189ed 100644
> +index 6a33bd5a1..dca189ed8 100644
>   --- a/jdk/src/share/classes/com/sun/imageio/plugins/jpeg/JPEGImageWriter.java
>   +++ b/jdk/src/share/classes/com/sun/imageio/plugins/jpeg/JPEGImageWriter.java
>   @@ -177,7 +177,7 @@ public class JPEGImageWriter extends ImageWriter {
> @@ -232,7 +186,7 @@ index 6a33bd5a..dca189ed 100644
>                    }
>                });
>   diff --git a/jdk/src/share/classes/sun/awt/image/JPEGImageDecoder.java b/jdk/src/share/classes/sun/awt/image/JPEGImageDecoder.java
> -index 872ffc01..5965a186 100644
> +index 872ffc019..5965a186b 100644
>   --- a/jdk/src/share/classes/sun/awt/image/JPEGImageDecoder.java
>   +++ b/jdk/src/share/classes/sun/awt/image/JPEGImageDecoder.java
>   @@ -56,7 +56,7 @@ public class JPEGImageDecoder extends ImageDecoder {
> @@ -245,7 +199,7 @@ index 872ffc01..5965a186 100644
>                    }
>                });
>   diff --git a/jdk/src/share/native/sun/awt/image/jpeg/imageioJPEG.c b/jdk/src/share/native/sun/awt/image/jpeg/imageioJPEG.c
> -index 7e1d8c99..8cac61da 100644
> +index 7e1d8c99d..8cac61da3 100644
>   --- a/jdk/src/share/native/sun/awt/image/jpeg/imageioJPEG.c
>   +++ b/jdk/src/share/native/sun/awt/image/jpeg/imageioJPEG.c
>   @@ -51,7 +51,7 @@
> @@ -258,5 +212,5 @@ index 7e1d8c99..8cac61da 100644
>    #undef MAX
>    #define MAX(a,b)        ((a) > (b) ? (a) : (b))
>   --
> -2.16.2
> +2.24.1
>   
> diff --git a/recipes-core/openjdk/patches-openjdk-8/2003-jdk-Allow-using-a-system-installed-libpng.patch b/recipes-core/openjdk/patches-openjdk-8/2003-jdk-Allow-using-a-system-installed-libpng.patch
> new file mode 100644
> index 0000000..13d3045
> --- /dev/null
> +++ b/recipes-core/openjdk/patches-openjdk-8/2003-jdk-Allow-using-a-system-installed-libpng.patch
> @@ -0,0 +1,83 @@
> +From bdf8cb302ab7c8f11b676f93da482cd4a9405ce4 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
> +Date: Tue, 27 Feb 2018 13:43:04 +0000
> +Subject: [PATCH 2003/2008] jdk: Allow using a system-installed libpng
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Patch stolen (and some typos corrected) from debian patch,
> +which itself was a backport from:
> +  http://hg.openjdk.java.net/jdk9/jdk9/rev/bfc1c131e540
> +  http://hg.openjdk.java.net/jdk9/jdk9/jdk/rev/5e503831b142
> +
> +Issues fixed on top of debian patch:
> +  * the default when --with-libpng= is not given works
> +  * using the bundled libpng works
> +
> +Upstream-Status: Backport
> +Signed-off-by: André Draszik <andre.draszik@jci.com>
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> +---
> + make/lib/Awt2dLibraries.gmk                          | 12 +++++++++---
> + .../native/sun/awt/splashscreen/splashscreen_png.c   |  3 +--
> + 2 files changed, 10 insertions(+), 5 deletions(-)
> +
> +diff --git a/jdk/make/lib/Awt2dLibraries.gmk b/jdk/make/lib/Awt2dLibraries.gmk
> +index 12b9da11d..cd8b94cd8 100644
> +--- a/jdk/make/lib/Awt2dLibraries.gmk
> ++++ b/jdk/make/lib/Awt2dLibraries.gmk
> +@@ -1148,7 +1148,6 @@ endif
> + ifndef BUILD_HEADLESS_ONLY
> +   LIBSPLASHSCREEN_DIRS := \
> +     $(JDK_TOPDIR)/src/share/native/sun/awt/image/jpeg \
> +-    $(JDK_TOPDIR)/src/share/native/sun/awt/libpng \
> +     $(JDK_TOPDIR)/src/share/native/sun/awt/splashscreen
> +
> +   ifeq ($(USE_EXTERNAL_LIBGIF), true)
> +@@ -1165,6 +1164,13 @@ ifndef BUILD_HEADLESS_ONLY
> +     LIBJPEG_CFLAGS := -I$(JDK_TOPDIR)/src/share/native/sun/awt/image/jpeg
> +   endif
> +
> ++  ifeq ($(USE_EXTERNAL_LIBPNG), true)
> ++    LIBPNG_LDFLAGS := -lpng
> ++  else
> ++    LIBSPLASHSCREEN_DIRS += $(JDK_TOPDIR)/src/share/native/sun/awt/libpng
> ++    LIBPNG_CFLAGS := -I$(JDK_TOPDIR)/src/share/native/sun/awt/libpng
> ++  endif
> ++
> +   ifneq ($(OPENJDK_TARGET_OS), macosx)
> +     LIBSPLASHSCREEN_DIRS += $(JDK_TOPDIR)/src/$(OPENJDK_TARGET_OS_API_DIR)/native/sun/awt/splashscreen
> +   else
> +@@ -1222,12 +1228,12 @@ ifndef BUILD_HEADLESS_ONLY
> +       LANG := C, \
> +       OPTIMIZATION := LOW, \
> +       CFLAGS := $(LIBSPLASHSCREEN_CFLAGS) $(CFLAGS_JDKLIB) \
> +-                $(GIFLIB_CFLAGS) $(LIBJPEG_CFLAGS), \
> ++                $(GIFLIB_CFLAGS) $(LIBJPEG_CFLAGS) $(LIBPNG_CFLAGS), \
> +       MAPFILE := $(JDK_TOPDIR)/make/mapfiles/libsplashscreen/mapfile-vers, \
> +       LDFLAGS := $(LDFLAGS_JDKLIB) \
> +           $(call SET_SHARED_LIBRARY_ORIGIN), \
> +       LDFLAGS_SUFFIX := $(LIBSPLASHSCREEN_LDFLAGS_SUFFIX) $(LIBZ) \
> +-                        $(GIFLIB_LDFLAGS) $(LIBJPEG_LDFLAGS), \
> ++                        $(GIFLIB_LDFLAGS) $(LIBJPEG_LDFLAGS) $(LIBPNG_LDFLAGS), \
> +       LDFLAGS_SUFFIX_solaris := -lc, \
> +       VERSIONINFO_RESOURCE := $(JDK_TOPDIR)/src/windows/resource/version.rc, \
> +       RC_FLAGS := $(RC_FLAGS) \
> +diff --git a/jdk/src/share/native/sun/awt/splashscreen/splashscreen_png.c b/jdk/src/share/native/sun/awt/splashscreen/splashscreen_png.c
> +index 3599433e4..5bf002ea1 100644
> +--- a/jdk/src/share/native/sun/awt/splashscreen/splashscreen_png.c
> ++++ b/jdk/src/share/native/sun/awt/splashscreen/splashscreen_png.c
> +@@ -25,8 +25,7 @@
> +
> + #include "splashscreen_impl.h"
> +
> +-#include "../libpng/png.h"
> +-
> ++#include <png.h>
> + #include <setjmp.h>
> +
> + #define SIG_BYTES 8
> +--
> +2.24.1
> +
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0007-jdk-use-correct-include-for-poll.patch b/recipes-core/openjdk/patches-openjdk-8/2004-jdk-use-correct-include-for-poll.patch
> similarity index 81%
> rename from recipes-core/openjdk/patches-openjdk-8/0007-jdk-use-correct-include-for-poll.patch
> rename to recipes-core/openjdk/patches-openjdk-8/2004-jdk-use-correct-include-for-poll.patch
> index 2efdbf5..365b4d6 100644
> --- a/recipes-core/openjdk/patches-openjdk-8/0007-jdk-use-correct-include-for-poll.patch
> +++ b/recipes-core/openjdk/patches-openjdk-8/2004-jdk-use-correct-include-for-poll.patch
> @@ -1,7 +1,7 @@
> -From df9c5738c4a8a00ba65948503ff0c0cfa2f17e95 Mon Sep 17 00:00:00 2001
> +From 48d7384387394820f2f5e8bdc2982c242568b548 Mon Sep 17 00:00:00 2001
>   From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
>   Date: Tue, 27 Feb 2018 09:28:06 +0000
> -Subject: [PATCH 7/9] jdk: use correct include for poll
> +Subject: [PATCH 2004/2008] jdk: use correct include for poll
>   MIME-Version: 1.0
>   Content-Type: text/plain; charset=UTF-8
>   Content-Transfer-Encoding: 8bit
> @@ -24,21 +24,22 @@ the following command:
>   
>   Upstream-Status: Pending
>   Signed-off-by: André Draszik <andre.draszik@jci.com>
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>   ---
> - jdk/src/aix/native/java/net/aix_close.c                 | 2 +-
> - jdk/src/aix/native/sun/nio/ch/AixPollPort.c             | 2 +-
> - jdk/src/solaris/native/java/net/PlainSocketImpl.c       | 2 +-
> - jdk/src/solaris/native/java/net/bsd_close.c             | 2 +-
> - jdk/src/solaris/native/java/net/linux_close.c           | 2 +-
> - jdk/src/solaris/native/java/net/net_util_md.h           | 2 +-
> - jdk/src/solaris/native/sun/nio/ch/DevPollArrayWrapper.c | 2 +-
> - jdk/src/solaris/native/sun/nio/ch/Net.c                 | 2 +-
> - jdk/src/solaris/native/sun/nio/fs/LinuxWatchService.c   | 2 +-
> - jdk/src/solaris/transport/socket/socket_md.c            | 2 +-
> + src/aix/native/java/net/aix_close.c                 | 2 +-
> + src/aix/native/sun/nio/ch/AixPollPort.c             | 2 +-
> + src/solaris/native/java/net/PlainSocketImpl.c       | 2 +-
> + src/solaris/native/java/net/bsd_close.c             | 2 +-
> + src/solaris/native/java/net/linux_close.c           | 2 +-
> + src/solaris/native/java/net/net_util_md.h           | 2 +-
> + src/solaris/native/sun/nio/ch/DevPollArrayWrapper.c | 2 +-
> + src/solaris/native/sun/nio/ch/Net.c                 | 2 +-
> + src/solaris/native/sun/nio/fs/LinuxWatchService.c   | 2 +-
> + src/solaris/transport/socket/socket_md.c            | 2 +-
>    10 files changed, 10 insertions(+), 10 deletions(-)
>   
>   diff --git a/jdk/src/aix/native/java/net/aix_close.c b/jdk/src/aix/native/java/net/aix_close.c
> -index 8c070e4b..126f4d7d 100644
> +index 8c070e4b7..126f4d7d4 100644
>   --- a/jdk/src/aix/native/java/net/aix_close.c
>   +++ b/jdk/src/aix/native/java/net/aix_close.c
>   @@ -51,7 +51,7 @@
> @@ -51,7 +52,7 @@ index 8c070e4b..126f4d7d 100644
>    /*
>     * Stack allocated by thread when doing blocking operation
>   diff --git a/jdk/src/aix/native/sun/nio/ch/AixPollPort.c b/jdk/src/aix/native/sun/nio/ch/AixPollPort.c
> -index 70064b89..c10c602b 100644
> +index 70064b890..c10c602b6 100644
>   --- a/jdk/src/aix/native/sun/nio/ch/AixPollPort.c
>   +++ b/jdk/src/aix/native/sun/nio/ch/AixPollPort.c
>   @@ -34,7 +34,7 @@
> @@ -64,7 +65,7 @@ index 70064b89..c10c602b 100644
>    #include <fcntl.h>
>    #include <stddef.h>
>   diff --git a/jdk/src/solaris/native/java/net/PlainSocketImpl.c b/jdk/src/solaris/native/java/net/PlainSocketImpl.c
> -index 71cbdf8c..170957e7 100644
> +index 71cbdf8ce..170957e73 100644
>   --- a/jdk/src/solaris/native/java/net/PlainSocketImpl.c
>   +++ b/jdk/src/solaris/native/java/net/PlainSocketImpl.c
>   @@ -28,7 +28,7 @@
> @@ -77,7 +78,7 @@ index 71cbdf8c..170957e7 100644
>    #include <netinet/tcp.h>        /* Defines TCP_NODELAY, needed for 2.6 */
>    #include <netinet/in.h>
>   diff --git a/jdk/src/solaris/native/java/net/bsd_close.c b/jdk/src/solaris/native/java/net/bsd_close.c
> -index af57cef3..64d04088 100644
> +index af57cef30..64d040887 100644
>   --- a/jdk/src/solaris/native/java/net/bsd_close.c
>   +++ b/jdk/src/solaris/native/java/net/bsd_close.c
>   @@ -36,7 +36,7 @@
> @@ -90,7 +91,7 @@ index af57cef3..64d04088 100644
>    /*
>     * Stack allocated by thread when doing blocking operation
>   diff --git a/jdk/src/solaris/native/java/net/linux_close.c b/jdk/src/solaris/native/java/net/linux_close.c
> -index 98e1ce09..85fba135 100644
> +index 98e1ce098..85fba135f 100644
>   --- a/jdk/src/solaris/native/java/net/linux_close.c
>   +++ b/jdk/src/solaris/native/java/net/linux_close.c
>   @@ -34,7 +34,7 @@
> @@ -103,7 +104,7 @@ index 98e1ce09..85fba135 100644
>    /*
>     * Stack allocated by thread when doing blocking operation
>   diff --git a/jdk/src/solaris/native/java/net/net_util_md.h b/jdk/src/solaris/native/java/net/net_util_md.h
> -index a48446de..8915b68a 100644
> +index a48446de9..8915b68aa 100644
>   --- a/jdk/src/solaris/native/java/net/net_util_md.h
>   +++ b/jdk/src/solaris/native/java/net/net_util_md.h
>   @@ -33,7 +33,7 @@
> @@ -116,7 +117,7 @@ index a48446de..8915b68a 100644
>    
>    
>   diff --git a/jdk/src/solaris/native/sun/nio/ch/DevPollArrayWrapper.c b/jdk/src/solaris/native/sun/nio/ch/DevPollArrayWrapper.c
> -index 6860a167..20849dab 100644
> +index 6860a167b..20849dabc 100644
>   --- a/jdk/src/solaris/native/sun/nio/ch/DevPollArrayWrapper.c
>   +++ b/jdk/src/solaris/native/sun/nio/ch/DevPollArrayWrapper.c
>   @@ -28,7 +28,7 @@
> @@ -129,7 +130,7 @@ index 6860a167..20849dab 100644
>    #include <sys/time.h>
>    
>   diff --git a/jdk/src/solaris/native/sun/nio/ch/Net.c b/jdk/src/solaris/native/sun/nio/ch/Net.c
> -index 73560ad6..a3720055 100644
> +index 73560ad6c..a3720055c 100644
>   --- a/jdk/src/solaris/native/sun/nio/ch/Net.c
>   +++ b/jdk/src/solaris/native/sun/nio/ch/Net.c
>   @@ -23,7 +23,7 @@
> @@ -142,7 +143,7 @@ index 73560ad6..a3720055 100644
>    #include <sys/socket.h>
>    #include <string.h>
>   diff --git a/jdk/src/solaris/native/sun/nio/fs/LinuxWatchService.c b/jdk/src/solaris/native/sun/nio/fs/LinuxWatchService.c
> -index 375aaa48..7606e9ba 100644
> +index 375aaa485..7606e9ba8 100644
>   --- a/jdk/src/solaris/native/sun/nio/fs/LinuxWatchService.c
>   +++ b/jdk/src/solaris/native/sun/nio/fs/LinuxWatchService.c
>   @@ -32,7 +32,7 @@
> @@ -155,7 +156,7 @@ index 375aaa48..7606e9ba 100644
>    
>    #include "sun_nio_fs_LinuxWatchService.h"
>   diff --git a/jdk/src/solaris/transport/socket/socket_md.c b/jdk/src/solaris/transport/socket/socket_md.c
> -index 33e062e0..819fcabd 100644
> +index 33e062e08..819fcabdb 100644
>   --- a/jdk/src/solaris/transport/socket/socket_md.c
>   +++ b/jdk/src/solaris/transport/socket/socket_md.c
>   @@ -37,7 +37,7 @@
> @@ -168,5 +169,5 @@ index 33e062e0..819fcabd 100644
>    
>    #include "socket_md.h"
>   --
> -2.16.2
> +2.24.1
>   
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0008-jdk-use-correct-include-for-signal.patch b/recipes-core/openjdk/patches-openjdk-8/2005-jdk-use-correct-include-for-signal.patch
> similarity index 83%
> rename from recipes-core/openjdk/patches-openjdk-8/0008-jdk-use-correct-include-for-signal.patch
> rename to recipes-core/openjdk/patches-openjdk-8/2005-jdk-use-correct-include-for-signal.patch
> index 05f9558..32bde99 100644
> --- a/recipes-core/openjdk/patches-openjdk-8/0008-jdk-use-correct-include-for-signal.patch
> +++ b/recipes-core/openjdk/patches-openjdk-8/2005-jdk-use-correct-include-for-signal.patch
> @@ -1,7 +1,7 @@
> -From a063ee68bc0dd7dbf9737df4ee191e98796f2f6a Mon Sep 17 00:00:00 2001
> +From 606c807be8e01a4cc99a02b50717d9bce141e8a2 Mon Sep 17 00:00:00 2001
>   From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
>   Date: Tue, 27 Feb 2018 09:28:06 +0000
> -Subject: [PATCH 8/9] jdk: use correct include for signal
> +Subject: [PATCH 2005/2008] jdk: use correct include for signal
>   MIME-Version: 1.0
>   Content-Type: text/plain; charset=UTF-8
>   Content-Transfer-Encoding: 8bit
> @@ -25,15 +25,16 @@ the following command:
>   
>   Upstream-Status: Pending
>   Signed-off-by: André Draszik <andre.draszik@jci.com>
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>   ---
> - jdk/src/aix/native/sun/nio/ch/AixNativeThread.c  | 2 +-
> - jdk/src/macosx/javavm/export/jvm_md.h            | 2 +-
> - jdk/src/solaris/javavm/export/jvm_md.h           | 2 +-
> - jdk/src/solaris/native/sun/nio/ch/NativeThread.c | 2 +-
> + src/aix/native/sun/nio/ch/AixNativeThread.c  | 2 +-
> + src/macosx/javavm/export/jvm_md.h            | 2 +-
> + src/solaris/javavm/export/jvm_md.h           | 2 +-
> + src/solaris/native/sun/nio/ch/NativeThread.c | 2 +-
>    4 files changed, 4 insertions(+), 4 deletions(-)
>   
>   diff --git a/jdk/src/aix/native/sun/nio/ch/AixNativeThread.c b/jdk/src/aix/native/sun/nio/ch/AixNativeThread.c
> -index c0d58579..c4abb7ae 100644
> +index c0d585796..c4abb7ae5 100644
>   --- a/jdk/src/aix/native/sun/nio/ch/AixNativeThread.c
>   +++ b/jdk/src/aix/native/sun/nio/ch/AixNativeThread.c
>   @@ -32,7 +32,7 @@
> @@ -46,7 +47,7 @@ index c0d58579..c4abb7ae 100644
>    /* Also defined in src/aix/native/java/net/aix_close.c */
>    #define INTERRUPT_SIGNAL (SIGRTMAX - 1)
>   diff --git a/jdk/src/macosx/javavm/export/jvm_md.h b/jdk/src/macosx/javavm/export/jvm_md.h
> -index 012bb1ba..0b575768 100644
> +index 012bb1bab..0b5757683 100644
>   --- a/jdk/src/macosx/javavm/export/jvm_md.h
>   +++ b/jdk/src/macosx/javavm/export/jvm_md.h
>   @@ -60,7 +60,7 @@
> @@ -59,7 +60,7 @@ index 012bb1ba..0b575768 100644
>    /* O Flags */
>    
>   diff --git a/jdk/src/solaris/javavm/export/jvm_md.h b/jdk/src/solaris/javavm/export/jvm_md.h
> -index 5c681914..62415ee2 100644
> +index 5c681914b..62415ee25 100644
>   --- a/jdk/src/solaris/javavm/export/jvm_md.h
>   +++ b/jdk/src/solaris/javavm/export/jvm_md.h
>   @@ -65,7 +65,7 @@
> @@ -72,7 +73,7 @@ index 5c681914..62415ee2 100644
>    /* O Flags */
>    
>   diff --git a/jdk/src/solaris/native/sun/nio/ch/NativeThread.c b/jdk/src/solaris/native/sun/nio/ch/NativeThread.c
> -index 5e2a78b7..204f0441 100644
> +index 5e2a78b7a..204f0441a 100644
>   --- a/jdk/src/solaris/native/sun/nio/ch/NativeThread.c
>   +++ b/jdk/src/solaris/native/sun/nio/ch/NativeThread.c
>   @@ -34,7 +34,7 @@
> @@ -85,5 +86,5 @@ index 5e2a78b7..204f0441 100644
>      #define INTERRUPT_SIGNAL (__SIGRTMAX - 2)
>    #elif __solaris__
>   --
> -2.16.2
> +2.24.1
>   
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0009-jdk-disable-backtrace-musl-build-fix.patch b/recipes-core/openjdk/patches-openjdk-8/2006-jdk-disable-backtrace-musl-build-fix.patch
> similarity index 75%
> rename from recipes-core/openjdk/patches-openjdk-8/0009-jdk-disable-backtrace-musl-build-fix.patch
> rename to recipes-core/openjdk/patches-openjdk-8/2006-jdk-disable-backtrace-musl-build-fix.patch
> index 43130b5..dd5e051 100644
> --- a/recipes-core/openjdk/patches-openjdk-8/0009-jdk-disable-backtrace-musl-build-fix.patch
> +++ b/recipes-core/openjdk/patches-openjdk-8/2006-jdk-disable-backtrace-musl-build-fix.patch
> @@ -1,7 +1,7 @@
> -From 8ef989f82b29655e8d4532f14d5aa12a2999d850 Mon Sep 17 00:00:00 2001
> +From 86de5eb9d031e7f8d241725d5eeaa7030cf2ce2b Mon Sep 17 00:00:00 2001
>   From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
>   Date: Fri, 2 Mar 2018 13:58:07 +0000
> -Subject: [PATCH 10/10] jdk: disable backtrace() (musl build fix)
> +Subject: [PATCH 2006/2008] jdk: disable backtrace() (musl build fix)
>   MIME-Version: 1.0
>   Content-Type: text/plain; charset=UTF-8
>   Content-Transfer-Encoding: 8bit
> @@ -14,12 +14,13 @@ to fix the build on musl.
>   
>   Upstream-Status: Pending
>   Signed-off-by: André Draszik <andre.draszik@jci.com>
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>   ---
> - jdk/src/solaris/native/sun/xawt/XToolkit.c | 4 ++--
> + src/solaris/native/sun/xawt/XToolkit.c | 4 ++--
>    1 file changed, 2 insertions(+), 2 deletions(-)
>   
>   diff --git a/jdk/src/solaris/native/sun/xawt/XToolkit.c b/jdk/src/solaris/native/sun/xawt/XToolkit.c
> -index 71d41f37..d3dc47cb 100644
> +index 2425bf43a..1c8ebdb42 100644
>   --- a/jdk/src/solaris/native/sun/xawt/XToolkit.c
>   +++ b/jdk/src/solaris/native/sun/xawt/XToolkit.c
>   @@ -27,7 +27,7 @@
> @@ -31,7 +32,7 @@ index 71d41f37..d3dc47cb 100644
>    #include <execinfo.h>
>    #endif
>    
> -@@ -799,7 +799,7 @@ JNIEXPORT jstring JNICALL Java_sun_awt_X11_XToolkit_getEnv
> +@@ -803,7 +803,7 @@ JNIEXPORT jstring JNICALL Java_sun_awt_X11_XToolkit_getEnv
>        return ret;
>    }
>    
> @@ -41,5 +42,5 @@ index 71d41f37..d3dc47cb 100644
>    {
>      void *array[10];
>   --
> -2.16.2
> +2.24.1
>   
> diff --git a/recipes-core/openjdk/patches-openjdk-8/2007-jdk-no-genx11-in-headless.patch b/recipes-core/openjdk/patches-openjdk-8/2007-jdk-no-genx11-in-headless.patch
> new file mode 100644
> index 0000000..8f3d134
> --- /dev/null
> +++ b/recipes-core/openjdk/patches-openjdk-8/2007-jdk-no-genx11-in-headless.patch
> @@ -0,0 +1,32 @@
> +From 0708dd8e56c1f28c2215561ba3035c8c538acef6 Mon Sep 17 00:00:00 2001
> +From: Jens Rehsack <rehsack@gmail.com>
> +Date: Thu, 2 Jan 2020 13:25:12 +0100
> +Subject: [PATCH 2007/2008] jdk: no genx11 in headless
> +
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> +---
> + make/GenerateSources.gmk | 8 +++++---
> + 1 file changed, 5 insertions(+), 3 deletions(-)
> +
> +diff --git a/jdk/make/GenerateSources.gmk b/jdk/make/GenerateSources.gmk
> +index ba443f7da..2170150ac 100644
> +--- a/jdk/make/GenerateSources.gmk
> ++++ b/jdk/make/GenerateSources.gmk
> +@@ -73,9 +73,11 @@ ifneq ($(OPENJDK_TARGET_OS), windows)
> +     GENSRC += $(GENSRC_OSX_ICONS)
> +   endif
> +
> +-  ifneq ($(OPENJDK_TARGET_OS), macosx)
> +-    include gensrc/GensrcX11Wrappers.gmk
> +-    GENSRC += $(GENSRC_X11WRAPPERS)
> ++  ifndef BUILD_HEADLESS_ONLY
> ++    ifneq ($(OPENJDK_TARGET_OS), macosx)
> ++      include gensrc/GensrcX11Wrappers.gmk
> ++      GENSRC += $(GENSRC_X11WRAPPERS)
> ++    endif
> +   endif
> + endif
> +
> +--
> +2.24.1
> +
> diff --git a/recipes-core/openjdk/patches-openjdk-8/openjdk8-no-unused-deps.patch b/recipes-core/openjdk/patches-openjdk-8/2008-jdk-no-unused-deps.patch
> similarity index 58%
> rename from recipes-core/openjdk/patches-openjdk-8/openjdk8-no-unused-deps.patch
> rename to recipes-core/openjdk/patches-openjdk-8/2008-jdk-no-unused-deps.patch
> index 7b5d998..e725bf9 100644
> --- a/recipes-core/openjdk/patches-openjdk-8/openjdk8-no-unused-deps.patch
> +++ b/recipes-core/openjdk/patches-openjdk-8/2008-jdk-no-unused-deps.patch
> @@ -1,6 +1,35 @@
> ---- jdk/make/lib/Awt2dLibraries.gmk.orig
> -+++ jdk/make/lib/Awt2dLibraries.gmk
> -@@ -235,6 +235,10 @@ ifeq ($(OPENJDK_TARGET_OS), aix)
> +From 0bb17a5083efcfd02e96ef034e51a190ea678f15 Mon Sep 17 00:00:00 2001
> +From: Jens Rehsack <rehsack@gmail.com>
> +Date: Thu, 2 Jan 2020 13:26:42 +0100
> +Subject: [PATCH 2008/2008] jdk: no unused deps
> +
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> +---
> + make/CompileNativeLibraries.gmk           |  2 ++
> + make/lib/Awt2dLibraries.gmk               | 30 +++++++++++++++++------
> + src/solaris/native/sun/awt/jawt.c         |  2 +-
> + src/solaris/native/sun/awt/utility/rect.h |  2 +-
> + 4 files changed, 26 insertions(+), 10 deletions(-)
> +
> +diff --git a/jdk/make/CompileNativeLibraries.gmk b/jdk/make/CompileNativeLibraries.gmk
> +index c23b958b0..2984302f0 100644
> +--- a/jdk/make/CompileNativeLibraries.gmk
> ++++ b/jdk/make/CompileNativeLibraries.gmk
> +@@ -85,7 +85,9 @@ include lib/ServiceabilityLibraries.gmk
> +
> + include lib/Awt2dLibraries.gmk
> +
> ++ifndef BUILD_SOUNDLESS_ONLY
> + include lib/SoundLibraries.gmk
> ++endif
> +
> + # Include the corresponding custom file, if present.
> + -include $(CUSTOM_MAKE_DIR)/CompileNativeLibraries.gmk
> +diff --git a/jdk/make/lib/Awt2dLibraries.gmk b/jdk/make/lib/Awt2dLibraries.gmk
> +index cd8b94cd8..8d9c37246 100644
> +--- a/jdk/make/lib/Awt2dLibraries.gmk
> ++++ b/jdk/make/lib/Awt2dLibraries.gmk
> +@@ -232,6 +232,10 @@ ifeq ($(OPENJDK_TARGET_OS), aix)
>      LIBAWT_DIRS += $(JDK_TOPDIR)/src/aix/porting
>    endif
>    
> @@ -11,7 +40,7 @@
>    LIBAWT_CFLAGS += -D__MEDIALIB_OLD_NAMES -D__USE_J2D_NAMES \
>        $(X_CFLAGS) \
>        $(foreach dir, $(LIBAWT_DIRS), -I$(dir))
> -@@ -792,17 +796,28 @@ ifeq ($(BUILD_HEADLESS), true)
> +@@ -801,17 +805,28 @@ ifeq ($(BUILD_HEADLESS), true)
>            -I$(JDK_TOPDIR)/src/$(OPENJDK_TARGET_OS_API_DIR)/native/sun/jdga \
>            $(foreach dir, $(LIBAWT_HEADLESS_DIRS), -I$(dir))
>    
> @@ -45,7 +74,7 @@
>            OGLBlitLoops.c \
>            OGLBufImgOps.c \
>            OGLContext.c \
> -@@ -815,10 +830,9 @@ ifeq ($(BUILD_HEADLESS), true)
> +@@ -824,10 +839,9 @@ ifeq ($(BUILD_HEADLESS), true)
>            OGLSurfaceData.c \
>            OGLTextRenderer.c \
>            OGLVertexCache.c \
> @@ -58,20 +87,10 @@
>    
>        LIBAWT_HEADLESS_REORDER :=
>        ifeq ($(OPENJDK_TARGET_OS), solaris)
> ---- jdk/make/CompileNativeLibraries.gmk.orig
> -+++ jdk/make/CompileNativeLibraries.gmk
> -@@ -85,7 +85,9 @@ include lib/ServiceabilityLibraries.gmk
> -
> - include lib/Awt2dLibraries.gmk
> -
> -+ifndef BUILD_SOUNDLESS_ONLY
> - include lib/SoundLibraries.gmk
> -+endif
> -
> - # Include the corresponding custom file, if present.
> - -include $(CUSTOM_MAKE_DIR)/CompileNativeLibraries.gmk
> ---- jdk/src/solaris/native/sun/awt/jawt.c.orig
> -+++ jdk/src/solaris/native/sun/awt/jawt.c
> +diff --git a/jdk/src/solaris/native/sun/awt/jawt.c b/jdk/src/solaris/native/sun/awt/jawt.c
> +index 64284bc6e..b3584c7ef 100644
> +--- a/jdk/src/solaris/native/sun/awt/jawt.c
> ++++ b/jdk/src/solaris/native/sun/awt/jawt.c
>   @@ -33,7 +33,7 @@
>     */
>    JNIEXPORT jboolean JNICALL JAWT_GetAWT(JNIEnv* env, JAWT* awt)
> @@ -81,8 +100,10 @@
>        /* there are no AWT libs available at all */
>        return JNI_FALSE;
>    #else
> ---- jdk/src/solaris/native/sun/awt/utility/rect.h.orig
> -+++ jdk/src/solaris/native/sun/awt/utility/rect.h
> +diff --git a/jdk/src/solaris/native/sun/awt/utility/rect.h b/jdk/src/solaris/native/sun/awt/utility/rect.h
> +index ceea38f43..8d85782ba 100644
> +--- a/jdk/src/solaris/native/sun/awt/utility/rect.h
> ++++ b/jdk/src/solaris/native/sun/awt/utility/rect.h
>   @@ -28,7 +28,7 @@
>    #ifndef _AWT_RECT_H
>    #define _AWT_RECT_H
> @@ -92,3 +113,6 @@
>    #include <X11/Xlib.h>
>    typedef XRectangle RECT_T;
>    #else
> +--
> +2.24.1
> +
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0001-hotspot-aarch32-fix-missing-return-values.patch b/recipes-core/openjdk/patches-openjdk-8/aarch32-hotspot-fix-missing-return-values.patch
> similarity index 100%
> rename from recipes-core/openjdk/patches-openjdk-8/0001-hotspot-aarch32-fix-missing-return-values.patch
> rename to recipes-core/openjdk/patches-openjdk-8/aarch32-hotspot-fix-missing-return-values.patch
> diff --git a/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-pt2-aarch32.patch b/recipes-core/openjdk/patches-openjdk-8/aarch32-hotspot-fix-shark-build-pt2.patch
> similarity index 100%
> rename from recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-pt2-aarch32.patch
> rename to recipes-core/openjdk/patches-openjdk-8/aarch32-hotspot-fix-shark-build-pt2.patch
> diff --git a/recipes-core/openjdk/patches-openjdk-8/hotspot-remaining-musl-fixes-aarch32.patch b/recipes-core/openjdk/patches-openjdk-8/aarch32-hotspot-remaining-musl-fixes.patch
> similarity index 100%
> rename from recipes-core/openjdk/patches-openjdk-8/hotspot-remaining-musl-fixes-aarch32.patch
> rename to recipes-core/openjdk/patches-openjdk-8/aarch32-hotspot-remaining-musl-fixes.patch
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0013-hotspot-aarch64-Fix-further-functions-with-a-missing.patch b/recipes-core/openjdk/patches-openjdk-8/aarch64-hotspot-Fix-further-functions-with-a-missing.patch
> similarity index 100%
> rename from recipes-core/openjdk/patches-openjdk-8/0013-hotspot-aarch64-Fix-further-functions-with-a-missing.patch
> rename to recipes-core/openjdk/patches-openjdk-8/aarch64-hotspot-Fix-further-functions-with-a-missing.patch
> diff --git a/recipes-core/openjdk/patches-openjdk-8/hotspot-remaining-musl-fixes-aarch64.patch b/recipes-core/openjdk/patches-openjdk-8/aarch64-hotspot-remaining-musl-fixes.patch
> similarity index 100%
> rename from recipes-core/openjdk/patches-openjdk-8/hotspot-remaining-musl-fixes-aarch64.patch
> rename to recipes-core/openjdk/patches-openjdk-8/aarch64-hotspot-remaining-musl-fixes.patch
> diff --git a/recipes-core/openjdk/patches-openjdk-8/filter-aclocal-copy-too.patch b/recipes-core/openjdk/patches-openjdk-8/filter-aclocal-copy-too.patch
> deleted file mode 100644
> index b901001..0000000
> --- a/recipes-core/openjdk/patches-openjdk-8/filter-aclocal-copy-too.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- common/autoconf/basics.m4.orig
> -+++ common/autoconf/basics.m4
> -@@ -448,7 +448,7 @@ AC_DEFUN_ONCE([BASIC_SETUP_OUTPUT_DIR],
> -       files_present=`$LS $OUTPUT_ROOT`
> -       # Configure has already touched config.log and confdefs.h in the current dir when this check
> -       # is performed.
> --      filtered_files=`$ECHO "$files_present" | $SED -e 's/config.log//g' -e 's/confdefs.h//g' -e 's/ //g' \
> -+      filtered_files=`$ECHO "$files_present" | $SED -e 's/config.log//g' -e 's/confdefs.h//g' -e 's,aclocal-copy,,g' -e 's/ //g' \
> -       | $TR -d '\n'`
> -       if test "x$filtered_files" != x; then
> -         AC_MSG_NOTICE([Current directory is $CURDIR.])
> diff --git a/recipes-core/openjdk/patches-openjdk-8/hotspot-handle-gcc7-format-overflow.patch b/recipes-core/openjdk/patches-openjdk-8/hotspot-handle-gcc7-format-overflow.patch
> deleted file mode 100644
> index 83626b3..0000000
> --- a/recipes-core/openjdk/patches-openjdk-8/hotspot-handle-gcc7-format-overflow.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -# HG changeset patch
> -# User Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
> -# Date 1537519446 -7200
> -#      Fri Sep 21 10:44:06 2018 +0200
> -# Node ID 213da2c3ee54a558abd30b0230afa40d4b4e7f83
> -# Parent  80ee2541504ec08d65da9d968a18a00a69858ce0
> -Handle format error for GCC >= 7
> -
> -diff --git a/hotspot/src/share/vm/adlc/output_c.cpp b/hotspot/src/share/vm/adlc/output_c.cpp
> ---- a/hotspot/src/share/vm/adlc/output_c.cpp
> -+++ b/hotspot/src/share/vm/adlc/output_c.cpp
> -@@ -436,9 +436,11 @@
> -   for (i = maxcycleused; i > 0; i /= 10)
> -     cycledigit++;
> -
> --  int maskdigit = 0;
> --  for (i = rescount; i > 0; i /= 10)
> -+  int maskdigit = 1;
> -+  for (i = rescount / 10; i > 0; i /= 10)
> -     maskdigit++;
> -+  if (maskdigit > 10)
> -+    maskdigit = 10;
> -
> -   static const char* pipeline_use_cycle_mask = "Pipeline_Use_Cycle_Mask";
> -   static const char* pipeline_use_element    = "Pipeline_Use_Element";
> diff --git a/recipes-core/openjdk/patches-openjdk-8/openjdk8-add-missing-linker-flags.patch b/recipes-core/openjdk/patches-openjdk-8/openjdk8-add-missing-linker-flags.patch
> deleted file mode 100644
> index 92f29b0..0000000
> --- a/recipes-core/openjdk/patches-openjdk-8/openjdk8-add-missing-linker-flags.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -makefiles: Add missing EXTRA_LDFLAGS to certain files
> -
> -EXTRA_LDFLAGS were not used when building certain shared objects. This
> -means that the Yocto specific linker flags were lost, which caused build
> -failures due to a bad hash style.
> -
> -Signed-off-by: Erkka Kääriä <erkka.kaaria@intel.com>
> -
> -Upstream-Status: Pending
> ----
> - hotspot/make/linux/makefiles/jsig.make   | 2 +-
> - hotspot/make/linux/makefiles/saproc.make | 2 +-
> - hotspot/make/linux/makefiles/vm.make     | 2 +-
> - 3 files changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git hotspot/make/linux/makefiles/jsig.make hotspot/make/linux/makefiles/jsig.make
> -index ce29eb1..e1d6c07 100644
> ---- hotspot/make/linux/makefiles/jsig.amake
> -+++ hotspot/make/linux/makefiles/jsig.make
> -@@ -44,7 +44,7 @@ LIBJSIG_MAPFILE = $(MAKEFILES_DIR)/mapfile-vers-jsig
> - # cause problems with interposing. See CR: 6466665
> - # LFLAGS_JSIG += $(MAPFLAG:FILENAME=$(LIBJSIG_MAPFILE))
> -
> --LFLAGS_JSIG += -D_GNU_SOURCE -D_REENTRANT $(LDFLAGS_HASH_STYLE)
> -+LFLAGS_JSIG += -D_GNU_SOURCE -D_REENTRANT $(LDFLAGS_HASH_STYLE) $(EXTRA_LDFLAGS)
> -
> - # DEBUG_BINARIES overrides everything, use full -g debug information
> - ifeq ($(DEBUG_BINARIES), true)
> -diff --git hotspot/make/linux/makefiles/saproc.make hotspot/make/linux/makefiles/saproc.make
> -index 7c6e4a8..369a0ba 100644
> ---- hotspot/make/linux/makefiles/saproc.make
> -+++ hotspot/make/linux/makefiles/saproc.make
> -@@ -73,7 +73,7 @@ ALT_SAINCDIR=-I$(ALT_SASRCDIR) -DALT_SASRCDIR
> - else
> - ALT_SAINCDIR=
> - endif
> --SA_LFLAGS = $(MAPFLAG:FILENAME=$(SAMAPFILE)) $(LDFLAGS_HASH_STYLE)
> -+SA_LFLAGS = $(MAPFLAG:FILENAME=$(SAMAPFILE)) $(LDFLAGS_HASH_STYLE) $(EXTRA_LDFLAGS)
> -
> - SAARCH ?= $(BUILDARCH)
> -
> -diff --git hotspot/make/linux/makefiles/vm.make hotspot/make/linux/makefiles/vm.make
> -index 1a48df9..72f8d11 100644
> ---- hotspot/make/linux/makefiles/vm.make
> -+++ hotspot/make/linux/makefiles/vm.make
> -@@ -122,7 +122,7 @@ CFLAGS += $(CFLAGS/NOEX)
> -
> - # Extra flags from gnumake's invocation or environment
> - CFLAGS += $(EXTRA_CFLAGS)
> --LFLAGS += $(EXTRA_CFLAGS)
> -+LFLAGS += $(EXTRA_CFLAGS) $(EXTRA_LDFLAGS)
> -
> - # Don't set excutable bit on stack segment
> - # the same could be done by separate execstack command
> ---
> -2.7.4
> -
> diff --git a/recipes-core/openjdk/patches-openjdk-8/openjdk8-find-compiler-fix-env-respect.patch b/recipes-core/openjdk/patches-openjdk-8/openjdk8-find-compiler-fix-env-respect.patch
> deleted file mode 100644
> index 91d258d..0000000
> --- a/recipes-core/openjdk/patches-openjdk-8/openjdk8-find-compiler-fix-env-respect.patch
> +++ /dev/null
> @@ -1,140 +0,0 @@
> ---- common/autoconf/toolchain.m4.orig
> -+++ common/autoconf/toolchain.m4
> -@@ -77,7 +77,7 @@ AC_DEFUN([TOOLCHAIN_CHECK_COMPILER_VERSI
> - # $2 = human readable name of compiler (C or C++)
> - AC_DEFUN([TOOLCHAIN_EXTRACT_COMPILER_VERSION],
> - [
> --  COMPILER=[$]$1
> -+  COMPILER="[$]$1"
> -   COMPILER_NAME=$2
> -
> -   if test "x$OPENJDK_TARGET_OS" = xsolaris; then
> -@@ -174,64 +174,37 @@ AC_DEFUN([TOOLCHAIN_FIND_COMPILER],
> - [
> -   COMPILER_NAME=$2
> -
> --  $1=
> -+  FOUND_$1=
> -+
> -+  if test "x[$]$1" != "x"; then
> -+    FOUND_$1="[$]$1"
> -+  fi
> -+
> -   # If TOOLS_DIR is set, check for all compiler names in there first
> -   # before checking the rest of the PATH.
> --  if test -n "$TOOLS_DIR"; then
> -+  if test "x[$]FOUND_$1" = x -a -n "$TOOLS_DIR"; then
> -     PATH_save="$PATH"
> -     PATH="$TOOLS_DIR"
> -     AC_PATH_PROGS(TOOLS_DIR_$1, $3)
> --    $1=$TOOLS_DIR_$1
> -+    FOUND_$1=$TOOLS_DIR_$1
> -     PATH="$PATH_save"
> -   fi
> -
> -   # AC_PATH_PROGS can't be run multiple times with the same variable,
> -   # so create a new name for this run.
> --  if test "x[$]$1" = x; then
> -+  if test "x[$]FOUND_$1" = x; then
> -     AC_PATH_PROGS(POTENTIAL_$1, $3)
> --    $1=$POTENTIAL_$1
> -+    FOUND_$1=$POTENTIAL_$1
> -   fi
> -
> --  if test "x[$]$1" = x; then
> -+  if test "x[$]FOUND_$1" = x; then
> -     HELP_MSG_MISSING_DEPENDENCY([devkit])
> -     AC_MSG_ERROR([Could not find a $COMPILER_NAME compiler. $HELP_MSG])
> -   fi
> --  BASIC_FIXUP_EXECUTABLE($1)
> --  TEST_COMPILER="[$]$1"
> --  # Don't remove symbolic links on AIX because 'xlc_r' and 'xlC_r' may all be links
> --  # to 'xlc' but it is crucial that we invoke the compiler with the right name!
> --  if test "x$OPENJDK_BUILD_OS" != xaix; then
> --    AC_MSG_CHECKING([resolved symbolic links for $1])
> --    BASIC_REMOVE_SYMBOLIC_LINKS(TEST_COMPILER)
> --    AC_MSG_RESULT([$TEST_COMPILER])
> --  fi
> --  AC_MSG_CHECKING([if $1 is disguised ccache])
> --
> --  COMPILER_BASENAME=`$BASENAME "$TEST_COMPILER"`
> --  if test "x$COMPILER_BASENAME" = "xccache"; then
> --    AC_MSG_RESULT([yes, trying to find proper $COMPILER_NAME compiler])
> --    # We /usr/lib/ccache in the path, so cc is a symlink to /usr/bin/ccache.
> --    # We want to control ccache invocation ourselves, so ignore this cc and try
> --    # searching again.
> --
> --    # Remove the path to the fake ccache cc from the PATH
> --    RETRY_COMPILER_SAVED_PATH="$PATH"
> --    COMPILER_DIRNAME=`$DIRNAME [$]$1`
> --    PATH="`$ECHO $PATH | $SED -e "s,$COMPILER_DIRNAME,,g" -e "s,::,:,g" -e "s,^:,,g"`"
> --
> --    # Try again looking for our compiler
> --    AC_CHECK_TOOLS(PROPER_COMPILER_$1, $3)
> --    BASIC_FIXUP_EXECUTABLE(PROPER_COMPILER_$1)
> --    PATH="$RETRY_COMPILER_SAVED_PATH"
> --
> --    AC_MSG_CHECKING([for resolved symbolic links for $1])
> --    BASIC_REMOVE_SYMBOLIC_LINKS(PROPER_COMPILER_$1)
> --    AC_MSG_RESULT([$PROPER_COMPILER_$1])
> --    $1="$PROPER_COMPILER_$1"
> --  else
> --    AC_MSG_RESULT([no, keeping $1])
> --    $1="$TEST_COMPILER"
> --  fi
> -+  BASIC_FIXUP_EXECUTABLE(FOUND_$1)
> -+  TEST_COMPILER="[$]FOUND_$1"
> -+
> -+  $1="$TEST_COMPILER"
> -   TOOLCHAIN_EXTRACT_COMPILER_VERSION([$1], [$COMPILER_NAME])
> - ])
> -
> -@@ -265,12 +238,12 @@ AC_DEFUN([TOOLCHAIN_SETUP_PATHS],
> -     # otherwise we might pick up cross-compilers which don't use standard naming.
> -     # Otherwise, we'll set the BUILD_tools to the native tools, but that'll have
> -     # to wait until they are properly discovered.
> --    AC_PATH_PROGS(BUILD_CC, [cl cc gcc])
> --    BASIC_FIXUP_EXECUTABLE(BUILD_CC)
> --    AC_PATH_PROGS(BUILD_CXX, [cl CC g++])
> --    BASIC_FIXUP_EXECUTABLE(BUILD_CXX)
> --    AC_PATH_PROG(BUILD_LD, ld)
> --    BASIC_FIXUP_EXECUTABLE(BUILD_LD)
> -+    AS_IF([test "x${BUILD_CC}" = "x"], [AC_PATH_PROGS(BUILD_CC, [cl cc gcc])
> -+    BASIC_FIXUP_EXECUTABLE(BUILD_CC)])
> -+    AS_IF([test "x${BUILD_CXX}" = "x"], [AC_PATH_PROGS(BUILD_CXX, [cl CC g++])
> -+    BASIC_FIXUP_EXECUTABLE(BUILD_CXX)])
> -+    AS_IF([test "x${BUILD_LD}" = "x"], [AC_PATH_PROG(BUILD_LD, ld)
> -+    BASIC_FIXUP_EXECUTABLE(BUILD_LD)])
> -   fi
> -   AC_SUBST(BUILD_CC)
> -   AC_SUBST(BUILD_CXX)
> ---- common/autoconf/basics.m4.orig
> -+++ common/autoconf/basics.m4
> -@@ -171,8 +171,15 @@ AC_DEFUN([BASIC_REMOVE_SYMBOLIC_LINKS],
> -       fi
> -     fi
> -
> -+    # First separate the path from the arguments. This will split at the first
> -+    # space.
> -+    complete="[$]$1"
> -+    path="${complete%% *}"
> -+    tmp="$complete EOL"
> -+    arguments="${tmp#* }"
> -+
> -     if test "x$READLINK" != x; then
> --      $1=`$READLINK -f [$]$1`
> -+      new_path=`$READLINK -f $path`
> -     else
> -       # Save the current directory for restoring afterwards
> -       STARTDIR=$PWD
> -@@ -198,8 +205,9 @@ AC_DEFUN([BASIC_REMOVE_SYMBOLIC_LINKS],
> -         let COUNTER=COUNTER+1
> -       done
> -       cd $STARTDIR
> --      $1=$sym_link_dir/$sym_link_file
> -+      new_path=$sym_link_dir/$sym_link_file
> -     fi
> -+    $1="$new_path ${arguments% *}"
> -   fi
> - ])
> -
> diff --git a/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-assembler-flag-handling-in-makefile.patch b/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-assembler-flag-handling-in-makefile.patch
> deleted file mode 100644
> index 3e4f156..0000000
> --- a/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-assembler-flag-handling-in-makefile.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Delay $CXX insertion until after make has evaluated the comma-separated list,
> -as any comma separated parameters in CXX (such as assembler arguments) would
> -break the build
> -
> -Signed-off-by: Erkka Kääriä <erkka.kaaria@intel.com>
> -
> -Upstream-Status: Pending
> -
> ----
> ---- make/common/NativeCompilation.gmk
> -+++ make/common/NativeCompilation.gmk
> -@@ -376,7 +376,7 @@ define SetupNativeCompilation
> -   $$(foreach p,$$($1_SRCS), \
> -       $$(eval $$(call add_native_source,$1,$$p,$$($1_OBJECT_DIR), \
> -           $$($1_CFLAGS) $$($1_EXTRA_CFLAGS),$$($1_CC), \
> --          $$($1_CXXFLAGS) $$($1_EXTRA_CXXFLAGS),$(CXX),$$($1_ASFLAGS))))
> -+          $$($1_CXXFLAGS) $$($1_EXTRA_CXXFLAGS),$$(CXX),$$($1_ASFLAGS))))
> -
> -   # On windows we need to create a resource file
> -   ifeq ($(OPENJDK_TARGET_OS), windows)
> diff --git a/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-libpng-neon-build.patch b/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-libpng-neon-build.patch
> deleted file mode 100644
> index dd6d8e3..0000000
> --- a/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-libpng-neon-build.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -# HG changeset patch
> -# User enevill
> -# Date 1430816900 0
> -#      Tue May 05 09:08:20 2015 +0000
> -# Node ID 88d2b7d7285281d41bcff45af0dd983b0f72811e
> -# Parent  51f5501a54a62aceed6342e7ea3a9a3c67f3885d
> -8078245: AARCH64: JDK fails to build due to undefined symbol in libpng
> -Summary: Add -DPNG_ARM_NEON_OPT=0 to LIBSPLASHSCREEN_CFLAGS flags
> -Reviewed-by: dholmes, ihse, erikj
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ----
> - jdk/make/lib/Awt2dLibraries.gmk |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git jdk/make/lib/Awt2dLibraries.gmk jdk/make/lib/Awt2dLibraries.gmk
> ---- jdk/make/lib/Awt2dLibraries.gmk
> -+++ jdk/make/lib/Awt2dLibraries.gmk
> -@@ -1205,7 +1205,7 @@ ifndef BUILD_HEADLESS_ONLY
> -     LIBSPLASHSCREEN_DIRS += $(JDK_TOPDIR)/src/macosx/native/sun/awt/splashscreen
> -   endif
> -
> --  LIBSPLASHSCREEN_CFLAGS := -DSPLASHSCREEN -DPNG_NO_MMX_CODE \
> -+  LIBSPLASHSCREEN_CFLAGS := -DSPLASHSCREEN -DPNG_NO_MMX_CODE -DPNG_ARM_NEON_OPT=0 \
> -       $(foreach dir, $(LIBSPLASHSCREEN_DIRS), -I$(dir))
> -
> -   ifeq ($(OPENJDK_TARGET_OS), macosx)
> diff --git a/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-pt2.patch b/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-pt2.patch
> index 018640b..b09745c 100644
> --- a/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-pt2.patch
> +++ b/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-build-pt2.patch
> @@ -1,38 +1,11 @@
> ---- hotspot/src/cpu/zero/vm/entry_zero.hpp.orig
> +--- hotspot/src/cpu/zero/vm/entry_zero.hpp
>   +++ hotspot/src/cpu/zero/vm/entry_zero.hpp
> -@@ -26,6 +26,10 @@
> +@@ -26,6 +26,8 @@
>    #ifndef CPU_ZERO_VM_ENTRY_ZERO_HPP
>    #define CPU_ZERO_VM_ENTRY_ZERO_HPP
>    
>   +#include "utilities/globalDefinitions.hpp"
>   +#include "utilities/exceptions.hpp"
> -+#include "interpreter/cppInterpreter.hpp"
> -+
> - class ZeroEntry {
> -  public:
> -   ZeroEntry() {
> ---- hotspot/src/share/vm/interpreter/cppInterpreterGenerator.hpp.orig
> -+++ hotspot/src/share/vm/interpreter/cppInterpreterGenerator.hpp
> -@@ -30,6 +30,10 @@
> -
> - #ifdef CC_INTERP
> + #include "interpreter/cppInterpreter.hpp"
>    
> -+#ifdef TARGET_ARCH_zero
> -+#include "entry_zero.hpp"
> -+#endif
> -+
> - class CppInterpreterGenerator: public AbstractInterpreterGenerator {
> -   protected:
> -   // shared code sequences
> ---- hotspot/src/cpu/zero/vm/nativeInst_zero.cpp.orig
> -+++ hotspot/src/cpu/zero/vm/nativeInst_zero.cpp
> -@@ -26,6 +26,9 @@
> - #include "precompiled.hpp"
> - #include "assembler_zero.inline.hpp"
> - #include "memory/resourceArea.hpp"
> -+#ifdef CC_INTERP
> -+#include "entry_zero.hpp"
> -+#endif
> - #include "nativeInst_zero.hpp"
> - #include "oops/oop.inline.hpp"
> - #include "runtime/handles.hpp"
> + class ZeroEntry {
> diff --git a/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-stdc++11.patch b/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-stdc++11.patch
> deleted file mode 100644
> index 12fc17d..0000000
> --- a/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-stdc++11.patch
> +++ /dev/null
> @@ -1,2631 +0,0 @@
> ---- hotspot/src/os/posix/vm/os_posix.cpp.orig
> -+++ hotspot/src/os/posix/vm/os_posix.cpp
> -@@ -594,7 +594,7 @@ const char* os::Posix::describe_sa_flags
> -   strncpy(buffer, "none", size);
> -
> -   const struct {
> --    int i;
> -+    unsigned i;
> -     const char* s;
> -   } flaginfo [] = {
> -     { SA_NOCLDSTOP, "SA_NOCLDSTOP" },
> ---- hotspot/src/share/vm/classfile/dictionary.hpp.orig
> -+++ hotspot/src/share/vm/classfile/dictionary.hpp
> -@@ -373,7 +373,7 @@ class SymbolPropertyEntry : public Hasht
> -
> -   void print_on(outputStream* st) const {
> -     symbol()->print_value_on(st);
> --    st->print("/mode="INTX_FORMAT, symbol_mode());
> -+    st->print("/mode=" INTX_FORMAT, symbol_mode());
> -     st->print(" -> ");
> -     bool printed = false;
> -     if (method() != NULL) {
> ---- hotspot/src/share/vm/code/exceptionHandlerTable.cpp.orig
> -+++ hotspot/src/share/vm/code/exceptionHandlerTable.cpp
> -@@ -186,7 +186,7 @@ uint ImplicitExceptionTable::at( uint ex
> - void ImplicitExceptionTable::print(address base) const {
> -   tty->print("{");
> -   for( uint i=0; i<len(); i++ )
> --    tty->print("< "INTPTR_FORMAT", "INTPTR_FORMAT" > ",base + *adr(i), base + *(adr(i)+1));
> -+    tty->print("< " INTPTR_FORMAT ", " INTPTR_FORMAT " > ",base + *adr(i), base + *(adr(i)+1));
> -   tty->print_cr("}");
> - }
> -
> ---- hotspot/src/share/vm/code/nmethod.cpp.orig
> -+++ hotspot/src/share/vm/code/nmethod.cpp
> -@@ -2344,7 +2344,7 @@ public:
> -   void maybe_print(oop* p) {
> -     if (_print_nm == NULL)  return;
> -     if (!_detected_scavenge_root)  _print_nm->print_on(tty, "new scavenge root");
> --    tty->print_cr(""PTR_FORMAT"[offset=%d] detected scavengable oop "PTR_FORMAT" (found at "PTR_FORMAT")",
> -+    tty->print_cr("" PTR_FORMAT "[offset=%d] detected scavengable oop " PTR_FORMAT " (found at " PTR_FORMAT ")",
> -                   _print_nm, (int)((intptr_t)p - (intptr_t)_print_nm),
> -                   (void *)(*p), (intptr_t)p);
> -     (*p)->print();
> -@@ -2725,7 +2725,7 @@ public:
> -       _nm->print_nmethod(true);
> -       _ok = false;
> -     }
> --    tty->print_cr("*** non-oop "PTR_FORMAT" found at "PTR_FORMAT" (offset %d)",
> -+    tty->print_cr("*** non-oop " PTR_FORMAT " found at " PTR_FORMAT " (offset %d)",
> -                   (void *)(*p), (intptr_t)p, (int)((intptr_t)p - (intptr_t)_nm));
> -   }
> -   virtual void do_oop(narrowOop* p) { ShouldNotReachHere(); }
> -@@ -2849,7 +2849,7 @@ public:
> -       _nm->print_nmethod(true);
> -       _ok = false;
> -     }
> --    tty->print_cr("*** scavengable oop "PTR_FORMAT" found at "PTR_FORMAT" (offset %d)",
> -+    tty->print_cr("*** scavengable oop " PTR_FORMAT " found at " PTR_FORMAT " (offset %d)",
> -                   (void *)(*p), (intptr_t)p, (int)((intptr_t)p - (intptr_t)_nm));
> -     (*p)->print();
> -   }
> -@@ -2894,7 +2894,7 @@ void nmethod::print() const {
> -   print_on(tty, NULL);
> -
> -   if (WizardMode) {
> --    tty->print("((nmethod*) "INTPTR_FORMAT ") ", this);
> -+    tty->print("((nmethod*) " INTPTR_FORMAT ") ", this);
> -     tty->print(" for method " INTPTR_FORMAT , (address)method());
> -     tty->print(" { ");
> -     if (is_in_use())      tty->print("in_use ");
> ---- hotspot/src/share/vm/compiler/compileBroker.cpp.orig
> -+++ hotspot/src/share/vm/compiler/compileBroker.cpp
> -@@ -203,7 +203,7 @@ class CompilationLog : public StringEven
> -   }
> -
> -   void log_nmethod(JavaThread* thread, nmethod* nm) {
> --    log(thread, "nmethod %d%s " INTPTR_FORMAT " code ["INTPTR_FORMAT ", " INTPTR_FORMAT "]",
> -+    log(thread, "nmethod %d%s " INTPTR_FORMAT " code [" INTPTR_FORMAT ", " INTPTR_FORMAT "]",
> -         nm->compile_id(), nm->is_osr_method() ? "%" : "",
> -         p2i(nm), p2i(nm->code_begin()), p2i(nm->code_end()));
> -   }
> ---- hotspot/src/share/vm/compiler/disassembler.cpp.orig
> -+++ hotspot/src/share/vm/compiler/disassembler.cpp
> -@@ -63,7 +63,7 @@ bool        Disassembler::_tried_to_load
> - Disassembler::decode_func_virtual Disassembler::_decode_instructions_virtual = NULL;
> - Disassembler::decode_func Disassembler::_decode_instructions = NULL;
> -
> --static const char hsdis_library_name[] = "hsdis-"HOTSPOT_LIB_ARCH;
> -+static const char hsdis_library_name[] = "hsdis-" HOTSPOT_LIB_ARCH;
> - static const char decode_instructions_virtual_name[] = "decode_instructions_virtual";
> - static const char decode_instructions_name[] = "decode_instructions";
> - static bool use_new_version = true;
> ---- hotspot/src/share/vm/gc_implementation/concurrentMarkSweep/concurrentMarkSweepGeneration.cpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/concurrentMarkSweep/concurrentMarkSweepGeneration.cpp
> -@@ -838,18 +838,18 @@ void ConcurrentMarkSweepGeneration::prin
> -   GenCollectedHeap* gch = GenCollectedHeap::heap();
> -   if (PrintGCDetails) {
> -     if (Verbose) {
> --      gclog_or_tty->print("[%d %s-%s: "SIZE_FORMAT"("SIZE_FORMAT")]",
> -+      gclog_or_tty->print("[%d %s-%s: " SIZE_FORMAT "(" SIZE_FORMAT ")]",
> -         level(), short_name(), s, used(), capacity());
> -     } else {
> --      gclog_or_tty->print("[%d %s-%s: "SIZE_FORMAT"K("SIZE_FORMAT"K)]",
> -+      gclog_or_tty->print("[%d %s-%s: " SIZE_FORMAT "K(" SIZE_FORMAT "K)]",
> -         level(), short_name(), s, used() / K, capacity() / K);
> -     }
> -   }
> -   if (Verbose) {
> --    gclog_or_tty->print(" "SIZE_FORMAT"("SIZE_FORMAT")",
> -+    gclog_or_tty->print(" " SIZE_FORMAT "(" SIZE_FORMAT ")",
> -               gch->used(), gch->capacity());
> -   } else {
> --    gclog_or_tty->print(" "SIZE_FORMAT"K("SIZE_FORMAT"K)",
> -+    gclog_or_tty->print(" " SIZE_FORMAT "K(" SIZE_FORMAT "K)",
> -               gch->used() / K, gch->capacity() / K);
> -   }
> - }
> -@@ -879,8 +879,8 @@ bool ConcurrentMarkSweepGeneration::prom
> -   bool   res = (available >= av_promo) || (available >= max_promotion_in_bytes);
> -   if (Verbose && PrintGCDetails) {
> -     gclog_or_tty->print_cr(
> --      "CMS: promo attempt is%s safe: available("SIZE_FORMAT") %s av_promo("SIZE_FORMAT"),"
> --      "max_promo("SIZE_FORMAT")",
> -+      "CMS: promo attempt is%s safe: available(" SIZE_FORMAT ") %s av_promo(" SIZE_FORMAT "),"
> -+      "max_promo(" SIZE_FORMAT ")",
> -       res? "":" not", available, res? ">=":"<",
> -       av_promo, max_promotion_in_bytes);
> -   }
> -@@ -966,8 +966,8 @@ void ConcurrentMarkSweepGeneration::comp
> -         desired_free_percentage);
> -       gclog_or_tty->print_cr("  Maximum free fraction %f",
> -         maximum_free_percentage);
> --      gclog_or_tty->print_cr("  Capactiy "SIZE_FORMAT, capacity()/1000);
> --      gclog_or_tty->print_cr("  Desired capacity "SIZE_FORMAT,
> -+      gclog_or_tty->print_cr("  Capactiy " SIZE_FORMAT, capacity()/1000);
> -+      gclog_or_tty->print_cr("  Desired capacity " SIZE_FORMAT,
> -         desired_capacity/1000);
> -       int prev_level = level() - 1;
> -       if (prev_level >= 0) {
> -@@ -975,14 +975,14 @@ void ConcurrentMarkSweepGeneration::comp
> -         GenCollectedHeap* gch = GenCollectedHeap::heap();
> -         Generation* prev_gen = gch->_gens[prev_level];
> -         prev_size = prev_gen->capacity();
> --          gclog_or_tty->print_cr("  Younger gen size "SIZE_FORMAT,
> -+          gclog_or_tty->print_cr("  Younger gen size " SIZE_FORMAT,
> -                                  prev_size/1000);
> -       }
> --      gclog_or_tty->print_cr("  unsafe_max_alloc_nogc "SIZE_FORMAT,
> -+      gclog_or_tty->print_cr("  unsafe_max_alloc_nogc " SIZE_FORMAT,
> -         unsafe_max_alloc_nogc()/1000);
> --      gclog_or_tty->print_cr("  contiguous available "SIZE_FORMAT,
> -+      gclog_or_tty->print_cr("  contiguous available " SIZE_FORMAT,
> -         contiguous_available()/1000);
> --      gclog_or_tty->print_cr("  Expand by "SIZE_FORMAT" (bytes)",
> -+      gclog_or_tty->print_cr("  Expand by " SIZE_FORMAT " (bytes)",
> -         expand_bytes);
> -     }
> -     // safe if expansion fails
> -@@ -1513,8 +1513,8 @@ bool CMSCollector::shouldConcurrentColle
> -     stats().print_on(gclog_or_tty);
> -     gclog_or_tty->print_cr("time_until_cms_gen_full %3.7f",
> -       stats().time_until_cms_gen_full());
> --    gclog_or_tty->print_cr("free="SIZE_FORMAT, _cmsGen->free());
> --    gclog_or_tty->print_cr("contiguous_available="SIZE_FORMAT,
> -+    gclog_or_tty->print_cr("free=" SIZE_FORMAT, _cmsGen->free());
> -+    gclog_or_tty->print_cr("contiguous_available=" SIZE_FORMAT,
> -                            _cmsGen->contiguous_available());
> -     gclog_or_tty->print_cr("promotion_rate=%g", stats().promotion_rate());
> -     gclog_or_tty->print_cr("cms_allocation_rate=%g", stats().cms_allocation_rate());
> -@@ -2792,7 +2792,7 @@ void ConcurrentMarkSweepGeneration::gc_p
> -     assert(_numObjectsPromoted == 0, "check");
> -     assert(_numWordsPromoted   == 0, "check");
> -     if (Verbose && PrintGC) {
> --      gclog_or_tty->print("Allocated "SIZE_FORMAT" objects, "
> -+      gclog_or_tty->print("Allocated " SIZE_FORMAT " objects, "
> -                           SIZE_FORMAT" bytes concurrently",
> -       _numObjectsAllocated, _numWordsAllocated*sizeof(HeapWord));
> -     }
> -@@ -2879,7 +2879,7 @@ void ConcurrentMarkSweepGeneration::gc_e
> -     assert(_numObjectsAllocated == 0, "check");
> -     assert(_numWordsAllocated == 0, "check");
> -     if (Verbose && PrintGC) {
> --      gclog_or_tty->print("Promoted "SIZE_FORMAT" objects, "
> -+      gclog_or_tty->print("Promoted " SIZE_FORMAT " objects, "
> -                           SIZE_FORMAT" bytes",
> -                  _numObjectsPromoted, _numWordsPromoted*sizeof(HeapWord));
> -     }
> -@@ -2890,7 +2890,7 @@ void ConcurrentMarkSweepGeneration::gc_e
> -   if (PrintGC && Verbose) {
> -     // Call down the chain in contiguous_available needs the freelistLock
> -     // so print this out before releasing the freeListLock.
> --    gclog_or_tty->print(" Contiguous available "SIZE_FORMAT" bytes ",
> -+    gclog_or_tty->print(" Contiguous available " SIZE_FORMAT " bytes ",
> -                         contiguous_available());
> -   }
> - }
> -@@ -2978,7 +2978,7 @@ class VerifyMarkedClosure: public BitMap
> -     HeapWord* addr = _marks->offsetToHeapWord(offset);
> -     if (!_marks->isMarked(addr)) {
> -       oop(addr)->print_on(gclog_or_tty);
> --      gclog_or_tty->print_cr(" ("INTPTR_FORMAT" should have been marked)", addr);
> -+      gclog_or_tty->print_cr(" (" INTPTR_FORMAT " should have been marked)", addr);
> -       _failed = true;
> -     }
> -     return true;
> -@@ -5039,7 +5039,7 @@ void CMSCollector::checkpointRootsFinal(
> -
> -   SpecializationStats::clear();
> -   if (PrintGCDetails) {
> --    gclog_or_tty->print("[YG occupancy: "SIZE_FORMAT" K ("SIZE_FORMAT" K)]",
> -+    gclog_or_tty->print("[YG occupancy: " SIZE_FORMAT " K (" SIZE_FORMAT " K)]",
> -                         _young_gen->used() / K,
> -                         _young_gen->capacity() / K);
> -   }
> -@@ -5172,8 +5172,8 @@ void CMSCollector::checkpointRootsFinalW
> -   if (ser_ovflw > 0) {
> -     if (PrintCMSStatistics != 0) {
> -       gclog_or_tty->print_cr("Marking stack overflow (benign) "
> --        "(pmc_pc="SIZE_FORMAT", pmc_rm="SIZE_FORMAT", kac="SIZE_FORMAT
> --        ", kac_preclean="SIZE_FORMAT")",
> -+        "(pmc_pc=" SIZE_FORMAT ", pmc_rm=" SIZE_FORMAT ", kac=" SIZE_FORMAT
> -+        ", kac_preclean=" SIZE_FORMAT ")",
> -         _ser_pmc_preclean_ovflw, _ser_pmc_remark_ovflw,
> -         _ser_kac_ovflw, _ser_kac_preclean_ovflw);
> -     }
> -@@ -5186,7 +5186,7 @@ void CMSCollector::checkpointRootsFinalW
> -   if (_par_pmc_remark_ovflw > 0 || _par_kac_ovflw > 0) {
> -     if (PrintCMSStatistics != 0) {
> -       gclog_or_tty->print_cr("Work queue overflow (benign) "
> --        "(pmc_rm="SIZE_FORMAT", kac="SIZE_FORMAT")",
> -+        "(pmc_rm=" SIZE_FORMAT ", kac=" SIZE_FORMAT ")",
> -         _par_pmc_remark_ovflw, _par_kac_ovflw);
> -     }
> -     _par_pmc_remark_ovflw = 0;
> -@@ -5194,12 +5194,12 @@ void CMSCollector::checkpointRootsFinalW
> -   }
> -   if (PrintCMSStatistics != 0) {
> -      if (_markStack._hit_limit > 0) {
> --       gclog_or_tty->print_cr(" (benign) Hit max stack size limit ("SIZE_FORMAT")",
> -+       gclog_or_tty->print_cr(" (benign) Hit max stack size limit (" SIZE_FORMAT ")",
> -                               _markStack._hit_limit);
> -      }
> -      if (_markStack._failed_double > 0) {
> --       gclog_or_tty->print_cr(" (benign) Failed stack doubling ("SIZE_FORMAT"),"
> --                              " current capacity "SIZE_FORMAT,
> -+       gclog_or_tty->print_cr(" (benign) Failed stack doubling (" SIZE_FORMAT "),"
> -+                              " current capacity " SIZE_FORMAT,
> -                               _markStack._failed_double,
> -                               _markStack.capacity());
> -      }
> -@@ -5963,7 +5963,7 @@ void CMSCollector::do_remark_non_paralle
> -                                                &markFromDirtyCardsClosure);
> -       verify_work_stacks_empty();
> -       if (PrintCMSStatistics != 0) {
> --        gclog_or_tty->print(" (re-scanned "SIZE_FORMAT" dirty cards in cms gen) ",
> -+        gclog_or_tty->print(" (re-scanned " SIZE_FORMAT " dirty cards in cms gen) ",
> -           markFromDirtyCardsClosure.num_dirty_cards());
> -       }
> -     }
> -@@ -6893,7 +6893,7 @@ void CMSMarkStack::expand() {
> -   } else if (_failed_double++ == 0 && !CMSConcurrentMTEnabled && PrintGCDetails) {
> -     // Failed to double capacity, continue;
> -     // we print a detail message only once per CMS cycle.
> --    gclog_or_tty->print(" (benign) Failed to expand marking stack from "SIZE_FORMAT"K to "
> -+    gclog_or_tty->print(" (benign) Failed to expand marking stack from " SIZE_FORMAT "K to "
> -             SIZE_FORMAT"K",
> -             _capacity / K, new_capacity / K);
> -   }
> -@@ -8216,25 +8216,25 @@ SweepClosure::~SweepClosure() {
> -     ShouldNotReachHere();
> -   }
> -   if (Verbose && PrintGC) {
> --    gclog_or_tty->print("Collected "SIZE_FORMAT" objects, " SIZE_FORMAT " bytes",
> -+    gclog_or_tty->print("Collected " SIZE_FORMAT " objects, " SIZE_FORMAT " bytes",
> -                         _numObjectsFreed, _numWordsFreed*sizeof(HeapWord));
> --    gclog_or_tty->print_cr("\nLive "SIZE_FORMAT" objects,  "
> -+    gclog_or_tty->print_cr("\nLive " SIZE_FORMAT " objects,  "
> -                            SIZE_FORMAT" bytes  "
> --      "Already free "SIZE_FORMAT" objects, "SIZE_FORMAT" bytes",
> -+      "Already free " SIZE_FORMAT " objects, " SIZE_FORMAT " bytes",
> -       _numObjectsLive, _numWordsLive*sizeof(HeapWord),
> -       _numObjectsAlreadyFree, _numWordsAlreadyFree*sizeof(HeapWord));
> -     size_t totalBytes = (_numWordsFreed + _numWordsLive + _numWordsAlreadyFree)
> -                         * sizeof(HeapWord);
> --    gclog_or_tty->print_cr("Total sweep: "SIZE_FORMAT" bytes", totalBytes);
> -+    gclog_or_tty->print_cr("Total sweep: " SIZE_FORMAT " bytes", totalBytes);
> -
> -     if (PrintCMSStatistics && CMSVerifyReturnedBytes) {
> -       size_t indexListReturnedBytes = _sp->sumIndexedFreeListArrayReturnedBytes();
> -       size_t dict_returned_bytes = _sp->dictionary()->sum_dict_returned_bytes();
> -       size_t returned_bytes = indexListReturnedBytes + dict_returned_bytes;
> --      gclog_or_tty->print("Returned "SIZE_FORMAT" bytes", returned_bytes);
> --      gclog_or_tty->print("   Indexed List Returned "SIZE_FORMAT" bytes",
> -+      gclog_or_tty->print("Returned " SIZE_FORMAT " bytes", returned_bytes);
> -+      gclog_or_tty->print("   Indexed List Returned " SIZE_FORMAT " bytes",
> -         indexListReturnedBytes);
> --      gclog_or_tty->print_cr("        Dictionary Returned "SIZE_FORMAT" bytes",
> -+      gclog_or_tty->print_cr("        Dictionary Returned " SIZE_FORMAT " bytes",
> -         dict_returned_bytes);
> -     }
> -   }
> -@@ -8313,13 +8313,13 @@ size_t SweepClosure::do_blk_careful(Heap
> -     // coalesced chunk to the appropriate free list.
> -     if (inFreeRange()) {
> -       assert(freeFinger() >= _sp->bottom() && freeFinger() < _limit,
> --             err_msg("freeFinger() " PTR_FORMAT" is out-of-bounds", freeFinger()));
> -+             err_msg("freeFinger() " PTR_FORMAT " is out-of-bounds", freeFinger()));
> -       flush_cur_free_chunk(freeFinger(),
> -                            pointer_delta(addr, freeFinger()));
> -       if (CMSTraceSweeper) {
> -         gclog_or_tty->print("Sweep: last chunk: ");
> --        gclog_or_tty->print("put_free_blk 0x%x ("SIZE_FORMAT") "
> --                   "[coalesced:"SIZE_FORMAT"]\n",
> -+        gclog_or_tty->print("put_free_blk 0x%x (" SIZE_FORMAT ") "
> -+                   "[coalesced:" SIZE_FORMAT "]\n",
> -                    freeFinger(), pointer_delta(addr, freeFinger()),
> -                    lastFreeRangeCoalesced());
> -       }
> ---- hotspot/src/share/vm/gc_implementation/g1/collectionSetChooser.hpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/collectionSetChooser.hpp
> -@@ -92,7 +92,7 @@ public:
> -     regions_at_put(_curr_index, NULL);
> -     assert(hr->reclaimable_bytes() <= _remaining_reclaimable_bytes,
> -            err_msg("remaining reclaimable bytes inconsistent "
> --                   "from region: "SIZE_FORMAT" remaining: "SIZE_FORMAT,
> -+                   "from region: " SIZE_FORMAT " remaining: " SIZE_FORMAT,
> -                    hr->reclaimable_bytes(), _remaining_reclaimable_bytes));
> -     _remaining_reclaimable_bytes -= hr->reclaimable_bytes();
> -     _curr_index += 1;
> ---- hotspot/src/share/vm/gc_implementation/g1/concurrentMark.cpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/concurrentMark.cpp
> -@@ -284,7 +284,7 @@ void CMMarkStack::expand() {
> -     if (PrintGCDetails && Verbose) {
> -       // Failed to double capacity, continue;
> -       gclog_or_tty->print(" (benign) Failed to expand marking stack capacity from "
> --                          SIZE_FORMAT"K to " SIZE_FORMAT"K",
> -+                          SIZE_FORMAT "K to " SIZE_FORMAT "K",
> -                           _capacity / K, new_capacity / K);
> -     }
> -   }
> -@@ -581,7 +581,7 @@ ConcurrentMark::ConcurrentMark(G1Collect
> -   _verbose_level = verbose_level;
> -
> -   if (verbose_low()) {
> --    gclog_or_tty->print_cr("[global] init, heap start = "PTR_FORMAT", "
> -+    gclog_or_tty->print_cr("[global] init, heap start = " PTR_FORMAT ", "
> -                            "heap end = " INTPTR_FORMAT, p2i(_heap_start), p2i(_heap_end));
> -   }
> -
> -@@ -837,7 +837,7 @@ void ConcurrentMark::set_concurrency_and
> -     // in a STW phase.
> -     assert(!concurrent_marking_in_progress(), "invariant");
> -     assert(out_of_regions(),
> --           err_msg("only way to get here: _finger: "PTR_FORMAT", _heap_end: "PTR_FORMAT,
> -+           err_msg("only way to get here: _finger: " PTR_FORMAT ", _heap_end: " PTR_FORMAT,
> -                    p2i(_finger), p2i(_heap_end)));
> -   }
> - }
> -@@ -1452,7 +1452,7 @@ public:
> -
> -     assert(start <= hr->end() && start <= ntams && ntams <= hr->end(),
> -            err_msg("Preconditions not met - "
> --                   "start: "PTR_FORMAT", ntams: "PTR_FORMAT", end: "PTR_FORMAT,
> -+                   "start: " PTR_FORMAT ", ntams: " PTR_FORMAT ", end: " PTR_FORMAT,
> -                    p2i(start), p2i(ntams), p2i(hr->end())));
> -
> -     // Find the first marked object at or after "start".
> -@@ -1769,10 +1769,10 @@ class FinalCountDataUpdateClosure: publi
> -       }
> -
> -       assert(end_idx <= _card_bm->size(),
> --             err_msg("oob: end_idx=  "SIZE_FORMAT", bitmap size= "SIZE_FORMAT,
> -+             err_msg("oob: end_idx=  " SIZE_FORMAT ", bitmap size= " SIZE_FORMAT,
> -                      end_idx, _card_bm->size()));
> -       assert(start_idx < _card_bm->size(),
> --             err_msg("oob: start_idx=  "SIZE_FORMAT", bitmap size= "SIZE_FORMAT,
> -+             err_msg("oob: start_idx=  " SIZE_FORMAT ", bitmap size= " SIZE_FORMAT,
> -                      start_idx, _card_bm->size()));
> -
> -       _cm->set_card_bitmap_range(_card_bm, start_idx, end_idx, true /* is_par */);
> -@@ -2277,7 +2277,7 @@ class G1CMKeepAliveAndDrainClosure: publ
> -       oop obj = oopDesc::load_decode_heap_oop(p);
> -       if (_cm->verbose_high()) {
> -         gclog_or_tty->print_cr("\t[%u] we're looking at location "
> --                               "*"PTR_FORMAT" = "PTR_FORMAT,
> -+                               "*" PTR_FORMAT " = " PTR_FORMAT,
> -                                _task->worker_id(), p2i(p), p2i((void*) obj));
> -       }
> -
> -@@ -2846,7 +2846,7 @@ public:
> -       }
> -     }
> -
> --    _out->print_cr("  "PTR_FORMAT": "PTR_FORMAT"%s%s",
> -+    _out->print_cr("  " PTR_FORMAT ": " PTR_FORMAT "%s%s",
> -                    p2i(p), p2i((void*) obj), str, str2);
> -   }
> - };
> -@@ -2873,7 +2873,7 @@ public:
> -     bool print_it = _all || over_tams || marked;
> -
> -     if (print_it) {
> --      _out->print_cr(" "PTR_FORMAT"%s",
> -+      _out->print_cr(" " PTR_FORMAT "%s",
> -                      p2i((void *)o), (over_tams) ? " >" : (marked) ? " M" : "");
> -       PrintReachableOopClosure oopCl(_out, _vo, _all);
> -       o->oop_iterate_no_header(&oopCl);
> -@@ -2894,7 +2894,7 @@ public:
> -     HeapWord* e = hr->end();
> -     HeapWord* t = hr->top();
> -     HeapWord* p = _g1h->top_at_mark_start(hr, _vo);
> --    _out->print_cr("** ["PTR_FORMAT", "PTR_FORMAT"] top: "PTR_FORMAT" "
> -+    _out->print_cr("** [" PTR_FORMAT ", " PTR_FORMAT "] top: " PTR_FORMAT " "
> -                    "TAMS: " PTR_FORMAT, p2i(b), p2i(e), p2i(t), p2i(p));
> -     _out->cr();
> -
> -@@ -3018,9 +3018,9 @@ ConcurrentMark::claim_region(uint worker
> -       HeapWord*   limit         = curr_region->next_top_at_mark_start();
> -
> -       if (verbose_low()) {
> --        gclog_or_tty->print_cr("[%u] curr_region = "PTR_FORMAT" "
> --                               "["PTR_FORMAT", "PTR_FORMAT"), "
> --                               "limit = "PTR_FORMAT,
> -+        gclog_or_tty->print_cr("[%u] curr_region = " PTR_FORMAT " "
> -+                               "[" PTR_FORMAT ", " PTR_FORMAT "), "
> -+                               "limit = " PTR_FORMAT,
> -                                worker_id, p2i(curr_region), p2i(bottom), p2i(end), p2i(limit));
> -       }
> -
> -@@ -3035,7 +3035,7 @@ ConcurrentMark::claim_region(uint worker
> -
> -       if (limit > bottom) {
> -         if (verbose_low()) {
> --          gclog_or_tty->print_cr("[%u] region "PTR_FORMAT" is not empty, "
> -+          gclog_or_tty->print_cr("[%u] region " PTR_FORMAT " is not empty, "
> -                                  "returning it ", worker_id, p2i(curr_region));
> -         }
> -         return curr_region;
> -@@ -3043,7 +3043,7 @@ ConcurrentMark::claim_region(uint worker
> -         assert(limit == bottom,
> -                "the region limit should be at bottom");
> -         if (verbose_low()) {
> --          gclog_or_tty->print_cr("[%u] region "PTR_FORMAT" is empty, "
> -+          gclog_or_tty->print_cr("[%u] region " PTR_FORMAT " is empty, "
> -                                  "returning NULL", worker_id, p2i(curr_region));
> -         }
> -         // we return NULL and the caller should try calling
> -@@ -3055,13 +3055,13 @@ ConcurrentMark::claim_region(uint worker
> -       if (verbose_low()) {
> -         if (curr_region == NULL) {
> -           gclog_or_tty->print_cr("[%u] found uncommitted region, moving finger, "
> --                                 "global finger = "PTR_FORMAT", "
> --                                 "our finger = "PTR_FORMAT,
> -+                                 "global finger = " PTR_FORMAT ", "
> -+                                 "our finger = " PTR_FORMAT,
> -                                  worker_id, p2i(_finger), p2i(finger));
> -         } else {
> -           gclog_or_tty->print_cr("[%u] somebody else moved the finger, "
> --                                 "global finger = "PTR_FORMAT", "
> --                                 "our finger = "PTR_FORMAT,
> -+                                 "global finger = " PTR_FORMAT ", "
> -+                                 "our finger = " PTR_FORMAT,
> -                                  worker_id, p2i(_finger), p2i(finger));
> -         }
> -       }
> -@@ -3097,7 +3097,7 @@ private:
> -
> -   void do_object_work(oop obj) {
> -     guarantee(!_g1h->obj_in_cs(obj),
> --              err_msg("obj: "PTR_FORMAT" in CSet, phase: %s, info: %d",
> -+              err_msg("obj: " PTR_FORMAT " in CSet, phase: %s, info: %d",
> -                       p2i((void*) obj), phase_str(), _info));
> -   }
> -
> -@@ -3158,7 +3158,7 @@ void ConcurrentMark::verify_no_cset_oops
> -     // here.
> -     HeapRegion* global_hr = _g1h->heap_region_containing_raw(global_finger);
> -     guarantee(global_hr == NULL || global_finger == global_hr->bottom(),
> --              err_msg("global finger: "PTR_FORMAT" region: "HR_FORMAT,
> -+              err_msg("global finger: " PTR_FORMAT " region: " HR_FORMAT,
> -                       p2i(global_finger), HR_FORMAT_PARAMS(global_hr)));
> -   }
> -
> -@@ -3172,7 +3172,7 @@ void ConcurrentMark::verify_no_cset_oops
> -       HeapRegion* task_hr = _g1h->heap_region_containing_raw(task_finger);
> -       guarantee(task_hr == NULL || task_finger == task_hr->bottom() ||
> -                 !task_hr->in_collection_set(),
> --                err_msg("task finger: "PTR_FORMAT" region: "HR_FORMAT,
> -+                err_msg("task finger: " PTR_FORMAT " region: " HR_FORMAT,
> -                         p2i(task_finger), HR_FORMAT_PARAMS(task_hr)));
> -     }
> -   }
> -@@ -3214,8 +3214,8 @@ class AggregateCountDataHRClosure: publi
> -
> -     assert(start <= limit && limit <= hr->top() && hr->top() <= hr->end(),
> -            err_msg("Preconditions not met - "
> --                   "start: "PTR_FORMAT", limit: "PTR_FORMAT", "
> --                   "top: "PTR_FORMAT", end: "PTR_FORMAT,
> -+                   "start: " PTR_FORMAT ", limit: " PTR_FORMAT ", "
> -+                   "top: " PTR_FORMAT ", end: " PTR_FORMAT,
> -                    p2i(start), p2i(limit), p2i(hr->top()), p2i(hr->end())));
> -
> -     assert(hr->next_marked_bytes() == 0, "Precondition");
> -@@ -3494,7 +3494,7 @@ bool ConcurrentMark::do_yield_check(uint
> - #ifndef PRODUCT
> - // for debugging purposes
> - void ConcurrentMark::print_finger() {
> --  gclog_or_tty->print_cr("heap ["PTR_FORMAT", "PTR_FORMAT"), global finger = "PTR_FORMAT,
> -+  gclog_or_tty->print_cr("heap [" PTR_FORMAT ", " PTR_FORMAT "), global finger = " PTR_FORMAT,
> -                          p2i(_heap_start), p2i(_heap_end), p2i(_finger));
> -   for (uint i = 0; i < _max_worker_id; ++i) {
> -     gclog_or_tty->print("   %u: " PTR_FORMAT, i, p2i(_tasks[i]->finger()));
> -@@ -3579,7 +3579,7 @@ void CMTask::setup_for_region(HeapRegion
> -         "claim_region() should have filtered out continues humongous regions");
> -
> -   if (_cm->verbose_low()) {
> --    gclog_or_tty->print_cr("[%u] setting up for region "PTR_FORMAT,
> -+    gclog_or_tty->print_cr("[%u] setting up for region " PTR_FORMAT,
> -                            _worker_id, p2i(hr));
> -   }
> -
> -@@ -3596,7 +3596,7 @@ void CMTask::update_region_limit() {
> -   if (limit == bottom) {
> -     if (_cm->verbose_low()) {
> -       gclog_or_tty->print_cr("[%u] found an empty region "
> --                             "["PTR_FORMAT", "PTR_FORMAT")",
> -+                             "[" PTR_FORMAT ", " PTR_FORMAT ")",
> -                              _worker_id, p2i(bottom), p2i(limit));
> -     }
> -     // The region was collected underneath our feet.
> -@@ -3628,7 +3628,7 @@ void CMTask::update_region_limit() {
> - void CMTask::giveup_current_region() {
> -   assert(_curr_region != NULL, "invariant");
> -   if (_cm->verbose_low()) {
> --    gclog_or_tty->print_cr("[%u] giving up region "PTR_FORMAT,
> -+    gclog_or_tty->print_cr("[%u] giving up region " PTR_FORMAT,
> -                            _worker_id, p2i(_curr_region));
> -   }
> -   clear_region_fields();
> -@@ -3750,7 +3750,7 @@ void CMTask::regular_clock_call() {
> -
> -   if (_cm->verbose_medium()) {
> -       gclog_or_tty->print_cr("[%u] regular clock, interval = %1.2lfms, "
> --                        "scanned = "SIZE_FORMAT"%s, refs reached = "SIZE_FORMAT"%s",
> -+                        "scanned = " SIZE_FORMAT "%s, refs reached = " SIZE_FORMAT "%s",
> -                         _worker_id, last_interval_ms,
> -                         _words_scanned,
> -                         (_words_scanned >= _words_scanned_limit) ? " (*)" : "",
> -@@ -3919,7 +3919,7 @@ void CMTask::drain_local_queue(bool part
> -       statsOnly( ++_local_pops );
> -
> -       if (_cm->verbose_high()) {
> --        gclog_or_tty->print_cr("[%u] popped "PTR_FORMAT, _worker_id,
> -+        gclog_or_tty->print_cr("[%u] popped " PTR_FORMAT, _worker_id,
> -                                p2i((void*) obj));
> -       }
> -
> -@@ -4272,8 +4272,8 @@ void CMTask::do_marking_step(double time
> -
> -       if (_cm->verbose_low()) {
> -         gclog_or_tty->print_cr("[%u] we're scanning part "
> --                               "["PTR_FORMAT", "PTR_FORMAT") "
> --                               "of region "HR_FORMAT,
> -+                               "[" PTR_FORMAT ", " PTR_FORMAT ") "
> -+                               "of region " HR_FORMAT,
> -                                _worker_id, p2i(_finger), p2i(_region_limit),
> -                                HR_FORMAT_PARAMS(_curr_region));
> -       }
> -@@ -4360,7 +4360,7 @@ void CMTask::do_marking_step(double time
> -
> -         if (_cm->verbose_low()) {
> -           gclog_or_tty->print_cr("[%u] we successfully claimed "
> --                                 "region "PTR_FORMAT,
> -+                                 "region " PTR_FORMAT,
> -                                  _worker_id, p2i(claimed_region));
> -         }
> -
> -@@ -4421,7 +4421,7 @@ void CMTask::do_marking_step(double time
> -
> -       if (_cm->try_stealing(_worker_id, &_hash_seed, obj)) {
> -         if (_cm->verbose_medium()) {
> --          gclog_or_tty->print_cr("[%u] stolen "PTR_FORMAT" successfully",
> -+          gclog_or_tty->print_cr("[%u] stolen " PTR_FORMAT " successfully",
> -                                  _worker_id, p2i((void*) obj));
> -         }
> -
> -@@ -4629,7 +4629,7 @@ CMTask::CMTask(uint worker_id,
> - // identify them easily in a large log file.
> - #define G1PPRL_LINE_PREFIX            "###"
> -
> --#define G1PPRL_ADDR_BASE_FORMAT    " "PTR_FORMAT"-"PTR_FORMAT
> -+#define G1PPRL_ADDR_BASE_FORMAT    " " PTR_FORMAT "-" PTR_FORMAT
> - #ifdef _LP64
> - #define G1PPRL_ADDR_BASE_H_FORMAT  " %37s"
> - #else // _LP64
> -@@ -4639,16 +4639,16 @@ CMTask::CMTask(uint worker_id,
> - // For per-region info
> - #define G1PPRL_TYPE_FORMAT            "   %-4s"
> - #define G1PPRL_TYPE_H_FORMAT          "   %4s"
> --#define G1PPRL_BYTE_FORMAT            "  "SIZE_FORMAT_W(9)
> -+#define G1PPRL_BYTE_FORMAT            "  " SIZE_FORMAT_W(9)
> - #define G1PPRL_BYTE_H_FORMAT          "  %9s"
> - #define G1PPRL_DOUBLE_FORMAT          "  %14.1f"
> - #define G1PPRL_DOUBLE_H_FORMAT        "  %14s"
> -
> - // For summary info
> --#define G1PPRL_SUM_ADDR_FORMAT(tag)    "  "tag":"G1PPRL_ADDR_BASE_FORMAT
> --#define G1PPRL_SUM_BYTE_FORMAT(tag)    "  "tag": "SIZE_FORMAT
> --#define G1PPRL_SUM_MB_FORMAT(tag)      "  "tag": %1.2f MB"
> --#define G1PPRL_SUM_MB_PERC_FORMAT(tag) G1PPRL_SUM_MB_FORMAT(tag)" / %1.2f %%"
> -+#define G1PPRL_SUM_ADDR_FORMAT(tag)    "  " tag ":" G1PPRL_ADDR_BASE_FORMAT
> -+#define G1PPRL_SUM_BYTE_FORMAT(tag)    "  " tag ": " SIZE_FORMAT
> -+#define G1PPRL_SUM_MB_FORMAT(tag)      "  " tag ": %1.2f MB"
> -+#define G1PPRL_SUM_MB_PERC_FORMAT(tag) G1PPRL_SUM_MB_FORMAT(tag) " / %1.2f %%"
> -
> - G1PrintRegionLivenessInfoClosure::
> - G1PrintRegionLivenessInfoClosure(outputStream* out, const char* phase_name)
> ---- hotspot/src/share/vm/gc_implementation/g1/concurrentMark.inline.hpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/concurrentMark.inline.hpp
> -@@ -196,8 +196,8 @@ inline bool CMBitMapRO::iterate(BitMapCl
> -   assert(_bmStartWord <= (addr) && (addr) < (_bmStartWord + _bmWordSize),      \
> -          "outside underlying space?");                                         \
> -   assert(G1CollectedHeap::heap()->is_in_exact(addr),                           \
> --         err_msg("Trying to access not available bitmap "PTR_FORMAT            \
> --                 " corresponding to "PTR_FORMAT" (%u)",                        \
> -+         err_msg("Trying to access not available bitmap " PTR_FORMAT           \
> -+                 " corresponding to " PTR_FORMAT " (%u)",                      \
> -                  p2i(this), p2i(addr), G1CollectedHeap::heap()->addr_to_region(addr)));
> -
> - inline void CMBitMap::mark(HeapWord* addr) {
> -@@ -343,7 +343,7 @@ inline void CMTask::make_reference_grey(
> -
> - inline void CMTask::deal_with_reference(oop obj) {
> -   if (_cm->verbose_high()) {
> --    gclog_or_tty->print_cr("[%u] we're dealing with reference = "PTR_FORMAT,
> -+    gclog_or_tty->print_cr("[%u] we're dealing with reference = " PTR_FORMAT,
> -                            _worker_id, p2i((void*) obj));
> -   }
> -
> -@@ -392,7 +392,7 @@ inline void ConcurrentMark::grayRoot(oop
> -   // assert that word_size is under an upper bound which is its
> -   // containing region's capacity.
> -   assert(word_size * HeapWordSize <= hr->capacity(),
> --         err_msg("size: "SIZE_FORMAT" capacity: "SIZE_FORMAT" "HR_FORMAT,
> -+         err_msg("size: " SIZE_FORMAT " capacity: " SIZE_FORMAT " " HR_FORMAT,
> -                  word_size * HeapWordSize, hr->capacity(),
> -                  HR_FORMAT_PARAMS(hr)));
> -
> ---- hotspot/src/share/vm/gc_implementation/g1/g1AllocRegion.cpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/g1AllocRegion.cpp
> -@@ -140,7 +140,7 @@ HeapWord* G1AllocRegion::new_alloc_regio
> - }
> -
> - void G1AllocRegion::fill_in_ext_msg(ar_ext_msg* msg, const char* message) {
> --  msg->append("[%s] %s c: %u b: %s r: "PTR_FORMAT" u: "SIZE_FORMAT,
> -+  msg->append("[%s] %s c: %u b: %s r: " PTR_FORMAT " u: " SIZE_FORMAT,
> -               _name, message, _count, BOOL_TO_STR(_bot_updates),
> -               p2i(_alloc_region), _used_bytes_before);
> - }
> -@@ -217,7 +217,7 @@ void G1AllocRegion::trace(const char* st
> -
> -     if (G1_ALLOC_REGION_TRACING > 1) {
> -       if (result != NULL) {
> --        jio_snprintf(rest_buffer, buffer_length, SIZE_FORMAT" "PTR_FORMAT,
> -+        jio_snprintf(rest_buffer, buffer_length, SIZE_FORMAT " " PTR_FORMAT,
> -                      word_size, result);
> -       } else if (word_size != 0) {
> -         jio_snprintf(rest_buffer, buffer_length, SIZE_FORMAT, word_size);
> ---- hotspot/src/share/vm/gc_implementation/g1/g1Allocator.hpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/g1Allocator.hpp
> -@@ -73,7 +73,7 @@ public:
> -
> -    void decrease_used(size_t bytes) {
> -      assert(_summary_bytes_used >= bytes,
> --            err_msg("invariant: _summary_bytes_used: "SIZE_FORMAT" should be >= bytes: "SIZE_FORMAT,
> -+            err_msg("invariant: _summary_bytes_used: " SIZE_FORMAT " should be >= bytes: " SIZE_FORMAT,
> -                 _summary_bytes_used, bytes));
> -      _summary_bytes_used -= bytes;
> -    }
> ---- hotspot/src/share/vm/gc_implementation/g1/g1BlockOffsetTable.cpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/g1BlockOffsetTable.cpp
> -@@ -385,11 +385,11 @@ G1BlockOffsetArray::verify_for_object(He
> -     HeapWord* card_addr = _array->address_for_index(card);
> -     HeapWord* block_start = block_start_const(card_addr);
> -     if (block_start != obj_start) {
> --      gclog_or_tty->print_cr("block start: "PTR_FORMAT" is incorrect - "
> --                             "card index: "SIZE_FORMAT" "
> --                             "card addr: "PTR_FORMAT" BOT entry: %u "
> --                             "obj: "PTR_FORMAT" word size: "SIZE_FORMAT" "
> --                             "cards: ["SIZE_FORMAT","SIZE_FORMAT"]",
> -+      gclog_or_tty->print_cr("block start: " PTR_FORMAT " is incorrect - "
> -+                             "card index: " SIZE_FORMAT " "
> -+                             "card addr: " PTR_FORMAT " BOT entry: %u "
> -+                             "obj: " PTR_FORMAT " word size: " SIZE_FORMAT " "
> -+                             "cards: [" SIZE_FORMAT "," SIZE_FORMAT "]",
> -                              block_start, card, card_addr,
> -                              _array->offset_array(card),
> -                              obj_start, word_size, first_card, last_card);
> -@@ -404,11 +404,11 @@ void
> - G1BlockOffsetArray::print_on(outputStream* out) {
> -   size_t from_index = _array->index_for(_bottom);
> -   size_t to_index = _array->index_for(_end);
> --  out->print_cr(">> BOT for area ["PTR_FORMAT","PTR_FORMAT") "
> --                "cards ["SIZE_FORMAT","SIZE_FORMAT")",
> -+  out->print_cr(">> BOT for area [" PTR_FORMAT "," PTR_FORMAT ") "
> -+                "cards [" SIZE_FORMAT "," SIZE_FORMAT ")",
> -                 _bottom, _end, from_index, to_index);
> -   for (size_t i = from_index; i < to_index; ++i) {
> --    out->print_cr("  entry "SIZE_FORMAT_W(8)" | "PTR_FORMAT" : %3u",
> -+    out->print_cr("  entry " SIZE_FORMAT_W(8) " | " PTR_FORMAT " : %3u",
> -                   i, _array->address_for_index(i),
> -                   (uint) _array->offset_array(i));
> -   }
> -@@ -488,7 +488,7 @@ G1BlockOffsetArrayContigSpace::set_for_s
> - void
> - G1BlockOffsetArrayContigSpace::print_on(outputStream* out) {
> -   G1BlockOffsetArray::print_on(out);
> --  out->print_cr("  next offset threshold: "PTR_FORMAT, _next_offset_threshold);
> --  out->print_cr("  next offset index:     "SIZE_FORMAT, _next_offset_index);
> -+  out->print_cr("  next offset threshold: " PTR_FORMAT, _next_offset_threshold);
> -+  out->print_cr("  next offset index:     " SIZE_FORMAT, _next_offset_index);
> - }
> - #endif // !PRODUCT
> ---- hotspot/src/share/vm/gc_implementation/g1/g1BlockOffsetTable.inline.hpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/g1BlockOffsetTable.inline.hpp
> -@@ -47,15 +47,15 @@ G1BlockOffsetTable::block_start_const(co
> -   }
> - }
> -
> --#define check_index(index, msg)                                                \
> --  assert((index) < (_reserved.word_size() >> LogN_words),                      \
> --         err_msg("%s - index: "SIZE_FORMAT", _vs.committed_size: "SIZE_FORMAT, \
> --                 msg, (index), (_reserved.word_size() >> LogN_words)));        \
> --  assert(G1CollectedHeap::heap()->is_in_exact(address_for_index_raw(index)),   \
> --         err_msg("Index "SIZE_FORMAT" corresponding to "PTR_FORMAT             \
> --                 " (%u) is not in committed area.",                            \
> --                 (index),                                                      \
> --                 p2i(address_for_index_raw(index)),                            \
> -+#define check_index(index, msg)                                                   \
> -+  assert((index) < (_reserved.word_size() >> LogN_words),                         \
> -+         err_msg("%s - index: " SIZE_FORMAT ", _vs.committed_size: " SIZE_FORMAT, \
> -+                 msg, (index), (_reserved.word_size() >> LogN_words)));           \
> -+  assert(G1CollectedHeap::heap()->is_in_exact(address_for_index_raw(index)),      \
> -+         err_msg("Index " SIZE_FORMAT " corresponding to " PTR_FORMAT             \
> -+                 " (%u) is not in committed area.",                               \
> -+                 (index),                                                         \
> -+                 p2i(address_for_index_raw(index)),                               \
> -                  G1CollectedHeap::heap()->addr_to_region(address_for_index_raw(index))));
> -
> - u_char G1BlockOffsetSharedArray::offset_array(size_t index) const {
> ---- hotspot/src/share/vm/gc_implementation/g1/g1CardCounts.cpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/g1CardCounts.cpp
> -@@ -44,7 +44,7 @@ void G1CardCountsMappingChangedListener:
> - void G1CardCounts::clear_range(size_t from_card_num, size_t to_card_num) {
> -   if (has_count_table()) {
> -     assert(from_card_num < to_card_num,
> --           err_msg("Wrong order? from: " SIZE_FORMAT ", to: "SIZE_FORMAT,
> -+           err_msg("Wrong order? from: " SIZE_FORMAT ", to: " SIZE_FORMAT,
> -                    from_card_num, to_card_num));
> -     Copy::fill_to_bytes(&_card_counts[from_card_num], (to_card_num - from_card_num));
> -   }
> -@@ -87,7 +87,7 @@ uint G1CardCounts::add_card_count(jbyte*
> -   if (has_count_table()) {
> -     size_t card_num = ptr_2_card_num(card_ptr);
> -     assert(card_num < _reserved_max_card_num,
> --           err_msg("Card "SIZE_FORMAT" outside of card counts table (max size "SIZE_FORMAT")",
> -+           err_msg("Card " SIZE_FORMAT " outside of card counts table (max size " SIZE_FORMAT ")",
> -                    card_num, _reserved_max_card_num));
> -     count = (uint) _card_counts[card_num];
> -     if (count < G1ConcRSHotCardLimit) {
> ---- hotspot/src/share/vm/gc_implementation/g1/g1CardCounts.hpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/g1CardCounts.hpp
> -@@ -91,7 +91,7 @@ class G1CardCounts: public CHeapObj<mtGC
> -
> -   jbyte* card_num_2_ptr(size_t card_num) {
> -     assert(card_num >= 0 && card_num < _reserved_max_card_num,
> --           err_msg("card num out of range: "SIZE_FORMAT, card_num));
> -+           err_msg("card num out of range: " SIZE_FORMAT, card_num));
> -     return (jbyte*) (_ct_bot + card_num);
> -   }
> -
> ---- hotspot/src/share/vm/gc_implementation/g1/g1CollectedHeap.cpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/g1CollectedHeap.cpp
> -@@ -230,7 +230,7 @@ bool YoungList::check_list_well_formed()
> -   HeapRegion* last = NULL;
> -   while (curr != NULL) {
> -     if (!curr->is_young()) {
> --      gclog_or_tty->print_cr("### YOUNG REGION "PTR_FORMAT"-"PTR_FORMAT" "
> -+      gclog_or_tty->print_cr("### YOUNG REGION " PTR_FORMAT "-" PTR_FORMAT " "
> -                              "incorrectly tagged (y: %d, surv: %d)",
> -                              curr->bottom(), curr->end(),
> -                              curr->is_young(), curr->is_survivor());
> -@@ -359,7 +359,7 @@ void YoungList::print() {
> -     if (curr == NULL)
> -       gclog_or_tty->print_cr("  empty");
> -     while (curr != NULL) {
> --      gclog_or_tty->print_cr("  "HR_FORMAT", P: "PTR_FORMAT ", N: "PTR_FORMAT", age: %4d",
> -+      gclog_or_tty->print_cr("  " HR_FORMAT ", P: " PTR_FORMAT ", N: " PTR_FORMAT ", age: %4d",
> -                              HR_FORMAT_PARAMS(curr),
> -                              curr->prev_top_at_mark_start(),
> -                              curr->next_top_at_mark_start(),
> -@@ -490,7 +490,7 @@ void G1CollectedHeap::check_ct_logs_at_s
> -   gclog_or_tty->print_cr("Log entries = %d, dirty cards = %d.",
> -                          clear.num_processed(), orig_count);
> -   guarantee(redirty.num_processed() == clear.num_processed(),
> --            err_msg("Redirtied "SIZE_FORMAT" cards, bug cleared "SIZE_FORMAT,
> -+            err_msg("Redirtied " SIZE_FORMAT " cards, bug cleared " SIZE_FORMAT,
> -                     redirty.num_processed(), clear.num_processed()));
> -
> -   CountNonCleanMemRegionClosure count3(this);
> -@@ -528,7 +528,7 @@ G1CollectedHeap::new_region_try_secondar
> -       HeapRegion* res = _hrm.allocate_free_region(is_old);
> -       if (G1ConcRegionFreeingVerbose) {
> -         gclog_or_tty->print_cr("G1ConcRegionFreeing [region alloc] : "
> --                               "allocated "HR_FORMAT" from secondary_free_list",
> -+                               "allocated " HR_FORMAT " from secondary_free_list",
> -                                HR_FORMAT_PARAMS(res));
> -       }
> -       return res;
> -@@ -1597,8 +1597,8 @@ resize_if_necessary_after_full_collectio
> -   // This assert only makes sense here, before we adjust them
> -   // with respect to the min and max heap size.
> -   assert(minimum_desired_capacity <= maximum_desired_capacity,
> --         err_msg("minimum_desired_capacity = "SIZE_FORMAT", "
> --                 "maximum_desired_capacity = "SIZE_FORMAT,
> -+         err_msg("minimum_desired_capacity = " SIZE_FORMAT ", "
> -+                 "maximum_desired_capacity = " SIZE_FORMAT,
> -                  minimum_desired_capacity, maximum_desired_capacity));
> -
> -   // Should not be greater than the heap max size. No need to adjust
> -@@ -2256,7 +2256,7 @@ public:
> -   virtual bool doHeapRegion(HeapRegion* hr) {
> -     unsigned region_gc_time_stamp = hr->get_gc_time_stamp();
> -     if (_gc_time_stamp != region_gc_time_stamp) {
> --      gclog_or_tty->print_cr("Region "HR_FORMAT" has GC time stamp = %d, "
> -+      gclog_or_tty->print_cr("Region " HR_FORMAT " has GC time stamp = %d, "
> -                              "expected %d", HR_FORMAT_PARAMS(hr),
> -                              region_gc_time_stamp, _gc_time_stamp);
> -       _failures = true;
> -@@ -2679,7 +2679,7 @@ public:
> -     } else if (r->continuesHumongous()) {
> -       if (r->humongous_start_region() != _sh_region) {
> -         gclog_or_tty->print_cr("Region " HR_FORMAT ", "
> --                               "HS = "PTR_FORMAT", should be "PTR_FORMAT,
> -+                               "HS = " PTR_FORMAT ", should be " PTR_FORMAT,
> -                                HR_FORMAT_PARAMS(r),
> -                                r->humongous_start_region(),
> -                                _sh_region);
> -@@ -2991,10 +2991,10 @@ public:
> -     if (!oopDesc::is_null(heap_oop)) {
> -       oop obj = oopDesc::decode_heap_oop_not_null(heap_oop);
> -       if (_g1h->is_obj_dead_cond(obj, _vo)) {
> --        gclog_or_tty->print_cr("Root location "PTR_FORMAT" "
> --                              "points to dead obj "PTR_FORMAT, p, (void*) obj);
> -+        gclog_or_tty->print_cr("Root location " PTR_FORMAT " "
> -+                              "points to dead obj " PTR_FORMAT, p, (void*) obj);
> -         if (_vo == VerifyOption_G1UseMarkWord) {
> --          gclog_or_tty->print_cr("  Mark word: "PTR_FORMAT, (void*)(obj->mark()));
> -+          gclog_or_tty->print_cr("  Mark word: " PTR_FORMAT, (void*)(obj->mark()));
> -         }
> -         obj->print_on(gclog_or_tty);
> -         _failures = true;
> -@@ -3041,9 +3041,9 @@ class G1VerifyCodeRootOopClosure: public
> -       // Verify that the strong code root list for this region
> -       // contains the nmethod
> -       if (!hrrs->strong_code_roots_list_contains(_nm)) {
> --        gclog_or_tty->print_cr("Code root location "PTR_FORMAT" "
> --                              "from nmethod "PTR_FORMAT" not in strong "
> --                              "code roots for region ["PTR_FORMAT","PTR_FORMAT")",
> -+        gclog_or_tty->print_cr("Code root location " PTR_FORMAT " "
> -+                              "from nmethod " PTR_FORMAT " not in strong "
> -+                              "code roots for region [" PTR_FORMAT "," PTR_FORMAT ")",
> -                               p, _nm, hr->bottom(), hr->end());
> -         _failures = true;
> -       }
> -@@ -3173,7 +3173,7 @@ public:
> -     if (o != NULL) {
> -       HeapWord *start = (HeapWord *) o;
> -       size_t word_sz = o->size();
> --      gclog_or_tty->print("\nPrinting obj "PTR_FORMAT" of size " SIZE_FORMAT
> -+      gclog_or_tty->print("\nPrinting obj " PTR_FORMAT " of size " SIZE_FORMAT
> -                           " isMarkedPrev %d isMarkedNext %d isAllocSince %d\n",
> -                           (void*) o, word_sz,
> -                           _g1->isMarkedPrev(o),
> -@@ -3184,7 +3184,7 @@ public:
> -       int *val;
> -       for (cur = start; cur < end; cur++) {
> -         val = (int *) cur;
> --        gclog_or_tty->print("\t "PTR_FORMAT":"PTR_FORMAT"\n", val, *val);
> -+        gclog_or_tty->print("\t " PTR_FORMAT ":" PTR_FORMAT "\n", val, *val);
> -       }
> -     }
> -   }
> -@@ -3219,9 +3219,9 @@ public:
> -         r->object_iterate(&not_dead_yet_cl);
> -         if (_vo != VerifyOption_G1UseNextMarking) {
> -           if (r->max_live_bytes() < not_dead_yet_cl.live_bytes()) {
> --            gclog_or_tty->print_cr("["PTR_FORMAT","PTR_FORMAT"] "
> --                                   "max_live_bytes "SIZE_FORMAT" "
> --                                   "< calculated "SIZE_FORMAT,
> -+            gclog_or_tty->print_cr("[" PTR_FORMAT "," PTR_FORMAT "] "
> -+                                   "max_live_bytes " SIZE_FORMAT " "
> -+                                   "< calculated " SIZE_FORMAT,
> -                                    r->bottom(), r->end(),
> -                                    r->max_live_bytes(),
> -                                  not_dead_yet_cl.live_bytes());
> -@@ -3533,7 +3533,7 @@ public:
> -     size_t occupied = hrrs->occupied();
> -     _occupied_sum += occupied;
> -
> --    gclog_or_tty->print_cr("Printing RSet for region "HR_FORMAT,
> -+    gclog_or_tty->print_cr("Printing RSet for region " HR_FORMAT,
> -                            HR_FORMAT_PARAMS(r));
> -     if (occupied == 0) {
> -       gclog_or_tty->print_cr("  RSet is empty");
> -@@ -3552,7 +3552,7 @@ public:
> -   }
> -
> -   ~PrintRSetsClosure() {
> --    gclog_or_tty->print_cr("Occupied Sum: "SIZE_FORMAT, _occupied_sum);
> -+    gclog_or_tty->print_cr("Occupied Sum: " SIZE_FORMAT, _occupied_sum);
> -     gclog_or_tty->print_cr("========================================");
> -     gclog_or_tty->cr();
> -   }
> -@@ -4416,7 +4416,7 @@ oop
> - G1CollectedHeap::handle_evacuation_failure_par(G1ParScanThreadState* _par_scan_state,
> -                                                oop old) {
> -   assert(obj_in_cs(old),
> --         err_msg("obj: "PTR_FORMAT" should still be in the CSet",
> -+         err_msg("obj: " PTR_FORMAT " should still be in the CSet",
> -                  (HeapWord*) old));
> -   markOop m = old->mark();
> -   oop forward_ptr = old->forward_to_atomic(old);
> -@@ -4450,7 +4450,7 @@ G1CollectedHeap::handle_evacuation_failu
> -     // space for this object (old != forward_ptr) or they beat us in
> -     // self-forwarding it (old == forward_ptr).
> -     assert(old == forward_ptr || !obj_in_cs(forward_ptr),
> --           err_msg("obj: "PTR_FORMAT" forwarded to: "PTR_FORMAT" "
> -+           err_msg("obj: " PTR_FORMAT " forwarded to: " PTR_FORMAT " "
> -                    "should not be in the CSet",
> -                    (HeapWord*) old, (HeapWord*) forward_ptr));
> -     return forward_ptr;
> -@@ -4837,16 +4837,16 @@ public:
> -
> -   ~G1StringSymbolTableUnlinkTask() {
> -     guarantee(!_process_strings || !_do_in_parallel || StringTable::parallel_claimed_index() >= _initial_string_table_size,
> --              err_msg("claim value "INT32_FORMAT" after unlink less than initial string table size "INT32_FORMAT,
> -+              err_msg("claim value " INT32_FORMAT " after unlink less than initial string table size " INT32_FORMAT,
> -                       StringTable::parallel_claimed_index(), _initial_string_table_size));
> -     guarantee(!_process_symbols || !_do_in_parallel || SymbolTable::parallel_claimed_index() >= _initial_symbol_table_size,
> --              err_msg("claim value "INT32_FORMAT" after unlink less than initial symbol table size "INT32_FORMAT,
> -+              err_msg("claim value " INT32_FORMAT " after unlink less than initial symbol table size " INT32_FORMAT,
> -                       SymbolTable::parallel_claimed_index(), _initial_symbol_table_size));
> -
> -     if (G1TraceStringSymbolTableScrubbing) {
> -       gclog_or_tty->print_cr("Cleaned string and symbol table, "
> --                             "strings: "SIZE_FORMAT" processed, "SIZE_FORMAT" removed, "
> --                             "symbols: "SIZE_FORMAT" processed, "SIZE_FORMAT" removed",
> -+                             "strings: " SIZE_FORMAT " processed, " SIZE_FORMAT " removed, "
> -+                             "symbols: " SIZE_FORMAT " processed, " SIZE_FORMAT " removed",
> -                              strings_processed(), strings_removed(),
> -                              symbols_processed(), symbols_removed());
> -     }
> -@@ -6029,13 +6029,13 @@ void G1CollectedHeap::verify_dirty_young
> - bool G1CollectedHeap::verify_no_bits_over_tams(const char* bitmap_name, CMBitMapRO* bitmap,
> -                                                HeapWord* tams, HeapWord* end) {
> -   guarantee(tams <= end,
> --            err_msg("tams: "PTR_FORMAT" end: "PTR_FORMAT, tams, end));
> -+            err_msg("tams: " PTR_FORMAT " end: " PTR_FORMAT, tams, end));
> -   HeapWord* result = bitmap->getNextMarkedWordAddress(tams, end);
> -   if (result < end) {
> -     gclog_or_tty->cr();
> --    gclog_or_tty->print_cr("## wrong marked address on %s bitmap: "PTR_FORMAT,
> -+    gclog_or_tty->print_cr("## wrong marked address on %s bitmap: " PTR_FORMAT,
> -                            bitmap_name, result);
> --    gclog_or_tty->print_cr("## %s tams: "PTR_FORMAT" end: "PTR_FORMAT,
> -+    gclog_or_tty->print_cr("## %s tams: " PTR_FORMAT " end: " PTR_FORMAT,
> -                            bitmap_name, tams, end);
> -     return false;
> -   }
> -@@ -6061,7 +6061,7 @@ bool G1CollectedHeap::verify_bitmaps(con
> -     res_n = verify_no_bits_over_tams("next", next_bitmap, ntams, end);
> -   }
> -   if (!res_p || !res_n) {
> --    gclog_or_tty->print_cr("#### Bitmap verification failed for "HR_FORMAT,
> -+    gclog_or_tty->print_cr("#### Bitmap verification failed for " HR_FORMAT,
> -                            HR_FORMAT_PARAMS(hr));
> -     gclog_or_tty->print_cr("#### Caller: %s", caller);
> -     return false;
> -@@ -6373,7 +6373,7 @@ class G1FreeHumongousRegionClosure : pub
> -         !r->rem_set()->is_empty()) {
> -
> -       if (G1TraceEagerReclaimHumongousObjects) {
> --        gclog_or_tty->print_cr("Live humongous region %u size "SIZE_FORMAT" start "PTR_FORMAT" length "UINT32_FORMAT" with remset "SIZE_FORMAT" code roots "SIZE_FORMAT" is marked %d reclaim candidate %d type array %d",
> -+        gclog_or_tty->print_cr("Live humongous region %u size " SIZE_FORMAT " start " PTR_FORMAT " length " UINT32_FORMAT " with remset " SIZE_FORMAT " code roots " SIZE_FORMAT " is marked %d reclaim candidate %d type array %d",
> -                                region_idx,
> -                                obj->size()*HeapWordSize,
> -                                r->bottom(),
> -@@ -6395,7 +6395,7 @@ class G1FreeHumongousRegionClosure : pub
> -                       r->bottom()));
> -
> -     if (G1TraceEagerReclaimHumongousObjects) {
> --      gclog_or_tty->print_cr("Dead humongous region %u size "SIZE_FORMAT" start "PTR_FORMAT" length "UINT32_FORMAT" with remset "SIZE_FORMAT" code roots "SIZE_FORMAT" is marked %d reclaim candidate %d type array %d",
> -+      gclog_or_tty->print_cr("Dead humongous region %u size " SIZE_FORMAT " start " PTR_FORMAT " length " UINT32_FORMAT " with remset " SIZE_FORMAT " code roots " SIZE_FORMAT " is marked %d reclaim candidate %d type array %d",
> -                              region_idx,
> -                              obj->size()*HeapWordSize,
> -                              r->bottom(),
> -@@ -6551,7 +6551,7 @@ public:
> -   NoYoungRegionsClosure() : _success(true) { }
> -   bool doHeapRegion(HeapRegion* r) {
> -     if (r->is_young()) {
> --      gclog_or_tty->print_cr("Region ["PTR_FORMAT", "PTR_FORMAT") tagged as young",
> -+      gclog_or_tty->print_cr("Region [" PTR_FORMAT ", " PTR_FORMAT ") tagged as young",
> -                              r->bottom(), r->end());
> -       _success = false;
> -     }
> -@@ -6680,7 +6680,7 @@ void G1CollectedHeap::rebuild_region_set
> -   }
> -   assert(_allocator->used_unlocked() == recalculate_used(),
> -          err_msg("inconsistent _allocator->used_unlocked(), "
> --                 "value: "SIZE_FORMAT" recalculated: "SIZE_FORMAT,
> -+                 "value: " SIZE_FORMAT " recalculated: " SIZE_FORMAT,
> -                  _allocator->used_unlocked(), recalculate_used()));
> - }
> -
> -@@ -6901,8 +6901,8 @@ class RegisterNMethodOopClosure: public
> -       oop obj = oopDesc::decode_heap_oop_not_null(heap_oop);
> -       HeapRegion* hr = _g1h->heap_region_containing(obj);
> -       assert(!hr->continuesHumongous(),
> --             err_msg("trying to add code root "PTR_FORMAT" in continuation of humongous region "HR_FORMAT
> --                     " starting at "HR_FORMAT,
> -+             err_msg("trying to add code root " PTR_FORMAT " in continuation of humongous region " HR_FORMAT
> -+                     " starting at " HR_FORMAT,
> -                      _nm, HR_FORMAT_PARAMS(hr), HR_FORMAT_PARAMS(hr->humongous_start_region())));
> -
> -       // HeapRegion::add_strong_code_root_locked() avoids adding duplicate entries.
> -@@ -6928,8 +6928,8 @@ class UnregisterNMethodOopClosure: publi
> -       oop obj = oopDesc::decode_heap_oop_not_null(heap_oop);
> -       HeapRegion* hr = _g1h->heap_region_containing(obj);
> -       assert(!hr->continuesHumongous(),
> --             err_msg("trying to remove code root "PTR_FORMAT" in continuation of humongous region "HR_FORMAT
> --                     " starting at "HR_FORMAT,
> -+             err_msg("trying to remove code root " PTR_FORMAT " in continuation of humongous region " HR_FORMAT
> -+                     " starting at " HR_FORMAT,
> -                      _nm, HR_FORMAT_PARAMS(hr), HR_FORMAT_PARAMS(hr->humongous_start_region())));
> -
> -       hr->remove_strong_code_root(_nm);
> ---- hotspot/src/share/vm/gc_implementation/g1/g1CollectedHeap.inline.hpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/g1CollectedHeap.inline.hpp
> -@@ -81,7 +81,7 @@ inline HeapRegion* G1CollectedHeap::regi
> -
> - inline uint G1CollectedHeap::addr_to_region(HeapWord* addr) const {
> -   assert(is_in_reserved(addr),
> --         err_msg("Cannot calculate region index for address "PTR_FORMAT" that is outside of the heap ["PTR_FORMAT", "PTR_FORMAT")",
> -+         err_msg("Cannot calculate region index for address " PTR_FORMAT " that is outside of the heap [" PTR_FORMAT ", " PTR_FORMAT ")",
> -                  p2i(addr), p2i(_reserved.start()), p2i(_reserved.end())));
> -   return (uint)(pointer_delta(addr, _reserved.start(), sizeof(uint8_t)) >> HeapRegion::LogOfHRGrainBytes);
> - }
> -@@ -94,7 +94,7 @@ template <class T>
> - inline HeapRegion* G1CollectedHeap::heap_region_containing_raw(const T addr) const {
> -   assert(addr != NULL, "invariant");
> -   assert(is_in_g1_reserved((const void*) addr),
> --      err_msg("Address "PTR_FORMAT" is outside of the heap ranging from ["PTR_FORMAT" to "PTR_FORMAT")",
> -+      err_msg("Address " PTR_FORMAT " is outside of the heap ranging from [" PTR_FORMAT " to " PTR_FORMAT ")",
> -           p2i((void*)addr), p2i(g1_reserved().start()), p2i(g1_reserved().end())));
> -   return _hrm.addr_to_region((HeapWord*) addr);
> - }
> ---- hotspot/src/share/vm/gc_implementation/g1/g1CollectorPolicy.cpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/g1CollectorPolicy.cpp
> -@@ -199,7 +199,7 @@ G1CollectorPolicy::G1CollectorPolicy() :
> -   const size_t region_size = HeapRegion::GrainWords;
> -   if (YoungPLABSize > region_size || OldPLABSize > region_size) {
> -     char buffer[128];
> --    jio_snprintf(buffer, sizeof(buffer), "%sPLABSize should be at most "SIZE_FORMAT,
> -+    jio_snprintf(buffer, sizeof(buffer), "%sPLABSize should be at most " SIZE_FORMAT,
> -                  OldPLABSize > region_size ? "Old" : "Young", region_size);
> -     vm_exit_during_initialization(buffer);
> -   }
> -@@ -846,7 +846,7 @@ void G1CollectorPolicy::record_collectio
> -   update_survivors_policy();
> -
> -   assert(_g1->used() == _g1->recalculate_used(),
> --         err_msg("sanity, used: "SIZE_FORMAT" recalculate_used: "SIZE_FORMAT,
> -+         err_msg("sanity, used: " SIZE_FORMAT " recalculate_used: " SIZE_FORMAT,
> -                  _g1->used(), _g1->recalculate_used()));
> -
> -   double s_w_t_ms = (start_time_sec - _stop_world_start) * 1000.0;
> -@@ -1231,10 +1231,10 @@ void G1CollectorPolicy::print_detailed_h
> -     (_young_list_target_length * HeapRegion::GrainBytes) - survivor_used_bytes_after_gc;
> -
> -   gclog_or_tty->print(
> --    "   [Eden: "EXT_SIZE_FORMAT"("EXT_SIZE_FORMAT")->"EXT_SIZE_FORMAT"("EXT_SIZE_FORMAT") "
> --    "Survivors: "EXT_SIZE_FORMAT"->"EXT_SIZE_FORMAT" "
> --    "Heap: "EXT_SIZE_FORMAT"("EXT_SIZE_FORMAT")->"
> --    EXT_SIZE_FORMAT"("EXT_SIZE_FORMAT")]",
> -+    "   [Eden: " EXT_SIZE_FORMAT "(" EXT_SIZE_FORMAT ")->" EXT_SIZE_FORMAT "(" EXT_SIZE_FORMAT ") "
> -+    "Survivors: " EXT_SIZE_FORMAT "->" EXT_SIZE_FORMAT " "
> -+    "Heap: " EXT_SIZE_FORMAT "(" EXT_SIZE_FORMAT ")->"
> -+    EXT_SIZE_FORMAT "(" EXT_SIZE_FORMAT ")]",
> -     EXT_SIZE_PARAMS(_eden_used_bytes_before_gc),
> -     EXT_SIZE_PARAMS(_eden_capacity_bytes_before_gc),
> -     EXT_SIZE_PARAMS(eden_used_bytes_after_gc),
> -@@ -1851,7 +1851,7 @@ void G1CollectorPolicy::print_collection
> -   while (csr != NULL) {
> -     HeapRegion* next = csr->next_in_collection_set();
> -     assert(csr->in_collection_set(), "bad CS");
> --    st->print_cr("  "HR_FORMAT", P: "PTR_FORMAT "N: "PTR_FORMAT", age: %4d",
> -+    st->print_cr("  " HR_FORMAT ", P: " PTR_FORMAT "N: " PTR_FORMAT ", age: %4d",
> -                  HR_FORMAT_PARAMS(csr),
> -                  csr->prev_top_at_mark_start(), csr->next_top_at_mark_start(),
> -                  csr->age_in_surv_rate_group_cond());
> ---- hotspot/src/share/vm/gc_implementation/g1/g1ErgoVerbose.hpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/g1ErgoVerbose.hpp
> -@@ -121,15 +121,15 @@ public:
> - // Single parameter format strings
> - #define ergo_format_str(_name_)      ", " _name_ ": %s"
> - #define ergo_format_region(_name_)   ", " _name_ ": %u regions"
> --#define ergo_format_byte(_name_)     ", " _name_ ": "SIZE_FORMAT" bytes"
> -+#define ergo_format_byte(_name_)     ", " _name_ ": " SIZE_FORMAT " bytes"
> - #define ergo_format_double(_name_)   ", " _name_ ": %1.2f"
> - #define ergo_format_perc(_name_)     ", " _name_ ": %1.2f %%"
> - #define ergo_format_ms(_name_)       ", " _name_ ": %1.2f ms"
> --#define ergo_format_size(_name_)     ", " _name_ ": "SIZE_FORMAT
> -+#define ergo_format_size(_name_)     ", " _name_ ": " SIZE_FORMAT
> -
> - // Double parameter format strings
> - #define ergo_format_byte_perc(_name_)                                   \
> --                             ", " _name_ ": "SIZE_FORMAT" bytes (%1.2f %%)"
> -+                             ", " _name_ ": " SIZE_FORMAT " bytes (%1.2f %%)"
> -
> - // Generates the format string
> - #define ergo_format(_extra_format_)                           \
> ---- hotspot/src/share/vm/gc_implementation/g1/g1GCPhaseTimes.cpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/g1GCPhaseTimes.cpp
> -@@ -332,7 +332,7 @@ void G1GCPhaseTimes::print_stats(int lev
> - }
> -
> - void G1GCPhaseTimes::print_stats(int level, const char* str, size_t value) {
> --  LineBuffer(level).append_and_print_cr("[%s: "SIZE_FORMAT"]", str, value);
> -+  LineBuffer(level).append_and_print_cr("[%s: " SIZE_FORMAT "]", str, value);
> - }
> -
> - void G1GCPhaseTimes::print_stats(int level, const char* str, double value, uint workers) {
> -@@ -452,7 +452,7 @@ class G1GCParPhasePrinter : public Stack
> -
> -     if (phase->_thread_work_items != NULL) {
> -       LineBuffer buf2(phase->_thread_work_items->_indent_level);
> --      buf2.append_and_print_cr("[%s:  "SIZE_FORMAT"]", phase->_thread_work_items->_title, _phase_times->sum_thread_work_items(phase_id));
> -+      buf2.append_and_print_cr("[%s:  " SIZE_FORMAT "]", phase->_thread_work_items->_title, _phase_times->sum_thread_work_items(phase_id));
> -     }
> -   }
> -
> ---- hotspot/src/share/vm/gc_implementation/g1/g1HRPrinter.cpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/g1HRPrinter.cpp
> -@@ -84,18 +84,18 @@ void G1HRPrinter::print(ActionType actio
> -
> -   if (type_str != NULL) {
> -     if (top != NULL) {
> --      gclog_or_tty->print_cr(G1HR_PREFIX" %s(%s) "PTR_FORMAT" "PTR_FORMAT,
> -+      gclog_or_tty->print_cr(G1HR_PREFIX" %s(%s) " PTR_FORMAT " " PTR_FORMAT,
> -                              action_str, type_str, bottom, top);
> -     } else {
> --      gclog_or_tty->print_cr(G1HR_PREFIX" %s(%s) "PTR_FORMAT,
> -+      gclog_or_tty->print_cr(G1HR_PREFIX" %s(%s) " PTR_FORMAT,
> -                              action_str, type_str, bottom);
> -     }
> -   } else {
> -     if (top != NULL) {
> --      gclog_or_tty->print_cr(G1HR_PREFIX" %s "PTR_FORMAT" "PTR_FORMAT,
> -+      gclog_or_tty->print_cr(G1HR_PREFIX" %s " PTR_FORMAT " " PTR_FORMAT,
> -                              action_str, bottom, top);
> -     } else {
> --      gclog_or_tty->print_cr(G1HR_PREFIX" %s "PTR_FORMAT,
> -+      gclog_or_tty->print_cr(G1HR_PREFIX" %s " PTR_FORMAT,
> -                              action_str, bottom);
> -     }
> -   }
> -@@ -104,11 +104,11 @@ void G1HRPrinter::print(ActionType actio
> - void G1HRPrinter::print(ActionType action, HeapWord* bottom, HeapWord* end) {
> -   const char* action_str = action_name(action);
> -
> --  gclog_or_tty->print_cr(G1HR_PREFIX" %s ["PTR_FORMAT","PTR_FORMAT"]",
> -+  gclog_or_tty->print_cr(G1HR_PREFIX" %s [" PTR_FORMAT "," PTR_FORMAT "]",
> -                          action_str, bottom, end);
> - }
> -
> - void G1HRPrinter::print(PhaseType phase, size_t phase_num) {
> -   const char* phase_str = phase_name(phase);
> --  gclog_or_tty->print_cr(G1HR_PREFIX" #%s "SIZE_FORMAT, phase_str, phase_num);
> -+  gclog_or_tty->print_cr(G1HR_PREFIX" #%s " SIZE_FORMAT, phase_str, phase_num);
> - }
> ---- hotspot/src/share/vm/gc_implementation/g1/g1OopClosures.inline.hpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/g1OopClosures.inline.hpp
> -@@ -118,7 +118,7 @@ inline void G1CMOopClosure::do_oop_nv(T*
> -   oop obj = oopDesc::load_decode_heap_oop(p);
> -   if (_cm->verbose_high()) {
> -     gclog_or_tty->print_cr("[%u] we're looking at location "
> --                           "*"PTR_FORMAT" = "PTR_FORMAT,
> -+                           "*" PTR_FORMAT " = " PTR_FORMAT,
> -                            _task->worker_id(), p2i(p), p2i((void*) obj));
> -   }
> -   _task->deal_with_reference(obj);
> ---- hotspot/src/share/vm/gc_implementation/g1/g1RemSet.cpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/g1RemSet.cpp
> -@@ -442,7 +442,7 @@ G1UpdateRSOrPushRefOopClosure(G1Collecte
> - bool G1RemSet::refine_card(jbyte* card_ptr, uint worker_i,
> -                            bool check_for_refs_into_cset) {
> -   assert(_g1->is_in_exact(_ct_bs->addr_for(card_ptr)),
> --         err_msg("Card at "PTR_FORMAT" index "SIZE_FORMAT" representing heap at "PTR_FORMAT" (%u) must be in committed heap",
> -+         err_msg("Card at " PTR_FORMAT " index " SIZE_FORMAT " representing heap at " PTR_FORMAT " (%u) must be in committed heap",
> -                  p2i(card_ptr),
> -                  _ct_bs->index_for(_ct_bs->addr_for(card_ptr)),
> -                  _ct_bs->addr_for(card_ptr),
> ---- hotspot/src/share/vm/gc_implementation/g1/g1RemSetSummary.cpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/g1RemSetSummary.cpp
> -@@ -344,16 +344,16 @@ public:
> -
> - void G1RemSetSummary::print_on(outputStream* out) {
> -   out->print_cr("\n Recent concurrent refinement statistics");
> --  out->print_cr("  Processed "SIZE_FORMAT" cards",
> -+  out->print_cr("  Processed " SIZE_FORMAT " cards",
> -                 num_concurrent_refined_cards());
> --  out->print_cr("  Of "SIZE_FORMAT" completed buffers:", num_processed_buf_total());
> --  out->print_cr("     "SIZE_FORMAT_W(8)" (%5.1f%%) by concurrent RS threads.",
> -+  out->print_cr("  Of " SIZE_FORMAT " completed buffers:", num_processed_buf_total());
> -+  out->print_cr("     " SIZE_FORMAT_W(8) " (%5.1f%%) by concurrent RS threads.",
> -                 num_processed_buf_total(),
> -                 percent_of(num_processed_buf_rs_threads(), num_processed_buf_total()));
> --  out->print_cr("     "SIZE_FORMAT_W(8)" (%5.1f%%) by mutator threads.",
> -+  out->print_cr("     " SIZE_FORMAT_W(8) " (%5.1f%%) by mutator threads.",
> -                 num_processed_buf_mutator(),
> -                 percent_of(num_processed_buf_mutator(), num_processed_buf_total()));
> --  out->print_cr("  Did "SIZE_FORMAT" coarsenings.", num_coarsenings());
> -+  out->print_cr("  Did " SIZE_FORMAT " coarsenings.", num_coarsenings());
> -   out->print_cr("  Concurrent RS threads times (s)");
> -   out->print("     ");
> -   for (uint i = 0; i < _num_vtimes; i++) {
> ---- hotspot/src/share/vm/gc_implementation/g1/g1StringDedupQueue.cpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/g1StringDedupQueue.cpp
> -@@ -151,7 +151,7 @@ void G1StringDedupQueue::unlink_or_oops_
> - void G1StringDedupQueue::print_statistics(outputStream* st) {
> -   st->print_cr(
> -     "   [Queue]\n"
> --    "      [Dropped: "UINTX_FORMAT"]", _queue->_dropped);
> -+    "      [Dropped: " UINTX_FORMAT "]", _queue->_dropped);
> - }
> -
> - void G1StringDedupQueue::verify() {
> ---- hotspot/src/share/vm/gc_implementation/g1/g1StringDedupStat.cpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/g1StringDedupStat.cpp
> -@@ -80,8 +80,8 @@ void G1StringDedupStat::print_summary(ou
> -   st->stamp(PrintGCTimeStamps);
> -   st->print_cr(
> -     "[GC concurrent-string-deduplication, "
> --    G1_STRDEDUP_BYTES_FORMAT_NS"->"G1_STRDEDUP_BYTES_FORMAT_NS"("G1_STRDEDUP_BYTES_FORMAT_NS"), avg "
> --    G1_STRDEDUP_PERCENT_FORMAT_NS", "G1_STRDEDUP_TIME_FORMAT"]",
> -+    G1_STRDEDUP_BYTES_FORMAT_NS "->" G1_STRDEDUP_BYTES_FORMAT_NS "(" G1_STRDEDUP_BYTES_FORMAT_NS "), avg "
> -+    G1_STRDEDUP_PERCENT_FORMAT_NS ", " G1_STRDEDUP_TIME_FORMAT "]",
> -     G1_STRDEDUP_BYTES_PARAM(last_stat._new_bytes),
> -     G1_STRDEDUP_BYTES_PARAM(last_stat._new_bytes - last_stat._deduped_bytes),
> -     G1_STRDEDUP_BYTES_PARAM(last_stat._deduped_bytes),
> -@@ -135,22 +135,22 @@ void G1StringDedupStat::print_statistics
> -
> -   if (total) {
> -     st->print_cr(
> --      "   [Total Exec: "UINTX_FORMAT"/"G1_STRDEDUP_TIME_FORMAT", Idle: "UINTX_FORMAT"/"G1_STRDEDUP_TIME_FORMAT", Blocked: "UINTX_FORMAT"/"G1_STRDEDUP_TIME_FORMAT"]",
> -+      "   [Total Exec: " UINTX_FORMAT "/" G1_STRDEDUP_TIME_FORMAT ", Idle: " UINTX_FORMAT "/" G1_STRDEDUP_TIME_FORMAT ", Blocked: " UINTX_FORMAT "/" G1_STRDEDUP_TIME_FORMAT "]",
> -       stat._exec, stat._exec_elapsed, stat._idle, stat._idle_elapsed, stat._block, stat._block_elapsed);
> -   } else {
> -     st->print_cr(
> --      "   [Last Exec: "G1_STRDEDUP_TIME_FORMAT", Idle: "G1_STRDEDUP_TIME_FORMAT", Blocked: "UINTX_FORMAT"/"G1_STRDEDUP_TIME_FORMAT"]",
> -+      "   [Last Exec: " G1_STRDEDUP_TIME_FORMAT ", Idle: " G1_STRDEDUP_TIME_FORMAT ", Blocked: " UINTX_FORMAT "/" G1_STRDEDUP_TIME_FORMAT "]",
> -       stat._exec_elapsed, stat._idle_elapsed, stat._block, stat._block_elapsed);
> -   }
> -   st->print_cr(
> --    "      [Inspected:    "G1_STRDEDUP_OBJECTS_FORMAT"]\n"
> --    "         [Skipped:   "G1_STRDEDUP_OBJECTS_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT")]\n"
> --    "         [Hashed:    "G1_STRDEDUP_OBJECTS_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT")]\n"
> --    "         [Known:     "G1_STRDEDUP_OBJECTS_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT")]\n"
> --    "         [New:       "G1_STRDEDUP_OBJECTS_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT") "G1_STRDEDUP_BYTES_FORMAT"]\n"
> --    "      [Deduplicated: "G1_STRDEDUP_OBJECTS_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT") "G1_STRDEDUP_BYTES_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT")]\n"
> --    "         [Young:     "G1_STRDEDUP_OBJECTS_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT") "G1_STRDEDUP_BYTES_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT")]\n"
> --    "         [Old:       "G1_STRDEDUP_OBJECTS_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT") "G1_STRDEDUP_BYTES_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT")]",
> -+    "      [Inspected:    " G1_STRDEDUP_OBJECTS_FORMAT "]\n"
> -+    "         [Skipped:   " G1_STRDEDUP_OBJECTS_FORMAT "(" G1_STRDEDUP_PERCENT_FORMAT ")]\n"
> -+    "         [Hashed:    " G1_STRDEDUP_OBJECTS_FORMAT "(" G1_STRDEDUP_PERCENT_FORMAT ")]\n"
> -+    "         [Known:     " G1_STRDEDUP_OBJECTS_FORMAT "(" G1_STRDEDUP_PERCENT_FORMAT ")]\n"
> -+    "         [New:       " G1_STRDEDUP_OBJECTS_FORMAT "(" G1_STRDEDUP_PERCENT_FORMAT ") " G1_STRDEDUP_BYTES_FORMAT "]\n"
> -+    "      [Deduplicated: " G1_STRDEDUP_OBJECTS_FORMAT "(" G1_STRDEDUP_PERCENT_FORMAT ") " G1_STRDEDUP_BYTES_FORMAT "(" G1_STRDEDUP_PERCENT_FORMAT ")]\n"
> -+    "         [Young:     " G1_STRDEDUP_OBJECTS_FORMAT "(" G1_STRDEDUP_PERCENT_FORMAT ") " G1_STRDEDUP_BYTES_FORMAT "(" G1_STRDEDUP_PERCENT_FORMAT ")]\n"
> -+    "         [Old:       " G1_STRDEDUP_OBJECTS_FORMAT "(" G1_STRDEDUP_PERCENT_FORMAT ") " G1_STRDEDUP_BYTES_FORMAT "(" G1_STRDEDUP_PERCENT_FORMAT ")]",
> -     stat._inspected,
> -     stat._skipped, skipped_percent,
> -     stat._hashed, hashed_percent,
> ---- hotspot/src/share/vm/gc_implementation/g1/g1StringDedupTable.cpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/g1StringDedupTable.cpp
> -@@ -596,12 +596,12 @@ void G1StringDedupTable::clean_entry_cac
> - void G1StringDedupTable::print_statistics(outputStream* st) {
> -   st->print_cr(
> -     "   [Table]\n"
> --    "      [Memory Usage: "G1_STRDEDUP_BYTES_FORMAT_NS"]\n"
> --    "      [Size: "SIZE_FORMAT", Min: "SIZE_FORMAT", Max: "SIZE_FORMAT"]\n"
> --    "      [Entries: "UINTX_FORMAT", Load: "G1_STRDEDUP_PERCENT_FORMAT_NS", Cached: " UINTX_FORMAT ", Added: "UINTX_FORMAT", Removed: "UINTX_FORMAT"]\n"
> --    "      [Resize Count: "UINTX_FORMAT", Shrink Threshold: "UINTX_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT_NS"), Grow Threshold: "UINTX_FORMAT"("G1_STRDEDUP_PERCENT_FORMAT_NS")]\n"
> --    "      [Rehash Count: "UINTX_FORMAT", Rehash Threshold: "UINTX_FORMAT", Hash Seed: 0x%x]\n"
> --    "      [Age Threshold: "UINTX_FORMAT"]",
> -+    "      [Memory Usage: " G1_STRDEDUP_BYTES_FORMAT_NS "]\n"
> -+    "      [Size: " SIZE_FORMAT ", Min: " SIZE_FORMAT ", Max: " SIZE_FORMAT "]\n"
> -+    "      [Entries: " UINTX_FORMAT ", Load: " G1_STRDEDUP_PERCENT_FORMAT_NS ", Cached: " UINTX_FORMAT ", Added: " UINTX_FORMAT ", Removed: " UINTX_FORMAT "]\n"
> -+    "      [Resize Count: " UINTX_FORMAT ", Shrink Threshold: " UINTX_FORMAT "(" G1_STRDEDUP_PERCENT_FORMAT_NS "), Grow Threshold: " UINTX_FORMAT "(" G1_STRDEDUP_PERCENT_FORMAT_NS ")]\n"
> -+    "      [Rehash Count: " UINTX_FORMAT ", Rehash Threshold: " UINTX_FORMAT ", Hash Seed: 0x%x]\n"
> -+    "      [Age Threshold: " UINTX_FORMAT "]",
> -     G1_STRDEDUP_BYTES_PARAM(_table->_size * sizeof(G1StringDedupEntry*) + (_table->_entries + _entry_cache->size()) * sizeof(G1StringDedupEntry)),
> -     _table->_size, _min_size, _max_size,
> -     _table->_entries, (double)_table->_entries / (double)_table->_size * 100.0, _entry_cache->size(), _entries_added, _entries_removed,
> ---- hotspot/src/share/vm/gc_implementation/g1/heapRegion.cpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/heapRegion.cpp
> -@@ -333,7 +333,7 @@ void HeapRegion::note_self_forwarding_re
> -                                                   bool during_conc_mark,
> -                                                   size_t marked_bytes) {
> -   assert(0 <= marked_bytes && marked_bytes <= used(),
> --         err_msg("marked: "SIZE_FORMAT" used: "SIZE_FORMAT,
> -+         err_msg("marked: " SIZE_FORMAT " used: " SIZE_FORMAT,
> -                  marked_bytes, used()));
> -   _prev_top_at_mark_start = top();
> -   _prev_marked_bytes = marked_bytes;
> -@@ -514,9 +514,9 @@ class VerifyStrongCodeRootOopClosure: pu
> -         // Object is in the region. Check that its less than top
> -         if (_hr->top() <= (HeapWord*)obj) {
> -           // Object is above top
> --          gclog_or_tty->print_cr("Object "PTR_FORMAT" in region "
> --                                 "["PTR_FORMAT", "PTR_FORMAT") is above "
> --                                 "top "PTR_FORMAT,
> -+          gclog_or_tty->print_cr("Object " PTR_FORMAT " in region "
> -+                                 "[" PTR_FORMAT ", " PTR_FORMAT ") is above "
> -+                                 "top " PTR_FORMAT,
> -                                  (void *)obj, _hr->bottom(), _hr->end(), _hr->top());
> -           _failures = true;
> -           return;
> -@@ -550,22 +550,22 @@ public:
> -     if (nm != NULL) {
> -       // Verify that the nemthod is live
> -       if (!nm->is_alive()) {
> --        gclog_or_tty->print_cr("region ["PTR_FORMAT","PTR_FORMAT"] has dead nmethod "
> --                               PTR_FORMAT" in its strong code roots",
> -+        gclog_or_tty->print_cr("region [" PTR_FORMAT "," PTR_FORMAT "] has dead nmethod "
> -+                               PTR_FORMAT " in its strong code roots",
> -                                _hr->bottom(), _hr->end(), nm);
> -         _failures = true;
> -       } else {
> -         VerifyStrongCodeRootOopClosure oop_cl(_hr, nm);
> -         nm->oops_do(&oop_cl);
> -         if (!oop_cl.has_oops_in_region()) {
> --          gclog_or_tty->print_cr("region ["PTR_FORMAT","PTR_FORMAT"] has nmethod "
> --                                 PTR_FORMAT" in its strong code roots "
> -+          gclog_or_tty->print_cr("region [" PTR_FORMAT "," PTR_FORMAT "] has nmethod "
> -+                                 PTR_FORMAT " in its strong code roots "
> -                                  "with no pointers into region",
> -                                  _hr->bottom(), _hr->end(), nm);
> -           _failures = true;
> -         } else if (oop_cl.failures()) {
> --          gclog_or_tty->print_cr("region ["PTR_FORMAT","PTR_FORMAT"] has other "
> --                                 "failures for nmethod "PTR_FORMAT,
> -+          gclog_or_tty->print_cr("region [" PTR_FORMAT "," PTR_FORMAT "] has other "
> -+                                 "failures for nmethod " PTR_FORMAT,
> -                                  _hr->bottom(), _hr->end(), nm);
> -           _failures = true;
> -         }
> -@@ -599,8 +599,8 @@ void HeapRegion::verify_strong_code_root
> -   // on its strong code root list
> -   if (is_empty()) {
> -     if (strong_code_roots_length > 0) {
> --      gclog_or_tty->print_cr("region ["PTR_FORMAT","PTR_FORMAT"] is empty "
> --                             "but has "SIZE_FORMAT" code root entries",
> -+      gclog_or_tty->print_cr("region [" PTR_FORMAT "," PTR_FORMAT "] is empty "
> -+                             "but has " SIZE_FORMAT " code root entries",
> -                              bottom(), end(), strong_code_roots_length);
> -       *failures = true;
> -     }
> -@@ -609,8 +609,8 @@ void HeapRegion::verify_strong_code_root
> -
> -   if (continuesHumongous()) {
> -     if (strong_code_roots_length > 0) {
> --      gclog_or_tty->print_cr("region "HR_FORMAT" is a continuation of a humongous "
> --                             "region but has "SIZE_FORMAT" code root entries",
> -+      gclog_or_tty->print_cr("region " HR_FORMAT " is a continuation of a humongous "
> -+                             "region but has " SIZE_FORMAT " code root entries",
> -                              HR_FORMAT_PARAMS(this), strong_code_roots_length);
> -       *failures = true;
> -     }
> -@@ -634,7 +634,7 @@ void HeapRegion::print_on(outputStream*
> -   else
> -     st->print("   ");
> -   st->print(" TS %5d", _gc_time_stamp);
> --  st->print(" PTAMS "PTR_FORMAT" NTAMS "PTR_FORMAT,
> -+  st->print(" PTAMS " PTR_FORMAT " NTAMS " PTR_FORMAT,
> -             prev_top_at_mark_start(), next_top_at_mark_start());
> -   G1OffsetTableContigSpace::print_on(st);
> - }
> -@@ -708,25 +708,25 @@ public:
> -         }
> -         if (!_g1h->is_in_closed_subset(obj)) {
> -           HeapRegion* from = _g1h->heap_region_containing((HeapWord*)p);
> --          gclog_or_tty->print_cr("Field "PTR_FORMAT
> --                                 " of live obj "PTR_FORMAT" in region "
> --                                 "["PTR_FORMAT", "PTR_FORMAT")",
> -+          gclog_or_tty->print_cr("Field " PTR_FORMAT
> -+                                 " of live obj " PTR_FORMAT " in region "
> -+                                 "[" PTR_FORMAT ", " PTR_FORMAT ")",
> -                                  p, (void*) _containing_obj,
> -                                  from->bottom(), from->end());
> -           print_object(gclog_or_tty, _containing_obj);
> --          gclog_or_tty->print_cr("points to obj "PTR_FORMAT" not in the heap",
> -+          gclog_or_tty->print_cr("points to obj " PTR_FORMAT " not in the heap",
> -                                  (void*) obj);
> -         } else {
> -           HeapRegion* from = _g1h->heap_region_containing((HeapWord*)p);
> -           HeapRegion* to   = _g1h->heap_region_containing((HeapWord*)obj);
> --          gclog_or_tty->print_cr("Field "PTR_FORMAT
> --                                 " of live obj "PTR_FORMAT" in region "
> --                                 "["PTR_FORMAT", "PTR_FORMAT")",
> -+          gclog_or_tty->print_cr("Field " PTR_FORMAT
> -+                                 " of live obj " PTR_FORMAT " in region "
> -+                                 "[" PTR_FORMAT ", " PTR_FORMAT ")",
> -                                  p, (void*) _containing_obj,
> -                                  from->bottom(), from->end());
> -           print_object(gclog_or_tty, _containing_obj);
> --          gclog_or_tty->print_cr("points to dead obj "PTR_FORMAT" in region "
> --                                 "["PTR_FORMAT", "PTR_FORMAT")",
> -+          gclog_or_tty->print_cr("points to dead obj " PTR_FORMAT " in region "
> -+                                 "[" PTR_FORMAT ", " PTR_FORMAT ")",
> -                                  (void*) obj, to->bottom(), to->end());
> -           print_object(gclog_or_tty, obj);
> -         }
> -@@ -784,14 +784,14 @@ public:
> -             gclog_or_tty->print_cr("----------");
> -           }
> -           gclog_or_tty->print_cr("Missing rem set entry:");
> --          gclog_or_tty->print_cr("Field "PTR_FORMAT" "
> --                                 "of obj "PTR_FORMAT", "
> --                                 "in region "HR_FORMAT,
> -+          gclog_or_tty->print_cr("Field " PTR_FORMAT " "
> -+                                 "of obj " PTR_FORMAT ", "
> -+                                 "in region " HR_FORMAT,
> -                                  p, (void*) _containing_obj,
> -                                  HR_FORMAT_PARAMS(from));
> -           _containing_obj->print_on(gclog_or_tty);
> --          gclog_or_tty->print_cr("points to obj "PTR_FORMAT" "
> --                                 "in region "HR_FORMAT,
> -+          gclog_or_tty->print_cr("points to obj " PTR_FORMAT " "
> -+                                 "in region " HR_FORMAT,
> -                                  (void*) obj,
> -                                  HR_FORMAT_PARAMS(to));
> -           if (obj->is_oop()) {
> -@@ -830,8 +830,8 @@ void HeapRegion::verify(VerifyOption vo,
> -
> -     if (is_humongous != g1->isHumongous(obj_size) &&
> -         !g1->is_obj_dead(obj, this)) { // Dead objects may have bigger block_size since they span several objects.
> --      gclog_or_tty->print_cr("obj "PTR_FORMAT" is of %shumongous size ("
> --                             SIZE_FORMAT" words) in a %shumongous region",
> -+      gclog_or_tty->print_cr("obj " PTR_FORMAT " is of %shumongous size ("
> -+                             SIZE_FORMAT " words) in a %shumongous region",
> -                              p, g1->isHumongous(obj_size) ? "" : "non-",
> -                              obj_size, is_humongous ? "" : "non-");
> -        *failures = true;
> -@@ -854,12 +854,12 @@ void HeapRegion::verify(VerifyOption vo,
> -                                    (vo == VerifyOption_G1UsePrevMarking &&
> -                                    ClassLoaderDataGraph::unload_list_contains(klass));
> -         if (!is_metaspace_object) {
> --          gclog_or_tty->print_cr("klass "PTR_FORMAT" of object "PTR_FORMAT" "
> -+          gclog_or_tty->print_cr("klass " PTR_FORMAT " of object " PTR_FORMAT " "
> -                                  "not metadata", klass, (void *)obj);
> -           *failures = true;
> -           return;
> -         } else if (!klass->is_klass()) {
> --          gclog_or_tty->print_cr("klass "PTR_FORMAT" of object "PTR_FORMAT" "
> -+          gclog_or_tty->print_cr("klass " PTR_FORMAT " of object " PTR_FORMAT " "
> -                                  "not a klass", klass, (void *)obj);
> -           *failures = true;
> -           return;
> -@@ -891,7 +891,7 @@ void HeapRegion::verify(VerifyOption vo,
> -           }
> -         }
> -       } else {
> --        gclog_or_tty->print_cr(PTR_FORMAT" not an oop", (void *)obj);
> -+        gclog_or_tty->print_cr(PTR_FORMAT " not an oop", (void *)obj);
> -         *failures = true;
> -         return;
> -       }
> -@@ -901,8 +901,8 @@ void HeapRegion::verify(VerifyOption vo,
> -   }
> -
> -   if (p != top()) {
> --    gclog_or_tty->print_cr("end of last object "PTR_FORMAT" "
> --                           "does not match top "PTR_FORMAT, p, top());
> -+    gclog_or_tty->print_cr("end of last object " PTR_FORMAT " "
> -+                           "does not match top " PTR_FORMAT, p, top());
> -     *failures = true;
> -     return;
> -   }
> -@@ -917,8 +917,8 @@ void HeapRegion::verify(VerifyOption vo,
> -     HeapWord* addr_1 = p;
> -     HeapWord* b_start_1 = _offsets.block_start_const(addr_1);
> -     if (b_start_1 != p) {
> --      gclog_or_tty->print_cr("BOT look up for top: "PTR_FORMAT" "
> --                             " yielded "PTR_FORMAT", expecting "PTR_FORMAT,
> -+      gclog_or_tty->print_cr("BOT look up for top: " PTR_FORMAT " "
> -+                             " yielded " PTR_FORMAT ", expecting " PTR_FORMAT,
> -                              addr_1, b_start_1, p);
> -       *failures = true;
> -       return;
> -@@ -929,8 +929,8 @@ void HeapRegion::verify(VerifyOption vo,
> -     if (addr_2 < the_end) {
> -       HeapWord* b_start_2 = _offsets.block_start_const(addr_2);
> -       if (b_start_2 != p) {
> --        gclog_or_tty->print_cr("BOT look up for top + 1: "PTR_FORMAT" "
> --                               " yielded "PTR_FORMAT", expecting "PTR_FORMAT,
> -+        gclog_or_tty->print_cr("BOT look up for top + 1: " PTR_FORMAT " "
> -+                               " yielded " PTR_FORMAT ", expecting " PTR_FORMAT,
> -                                addr_2, b_start_2, p);
> -         *failures = true;
> -         return;
> -@@ -943,8 +943,8 @@ void HeapRegion::verify(VerifyOption vo,
> -     if (addr_3 < the_end) {
> -       HeapWord* b_start_3 = _offsets.block_start_const(addr_3);
> -       if (b_start_3 != p) {
> --        gclog_or_tty->print_cr("BOT look up for top + diff: "PTR_FORMAT" "
> --                               " yielded "PTR_FORMAT", expecting "PTR_FORMAT,
> -+        gclog_or_tty->print_cr("BOT look up for top + diff: " PTR_FORMAT " "
> -+                               " yielded " PTR_FORMAT ", expecting " PTR_FORMAT,
> -                                addr_3, b_start_3, p);
> -         *failures = true;
> -         return;
> -@@ -955,8 +955,8 @@ void HeapRegion::verify(VerifyOption vo,
> -     HeapWord* addr_4 = the_end - 1;
> -     HeapWord* b_start_4 = _offsets.block_start_const(addr_4);
> -     if (b_start_4 != p) {
> --      gclog_or_tty->print_cr("BOT look up for end - 1: "PTR_FORMAT" "
> --                             " yielded "PTR_FORMAT", expecting "PTR_FORMAT,
> -+      gclog_or_tty->print_cr("BOT look up for end - 1: " PTR_FORMAT " "
> -+                             " yielded " PTR_FORMAT ", expecting " PTR_FORMAT,
> -                              addr_4, b_start_4, p);
> -       *failures = true;
> -       return;
> -@@ -964,8 +964,8 @@ void HeapRegion::verify(VerifyOption vo,
> -   }
> -
> -   if (is_humongous && object_num > 1) {
> --    gclog_or_tty->print_cr("region ["PTR_FORMAT","PTR_FORMAT"] is humongous "
> --                           "but has "SIZE_FORMAT", objects",
> -+    gclog_or_tty->print_cr("region [" PTR_FORMAT "," PTR_FORMAT "] is humongous "
> -+                           "but has " SIZE_FORMAT ", objects",
> -                            bottom(), end(), object_num);
> -     *failures = true;
> -     return;
> ---- hotspot/src/share/vm/gc_implementation/g1/heapRegion.hpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/heapRegion.hpp
> -@@ -52,7 +52,7 @@ class HeapRegion;
> - class HeapRegionSetBase;
> - class nmethod;
> -
> --#define HR_FORMAT "%u:(%s)["PTR_FORMAT","PTR_FORMAT","PTR_FORMAT"]"
> -+#define HR_FORMAT "%u:(%s)[" PTR_FORMAT "," PTR_FORMAT "," PTR_FORMAT "]"
> - #define HR_FORMAT_PARAMS(_hr_) \
> -                 (_hr_)->hrm_index(), \
> -                 (_hr_)->get_short_type_str(), \
> -@@ -534,8 +534,8 @@ class HeapRegion: public G1OffsetTableCo
> -   void set_containing_set(HeapRegionSetBase* containing_set) {
> -     assert((containing_set == NULL && _containing_set != NULL) ||
> -            (containing_set != NULL && _containing_set == NULL),
> --           err_msg("containing_set: "PTR_FORMAT" "
> --                   "_containing_set: "PTR_FORMAT,
> -+           err_msg("containing_set: " PTR_FORMAT " "
> -+                   "_containing_set: " PTR_FORMAT,
> -                    p2i(containing_set), p2i(_containing_set)));
> -
> -     _containing_set = containing_set;
> ---- hotspot/src/share/vm/gc_implementation/g1/heapRegion.inline.hpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/heapRegion.inline.hpp
> -@@ -112,7 +112,7 @@ HeapRegion::block_size(const HeapWord *a
> -
> -   assert(ClassUnloadingWithConcurrentMark,
> -       err_msg("All blocks should be objects if G1 Class Unloading isn't used. "
> --              "HR: ["PTR_FORMAT", "PTR_FORMAT", "PTR_FORMAT") "
> -+              "HR: [" PTR_FORMAT ", " PTR_FORMAT ", " PTR_FORMAT ") "
> -               "addr: " PTR_FORMAT,
> -               p2i(bottom()), p2i(top()), p2i(end()), p2i(addr)));
> -
> ---- hotspot/src/share/vm/gc_implementation/g1/heapRegionManager.cpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/heapRegionManager.cpp
> -@@ -432,7 +432,7 @@ void HeapRegionManager::verify() {
> -     HeapRegion* hr = _regions.get_by_index(i);
> -     guarantee(hr != NULL, err_msg("invariant: i: %u", i));
> -     guarantee(!prev_committed || hr->bottom() == prev_end,
> --              err_msg("invariant i: %u "HR_FORMAT" prev_end: "PTR_FORMAT,
> -+              err_msg("invariant i: %u " HR_FORMAT " prev_end: " PTR_FORMAT,
> -                       i, HR_FORMAT_PARAMS(hr), p2i(prev_end)));
> -     guarantee(hr->hrm_index() == i,
> -               err_msg("invariant: i: %u hrm_index(): %u", i, hr->hrm_index()));
> ---- hotspot/src/share/vm/gc_implementation/g1/heapRegionManager.inline.hpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/heapRegionManager.inline.hpp
> -@@ -31,9 +31,9 @@
> -
> - inline HeapRegion* HeapRegionManager::addr_to_region(HeapWord* addr) const {
> -   assert(addr < heap_end(),
> --        err_msg("addr: "PTR_FORMAT" end: "PTR_FORMAT, p2i(addr), p2i(heap_end())));
> -+        err_msg("addr: " PTR_FORMAT " end: " PTR_FORMAT, p2i(addr), p2i(heap_end())));
> -   assert(addr >= heap_bottom(),
> --        err_msg("addr: "PTR_FORMAT" bottom: "PTR_FORMAT, p2i(addr), p2i(heap_bottom())));
> -+        err_msg("addr: " PTR_FORMAT " bottom: " PTR_FORMAT, p2i(addr), p2i(heap_bottom())));
> -
> -   HeapRegion* hr = _regions.get_by_address(addr);
> -   return hr;
> ---- hotspot/src/share/vm/gc_implementation/g1/heapRegionRemSet.cpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/heapRegionRemSet.cpp
> -@@ -91,7 +91,7 @@ protected:
> -     // concurrency.
> -
> -     if (G1TraceHeapRegionRememberedSet) {
> --      gclog_or_tty->print_cr("    PRT::Add_reference_work(" PTR_FORMAT "->" PTR_FORMAT").",
> -+      gclog_or_tty->print_cr("    PRT::Add_reference_work(" PTR_FORMAT "->" PTR_FORMAT ").",
> -                              from,
> -                              UseCompressedOops
> -                              ? (void *)oopDesc::load_decode_heap_oop((narrowOop*)from)
> -@@ -381,7 +381,7 @@ void FromCardCache::initialize(uint n_pa
> -
> - void FromCardCache::invalidate(uint start_idx, size_t new_num_regions) {
> -   guarantee((size_t)start_idx + new_num_regions <= max_uintx,
> --            err_msg("Trying to invalidate beyond maximum region, from %u size "SIZE_FORMAT,
> -+            err_msg("Trying to invalidate beyond maximum region, from %u size " SIZE_FORMAT,
> -                     start_idx, new_num_regions));
> -   for (uint i = 0; i < HeapRegionRemSet::num_par_rem_sets(); i++) {
> -     uint end_idx = (start_idx + (uint)new_num_regions);
> -@@ -396,7 +396,7 @@ void FromCardCache::invalidate(uint star
> - void FromCardCache::print(outputStream* out) {
> -   for (uint i = 0; i < HeapRegionRemSet::num_par_rem_sets(); i++) {
> -     for (uint j = 0; j < _max_regions; j++) {
> --      out->print_cr("_from_card_cache["UINT32_FORMAT"]["UINT32_FORMAT"] = "INT32_FORMAT".",
> -+      out->print_cr("_from_card_cache[" UINT32_FORMAT "][" UINT32_FORMAT "] = " INT32_FORMAT ".",
> -                     i, j, at(i, j));
> -     }
> -   }
> -@@ -436,7 +436,7 @@ void OtherRegionsTable::add_reference(Oo
> -   int from_card = (int)(uintptr_t(from) >> CardTableModRefBS::card_shift);
> -
> -   if (G1TraceHeapRegionRememberedSet) {
> --    gclog_or_tty->print_cr("Table for [" PTR_FORMAT "...): card %d (cache = "INT32_FORMAT")",
> -+    gclog_or_tty->print_cr("Table for [" PTR_FORMAT "...): card %d (cache = " INT32_FORMAT ")",
> -                   hr()->bottom(), from_card,
> -                   FromCardCache::at((uint)tid, cur_hrm_ind));
> -   }
> -@@ -642,13 +642,13 @@ void OtherRegionsTable::scrub(CardTableM
> -
> -   assert(_coarse_map.size() == region_bm->size(), "Precondition");
> -   if (G1RSScrubVerbose) {
> --    gclog_or_tty->print("   Coarse map: before = "SIZE_FORMAT"...",
> -+    gclog_or_tty->print("   Coarse map: before = " SIZE_FORMAT "...",
> -                         _n_coarse_entries);
> -   }
> -   _coarse_map.set_intersection(*region_bm);
> -   _n_coarse_entries = _coarse_map.count_one_bits();
> -   if (G1RSScrubVerbose) {
> --    gclog_or_tty->print_cr("   after = "SIZE_FORMAT".", _n_coarse_entries);
> -+    gclog_or_tty->print_cr("   after = " SIZE_FORMAT ".", _n_coarse_entries);
> -   }
> -
> -   // Now do the fine-grained maps.
> -@@ -1044,7 +1044,7 @@ bool HeapRegionRemSetIterator::fine_has_
> -
> -   card_index = _cur_region_card_offset + _cur_card_in_prt;
> -   guarantee(_cur_card_in_prt < HeapRegion::CardsPerRegion,
> --            err_msg("Card index "SIZE_FORMAT" must be within the region", _cur_card_in_prt));
> -+            err_msg("Card index " SIZE_FORMAT " must be within the region", _cur_card_in_prt));
> -   return true;
> - }
> -
> -@@ -1213,8 +1213,8 @@ void PerRegionTable::test_fl_mem_size()
> -
> -   size_t min_prt_size = sizeof(void*) + dummy->bm()->size_in_words() * HeapWordSize;
> -   assert(dummy->mem_size() > min_prt_size,
> --         err_msg("PerRegionTable memory usage is suspiciously small, only has "SIZE_FORMAT" bytes. "
> --                 "Should be at least "SIZE_FORMAT" bytes.", dummy->mem_size(), min_prt_size));
> -+         err_msg("PerRegionTable memory usage is suspiciously small, only has " SIZE_FORMAT " bytes. "
> -+                 "Should be at least " SIZE_FORMAT " bytes.", dummy->mem_size(), min_prt_size));
> -   free(dummy);
> -   guarantee(dummy->mem_size() == fl_mem_size(), "fl_mem_size() does not return the correct element size");
> -   // try to reset the state
> ---- hotspot/src/share/vm/gc_implementation/g1/heapRegionSet.cpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/g1/heapRegionSet.cpp
> -@@ -32,7 +32,7 @@ PRAGMA_FORMAT_MUTE_WARNINGS_FOR_GCC
> - uint FreeRegionList::_unrealistically_long_length = 0;
> -
> - void HeapRegionSetBase::fill_in_ext_msg(hrs_ext_msg* msg, const char* message) {
> --  msg->append("[%s] %s ln: %u cy: "SIZE_FORMAT,
> -+  msg->append("[%s] %s ln: %u cy: " SIZE_FORMAT,
> -               name(), message, length(), total_capacity_bytes());
> -   fill_in_ext_msg_extra(msg);
> - }
> -@@ -84,13 +84,13 @@ void HeapRegionSetBase::verify_end() {
> -
> - void HeapRegionSetBase::print_on(outputStream* out, bool print_contents) {
> -   out->cr();
> --  out->print_cr("Set: %s ("PTR_FORMAT")", name(), this);
> -+  out->print_cr("Set: %s (" PTR_FORMAT ")", name(), this);
> -   out->print_cr("  Region Assumptions");
> -   out->print_cr("    humongous         : %s", BOOL_TO_STR(regions_humongous()));
> -   out->print_cr("    free              : %s", BOOL_TO_STR(regions_free()));
> -   out->print_cr("  Attributes");
> -   out->print_cr("    length            : %14u", length());
> --  out->print_cr("    total capacity    : "SIZE_FORMAT_W(14)" bytes",
> -+  out->print_cr("    total capacity    : " SIZE_FORMAT_W(14) " bytes",
> -                 total_capacity_bytes());
> - }
> -
> -@@ -106,7 +106,7 @@ void FreeRegionList::set_unrealistically
> - }
> -
> - void FreeRegionList::fill_in_ext_msg_extra(hrs_ext_msg* msg) {
> --  msg->append(" hd: "PTR_FORMAT" tl: "PTR_FORMAT, _head, _tail);
> -+  msg->append(" hd: " PTR_FORMAT " tl: " PTR_FORMAT, _head, _tail);
> - }
> -
> - void FreeRegionList::remove_all() {
> -@@ -277,8 +277,8 @@ void FreeRegionList::clear() {
> - void FreeRegionList::print_on(outputStream* out, bool print_contents) {
> -   HeapRegionSetBase::print_on(out, print_contents);
> -   out->print_cr("  Linking");
> --  out->print_cr("    head              : "PTR_FORMAT, _head);
> --  out->print_cr("    tail              : "PTR_FORMAT, _tail);
> -+  out->print_cr("    head              : " PTR_FORMAT, _head);
> -+  out->print_cr("    tail              : " PTR_FORMAT, _tail);
> -
> -   if (print_contents) {
> -     out->print_cr("  Contents");
> -@@ -306,7 +306,7 @@ void FreeRegionList::verify_list() {
> -
> -     count++;
> -     guarantee(count < _unrealistically_long_length,
> --        hrs_err_msg("[%s] the calculated length: %u seems very long, is there maybe a cycle? curr: "PTR_FORMAT" prev0: "PTR_FORMAT" " "prev1: "PTR_FORMAT" length: %u", name(), count, curr, prev0, prev1, length()));
> -+        hrs_err_msg("[%s] the calculated length: %u seems very long, is there maybe a cycle? curr: " PTR_FORMAT " prev0: " PTR_FORMAT " " "prev1: " PTR_FORMAT " length: %u", name(), count, curr, prev0, prev1, length()));
> -
> -     if (curr->next() != NULL) {
> -       guarantee(curr->next()->prev() == curr, "Next or prev pointers messed up");
> ---- hotspot/src/share/vm/gc_implementation/parallelScavenge/psMarkSweep.cpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/parallelScavenge/psMarkSweep.cpp
> -@@ -668,7 +668,7 @@ jlong PSMarkSweep::millis_since_last_gc(
> -   jlong ret_val = now - _time_of_last_gc;
> -   // XXX See note in genCollectedHeap::millis_since_last_gc().
> -   if (ret_val < 0) {
> --    NOT_PRODUCT(warning("time warp: "INT64_FORMAT, ret_val);)
> -+    NOT_PRODUCT(warning("time warp: " INT64_FORMAT, ret_val);)
> -     return 0;
> -   }
> -   return ret_val;
> ---- hotspot/src/share/vm/gc_implementation/parallelScavenge/psParallelCompact.cpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/parallelScavenge/psParallelCompact.cpp
> -@@ -3291,7 +3291,7 @@ jlong PSParallelCompact::millis_since_la
> -   jlong ret_val = now - _time_of_last_gc;
> -   // XXX See note in genCollectedHeap::millis_since_last_gc().
> -   if (ret_val < 0) {
> --    NOT_PRODUCT(warning("time warp: "INT64_FORMAT, ret_val);)
> -+    NOT_PRODUCT(warning("time warp: " INT64_FORMAT, ret_val);)
> -     return 0;
> -   }
> -   return ret_val;
> ---- hotspot/src/share/vm/gc_implementation/shared/mutableNUMASpace.cpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/shared/mutableNUMASpace.cpp
> -@@ -86,7 +86,7 @@ void MutableNUMASpace::ensure_parsabilit
> -         while (words_left_to_fill > 0) {
> -           size_t words_to_fill = MIN2(words_left_to_fill, CollectedHeap::filler_array_max_size());
> -           assert(words_to_fill >= CollectedHeap::min_fill_size(),
> --            err_msg("Remaining size ("SIZE_FORMAT ") is too small to fill (based on " SIZE_FORMAT " and " SIZE_FORMAT ")",
> -+            err_msg("Remaining size (" SIZE_FORMAT ") is too small to fill (based on " SIZE_FORMAT " and " SIZE_FORMAT ")",
> -             words_to_fill, words_left_to_fill, CollectedHeap::filler_array_max_size()));
> -           CollectedHeap::fill_with_object((HeapWord*)cur_top, words_to_fill);
> -           if (!os::numa_has_static_binding()) {
> ---- hotspot/src/share/vm/gc_implementation/shared/parGCAllocBuffer.cpp.orig
> -+++ hotspot/src/share/vm/gc_implementation/shared/parGCAllocBuffer.cpp
> -@@ -98,10 +98,10 @@ void PLABStats::adjust_desired_plab_sz(u
> -   if (_allocated == 0) {
> -     assert(_unused == 0,
> -            err_msg("Inconsistency in PLAB stats: "
> --                   "_allocated: "SIZE_FORMAT", "
> --                   "_wasted: "SIZE_FORMAT", "
> --                   "_unused: "SIZE_FORMAT", "
> --                   "_used  : "SIZE_FORMAT,
> -+                   "_allocated: " SIZE_FORMAT ", "
> -+                   "_wasted: " SIZE_FORMAT ", "
> -+                   "_unused: " SIZE_FORMAT ", "
> -+                   "_used  : " SIZE_FORMAT,
> -                    _allocated, _wasted, _unused, _used));
> -
> -     _allocated = 1;
> ---- hotspot/src/share/vm/memory/cardTableModRefBS.hpp.orig
> -+++ hotspot/src/share/vm/memory/cardTableModRefBS.hpp
> -@@ -158,8 +158,8 @@ class CardTableModRefBS: public ModRefBa
> -   // Mapping from address to card marking array entry
> -   jbyte* byte_for(const void* p) const {
> -     assert(_whole_heap.contains(p),
> --           err_msg("Attempt to access p = "PTR_FORMAT" out of bounds of "
> --                   " card marking array's _whole_heap = ["PTR_FORMAT","PTR_FORMAT")",
> -+           err_msg("Attempt to access p = " PTR_FORMAT " out of bounds of "
> -+                   " card marking array's _whole_heap = [" PTR_FORMAT "," PTR_FORMAT ")",
> -                    p2i(p), p2i(_whole_heap.start()), p2i(_whole_heap.end())));
> -     jbyte* result = &byte_map_base[uintptr_t(p) >> card_shift];
> -     assert(result >= _byte_map && result < _byte_map + _byte_map_size,
> -@@ -436,8 +436,8 @@ public:
> -     size_t delta = pointer_delta(p, byte_map_base, sizeof(jbyte));
> -     HeapWord* result = (HeapWord*) (delta << card_shift);
> -     assert(_whole_heap.contains(result),
> --           err_msg("Returning result = "PTR_FORMAT" out of bounds of "
> --                   " card marking array's _whole_heap = ["PTR_FORMAT","PTR_FORMAT")",
> -+           err_msg("Returning result = " PTR_FORMAT " out of bounds of "
> -+                   " card marking array's _whole_heap = [" PTR_FORMAT "," PTR_FORMAT ")",
> -                    p2i(result), p2i(_whole_heap.start()), p2i(_whole_heap.end())));
> -     return result;
> -   }
> -@@ -445,8 +445,8 @@ public:
> -   // Mapping from address to card marking array index.
> -   size_t index_for(void* p) {
> -     assert(_whole_heap.contains(p),
> --           err_msg("Attempt to access p = "PTR_FORMAT" out of bounds of "
> --                   " card marking array's _whole_heap = ["PTR_FORMAT","PTR_FORMAT")",
> -+           err_msg("Attempt to access p = " PTR_FORMAT " out of bounds of "
> -+                   " card marking array's _whole_heap = [" PTR_FORMAT "," PTR_FORMAT ")",
> -                    p2i(p), p2i(_whole_heap.start()), p2i(_whole_heap.end())));
> -     return byte_for(p) - _byte_map;
> -   }
> ---- hotspot/src/share/vm/memory/genCollectedHeap.cpp.orig
> -+++ hotspot/src/share/vm/memory/genCollectedHeap.cpp
> -@@ -1403,7 +1403,7 @@ jlong GenCollectedHeap::millis_since_las
> -   // back a time later than 'now'.
> -   jlong retVal = now - tolgc_cl.time();
> -   if (retVal < 0) {
> --    NOT_PRODUCT(warning("time warp: "INT64_FORMAT, (int64_t) retVal);)
> -+    NOT_PRODUCT(warning("time warp: " INT64_FORMAT, (int64_t) retVal);)
> -     return 0;
> -   }
> -   return retVal;
> ---- hotspot/src/share/vm/memory/generation.cpp.orig
> -+++ hotspot/src/share/vm/memory/generation.cpp
> -@@ -187,7 +187,7 @@ bool Generation::promotion_attempt_is_sa
> -   bool   res = (available >= max_promotion_in_bytes);
> -   if (PrintGC && Verbose) {
> -     gclog_or_tty->print_cr(
> --      "Generation: promo attempt is%s safe: available("SIZE_FORMAT") %s max_promo("SIZE_FORMAT")",
> -+      "Generation: promo attempt is%s safe: available(" SIZE_FORMAT ") %s max_promo(" SIZE_FORMAT ")",
> -       res? "":" not", available, res? ">=":"<",
> -       max_promotion_in_bytes);
> -   }
> ---- hotspot/src/share/vm/memory/generation.hpp.orig
> -+++ hotspot/src/share/vm/memory/generation.hpp
> -@@ -422,7 +422,7 @@ class Generation: public CHeapObj<mtGC>
> -     // have to guard against non-monotonicity.
> -     NOT_PRODUCT(
> -       if (now < _time_of_last_gc) {
> --        warning("time warp: "INT64_FORMAT" to "INT64_FORMAT, (int64_t)_time_of_last_gc, (int64_t)now);
> -+        warning("time warp: " INT64_FORMAT " to " INT64_FORMAT, (int64_t)_time_of_last_gc, (int64_t)now);
> -       }
> -     )
> -     return _time_of_last_gc;
> ---- hotspot/src/share/vm/memory/referenceProcessor.cpp.orig
> -+++ hotspot/src/share/vm/memory/referenceProcessor.cpp
> -@@ -161,7 +161,7 @@ void ReferenceProcessor::update_soft_ref
> -
> -   NOT_PRODUCT(
> -   if (now < _soft_ref_timestamp_clock) {
> --    warning("time warp: "INT64_FORMAT" to "INT64_FORMAT,
> -+    warning("time warp: " INT64_FORMAT " to " INT64_FORMAT,
> -             _soft_ref_timestamp_clock, now);
> -   }
> -   )
> ---- hotspot/src/share/vm/memory/tenuredGeneration.cpp.orig
> -+++ hotspot/src/share/vm/memory/tenuredGeneration.cpp
> -@@ -294,8 +294,8 @@ bool TenuredGeneration::promotion_attemp
> -   bool   res = (available >= av_promo) || (available >= max_promotion_in_bytes);
> -   if (PrintGC && Verbose) {
> -     gclog_or_tty->print_cr(
> --      "Tenured: promo attempt is%s safe: available("SIZE_FORMAT") %s av_promo("SIZE_FORMAT"),"
> --      "max_promo("SIZE_FORMAT")",
> -+      "Tenured: promo attempt is%s safe: available(" SIZE_FORMAT ") %s av_promo(" SIZE_FORMAT "),"
> -+      "max_promo(" SIZE_FORMAT ")",
> -       res? "":" not", available, res? ">=":"<",
> -       av_promo, max_promotion_in_bytes);
> -   }
> ---- hotspot/src/share/vm/memory/threadLocalAllocBuffer.inline.hpp.orig
> -+++ hotspot/src/share/vm/memory/threadLocalAllocBuffer.inline.hpp
> -@@ -94,10 +94,10 @@ void ThreadLocalAllocBuffer::record_slow
> -
> -   if (PrintTLAB && Verbose) {
> -     Thread* thrd = myThread();
> --    gclog_or_tty->print("TLAB: %s thread: "INTPTR_FORMAT" [id: %2d]"
> --                        " obj: "SIZE_FORMAT
> --                        " free: "SIZE_FORMAT
> --                        " waste: "SIZE_FORMAT"\n",
> -+    gclog_or_tty->print("TLAB: %s thread: " INTPTR_FORMAT " [id: %2d]"
> -+                        " obj: " SIZE_FORMAT
> -+                        " free: " SIZE_FORMAT
> -+                        " waste: " SIZE_FORMAT "\n",
> -                         "slow", p2i(thrd), thrd->osthread()->thread_id(),
> -                         obj_size, free(), refill_waste_limit());
> -   }
> ---- hotspot/src/share/vm/memory/universe.cpp.orig
> -+++ hotspot/src/share/vm/memory/universe.cpp
> -@@ -926,7 +926,7 @@ void Universe::print_compressed_oops_mod
> - // Reserve the Java heap, which is now the same for all GCs.
> - ReservedSpace Universe::reserve_heap(size_t heap_size, size_t alignment) {
> -   assert(alignment <= Arguments::conservative_max_heap_alignment(),
> --      err_msg("actual alignment "SIZE_FORMAT" must be within maximum heap alignment "SIZE_FORMAT,
> -+      err_msg("actual alignment " SIZE_FORMAT " must be within maximum heap alignment " SIZE_FORMAT,
> -           alignment, Arguments::conservative_max_heap_alignment()));
> -   size_t total_reserved = align_size_up(heap_size, alignment);
> -   assert(!UseCompressedOops || (total_reserved <= (OopEncodingHeapMax - os::vm_page_size())),
> ---- hotspot/src/share/vm/oops/constantPool.cpp.orig
> -+++ hotspot/src/share/vm/oops/constantPool.cpp
> -@@ -1494,7 +1494,7 @@ static void print_cpool_bytes(jint cnt,
> -       }
> -       case JVM_CONSTANT_Long: {
> -         u8 val = Bytes::get_Java_u8(bytes);
> --        printf("long         "INT64_FORMAT, (int64_t) *(jlong *) &val);
> -+        printf("long         " INT64_FORMAT, (int64_t) *(jlong *) &val);
> -         ent_size = 8;
> -         idx++; // Long takes two cpool slots
> -         break;
> ---- hotspot/src/share/vm/oops/cpCache.cpp.orig
> -+++ hotspot/src/share/vm/oops/cpCache.cpp
> -@@ -315,7 +315,7 @@ void ConstantPoolCacheEntry::set_method_
> -                    adapter->size_of_parameters());
> -
> -   if (TraceInvokeDynamic) {
> --    tty->print_cr("set_method_handle bc=%d appendix="PTR_FORMAT"%s method_type="PTR_FORMAT"%s method="PTR_FORMAT" ",
> -+    tty->print_cr("set_method_handle bc=%d appendix=" PTR_FORMAT "%s method_type=" PTR_FORMAT "%s method=" PTR_FORMAT " ",
> -                   invoke_code,
> -                   (void *)appendix(),    (has_appendix    ? "" : " (unused)"),
> -                   (void *)method_type(), (has_method_type ? "" : " (unused)"),
> -@@ -529,12 +529,12 @@ void ConstantPoolCacheEntry::print(outpu
> -   // print separator
> -   if (index == 0) st->print_cr("                 -------------");
> -   // print entry
> --  st->print("%3d  ("PTR_FORMAT")  ", index, (intptr_t)this);
> -+  st->print("%3d  (" PTR_FORMAT ")  ", index, (intptr_t)this);
> -   st->print_cr("[%02x|%02x|%5d]", bytecode_2(), bytecode_1(),
> -                constant_pool_index());
> --  st->print_cr("                 [   "PTR_FORMAT"]", (intptr_t)_f1);
> --  st->print_cr("                 [   "PTR_FORMAT"]", (intptr_t)_f2);
> --  st->print_cr("                 [   "PTR_FORMAT"]", (intptr_t)_flags);
> -+  st->print_cr("                 [   " PTR_FORMAT "]", (intptr_t)_f1);
> -+  st->print_cr("                 [   " PTR_FORMAT "]", (intptr_t)_f2);
> -+  st->print_cr("                 [   " PTR_FORMAT "]", (intptr_t)_flags);
> -   st->print_cr("                 -------------");
> - }
> -
> ---- hotspot/src/share/vm/oops/markOop.cpp.orig
> -+++ hotspot/src/share/vm/oops/markOop.cpp
> -@@ -49,7 +49,7 @@ void markOopDesc::print_on(outputStream*
> -         st->print("monitor=NULL");
> -       else {
> -         BasicLock * bl = (BasicLock *) mon->owner();
> --        st->print("monitor={count="INTPTR_FORMAT",waiters="INTPTR_FORMAT",recursions="INTPTR_FORMAT",owner="INTPTR_FORMAT"}",
> -+        st->print("monitor={count=" INTPTR_FORMAT ",waiters=" INTPTR_FORMAT ",recursions=" INTPTR_FORMAT ",owner=" INTPTR_FORMAT "}",
> -                 mon->count(), mon->waiters(), mon->recursions(), p2i(bl));
> -       }
> -     } else {
> ---- hotspot/src/share/vm/oops/objArrayKlass.cpp.orig
> -+++ hotspot/src/share/vm/oops/objArrayKlass.cpp
> -@@ -657,7 +657,7 @@ void ObjArrayKlass::oop_print_value_on(o
> -       if (i > max_objArray_print_length) {
> -         st->print("..."); break;
> -       }
> --      st->print(" "INTPTR_FORMAT, (intptr_t)(void*)objArrayOop(obj)->obj_at(i));
> -+      st->print(" " INTPTR_FORMAT, (intptr_t)(void*)objArrayOop(obj)->obj_at(i));
> -     }
> -     st->print(" }");
> -   }
> ---- hotspot/src/share/vm/oops/oop.cpp.orig
> -+++ hotspot/src/share/vm/oops/oop.cpp
> -@@ -46,7 +46,7 @@ void oopDesc::print_on(outputStream* st)
> -
> - void oopDesc::print_address_on(outputStream* st) const {
> -   if (PrintOopAddress) {
> --    st->print("{"INTPTR_FORMAT"}", this);
> -+    st->print("{" INTPTR_FORMAT "}", this);
> -   }
> - }
> -
> ---- hotspot/src/share/vm/prims/methodHandles.cpp.orig
> -+++ hotspot/src/share/vm/prims/methodHandles.cpp
> -@@ -1342,27 +1342,27 @@ JVM_END
> -
> - // These are the native methods on java.lang.invoke.MethodHandleNatives.
> - static JNINativeMethod MHN_methods[] = {
> --  {CC"init",                      CC"("MEM""OBJ")V",                     FN_PTR(MHN_init_Mem)},
> --  {CC"expand",                    CC"("MEM")V",                          FN_PTR(MHN_expand_Mem)},
> --  {CC"resolve",                   CC"("MEM""CLS")"MEM,                   FN_PTR(MHN_resolve_Mem)},
> --  {CC"getConstant",               CC"(I)I",                              FN_PTR(MHN_getConstant)},
> -+  {CC "init",                      CC "(" MEM "" OBJ ")V",                     FN_PTR(MHN_init_Mem)},
> -+  {CC "expand",                    CC "(" MEM ")V",                          FN_PTR(MHN_expand_Mem)},
> -+  {CC "resolve",                   CC "(" MEM "" CLS ")" MEM,                   FN_PTR(MHN_resolve_Mem)},
> -+  {CC "getConstant",               CC "(I)I",                              FN_PTR(MHN_getConstant)},
> -   //  static native int getNamedCon(int which, Object[] name)
> --  {CC"getNamedCon",               CC"(I["OBJ")I",                        FN_PTR(MHN_getNamedCon)},
> -+  {CC "getNamedCon",               CC "(I[" OBJ ")I",                        FN_PTR(MHN_getNamedCon)},
> -   //  static native int getMembers(Class<?> defc, String matchName, String matchSig,
> -   //          int matchFlags, Class<?> caller, int skip, MemberName[] results);
> --  {CC"getMembers",                CC"("CLS""STRG""STRG"I"CLS"I["MEM")I", FN_PTR(MHN_getMembers)},
> --  {CC"objectFieldOffset",         CC"("MEM")J",                          FN_PTR(MHN_objectFieldOffset)},
> --  {CC"setCallSiteTargetNormal",   CC"("CS""MH")V",                       FN_PTR(MHN_setCallSiteTargetNormal)},
> --  {CC"setCallSiteTargetVolatile", CC"("CS""MH")V",                       FN_PTR(MHN_setCallSiteTargetVolatile)},
> --  {CC"staticFieldOffset",         CC"("MEM")J",                          FN_PTR(MHN_staticFieldOffset)},
> --  {CC"staticFieldBase",           CC"("MEM")"OBJ,                        FN_PTR(MHN_staticFieldBase)},
> --  {CC"getMemberVMInfo",           CC"("MEM")"OBJ,                        FN_PTR(MHN_getMemberVMInfo)}
> -+  {CC "getMembers",                CC "(" CLS "" STRG "" STRG "I" CLS "I[" MEM ")I", FN_PTR(MHN_getMembers)},
> -+  {CC "objectFieldOffset",         CC "(" MEM ")J",                          FN_PTR(MHN_objectFieldOffset)},
> -+  {CC "setCallSiteTargetNormal",   CC "(" CS "" MH ")V",                       FN_PTR(MHN_setCallSiteTargetNormal)},
> -+  {CC "setCallSiteTargetVolatile", CC "(" CS "" MH ")V",                       FN_PTR(MHN_setCallSiteTargetVolatile)},
> -+  {CC "staticFieldOffset",         CC "(" MEM ")J",                          FN_PTR(MHN_staticFieldOffset)},
> -+  {CC "staticFieldBase",           CC "(" MEM ")" OBJ,                        FN_PTR(MHN_staticFieldBase)},
> -+  {CC "getMemberVMInfo",           CC "(" MEM ")" OBJ,                        FN_PTR(MHN_getMemberVMInfo)}
> - };
> -
> - static JNINativeMethod MH_methods[] = {
> -   // UnsupportedOperationException throwers
> --  {CC"invoke",                    CC"(["OBJ")"OBJ,                       FN_PTR(MH_invoke_UOE)},
> --  {CC"invokeExact",               CC"(["OBJ")"OBJ,                       FN_PTR(MH_invokeExact_UOE)}
> -+  {CC"invoke",                    CC "([" OBJ ")" OBJ,                       FN_PTR(MH_invoke_UOE)},
> -+  {CC"invokeExact",               CC "([" OBJ ")" OBJ,                       FN_PTR(MH_invokeExact_UOE)}
> - };
> -
> - /**
> ---- hotspot/src/share/vm/prims/perf.cpp.orig
> -+++ hotspot/src/share/vm/prims/perf.cpp
> -@@ -290,17 +290,17 @@ PERF_END
> - #define FN_PTR(f) CAST_FROM_FN_PTR(void*, &f)
> - #define BB "Ljava/nio/ByteBuffer;"
> - #define JLS "Ljava/lang/String;"
> --#define CL_ARGS     CC"("JLS"IIJ)"BB
> --#define CBA_ARGS    CC"("JLS"II[BI)"BB
> -+#define CL_ARGS     CC "(" JLS "IIJ)" BB
> -+#define CBA_ARGS    CC "(" JLS "II[BI)" BB
> -
> - static JNINativeMethod perfmethods[] = {
> -
> --  {CC"attach",              CC"("JLS"II)"BB,  FN_PTR(Perf_Attach)},
> --  {CC"detach",              CC"("BB")V",      FN_PTR(Perf_Detach)},
> --  {CC"createLong",          CL_ARGS,          FN_PTR(Perf_CreateLong)},
> --  {CC"createByteArray",     CBA_ARGS,         FN_PTR(Perf_CreateByteArray)},
> --  {CC"highResCounter",      CC"()J",          FN_PTR(Perf_HighResCounter)},
> --  {CC"highResFrequency",    CC"()J",          FN_PTR(Perf_HighResFrequency)}
> -+  {CC"attach",              CC "(" JLS "II)" BB, FN_PTR(Perf_Attach)},
> -+  {CC"detach",              CC "(" BB ")V",      FN_PTR(Perf_Detach)},
> -+  {CC"createLong",          CL_ARGS,             FN_PTR(Perf_CreateLong)},
> -+  {CC"createByteArray",     CBA_ARGS,            FN_PTR(Perf_CreateByteArray)},
> -+  {CC"highResCounter",      CC "()J",            FN_PTR(Perf_HighResCounter)},
> -+  {CC"highResFrequency",    CC "()J",            FN_PTR(Perf_HighResFrequency)}
> - };
> -
> - #undef CBA_ARGS
> ---- hotspot/src/share/vm/prims/unsafe.cpp.orig
> -+++ hotspot/src/share/vm/prims/unsafe.cpp
> -@@ -1001,7 +1001,7 @@ UNSAFE_ENTRY(jclass, Unsafe_DefineClass0
> - UNSAFE_END
> -
> -
> --#define DAC_Args CLS"[B["OBJ
> -+#define DAC_Args CLS "[B[" OBJ
> - // define a class but do not make it known to the class loader or system dictionary
> - // - host_class:  supplies context for linkage, access control, protection domain, and class loader
> - // - data:  bytes of a class file, a raw memory address (length gives the number of bytes)
> -@@ -1366,47 +1366,47 @@ UNSAFE_END
> -
> - #define LANG "Ljava/lang/"
> -
> --#define OBJ LANG"Object;"
> --#define CLS LANG"Class;"
> --#define CTR LANG"reflect/Constructor;"
> --#define FLD LANG"reflect/Field;"
> --#define MTH LANG"reflect/Method;"
> --#define THR LANG"Throwable;"
> -+#define OBJ LANG "Object;"
> -+#define CLS LANG "Class;"
> -+#define CTR LANG "reflect/Constructor;"
> -+#define FLD LANG "reflect/Field;"
> -+#define MTH LANG "reflect/Method;"
> -+#define THR LANG "Throwable;"
> -
> --#define DC0_Args LANG"String;[BII"
> --#define DC_Args  DC0_Args LANG"ClassLoader;" "Ljava/security/ProtectionDomain;"
> -+#define DC0_Args LANG "String;[BII"
> -+#define DC_Args  DC0_Args LANG "ClassLoader;" "Ljava/security/ProtectionDomain;"
> -
> - #define CC (char*)  /*cast a literal from (const char*)*/
> - #define FN_PTR(f) CAST_FROM_FN_PTR(void*, &f)
> -
> - // define deprecated accessors for compabitility with 1.4.0
> - #define DECLARE_GETSETOOP_140(Boolean, Z) \
> --    {CC"get"#Boolean,      CC"("OBJ"I)"#Z,      FN_PTR(Unsafe_Get##Boolean##140)}, \
> --    {CC"put"#Boolean,      CC"("OBJ"I"#Z")V",   FN_PTR(Unsafe_Set##Boolean##140)}
> -+    {CC"get"#Boolean,      CC"(" OBJ "I)" #Z,      FN_PTR(Unsafe_Get##Boolean##140)}, \
> -+    {CC"put"#Boolean,      CC"(" OBJ "I" #Z ")V",   FN_PTR(Unsafe_Set##Boolean##140)}
> -
> - // Note:  In 1.4.1, getObject and kin take both int and long offsets.
> - #define DECLARE_GETSETOOP_141(Boolean, Z) \
> --    {CC"get"#Boolean,      CC"("OBJ"J)"#Z,      FN_PTR(Unsafe_Get##Boolean)}, \
> --    {CC"put"#Boolean,      CC"("OBJ"J"#Z")V",   FN_PTR(Unsafe_Set##Boolean)}
> -+    {CC"get"#Boolean,      CC"(" OBJ "J)" #Z,      FN_PTR(Unsafe_Get##Boolean)}, \
> -+    {CC"put"#Boolean,      CC"(" OBJ "J" #Z ")V",   FN_PTR(Unsafe_Set##Boolean)}
> -
> - // Note:  In 1.5.0, there are volatile versions too
> - #define DECLARE_GETSETOOP(Boolean, Z) \
> --    {CC"get"#Boolean,      CC"("OBJ"J)"#Z,      FN_PTR(Unsafe_Get##Boolean)}, \
> --    {CC"put"#Boolean,      CC"("OBJ"J"#Z")V",   FN_PTR(Unsafe_Set##Boolean)}, \
> --    {CC"get"#Boolean"Volatile",      CC"("OBJ"J)"#Z,      FN_PTR(Unsafe_Get##Boolean##Volatile)}, \
> --    {CC"put"#Boolean"Volatile",      CC"("OBJ"J"#Z")V",   FN_PTR(Unsafe_Set##Boolean##Volatile)}
> -+    {CC"get"#Boolean,      CC"(" OBJ "J)" #Z,      FN_PTR(Unsafe_Get##Boolean)}, \
> -+    {CC"put"#Boolean,      CC"(" OBJ "J" #Z ")V",   FN_PTR(Unsafe_Set##Boolean)}, \
> -+    {CC"get"#Boolean "Volatile",      CC"(" OBJ "J)" #Z,      FN_PTR(Unsafe_Get##Boolean##Volatile)}, \
> -+    {CC"put"#Boolean "Volatile",      CC"(" OBJ "J" #Z ")V",   FN_PTR(Unsafe_Set##Boolean##Volatile)}
> -
> -
> - #define DECLARE_GETSETNATIVE(Byte, B) \
> --    {CC"get"#Byte,         CC"("ADR")"#B,       FN_PTR(Unsafe_GetNative##Byte)}, \
> --    {CC"put"#Byte,         CC"("ADR#B")V",      FN_PTR(Unsafe_SetNative##Byte)}
> -+    {CC"get"#Byte,         CC"(" ADR ")" #B,       FN_PTR(Unsafe_GetNative##Byte)}, \
> -+    {CC"put"#Byte,         CC"(" ADR #B ")V",      FN_PTR(Unsafe_SetNative##Byte)}
> -
> -
> -
> - // These are the methods for 1.4.0
> - static JNINativeMethod methods_140[] = {
> --    {CC"getObject",        CC"("OBJ"I)"OBJ"",   FN_PTR(Unsafe_GetObject140)},
> --    {CC"putObject",        CC"("OBJ"I"OBJ")V",  FN_PTR(Unsafe_SetObject140)},
> -+    {CC"getObject",        CC"(" OBJ "I)" OBJ "",   FN_PTR(Unsafe_GetObject140)},
> -+    {CC"putObject",        CC"(" OBJ "I" OBJ ")V",  FN_PTR(Unsafe_SetObject140)},
> -
> -     DECLARE_GETSETOOP_140(Boolean, Z),
> -     DECLARE_GETSETOOP_140(Byte, B),
> -@@ -1425,33 +1425,33 @@ static JNINativeMethod methods_140[] = {
> -     DECLARE_GETSETNATIVE(Float, F),
> -     DECLARE_GETSETNATIVE(Double, D),
> -
> --    {CC"getAddress",         CC"("ADR")"ADR,             FN_PTR(Unsafe_GetNativeAddress)},
> --    {CC"putAddress",         CC"("ADR""ADR")V",          FN_PTR(Unsafe_SetNativeAddress)},
> -+    {CC"getAddress",         CC"(" ADR ")" ADR,             FN_PTR(Unsafe_GetNativeAddress)},
> -+    {CC"putAddress",         CC"(" ADR "" ADR ")V",          FN_PTR(Unsafe_SetNativeAddress)},
> -
> --    {CC"allocateMemory",     CC"(J)"ADR,                 FN_PTR(Unsafe_AllocateMemory)},
> --    {CC"reallocateMemory",   CC"("ADR"J)"ADR,            FN_PTR(Unsafe_ReallocateMemory)},
> --    {CC"freeMemory",         CC"("ADR")V",               FN_PTR(Unsafe_FreeMemory)},
> --
> --    {CC"fieldOffset",        CC"("FLD")I",               FN_PTR(Unsafe_FieldOffset)},
> --    {CC"staticFieldBase",    CC"("CLS")"OBJ,             FN_PTR(Unsafe_StaticFieldBaseFromClass)},
> --    {CC"ensureClassInitialized",CC"("CLS")V",            FN_PTR(Unsafe_EnsureClassInitialized)},
> --    {CC"arrayBaseOffset",    CC"("CLS")I",               FN_PTR(Unsafe_ArrayBaseOffset)},
> --    {CC"arrayIndexScale",    CC"("CLS")I",               FN_PTR(Unsafe_ArrayIndexScale)},
> -+    {CC"allocateMemory",     CC"(J)" ADR,                 FN_PTR(Unsafe_AllocateMemory)},
> -+    {CC"reallocateMemory",   CC"(" ADR "J)" ADR,            FN_PTR(Unsafe_ReallocateMemory)},
> -+    {CC"freeMemory",         CC"(" ADR ")V",               FN_PTR(Unsafe_FreeMemory)},
> -+
> -+    {CC"fieldOffset",        CC"(" FLD ")I",               FN_PTR(Unsafe_FieldOffset)},
> -+    {CC"staticFieldBase",    CC"(" CLS ")" OBJ,             FN_PTR(Unsafe_StaticFieldBaseFromClass)},
> -+    {CC"ensureClassInitialized",CC"(" CLS ")V",            FN_PTR(Unsafe_EnsureClassInitialized)},
> -+    {CC"arrayBaseOffset",    CC"(" CLS ")I",               FN_PTR(Unsafe_ArrayBaseOffset)},
> -+    {CC"arrayIndexScale",    CC"(" CLS ")I",               FN_PTR(Unsafe_ArrayIndexScale)},
> -     {CC"addressSize",        CC"()I",                    FN_PTR(Unsafe_AddressSize)},
> -     {CC"pageSize",           CC"()I",                    FN_PTR(Unsafe_PageSize)},
> -
> --    {CC"defineClass",        CC"("DC0_Args")"CLS,        FN_PTR(Unsafe_DefineClass0)},
> --    {CC"defineClass",        CC"("DC_Args")"CLS,         FN_PTR(Unsafe_DefineClass)},
> --    {CC"allocateInstance",   CC"("CLS")"OBJ,             FN_PTR(Unsafe_AllocateInstance)},
> --    {CC"monitorEnter",       CC"("OBJ")V",               FN_PTR(Unsafe_MonitorEnter)},
> --    {CC"monitorExit",        CC"("OBJ")V",               FN_PTR(Unsafe_MonitorExit)},
> --    {CC"throwException",     CC"("THR")V",               FN_PTR(Unsafe_ThrowException)}
> -+    {CC"defineClass",        CC"(" DC0_Args ")" CLS,        FN_PTR(Unsafe_DefineClass0)},
> -+    {CC"defineClass",        CC"(" DC_Args ")" CLS,         FN_PTR(Unsafe_DefineClass)},
> -+    {CC"allocateInstance",   CC"(" CLS ")" OBJ,             FN_PTR(Unsafe_AllocateInstance)},
> -+    {CC"monitorEnter",       CC"(" OBJ ")V",               FN_PTR(Unsafe_MonitorEnter)},
> -+    {CC"monitorExit",        CC"(" OBJ ")V",               FN_PTR(Unsafe_MonitorExit)},
> -+    {CC"throwException",     CC"(" THR ")V",               FN_PTR(Unsafe_ThrowException)}
> - };
> -
> - // These are the methods prior to the JSR 166 changes in 1.5.0
> - static JNINativeMethod methods_141[] = {
> --    {CC"getObject",        CC"("OBJ"J)"OBJ"",   FN_PTR(Unsafe_GetObject)},
> --    {CC"putObject",        CC"("OBJ"J"OBJ")V",  FN_PTR(Unsafe_SetObject)},
> -+    {CC"getObject",        CC"(" OBJ "J)" OBJ "",   FN_PTR(Unsafe_GetObject)},
> -+    {CC"putObject",        CC"(" OBJ "J" OBJ ")V",  FN_PTR(Unsafe_SetObject)},
> -
> -     DECLARE_GETSETOOP_141(Boolean, Z),
> -     DECLARE_GETSETOOP_141(Byte, B),
> -@@ -1470,37 +1470,37 @@ static JNINativeMethod methods_141[] = {
> -     DECLARE_GETSETNATIVE(Float, F),
> -     DECLARE_GETSETNATIVE(Double, D),
> -
> --    {CC"getAddress",         CC"("ADR")"ADR,             FN_PTR(Unsafe_GetNativeAddress)},
> --    {CC"putAddress",         CC"("ADR""ADR")V",          FN_PTR(Unsafe_SetNativeAddress)},
> -+    {CC"getAddress",         CC"(" ADR ")" ADR,             FN_PTR(Unsafe_GetNativeAddress)},
> -+    {CC"putAddress",         CC"(" ADR "" ADR ")V",          FN_PTR(Unsafe_SetNativeAddress)},
> -
> --    {CC"allocateMemory",     CC"(J)"ADR,                 FN_PTR(Unsafe_AllocateMemory)},
> --    {CC"reallocateMemory",   CC"("ADR"J)"ADR,            FN_PTR(Unsafe_ReallocateMemory)},
> --    {CC"freeMemory",         CC"("ADR")V",               FN_PTR(Unsafe_FreeMemory)},
> --
> --    {CC"objectFieldOffset",  CC"("FLD")J",               FN_PTR(Unsafe_ObjectFieldOffset)},
> --    {CC"staticFieldOffset",  CC"("FLD")J",               FN_PTR(Unsafe_StaticFieldOffset)},
> --    {CC"staticFieldBase",    CC"("FLD")"OBJ,             FN_PTR(Unsafe_StaticFieldBaseFromField)},
> --    {CC"ensureClassInitialized",CC"("CLS")V",            FN_PTR(Unsafe_EnsureClassInitialized)},
> --    {CC"arrayBaseOffset",    CC"("CLS")I",               FN_PTR(Unsafe_ArrayBaseOffset)},
> --    {CC"arrayIndexScale",    CC"("CLS")I",               FN_PTR(Unsafe_ArrayIndexScale)},
> -+    {CC"allocateMemory",     CC"(J)" ADR,                 FN_PTR(Unsafe_AllocateMemory)},
> -+    {CC"reallocateMemory",   CC"(" ADR "J)" ADR,            FN_PTR(Unsafe_ReallocateMemory)},
> -+    {CC"freeMemory",         CC"(" ADR ")V",               FN_PTR(Unsafe_FreeMemory)},
> -+
> -+    {CC"objectFieldOffset",  CC"(" FLD ")J",               FN_PTR(Unsafe_ObjectFieldOffset)},
> -+    {CC"staticFieldOffset",  CC"(" FLD ")J",               FN_PTR(Unsafe_StaticFieldOffset)},
> -+    {CC"staticFieldBase",    CC"(" FLD ")" OBJ,             FN_PTR(Unsafe_StaticFieldBaseFromField)},
> -+    {CC"ensureClassInitialized",CC"(" CLS ")V",            FN_PTR(Unsafe_EnsureClassInitialized)},
> -+    {CC"arrayBaseOffset",    CC"(" CLS ")I",               FN_PTR(Unsafe_ArrayBaseOffset)},
> -+    {CC"arrayIndexScale",    CC"(" CLS ")I",               FN_PTR(Unsafe_ArrayIndexScale)},
> -     {CC"addressSize",        CC"()I",                    FN_PTR(Unsafe_AddressSize)},
> -     {CC"pageSize",           CC"()I",                    FN_PTR(Unsafe_PageSize)},
> -
> --    {CC"defineClass",        CC"("DC0_Args")"CLS,        FN_PTR(Unsafe_DefineClass0)},
> --    {CC"defineClass",        CC"("DC_Args")"CLS,         FN_PTR(Unsafe_DefineClass)},
> --    {CC"allocateInstance",   CC"("CLS")"OBJ,             FN_PTR(Unsafe_AllocateInstance)},
> --    {CC"monitorEnter",       CC"("OBJ")V",               FN_PTR(Unsafe_MonitorEnter)},
> --    {CC"monitorExit",        CC"("OBJ")V",               FN_PTR(Unsafe_MonitorExit)},
> --    {CC"throwException",     CC"("THR")V",               FN_PTR(Unsafe_ThrowException)}
> -+    {CC"defineClass",        CC"(" DC0_Args ")" CLS,        FN_PTR(Unsafe_DefineClass0)},
> -+    {CC"defineClass",        CC"(" DC_Args ")" CLS,         FN_PTR(Unsafe_DefineClass)},
> -+    {CC"allocateInstance",   CC"(" CLS ")" OBJ,             FN_PTR(Unsafe_AllocateInstance)},
> -+    {CC"monitorEnter",       CC"(" OBJ ")V",               FN_PTR(Unsafe_MonitorEnter)},
> -+    {CC"monitorExit",        CC"(" OBJ ")V",               FN_PTR(Unsafe_MonitorExit)},
> -+    {CC"throwException",     CC"(" THR ")V",               FN_PTR(Unsafe_ThrowException)}
> -
> - };
> -
> - // These are the methods prior to the JSR 166 changes in 1.6.0
> - static JNINativeMethod methods_15[] = {
> --    {CC"getObject",        CC"("OBJ"J)"OBJ"",   FN_PTR(Unsafe_GetObject)},
> --    {CC"putObject",        CC"("OBJ"J"OBJ")V",  FN_PTR(Unsafe_SetObject)},
> --    {CC"getObjectVolatile",CC"("OBJ"J)"OBJ"",   FN_PTR(Unsafe_GetObjectVolatile)},
> --    {CC"putObjectVolatile",CC"("OBJ"J"OBJ")V",  FN_PTR(Unsafe_SetObjectVolatile)},
> -+    {CC"getObject",        CC"(" OBJ "J)" OBJ "",   FN_PTR(Unsafe_GetObject)},
> -+    {CC"putObject",        CC"(" OBJ "J" OBJ ")V",  FN_PTR(Unsafe_SetObject)},
> -+    {CC"getObjectVolatile",CC"(" OBJ "J)" OBJ "",   FN_PTR(Unsafe_GetObjectVolatile)},
> -+    {CC"putObjectVolatile",CC"(" OBJ "J" OBJ ")V",  FN_PTR(Unsafe_SetObjectVolatile)},
> -
> -
> -     DECLARE_GETSETOOP(Boolean, Z),
> -@@ -1520,42 +1520,42 @@ static JNINativeMethod methods_15[] = {
> -     DECLARE_GETSETNATIVE(Float, F),
> -     DECLARE_GETSETNATIVE(Double, D),
> -
> --    {CC"getAddress",         CC"("ADR")"ADR,             FN_PTR(Unsafe_GetNativeAddress)},
> --    {CC"putAddress",         CC"("ADR""ADR")V",          FN_PTR(Unsafe_SetNativeAddress)},
> -+    {CC"getAddress",         CC"(" ADR ")" ADR,             FN_PTR(Unsafe_GetNativeAddress)},
> -+    {CC"putAddress",         CC"(" ADR "" ADR ")V",          FN_PTR(Unsafe_SetNativeAddress)},
> -
> --    {CC"allocateMemory",     CC"(J)"ADR,                 FN_PTR(Unsafe_AllocateMemory)},
> --    {CC"reallocateMemory",   CC"("ADR"J)"ADR,            FN_PTR(Unsafe_ReallocateMemory)},
> --    {CC"freeMemory",         CC"("ADR")V",               FN_PTR(Unsafe_FreeMemory)},
> --
> --    {CC"objectFieldOffset",  CC"("FLD")J",               FN_PTR(Unsafe_ObjectFieldOffset)},
> --    {CC"staticFieldOffset",  CC"("FLD")J",               FN_PTR(Unsafe_StaticFieldOffset)},
> --    {CC"staticFieldBase",    CC"("FLD")"OBJ,             FN_PTR(Unsafe_StaticFieldBaseFromField)},
> --    {CC"ensureClassInitialized",CC"("CLS")V",            FN_PTR(Unsafe_EnsureClassInitialized)},
> --    {CC"arrayBaseOffset",    CC"("CLS")I",               FN_PTR(Unsafe_ArrayBaseOffset)},
> --    {CC"arrayIndexScale",    CC"("CLS")I",               FN_PTR(Unsafe_ArrayIndexScale)},
> -+    {CC"allocateMemory",     CC"(J)" ADR,                 FN_PTR(Unsafe_AllocateMemory)},
> -+    {CC"reallocateMemory",   CC"(" ADR "J)" ADR,            FN_PTR(Unsafe_ReallocateMemory)},
> -+    {CC"freeMemory",         CC"(" ADR ")V",               FN_PTR(Unsafe_FreeMemory)},
> -+
> -+    {CC"objectFieldOffset",  CC"(" FLD ")J",               FN_PTR(Unsafe_ObjectFieldOffset)},
> -+    {CC"staticFieldOffset",  CC"(" FLD ")J",               FN_PTR(Unsafe_StaticFieldOffset)},
> -+    {CC"staticFieldBase",    CC"(" FLD ")" OBJ,             FN_PTR(Unsafe_StaticFieldBaseFromField)},
> -+    {CC"ensureClassInitialized",CC"(" CLS ")V",            FN_PTR(Unsafe_EnsureClassInitialized)},
> -+    {CC"arrayBaseOffset",    CC"(" CLS ")I",               FN_PTR(Unsafe_ArrayBaseOffset)},
> -+    {CC"arrayIndexScale",    CC"(" CLS ")I",               FN_PTR(Unsafe_ArrayIndexScale)},
> -     {CC"addressSize",        CC"()I",                    FN_PTR(Unsafe_AddressSize)},
> -     {CC"pageSize",           CC"()I",                    FN_PTR(Unsafe_PageSize)},
> -
> --    {CC"defineClass",        CC"("DC0_Args")"CLS,        FN_PTR(Unsafe_DefineClass0)},
> --    {CC"defineClass",        CC"("DC_Args")"CLS,         FN_PTR(Unsafe_DefineClass)},
> --    {CC"allocateInstance",   CC"("CLS")"OBJ,             FN_PTR(Unsafe_AllocateInstance)},
> --    {CC"monitorEnter",       CC"("OBJ")V",               FN_PTR(Unsafe_MonitorEnter)},
> --    {CC"monitorExit",        CC"("OBJ")V",               FN_PTR(Unsafe_MonitorExit)},
> --    {CC"throwException",     CC"("THR")V",               FN_PTR(Unsafe_ThrowException)},
> --    {CC"compareAndSwapObject", CC"("OBJ"J"OBJ""OBJ")Z",  FN_PTR(Unsafe_CompareAndSwapObject)},
> --    {CC"compareAndSwapInt",  CC"("OBJ"J""I""I"")Z",      FN_PTR(Unsafe_CompareAndSwapInt)},
> --    {CC"compareAndSwapLong", CC"("OBJ"J""J""J"")Z",      FN_PTR(Unsafe_CompareAndSwapLong)},
> -+    {CC"defineClass",        CC"(" DC0_Args ")" CLS,        FN_PTR(Unsafe_DefineClass0)},
> -+    {CC"defineClass",        CC"(" DC_Args ")" CLS,         FN_PTR(Unsafe_DefineClass)},
> -+    {CC"allocateInstance",   CC"(" CLS ")" OBJ,             FN_PTR(Unsafe_AllocateInstance)},
> -+    {CC"monitorEnter",       CC"(" OBJ ")V",               FN_PTR(Unsafe_MonitorEnter)},
> -+    {CC"monitorExit",        CC"(" OBJ ")V",               FN_PTR(Unsafe_MonitorExit)},
> -+    {CC"throwException",     CC"(" THR ")V",               FN_PTR(Unsafe_ThrowException)},
> -+    {CC"compareAndSwapObject", CC"(" OBJ "J" OBJ "" OBJ ")Z",  FN_PTR(Unsafe_CompareAndSwapObject)},
> -+    {CC"compareAndSwapInt",  CC"(" OBJ "J""I""I"")Z",      FN_PTR(Unsafe_CompareAndSwapInt)},
> -+    {CC"compareAndSwapLong", CC"(" OBJ "J""J""J"")Z",      FN_PTR(Unsafe_CompareAndSwapLong)},
> -     {CC"park",               CC"(ZJ)V",                  FN_PTR(Unsafe_Park)},
> --    {CC"unpark",             CC"("OBJ")V",               FN_PTR(Unsafe_Unpark)}
> -+    {CC"unpark",             CC"(" OBJ ")V",               FN_PTR(Unsafe_Unpark)}
> -
> - };
> -
> - // These are the methods for 1.6.0 and 1.7.0
> - static JNINativeMethod methods_16[] = {
> --    {CC"getObject",        CC"("OBJ"J)"OBJ"",   FN_PTR(Unsafe_GetObject)},
> --    {CC"putObject",        CC"("OBJ"J"OBJ")V",  FN_PTR(Unsafe_SetObject)},
> --    {CC"getObjectVolatile",CC"("OBJ"J)"OBJ"",   FN_PTR(Unsafe_GetObjectVolatile)},
> --    {CC"putObjectVolatile",CC"("OBJ"J"OBJ")V",  FN_PTR(Unsafe_SetObjectVolatile)},
> -+    {CC"getObject",        CC"(" OBJ "J)" OBJ "",   FN_PTR(Unsafe_GetObject)},
> -+    {CC"putObject",        CC"(" OBJ "J" OBJ ")V",  FN_PTR(Unsafe_SetObject)},
> -+    {CC"getObjectVolatile",CC"(" OBJ "J)" OBJ "",   FN_PTR(Unsafe_GetObjectVolatile)},
> -+    {CC"putObjectVolatile",CC"(" OBJ "J" OBJ ")V",  FN_PTR(Unsafe_SetObjectVolatile)},
> -
> -     DECLARE_GETSETOOP(Boolean, Z),
> -     DECLARE_GETSETOOP(Byte, B),
> -@@ -1574,45 +1574,45 @@ static JNINativeMethod methods_16[] = {
> -     DECLARE_GETSETNATIVE(Float, F),
> -     DECLARE_GETSETNATIVE(Double, D),
> -
> --    {CC"getAddress",         CC"("ADR")"ADR,             FN_PTR(Unsafe_GetNativeAddress)},
> --    {CC"putAddress",         CC"("ADR""ADR")V",          FN_PTR(Unsafe_SetNativeAddress)},
> -+    {CC"getAddress",         CC"(" ADR ")" ADR,             FN_PTR(Unsafe_GetNativeAddress)},
> -+    {CC"putAddress",         CC"(" ADR "" ADR ")V",          FN_PTR(Unsafe_SetNativeAddress)},
> -
> --    {CC"allocateMemory",     CC"(J)"ADR,                 FN_PTR(Unsafe_AllocateMemory)},
> --    {CC"reallocateMemory",   CC"("ADR"J)"ADR,            FN_PTR(Unsafe_ReallocateMemory)},
> --    {CC"freeMemory",         CC"("ADR")V",               FN_PTR(Unsafe_FreeMemory)},
> --
> --    {CC"objectFieldOffset",  CC"("FLD")J",               FN_PTR(Unsafe_ObjectFieldOffset)},
> --    {CC"staticFieldOffset",  CC"("FLD")J",               FN_PTR(Unsafe_StaticFieldOffset)},
> --    {CC"staticFieldBase",    CC"("FLD")"OBJ,             FN_PTR(Unsafe_StaticFieldBaseFromField)},
> --    {CC"ensureClassInitialized",CC"("CLS")V",            FN_PTR(Unsafe_EnsureClassInitialized)},
> --    {CC"arrayBaseOffset",    CC"("CLS")I",               FN_PTR(Unsafe_ArrayBaseOffset)},
> --    {CC"arrayIndexScale",    CC"("CLS")I",               FN_PTR(Unsafe_ArrayIndexScale)},
> -+    {CC"allocateMemory",     CC"(J)" ADR,                 FN_PTR(Unsafe_AllocateMemory)},
> -+    {CC"reallocateMemory",   CC"(" ADR "J)" ADR,            FN_PTR(Unsafe_ReallocateMemory)},
> -+    {CC"freeMemory",         CC"(" ADR ")V",               FN_PTR(Unsafe_FreeMemory)},
> -+
> -+    {CC"objectFieldOffset",  CC"(" FLD ")J",               FN_PTR(Unsafe_ObjectFieldOffset)},
> -+    {CC"staticFieldOffset",  CC"(" FLD ")J",               FN_PTR(Unsafe_StaticFieldOffset)},
> -+    {CC"staticFieldBase",    CC"(" FLD ")" OBJ,             FN_PTR(Unsafe_StaticFieldBaseFromField)},
> -+    {CC"ensureClassInitialized",CC"(" CLS ")V",            FN_PTR(Unsafe_EnsureClassInitialized)},
> -+    {CC"arrayBaseOffset",    CC"(" CLS ")I",               FN_PTR(Unsafe_ArrayBaseOffset)},
> -+    {CC"arrayIndexScale",    CC"(" CLS ")I",               FN_PTR(Unsafe_ArrayIndexScale)},
> -     {CC"addressSize",        CC"()I",                    FN_PTR(Unsafe_AddressSize)},
> -     {CC"pageSize",           CC"()I",                    FN_PTR(Unsafe_PageSize)},
> -
> --    {CC"defineClass",        CC"("DC0_Args")"CLS,        FN_PTR(Unsafe_DefineClass0)},
> --    {CC"defineClass",        CC"("DC_Args")"CLS,         FN_PTR(Unsafe_DefineClass)},
> --    {CC"allocateInstance",   CC"("CLS")"OBJ,             FN_PTR(Unsafe_AllocateInstance)},
> --    {CC"monitorEnter",       CC"("OBJ")V",               FN_PTR(Unsafe_MonitorEnter)},
> --    {CC"monitorExit",        CC"("OBJ")V",               FN_PTR(Unsafe_MonitorExit)},
> --    {CC"tryMonitorEnter",    CC"("OBJ")Z",               FN_PTR(Unsafe_TryMonitorEnter)},
> --    {CC"throwException",     CC"("THR")V",               FN_PTR(Unsafe_ThrowException)},
> --    {CC"compareAndSwapObject", CC"("OBJ"J"OBJ""OBJ")Z",  FN_PTR(Unsafe_CompareAndSwapObject)},
> --    {CC"compareAndSwapInt",  CC"("OBJ"J""I""I"")Z",      FN_PTR(Unsafe_CompareAndSwapInt)},
> --    {CC"compareAndSwapLong", CC"("OBJ"J""J""J"")Z",      FN_PTR(Unsafe_CompareAndSwapLong)},
> --    {CC"putOrderedObject",   CC"("OBJ"J"OBJ")V",         FN_PTR(Unsafe_SetOrderedObject)},
> --    {CC"putOrderedInt",      CC"("OBJ"JI)V",             FN_PTR(Unsafe_SetOrderedInt)},
> --    {CC"putOrderedLong",     CC"("OBJ"JJ)V",             FN_PTR(Unsafe_SetOrderedLong)},
> -+    {CC"defineClass",        CC"(" DC0_Args ")" CLS,        FN_PTR(Unsafe_DefineClass0)},
> -+    {CC"defineClass",        CC"(" DC_Args ")" CLS,         FN_PTR(Unsafe_DefineClass)},
> -+    {CC"allocateInstance",   CC"(" CLS ")" OBJ,             FN_PTR(Unsafe_AllocateInstance)},
> -+    {CC"monitorEnter",       CC"(" OBJ ")V",               FN_PTR(Unsafe_MonitorEnter)},
> -+    {CC"monitorExit",        CC"(" OBJ ")V",               FN_PTR(Unsafe_MonitorExit)},
> -+    {CC"tryMonitorEnter",    CC"(" OBJ ")Z",               FN_PTR(Unsafe_TryMonitorEnter)},
> -+    {CC"throwException",     CC"(" THR ")V",               FN_PTR(Unsafe_ThrowException)},
> -+    {CC"compareAndSwapObject", CC"(" OBJ "J" OBJ "" OBJ ")Z",  FN_PTR(Unsafe_CompareAndSwapObject)},
> -+    {CC"compareAndSwapInt",  CC"(" OBJ "J""I""I"")Z",      FN_PTR(Unsafe_CompareAndSwapInt)},
> -+    {CC"compareAndSwapLong", CC"(" OBJ "J""J""J"")Z",      FN_PTR(Unsafe_CompareAndSwapLong)},
> -+    {CC"putOrderedObject",   CC"(" OBJ "J" OBJ ")V",         FN_PTR(Unsafe_SetOrderedObject)},
> -+    {CC"putOrderedInt",      CC"(" OBJ "JI)V",             FN_PTR(Unsafe_SetOrderedInt)},
> -+    {CC"putOrderedLong",     CC"(" OBJ "JJ)V",             FN_PTR(Unsafe_SetOrderedLong)},
> -     {CC"park",               CC"(ZJ)V",                  FN_PTR(Unsafe_Park)},
> --    {CC"unpark",             CC"("OBJ")V",               FN_PTR(Unsafe_Unpark)}
> -+    {CC"unpark",             CC"(" OBJ ")V",               FN_PTR(Unsafe_Unpark)}
> - };
> -
> - // These are the methods for 1.8.0
> - static JNINativeMethod methods_18[] = {
> --    {CC"getObject",        CC"("OBJ"J)"OBJ"",   FN_PTR(Unsafe_GetObject)},
> --    {CC"putObject",        CC"("OBJ"J"OBJ")V",  FN_PTR(Unsafe_SetObject)},
> --    {CC"getObjectVolatile",CC"("OBJ"J)"OBJ"",   FN_PTR(Unsafe_GetObjectVolatile)},
> --    {CC"putObjectVolatile",CC"("OBJ"J"OBJ")V",  FN_PTR(Unsafe_SetObjectVolatile)},
> -+    {CC"getObject",        CC"(" OBJ "J)" OBJ "",   FN_PTR(Unsafe_GetObject)},
> -+    {CC"putObject",        CC"(" OBJ "J" OBJ ")V",  FN_PTR(Unsafe_SetObject)},
> -+    {CC"getObjectVolatile",CC"(" OBJ "J)" OBJ "",   FN_PTR(Unsafe_GetObjectVolatile)},
> -+    {CC"putObjectVolatile",CC"(" OBJ "J" OBJ ")V",  FN_PTR(Unsafe_SetObjectVolatile)},
> -
> -     DECLARE_GETSETOOP(Boolean, Z),
> -     DECLARE_GETSETOOP(Byte, B),
> -@@ -1631,36 +1631,36 @@ static JNINativeMethod methods_18[] = {
> -     DECLARE_GETSETNATIVE(Float, F),
> -     DECLARE_GETSETNATIVE(Double, D),
> -
> --    {CC"getAddress",         CC"("ADR")"ADR,             FN_PTR(Unsafe_GetNativeAddress)},
> --    {CC"putAddress",         CC"("ADR""ADR")V",          FN_PTR(Unsafe_SetNativeAddress)},
> -+    {CC"getAddress",         CC"(" ADR ")" ADR,             FN_PTR(Unsafe_GetNativeAddress)},
> -+    {CC"putAddress",         CC"(" ADR "" ADR ")V",          FN_PTR(Unsafe_SetNativeAddress)},
> -
> --    {CC"allocateMemory",     CC"(J)"ADR,                 FN_PTR(Unsafe_AllocateMemory)},
> --    {CC"reallocateMemory",   CC"("ADR"J)"ADR,            FN_PTR(Unsafe_ReallocateMemory)},
> --    {CC"freeMemory",         CC"("ADR")V",               FN_PTR(Unsafe_FreeMemory)},
> --
> --    {CC"objectFieldOffset",  CC"("FLD")J",               FN_PTR(Unsafe_ObjectFieldOffset)},
> --    {CC"staticFieldOffset",  CC"("FLD")J",               FN_PTR(Unsafe_StaticFieldOffset)},
> --    {CC"staticFieldBase",    CC"("FLD")"OBJ,             FN_PTR(Unsafe_StaticFieldBaseFromField)},
> --    {CC"ensureClassInitialized",CC"("CLS")V",            FN_PTR(Unsafe_EnsureClassInitialized)},
> --    {CC"arrayBaseOffset",    CC"("CLS")I",               FN_PTR(Unsafe_ArrayBaseOffset)},
> --    {CC"arrayIndexScale",    CC"("CLS")I",               FN_PTR(Unsafe_ArrayIndexScale)},
> -+    {CC"allocateMemory",     CC"(J)" ADR,                 FN_PTR(Unsafe_AllocateMemory)},
> -+    {CC"reallocateMemory",   CC"(" ADR "J)" ADR,            FN_PTR(Unsafe_ReallocateMemory)},
> -+    {CC"freeMemory",         CC"(" ADR ")V",               FN_PTR(Unsafe_FreeMemory)},
> -+
> -+    {CC"objectFieldOffset",  CC"(" FLD ")J",               FN_PTR(Unsafe_ObjectFieldOffset)},
> -+    {CC"staticFieldOffset",  CC"(" FLD ")J",               FN_PTR(Unsafe_StaticFieldOffset)},
> -+    {CC"staticFieldBase",    CC"(" FLD ")" OBJ,             FN_PTR(Unsafe_StaticFieldBaseFromField)},
> -+    {CC"ensureClassInitialized",CC"(" CLS ")V",            FN_PTR(Unsafe_EnsureClassInitialized)},
> -+    {CC"arrayBaseOffset",    CC"(" CLS ")I",               FN_PTR(Unsafe_ArrayBaseOffset)},
> -+    {CC"arrayIndexScale",    CC"(" CLS ")I",               FN_PTR(Unsafe_ArrayIndexScale)},
> -     {CC"addressSize",        CC"()I",                    FN_PTR(Unsafe_AddressSize)},
> -     {CC"pageSize",           CC"()I",                    FN_PTR(Unsafe_PageSize)},
> -
> --    {CC"defineClass",        CC"("DC_Args")"CLS,         FN_PTR(Unsafe_DefineClass)},
> --    {CC"allocateInstance",   CC"("CLS")"OBJ,             FN_PTR(Unsafe_AllocateInstance)},
> --    {CC"monitorEnter",       CC"("OBJ")V",               FN_PTR(Unsafe_MonitorEnter)},
> --    {CC"monitorExit",        CC"("OBJ")V",               FN_PTR(Unsafe_MonitorExit)},
> --    {CC"tryMonitorEnter",    CC"("OBJ")Z",               FN_PTR(Unsafe_TryMonitorEnter)},
> --    {CC"throwException",     CC"("THR")V",               FN_PTR(Unsafe_ThrowException)},
> --    {CC"compareAndSwapObject", CC"("OBJ"J"OBJ""OBJ")Z",  FN_PTR(Unsafe_CompareAndSwapObject)},
> --    {CC"compareAndSwapInt",  CC"("OBJ"J""I""I"")Z",      FN_PTR(Unsafe_CompareAndSwapInt)},
> --    {CC"compareAndSwapLong", CC"("OBJ"J""J""J"")Z",      FN_PTR(Unsafe_CompareAndSwapLong)},
> --    {CC"putOrderedObject",   CC"("OBJ"J"OBJ")V",         FN_PTR(Unsafe_SetOrderedObject)},
> --    {CC"putOrderedInt",      CC"("OBJ"JI)V",             FN_PTR(Unsafe_SetOrderedInt)},
> --    {CC"putOrderedLong",     CC"("OBJ"JJ)V",             FN_PTR(Unsafe_SetOrderedLong)},
> -+    {CC"defineClass",        CC"(" DC_Args ")" CLS,         FN_PTR(Unsafe_DefineClass)},
> -+    {CC"allocateInstance",   CC"(" CLS ")" OBJ,             FN_PTR(Unsafe_AllocateInstance)},
> -+    {CC"monitorEnter",       CC"(" OBJ ")V",               FN_PTR(Unsafe_MonitorEnter)},
> -+    {CC"monitorExit",        CC"(" OBJ ")V",               FN_PTR(Unsafe_MonitorExit)},
> -+    {CC"tryMonitorEnter",    CC"(" OBJ ")Z",               FN_PTR(Unsafe_TryMonitorEnter)},
> -+    {CC"throwException",     CC"(" THR ")V",               FN_PTR(Unsafe_ThrowException)},
> -+    {CC"compareAndSwapObject", CC"(" OBJ "J" OBJ "" OBJ ")Z",  FN_PTR(Unsafe_CompareAndSwapObject)},
> -+    {CC"compareAndSwapInt",  CC"(" OBJ "J""I""I"")Z",      FN_PTR(Unsafe_CompareAndSwapInt)},
> -+    {CC"compareAndSwapLong", CC"(" OBJ "J""J""J"")Z",      FN_PTR(Unsafe_CompareAndSwapLong)},
> -+    {CC"putOrderedObject",   CC"(" OBJ "J" OBJ ")V",         FN_PTR(Unsafe_SetOrderedObject)},
> -+    {CC"putOrderedInt",      CC"(" OBJ "JI)V",             FN_PTR(Unsafe_SetOrderedInt)},
> -+    {CC"putOrderedLong",     CC"(" OBJ "JJ)V",             FN_PTR(Unsafe_SetOrderedLong)},
> -     {CC"park",               CC"(ZJ)V",                  FN_PTR(Unsafe_Park)},
> --    {CC"unpark",             CC"("OBJ")V",               FN_PTR(Unsafe_Unpark)}
> -+    {CC"unpark",             CC"(" OBJ ")V",               FN_PTR(Unsafe_Unpark)}
> - };
> -
> - JNINativeMethod loadavg_method[] = {
> -@@ -1668,28 +1668,28 @@ JNINativeMethod loadavg_method[] = {
> - };
> -
> - JNINativeMethod prefetch_methods[] = {
> --    {CC"prefetchRead",       CC"("OBJ"J)V",              FN_PTR(Unsafe_PrefetchRead)},
> --    {CC"prefetchWrite",      CC"("OBJ"J)V",              FN_PTR(Unsafe_PrefetchWrite)},
> --    {CC"prefetchReadStatic", CC"("OBJ"J)V",              FN_PTR(Unsafe_PrefetchRead)},
> --    {CC"prefetchWriteStatic",CC"("OBJ"J)V",              FN_PTR(Unsafe_PrefetchWrite)}
> -+    {CC"prefetchRead",       CC"(" OBJ "J)V",              FN_PTR(Unsafe_PrefetchRead)},
> -+    {CC"prefetchWrite",      CC"(" OBJ "J)V",              FN_PTR(Unsafe_PrefetchWrite)},
> -+    {CC"prefetchReadStatic", CC"(" OBJ "J)V",              FN_PTR(Unsafe_PrefetchRead)},
> -+    {CC"prefetchWriteStatic",CC"(" OBJ "J)V",              FN_PTR(Unsafe_PrefetchWrite)}
> - };
> -
> - JNINativeMethod memcopy_methods_17[] = {
> --    {CC"copyMemory",         CC"("OBJ"J"OBJ"JJ)V",       FN_PTR(Unsafe_CopyMemory2)},
> --    {CC"setMemory",          CC"("OBJ"JJB)V",            FN_PTR(Unsafe_SetMemory2)}
> -+    {CC"copyMemory",         CC"(" OBJ "J" OBJ "JJ)V",       FN_PTR(Unsafe_CopyMemory2)},
> -+    {CC"setMemory",          CC"(" OBJ "JJB)V",            FN_PTR(Unsafe_SetMemory2)}
> - };
> -
> - JNINativeMethod memcopy_methods_15[] = {
> --    {CC"setMemory",          CC"("ADR"JB)V",             FN_PTR(Unsafe_SetMemory)},
> --    {CC"copyMemory",         CC"("ADR ADR"J)V",          FN_PTR(Unsafe_CopyMemory)}
> -+    {CC"setMemory",          CC"(" ADR "JB)V",             FN_PTR(Unsafe_SetMemory)},
> -+    {CC"copyMemory",         CC"(" ADR ADR "J)V",          FN_PTR(Unsafe_CopyMemory)}
> - };
> -
> - JNINativeMethod anonk_methods[] = {
> --    {CC"defineAnonymousClass", CC"("DAC_Args")"CLS,      FN_PTR(Unsafe_DefineAnonymousClass)},
> -+    {CC"defineAnonymousClass", CC"(" DAC_Args ")" CLS,      FN_PTR(Unsafe_DefineAnonymousClass)},
> - };
> -
> - JNINativeMethod lform_methods[] = {
> --    {CC"shouldBeInitialized",CC"("CLS")Z",               FN_PTR(Unsafe_ShouldBeInitialized)},
> -+    {CC"shouldBeInitialized",CC"(" CLS ")Z",               FN_PTR(Unsafe_ShouldBeInitialized)},
> - };
> -
> - JNINativeMethod fence_methods[] = {
> ---- hotspot/src/share/vm/prims/whitebox.cpp.orig
> -+++ hotspot/src/share/vm/prims/whitebox.cpp
> -@@ -166,8 +166,8 @@ WB_END
> -
> - WB_ENTRY(void, WB_PrintHeapSizes(JNIEnv* env, jobject o)) {
> -   CollectorPolicy * p = Universe::heap()->collector_policy();
> --  gclog_or_tty->print_cr("Minimum heap "SIZE_FORMAT" Initial heap "
> --    SIZE_FORMAT" Maximum heap "SIZE_FORMAT" Min alignment "SIZE_FORMAT" Max alignment "SIZE_FORMAT,
> -+  gclog_or_tty->print_cr("Minimum heap " SIZE_FORMAT " Initial heap "
> -+    SIZE_FORMAT " Maximum heap " SIZE_FORMAT " Min alignment " SIZE_FORMAT " Max alignment " SIZE_FORMAT,
> -     p->min_heap_byte_size(), p->initial_heap_byte_size(), p->max_heap_byte_size(),
> -     p->space_alignment(), p->heap_alignment());
> - }
> -@@ -202,8 +202,8 @@ WB_ENTRY(void, WB_ReadFromNoaccessArea(J
> -          Universe::narrow_oop_use_implicit_null_checks() )) {
> -     tty->print_cr("WB_ReadFromNoaccessArea method is useless:\n "
> -                   "\tUseCompressedOops is %d\n"
> --                  "\trhs.base() is "PTR_FORMAT"\n"
> --                  "\tUniverse::narrow_oop_base() is "PTR_FORMAT"\n"
> -+                  "\trhs.base() is " PTR_FORMAT "\n"
> -+                  "\tUniverse::narrow_oop_base() is " PTR_FORMAT "\n"
> -                   "\tUniverse::narrow_oop_use_implicit_null_checks() is %d",
> -                   UseCompressedOops,
> -                   rhs.base(),
> -@@ -256,8 +256,8 @@ static jint wb_stress_virtual_space_resi
> -
> - WB_ENTRY(jint, WB_StressVirtualSpaceResize(JNIEnv* env, jobject o,
> -         jlong reserved_space_size, jlong magnitude, jlong iterations))
> --  tty->print_cr("reservedSpaceSize="JLONG_FORMAT", magnitude="JLONG_FORMAT", "
> --                "iterations="JLONG_FORMAT"\n", reserved_space_size, magnitude,
> -+  tty->print_cr("reservedSpaceSize=" JLONG_FORMAT ", magnitude=" JLONG_FORMAT ", "
> -+                "iterations=" JLONG_FORMAT "\n", reserved_space_size, magnitude,
> -                 iterations);
> -   if (reserved_space_size < 0 || magnitude < 0 || iterations < 0) {
> -     tty->print_cr("One of variables printed above is negative. Can't proceed.\n");
> ---- hotspot/src/share/vm/runtime/safepoint.cpp.orig
> -+++ hotspot/src/share/vm/runtime/safepoint.cpp
> -@@ -918,7 +918,7 @@ void ThreadSafepointState::restart() {
> -
> -     case _running:
> -     default:
> --       tty->print_cr("restart thread "INTPTR_FORMAT" with state %d",
> -+       tty->print_cr("restart thread " INTPTR_FORMAT " with state %d",
> -                       _thread, _type);
> -        _thread->print();
> -       ShouldNotReachHere();
> -@@ -1275,14 +1275,14 @@ void SafepointSynchronize::print_stat_on
> -
> -   for (int index = 0; index < VM_Operation::VMOp_Terminating; index++) {
> -     if (_safepoint_reasons[index] != 0) {
> --      tty->print_cr("%-26s"UINT64_FORMAT_W(10), VM_Operation::name(index),
> -+      tty->print_cr("%-26s" UINT64_FORMAT_W(10), VM_Operation::name(index),
> -                     _safepoint_reasons[index]);
> -     }
> -   }
> -
> -   tty->print_cr(UINT64_FORMAT_W(5)" VM operations coalesced during safepoint",
> -                 _coalesced_vmop_count);
> --  tty->print_cr("Maximum sync time  "INT64_FORMAT_W(5)" ms",
> -+  tty->print_cr("Maximum sync time  " INT64_FORMAT_W(5) " ms",
> -                 _max_sync_time / MICROUNITS);
> -   tty->print_cr("Maximum vm operation time (except for Exit VM operation)  "
> -                 INT64_FORMAT_W(5)" ms",
> ---- hotspot/src/share/vm/services/threadService.cpp.orig
> -+++ hotspot/src/share/vm/services/threadService.cpp
> -@@ -889,7 +889,7 @@ void DeadlockCycle::print_on(outputStrea
> -       st->print("  waiting to lock monitor " INTPTR_FORMAT, waitingToLockMonitor);
> -       oop obj = (oop)waitingToLockMonitor->object();
> -       if (obj != NULL) {
> --        st->print(" (object "INTPTR_FORMAT ", a %s)", (address)obj,
> -+        st->print(" (object " INTPTR_FORMAT ", a %s)", (address)obj,
> -                    (InstanceKlass::cast(obj->klass()))->external_name());
> -
> -         if (!currentThread->current_pending_monitor_is_from_java()) {
> ---- hotspot/src/share/vm/trace/traceStream.hpp.orig
> -+++ hotspot/src/share/vm/trace/traceStream.hpp
> -@@ -40,31 +40,31 @@ class TraceStream : public StackObj {
> -   TraceStream(outputStream& stream): _st(stream) {}
> -
> -   void print_val(const char* label, u1 val) {
> --    _st.print("%s = "UINT32_FORMAT, label, val);
> -+    _st.print("%s = " UINT32_FORMAT, label, val);
> -   }
> -
> -   void print_val(const char* label, u2 val) {
> --    _st.print("%s = "UINT32_FORMAT, label, val);
> -+    _st.print("%s = " UINT32_FORMAT, label, val);
> -   }
> -
> -   void print_val(const char* label, s2 val) {
> --    _st.print("%s = "INT32_FORMAT, label, val);
> -+    _st.print("%s = " INT32_FORMAT, label, val);
> -   }
> -
> -   void print_val(const char* label, u4 val) {
> --    _st.print("%s = "UINT32_FORMAT, label, val);
> -+    _st.print("%s = " UINT32_FORMAT, label, val);
> -   }
> -
> -   void print_val(const char* label, s4 val) {
> --    _st.print("%s = "INT32_FORMAT, label, val);
> -+    _st.print("%s = " INT32_FORMAT, label, val);
> -   }
> -
> -   void print_val(const char* label, u8 val) {
> --    _st.print("%s = "UINT64_FORMAT, label, val);
> -+    _st.print("%s = " UINT64_FORMAT, label, val);
> -   }
> -
> -   void print_val(const char* label, s8 val) {
> --    _st.print("%s = "INT64_FORMAT, label, (int64_t) val);
> -+    _st.print("%s = " INT64_FORMAT, label, (int64_t) val);
> -   }
> -
> -   void print_val(const char* label, bool val) {
> ---- hotspot/src/share/vm/utilities/ostream.cpp.orig
> -+++ hotspot/src/share/vm/utilities/ostream.cpp
> -@@ -277,7 +277,7 @@ void outputStream::print_data(void* data
> -   size_t limit = (len + 16) / 16 * 16;
> -   for (size_t i = 0; i < limit; ++i) {
> -     if (i % 16 == 0) {
> --      indent().print(SIZE_FORMAT_HEX_W(07)":", i);
> -+      indent().print(SIZE_FORMAT_HEX_W(07) ":", i);
> -     }
> -     if (i % 2 == 0) {
> -       print(" ");
> -@@ -945,7 +945,7 @@ void defaultStream::start_log() {
> -     // %%% Should be: jlong time_ms = os::start_time_milliseconds(), if
> -     // we ever get round to introduce that method on the os class
> -     xs->head("hotspot_log version='%d %d'"
> --             " process='%d' time_ms='"INT64_FORMAT"'",
> -+             " process='%d' time_ms='" INT64_FORMAT "'",
> -              LOG_MAJOR_VERSION, LOG_MINOR_VERSION,
> -              os::current_process_id(), (int64_t)time_ms);
> -     // Write VM version header immediately.
> diff --git a/recipes-core/openjdk/patches-openjdk-8/openjdk8-no-genx11-in-headless.patch b/recipes-core/openjdk/patches-openjdk-8/openjdk8-no-genx11-in-headless.patch
> deleted file mode 100644
> index 38f5f9b..0000000
> --- a/recipes-core/openjdk/patches-openjdk-8/openjdk8-no-genx11-in-headless.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> ---- jdk/make/GenerateSources.gmk.orig
> -+++ jdk/make/GenerateSources.gmk
> -@@ -73,9 +73,11 @@ ifneq ($(OPENJDK_TARGET_OS), windows)
> -     GENSRC += $(GENSRC_OSX_ICONS)
> -   endif
> -
> --  ifneq ($(OPENJDK_TARGET_OS), macosx)
> --    include gensrc/GensrcX11Wrappers.gmk
> --    GENSRC += $(GENSRC_X11WRAPPERS)
> -+  ifndef BUILD_HEADLESS_ONLY
> -+    ifneq ($(OPENJDK_TARGET_OS), macosx)
> -+      include gensrc/GensrcX11Wrappers.gmk
> -+      GENSRC += $(GENSRC_X11WRAPPERS)
> -+    endif
> -   endif
> - endif
> -
> diff --git a/recipes-core/openjdk/patches-openjdk-8/openjdk8-restrict-to-staging-dir.patch b/recipes-core/openjdk/patches-openjdk-8/openjdk8-restrict-to-staging-dir.patch
> deleted file mode 100644
> index d33dc96..0000000
> --- a/recipes-core/openjdk/patches-openjdk-8/openjdk8-restrict-to-staging-dir.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- hotspot/make/linux/makefiles/dtrace.make.orig	2015-09-01 08:00:59.737868760 +0200
> -+++ hotspot/make/linux/makefiles/dtrace.make	2015-09-01 08:01:24.049859677 +0200
> -@@ -40,7 +40,7 @@
> - ifneq ($(ALT_SDT_H),)
> -   SDT_H_FILE = $(ALT_SDT_H)
> - else
> --  SDT_H_FILE = /usr/include/sys/sdt.h
> -+  SDT_H_FILE = $(SYS_ROOT)/usr/include/sys/sdt.h
> - endif
> - DTRACE_ENABLED = $(shell test -f $(SDT_H_FILE) && echo $(SDT_H_FILE))
> - REASON = "$(SDT_H_FILE) not found"
> 

