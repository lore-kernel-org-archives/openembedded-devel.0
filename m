Return-Path: <jacob.kroon@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id D63677D251
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 12:21:29 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id d16so3746970wre.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 04:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:from:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=1kf1Lzl04qXeMXtlP2vMStlmF6hfpEPFB1NhPLxADwg=;
	b=KBfpqh/c9e8EVe5B4Y89H6jg66FH0iuNA4dMonnxxQvNe2Il7EjVgb+Cybc9xAHVGJ
	tZ9N4NKqdb1YSmjhb2uPaqu6B3m7kIqZE+gT78tJODWE9KAmAdApq0kpbUf0LItwYyYw
	sbWSYacsChRQfFw6LTDjXdVwWJ1tuNBYsTfEq8CmnOhb2yLbH63fC0Clu0jGGuPYFxwU
	FfZEZbbmWtXHFMTvF4AebgqDcfocQoYL65lwNfeaxjXCHFK2C3pydjsaqUA9iZDcxrTe
	fjdEW5i9yWRvb1QU6RP2QkM1lqhU/KsdQW9CIUmnL2NtH7bD0LrVXuG5PZ9m4l3q3XUJ
	B5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=1kf1Lzl04qXeMXtlP2vMStlmF6hfpEPFB1NhPLxADwg=;
	b=Wx57DXpYt8GyiA23EpEmBSAd0MyftV2tyJawkvz70poSPA4q5Cj7m6AhHr0tDD0JIQ
	syb+Fip5w2pHYkTngrsjZBSlUIFhiC6u2JpPxrr/HiFI823ildLGhX3jpEdWDIj+atEJ
	JhrP/jn2hp6eme3iZ9Vvk+CGd1CSObBVG5wq2xinhaIgwN/CYsJapHApsPkWtz7lT86h
	FIlQJZNdR+vuHLIT+zhYxakYlkxmDZPzYqR4mm2Jr03KLW8oxCF91MThgrcvA8tZkkzD
	S3eceefsiGJ2/ttR0fHrHyZbzb1MlAZbDYw4Eifd444BS4coFGxRwDgFQ2xId7ChFvCp
	52Uw==
X-Gm-Message-State: APjAAAWMvbVA8l9g862eJtIPNeAasmx3dZS7O8RRbct/gWUV5sLUkHsF
	UySnm8u8QS/scbLfvzGQcXrBdAwi
X-Google-Smtp-Source: APXvYqyXLkoxZRHMo+zuMfUkvW2VUw59AfKIASLNncNgVbhH+G5Y6uealvARqjoIwbuTLk7CbsR6hw==
X-Received: by 2002:a05:651c:448:: with SMTP id g8mr791971ljg.35.1580335471972;
	Wed, 29 Jan 2020 14:04:31 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	o19sm2071484lji.54.2020.01.29.14.04.30
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 29 Jan 2020 14:04:30 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Richard Leitner <richard.leitner@skidata.com>
References: <20200128052225.2455848-1-richard.leitner@skidata.com>
	<20200128052225.2455848-2-richard.leitner@skidata.com>
	<530aea13-2ab8-054d-795e-64c0121c7fe4@gmail.com>
