Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10229.1795752922283783743
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:15:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0JyyaTQY;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-386cf1041cdso4400145eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752922; x=1796357722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/GHgwaWoWvXDmJzj9PZKlhjtkrj5muWZGDZqZUo3jo4=;
        b=0JyyaTQY3aoMiJHV0ZT7/rzaDOLaY5NP0Bdxa0v5mT+vQ5rP028d6Lb0xR0cNeafPf
         HNtSguX0UPGEA75f6V0/t9oEilBTiP6xU+o7VXm/UC12kRg3GUOhKwerpgklg9NDfqj0
         OClvbqU+Vd3gKwgRJebG1aIclIGkkjVyXZoi6PWcjPbGhPd05rrEVJN9WTW9h9G5HCmf
         07/y96rK8GGeb6qB0f8/VEfzpwMDx8riB5Assmvc0dfb/DrO/g+Yz43mBa3D1L8WjU3r
         kd6LVS0LQFPvIVTHdLqdG7PiOsgq+ClLjh08Sa2AxK5Xu2uWR/0BLZc8jpRPPJxRIQ+P
         9n+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752922; x=1796357722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/GHgwaWoWvXDmJzj9PZKlhjtkrj5muWZGDZqZUo3jo4=;
        b=qIbG4cjvPH1TH+cB5W/yBUllQgnWokUVSox+bvwLvlYoBn99KrOZuq7PBt/ha5Mcg7
         UvDsNcfSz0DkZTyCQ5WrPqkB4uyJyjk0xuRd9nOoIG1eRYVWt9SY7P4Kn6Wsn+PIXcDX
         BjUhgwj/0fMl5Xf94Gv71ivW/BYqPgqPwJ3bD2W3O1JkfEfT5KMcu8u3u8F416Vtb1qF
         9GojpVxLc3gCEiZQTI8sn4aPZgfqQeMLbefNPsDBni9F8XRBQHJulFvx2sh0WXj5HCM7
         aYBcwGe4J0BJzwQ83ZPiBzPvOFUiovT1CFQgdHzhqBharyZGgsgS3qFHZdDEjHo/aeYl
         RH0w==
X-Gm-Message-State: APuU4Z9UJQq4RpbW7WIZcFnCf9rhizhibO+fK9B4x8tmcmPwUqQs6KmD
	a48WEbV0fkYYL38z2RQjrLbxvr4kcnVr5RNPq3d1rwYQ+2zH2i5ihR+VQ6FYn1ei
X-Gm-Gg: AZFdTZcipv97ReTWbIQFBX5WwnrnI6d83q/qlxCd5/sHiEVZ6N5ZdJwj6VJ0OFrw3Di
	vvdvi4zyJG2DcDWOEuy7JDiKuiQt5d+4H2xzuMatBogJYNbEQLpeDklh7e74cMlYMsFwzW0PAbq
	Vy1GPwHLwJ1a6+Yd3JUj8tVTGgadT9KuKFPzE2FcOt2mSNYLMxDehKvl5aKpElZjLmLMFX4dcet
	CCpmGY7iAjoV1VEB8sRgJ4l9AG1xeZyZk4JvWgJ9IuGok8STda6utHRfyOqmA8BYnsPFIxur5+O
	Pp/DdaaaGgYD4OSC97CwrZwkahtYxROy8vv0RzEZOtf8OghRk8otGmg9o6owMJZB4z8+p/ys2Oq
	v++2sm9vJVKt2uOmxTlloZFOMj+z4vTvlDFtQYDFAi+/u1xF7SoEOXv3VH2eP3+oZ0YYsBEtxDt
	5/wGDyhmuwjA4UMo+rG0hVQbUcKUPnudHGLVKSmjjo7FCRcrlTFHoY6Mus2cfEVKEfgFKUQVNh3
	S7zCnIxQr2evRvF8txV6yoycsoKJvcv7ppXuEtK2QVtT5tBP6wQ5bzHDhgJVMDLqrHXyEIFnCl8
	pf5MmN8hu1KLB2TrmqSVu3tR3hnvnNuTwNbRVZHq2iNjeP7Y6JoYhzb8zVYAzJL5+R9yaxY/4MB
	r2qOvq7yw/91HJNo1VhLFP6dHe4rJgnWLRKlRXG8eWr5wArpBhL7rf9Cnxk7C2i2E2+waSYHnOG
	TSGKmcnuFUkBlXTcxC91p+FqqtB3aANBkejlj6V5oNVN/fJCxJGo7exmchZQdKlfSGIm3hKuZVc
	XnIvR3AI1hxBMkEUpxwBCD458ts8c1rc+QL3myHFD9V2CSl8u35Z9Ps8EHgFZNDoKiFL0giWTfG
	MuIO
