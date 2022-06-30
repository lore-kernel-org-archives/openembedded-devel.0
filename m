Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36BBC43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 15:16:41 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web09.26643.1656602195911430002
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 08:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com
 header.s=dfc430d2-d198-11ec-948e-34200cb392d2 header.b=WODZh5Rb;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44,
 mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 5F88B9C038C;
	Thu, 30 Jun 2022 11:16:34 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
 port 10032)
	with ESMTP id H0JD6Qvtaaql; Thu, 30 Jun 2022 11:16:33 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 768F29C0EF7;
	Thu, 30 Jun 2022 11:16:33 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 768F29C0EF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1656602193; bh=ijxkiiJzeBQ5rKNiogSHGPPE/duy8vSgPVhtSYPpyBk=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=WODZh5RbM81QK4tJHFM85dD6wELX4eCogVQjquxiz722aoEF27kl1ErN2sB/xIHmq
	 hH1zSt7UhQKNp7lt71jQc7CNowylZE52WI40q0dhnD0+1Ubq1G22er6MKGqfK4tRZ0
	 y+c2O8JJ7JI7zhw5/SQEF6Th6p+fT9Ftoea2n2O+k4IfVCMquyYkrPuYY5gvXaBpYC
	 mLgCtFsvFbxDdXIIYooC/YEv59koUip8FEBIPW1EWNxqRAQJPm6mLXdS781iZp2TRu
	 DOxTWdC5OTwpWdI2pJlPdk0ZJVm98oaVFhBJV8XIoGCRR4Yd/0SoP2ookwLz+zKAai
	 7EvrwW2XZWkXA==
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
 port 10026)
	with ESMTP id FJrVee81JciF; Thu, 30 Jun 2022 11:16:33 -0400 (EDT)
Received: from sfl-deribaucourt.home
 (abordeaux-652-1-10-45.w90-16.abo.wanadoo.fr [90.16.177.45])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 101109C038C;
	Thu, 30 Jun 2022 11:16:31 -0400 (EDT)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Cc: TicoTimo@gmail.com,
	derek@asterius.io,
	trevor.gamblin@windriver.com,
	Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Subject: [meta-python][PATCH] python3-debugpy: add recipe
Date: Thu, 30 Jun 2022 17:15:57 +0200
Message-Id: 
 <20220630151556.165249-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jun 2022 15:16:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97640

debugpy provides an implementation of the Debug Adapter Protocol for
Python 3.

It is for instance compatible with the VSCode Python remote debugger
extension.

Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirf=
airelinux.com>
---
 ...se-generic-yocto-architecture-suffix.patch | 64 +++++++++++++++++++
 .../python/python3-debugpy_1.6.0.bb           | 40 ++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-debugpy/0=
001-arch-use-generic-yocto-architecture-suffix.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-debugpy_1=
.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-debugpy/0001-arc=
h-use-generic-yocto-architecture-suffix.patch b/meta-python/recipes-devto=
ols/python/python3-debugpy/0001-arch-use-generic-yocto-architecture-suffi=
x.patch
new file mode 100644
index 000000000..0a58b39fa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-debugpy/0001-arch-use-g=
eneric-yocto-architecture-suffix.patch
@@ -0,0 +1,64 @@
+From f6552b6d3cef48401188fcacd8718f9268493608 Mon Sep 17 00:00:00 2001
+From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinu=
x.com>
+Date: Thu, 30 Jun 2022 14:51:36 +0200
+Subject: [PATCH] arch: use generic yocto architecture suffix
+
+A precompiled attach_linux_<arch>.so library comes for only a limited
+number of architectures in debugpy. We have to compile it for the
+others.
+
+Yocto may use the TARGET_ARCH suffix but it will be different than what =
is
+returned at runtime by Python's platform.machine(). Ex: core2-64/amd64.
+This makes it hard to match the names used to generate and load the
+library.
+
+We ease the process of matching both by using a generating "yocto"
+suffix.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoir=
fairelinux.com>
+---
+ .../pydevd_attach_to_process/add_code_to_python_process.py   | 5 ++---
+ src/debugpy/_vendored/pydevd/pydevd_tracing.py               | 5 ++---
+ 2 files changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/src/debugpy/_vendored/pydevd/pydevd_attach_to_process/add_c=
ode_to_python_process.py b/src/debugpy/_vendored/pydevd/pydevd_attach_to_=
process/add_code_to_python_process.py
+index 3c0e1b94..4c7d4b46 100644
+--- a/src/debugpy/_vendored/pydevd/pydevd_attach_to_process/add_code_to_=
python_process.py
++++ b/src/debugpy/_vendored/pydevd/pydevd_attach_to_process/add_code_to_=
python_process.py
+@@ -171,8 +171,8 @@ def get_target_filename(is_target_process_64=3DNone,=
 prefix=3DNone, extension=3DNone):
