Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5DDC878082
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jun 2017 12:09:07 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f90so12322423wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jun 2017 05:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UwPEiPYiDxg3uulavLxD4nZYOh0tu19Wol5Qx9ja0Uc=;
	b=bmc5uM48kj80HMul8kBxhlX+mmAS7bLP4sxoI++G4gMgszXvTHNvKuWYb8Ci6WyEtB
	CYAXkDw1FosnakLQ7WdCEowEdKqs8Pe6CDnMlPk9NKPpkqyJp9KcbeIDv4aIGcQH4/AK
	TO1mSvanefhI7e0hz3KP4/zftPiLC20tJE+rvRN1gPPcYuXX+LTyAtJcqG0feoqlpxjq
	PDhlyXUG5UaRSNNOX4vcFiWVtTtSZQ+Tb0XtcAhixOd/sdaMJKpG+2TIpPud+yZm75Sp
	uzhB/XwMhE2y2lVbO9sfpcxx3NDoszzYw1w6BE31IHATcW1+XS2t+cw22tb9WW3Sx99t
	hTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UwPEiPYiDxg3uulavLxD4nZYOh0tu19Wol5Qx9ja0Uc=;
	b=BRA+3YxBj2Lr8mQ4tjVhCfuw+QTY8LbRcrdQ/7PnVyWrmdbTJC8J8opiPAsGRlTBLI
	x0WPpAwyo37QSp/mUlGVaqqeNKyXYCnNcFd6bT7uKzJj6nezyBi8R/0dse2cMkzgBCvM
	OmjNq/5CIOS5j9sxob3CSrrzNNRoSwRTC36+bQAmgyoP6BB4eHw2h8akX/fJnLWf3TVs
	DYj/2+4LpZ610sEST2uHWh7fRWfEx0Id+JJvVyFe+MpP3J8p5+zLlbfDmKgyRJLfZhEG
	M29FIJNcfm6JLKycuh1hJqoqH97HfkbFjT8zR4uACAsI/OSt9t3Sx047sfvKe33ksLp4
	3yxg==
X-Gm-Message-State: AKS2vOyi3sFGO+VO+yX8vdykSaTGlvagm8g4JSo/efc552HvPLtKBd1T
	5yshqPb+rxdl68y7
X-Received: by 10.28.4.145 with SMTP id 139mr12818961wme.118.1497787748267;
	Sun, 18 Jun 2017 05:09:08 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 92sm3078487wrb.55.2017.06.18.05.09.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Jun 2017 05:09:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Jun 2017 14:09:09 +0200
Message-Id: <20170618120909.3499-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170618120909.3499-1-Martin.Jansa@gmail.com>
References: <CA+chaQdyLDc38rC-geZay6JO_QcsUZn0ZUJPVzqWXcO-wxP2ww@mail.gmail.com>
	<20170618120909.3499-1-Martin.Jansa@gmail.com>
Subject: [meta-browser][PATCHv3 2/2] firefox: fix build with gcc7
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
X-List-Received-Date: Sun, 18 Jun 2017 12:09:08 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-mozilla/firefox/firefox/gcc7.patch   | 259 +++++++++++++++++++++++++++
 recipes-mozilla/firefox/firefox_45.9.0esr.bb |   3 +-
 2 files changed, 261 insertions(+), 1 deletion(-)
 create mode 100644 recipes-mozilla/firefox/firefox/gcc7.patch

