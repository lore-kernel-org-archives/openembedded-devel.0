Return-Path: <attie.grande@argentum-systems.co.uk>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id BB2256D749
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2018 13:10:32 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id h50so4806330ede.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2018 05:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=argentum-systems-co-uk.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=ZQsajDgd8n/c0YJT+m2e4qE4WzdZlrlyT5k7YrVcePE=;
	b=eN5b3YWttjIShdvjEWguJpSqJecQ7iBJghlup4xwtfe7pFkEGM1IDa7E9kpPKwuubN
	jnUtLHItD2I5VmRzXyyfhgZU+joXl7oUOoFhiiAPqK06NFDsvd2WDue1rSihLApglLxW
	Aqr5raNTg3S4on5/QS7XEIgKrefEUaWbRv03t9JaVtKBKyQUOCSpOJvuLN8jekR+uXMv
	mc5enAOG+6Ea4Tensbowxq3BiuKgHLJ2a//1mYpZxq8eE9lZH1tgZ1TKYK5QdJjFDiwC
	aggNMphvmyP38Dq/gjdPsQscFQ6tsU8fKhpt5tTrAMYmn8VwuiUg0oi1yF4q+Ozzjc94
	FpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ZQsajDgd8n/c0YJT+m2e4qE4WzdZlrlyT5k7YrVcePE=;
	b=gag3uovDQlXh2bmjWXcZpALetM7TrHFfFdZXIbM/5xjRcvHhOfyfPLMN/R+9111KYt
	niOGlI83FE8US0pl/RMlRhqLKydcVjiWMchDt+sMrhowljFtaUG65CY3VKgSylWUh9nM
	m5x5qn4QbLMLxIlBsTdL+1xsQ07omil24GkLnBrYDn8GjpzpobsuDN89KoWKggoC5/2A
	sxoLVFvQs8k8AuGujRRlOXrZGyTbF/EWE03OLii4eg/+9Tsf0mjt2YZAqfhNfBYxlbEn
	I7Men77ekLAxeEgdQQksUoNlAQfp005iji93imUOJ3tVG+309swOy2gaZdIPcbAezpnG
	mXIg==
X-Gm-Message-State: AA+aEWb1aJ7cGhH24ILWK7DjLCfv5N7DZ9HzkazFe0qh7H5DZ5WH5SPz
	dg6uDg7ytsRHLc5EQZ6QiU2i1OtgVCVjPoBttPFoeNFvxPQ=
X-Google-Smtp-Source: AFSGD/XmnLUpAuaYXA88OJky2MJfj2V4qubW3PFqthfI6UZrDwgioZESfZ3SjWqgXJ2Viz8JdTQb3sr/iyU4qGasvMk=
X-Received: by 2002:a50:9b1d:: with SMTP id o29mr4959004edi.246.1543583433153; 
	Fri, 30 Nov 2018 05:10:33 -0800 (PST)
MIME-Version: 1.0
From: Attie Grande <attie.grande@argentum-systems.co.uk>
Date: Fri, 30 Nov 2018 13:10:23 +0000
Message-ID: <CAAsqSTcN2Bkk_k_MLEWSTesEFEJURrXvHdyY2TzuA_fEh4iJUw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-java][PATCH 2/2] openjdk-8: better interface invocations
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
X-List-Received-Date: Fri, 30 Nov 2018 13:10:33 -0000
Content-Type: text/plain; charset="UTF-8"

Fixes a SEGFAULT when OpenJDK 8 is build for an i.MX6 platform, possibly
others.

The original patch (below) has been modified to work with jdk8.

Further information:
  https://bugs.openjdk.java.net/browse/JDK-8194739
  http://hg.openjdk.java.net/jdk/jdk10/rev/69d1a1590485

Signed-off-by: Attie Grande <attie.grande@argentum-systems.co.uk>
---
 recipes-core/openjdk/openjdk-8-release-16xbyy.inc  |  1 +
 .../JDK-8194739-better-interface-invocations.patch | 62 ++++++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644