+     elif IS_LINUX:
+         if not extension:
+             extension =3D '.so'
+-        suffix_64 =3D 'amd64'
+-        suffix_32 =3D 'x86'
++        suffix_64 =3D 'yocto'
++        suffix_32 =3D 'yocto'
+=20
+     elif IS_MAC:
+         if not extension:
+@@ -577,4 +577,3 @@ if __name__ =3D=3D '__main__':
+             test()
+         else:
+             main(args)
+-
+diff --git a/src/debugpy/_vendored/pydevd/pydevd_tracing.py b/src/debugp=
y/_vendored/pydevd/pydevd_tracing.py
+index 561d7f71..7acbf3e1 100644
+--- a/src/debugpy/_vendored/pydevd/pydevd_tracing.py
++++ b/src/debugpy/_vendored/pydevd/pydevd_tracing.py
+@@ -157,8 +157,8 @@ def get_python_helper_lib_filename():
+=20
+     elif IS_LINUX:
+         extension =3D '.so'
+-        suffix_64 =3D 'amd64'
+-        suffix_32 =3D 'x86'
++        suffix_64 =3D 'yocto'
++        suffix_32 =3D 'yocto'
+=20
+     elif IS_MAC:
+         extension =3D '.dylib'
+@@ -372,4 +372,3 @@ def set_trace_to_threads(tracing_func, thread_idents=
=3DNone, create_dummy_thread=3DT
+                     ret =3D result
+=20
+     return ret
+-
diff --git a/meta-python/recipes-devtools/python/python3-debugpy_1.6.0.bb=
 b/meta-python/recipes-devtools/python/python3-debugpy_1.6.0.bb
new file mode 100644
index 000000000..1fe238169
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-debugpy_1.6.0.bb
@@ -0,0 +1,40 @@
+SUMMARY =3D "An implementation of the Debug Adapter Protocol for Python =
3"
+LICENSE =3D "MIT & EPL-1.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D18496e0e5a38c5caaade8503120ef=
9ea \
+                    file://src/debugpy/_vendored/pydevd/LICENSE;md5=3D30=
b3836521b3d65bef598bbc358a3afa \
+                    file://src/debugpy/_vendored/pydevd/_pydevd_frame_ev=
al/vendored/bytecode-0.13.0.dev0.dist-info/COPYING;md5=3D0b470642172a83f6=
cf504fba28bac72f"
+SRCREV =3D "2ac9538dd5d59d0bb582d445e4a6b87663cfbab4"
+
+SRC_URI =3D "git://git@github.com/microsoft/debugpy.git;protocol=3Dssh;b=
ranch=3Dmain \
+           file://0001-arch-use-generic-yocto-architecture-suffix.patch =
\
+           "
+
+S =3D "${WORKDIR}/git"
+
+inherit setuptools3
+
+EXTRA_CXXFLAGS +=3D "-fPIC -nostartfiles"
+
+do_compile:append() {
+    ${CC} -o ${S}/src/debugpy/_vendored/pydevd/attach_linux_yocto.so ${S=
}/src/debugpy/_vendored/pydevd/pydevd_attach_to_process/linux_and_mac/att=
ach.cpp ${CXXFLAGS} ${EXTRA_CXXFLAGS} ${LDFLAGS} -shared
+}
+do_install:append() {
+    install -m 0755 ${S}/src/debugpy/_vendored/pydevd/attach_linux_yocto=
.so ${D}${libdir}/${PYTHON_DIR}/site-packages/debugpy/_vendored/pydevd/py=
devd_attach_to_process/
+}
+
+RDEPENDS:${PN}:append =3D " \
+    gdb \
+    python3-core \
+    python3-ctypes \
+    python3-distutils \
+    python3-io \
+    python3-json \
+    python3-math \
+    python3-misc \
+    python3-multiprocessing \
+    python3-numbers \
+    python3-pickle \
+    python3-setuptools \
+    python3-unixadmin \
+    python3-xmlrpc \
+"
--=20
2.25.1


