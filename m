Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0F52D7F574
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2019 09:33:47 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id w6so9812762lfl.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2019 02:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-language;
	bh=IPHyKiojjqO3HJk0OOpswMWVgdrT2JbwaXapYs/WcIE=;
	b=gFG9wLnF68c1Rhn7Ky3R8Y7XdABmdNo9F9l7RGRYrw3eCs6l7YKBZBiWgh74V3ev0J
	k7PoQDn/T7/yOOpX3Mazh8fdA4imPh5uV4pEJnDOzgzEVoql4naYOC6Ti98lROTZdhDV
	kmXb5W3fZPbBMFJr35ktJiSmvjqZ7XZQg90cE952qyLSUh9UuSl/MvXOuuuSNipF6+Ia
	K5ZlGhc26R/EH7LlSxIBhsBck3RTExDPPAOu4pES0mfjICeBKbg1jnMjEQiB/rTWhZYp
	Qd6dSE2itIaWje2zH/Mb9Nct3LAmoWD4HV+I0BcDb6jwXXuewbACIcz+8pWjd3QfP3m4
	eN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language;
	bh=IPHyKiojjqO3HJk0OOpswMWVgdrT2JbwaXapYs/WcIE=;
	b=eV9ApcvmCGoN5bfM2FWnjkEEJN0WiBbQrK4AxAFYTM/CnZlj/lLSS+fKpjxCDAjuEm
	ddt4d8uAAmg7VkPknhFkQ2Php6dod/mUJTK8bsK8VvWZxMy7+UJyV+PvLEjgKnEFrfl+
	LnOj9c9YmXPMirGvfPhuMQcjHqN+wQGa1I8Q4mAqve3DFC8DgBqI5MhbFPvDiJtzXvjU
	TaCieF4dME/G5TeYxWh8ktthMVXUrutiPN0ns1UM3HjpZzYyhX53/YraNzup0MrMzzV0
	HttNuT0Ue+Lc9Hb5jZaY7EZ2nB9IRsEv8nySw32adwY87KCqmkGine6afjAj3YD8/m4Y
	mV7g==
X-Gm-Message-State: APjAAAX5h5O1foz6Bty40qVKCFmTIBOODBEWlQKkGkz6wB5Aa94NrAWj
	4XZ3cu0tOZTdzaYyBBKKE2UyG+FKenA=
X-Google-Smtp-Source: APXvYqyizRNSF56YZ91iwrD1lR+nGdyBx6/cqJyiBspkyo4OPFd8XyIUdcEH5WiPT82XvBHZe2fmRg==
X-Received: by 2002:ac2:47f1:: with SMTP id b17mr12740274lfp.31.1570959228050; 
	Sun, 13 Oct 2019 02:33:48 -0700 (PDT)
Received: from [192.168.10.117] (37-247-29-68.customers.ownit.se.
	[37.247.29.68])
	by smtp.gmail.com with ESMTPSA id z2sm3691447ljz.72.2019.10.13.02.33.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 13 Oct 2019 02:33:47 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <04a167ee-e63d-c4a3-7808-26ef5e9ed884@gmail.com>
Date: Sun, 13 Oct 2019 11:33:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.0
MIME-Version: 1.0
Subject: [meta-java] openjre-8: java from master/master-next crashes on startup
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
X-List-Received-Date: Sun, 13 Oct 2019 09:33:48 -0000
X-Groupsio-MsgNum: 80118
Content-Type: multipart/mixed; boundary="------------4555E3C1F8DB68E3CE277916"
Content-Language: en-US

--------------4555E3C1F8DB68E3CE277916
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

For me, this has been the status for quite a while now. First of all, 
openjre-8 from master/master-next doesn't build on my Fedora 30 box, 
I've been using the patch attached to this mail to get it to build.
   Secondly, java always crashes on startup here:

