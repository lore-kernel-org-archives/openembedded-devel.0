Return-Path: <vinay.k.awasthi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 78D3476599
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 01:31:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 06 Aug 2015 18:31:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,626,1432623600"; 
	d="scan'208,217,223";a="620868433"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
	by orsmga003.jf.intel.com with ESMTP; 06 Aug 2015 18:31:20 -0700
Received: from orsmsx113.amr.corp.intel.com (10.22.240.9) by
	ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Thu, 6 Aug 2015 18:31:19 -0700
Received: from fmsmsx154.amr.corp.intel.com (10.18.116.70) by
	ORSMSX113.amr.corp.intel.com (10.22.240.9) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Thu, 6 Aug 2015 18:31:19 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.23]) by
	FMSMSX154.amr.corp.intel.com ([169.254.6.240]) with mapi id
	14.03.0224.002; Thu, 6 Aug 2015 18:31:18 -0700
From: "Awasthi, Vinay K" <vinay.k.awasthi@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java]
	[Enabling-Openjdk-8-for-x86-hotspot-vm-and-arm-zero-vm]
Thread-Index: AdDQsGiUss3Pial5TT+KIVvoue68xg==
Date: Fri, 7 Aug 2015 01:31:18 +0000
Message-ID: <B399646F8CA055479BEC55F6B065A04A3703F105@FMSMSX108.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.106]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "'mario@ossystems.com.br'" <mario@ossystems.com.br>,
	"'otavio@ossystems.com.br'" <otavio@ossystems.com.br>
Subject: [meta-java] [Enabling-Openjdk-8-for-x86-hotspot-vm-and-arm-zero-vm]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Aug 2015 01:31:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From 013eaa9d5083b7e5dd7613221d70c213ceab5e56 Mon Sep 17 00:00:00 2001
From: "Vinay K. Awasthi" <vinay.k.awasthi@intel.com>
Date: Thu, 6 Aug 2015 18:08:57 -0700
Subject: [meta-java][PATCH] Enabling Openjdk-8 for x86(hotspot vm) and
arm(zero vm)

This patch modifies existing setup so that we can build and install
openjdk-8 for x86 and arm instruction set.

For x86:

This patch enabled hotspot vm. This patch also has comments on how
to enabled compact profiles one, two and three. Installing these compact
profiles is also illustrated by comments.

For ARM:

This patch enables zero VM for arm. It is tested on openembedded-core. This
patch compiles are components for arm including NASHORN (java script over j=
ava)

OpenJDK release version is set to 8u40b27 (currently released version).

Signed-off-by: Vinay K Awasthi <vinay.k.awasthi@intel.com>
Signed-off-by: Vinay K. Awasthi <vinay.k.awasthi@intel.com>
---
.../openjdk-8-8u40b27/cacao-arm-ucontext.patch     |  24 +
.../openjdk-8-8u40b27/cacao-libtoolize.patch       |  12 +
.../openjdk-8-8u40b27/cacao-loadavg-makefile.patch |  13 +
.../openjdk/openjdk-8-8u40b27/cacao-loadavg.patch  |  27 ++
.../openjdk-8-8u40b27/faulty-nx-emulation.patch    |  12 +
.../openjdk/openjdk-8-8u40b27/fix-checksums.patch  |  61 +++
recipes-core/openjdk/openjdk-8-8u40b27/jvm.cfg     |  43 ++
.../openjdk/openjdk-8-8u40b27/zero-build.patch     |  14 +
recipes-core/openjdk/openjdk-8-common.inc          | 507 ++++++++++++++++++=
+++
recipes-core/openjdk/openjdk-8-release-8u40b27.inc |  73 +++
recipes-core/openjdk/openjdk-8_8u40b27-2.5.4.bb    |  44 ++
11 files changed, 830 insertions(+)
create mode 100644 recipes-core/openjdk/openjdk-8-8u40b27/cacao-arm-ucontex=
t.patch
create mode 100644 recipes-core/openjdk/openjdk-8-8u40b27/cacao-libtoolize.=
patch
create mode 100644 recipes-core/openjdk/openjdk-8-8u40b27/cacao-loadavg-mak=
efile.patch
create mode 100644 recipes-core/openjdk/openjdk-8-8u40b27/cacao-loadavg.pat=
ch
create mode 100644 recipes-core/openjdk/openjdk-8-8u40b27/faulty-nx-emulati=
on.patch
create mode 100644 recipes-core/openjdk/openjdk-8-8u40b27/fix-checksums.pat=
ch
create mode 100644 recipes-core/openjdk/openjdk-8-8u40b27/jvm.cfg
create mode 100644 recipes-core/openjdk/openjdk-8-8u40b27/zero-build.patch
create mode 100644 recipes-core/openjdk/openjdk-8-common.inc
create mode 100644 recipes-core/openjdk/openjdk-8-release-8u40b27.inc
create mode 100644 recipes-core/openjdk/openjdk-8_8u40b27-2.5.4.bb