diff --git a/recipes-mozilla/firefox/firefox/gcc7.patch b/recipes-mozilla/firefox/firefox/gcc7.patch
new file mode 100644
index 0000000..2c2b52d
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/gcc7.patch
@@ -0,0 +1,259 @@
+
+# HG changeset patch
+# User Mike Hommey <mh+mozilla@glandium.org>
+# Date 1463557039 -32400
+# Node ID 68da139d0866977c0ada86319fa94388f2255446
+# Parent  a640e6fa8ab9977fb6c5bcf63dc4daca6699477b
+Bug 1269171 - Change how mozalloc.h is hooked in STL wrappers. r=froydnj
+
+Since the introduction of the STL wrappers, they have included
+mozalloc.h, and multiple times, we've hit header reentrancy problems,
+and worked around them as best as we could.
+
+Taking a step back, all mozalloc.h does is:
+- declare moz_* allocator functions.
+- define inline implementations of various operator new/delete variants.
+
+The first only requires the functions to be declared before they are used,
+so mozalloc.h only needs to be included before anything that would use
+those functions.
+
+The second doesn't actually require a specific order, as long as the
+declaration for those functions comes before their use, and they are
+either declared in <new> or implicitly by the C++ compiler.
+
+So all in all, it doesn't matter that mozalloc.h is included before the
+wrapped STL headers. What matters is that it's included when STL headers
+are included. So arrange things such that mozalloc.h is included after
+the first wrapped STL header is fully preprocessed (and all its includes
+have been included).
+
+
+diff --git a/config/gcc-stl-wrapper.template.h b/config/gcc-stl-wrapper.template.h
+--- a/config/gcc-stl-wrapper.template.h
++++ b/config/gcc-stl-wrapper.template.h
+@@ -12,56 +12,54 @@
+ // compiling ObjC.
+ #if defined(__EXCEPTIONS) && __EXCEPTIONS && !(__OBJC__ && __GNUC__ && XP_IOS)
+ #  error "STL code can only be used with -fno-exceptions"
+ #endif
+ 
+ // Silence "warning: #include_next is a GCC extension"
+ #pragma GCC system_header
+ 
+-// Don't include mozalloc for cstdlib. See bug 1245076.
+-#ifndef moz_dont_include_mozalloc_for_cstdlib
+-#  define moz_dont_include_mozalloc_for_cstdlib
+-#endif
+-#ifndef moz_dont_include_mozalloc_for_${HEADER}
+-// mozalloc.h wants <new>; break the cycle by always explicitly
+-// including <new> here.  NB: this is a tad sneaky.  Sez the gcc docs:
+-//
+-//    `#include_next' does not distinguish between <file> and "file"
+-//    inclusion, nor does it check that the file you specify has the
+-//    same name as the current file. It simply looks for the file
+-//    named, starting with the directory in the search path after the
+-//    one where the current file was found.
+-#  include_next <new>
+-
+-// See if we're in code that can use mozalloc.  NB: this duplicates
+-// code in nscore.h because nscore.h pulls in prtypes.h, and chromium
+-// can't build with that being included before base/basictypes.h.
+-#  if !defined(XPCOM_GLUE) && !defined(NS_NO_XPCOM) && !defined(MOZ_NO_MOZALLOC)
+-#    include "mozilla/mozalloc.h"
+-#  else
+-#    error "STL code can only be used with infallible ::operator new()"
+-#  endif
+-
+-#endif
+-
+ #if defined(DEBUG) && !defined(_GLIBCXX_DEBUG)
+ // Enable checked iterators and other goodies
+ //
+ // FIXME/bug 551254: gcc's debug STL implementation requires -frtti.
+ // Figure out how to resolve this with -fno-rtti.  Maybe build with
+ // -frtti in DEBUG builds?
+ //
+ //  # define _GLIBCXX_DEBUG 1
+ #endif
+ 
++// Don't include mozalloc for cstdlib. See bug 1245076.
++#ifndef moz_dont_include_mozalloc_for_cstdlib
++#  define moz_dont_include_mozalloc_for_cstdlib
++#endif
++
++// Include mozalloc after the STL header and all other headers it includes
++// have been preprocessed.
++#if !defined(MOZ_INCLUDE_MOZALLOC_H) && \
++    !defined(moz_dont_include_mozalloc_for_${HEADER})
++#  define MOZ_INCLUDE_MOZALLOC_H
++#  define MOZ_INCLUDE_MOZALLOC_H_FROM_${HEADER}
++#endif
++
+ #pragma GCC visibility push(default)
+ #include_next <${HEADER}>
+ #pragma GCC visibility pop
+ 
++#ifdef MOZ_INCLUDE_MOZALLOC_H_FROM_${HEADER}
++// See if we're in code that can use mozalloc.  NB: this duplicates
++// code in nscore.h because nscore.h pulls in prtypes.h, and chromium
++// can't build with that being included before base/basictypes.h.
++#  if !defined(XPCOM_GLUE) && !defined(NS_NO_XPCOM) && !defined(MOZ_NO_MOZALLOC)
++#    include "mozilla/mozalloc.h"
++#  else
++#    error "STL code can only be used with infallible ::operator new()"
++#  endif
++#endif
++
+ // gcc calls a __throw_*() function from bits/functexcept.h when it
+ // wants to "throw an exception".  functexcept exists nominally to
+ // support -fno-exceptions, but since we'll always use the system
+ // libstdc++, and it's compiled with exceptions, then in practice
+ // these __throw_*() functions will always throw exceptions (shades of
+ // -fshort-wchar).  We don't want that and so define our own inlined
+ // __throw_*().
+ #ifndef mozilla_throw_gcc_h
+diff --git a/config/make-stl-wrappers.py b/config/make-stl-wrappers.py
+--- a/config/make-stl-wrappers.py
++++ b/config/make-stl-wrappers.py
+@@ -25,28 +25,26 @@ def header_path(header, compiler):
+ def is_comment(line):
+     return re.match(r'\s*#.*', line)
+ 
+ def main(outdir, compiler, template_file, header_list_file):
+     if not os.path.isdir(outdir):
+         os.mkdir(outdir)
+ 
+     template = open(template_file, 'r').read()
+-    path_to_new = header_path('new', compiler)
+ 
+     for header in open(header_list_file, 'r'):
+         header = header.rstrip()
+         if 0 == len(header) or is_comment(header):
+             continue
+ 
+         path = header_path(header, compiler)
+         with FileAvoidWrite(os.path.join(outdir, header)) as f:
+             f.write(string.Template(template).substitute(HEADER=header,
+-                                                         HEADER_PATH=path,
+-                                                         NEW_HEADER_PATH=path_to_new))
++                                                         HEADER_PATH=path))
+ 
+ 
+ if __name__ == '__main__':
+     if 5 != len(sys.argv):
+         print("""Usage:
+   python {0} OUT_DIR ('msvc'|'gcc') TEMPLATE_FILE HEADER_LIST_FILE
+ """.format(sys.argv[0]), file=sys.stderr)
+         sys.exit(1)
+diff --git a/config/msvc-stl-wrapper.template.h b/config/msvc-stl-wrapper.template.h
+--- a/config/msvc-stl-wrapper.template.h
++++ b/config/msvc-stl-wrapper.template.h
+@@ -3,45 +3,33 @@
+  */
+ /* This Source Code Form is subject to the terms of the Mozilla Public
+  * License, v. 2.0. If a copy of the MPL was not distributed with this
+  * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
+ 
+ #ifndef mozilla_${HEADER}_h
+ #define mozilla_${HEADER}_h
+ 
+-#ifndef MOZ_HAVE_INCLUDED_ALLOC
+-#define MOZ_HAVE_INCLUDED_ALLOC
+-
+ #if _HAS_EXCEPTIONS
+ #  error "STL code can only be used with -fno-exceptions"
+ #endif
+ 
++// Include mozalloc after the STL header and all other headers it includes
++// have been preprocessed.
++#if !defined(MOZ_INCLUDE_MOZALLOC_H)
++#  define MOZ_INCLUDE_MOZALLOC_H
++#  define MOZ_INCLUDE_MOZALLOC_H_FROM_${HEADER}
++#endif
++
+ // Code built with !_HAS_EXCEPTIONS calls std::_Throw(), but the win2k
+ // CRT doesn't export std::_Throw().  So we define it.
+ #ifndef mozilla_Throw_h
+ #  include "mozilla/throw_msvc.h"
+ #endif
+ 
+-// Code might include <new> before other wrapped headers, but <new>
+-// includes <exception> and so we want to wrap it.  But mozalloc.h
+-// wants <new> also, so we break the cycle by always explicitly
+-// including <new> here.
+-#include <${NEW_HEADER_PATH}>
+-
+-// See if we're in code that can use mozalloc.  NB: this duplicates
+-// code in nscore.h because nscore.h pulls in prtypes.h, and chromium
+-// can't build with that being included before base/basictypes.h.
+-#if !defined(XPCOM_GLUE) && !defined(NS_NO_XPCOM) && !defined(MOZ_NO_MOZALLOC)
+-#  include "mozilla/mozalloc.h"
+-#else
+-#  error "STL code can only be used with infallible ::operator new()"
+-#endif
+-#endif /* MOZ_HAVE_INCLUDED_ALLOC */
+-
+ #ifdef _DEBUG
+ // From
+ //   http://msdn.microsoft.com/en-us/library/aa985982%28VS.80%29.aspx
+ // and
+ //   http://msdn.microsoft.com/en-us/library/aa985965%28VS.80%29.aspx
+ // there appear to be two types of STL container checking.  The
+ // former is enabled by -D_DEBUG (which is implied by -MDd or -MTd), and
+ // looks to be full generation/mutation checked iterators as done by
+@@ -70,9 +58,20 @@
+ //        but that's OK because we're not throwing them.
+ #pragma warning( push )
+ #pragma warning( disable : 4275 4530 )
+ 
+ #include <${HEADER_PATH}>
+ 
+ #pragma warning( pop )
+ 
++#ifdef MOZ_INCLUDE_MOZALLOC_H_FROM_${HEADER}
++// See if we're in code that can use mozalloc.  NB: this duplicates
++// code in nscore.h because nscore.h pulls in prtypes.h, and chromium
++// can't build with that being included before base/basictypes.h.
++#  if !defined(XPCOM_GLUE) && !defined(NS_NO_XPCOM) && !defined(MOZ_NO_MOZALLOC)
++#    include "mozilla/mozalloc.h"
++#  else
++#    error "STL code can only be used with infallible ::operator new()"
++#  endif
++#endif
++
+ #endif  // if mozilla_${HEADER}_h
+diff --git a/memory/mozalloc/mozalloc.h b/memory/mozalloc/mozalloc.h
+--- a/memory/mozalloc/mozalloc.h
++++ b/memory/mozalloc/mozalloc.h
+@@ -7,20 +7,27 @@
+ 
+ #ifndef mozilla_mozalloc_h
+ #define mozilla_mozalloc_h
+ 
+ /*
+  * https://bugzilla.mozilla.org/show_bug.cgi?id=427099
+  */
+ 
+-#include <stdlib.h>
+-#include <string.h>
+ #if defined(__cplusplus)
+ #  include <new>
++// Since libstdc++ 6, including the C headers (e.g. stdlib.h) instead of the
++// corresponding C++ header (e.g. cstdlib) can cause confusion in C++ code
++// using things defined there. Specifically, with stdlib.h, the use of abs()
++// in gfx/graphite2/src/inc/UtfCodec.h somehow ends up picking the wrong abs()
++#  include <cstdlib>
++#  include <cstring>
++#else
++#  include <stdlib.h>
++#  include <string.h>
+ #endif
+ 
+ #if defined(__cplusplus)
+ #include "mozilla/fallible.h"
+ #include "mozilla/TemplateLib.h"
+ #endif
+ #include "mozilla/Attributes.h"
+ #include "mozilla/Types.h"
+
diff --git a/recipes-mozilla/firefox/firefox_45.9.0esr.bb b/recipes-mozilla/firefox/firefox_45.9.0esr.bb
index 31baf79..54d1713 100644
--- a/recipes-mozilla/firefox/firefox_45.9.0esr.bb
+++ b/recipes-mozilla/firefox/firefox_45.9.0esr.bb
@@ -42,7 +42,8 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox
            file://0001-use-pkg-config-to-find-nss.patch \
            file://0002-use-pkg-config-to-find-nspr.patch \
            file://0003-do-not-link-against-crmf-library-it-is-not-there.patch \
-           "
+           file://gcc7.patch \
+"
 
 SRC_URI[archive.md5sum] = "f4d83c5150fc5085db20d71862497eb8"
 SRC_URI[archive.sha256sum] = "2afb02029e115fae65dbe1d9c562cbfeb761a6807338bbd30dbffba616cb2d20"
-- 
2.13.1


