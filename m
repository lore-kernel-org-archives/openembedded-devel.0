Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 56158719CF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 10:34:37 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p190so11530059wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 03:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=E4S5o83odNpwohDzQqnLrn1jY1BZfUGzQjVyTHY2Y7I=;
	b=Phvj79Q72F4EvdgAtEh8uY1XGSn1Msqwlo7NW8xqqGmjcucUjQ6KlCBGoHqEEpydxX
	3529NstbNwZ7jPxoLZAMuuC6HKMVXvaJTW2Ud/SYmwtTxpnlZ7jAISnVOj317WSU8RdS
	mYIHJ0zXkzs2xD6B5uFUEi7y23LPUZiJhiR1KCR3gopiE8kYo3n6nyUB1cWQP/qiZTxM
	giS8txx2m9tJqWMvhFdlHVtHfTnk3hQ+BS8HL1fxUS/OxscU5pTIyr53SOuf9sNFblGU
	v7njQUDPhUhp0Bm/lyMU2RMIQuLZcsC5khQz76afdWdD2FYyNY7Ka5eanZGaRlZFJF9D
	gyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=E4S5o83odNpwohDzQqnLrn1jY1BZfUGzQjVyTHY2Y7I=;
	b=XZHrRSyOuhS/NlEJDaJ0a+tmWL7BSKcZ1YiI7qPfevuLHpwWsPeYt06jfrozIV4Xyv
	sCaIDYivIdKlPvJbwjYW4ZIoA42TYZEjqg5+Yx9ja2xO13tfhA4HliuQv+qO9Ats49sf
	vWW653AqRYil6EPy3Upp5MGLxxIsElDxhYBKMI5rjwbSzE+lRmnU+w1QMgvEe2o3RDP+
	AETFr+oGDS8Du5LOnMOZcHlE6HltNTFAyZLXSmN1nWlXLNB3OxutG2h3Z3+K2iaOMtbf
	3yz5nx6gGi7ZGofe6R5BmP9IqIpFw83syAGu/9nDT8DWSYo60k/BWOHJRBlVDC94/2Ed
	5v1g==
X-Gm-Message-State: ABUngvcdZ4yC5re/xdB7zn3G9OVggs2I3VdZ6N8n1DKZd21DgV3VNe3Vtj8Y80TRpvKXdg==
X-Received: by 10.194.116.104 with SMTP id jv8mr12672973wjb.12.1477910079031; 
	Mon, 31 Oct 2016 03:34:39 -0700 (PDT)
Received: from neopili.uam.es (vpn236.remoto.uam.es. [150.244.109.236])
	by smtp.gmail.com with ESMTPSA id f3sm3497239wmf.10.2016.10.31.03.34.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Oct 2016 03:34:38 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, erkka.kaaria@intel.com,
	bkylerussell@gmail.com, daniel.mcgregor@vecima.com, maxin.john@intel.com
Date: Mon, 31 Oct 2016 11:34:33 +0100
Message-Id: <20161031103434.932-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.10.1
Subject: [meta-java][PATCH 1/2] icedtea7-native: Fix segmentation fault
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
X-List-Received-Date: Mon, 31 Oct 2016 10:34:38 -0000

Without this patch the generated icedtea produces segmentation faults.
This is probably due to a race condition during cleanout.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 recipes-core/icedtea/icedtea7-native.inc           |  2 ++
 .../icedtea/openjdk-7-03b147/sigsegv.patch         | 42 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/sigsegv.patch

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 00756888b62c..0ecf620cd279 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -42,6 +42,7 @@ SRC_URI = " \
   file://allow-headless-build.patch;striplevel=0 \
   file://jaxws_fix_NullPointerException.patch;apply=no \
   file://timezoneszip.patch \
+  file://sigsegv.patch;apply=no \
   "
 
 S = "${WORKDIR}/${ICEDTEA}"
@@ -153,6 +154,7 @@ do_configure_append() {
 	oe_runmake patch-boot
 
 	patch -p1 < ${WORKDIR}/jaxws_fix_NullPointerException.patch
+	patch -p1 < ${WORKDIR}/sigsegv.patch
 }
 
 EXTRA_OEMAKE = ' \
diff --git a/recipes-core/icedtea/openjdk-7-03b147/sigsegv.patch b/recipes-core/icedtea/openjdk-7-03b147/sigsegv.patch
new file mode 100644
index 000000000000..0c3e44eff826
--- /dev/null
+++ b/recipes-core/icedtea/openjdk-7-03b147/sigsegv.patch
@@ -0,0 +1,42 @@
+diff --git a/openjdk-boot/hotspot/src/share/vm/runtime/thread.cpp b/openjdk-boot/hotspot/src/share/vm/runtime/thread.cpp
+index 8b7059c8389f..67e9e7bd4bce 100644
+--- a/openjdk-boot/hotspot/src/share/vm/runtime/thread.cpp
++++ b/openjdk-boot/hotspot/src/share/vm/runtime/thread.cpp
+@@ -764,10 +764,13 @@ bool Thread::claim_oops_do_par_case(int strong_roots_parity) {
+ }
+ 
+ void Thread::oops_do(OopClosure* f, CodeBlobClosure* cf) {
+-  active_handles()->oops_do(f);
++  if (f && active_handles())
++	  active_handles()->oops_do(f);
+   // Do oop for ThreadShadow
+-  f->do_oop((oop*)&_pending_exception);
+-  handle_area()->oops_do(f);
++  if (f)
++	  f->do_oop((oop*)&_pending_exception);
++  if (f && handle_area())
++	  handle_area()->oops_do(f);
+ }
+ 
+ void Thread::nmethods_do(CodeBlobClosure* cf) {
+diff --git a/openjdk/hotspot/src/share/vm/runtime/thread.cpp b/openjdk/hotspot/src/share/vm/runtime/thread.cpp
+index 8b7059c8389f..67e9e7bd4bce 100644
+--- a/openjdk/hotspot/src/share/vm/runtime/thread.cpp
++++ b/openjdk/hotspot/src/share/vm/runtime/thread.cpp
+@@ -764,10 +764,13 @@ bool Thread::claim_oops_do_par_case(int strong_roots_parity) {
+ }
+ 
+ void Thread::oops_do(OopClosure* f, CodeBlobClosure* cf) {
+-  active_handles()->oops_do(f);
++  if (f && active_handles())
++	  active_handles()->oops_do(f);
+   // Do oop for ThreadShadow
+-  f->do_oop((oop*)&_pending_exception);
+-  handle_area()->oops_do(f);
++  if (f)
++	  f->do_oop((oop*)&_pending_exception);
++  if (f && handle_area())
++	  handle_area()->oops_do(f);
+ }
+ 
+ void Thread::nmethods_do(CodeBlobClosure* cf) {
-- 
2.10.1


