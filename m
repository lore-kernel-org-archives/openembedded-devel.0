Return-Path: <bkylerussell@gmail.com>
Received: from mail-it1-f175.google.com (mail-it1-f175.google.com
	[209.85.166.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0F86A6BA93
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2019 21:38:11 +0000 (UTC)
Received: by mail-it1-f175.google.com with SMTP id c9so3519752itj.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2019 13:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xiDesw9Ja0lN1k/4bx0Bv11lunEyUElp23p7eW9mCDE=;
	b=Dybk84b8cSx0AJnroc7TI8TnS+K+f9RYdnV7xCknYLdTsjHkl3IBBlxoHfyCws6/D8
	bMvO3Xcco7C/7l/OB2L/pm4UYmBqZUG+iNUsQo/7lVs30V44mJ/KcnYmCZloyACbadNB
	12f/8VGOW+kyzk0HI1gH9iUi9mda01qEIkLFDWlgMJbC4+8Q5BClOTfQQXb2QhvPwjb4
	5aStIrnlmj91XquGzNqbdkFk4xrTZuTYCt19+gZ6YiV27i3Ej78SYx/qZBCg6Pb59w3N
	q4iWoZzGWdOElS+UxZ9RW+xpBp8GrUwGxLKVTrcr4s6SLr7O8Vh1p5G1Z0INnsKOP/mj
	uprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xiDesw9Ja0lN1k/4bx0Bv11lunEyUElp23p7eW9mCDE=;
	b=bOKWyrQlMhKb5JRchaErbjE0lk+So2lvoFTsoZn2fXIucYl+5aXUFgi7ad7se++IAS
	JXc/7fLVYMZfsQ81MrTzkllFRWBgWKOd/p2jIqCFnEsNGdVlWP05+wrVvm3+URxhGYHf
	TchJrYnVgDzVyGXR6+6wi+JHwpJLKk5ILK7GFcvDzsvPqWzXgc79Nr574X1XKo/csORj
	S049u1eE4anOtRy7ft1rEU67GwBRb0zMLFoLmyfR+ou3W0jxGnoiBQCcpX40l5yM9lim
	vxEDInyUetUIRsu+qQ5IWF815I1lBFTeDduMs6247p4IfKSh7uI4Fojz4v2z2xax444E
	wxrg==
X-Gm-Message-State: AHQUAuaGvwxx3+TqW/f+108zfBDvTwzZdep3GMa03T8oT/KE9iG/f8Ol
	FOCTiHXlhC07qq1TnSf0daDbGNtW
X-Google-Smtp-Source: AHgI3IZKi6UvkrlWMeEMsD1JhG5OTDzxvo4p1i4DT+bdAfeUFIz8XK6JhpjiAKKFtAK/790s0x4B8A==
X-Received: by 2002:a5d:930f:: with SMTP id l15mr865199ion.302.1549316292645; 
	Mon, 04 Feb 2019 13:38:12 -0800 (PST)
Received: from napoli.dhcp.lexmark.com ([192.146.101.90])
	by smtp.gmail.com with ESMTPSA id t5sm540084ioi.43.2019.02.04.13.38.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Feb 2019 13:38:11 -0800 (PST)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2019 16:37:50 -0500
Message-Id: <20190204213750.25914-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-java][sumo][PATCH] openjdk-8-16xbyy: port better interface invocation from aarch32
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
X-List-Received-Date: Mon, 04 Feb 2019 21:38:12 -0000
Content-Transfer-Encoding: 8bit

Fixes regression from new interface invocation implementation.  In one
crash, cache->f2_as_index() returns a Method* instead of an index into
the itable during static initialization of sun.reflect.Reflection when
attempting an invokeinterface on Map.put().

Upstream-Status: Backport
[OpenJDK: https://bugs.openjdk.java.net/browse/JDK-8194739]

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 .../openjdk/openjdk-8-release-16xbyy.inc      |  3 +
 ...arch32-interface-invocation-segv-fix.patch | 74 +++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-aarch32-interface-invocation-segv-fix.patch

diff --git a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
index bd4a349..cffc7c2 100644
--- a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
+++ b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
@@ -17,6 +17,9 @@ PATCHES_URI = "\
     file://0009-jdk-disable-backtrace-musl-build-fix.patch \
     file://0010-build-fix-build-on-as-needed-toolchains-generic.patch \
 "
+PATCHES_URI_append_class-target_arm = "\
+    file://openjdk8-aarch32-interface-invocation-segv-fix.patch;patchdir=${S}/hotspot \
+"
 # some patches extracted from http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.patch
 # reported via http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
 # by Roman Kennke (rkennke at redhat.com)
diff --git a/recipes-core/openjdk/patches-openjdk-8/openjdk8-aarch32-interface-invocation-segv-fix.patch b/recipes-core/openjdk/patches-openjdk-8/openjdk8-aarch32-interface-invocation-segv-fix.patch
new file mode 100644
index 0000000..249db17
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/openjdk8-aarch32-interface-invocation-segv-fix.patch
@@ -0,0 +1,74 @@
+
+# HG changeset patch
+# User aph
+# Date 1516634342 0
+# Node ID 56123fdca84a3b253b8ea6f72be85bd2ebf39fd0
+# Parent  1252eaaa2c8bc3493038e87483ac08ccadbbdf51
+8194739: Zero port of 8174962: Better interface invocations
+Reviewed-by: adinn, coleenp
+
+diff -r 1252eaaa2c8b -r 56123fdca84a src/cpu/zero/vm/methodHandles_zero.cpp
+--- a/src/cpu/zero/vm/methodHandles_zero.cpp	Thu Feb 22 21:28:07 2018 -0800
++++ b/src/cpu/zero/vm/methodHandles_zero.cpp	Mon Jan 22 15:19:02 2018 +0000
+@@ -180,3 +180,9 @@
+     return NULL;
+   }
+ }
++
++#ifndef PRODUCT
++void MethodHandles::trace_method_handle(MacroAssembler* _masm, const char* adaptername) {
++  // This is just a stub.
++}
++#endif //PRODUCT
+diff -r 1252eaaa2c8b -r 56123fdca84a src/share/vm/interpreter/bytecodeInterpreter.cpp
+--- a/src/share/vm/interpreter/bytecodeInterpreter.cpp	Thu Feb 22 21:28:07 2018 -0800
++++ b/src/share/vm/interpreter/bytecodeInterpreter.cpp	Mon Jan 22 15:19:02 2018 +0000
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
++            VM_JAVA_ERROR(vmSymbols::java_lang_IncompatibleClassChangeError(), "", note_no_trap);
++          }
++        }
++
+         itableOffsetEntry* ki = (itableOffsetEntry*) int2->start_of_itable();
+         int i;
+         for ( i = 0 ; i < int2->itable_length() ; i++, ki++ ) {
+@@ -2587,7 +2609,8 @@
+         if (i == int2->itable_length()) {
+           VM_JAVA_ERROR(vmSymbols::java_lang_IncompatibleClassChangeError(), "", note_no_trap);
+         }
+-        int mindex = cache->f2_as_index();
++        int mindex = interface_method->itable_index();
++
+         itableMethodEntry* im = ki->first_method_entry(rcvr->klass());
+         callee = im[mindex].method();
+         if (callee == NULL) {
+
-- 
2.20.1


