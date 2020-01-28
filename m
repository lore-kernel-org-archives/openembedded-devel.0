Return-Path: <richard.leitner@skidata.com>
Received: from mail.bubus.at (bubus.at [81.19.156.191])
	by mail.openembedded.org (Postfix) with ESMTP id 02C6A7FEDF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 14:14:09 +0000 (UTC)
Received: from pcleri (unknown [91.230.2.244])
	by mail.bubus.at (Postfix) with ESMTPSA id A9F736C20001
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 15:14:09 +0100 (CET)
Date: Tue, 28 Jan 2020 15:14:08 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20200128141408.GI2982185@pcleri>
References: <20200128052225.2455848-1-richard.leitner@skidata.com>
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
X-List-Received-Date: Tue, 28 Jan 2020 14:14:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
this is a note to let you know that I've just added this series as a
single squashed commit to the master-next branch of the meta-java
repository at
     git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

regards;rl

On Tue, Jan 28, 2020 at 06:22:21AM +0100, Richard Leitner wrote:
> This series updates Openjdk 8 to the latest "ga" release 242.
> 
> Successful testing has been done on a fedora-31 build host for 
> qemuarm64, qemux86-64, qemuarm32 and armv7a.
> 
> CHANGES v2:
>  - remove openjre debuginfo fixup completely as it targeted JDK_HOME
>    instead of JRE_HOME and jre doen't create debuginfo files.
> 
> Richard Leitner (4):
>   openjdk-8: update to latest ga version 242
>   docs: add update8checksums.sh and mention it in UPDATING.md
>   openjre-8: remove debuginfo fixup from do_install
>   openjdk-8: fix jdk linking for non aarch architectures
> 
>  docs/UPDATING.md                              |   16 +
>  docs/update8checksums.sh                      |   64 +
>  recipes-core/openjdk/openjdk-8-common.inc     |   13 +-
>  recipes-core/openjdk/openjdk-8-cross.inc      |   27 +-
>  recipes-core/openjdk/openjdk-8-native.inc     |    5 +-
>  .../openjdk/openjdk-8-native_172b11.bb        |    2 -
>  recipes-core/openjdk/openjdk-8-native_242.bb  |    2 +
>  .../openjdk-8-release-172b11-aarch32.inc      |   58 -
>  .../openjdk-8-release-172b11-aarch64.inc      |   35 -
>  .../openjdk/openjdk-8-release-172b11.inc      |   39 -
>  .../openjdk/openjdk-8-release-aarch32.inc     |   60 +
>  .../openjdk/openjdk-8-release-aarch64.inc     |   37 +
>  ...ommon.inc => openjdk-8-release-common.inc} |  102 +-
>  recipes-core/openjdk/openjdk-8-release.inc    |   39 +
>  .../{openjdk-8_172b11.bb => openjdk-8_242.bb} |    4 +-
>  .../{openjre-8_172b11.bb => openjre-8_242.bb} |    3 +-
>  ...low-using-a-system-installed-libjpeg.patch |   77 +
>  ...llow-using-a-system-installed-libpng.patch |   80 +
>  ...pilation-with-security-flags-enabled.patch |   41 -
>  ...ild-on-as-needed-toolchains-generic.patch} |   12 +-
>  ... => 0004-don-t-expect-fqpn-for-make.patch} |   21 +-
>  ...llow-using-a-system-installed-libpng.patch |  148 -
>  ...005-autoconf-filter-aclocal-copy-too.patch |   25 +
>  ...> 0006-autoconf-handle-extra-output.patch} |   19 +-
>  ...-assembler-flag-handling-in-makefile.patch |   36 +
>  ...0008-autoconf-fix-shark-build-common.patch |   37 +
>  ...-in-favour-of-openembedded-package-.patch} |   98 +-
>  ...ove-shell-variables-from-autoheader.patch} |   25 +-
>  ...conf-fix-CC-with-arguments-detection.patch |   43 +
>  ...onf-NativeCompilation-remove-sysroot.patch |   24 +
>  ...4-fix-undefined-behaviour-gcc-v8-fix.patch |   41 -
>  ...o-fix-undefined-behaviour-gcc-v8-fix.patch |   42 -
>  ...g-build-after-8062808-Turn-on-the-Wr.patch |   47 -
>  ...-HotSpot-builds-on-5.x-Linux-kernels.patch |   43 -
>  ...tspot-fix-crash-on-JNI_CreateJavaVM.patch} |   13 +-
>  ...otspot-use-correct-include-for-poll.patch} |   24 +-
>  ...tspot-don-t-rely-on-old-SysV-SIGCLD.patch} |   12 +-
>  ...patch-to-fix-misuses-of-strncpy-str.patch} |   63 +-
>  ...rn-type-issues-introduced-by-806165.patch} |   21 +-
>  ...ro-build-requires-disabled-warnings.patch} |   36 +-
>  ...eturn-statement-in-__sync_val_compa.patch} |   18 +-
>  ...ot-Turn-on-the-Wreturn-type-warning.patch} |   70 +-
>  ...otspot-handle-format-error-for-GCC-7.patch |   34 +
>  ...atch => 1010-hotspot-fix-adlc-flags.patch} |   33 +-
>  ...1011-hotspot-fix-shark-build-common.patch} |  322 +-
>  ...1012-hotspot-restrict-to-staging-dir.patch |   26 +
>  ...parison-between-pointer-and-integer.patch} |   34 +-
>  ...ow-using-a-system-installed-libjpeg.patch} |   84 +-
>  ...llow-using-a-system-installed-libpng.patch |   83 +
>  ...04-jdk-use-correct-include-for-poll.patch} |   47 +-
>  ...-jdk-use-correct-include-for-signal.patch} |   23 +-
>  ...dk-disable-backtrace-musl-build-fix.patch} |   13 +-
>  .../2007-jdk-no-genx11-in-headless.patch      |   32 +
>  ...ps.patch => 2008-jdk-no-unused-deps.patch} |   66 +-
>  ...f-ld-to-link-genSocketOptionRegistry.patch |   13 +
>  ...2-hotspot-fix-missing-return-values.patch} |    0
>  ...aarch32-hotspot-fix-shark-build-pt2.patch} |    0
>  ...arch32-hotspot-remaining-musl-fixes.patch} |    0
>  ...ix-further-functions-with-a-missing.patch} |    0
>  ...arch64-hotspot-remaining-musl-fixes.patch} |    0
>  .../filter-aclocal-copy-too.patch             |   11 -
>  .../hotspot-handle-gcc7-format-overflow.patch |   25 -
>  .../openjdk8-add-missing-linker-flags.patch   |   57 -
>  ...enjdk8-find-compiler-fix-env-respect.patch |  140 -
>  ...-assembler-flag-handling-in-makefile.patch |   20 -
>  .../openjdk8-fix-libpng-neon-build.patch      |   29 -
>  .../openjdk8-fix-shark-build-pt2.patch        |   35 +-
>  .../openjdk8-fix-shark-stdc++11.patch         | 2631 -----------------
>  .../openjdk8-no-genx11-in-headless.patch      |   17 -
>  .../openjdk8-restrict-to-staging-dir.patch    |   11 -
>  70 files changed, 1390 insertions(+), 4018 deletions(-)
>  create mode 100644 docs/UPDATING.md
>  create mode 100755 docs/update8checksums.sh
>  delete mode 100644 recipes-core/openjdk/openjdk-8-native_172b11.bb
>  create mode 100644 recipes-core/openjdk/openjdk-8-native_242.bb
>  delete mode 100644 recipes-core/openjdk/openjdk-8-release-172b11-aarch32.inc
>  delete mode 100644 recipes-core/openjdk/openjdk-8-release-172b11-aarch64.inc
>  delete mode 100644 recipes-core/openjdk/openjdk-8-release-172b11.inc
>  create mode 100644 recipes-core/openjdk/openjdk-8-release-aarch32.inc
>  create mode 100644 recipes-core/openjdk/openjdk-8-release-aarch64.inc
>  rename recipes-core/openjdk/{openjdk-8-release-172b11-common.inc => openjdk-8-release-common.inc} (57%)
>  create mode 100644 recipes-core/openjdk/openjdk-8-release.inc
>  rename recipes-core/openjdk/{openjdk-8_172b11.bb => openjdk-8_242.bb} (92%)
>  rename recipes-core/openjdk/{openjre-8_172b11.bb => openjre-8_242.bb} (90%)
>  create mode 100644 recipes-core/openjdk/patches-openjdk-8/0001-Allow-using-a-system-installed-libjpeg.patch
>  create mode 100644 recipes-core/openjdk/patches-openjdk-8/0002-Allow-using-a-system-installed-libpng.patch
>  delete mode 100644 recipes-core/openjdk/patches-openjdk-8/0002-hotspot-fix-compilation-with-security-flags-enabled.patch
>  rename recipes-core/openjdk/patches-openjdk-8/{0010-build-fix-build-on-as-needed-toolchains-generic.patch => 0003-build-fix-build-on-as-needed-toolchains-generic.patch} (94%)
>  rename recipes-core/openjdk/patches-openjdk-8/{dont-expect-fqpn-for-make.patch => 0004-don-t-expect-fqpn-for-make.patch} (54%)
>  delete mode 100644 recipes-core/openjdk/patches-openjdk-8/0004-jdk-Allow-using-a-system-installed-libpng.patch
>  create mode 100644 recipes-core/openjdk/patches-openjdk-8/0005-autoconf-filter-aclocal-copy-too.patch
>  rename recipes-core/openjdk/patches-openjdk-8/{handle_extra_output.patch => 0006-autoconf-handle-extra-output.patch} (57%)
>  create mode 100644 recipes-core/openjdk/patches-openjdk-8/0007-fix-assembler-flag-handling-in-makefile.patch
>  create mode 100644 recipes-core/openjdk/patches-openjdk-8/0008-autoconf-fix-shark-build-common.patch
>  rename recipes-core/openjdk/patches-openjdk-8/{openjdk8-prevent-debuginfo-in-favour-of-openembedded-package-split.patch => 0009-prevent-debuginfo-in-favour-of-openembedded-package-.patch} (51%)
>  rename recipes-core/openjdk/patches-openjdk-8/{remove-shell-variables-from-autoheader.patch => 0010-autoconf-remove-shell-variables-from-autoheader.patch} (69%)
>  create mode 100644 recipes-core/openjdk/patches-openjdk-8/0011-autoconf-fix-CC-with-arguments-detection.patch
>  create mode 100644 recipes-core/openjdk/patches-openjdk-8/0012-autoconf-NativeCompilation-remove-sysroot.patch
>  delete mode 100644 recipes-core/openjdk/patches-openjdk-8/0012-hotspot-aarch64-fix-undefined-behaviour-gcc-v8-fix.patch
>  delete mode 100644 recipes-core/openjdk/patches-openjdk-8/0014-hotspot-zero-fix-undefined-behaviour-gcc-v8-fix.patch
>  delete mode 100644 recipes-core/openjdk/patches-openjdk-8/0018-hotspot-Fix-debug-build-after-8062808-Turn-on-the-Wr.patch
>  delete mode 100644 recipes-core/openjdk/patches-openjdk-8/0020-Enable-HotSpot-builds-on-5.x-Linux-kernels.patch
>  rename recipes-core/openjdk/patches-openjdk-8/{0001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch => 1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch} (80%)
>  rename recipes-core/openjdk/patches-openjdk-8/{0005-hotspot-use-correct-include-for-poll.patch => 1002-hotspot-use-correct-include-for-poll.patch} (81%)
>  rename recipes-core/openjdk/patches-openjdk-8/{0006-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch => 1003-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch} (82%)
>  rename recipes-core/openjdk/patches-openjdk-8/{0011-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch => 1004-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch} (77%)
>  rename recipes-core/openjdk/patches-openjdk-8/{0015-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch => 1005-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch} (82%)
>  rename recipes-core/openjdk/patches-openjdk-8/{0016-hotspot-Zero-build-requires-disabled-warnings.patch => 1006-hotspot-Zero-build-requires-disabled-warnings.patch} (83%)
>  rename recipes-core/openjdk/patches-openjdk-8/{0017-hotspot-Missing-return-statement-in-__sync_val_compa.patch => 1007-hotspot-Missing-return-statement-in-__sync_val_compa.patch} (80%)
>  rename recipes-core/openjdk/patches-openjdk-8/{0019-hotspot-Turn-on-the-Wreturn-type-warning.patch => 1008-hotspot-Turn-on-the-Wreturn-type-warning.patch} (86%)
>  create mode 100644 recipes-core/openjdk/patches-openjdk-8/1009-hotspot-handle-format-error-for-GCC-7.patch
>  rename recipes-core/openjdk/patches-openjdk-8/{openjdk8-fix-adlc-flags.patch => 1010-hotspot-fix-adlc-flags.patch} (55%)
>  rename recipes-core/openjdk/patches-openjdk-8/{openjdk8-fix-shark-build-common.patch => 1011-hotspot-fix-shark-build-common.patch} (65%)
>  create mode 100644 recipes-core/openjdk/patches-openjdk-8/1012-hotspot-restrict-to-staging-dir.patch
>  rename recipes-core/openjdk/patches-openjdk-8/{0001-jdk-comparison-between-pointer-and-integer.patch => 2001-jdk-comparison-between-pointer-and-integer.patch} (86%)
>  rename recipes-core/openjdk/patches-openjdk-8/{0003-jdk-Allow-using-a-system-installed-libjpeg.patch => 2002-jdk-Allow-using-a-system-installed-libjpeg.patch} (77%)
>  create mode 100644 recipes-core/openjdk/patches-openjdk-8/2003-jdk-Allow-using-a-system-installed-libpng.patch
>  rename recipes-core/openjdk/patches-openjdk-8/{0007-jdk-use-correct-include-for-poll.patch => 2004-jdk-use-correct-include-for-poll.patch} (81%)
>  rename recipes-core/openjdk/patches-openjdk-8/{0008-jdk-use-correct-include-for-signal.patch => 2005-jdk-use-correct-include-for-signal.patch} (83%)
>  rename recipes-core/openjdk/patches-openjdk-8/{0009-jdk-disable-backtrace-musl-build-fix.patch => 2006-jdk-disable-backtrace-musl-build-fix.patch} (75%)
>  create mode 100644 recipes-core/openjdk/patches-openjdk-8/2007-jdk-no-genx11-in-headless.patch
>  rename recipes-core/openjdk/patches-openjdk-8/{openjdk8-no-unused-deps.patch => 2008-jdk-no-unused-deps.patch} (58%)
>  create mode 100644 recipes-core/openjdk/patches-openjdk-8/2009-jdk-use-gcc-instead-of-ld-to-link-genSocketOptionRegistry.patch
>  rename recipes-core/openjdk/patches-openjdk-8/{0001-hotspot-aarch32-fix-missing-return-values.patch => aarch32-hotspot-fix-missing-return-values.patch} (100%)
>  rename recipes-core/openjdk/patches-openjdk-8/{openjdk8-fix-shark-build-pt2-aarch32.patch => aarch32-hotspot-fix-shark-build-pt2.patch} (100%)
>  rename recipes-core/openjdk/patches-openjdk-8/{hotspot-remaining-musl-fixes-aarch32.patch => aarch32-hotspot-remaining-musl-fixes.patch} (100%)
>  rename recipes-core/openjdk/patches-openjdk-8/{0013-hotspot-aarch64-Fix-further-functions-with-a-missing.patch => aarch64-hotspot-Fix-further-functions-with-a-missing.patch} (100%)
>  rename recipes-core/openjdk/patches-openjdk-8/{hotspot-remaining-musl-fixes-aarch64.patch => aarch64-hotspot-remaining-musl-fixes.patch} (100%)
>  delete mode 100644 recipes-core/openjdk/patches-openjdk-8/filter-aclocal-copy-too.patch
>  delete mode 100644 recipes-core/openjdk/patches-openjdk-8/hotspot-handle-gcc7-format-overflow.patch
>  delete mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-add-missing-linker-flags.patch
>  delete mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-find-compiler-fix-env-respect.patch
>  delete mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-assembler-flag-handling-in-makefile.patch
>  delete mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-libpng-neon-build.patch
>  delete mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-shark-stdc++11.patch
>  delete mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-no-genx11-in-headless.patch
>  delete mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-restrict-to-staging-dir.patch
> 
> -- 
> 2.24.1
> 