diff --git a/recipes-core/openjdk/openjdk-8-8u40b27/cacao-arm-ucontext.patc=
h b/recipes-core/openjdk/openjdk-8-8u40b27/cacao-arm-ucontext.patch
new file mode 100644
index 0000000..c21fcf1
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-8u40b27/cacao-arm-ucontext.patch
@@ -0,0 +1,24 @@
+Index: cacao-a567bcb7f589/src/vm/jit/arm/linux/md-os.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- cacao-a567bcb7f589/src/vm/jit/arm/linux/md-os.c   2013-01-26 21:30:54.=
206581090 +0100
++++ cacao-a567bcb7f589/src/vm/jit/arm/linux/md-os.c   2013-01-26 21:31:34.=
406991316 +0100
+@@ -28,19 +28,7 @@
+
+ #include <stdint.h>
+
+-#define ucontext broken_glibc_ucontext
+-#define ucontext_t broken_glibc_ucontext_t
+ #include <ucontext.h>
+-#undef ucontext
+-#undef ucontext_t
+-
+-typedef struct ucontext {
+-   unsigned long     uc_flags;
+-   struct ucontext  *uc_link;
+-   stack_t           uc_stack;
+-   struct sigcontext uc_mcontext;
+-   sigset_t          uc_sigmask;
+-} ucontext_t;
+
+ #define scontext_t struct sigcontext
+
diff --git a/recipes-core/openjdk/openjdk-8-8u40b27/cacao-libtoolize.patch =
b/recipes-core/openjdk/openjdk-8-8u40b27/cacao-libtoolize.patch
new file mode 100644
index 0000000..484cb10
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-8u40b27/cacao-libtoolize.patch
@@ -0,0 +1,12 @@
+Index: icedtea6/Makefile.am
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- icedtea6.orig/Makefile.am   2011-12-21 22:58:23.000000000 +0100
++++ icedtea6/Makefile.am  2011-12-21 23:00:21.405887186 +0100
+@@ -1922,6 +1922,7 @@
+ if BUILD_CACAO
+ if !USE_SYSTEM_CACAO
+    cd cacao/cacao && \
++   rm -f libtool && \
+    ./autogen.sh && \
+    $(ARCH_PREFIX) ./configure \
+      --host=3D$(host_alias) \
diff --git a/recipes-core/openjdk/openjdk-8-8u40b27/cacao-loadavg-makefile.=
patch b/recipes-core/openjdk/openjdk-8-8u40b27/cacao-loadavg-makefile.patch
new file mode 100644
index 0000000..a389206
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-8u40b27/cacao-loadavg-makefile.patch
@@ -0,0 +1,13 @@
+Index: icedtea-2.1.4/Makefile.am
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- icedtea-2.1.4.orig/Makefile.am   2013-01-26 18:20:55.152561203 +0100
++++ icedtea-2.1.4/Makefile.am   2013-01-26 18:41:07.637992206 +0100
+@@ -1994,6 +1994,8 @@
+ if BUILD_CACAO
+ if !USE_SYSTEM_CACAO
+    cd cacao/cacao && \
++   patch -p1 -N < $(abs_top_srcdir)/patches/cacao-loadavg.patch && \
++   patch -p1 -N < $(abs_top_srcdir)/patches/cacao-arm-ucontext.patch && \
+    rm -f libtool && \
+    ./autogen.sh && \
+    $(ARCH_PREFIX) ./configure \
diff --git a/recipes-core/openjdk/openjdk-8-8u40b27/cacao-loadavg.patch b/r=
ecipes-core/openjdk/openjdk-8-8u40b27/cacao-loadavg.patch
new file mode 100644
index 0000000..0fc1a81
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-8u40b27/cacao-loadavg.patch
@@ -0,0 +1,27 @@
+Index: cacao-cff92704c4e0/src/vm/os.hpp
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- cacao-cff92704c4e0/src/vm/os.hpp 2011-12-08 13:40:45.000000000 +0100
++++ cacao-cff92704c4e0/src/vm/os.hpp 2011-12-20 11:42:36.985633921 +0100
+@@ -425,7 +425,21 @@
+ #if defined(HAVE_GETLOADAVG)
+    return ::getloadavg(loadavg, nelem);
+ #else
+-# error getloadavg not available
++        FILE *LOADAVG;
++        double avg[3] =3D { 0.0, 0.0, 0.0 };
++        int i, res =3D -1;;
++
++        if ((LOADAVG =3D fopen("/proc/loadavg", "r"))) {
++                fscanf(LOADAVG, "%lf %lf %lf", &avg[0], &avg[1], &avg[2])=
;
++                res =3D 0;
++                fclose(LOADAVG);
++        }
++
++        for (i =3D 0; (i < nelem) && (i < 3); i++) {
++                loadavg[i] =3D avg[i];
++        }
++
++        return res;
+ #endif
+ }
+
diff --git a/recipes-core/openjdk/openjdk-8-8u40b27/faulty-nx-emulation.pat=
ch b/recipes-core/openjdk/openjdk-8-8u40b27/faulty-nx-emulation.patch
new file mode 100644
index 0000000..4d65917
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-8u40b27/faulty-nx-emulation.patch
@@ -0,0 +1,12 @@
+--- hotspot/src/os/linux/vm/os_linux.cpp   2015-03-07 10:25:19.000000000 -=
0800
++++ hotspot/src/os/linux/vm/os_linux.cpp   2015-03-07 10:25:19.000000000 -=
0800
++++ a.cpp 2015-07-23 11:45:17.666243540 -0700
+@@ -4847,7 +4847,7 @@
+   Linux::capture_initial_stack(JavaThread::stack_size_at_create());
+
+ #if defined(IA32)
+-  workaround_expand_exec_shield_cs_limit();
++//  workaround_expand_exec_shield_cs_limit();
+ #endif
+
+   Linux::libpthread_init();
diff --git a/recipes-core/openjdk/openjdk-8-8u40b27/fix-checksums.patch b/r=
ecipes-core/openjdk/openjdk-8-8u40b27/fix-checksums.patch
new file mode 100644
index 0000000..e281c46
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-8u40b27/fix-checksums.patch
@@ -0,0 +1,61 @@
+--- icedtea-2.5.4/Makefile.am   2015-04-02 10:48:12.919550836 +0200
++++ icedtea-2.5.4/Makefile.am   2015-04-02 10:49:41.483806147 +0200
+@@ -4,19 +4,19 @@
+ BUILD_VERSION =3D b13
+ COMBINED_VERSION =3D $(JDK_UPDATE_VERSION)-$(BUILD_VERSION)
+
+-CORBA_CHANGESET =3D 3c9f523bf96e
+-JAXP_CHANGESET =3D ca26767d3375
+-JAXWS_CHANGESET =3D 9a6c90336922
+-JDK_CHANGESET =3D 1e6db4f8b0f3
+-LANGTOOLS_CHANGESET =3D 960cdffa8b3f
+-OPENJDK_CHANGESET =3D 6cf2880aab5e
+-
+-CORBA_SHA256SUM =3D 7411fe2df795981124ae2e4da0ddb7d98db0a94c9399a12876be0=
3e7177eaa0b
+-JAXP_SHA256SUM =3D 84623e50b69710d12209fc761a49953c78f1a664ff54e022a77e35=
e25489f2f3
+-JAXWS_SHA256SUM =3D 4bd38a8121d85c422b425177ce648afdee9da18812c91c5b74939=
c58db33ab4b
+-JDK_SHA256SUM =3D e99b65baf66d8818e3c8fd31d71fbad4ad0ceb0b7fa4c2e0607eca3=
a40f2ba09
+-LANGTOOLS_SHA256SUM =3D 4fd76cbdf18174128863514b4d3997cb623368697bf4f5af6=
d079dbbcd7b378a
+-OPENJDK_SHA256SUM =3D 88c92a3cab37446352086876771733229b1602d4f79ef68629a=
151180652e1f1
++CORBA_CHANGESET =3D bd0186cd2419
++JAXP_CHANGESET =3D 56f6ca79467d
++JAXWS_CHANGESET =3D a5f2cdedb940
++JDK_CHANGESET =3D d4453d784fb6
++LANGTOOLS_CHANGESET =3D 83eca922346e
++OPENJDK_CHANGESET =3D 12deacac8257
++
++CORBA_SHA256SUM =3D 870888241bfe3718e1de10e6de5ae70d5f7131752bb3c1657b020=
c8fb7af6049
++JAXP_SHA256SUM =3D 254c622fc8a572efd0a10908b4038ba3cf41775d7c09c8f576800b=
3f608e33f7
++JAXWS_SHA256SUM =3D c7882fa363960b511a08038130a45477fb8d5e82f3d6244248e61=
e564f3c84a3
++JDK_SHA256SUM =3D b02b46c4b52ca06cf0b42cd7daadc7dbee6403e83f7bc951e28d0c7=
e6d23c3cd
++LANGTOOLS_SHA256SUM =3D e46e8322d189dbdf631c1b2796b8ca628f2f83b2f05f0ede7=
4bcbc118201aa16
++OPENJDK_SHA256SUM =3D 6f54575843bf258fdbef4a23d76f3c4b0ada685b42df0f7f5da=
2e6112113ad10
+
+ DROP_URL =3D http://icedtea.classpath.org/download/drops
+
+@@ -35,6 +35,7 @@
+ ICEDTEA_MAJOR =3D icedtea7
+ ICEDTEA_BRANCH =3D 2.5
+ ICEDTEA_PREFIX =3D $(ICEDTEA_MAJOR)-forest-$(ICEDTEA_BRANCH)
++ICEDTEA_PREFIX =3D jdk8u
+ ICEDTEA_HG_URL =3D http://icedtea.classpath.org/hg/release/$(ICEDTEA_PREF=
IX)
+ ICEDTEA_URL =3D $(DROP_URL)/$(ICEDTEA_MAJOR)/$(ICEDTEA_RELEASE)
+
+@@ -403,6 +403,7 @@
+ endif
+
+ ICEDTEA_BOOT_PATCHES +=3D $(DISTRIBUTION_BOOT_PATCHES)
++ICEDTEA_BOOT_PATCHES =3D "patches/boot/no.patch"
+
+ # OpenJDK build environment.
+ if ZERO_BUILD
+
+
+--- icedtea-2.5.4/hotspot.map.in     2015-01-22 05:28:55.952757442 +0100
++++ icedtea-2.5.4/hotspot.map.in     2015-04-07 10:41:38.713960082 +0200
+@@ -1,3 +1,3 @@
+ # version type(drop/hg) url changeset sha256sum
+-default drop http://icedtea.classpath.org/download/drops/icedtea7/@ICEDTE=
A_RELEASE@ 6144ca9b6a72 4825f8543aa0c065530b05b0a95915a44eea153bbb696d2ffc4=
b50a398813e34
++default drop http://icedtea.classpath.org/download/drops/icedtea7/@ICEDTE=
A_RELEASE@ 6824e2475e04 011dd76928809ac1240d91e2d244ab020f161c33d69e5af35cf=
4c87084a6949d
+ aarch64 drop http://icedtea.classpath.org/download/drops/icedtea7/@ICEDTE=
A_RELEASE@ 4d25046abb67 60da8d427f7e3659f701e54c763ea8366d8af3280c7e1067000=
4938b2f07efef
+
diff --git a/recipes-core/openjdk/openjdk-8-8u40b27/jvm.cfg b/recipes-core/=
openjdk/openjdk-8-8u40b27/jvm.cfg
new file mode 100644
index 0000000..ea97cda
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-8u40b27/jvm.cfg
@@ -0,0 +1,43 @@
+# Copyright 2003 Sun Microsystems, Inc.  All Rights Reserved.
+# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
+#
+# This code is free software; you can redistribute it and/or modify it
+# under the terms of the GNU General Public License version 2 only, as
+# published by the Free Software Foundation.  Sun designates this
+# particular file as subject to the "Classpath" exception as provided
+# by Sun in the LICENSE file that accompanied this code.
+#
+# This code is distributed in the hope that it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+# version 2 for more details (a copy is included in the LICENSE file that
+# accompanied this code).
+#
+# You should have received a copy of the GNU General Public License versio=
n
+# 2 along with this work; if not, write to the Free Software Foundation,
+# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara,
+# CA 95054 USA or visit www.sun.com if you need additional information or
+# have any questions.
+#
+#
+# List of JVMs that can be used as an option to java, javac, etc.
+# Order is important -- first in this list is the default JVM.
+# NOTE that this both this file and its format are UNSUPPORTED and
+# WILL GO AWAY in a future release.
+#
+# You may also select a JVM in an arbitrary location with the
+# "-XXaltjvm=3D<jvm_dir>" option, but that too is unsupported
+# and may not be available in a future release.
+#
+-server ERROR
+-client IGNORE
+-hotspot ERROR
+-classic WARN
+-native ERROR
+-green ERROR
+-zero ALIASED_TO -server
+-shark ERROR
+-cacao ERROR
+-jamvm ERROR
diff --git a/recipes-core/openjdk/openjdk-8-8u40b27/zero-build.patch b/reci=
pes-core/openjdk/openjdk-8-8u40b27/zero-build.patch
new file mode 100644
index 0000000..1c07102
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-8u40b27/zero-build.patch
@@ -0,0 +1,14 @@
+---  hotspot/src/share/vm/interpreter/interpreterRuntime.cpp     2015-03-0=
7 10:25:19.000000000 -0800
++++  hotspot/src/share/vm/interpreter/interpreterRuntime.cpp     2015-03-0=
7 10:25:19.000000000 -0800
+@@ -407,7 +407,11 @@
+     // during deoptimization so the interpreter needs to skip it when
+     // the frame is popped.
+     thread->set_do_not_unlock_if_synchronized(true);
++#ifdef CC_INTERP
++    return (address) -1;
++#else
+     return Interpreter::remove_activation_entry();
++#endif
+   }
+
+   // Need to do this check first since when _do_not_unlock_if_synchronize=
d
diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openj=
dk/openjdk-8-common.inc
new file mode 100644
index 0000000..5fde496
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -0,0 +1,507 @@
+require openjdk-common.inc
+ICEDTEA =3D "icedtea-${ICEDTEA_VERSION}"
+
+INC_PR =3D "r5"
+
+SRC_URI =3D " \
+  ${ICEDTEA_URI} \
+  ${OPENJDK_URI} \
+  ${HOTSPOT_URI} \
+  ${CORBA_URI} \
+  ${JAXP_URI} \
+  ${JAXWS_URI} \
+  ${JDK_URI} \
+  ${LANGTOOLS_URI} \
+  ${CACAO_URI} \
+  ${JAMVM_URI} \
+  ${NASHORN_URI} \
+  ${OEPATCHES} \
+  file://jvm.cfg \
+  "
+
+JDKPN =3D "openjdk-8"
+JDK_DIR =3D "java-8-openjdk"
+
+PN =3D "${JDKPN}-jre"
+PROVIDES +=3D "${JDKPN}"
+
+DEPENDS =3D " \
+           icedtea7-native zip-native ant-native \
+           zlib libxslt-native \
+       jpeg libpng giflib \
+           gtk+ glib-2.0 \
+           cups fontconfig \
+       krb5 \
+       libxt libxinerama libxrender libxtst libxi \
+       freetype alsa-lib libffi \
+          "
+
+# No package should directly depend on this (it should require
+# java2-runtime instead).
+PRIVATE_LIBS =3D "\
+    lib.so libunpack.so libverify.so libjava.so libzip.so libnpt.so \
+    libjava_crw_demo.so libhprof.so libjavanet.so libnio.so \
+    libmanagement.so libinstrument.so libjsound.so libjsoundalsa.so \
+    libj2pcsc.so libj2pkcs11.so libj2gss.so libmlib_image.so \
+    libawt.so libsplashscreen.so libfreetype.so.6 libfontmanager.so \
+    libjpeg.so liblcms.so librmi.so libjawt.so libjaas_unix.so \
+    libattach.so libjdwp.so libdt_socket.so libhpi.so libjli.so \
+    libmawt.so libjvm.so \
+    libversionCheck.so libcompiledMethodLoad.so libgctest.so \
+    libheapViewer.so libheapTracker.so libminst.so libmtrace.so \
+    libwaiters.so libhprof.so \
+       "
+
+export ALT_CUPS_HEADERS_PATH =3D "${STAGING_INCDIR}"
+export ALT_FREETYPE_HEADERS_PATH =3D "${STAGING_INCDIR}/freetype2"
+export ALT_FREETYPE_LIB_PATH =3D "${STAGING_LIBDIR}"
+export CACAO_CONFIGURE_ARGS =3D " \
+    ${@['','--enable-softfloat'][bb.data.getVar('TARGET_FPU',d,1) =3D=3D '=
soft']}"
+
+JAVA_HOME[unexport] =3D "1"
+
+# disable shark until it is fully working again
+# WITH_ADDITIONAL_VMS ?=3D "--with-additional-vms=3Dshark,cacao,jamvm"
+
+WITH_ADDITIONAL_VMS ?=3D "--with-additional-vms=3Dcacao,jamvm"
+
+# OpenJDK supports parallel compilation but uses a plain number for this.
+# In OE we have PARALLEL_MAKE which is the actual option passed to make,
+# e.g. "-j 4".
+
+OPENJDK_PARALLEL_MAKE :=3D "${PARALLEL_MAKE}"
+PARALLEL_MAKE =3D  ""
+
+def get_jdk8_jobs(d):
+    import bb
+
+    pm =3D bb.data.getVar('OPENJDK_PARALLEL_MAKE', d, 1);
+    if not pm:
+        return "1"
+
+    pm =3D pm.split("j");
+    if (len(pm) =3D=3D 2):
+        return pm[1].strip()
+
+    # Whatever found in PARALLEL_MAKE was not suitable.
+    return "1"
+
+JDK_JOBS =3D "${@get_jdk8_jobs(d)}"
+
+EXTRA_OECONF =3D " \
+        --disable-tests \
+    --disable-hotspot-tests \
+    --disable-langtools-tests \
+    --disable-jdk-tests \
+    --disable-docs \
+    --disable-nss \
+    --disable-system-lcms \
+    --disable-bootstrap \
+        --with-rhino=3D${STAGING_DATADIR_JAVA}/rhino.jar \
+    --with-jdk-home=3D${STAGING_LIBDIR_JVM_NATIVE}/icedtea7-native \
+        --with-openjdk-src-zip=3D${WORKDIR}/${OPENJDK_FILE} \
+    --with-hotspot-src-zip=3D${WORKDIR}/${HOTSPOT_FILE} \
+    --with-corba-src-zip=3D${WORKDIR}/${CORBA_FILE} \
+    --with-jaxp-src-zip=3D${WORKDIR}/${JAXP_FILE} \
+    --with-jaxws-src-zip=3D${WORKDIR}/${JAXWS_FILE} \
+    --with-jdk-src-zip=3D${WORKDIR}/${JDK_FILE} \
+    --with-langtools-src-zip=3D${WORKDIR}/${LANGTOOLS_FILE} \
+    --with-parallel-jobs=3D${JDK_JOBS} \
+    --with-pkgversion=3D${PV} \
+       "
+
+do_configure_prepend() {
+  bbnote "Copying and resetting patches...Configure with parallel-jobs: ${=
JDK_JOBS}"
+
+  # Automatically copy everything that starts with "icedtea" (or "cacao") =
and ends with
+  # ".patch" into the patches directory.
+  find ${WORKDIR} -maxdepth 1 -name "icedtea*.patch" -exec cp {} ${S}/patc=
hes \;
+  find ${WORKDIR} -maxdepth 1 -name "cacao*.patch" -exec cp {} ${S}/patche=
s \;
+  find ${WORKDIR} -maxdepth 1 -name "zero*.patch" -exec cp {} ${S}/patches=
 \;
