Received: from [209.85.198.246] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1MAcne-0004If-HJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 May 2009 06:37:34 +0200
Received: by rv-out-0708.google.com with SMTP id l33so1487629rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2009 21:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=k6pw4AWmkWOmW4yN00U10vop7IlgYhlJOgfCvsdLnmw=;
	b=hszI8L/4x4KLsMPET8ERwVX58RDaqVwByEWPzUMcPZ+zudtoaeTtGo3udrYe/m7Mkr
	CPbcaLOUeCLRPvk+1coDOPe+97JKXMc1OkHGaUbC7NO+uIwcXuHCX4QQYOXHwxyMgZRq
	UXKo5EcYk/O85fuYOfQi8QsBEilD+6EZ+JWIk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=U3VrzAFbiLKOnEXCTq7O+UtSJIlUCGCcBRvwgVTQW4IK78hAZY4AQCshup/rt0qLBq
	eaHSJcOdz7u6+6t9UBnhW7qSp17tH9y9juliWrI7XMmIFyvWXtFg7RpuX2wAOmr/ZBkV
	9rdFcjz9T8EkFtBfFWxVvFXfhIz9vEbg1yGZI=
Received: by 10.141.84.21 with SMTP id m21mr3861908rvl.284.1243744138332;
	Sat, 30 May 2009 21:28:58 -0700 (PDT)
Received: from localhost (adsl-75-8-123-171.dsl.sndg02.sbcglobal.net
	[75.8.123.171])
	by mx.google.com with ESMTPS id k21sm4244099waf.24.2009.05.30.21.28.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 30 May 2009 21:28:57 -0700 (PDT)
From: Henry von Tresckow <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 May 2009 21:28:55 -0700
Message-Id: <1243744135-13096-1-git-send-email-hvontres@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
Subject: [PATCH] linux-rp_2.6.24: added fix for gcc 4.3 compatibility
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 31 May 2009 04:37:34 -0000

 * Added patch to include/linux/time.h to make gcc 4.3 happy. This may
 be needed for other 2.6.24 or older kernel recipies.
 Original source of patch: http://lkml.org/lkml/2008/2/22/464

---
 recipes/linux/linux-rp-2.6.24/gcc-4.3-fix.patch |   27 +++++++++++++++++++++++
 recipes/linux/linux-rp_2.6.24.bb                |    3 +-
 2 files changed, 29 insertions(+), 1 deletions(-)
 create mode 100644 recipes/linux/linux-rp-2.6.24/gcc-4.3-fix.patch

diff --git a/recipes/linux/linux-rp-2.6.24/gcc-4.3-fix.patch b/recipes/linux/linux-rp-2.6.24/gcc-4.3-fix.patch
new file mode 100644
index 0000000..8ac2600
--- /dev/null
+++ b/recipes/linux/linux-rp-2.6.24/gcc-4.3-fix.patch
@@ -0,0 +1,27 @@
+Prevent the loop in timespec_add_ns() to be optimised away 
+since some architectures don't support __udivdi3() (and
+we don't want to use that, anyway).
+
+Signed-off-by: Segher Boessenkool <segher@kernel.crashing.org>
+---
+ include/linux/time.h |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+diff --git a/include/linux/time.h b/include/linux/time.h
+index 2091a19..d32ef0a 100644
+--- a/include/linux/time.h
++++ b/include/linux/time.h
+@@ -174,6 +174,10 @@ static inline void timespec_add_ns(struct timespec *a, u64 ns)
+ {
+ 	ns += a->tv_nsec;
+ 	while(unlikely(ns >= NSEC_PER_SEC)) {
++		/* The following asm() prevents the compiler from
++		 * optimising this loop into a modulo operation.  */
++		asm("" : "+r"(ns));
++
+ 		ns -= NSEC_PER_SEC;
+ 		a->tv_sec++;
+ 	}
+-- 
+1.5.4.2.184.gb23b
+
+
diff --git a/recipes/linux/linux-rp_2.6.24.bb b/recipes/linux/linux-rp_2.6.24.bb
index 7b06916..6f9b3c5 100644
--- a/recipes/linux/linux-rp_2.6.24.bb
+++ b/recipes/linux/linux-rp_2.6.24.bb
@@ -1,6 +1,6 @@
 require linux-rp.inc
 
-PR = "r22"
+PR = "r23"
 
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_collie = "1"
@@ -48,6 +48,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.24.tar.bz2 \
            ${RPSRC}/poodle_pm-r5.patch;patch=1 \
            ${RPSRC}/poodle_lcd_hack-r0.patch;patch=1 \
            ${RPSRC}/poodle_asoc_fix-r1.patch;patch=1 \
+           file://gcc-4.3-fix.patch;patch=1 \
            file://pxa27x-resume.patch;patch=1;status=external \
            file://mtd-module.patch;patch=1;status=external \
            file://wm8750-treble.patch;patch=1;status=external \
-- 
1.5.4.3