> #0  Node::Node (this=0x805fa88, req=3)
>     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/node.cpp:327
> #1  0xb7499b63 in RegionNode::RegionNode (required=3, this=0x805fa88)
>     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/cfgnode.hpp:73
> #2  LoopNode::LoopNode (backedge=0x0, entry=0x0, this=0x805fa88)
>     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/loopnode.hpp:88
> #3  RootNode::RootNode (this=0x805fa88)
>     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/rootnode.hpp:37
> #4  Compile::Init (this=0x977feaf8, aliaslevel=0)
>     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/compile.cpp:1079
> #5  0xb74a02c5 in Compile::Compile (this=0x977feaf8, ci_env=0x977ff188, 
>     generator=0xb7895270 <OptoRuntime::new_instance_Type()>, 
>     stub_function=0xb7897070 <OptoRuntime::new_instance_C(Klass*, JavaThread*)> "U\211\345WVS\350\245+\237\377\201\303\205\217\062", 
>     stub_name=0xb7a0a62f "_new_instance_Java", is_fancy_jump=0, pass_tls=true, 
>     save_arg_registers=false, return_pc=false)
>     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/compile.cpp:1012
> #6  0xb789587b in OptoRuntime::generate_stub (env=0x977ff188, 
>     gen=0xb7895270 <OptoRuntime::new_instance_Type()>, 
>     C_function=0xb7897070 <OptoRuntime::new_instance_C(Klass*, JavaThread*)> "U\211\345WVS\350\245+\237\377\201\303\205\217\062", name=0xb7a0a62f "_new_instance_Java", 
>     is_fancy_jump=0, pass_tls=true, save_argument_registers=false, return_pc=false)
>     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/runtime.cpp:181
> #7  0xb7895a5f in OptoRuntime::generate (env=0x977ff188)
>     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/runtime.cpp:147
> #8  0xb7417de9 in C2Compiler::init_c2_runtime ()
>     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/runtime/thread.hpp:1854
> #9  0xb7417e35 in C2Compiler::initialize (this=0xb706b180)
>     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/c2compiler.cpp:102
> #10 0xb74a508c in CompileBroker::init_compiler_runtime ()
>     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/compiler/compileBroker.cpp:1674
> #11 0xb74ab6ed in CompileBroker::compiler_thread_loop ()
>     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/compiler/compileBroker.cpp:1772
> #12 0xb79238d5 in compiler_thread_entry (thread=0xb7079400, __the_thread__=0xb7079400)
>     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/runtime/thread.cpp:3230
> #13 0xb792d782 in JavaThread::thread_main_inner (this=0xb7079400)
>     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/runtime/thread.hpp:1035
> #14 0xb7820ce4 in java_start (thread=0xb7079400)
>     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/os/linux/vm/os_linux.cpp:790
> #15 0x4121244c in start_thread (arg=<optimized out>) at pthread_create.c:479
> #16 0x4113bd56 in clone () at ../sysdeps/unix/sysv/linux/i386/clone.S:108

The Node::Node() constructor uses an IDX_INIT() macro:

> #define IDX_INIT(req) this->Init((req), (Compile*) this->_out)

and Node::Init() does:

> 297     inline int Node::Init(int req, Compile* C) {
> 298	  assert(Compile::current() == C, "must use operator new(Compile*)");
> 299	  int idx = C->next_unique();

and here, this->_out = C = null, which I think leads to a segfault on 
line 299.
   I've tried looking at upstream jdk8u but can't find anything. Does 
anyone have an idea of whats going on here, or if I should raise the 
issue to openjdk ml ?

Cheers,
Jacob

--------------4555E3C1F8DB68E3CE277916
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-Fix-build.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-Fix-build.patch"

From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
Date: Fri, 2 Aug 2019 15:59:52 +0200
Subject: [PATCH] Fix build

---
 recipes-core/icedtea/icedtea7-native.inc      |  2 ++
 .../icedtea/openjdk-7-03b147/fix-build.patch  | 22 +++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/fix-build.patch

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index b578cb2..522244e 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -49,6 +49,7 @@ SRC_URI = " \
   file://timezoneszip.patch \
   file://sigsegv.patch;apply=no \
   file://vframeArray_Fix_sigsegv.patch;apply=no \
+  file://fix-build.patch;apply=no \
   "
 
 S = "${WORKDIR}/${ICEDTEA}"
@@ -161,6 +162,7 @@ do_configure_append() {
 	patch -p1 < ${WORKDIR}/jaxws_fix_NullPointerException.patch
 	patch -p1 < ${WORKDIR}/sigsegv.patch
 	patch -p1 < ${WORKDIR}/vframeArray_Fix_sigsegv.patch
+	patch -p1 < ${WORKDIR}/fix-build.patch
 }
 
 EXTRA_OEMAKE = ' \
diff --git a/recipes-core/icedtea/openjdk-7-03b147/fix-build.patch b/recipes-core/icedtea/openjdk-7-03b147/fix-build.patch
new file mode 100644
index 0000000..671173a
--- /dev/null
+++ b/recipes-core/icedtea/openjdk-7-03b147/fix-build.patch
@@ -0,0 +1,22 @@
+--- a/openjdk-boot/hotspot/src/share/vm/code/relocInfo.hpp
++++ b/openjdk-boot/hotspot/src/share/vm/code/relocInfo.hpp
+@@ -371,7 +371,7 @@ class relocInfo VALUE_OBJ_CLASS_SPEC {
+   // "immediate" in the prefix header word itself.  This optimization
+   // is invisible outside this module.)
+ 
+-  inline friend relocInfo prefix_relocInfo(int datalen = 0);
++  inline friend relocInfo prefix_relocInfo(int datalen);
+ 
+  protected:
+   // an immediate relocInfo optimizes a prefix with one 10-bit unsigned value
+--- a/openjdk/hotspot/src/share/vm/code/relocInfo.hpp
++++ b/openjdk/hotspot/src/share/vm/code/relocInfo.hpp
+@@ -371,7 +371,7 @@ class relocInfo VALUE_OBJ_CLASS_SPEC {
+   // "immediate" in the prefix header word itself.  This optimization
+   // is invisible outside this module.)
+ 
+-  inline friend relocInfo prefix_relocInfo(int datalen = 0);
++  inline friend relocInfo prefix_relocInfo(int datalen);
+ 
+  protected:
+   // an immediate relocInfo optimizes a prefix with one 10-bit unsigned value

--------------4555E3C1F8DB68E3CE277916--