X-Received: by 2002:a05:7301:714:b0:379:730d:db52 with SMTP id 5a478bee46e88-3857045098amr21591475eec.32.1795752921456;
        Thu, 26 Nov 2026 20:15:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm60340062eec.8.2026.11.26.20.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:15:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 0/8] Major upgrades: opencv 5, mongodb 7, influxdb3 and more
Date: Thu, 26 Nov 2026 20:15:09 -0800
Message-ID: <20261127041517.1773986-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133210
Content-Type: text/plain; charset="utf-8"

- opencv 4.14.0 -> 5.1.0, with a new opencv4 recipe for users that need
  the 4.x API. Layers that use OpenCV 4 through the opencv recipe need
  to move to opencv4: meta-tegra (opencv_4.14.%.bbappend), meta-qcom
  (camxlib, gst-plugins-imsdk) and meta-freescale (imx-gpu-sdk).
- suitesparse 5.10.1 -> 7.14.1; python3-cvxopt in the meta-python series
  is adapted to the new header layout.
- mongodb 4.4.30 -> 7.0.48 (4.4 is EOL; 7.0 is the last SCons series),
  64-bit only. Needs python3-pymongo-native, sent separately first.
- influxdb3: new recipe for InfluxDB 3 Core, the Rust rewrite. influxdb
  stays on 1.x because 3.x is a different product (no TSM migration,
  new CLI and port); newer 1.x releases need the Rust Flux library.
  It needs "sqlite3: Enable unlock-notify for native builds" in
  openembedded-core.
- minifi-cpp 0.99.2 -> 1.1.0 and sysdig 0.39.0 -> 0.41.4.

Built for qemux86-64 (glibc; mongodb also with musl).

