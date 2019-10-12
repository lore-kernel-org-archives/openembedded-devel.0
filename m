Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7B4CF7D391
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2019 06:01:52 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id j11so5457726plk.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 23:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zAOeEEqcotwLPBOrPWU7PB1cyDAOVyMKOrh8NTTC5Us=;
	b=Bk1yojX06BPyHX4XTT6u2CUr3ZwtbMZSKzbAeEKcLnh5QiK/pqXLcfckkiTSG2TZ0d
	Ah0/ruYhj9ixnBBLvs72QRRXV/8C9lA8GW8Q5dz51H5HPIo96rhoDpbHMXQP2XKBtNu4
	NmB7P2k8iLlQZy/99wimx9is25sQDB8T+9fC0wnuU0R+sUnYg1diY7hh7Bamjr+csBBL
	sT7iGJQmCQe03+GkmO/CaqeU7yqvDVgwhnAWK9hwcvxHe/xa7TA1y+lsABq+J4RkuWeO
	HCNpgdHMtpR+T6OHd30WdKZyUX8aV9t4JIP3E+iqX1mfT8thVcLG/dLeFNMOpN5xT768
	hWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zAOeEEqcotwLPBOrPWU7PB1cyDAOVyMKOrh8NTTC5Us=;
	b=RH5Ehb5E8w7kQSnVt80GT0+LD8qq2KKOyvAL/t5eBVZQOf+8TXCapY0Puuw4DOQToJ
	Fm32uCAFrlRbCRcWmUS9AyURuUnfVFSqxwechGEgDX3fhfRh3D6Q6xShe6XXPwyALFnK
	WBl6M0vqIMgdsMIiwTISOq4a7cab39uV7zmnOCieiIbOZPpcamBKkaj0a3lQiNbub3O3
	hRlStpL3kCyKp29JK69DaA43DZTpa+F38WPS6NnmYa+wWNQKJr848S4DQwd0tpU4QOm3
	uUZThnSoCRHvdAIbhNOEP0fTknadikL1w+UCRFcKzmTogTgqiUJu5h82bvVy9aCEqFUS
	MJ+g==
X-Gm-Message-State: APjAAAVSy1KW+F2tOlb36BwIFpsyX3fJjEL8W5sosadedAw2LnH7BWEC
	7fGl8Jesc6y24Fqaj3j2lxh48NAZvl8=
X-Google-Smtp-Source: APXvYqwnZqT9p8RBGgJBQC6IWVsKDZOlmt4EISKmiG2Zlaaqx/kmyLMaKOP7GmWZHTvayYruk4HWHg==
X-Received: by 2002:a17:902:6bc4:: with SMTP id
	m4mr19135973plt.103.1570860112724; 
	Fri, 11 Oct 2019 23:01:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id
	a11sm6653042pgw.64.2019.10.11.23.01.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 23:01:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Oct 2019 23:01:38 -0700
Message-Id: <20191012060138.854922-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] wvstreams, wvdial: Mark incompatible for musl
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
X-List-Received-Date: Sat, 12 Oct 2019 06:01:52 -0000
Content-Transfer-Encoding: 8bit

wvstreams needs porting work to get it fully functional on musl, wvdial
depends on it so that needs to be disabled as well for musl.

Add it to meta-oe packagegroup only when using glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../wvdial/wvdial_1.61.bb                     |   1 +
 ...nt-use-ucontext-on-non-glibc-systems.patch | 135 ------------------
 .../wvdial/wvstreams_4.6.1.bb                 |   3 +-
 .../packagegroups/packagegroup-meta-oe.bb     |   5 +-
 4 files changed, 6 insertions(+), 138 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/0002-wvtask-Dont-use-ucontext-on-non-glibc-systems.patch

diff --git a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
index 36580952f1..b985d39abf 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.bz2 \
 SRC_URI[md5sum] = "37e9a2d664effe4efd44c0e1a20136de"
 SRC_URI[sha256sum] = "99906d9560cbdbc97e1855e7b0a7169f1e11983be3ac539140423f09debced82"
 
