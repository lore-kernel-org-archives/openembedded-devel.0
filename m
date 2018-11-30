Return-Path: <attie.grande@argentum-systems.co.uk>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 481E86D6EA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2018 13:10:29 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id f4so4777186edq.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2018 05:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=argentum-systems-co-uk.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=qEl1z30GNIbsJ/9vb5Uv/d7c58LQ/XYIfrhkvsRs4O4=;
	b=ISSXZ0muZ3Vptdg8BEuYVNkWUgQRvWPK93pu01PKomEhzF/lAijQtkQC8T1I5r5Sxv
	1GjDgYu6C+xLFGBGF0yDukXe4nf0MVLmTlwu7dPoyljnH481vaqSLQ5FsjcfaZUHbfH2
	CBT5NiabdLcIAcn8OLGMlP9GREAVXwQazNgPDpagMkSJR9CR11aORm+6Gd33AApBPqzf
	MGfcxhekT5IounDPide1NCCcidbYNfS78A+NlDbf4D8zCvhJpwiyiZOgmUbVxy/KXOpL
	uzEYnvLz1nSKhG7cPiylEFyl7LTbQxI46iqFxsUZoXU0LhJBiKQcafZgu/zAanJBu3rS
	uz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=qEl1z30GNIbsJ/9vb5Uv/d7c58LQ/XYIfrhkvsRs4O4=;
	b=e+UfRuvC0BSBm0IWldRL8tPlXYhDL2J4Nw881Yo9+tQfs+Wgu5z32i0p9H6Mtroz/U
	LjQVy+mFYOkB6FTQlhLKp5blWBeYGCkQrYS4uY/dXXi9XKXc+26ILWtnxImSiN4O/nDJ
	X2PrWnFH2rObxOjgWprjIbM6GHB274k+lGuZODgyA2yzuyuxG/MDySuww3NPzNKg/Fxf
	Qhk2RQ1ZyYPyz6fwol2X7KhW16FqyTfxTQPjduuuoWK6KKqvcPNG0Y3j4qprzTz/IOOz
	urEoNBBX9jpNnuericzkwoUhT1CM+OkcNTFliadzWzn+w749wT/gpO3DLYds/nk84jij
	X+Og==
X-Gm-Message-State: AA+aEWZv3SM76cLxSfRZV35t0BdRmmM74TyLNFyV/Ld6dNBvlF+yUYU+
	K8AYxmIKkLri2LOedDNLxGve03vitS02+w+vNRqa9ro5SCY=
X-Google-Smtp-Source: AFSGD/XtYZHXPUXmSxRRW3fv/+EIbcnIMhbbtK1G+P0MAkZE1/WIbs31xVh7epsWrQazBrKwtXW8d82Rm07Q64g+m/I=
X-Received: by 2002:a50:afa3:: with SMTP id h32mr5201079edd.150.1543583429599; 
	Fri, 30 Nov 2018 05:10:29 -0800 (PST)
MIME-Version: 1.0
From: Attie Grande <attie.grande@argentum-systems.co.uk>
Date: Fri, 30 Nov 2018 13:10:19 +0000
Message-ID: <CAAsqSTdeaUH5u4-Tjb-Z=pSXBVGftNGV6FX7VqCB7RZMZQyn1A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-java][PATCH 1/2] openjdk-8: undefined behaviour in src/os_cpu/linux_zero/vm/os_linux_zero.cpp
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
X-List-Received-Date: Fri, 30 Nov 2018 13:10:29 -0000
Content-Type: text/plain; charset="UTF-8"

Fixes potential UB that can be exposed by newer GCC versions.

The original patch (below) has been modified to work with jdk8.

Further information:
  https://bugs.openjdk.java.net/browse/JDK-8202600
  http://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/ca4663e58916

Signed-off-by: Attie Grande <attie.grande@argentum-systems.co.uk>
---
 recipes-core/openjdk/openjdk-8-release-16xbyy.inc              |  1 +
 .../JDK-8202600-undefined-behaviour-in-os_linux_zero.cpp.patch | 10 ++++++++++
 2 files changed, 11 insertions(+)
 create mode 100644
recipes-core/openjdk/patches-openjdk-8/JDK-8202600-undefined-behaviour-in-os_linux_zero.cpp.patch

diff --git a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
index bd4a349..23c99fe 100644
--- a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
+++ b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
@@ -16,6 +16,7 @@ PATCHES_URI = "\
     file://0008-jdk-use-correct-include-for-signal.patch \
     file://0009-jdk-disable-backtrace-musl-build-fix.patch \
     file://0010-build-fix-build-on-as-needed-toolchains-generic.patch \
+    file://JDK-8202600-undefined-behaviour-in-os_linux_zero.cpp.patch \
 "
 # some patches extracted from
http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.patch
 # reported via
http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
diff --git a/recipes-core/openjdk/patches-openjdk-8/JDK-8202600-undefined-behaviour-in-os_linux_zero.cpp.patch
b/recipes-core/openjdk/patches-openjdk-8/JDK-8202600-undefined-behaviour-in-os_linux_zero.cpp.patch
new file mode 100644
index 0000000..f01fea3
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/JDK-8202600-undefined-behaviour-in-os_linux_zero.cpp.patch
@@ -0,0 +1,10 @@
+--- a/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp Tue Apr 14
11:40:13 2015 +0200
++++ b/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp Thu May 03
18:59:48 2018 +0200
+@@ -408,6 +408,7 @@
+
+ extern "C" {
+   int SpinPause() {
++    return 0; // Shouldn't matter.
+   }
+
+
-- 
2.7.4