+  find ${WORKDIR} -maxdepth 1 -name "faulty-nx-emulation.patch" -exec cp {=
} ${S}/patches \;
+  # Overwrite pr2124.patch about NamedCurve.java
+  > ${S}/patches/pr2124.patch
+  # Overwrite rhino.patch about JavaScript
+  > ${S}/patches/rhino.patch
+  > ${S}/patches/boot/no.patch
+  bbnote "No need to remove snmp etc.. from openjdk-8"
+  > ${S}/fsg.sh.in
+}
+
+do_configure_append() {
+        # We are not removing any files from openjdk-8
+        bbnote "Applying remaining patches.."
+    oe_runmake patch
+}
+
+# Work around broken variable quoting in oe-stable 2009 and provide the va=
riable
+# via the environment which then overrides the erroneous value that was wr=
itten
+# into '${ICETDEA}/Makefile'.
+# Icedtea's makefile is not compatible to parallelization so we cannot all=
ow
+# passing a valid ${PARALLEL_MAKE} to it. OTOH OpenJDK's makefiles are
+# parallelizable and we need ${PARALLEL_MAKE} to derive the proper value.
+# The base for this quirk is that GNU Make only considers the last "-j" op=
tion.
+EXTRA_OEMAKE +=3D 'CC=3D"${CC}" CCC=3D"${CXX}" CPP=3D"${CPP}" CXX=3D"${CXX=
}" CC_FOR_BUILD=3D"${BUILD_CC}"'
+
+EXTRA_OEMAKE +=3D ' \
+                OE_CFLAGS=3D"${TARGET_CFLAGS}" \
+                OE_CPPFLAGS=3D"${TARGET_CPPFLAGS}" \
+                OE_CXXFLAGS=3D"${TARGET_CXXFLAGS}" \
+                OE_LDFLAGS=3D"${TARGET_LDFLAGS}" \
+                ZIPEXE=3D"${STAGING_BINDIR_NATIVE}/zip" \
+          CROSS_COMPILE_ARCH=3D"${JDK_ARCH}" \
+          REQUIRED_ALSA_VERSION=3D"" \
+               '
+
+# Provides the target architecture to the configure script.
+export LLVM_CONFIGURE_ARCH=3D"${@get_llvm_configure_arch(d)}"
+
+OE_LAUNCHER_LDFLAGS =3D "-Wl,-rpath-link,${STAGING_LIBDIR}/llvm${WANT_LLVM=
_RELEASE} -Wl,-rpath,${libdir}/llvm${WANT_LLVM_RELEASE}"
+
+OE_LAUNCHER_LDFLAGS_arm =3D ""
+
+EXTRA_OEMAKE +=3D 'OE_LAUNCHER_LDFLAGS=3D"${OE_LAUNCHER_LDFLAGS}"'
+
+
+OPENJDK_OECONF =3D " \
+     --openjdk-target=3D${TARGET_SYS} \
+     --prefix=3D/usr                  \
+     --exec_prefix=3D/usr             \
+     --bindir=3D/usr/bin              \
+     --sbindir=3D/usr/sbin            \
+     --libexecdir=3D/usr/libexec      \
+     --datadir=3D/usr/share           \
+     --sysconfdir=3D/etc              \
+     --sharedstatedir=3D/com          \
+     --localstatedir=3D/var           \
+     --libdir=3D/usr/lib              \
+     --includedir=3D/usr/include      \
+     --oldincludedir=3D/usr/include   \
+     --infodir=3D/usr/share/info      \
+     --mandir=3D/usr/share/man        \
+     --disable-headful              \
+     --with-sys-root=3D${STAGING_DIR_TARGET} \
+     CFLAGS=3D"--sysroot=3D${STAGING_DIR_TARGET} " \
+     CXXFLAGS=3D"--sysroot=3D${STAGING_DIR_TARGET} " \
+     LDFLAGS=3D"--sysroot=3D${STAGING_DIR_TARGET} " \
+     --with-extra-cflags=3D"--sysroot=3D${STAGING_DIR_TARGET} " \
+     --with-extra-cxxflags=3D"--sysroot=3D${STAGING_DIR_TARGET} " \
+     --with-extra-ldflags=3D"--sysroot=3D${STAGING_DIR_TARGET} " \
+     "
+
+def should_build_zero(d):
+    if (get_llvm_configure_arch(d) =3D=3D "x86"):
+        return False
+    else:
+        return True
+
+def openjdk8_configuration(d):
+    if (should_build_zero(d) =3D=3D True):
+        return "--with-jvm-variants=3Dzero LIBFFI_LIBS=3D-lffi"
+    else:
+        return "--with-jvm-variants=3Dserver"
+
+def openjdk_configuration(d):
+    if (should_build_zero(d) =3D=3D True):
+        return "LIBFFI_LIBS=3D-lffi"
+    else:
+        return ""
+
+# LIBFFI_LIBS needs to be in EXTRA_OECONF
+OPENJDK_OECONF +=3D "${@openjdk8_configuration(d)}"
+EXTRA_OECONF +=3D "${@openjdk_configuration(d)}"
+BUILD_ZERO =3D "${@should_build_zero(d)}"
+
+do_compile() {
+
+        OPENJDK8_BUILD_LOC=3D`pwd`
+    bbnote "3/3 Building final JDK @ ${OPENJDK8_BUILD_LOC}"
+        # Create dummy Defs.gmk
+        mkdir -p ${OPENJDK8_BUILD_LOC}/openjdk/jdk/make/common/
+        mkdir -p ${OPENJDK8_BUILD_LOC}/openjdk/jdk/make/common/shared/
+        > ${OPENJDK8_BUILD_LOC}/openjdk/jdk/make/common/shared/Defs.gmk
+
+        # we do not want MAKE=3Dmake
+        MAKE=3D/usr/bin/make
+        BUILD_LD=3D/usr/bin/gcc
+        ###############################################
+        # Icedtea Makefile creates openjdk directory and copies various Ja=
va tar files etc.. and
+        # and unpacks it...
+        # This is where we need to configure OpenJDK-8
+        ###############################################
+    # Build the final Hotspot + OpenJDK
+        #
+        for F in `find ${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/libffi -name=
 sysroot-destdir`
+        do
+            #export LIBFFI_LIBS=3D"-L${F}/usr/lib/ -lffi"
+            LIBFFI_LOC=3D$F
+        done
+        for H in `find ${LIBFFI_LOC} -name include`
+        do
+            #export LIBFFI_CFLAGS=3D"-I${H}/"
+            ln -sf $H/ffi.h ${STAGING_INCDIR}/ffi.h
+            ln -sf $H/ffitarget.h ${STAGING_INCDIR}/ffitarget.h
+        done
+        bbnote "We are trying to not apply patches to icedTea Makefile.am =
etc.."
+        bbnote "This way changes to Makefile.am will not require us to reg=
enerate patches..."
+        if [ -e ${OPENJDK8_BUILD_LOC}/openjdk/configure ] ; then
+          cd ${OPENJDK8_BUILD_LOC}/openjdk
+          chmod +x ${OPENJDK8_BUILD_LOC}/openjdk/configure
+          bbnote "Setting up NASHORN...."
+          ln -sf ${WORKDIR}/${NASHORN_FILE} ${OPENJDK8_BUILD_LOC}/nashorn.=
tar.bz2
+          tar xf ${OPENJDK8_BUILD_LOC}/nashorn.tar.bz2
+          if [ -e nashorn ] ; then
+              rm -rf nashorn
+          fi;
+          mv nashorn-${NASHORN_CHANGESET} nashorn
+          if [ "${BUILD_ZERO}" =3D "True" ] ; then
+              bbnote "Apply fixes to Openjdk source so that we can build Z=
ero"
+              if patch -l -p0 --dry-run -s -t -f -F 0 < ${S}/patches/zero-=
build.patch ;
+              then
+                  bbnote "zero-build fix..."
+                  patch -l -p0 < ${S}/patches/zero-build.patch
+              else
+                  bbnote "Already patched for zero-build"
+              fi;
+
+              if patch -l -p0 --dry-run -s -t -f -F 0 < ${S}/patches/fault=
y-nx-emulation.patch ;
+              then
+                  bbnote "faulty-nx-emulation fix"
+                  patch -l -p0 < ${S}/patches/faulty-nx-emulation.patch
+              else
+                  bbnote "Already patched for nx-emulation"
+              fi;
+          fi;
+
+          bbnote "Configuring OpenJDK-8..."
+          ${OPENJDK8_BUILD_LOC}/openjdk/configure ${OPENJDK_OECONF}
+        fi ;
+
+        cd ${OPENJDK8_BUILD_LOC}
+        cd openjdk
+
+        rm -rf ${B}/${BUILD_DIR}
+
+        bbnote "Building OpenJDK-8..."
+        oe_runmake DEBUG_BINARIES=3Dtrue all
+        ############################################
+        # Use following to create compact profiles.
+        ############################################
+        # For JRE only --- oe_runmake profiles
+        # For JDK/JRE  --- oe_runmake images profiles
+
+        cd build
+        # Remove all debug symbol files.
+        find . -name "*.diz" -exec rm {} \;
+
+        ln -sf ${OPENJDK8_BUILD_LOC}/openjdk/build/*/images ${B}/${BUILD_D=
IR}
+        echo ${B} ${BUILD_DIR} ${D}
+        ls -al ${B}/${BUILD_DIR}
+        cd ${OPENJDK8_BUILD_LOC}
+        bbnote "Done with building Openjdk-8..."
+
+        bbnote "Removing openjdk build created libjsig symlink"
+        for libjsig_symbol in `find . -type l | grep libjsig.so`
+        do
+            echo $libjsig_symbol
+            cp --remove-destination `dirname $libjsig_symbol`/../libjsig.s=
o $libjsig_symbol
+        done
+        pwd
+        bbnote "Done fixing QA symlink issue"
+
+        ############################################
+        # Use following to copy compact profiles.
+        ############################################
+        # bbnote "Use following to copy compact3 profiles"
+
+        # Copy comapct3 profile as JRE
+        # cp -r images/j2re-compact3-image/bin ${B}/${BUILD_DIR}/j2sdk-ima=
ge/jre/
+        # cp -r images/j2re-compact3-image/lib ${B}/${BUILD_DIR}/j2sdk-ima=
ge/jre/
+        # Do the same for j2re-image
+        # cp -r images/j2re-compact3-image/bin ${B}/${BUILD_DIR}/j2re-imag=
e/
+        # cp -r images/j2re-compact3-image/lib ${B}/${BUILD_DIR}/j2re-imag=
e/
+
+}
+
+do_install() {
+
+    install -d ${D}${libdir_jvm}
+    cp -R ${B}/${BUILD_DIR}/j2sdk-image ${D}${JDK_HOME}
+
+    chmod u+rw -R ${D}${JDK_HOME}
+
+    # Fix symlink which would point into staging in the binary package.
+    #ln -sf ${datadir_java}/rhino.jar ${D}${JDK_HOME}/jre/lib/rhino.jar
+
+    # JRE is a subset of JDK. So to save space and resemble what the BIG d=
istros
+    # do we create symlinks from the JDK binaries to their counterparts in=
 the
+    # JRE folder (which have to exist by that time b/c of dependencies).
+    for F in `find ${D}${JDK_HOME}/jre/bin -type f`
+    do
+          bf=3D`basename $F`
+          bbnote "replace:" $bf
+          rm ${D}${JDK_HOME}/bin/$bf
+          ln -s ${JDK_HOME}/jre/bin/$bf ${D}${JDK_HOME}/bin/$bf
+    done
+
+        install -m644 ${WORKDIR}/jvm.cfg  ${D}${JDK_HOME}/jre/lib/${JDK_AR=
CH}/
+        # workaround for shared libarary searching
+    ln -sf ${JDK_HOME}/jre/lib/${JDK_ARCH}/server/libjvm.so ${D}${JDK_HOME=
}/jre/lib/${JDK_ARCH}/
+}
+
+# Notes about the ideas behind packaging:
+# 1) User should install openjdk-8-jre. This is a provider of 'java2-runti=
me'.
+# 2) This lets package mgmt install: openjdk-8-java
+# -> openjdk-8-vm-shark|openjdk-8-vm-zero|openjdk-8-vm-cacao -> openjdk-8-=
common
+#
+# With opkg the zero VM is chosen which is good b/c that is the best known=
 (=3D compatible)
+# runtime. Installing other runtimes side-by-side is possible. Through jvm=
.cfg the following
+# order of precedence is enforced: zero, shark, cacao. User can chose a di=
fferent runtime
+# by adding '-shark' or '-cacao' to the Java command (or by deinstalling a=
n otherwise preferred
+# runtime)
+# 3) All other packages, including -jdk, are optional and not needed for n=
ormal Java apps.
+#PACKAGES =3D " \
+#            ${JDKPN}-jre \
+#        ${JDKPN}-jre-dbg \
+#            ${JDKPN}-dbg \
+#            ${JDKPN}-demo-dbg \
+#            ${JDKPN}-demo \
+#            ${JDKPN}-source \
+#            ${JDKPN}-doc \
+#            ${JDKPN}-jdk \
+#            ${JDKPN}-java \
+#            ${JDKPN}-vm-shark \
+#            ${JDKPN}-vm-zero \
+#            ${JDKPN}-vm-cacao \
+#        ${JDKPN}-vm-jamvm \
+#            ${JDKPN}-common \
+#           "
+
+PACKAGES =3D " \
+            ${JDKPN}-jre \
+            ${JDKPN}-jdk \
+            ${JDKPN}-java \
+            ${JDKPN}-common \
+            ${JDKPN}-src \
+            ${JDKPN}-vm-server \
+            ${JDKPN}-vm-client \
+            ${JDKPN}-doc \
+            ${JDKPN}-demo \
+            ${JDKPN}-source \
+           "
+
+FILES_${JDKPN}-dbg =3D "\
+    ${JDK_HOME}/bin/.debug \
+    ${JDK_HOME}/lib/.debug \
+    ${JDK_HOME}/lib/${JDK_ARCH}/jli/.debug \
+    ${JDK_HOME}/jre/bin/.debug \
+    ${JDK_HOME}/jre/lib/.debug \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/.debug \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/jli/.debug \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/native_threads/.debug \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/server/.debug \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/headless/.debug \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/xawt/.debug \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/client/.debug \
+       "
+
+FILES_${JDKPN}-demo =3D "${JDK_HOME}/demo ${JDK_HOME}/sample"
+RDEPENDS_${JDKPN}-demo =3D "java2-runtime"
+FILES_${JDKPN}-demo-dbg =3D "\
+    ${JDK_HOME}/demo/jvmti/gctest/lib/.debug \
+    ${JDK_HOME}/demo/jvmti/heapTracker/lib/.debug \
+    ${JDK_HOME}/demo/jvmti/heapViewer/lib/.debug \
+    ${JDK_HOME}/demo/jvmti/hprof/lib/.debug \
+    ${JDK_HOME}/demo/jvmti/minst/lib/.debug \
+    ${JDK_HOME}/demo/jvmti/mtrace/lib/.debug \
+    ${JDK_HOME}/demo/jvmti/versionCheck/lib/.debug \
+    ${JDK_HOME}/demo/jvmti/waiters/lib/.debug \
+    ${JDK_HOME}/demo/jvmti/compiledMethodLoad/lib/.debug \
+       "
+
+FILES_${JDKPN}-source =3D "${JDK_HOME}/src.zip"
+
+FILES_${JDKPN}-java =3D "${JDK_HOME}/jre/bin/java"
+
+FILES_${JDKPN}-vm-server =3D "${JDK_HOME}/jre/lib/${JDK_ARCH}/server/"
+
+FILES_${JDKPN}-vm-client =3D "${JDK_HOME}/jre/lib/${JDK_ARCH}/client/"
+
+FILES_${JDKPN}-vm-zero =3D "${JDK_HOME}/jre/lib/${JDK_ARCH}/server/"
+
+FILES_${JDKPN}-vm-shark =3D "${JDK_HOME}/jre/lib/${JDK_ARCH}/shark/"
+
+FILES_${JDKPN}-vm-cacao =3D "${JDK_HOME}/jre/lib/${JDK_ARCH}/cacao/"
+
+FILES_${JDKPN}-vm-jamvm =3D "${JDK_HOME}/jre/lib/${JDK_ARCH}/jamvm/"
+
+FILES_${JDKPN}-common =3D "${JDK_HOME}/jre/ASSEMBLY_EXCEPTION \
+                          ${JDK_HOME}/jre/THIRD_PARTY_README \
+                          ${JDK_HOME}/jre/LICENSE \
+                          ${JDK_HOME}/ASSEMBLY_EXCEPTION \
+                          ${JDK_HOME}/THIRD_PARTY_README \
+                          ${JDK_HOME}/LICENSE \
+                          ${JDK_HOME}/release \
+                          ${JDK_HOME}/jre/lib \
+                         "
+
+FILES_${JDKPN}-jre_append =3D " \
+    ${JDK_HOME}/jre/bin/keytool \
+        ${JDK_HOME}/jre/bin/orbd \
+    ${JDK_HOME}/jre/bin/pack200 \
+        ${JDK_HOME}/jre/bin/rmid \
+    ${JDK_HOME}/jre/bin/rmiregistry \
+        ${JDK_HOME}/jre/bin/servertool \
+    ${JDK_HOME}/jre/bin/tnameserv \
+        ${JDK_HOME}/jre/bin/unpack200 \
+    ${JDK_HOME}/jre/bin/policytool \
+        ${JDK_HOME}/jre/bin/javaws \
+        ${JDK_HOME}/jre/bin/jjs \
+       "
+
+
+RPROVIDES_${JDKPN}-vm-shark =3D "java2-vm"
+RPROVIDES_${JDKPN}-vm-zero =3D "java2-vm"
+RPROVIDES_${JDKPN}-vm-cacao =3D "java2-vm"
+RPROVIDES_${JDKPN}-vm-jamvm =3D "java2-vm"
+
+# Even though a vm is a hard dependency it is set as RRECOMMENDS so a sing=
le vm can get uninstalled:
+# root@beaglebone:~/java# opkg remove openjdk-8-vm-shark
+# No packages removed.
+# Collected errors:
+#  * print_dependents_warning: Package openjdk-8-vm-shark is depended upon=
 by packages:
+#  * print_dependents_warning: openjdk-8-java
+#  * print_dependents_warning: These might cease to work if package openjd=
k-8-vm-shark is removed.
+RRECOMMENDS_${JDKPN}-java =3D "java2-vm"
+
+# For some reason shark and cacao do not automatically depends on -common.
+# So we add that manually.
+RDEPENDS_${JDKPN}-vm-shark =3D "${JDKPN}-common"
+RDEPENDS_${JDKPN}-vm-cacao =3D "${JDKPN}-common"
+RDEPENDS_${JDKPN}-vm-jamvm =3D "${JDKPN}-common"
+# With out this you may see md5 mismatches.
+RDEPENDS_${JDKPN}-common =3D "librhino-java"
+
+# There is a symlink to a .so but this one is valid.
+INSANE_SKIP_${JDKPN}-vm-shark =3D "dev-so"
+INSANE_SKIP_${JDKPN}-vm-zero =3D "dev-so"
+INSANE_SKIP_${JDKPN}-vm-cacao =3D "dev-so"
+INSANE_SKIP_${JDKPN}-vm-jamvm =3D "dev-so"
+INSANE_SKIP_${JDKPN}-common =3D "dev-so"
+
+FILES_${JDKPN}-jdk =3D " \
+                       ${JDK_HOME}/bin \
+                       ${JDK_HOME}/lib \
+                       ${JDK_HOME}/include \
+                      "
+RDEPENDS_${JDKPN}-jre =3D "${JDKPN}-java ${JDKPN}-common"
+RDEPENDS_${JDKPN}-java =3D "${JDKPN}-common"
+RPROVIDES_${JDKPN}-jre =3D "java2-runtime"
+
+RDEPENDS_${JDKPN}-jdk =3D "${JDKPN}-jre"
+
+FILES_${JDKPN}-doc =3D "${JDK_HOME}/man"
+
+require openjdk-postinst.inc
+
+ALTERNATIVE_PRIORITY =3D "50"
diff --git a/recipes-core/openjdk/openjdk-8-release-8u40b27.inc b/recipes-c=
ore/openjdk/openjdk-8-release-8u40b27.inc
new file mode 100644
index 0000000..df0dc40
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-release-8u40b27.inc
@@ -0,0 +1,73 @@
+require openjdk-8-common.inc
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f655=
2"
+
+FILESPATH =3D. "${FILE_DIRNAME}/openjdk-8-8u40b27:"
+
+# Name of the directory containing the compiled output
+BUILD_DIR =3D "openjdk.build"
+BUILD_DIR_ECJ =3D "openjdk.build-ecj"
+
+ICEDTEA_URI =3D "http://icedtea.wildebeest.org/download/source/${ICEDTEA}.=
tar.gz;name=3Diced"
+
+#ICEDTEA_PREFIX =3D "icedtea7-forest-2.5"
+ICEDTEA_PREFIX =3D "jdk8u"
+
+OPENJDK_HG_URL =3D "http://hg.openjdk.java.net/jdk8u/jdk8u"
+
+OPENJDK_FILE =3D "${OPENJDK_CHANGESET}.tar.bz2"
+OPENJDK_URI =3D "${OPENJDK_HG_URL}/archive/${OPENJDK_FILE};name=3Dopenjdk;=
unpack=3Dfalse"
+
+HOTSPOT_FILE =3D "${HOTSPOT_CHANGESET}.tar.bz2"
+HOTSPOT_URI =3D "${OPENJDK_HG_URL}/hotspot/archive/${HOTSPOT_FILE};name=3D=
hotspot;unpack=3Dfalse"
+
+CORBA_FILE =3D "${CORBA_CHANGESET}.tar.bz2"
+CORBA_URI =3D "${OPENJDK_HG_URL}/corba/archive/${CORBA_FILE};name=3Dcorba;=
unpack=3Dfalse"
+
+JAXP_FILE =3D "${JAXP_CHANGESET}.tar.bz2"
+JAXP_URI =3D "${OPENJDK_HG_URL}/jaxp/archive/${JAXP_FILE};name=3Djaxp;unpa=
ck=3Dfalse"
+
+JAXWS_FILE =3D "${JAXWS_CHANGESET}.tar.bz2"
+JAXWS_URI =3D "${OPENJDK_HG_URL}/jaxws/archive/${JAXWS_FILE};name=3Djaxws;=
unpack=3Dfalse"
+
+JDK_FILE =3D "${JDK_CHANGESET}.tar.bz2"
+JDK_URI =3D "${OPENJDK_HG_URL}/jdk/archive/${JDK_FILE};name=3Djdk;unpack=
=3Dfalse"
+
+LANGTOOLS_FILE =3D "${LANGTOOLS_CHANGESET}.tar.bz2"
+LANGTOOLS_URI =3D "${OPENJDK_HG_URL}/langtools/archive/${LANGTOOLS_FILE};n=
ame=3Dlangtools;unpack=3Dfalse"
+
+CACAO_VERSION =3D "e215e36be9fc"
+CACAO_FILE =3D "${CACAO_VERSION}.tar.gz"
+CACAO_URI =3D "http://icedtea.wildebeest.org/download/drops/cacao/${CACAO_=
FILE};name=3Dcacao;unpack=3Dfalse"
+SRC_URI[cacao.md5sum] =3D "79f95f0aea4ba04cf2f1a8632ac66d14"
+SRC_URI[cacao.sha256sum] =3D "4966514c72ee7ed108b882d9b6e65c3adf8a8f9c2dcc=
b029f971b3c8cb4870ab"
+
+JAMVM_VERSION =3D "ec18fb9e49e62dce16c5094ef1527eed619463aa"
+JAMVM_FILE =3D "jamvm-${JAMVM_VERSION}.tar.gz"
+JAMVM_URI =3D "http://icedtea.wildebeest.org/download/drops/jamvm/${JAMVM_=
FILE};name=3Djamvm;unpack=3Dfalse"
+SRC_URI[jamvm.md5sum] =3D "d50ae193d01a9251e10679c7a2cc6ff1"
+SRC_URI[jamvm.sha256sum] =3D "31810266666c23822942aac62a78019c2c4589e1c5ee=
48329cbf42652d4437bc"
+
+NASHORN_FILE =3D "${NASHORN_CHANGESET}.tar.bz2"
+NASHORN_URI =3D "${OPENJDK_HG_URL}/nashorn/archive/${NASHORN_FILE};name=3D=
nashorn;unpack=3Dfalse"
+
+# Allow overriding this separately
+OEPATCHES =3D "\
+    file://fix-checksums.patch \
+    file://cacao-libtoolize.patch \
+    file://cacao-loadavg-makefile.patch \
+    file://cacao-loadavg.patch;apply=3Dno \
+    file://cacao-arm-ucontext.patch;apply=3Dno \
+    file://zero-build.patch;apply=3Dno \
+    file://faulty-nx-emulation.patch;apply=3Dno \
+    "
+
+# overrride the jamvm patch for now, needs to be solved upstream
+do_unpackpost() {
+}
+
+addtask unpackpost after do_unpack before do_patch
+
+# Allow overriding this separately
+
+# Allow overriding this separately
diff --git a/recipes-core/openjdk/openjdk-8_8u40b27-2.5.4.bb b/recipes-core=
/openjdk/openjdk-8_8u40b27-2.5.4.bb
new file mode 100644
index 0000000..0d4236c
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8_8u40b27-2.5.4.bb
@@ -0,0 +1,44 @@
+require openjdk-8-release-8u40b27.inc
+
+PR =3D "${INC_PR}.1"
+
+SRC_URI[iced.md5sum] =3D "646064d7a8d57c2cae0ef35a05de57c8"
+SRC_URI[iced.sha256sum] =3D "5301b9a8592af2cf8e3e7a3650e5e1fe744c6d2de7f8f=
f78080b2eeae86a9800"
+
+CORBA_CHANGESET =3D "bd0186cd2419"
+SRC_URI[corba.md5sum] =3D "200c233a1b7c72c5c77cd7779d1d257a"
+SRC_URI[corba.sha256sum] =3D "870888241bfe3718e1de10e6de5ae70d5f7131752bb3=
c1657b020c8fb7af6049"
+
+JAXP_CHANGESET =3D "56f6ca79467d"
+SRC_URI[jaxp.md5sum] =3D "f8b291ba2a3c1e2964bd96328e0ebcfc"
+SRC_URI[jaxp.sha256sum] =3D "254c622fc8a572efd0a10908b4038ba3cf41775d7c09c=
8f576800b3f608e33f7"
+
+JAXWS_CHANGESET =3D "a5f2cdedb940"
+SRC_URI[jaxws.md5sum] =3D "eef146e64e8b5e11473357bb2f4f1ce2"
+SRC_URI[jaxws.sha256sum] =3D "c7882fa363960b511a08038130a45477fb8d5e82f3d6=
244248e61e564f3c84a3"
+
+JDK_CHANGESET =3D "d4453d784fb6"
+SRC_URI[jdk.md5sum] =3D "f96a5f820b1ffc8a228d3f44f85c792f"
+SRC_URI[jdk.sha256sum] =3D "b02b46c4b52ca06cf0b42cd7daadc7dbee6403e83f7bc9=
51e28d0c7e6d23c3cd"
+
+LANGTOOLS_CHANGESET =3D "83eca922346e"
+SRC_URI[langtools.md5sum] =3D "6e2491a30d39b34a3c007c5fc3fc073e"
+SRC_URI[langtools.sha256sum] =3D "e46e8322d189dbdf631c1b2796b8ca628f2f83b2=
f05f0ede74bcbc118201aa16"
+
+OPENJDK_CHANGESET =3D "12deacac8257"
+SRC_URI[openjdk.md5sum] =3D "2eb4480a74fa5737ace90494c5e16c00"
+SRC_URI[openjdk.sha256sum] =3D "6f54575843bf258fdbef4a23d76f3c4b0ada685b42=
df0f7f5da2e6112113ad10"
+
+# located in hotspot.map
+HOTSPOT_CHANGESET =3D "6824e2475e04"
+SRC_URI[hotspot.md5sum] =3D "261b1075a044f2620d04ca4a00589fd5"
+SRC_URI[hotspot.sha256sum] =3D "011dd76928809ac1240d91e2d244ab020f161c33d6=
9e5af35cf4c87084a6949d"
+
+NASHORN_CHANGESET =3D "c2dd88e89edc"
+SRC_URI[nashorn.md5sum] =3D "134199a03c9365febebcad695273a24d"
+SRC_URI[nashorn.sha256sum] =3D "4ab1d77f7763962b85fbf60951c5e2d397badc5447=
0b58653af3e991b728c6a9"
+
+
+INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
+INHIBIT_PACKAGE_STRIP =3D "1"
+
--
1.9.1