+COMPATIBLE_HOST_libc-musl = "null"
 EXTRA_OEMAKE = ""
 export WVLINK="${LD}"
 
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/0002-wvtask-Dont-use-ucontext-on-non-glibc-systems.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/0002-wvtask-Dont-use-ucontext-on-non-glibc-systems.patch
deleted file mode 100644
index 232db9e63b..0000000000
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams/0002-wvtask-Dont-use-ucontext-on-non-glibc-systems.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From 0e054339c1422168a7f4a9dcf090268053a33b1f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 20 Jul 2017 21:05:37 -0700
-Subject: [PATCH 2/5] wvtask: Dont use ucontext on non-glibc systems
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- utils/wvtask.cc | 24 ++++++++++++++++++++++++
- 1 file changed, 24 insertions(+)
-
-diff --git a/utils/wvtask.cc b/utils/wvtask.cc
-index cdcd544..c0bff7d 100644
---- a/utils/wvtask.cc
-+++ b/utils/wvtask.cc
-@@ -199,7 +199,9 @@ WvTaskMan::WvTaskMan()
-     stacktop = (char *)alloca(0);
-     
-     context_return = 0;
-+#ifdef __GLIBC__
-     assert(getcontext(&get_stack_return) == 0);
-+#endif
-     if (context_return == 0)
-     {
- 	// initial setup - start the stackmaster() task (never returns!)
-@@ -265,13 +267,17 @@ int WvTaskMan::run(WvTask &task, int val)
- 	state = &old_task->mystate;
-     
-     context_return = 0;
-+#ifdef __GLIBC__
-     assert(getcontext(state) == 0);
-+#endif
-     int newval = context_return;
-     if (newval == 0)
-     {
- 	// saved the state, now run the task.
-         context_return = val;
-+#ifdef __GLIBC__
-         setcontext(&task.mystate);
-+#endif
-         return -1;
-     }
-     else
-@@ -319,13 +325,17 @@ int WvTaskMan::yield(int val)
- #endif
- 		
-     context_return = 0;
-+#ifdef __GLIBC__
-     assert(getcontext(&current_task->mystate) == 0);
-+#endif
-     int newval = context_return;
-     if (newval == 0)
-     {
- 	// saved the task state; now yield to the toplevel.
-         context_return = val;
-+#ifdef __GLIBC__
-         setcontext(&toplevel);
-+#endif
-         return -1;
-     }
-     else
-@@ -341,7 +351,9 @@ int WvTaskMan::yield(int val)
- void WvTaskMan::get_stack(WvTask &task, size_t size)
- {
-     context_return = 0;
-+#ifdef __GLIBC__
-     assert(getcontext(&get_stack_return) == 0);
-+#endif
-     if (context_return == 0)
-     {
- 	assert(magic_number == -WVTASK_MAGIC);
-@@ -371,7 +383,9 @@ void WvTaskMan::get_stack(WvTask &task, size_t size)
- 	// initial setup
- 	stack_target = &task;
- 	context_return = size/1024 + (size%1024 > 0);
-+#ifdef __GLIBC__
- 	setcontext(&stackmaster_task);
-+#endif
-     }
-     else
-     {
-@@ -409,7 +423,9 @@ void WvTaskMan::_stackmaster()
- 	assert(magic_number == -WVTASK_MAGIC);
- 	
-         context_return = 0;
-+#ifdef __GLIBC__
-         assert(getcontext(&stackmaster_task) == 0);
-+#endif
-         val = context_return;
- 	if (val == 0)
- 	{
-@@ -419,7 +435,9 @@ void WvTaskMan::_stackmaster()
- 	    // all current stack allocations) and go back to get_stack
- 	    // (or the constructor, if that's what called us)
-             context_return = 1;
-+#ifdef __GLIBC__
-             setcontext(&get_stack_return);
-+#endif
- 	}
- 	else
- 	{
-@@ -474,7 +492,9 @@ void WvTaskMan::do_task()
- 	
-     // back here from longjmp; someone wants stack space.    
-     context_return = 0;
-+#ifdef __GLIBC__
-     assert(getcontext(&task->mystate) == 0);
-+#endif
-     if (context_return == 0)
-     {
- 	// done the setjmp; that means the target task now has
-@@ -510,7 +530,9 @@ void WvTaskMan::do_task()
-                 }
-                 else
-                 {
-+#ifdef __GLIBC__
-                     assert(getcontext(&task->func_call) == 0);
-+#endif
-                     task->func_call.uc_stack.ss_size = task->stacksize;
-                     task->func_call.uc_stack.ss_sp = task->stack;
-                     task->func_call.uc_stack.ss_flags = 0;
-@@ -521,9 +543,11 @@ void WvTaskMan::do_task()
-                             (void (*)(void))call_func, 1, task);
- 
-                     context_return = 0;
-+#ifdef __GLIBC__
-                     assert(getcontext(&task->func_return) == 0);
-                     if (context_return == 0)
-                         setcontext(&task->func_call);
-+#endif
-                 }
- 		
- 		// the task's function terminated.
--- 
-2.13.3
-
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index b9f62da7b5..b220f9c1bc 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -15,7 +15,6 @@ SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz \
            file://gcc-6.patch \
            file://argp.patch \
            file://0001-Check-for-limits.h-during-configure.patch \
-           file://0002-wvtask-Dont-use-ucontext-on-non-glibc-systems.patch \
            file://0003-wvtask-Check-for-HAVE_LIBC_STACK_END-only-on-glibc-s.patch \
            file://0004-wvcrash-Replace-use-of-basename-API.patch \
            file://0005-check-for-libexecinfo-during-configure.patch \
@@ -28,6 +27,8 @@ SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz \
 SRC_URI[md5sum] = "2760dac31a43d452a19a3147bfde571c"
 SRC_URI[sha256sum] = "8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b7d0621b8ebc07633"
 
+COMPATIBLE_HOST_libc-musl = "null"
+
 inherit autotools-brokensep pkgconfig
 
 TARGET_CFLAGS_append = " -fno-tree-dce -fno-optimize-sibling-calls"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 5bb0beb7a3..1f0a7b9470 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -66,11 +66,12 @@ RDEPENDS_packagegroup-meta-oe-connectivity ="\
     modemmanager mosh  \
     paho-mqtt-c phonet-utils rabbitmq-c rfkill rtorrent \
     ser2net smstools3 telepathy-glib telepathy-idle thrift \
-    usbmuxd wvstreams zabbix zeromq \
+    usbmuxd zabbix zeromq \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "obex-data-server", "", d)} \
     libmikmod \
-    obexftp openobex libnet wvdial \
+    obexftp openobex libnet \
     "
+RDEPENDS_packagegroup-meta-oe-connectivity_append_libc-glibc = " wvstreams wvdial"
 
 # dracut needs dracut
 RDEPENDS_packagegroup-meta-oe-core ="\
-- 
2.23.0