Message-ID: <b80929f5-be86-40e3-5285-8d156674358c@gmail.com>
Date: Wed, 29 Jan 2020 23:04:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <530aea13-2ab8-054d-795e-64c0121c7fe4@gmail.com>
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
X-List-Received-Date: Thu, 30 Jan 2020 12:21:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 1/29/20 10:17 PM, Jacob Kroon wrote:
> On 1/28/20 6:22 AM, Richard Leitner wrote:
>> As OpenJDK-8 is now tagging "ga" versions in addition to the "build"
>> version the recipes are adapted to use those "ga" versions.
>>
>> All existing patches got re-applied and renamed. For better handling 
>> Hotspot
>> patches now start at patch number 1001 and jdk patches at 2001.
>>
>> Furthermore architecture dependent patches are prefixed with the
>> architecture they apply on.
>>
>> Following patches/hunks were completely dropped:
>> - 0002-hotspot-fix-compilation-with-security-flags-enabled.patch
>>      got backported to hotspot jdk8u
>>      https://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/c40a28e54185
>> - 0011-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch
>>      ostream.cpp:112 got fixed in hotspot jdk8u
>>      https://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/f3108e56b502
>> - 0014-hotspot-zero-fix-undefined-behaviour-gcc-v8-fix.patch
>>      got backported to hotspot jdk8u
>>      https://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/ca4663e58916
>> - 0018-hotspot-Fix-debug-build-after-8062808-Turn-on-the-Wr.patch
>>      fixed in hotspot jdk8u
>>      https://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/32bc598624bd
>> - 0020-Enable-HotSpot-builds-on-5.x-Linux-kernels.patch
>>      fixed in hotspot jdk8u
>>      https://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/5af8ec63c21c
>> - openjdk8-add-missing-linker-flags.patch
>>      fixed in hotspot jdk8u
>>      https://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/f175513c2c3a
>> - openjdk8-fix-shark-stdc++11.patch
>>      fixed in hotspot jdk8u
>> - openjdk8-fix-libpng-neon-build.patch
>>      fixed in jdk
>>      https://hg.openjdk.java.net/jdk8u/jdk8u/jdk/rev/5d57817931e1
>> - aarch64-hotspot-fix-undefined-behaviour-gcc-v8-fix.patch
>>      got backported to hotspot jdk8u
>>
>> Following patches were newly added:
>> - 0011-autoconf-fix-CC-with-arguments-detection.patch
>>      needed because of jdk8u commit "8038340: Cleanup and fix sysroot 
>> and devkit handling on Linux and Solaris"
>> - 0012-autoconf-NativeCompilation-remove-sysroot.patch
>>      needed because of jdk8u commit "8038340: Cleanup and fix sysroot 
>> and devkit handling on Linux and Solaris"
>>
>> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>> ---
>>   docs/UPDATING.md                              |   18 +
>>   recipes-core/openjdk/openjdk-8-common.inc     |   13 +-
>>   recipes-core/openjdk/openjdk-8-cross.inc      |   27 +-
>>   recipes-core/openjdk/openjdk-8-native.inc     |    5 +-
>>   .../openjdk/openjdk-8-native_172b11.bb        |    2 -
>>   recipes-core/openjdk/openjdk-8-native_242.bb  |    2 +
>>   .../openjdk-8-release-172b11-aarch32.inc      |   58 -
>>   .../openjdk-8-release-172b11-aarch64.inc      |   35 -
>>   .../openjdk/openjdk-8-release-172b11.inc      |   39 -
>>   .../openjdk/openjdk-8-release-aarch32.inc     |   60 +
>>   .../openjdk/openjdk-8-release-aarch64.inc     |   37 +
>>   ...ommon.inc => openjdk-8-release-common.inc} |   96 +-
>>   recipes-core/openjdk/openjdk-8-release.inc    |   39 +
>>   .../{openjdk-8_172b11.bb => openjdk-8_242.bb} |    4 +-
>>   .../{openjre-8_172b11.bb => openjre-8_242.bb} |    4 +-
>>   ...low-using-a-system-installed-libjpeg.patch |   77 +
>>   ...llow-using-a-system-installed-libpng.patch |   80 +
>>   ...pilation-with-security-flags-enabled.patch |   41 -
>>   ...ild-on-as-needed-toolchains-generic.patch} |   12 +-
>>   ... => 0004-don-t-expect-fqpn-for-make.patch} |   21 +-
>>   ...llow-using-a-system-installed-libpng.patch |  148 -
>>   ...005-autoconf-filter-aclocal-copy-too.patch |   25 +
>>   ...> 0006-autoconf-handle-extra-output.patch} |   19 +-
>>   ...-assembler-flag-handling-in-makefile.patch |   36 +
>>   ...0008-autoconf-fix-shark-build-common.patch |   37 +
>>   ...-in-favour-of-openembedded-package-.patch} |   98 +-
>>   ...ove-shell-variables-from-autoheader.patch} |   25 +-
>>   ...conf-fix-CC-with-arguments-detection.patch |   43 +
>>   ...onf-NativeCompilation-remove-sysroot.patch |   24 +
>>   ...4-fix-undefined-behaviour-gcc-v8-fix.patch |   41 -
>>   ...o-fix-undefined-behaviour-gcc-v8-fix.patch |   42 -
>>   ...g-build-after-8062808-Turn-on-the-Wr.patch |   47 -
>>   ...-HotSpot-builds-on-5.x-Linux-kernels.patch |   43 -
>>   ...tspot-fix-crash-on-JNI_CreateJavaVM.patch} |   13 +-
>>   ...otspot-use-correct-include-for-poll.patch} |   24 +-
>>   ...tspot-don-t-rely-on-old-SysV-SIGCLD.patch} |   12 +-
>>   ...patch-to-fix-misuses-of-strncpy-str.patch} |   63 +-
>>   ...rn-type-issues-introduced-by-806165.patch} |   21 +-
>>   ...ro-build-requires-disabled-warnings.patch} |   36 +-
>>   ...eturn-statement-in-__sync_val_compa.patch} |   18 +-
>>   ...ot-Turn-on-the-Wreturn-type-warning.patch} |   70 +-
>>   ...otspot-handle-format-error-for-GCC-7.patch |   34 +
>>   ...atch => 1010-hotspot-fix-adlc-flags.patch} |   33 +-
>>   ...1011-hotspot-fix-shark-build-common.patch} |  322 +-
>>   ...1012-hotspot-restrict-to-staging-dir.patch |   26 +
>>   ...parison-between-pointer-and-integer.patch} |   34 +-
>>   ...ow-using-a-system-installed-libjpeg.patch} |   84 +-
>>   ...llow-using-a-system-installed-libpng.patch |   83 +
>>   ...04-jdk-use-correct-include-for-poll.patch} |   47 +-
>>   ...-jdk-use-correct-include-for-signal.patch} |   23 +-
>>   ...dk-disable-backtrace-musl-build-fix.patch} |   13 +-
>>   .../2007-jdk-no-genx11-in-headless.patch      |   32 +
>>   ...ps.patch => 2008-jdk-no-unused-deps.patch} |   66 +-
>>   ...2-hotspot-fix-missing-return-values.patch} |    0
>>   ...aarch32-hotspot-fix-shark-build-pt2.patch} |    0
>>   ...arch32-hotspot-remaining-musl-fixes.patch} |    0
>>   ...ix-further-functions-with-a-missing.patch} |    0
>>   ...arch64-hotspot-remaining-musl-fixes.patch} |    0
>>   .../filter-aclocal-copy-too.patch             |   11 -
>>   .../hotspot-handle-gcc7-format-overflow.patch |   25 -
>>   .../openjdk8-add-missing-linker-flags.patch   |   57 -
>>   ...enjdk8-find-compiler-fix-env-respect.patch |  140 -
>>   ...-assembler-flag-handling-in-makefile.patch |   20 -
>>   .../openjdk8-fix-libpng-neon-build.patch      |   29 -
>>   .../openjdk8-fix-shark-build-pt2.patch        |   35 +-
>>   .../openjdk8-fix-shark-stdc++11.patch         | 2631 -----------------
>>   .../openjdk8-no-genx11-in-headless.patch      |   17 -
>>   .../openjdk8-restrict-to-staging-dir.patch    |   11 -
>>   68 files changed, 1310 insertions(+), 4018 deletions(-)
>>   create mode 100644 docs/UPDATING.md
>>   delete mode 100644 recipes-core/openjdk/openjdk-8-native_172b11.bb
>>   create mode 100644 recipes-core/openjdk/openjdk-8-native_242.bb
>>   delete mode 100644 
>> recipes-core/openjdk/openjdk-8-release-172b11-aarch32.inc
>>   delete mode 100644 
>> recipes-core/openjdk/openjdk-8-release-172b11-aarch64.inc
>>   delete mode 100644 recipes-core/openjdk/openjdk-8-release-172b11.inc
>>   create mode 100644 recipes-core/openjdk/openjdk-8-release-aarch32.inc
>>   create mode 100644 recipes-core/openjdk/openjdk-8-release-aarch64.inc
>>   rename recipes-core/openjdk/{openjdk-8-release-172b11-common.inc => 
>> openjdk-8-release-common.inc} (57%)
>>   create mode 100644 recipes-core/openjdk/openjdk-8-release.inc
>>   rename recipes-core/openjdk/{openjdk-8_172b11.bb => 
>> openjdk-8_242.bb} (92%)
>>   rename recipes-core/openjdk/{openjre-8_172b11.bb => 
>> openjre-8_242.bb} (90%)
>>   create mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/0001-Allow-using-a-system-installed-libjpeg.patch 
>>
>>   create mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/0002-Allow-using-a-system-installed-libpng.patch 
>>
>>   delete mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/0002-hotspot-fix-compilation-with-security-flags-enabled.patch 
>>
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{0010-build-fix-build-on-as-needed-toolchains-generic.patch 
>> => 0003-build-fix-build-on-as-needed-toolchains-generic.patch} (94%)
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{dont-expect-fqpn-for-make.patch => 
>> 0004-don-t-expect-fqpn-for-make.patch} (54%)
>>   delete mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/0004-jdk-Allow-using-a-system-installed-libpng.patch 
>>
>>   create mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/0005-autoconf-filter-aclocal-copy-too.patch 
>>
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{handle_extra_output.patch => 
>> 0006-autoconf-handle-extra-output.patch} (57%)
>>   create mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/0007-fix-assembler-flag-handling-in-makefile.patch 
>>
>>   create mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/0008-autoconf-fix-shark-build-common.patch 
>>
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{openjdk8-prevent-debuginfo-in-favour-of-openembedded-package-split.patch 
>> => 0009-prevent-debuginfo-in-favour-of-openembedded-package-.patch} (51%)
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{remove-shell-variables-from-autoheader.patch 
>> => 0010-autoconf-remove-shell-variables-from-autoheader.patch} (69%)
>>   create mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/0011-autoconf-fix-CC-with-arguments-detection.patch 
>>
>>   create mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/0012-autoconf-NativeCompilation-remove-sysroot.patch 
>>
>>   delete mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/0012-hotspot-aarch64-fix-undefined-behaviour-gcc-v8-fix.patch 
>>
>>   delete mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/0014-hotspot-zero-fix-undefined-behaviour-gcc-v8-fix.patch 
>>
>>   delete mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/0018-hotspot-Fix-debug-build-after-8062808-Turn-on-the-Wr.patch 
>>
>>   delete mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/0020-Enable-HotSpot-builds-on-5.x-Linux-kernels.patch 
>>
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{0001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch 
>> => 1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch} (80%)
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{0005-hotspot-use-correct-include-for-poll.patch 
>> => 1002-hotspot-use-correct-include-for-poll.patch} (81%)
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{0006-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch 
>> => 1003-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch} (82%)
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{0011-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch 
>> => 1004-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch} (77%)
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{0015-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch 
>> => 1005-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch} (82%)
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{0016-hotspot-Zero-build-requires-disabled-warnings.patch 
>> => 1006-hotspot-Zero-build-requires-disabled-warnings.patch} (83%)
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{0017-hotspot-Missing-return-statement-in-__sync_val_compa.patch 
>> => 1007-hotspot-Missing-return-statement-in-__sync_val_compa.patch} (80%)
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{0019-hotspot-Turn-on-the-Wreturn-type-warning.patch 
>> => 1008-hotspot-Turn-on-the-Wreturn-type-warning.patch} (86%)
>>   create mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/1009-hotspot-handle-format-error-for-GCC-7.patch 
>>
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{openjdk8-fix-adlc-flags.patch 
>> => 1010-hotspot-fix-adlc-flags.patch} (55%)
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{openjdk8-fix-shark-build-common.patch 
>> => 1011-hotspot-fix-shark-build-common.patch} (65%)
>>   create mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/1012-hotspot-restrict-to-staging-dir.patch 
>>
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{0001-jdk-comparison-between-pointer-and-integer.patch 
>> => 2001-jdk-comparison-between-pointer-and-integer.patch} (86%)
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{0003-jdk-Allow-using-a-system-installed-libjpeg.patch 
>> => 2002-jdk-Allow-using-a-system-installed-libjpeg.patch} (77%)
>>   create mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/2003-jdk-Allow-using-a-system-installed-libpng.patch 
>>
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{0007-jdk-use-correct-include-for-poll.patch 
>> => 2004-jdk-use-correct-include-for-poll.patch} (81%)
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{0008-jdk-use-correct-include-for-signal.patch 
>> => 2005-jdk-use-correct-include-for-signal.patch} (83%)
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{0009-jdk-disable-backtrace-musl-build-fix.patch 
>> => 2006-jdk-disable-backtrace-musl-build-fix.patch} (75%)
>>   create mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/2007-jdk-no-genx11-in-headless.patch 
>>
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{openjdk8-no-unused-deps.patch 
>> => 2008-jdk-no-unused-deps.patch} (58%)
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{0001-hotspot-aarch32-fix-missing-return-values.patch 
>> => aarch32-hotspot-fix-missing-return-values.patch} (100%)
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{openjdk8-fix-shark-build-pt2-aarch32.patch 
>> => aarch32-hotspot-fix-shark-build-pt2.patch} (100%)
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{hotspot-remaining-musl-fixes-aarch32.patch 
>> => aarch32-hotspot-remaining-musl-fixes.patch} (100%)
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{0013-hotspot-aarch64-Fix-further-functions-with-a-missing.patch 
>> => aarch64-hotspot-Fix-further-functions-with-a-missing.patch} (100%)
>>   rename 
>> recipes-core/openjdk/patches-openjdk-8/{hotspot-remaining-musl-fixes-aarch64.patch 
>> => aarch64-hotspot-remaining-musl-fixes.patch} (100%)
>>   delete mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/filter-aclocal-copy-too.patch
>>   delete mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/hotspot-handle-gcc7-format-overflow.patch 
>>
>>   delete mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/openjdk8-add-missing-linker-flags.patch 
>>
>>   delete mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/openjdk8-find-compiler-fix-env-respect.patch 
>>
>>   delete mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-assembler-flag-handling-in-makefile.patch 
>>
>>   delete mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-libpng-neon-build.patch 
>>
>>   delete mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-stdc++11.patch
>>   delete mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/openjdk8-no-genx11-in-headless.patch 
>>
>>   delete mode 100644 
>> recipes-core/openjdk/patches-openjdk-8/openjdk8-restrict-to-staging-dir.patch 
>>
>>
>> diff --git a/docs/UPDATING.md b/docs/UPDATING.md
>> new file mode 100644
>> index 0000000..a08cf02
>> --- /dev/null
>> +++ b/docs/UPDATING.md
>> @@ -0,0 +1,18 @@
>> +# HowTo Update OpenJDK 8 #
>> +
>> +1. Determine latest ga version:
>> +     curl -s "https://hg.openjdk.java.net/jdk8u/jdk8u/tags" | grep -m 
>> 1 "jdk8u.*ga" | sed 's/-ga$//g'
>> +2. Rename OpenJDK/OpenJRE bb files to the matching release version
>> +3. Adapt the CHANGESET_ID for aarch32 based on:
>> +     curl -s https://hg.openjdk.java.net/aarch32-port/jdk8u/tags | 
>> grep "jdk8u.*ga-aarch32-"
>> +4. Adapt the CHANGESET_ID for aarch64 based on:
>> +     curl -s 
>> https://hg.openjdk.java.net/aarch64-port/jdk8u-shenandoah/tags | grep 
>> "aarch64-shenandoah-jdk8u.*-"
>> +5. Adapt checksums in
>> +   * openjdk-8-release.inc
>> +   * openjdk-8-release-aarch32.inc
>> +   * openjdk-8-release-aarch64.inc
>> +6. Check if any patch got upstreamed (and remove if so)
>> +7. Re-apply all other patches and format them again
>> +    for git: git format-patch --src-prefix=a/y/ --dst-prefix=b/y/ -n 
>> --start-number=x jdk8uXXX-ga
>> +8. Test for x86_64, aarch32 & aarch64 (at least using testimage in qemu)
>> +9. Send a patch ;-)
>> diff --git a/recipes-core/openjdk/openjdk-8-common.inc 
>> b/recipes-core/openjdk/openjdk-8-common.inc
>> index 1fbe7fe..0ef4750 100644
>> --- a/recipes-core/openjdk/openjdk-8-common.inc
>> +++ b/recipes-core/openjdk/openjdk-8-common.inc
>> @@ -8,13 +8,13 @@ require openjdk-common.inc
>>   AUTOTOOLS_SCRIPT_PATH = "${S}/common/autoconf/"
>>   export AUTOCONF_DIR="${AUTOTOOLS_SCRIPT_PATH}"
>> -
>>   FILESPATH =. "${FILE_DIRNAME}/patches-openjdk-8:"
>>   # for weird openjdk-common.inc
>>   S = "${WORKDIR}/${OPENJDK_HG_U}-${OPENJDK_CHANGESET}"
>> +export TOPDIR="${S}"
> 
> This "export TOPDIR" breaks creating the sstate cache.
> 

More correctly, it breaks creating sstate cache if one is using the 
default value for

SSTATE_DIR ?= "${TOPDIR}/sstate-cache"

set in openembedded-core/meta/conf/bitbake.conf.

/Jacob