Khem Raj (8):
  opencv: upgrade 4.14.0 -> 5.1.0
  opencv4: Add recipe
  suitesparse: upgrade 5.10.1 -> 7.14.1
  mongodb: upgrade 4.4.30 -> 7.0.48
  poco: Sync MongoDB architecture exclusions with mongodb
  influxdb3: Add recipe
  minifi-cpp: upgrade 0.99.2 -> 1.1.0
  sysdig: upgrade 0.39.0 -> 0.41.4

 .../mongodb/0001-Fix-build-on-32bit.patch     |   38 -
 ...0001-Fix-compilation-with-fno-common.patch |  448 ------
 ...01-Fix-type-mismatch-on-32bit-arches.patch |   33 -
 ...hLib20U1-Check-for-__DEFINED_wchar_t.patch |   37 -
 ...rror_r-implementation-glibc-specific.patch |   31 -
 ...ct-the-CPU-selected-by-the-compiler-.patch |   48 +
 ...goDB-fails-to-compile-with-Clang-15-.patch |  133 ++
 ...9426-fix-build-issues-under-clang-15.patch |  275 ++++
 ...upport-deprecated-resolver-functions.patch |   15 +-
 ...e-build-settings-from-environment-va.patch |   57 -
 ...y-binary_function-base-classes-are-d.patch |   25 +-
 ...-control-use-of-gnu_get_libc_version.patch |   15 +-
 ...001-Use-long-long-instead-of-int64_t.patch |   69 -
 ...stead-of-pkg_resources-for-version-p.patch |   20 +-
 ...ic_cast-size_t-to-maxMemoryUsageByte.patch |   38 -
 ...1-apply-msvc-workaround-for-clang-16.patch |   15 +-
 ...sio-Dont-use-experimental-with-clang.patch |   31 -
 ...se-shutil.which-instead-of-distutils.patch |   40 +
 .../0001-include-needed-c-header.patch        |   29 -
 ...econfig.py-python-3.12-compatibility.patch |    9 +-
 ...just-the-cache-alignment-assumptions.patch |   37 -
 ...-stacktrace-Define-ARCH_BITS-for-x86.patch |   29 -
 .../0001-wiredtiger-Avoid-using-off64_t.patch |    9 +-
 ...ion-for-the-macro-__ELF_NATIVE_CLASS.patch |   38 -
 .../0002-Fix-default-stack-size-to-256K.patch |   11 +-
 ...call-to-CheckLibWithHeader-as-a-keyw.patch |   56 -
 .../mongodb/0003-Fix-unknown-prefix-env.patch |   21 -
 .../0003-boost-Fix-build-with-clang-23.patch  |   43 +-
 .../0004-ssl-Fix-build-with-OpenSSL-4.patch   |   74 +-
 ...4-wiredtiger-Disable-strtouq-on-musl.patch |    9 +-
 ...ove-the-Node-swap-function-in-Biggie.patch |   58 -
 ...-constructors-to-RowEq-and-RowHasher.patch |   46 +
 ...0006-pcre-Fix-build-with-PCRE2-10.49.patch |   36 +
 ...0007-SConstruct-Honor-js-engine-none.patch |   37 +
 ...inux-prctl.h-together-with-sys-prctl.patch |   33 +
 ...ff_t-instead-of-off64_t-for-the-offs.patch |   51 +
 .../recipes-dbs/mongodb/mongodb/1296.patch    |   57 -
 .../mongodb/mongodb/arm64-support.patch       |   56 -
 .../mongodb/disable_runtime_check.patch       |   19 +-
 .../mongodb/mongodb/ppc64_ARCH_BITS.patch     |   22 +-
 .../{mongodb_git.bb => mongodb_7.0.48.bb}     |  121 +-
 meta-oe/files/static-group-meta-oe            |    1 +
 meta-oe/files/static-passwd-meta-oe           |    1 +
 .../packagegroups/packagegroup-meta-oe.bb     |    3 +
 .../influxdb3/influxdb3-crates.inc            | 1430 +++++++++++++++++
 ...001-Use-pre-fetched-git-dependencies.patch |  355 ++++
 ...low-using-pre-downloaded-UDF-artifac.patch |   63 +
 .../influxdb3/influxdb3/influxdb3.conf        |   20 +
 .../influxdb3/influxdb3/influxdb3.init        |  107 ++
 .../influxdb3/influxdb3/influxdb3.service     |   26 +
 .../recipes-dbs/influxdb3/influxdb3_3.12.3.bb |  116 ++
 ...XXFLAGS-from-environment-in-Mongoose.patch |   45 -
 ...serve-links-when-installing-libmetis.patch |   24 -
 ...-Add-version-information-to-libmetis.patch |   51 -
 .../0004-Allow-build-with-CMake-4.patch       |   86 -
 ...dd-install-rpath-to-shared-libraries.patch |   37 -
 .../suitesparse/makefile-quoting.patch        |   32 -
 .../suitesparse/suitesparse_5.10.1.bb         |   69 -
 .../suitesparse/suitesparse_7.14.1.bb         |   48 +
 ...-Add-missing-include-for-malloc-free.patch |   38 -
 .../0001-Do-not-use-bundled-packages.patch    |  330 ++--
 .../files/0001-Fix-build-with-gcc-16.patch    |   49 -
 ...sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch |   17 +-
 .../files/0002-Fix-osspuuid-build.patch       |   22 +-
 .../files/0003-Fix-libsodium-build.patch      |   13 +-
 .../files/0004-Pass-noline-flag-to-flex.patch |   21 +-
 ...erateVersion.sh-set-correct-buildrev.patch |   13 +-
 ...006-CMakeLists.txt-do-not-use-ccache.patch |   31 +-
 ...h-add-missing-cstdint-include-for-in.patch |   35 -
 ...nifi-cpp_0.99.2.bb => minifi-cpp_1.1.0.bb} |  112 +-
 ...e-container-plugin-download-optional.patch |   33 +
 ...001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch |   32 -
 .../{sysdig_0.39.0.bb => sysdig_0.41.4.bb}    |   41 +-
 .../opencv/opencv/0001-Dont-use-isystem.patch |    8 +-
 ...-around-deprecated-ffmpeg-RAW-functi.patch |   33 -
 .../0003-To-fix-errors-as-following.patch     |    3 +-
 .../0001-Dont-use-isystem.patch               |    0
 .../0001-Make-ts-module-external.patch        |   43 +
 .../0001-Use-Os-to-compile-tinyxml2.cpp.patch |   31 +
 .../0003-To-fix-errors-as-following.patch     |    4 +-
 ...ot-embed-build-directory-in-binaries.patch |  139 ++
 .../opencv/{opencv => opencv4}/29533.patch    |    6 +-
 .../opencv/opencv4/download.patch             |   41 +
 .../{opencv_4.14.0.bb => opencv4_4.14.0.bb}   |  192 +--
 .../{opencv_4.14.0.bb => opencv_5.1.0.bb}     |   49 +-
 meta-oe/recipes-support/poco/poco_1.15.4.bb   |    5 +
 86 files changed, 3738 insertions(+), 2386 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-build-on-32bit.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-compilation-with-fno-common.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-type-mismatch-on-32bit-arches.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-SConstruct-Respect-the-CPU-selected-by-the-compiler-.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-SERVER-77007-MongoDB-fails-to-compile-with-Clang-15-.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-SERVER-79426-fix-build-issues-under-clang-15.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-add-explict-static_cast-size_t-to-maxMemoryUsageByte.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-distsrc-Use-shutil.which-instead-of-distutils.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-include-needed-c-header.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-server-Adjust-the-cache-alignment-assumptions.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-stacktrace-Define-ARCH_BITS-for-x86.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-SConstruct-Pass-call-to-CheckLibWithHeader-as-a-keyw.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0005-sbe-Add-default-constructors-to-RowEq-and-RowHasher.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0006-pcre-Fix-build-with-PCRE2-10.49.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0007-SConstruct-Honor-js-engine-none.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0008-Do-not-include-linux-prctl.h-together-with-sys-prctl.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0009-DirectMmap-Use-off_t-instead-of-off64_t-for-the-offs.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/1296.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/arm64-support.patch
 rename meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/{mongodb_git.bb => mongodb_7.0.48.bb} (55%)
 create mode 100644 meta-oe/recipes-dbs/influxdb3/influxdb3-crates.inc
 create mode 100644 meta-oe/recipes-dbs/influxdb3/influxdb3/0001-Use-pre-fetched-git-dependencies.patch
 create mode 100644 meta-oe/recipes-dbs/influxdb3/influxdb3/0002-iox_query_udf-Allow-using-pre-downloaded-UDF-artifac.patch
 create mode 100644 meta-oe/recipes-dbs/influxdb3/influxdb3/influxdb3.conf
 create mode 100644 meta-oe/recipes-dbs/influxdb3/influxdb3/influxdb3.init
 create mode 100644 meta-oe/recipes-dbs/influxdb3/influxdb3/influxdb3.service
 create mode 100644 meta-oe/recipes-dbs/influxdb3/influxdb3_3.12.3.bb
 delete mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch
 delete mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/0002-Preserve-links-when-installing-libmetis.patch
 delete mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/0003-Add-version-information-to-libmetis.patch
 delete mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/0004-Allow-build-with-CMake-4.patch
 delete mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/0005-Do-not-add-install-rpath-to-shared-libraries.patch
 delete mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/makefile-quoting.patch
 delete mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
 create mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse_7.14.1.bb
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Add-missing-include-for-malloc-free.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-with-gcc-16.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0007-StreamCallback.h-add-missing-cstdint-include-for-in.patch
 rename meta-oe/recipes-extended/minifi-cpp/{minifi-cpp_0.99.2.bb => minifi-cpp_1.1.0.bb} (77%)
 create mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Make-the-container-plugin-download-optional.patch
 delete mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch
 rename meta-oe/recipes-extended/sysdig/{sysdig_0.39.0.bb => sysdig_0.41.4.bb} (72%)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch
 copy meta-oe/recipes-support/opencv/{opencv => opencv4}/0001-Dont-use-isystem.patch (100%)
 create mode 100644 meta-oe/recipes-support/opencv/opencv4/0001-Make-ts-module-external.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv4/0001-Use-Os-to-compile-tinyxml2.cpp.patch
 copy meta-oe/recipes-support/opencv/{opencv => opencv4}/0003-To-fix-errors-as-following.patch (93%)
 create mode 100644 meta-oe/recipes-support/opencv/opencv4/0008-Do-not-embed-build-directory-in-binaries.patch
 rename meta-oe/recipes-support/opencv/{opencv => opencv4}/29533.patch (97%)
 create mode 100644 meta-oe/recipes-support/opencv/opencv4/download.patch
 copy meta-oe/recipes-support/opencv/{opencv_4.14.0.bb => opencv4_4.14.0.bb} (51%)
 rename meta-oe/recipes-support/opencv/{opencv_4.14.0.bb => opencv_5.1.0.bb} (88%)