recipes-core/openjdk/patches-openjdk-8/JDK-8194739-better-interface-invocations.patch

diff --git a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
index 23c99fe..b7cdede 100644
--- a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
+++ b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
@@ -17,6 +17,7 @@ PATCHES_URI = "\
     file://0009-jdk-disable-backtrace-musl-build-fix.patch \
     file://0010-build-fix-build-on-as-needed-toolchains-generic.patch \
     file://JDK-8202600-undefined-behaviour-in-os_linux_zero.cpp.patch \
+    file://JDK-8194739-better-interface-invocations.patch \
 "
 # some patches extracted from
http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.patch
 # reported via
http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
diff --git a/recipes-core/openjdk/patches-openjdk-8/JDK-8194739-better-interface-invocations.patch
b/recipes-core/openjdk/patches-openjdk-8/JDK-8194739-better-interface-invocations.patch
new file mode 100644
index 0000000..a185dac
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/JDK-8194739-better-interface-invocations.patch
@@ -0,0 +1,62 @@
+--- a/hotspot/src/cpu/zero/vm/methodHandles_zero.cpp Tue Dec 19
17:31:53 2017 -0500
++++ b/hotspot/src/cpu/zero/vm/methodHandles_zero.cpp Mon Jan 22
15:19:02 2018 +0000
+@@ -180,3 +180,9 @@
+     return NULL;
+   }
+ }
++
++#ifndef PRODUCT
++void MethodHandles::trace_method_handle(MacroAssembler* _masm, const
char* adaptername) {
++  // This is just a stub.
++}
++#endif //PRODUCT
+--- a/hotspot/src/share/vm/interpreter/bytecodeInterpreter.cpp Tue
Dec 19 17:31:53 2017 -0500
++++ b/hotspot/src/share/vm/interpreter/bytecodeInterpreter.cpp Mon
Jan 22 15:19:02 2018 +0000
+@@ -2569,13 +2569,35 @@
+
+         // this could definitely be cleaned up QQQ
+         Method* callee;
+-        Klass* iclass = cache->f1_as_klass();
+-        // InstanceKlass* interface = (InstanceKlass*) iclass;
++        Method *interface_method = cache->f2_as_interface_method();
++        InstanceKlass* iclass = interface_method->method_holder();
++
+         // get receiver
+         int parms = cache->parameter_size();
+         oop rcvr = STACK_OBJECT(-parms);
+         CHECK_NULL(rcvr);
+         InstanceKlass* int2 = (InstanceKlass*) rcvr->klass();
++
++        // Receiver subtype check against resolved interface klass (REFC).
++        {
++          Klass* refc = cache->f1_as_klass();
++          itableOffsetEntry* scan;
++          for (scan = (itableOffsetEntry*) int2->start_of_itable();
++               scan->interface_klass() != NULL;
++               scan++) {
++            if (scan->interface_klass() == refc) {
++              break;
++            }
++          }
++          // Check that the entry is non-null.  A null entry means
++          // that the receiver class doesn't implement the
++          // interface, and wasn't the same as when the caller was
++          // compiled.
++          if (scan->interface_klass() == NULL) {
++            VM_JAVA_ERROR(vmSymbols::java_lang_IncompatibleClassChangeError(),
"", note_no_trap);
++          }
++        }
++
+         itableOffsetEntry* ki = (itableOffsetEntry*) int2->start_of_itable();
+         int i;
+         for ( i = 0 ; i < int2->itable_length() ; i++, ki++ ) {
+@@ -2587,7 +2608,8 @@
+         if (i == int2->itable_length()) {
+           VM_JAVA_ERROR(vmSymbols::java_lang_IncompatibleClassChangeError(),
"", note_no_trap);
+         }
+-        int mindex = cache->f2_as_index();
++        int mindex = interface_method->itable_index();
++
+         itableMethodEntry* im = ki->first_method_entry(rcvr->klass());
+         callee = im[mindex].method();
+         if (callee == NULL) {
-- 
2.7.4

