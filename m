Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id AC495771E8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Mar 2017 07:14:06 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 67so15765429pfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 23:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Yf6VC7+uzDJ7RtMmKSstRjjLJARQ7DNVp9o4IlBHxAY=;
	b=jpkTdFsqIrIyfXoMJqXkJpR4qYjuOaOGPfNHLILRZA9NpjnFAG0M0r3e2flW5LZadp
	DwvMCs0vka8haRKzx7duMGOADN4soNYG2Rizz1c2kHnFLF/3VWkV6L127dYn6GRTyzI6
	Y6slbqgvJp93acRHvVdbNuF6PmOUSOl2M/jAerAEUnYVpPY99zcOpbDwDl1bY/tMN3Ru
	igfCWnox3I3aeYm1VlEEeOJ1EPegJRV0VL0zH8Vx9+XqcEImGRZVAA9qZToOYZm2WcBj
	+mA0WX6L71Uqy3QZrwNHpyNWgIHsjyQTkBsMWlpEXGlEOWN0qRLcljfRj7127tZAL08T
	AffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Yf6VC7+uzDJ7RtMmKSstRjjLJARQ7DNVp9o4IlBHxAY=;
	b=A8bj5LusZTbTxou0ZQZX1VYaxBtcr6bF3o6VLZcFtins2n8I0b+gKAaEGs12GRfJ1B
	qucLW+EGV/2jfTc3PsNQbeobXSVpXVOC6cts3doiaVmxhIcS/sCZRTHNyN9zAp0bD6us
	w7u5sLopXNdZYv3mEbd3ocsvgk36IE/VCTaHrLFmgrGqNeRIDplGeO61aV69OAuABG9E
	oSYRUTGR3rM6AOkIEB2Y7CzpTOG9JkdylBBEkeE+/z/S64FbvJf8/I3JUd5qu/ERCPMA
	2+iMrngs00oayaxC0qVVVeszvELq4ZryVEMkbX9YpxqRLN0QaDhQ7dDNw525cNsXJU4r
	Gk6Q==
X-Gm-Message-State: AMke39mjICndqTRVFFfV0sv3NseCiBakbl9fGIMty3zvelyrcHoRXWruvy0cBIEICw1UgA==
X-Received: by 10.99.45.133 with SMTP id t127mr25884126pgt.224.1488870847792; 
	Mon, 06 Mar 2017 23:14:07 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	r134sm43530858pfr.83.2017.03.06.23.14.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 23:14:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 23:13:44 -0800
Message-Id: <20170307071349.16444-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170307071349.16444-1-raj.khem@gmail.com>
References: <20170307071349.16444-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 09/14] a2jmidid: Fix build on aarch64
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
X-List-Received-Date: Tue, 07 Mar 2017 07:14:06 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../jack/a2jmidid/0002-aarch64.patch               | 31 ++++++++++++++++++++++
 meta-oe/recipes-multimedia/jack/a2jmidid_8.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/jack/a2jmidid/0002-aarch64.patch

diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid/0002-aarch64.patch b/meta-oe/recipes-multimedia/jack/a2jmidid/0002-aarch64.patch
new file mode 100644
index 000000000..b344f5427
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/a2jmidid/0002-aarch64.patch
@@ -0,0 +1,31 @@
+Consider compiler define for aarch64
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status:Pending
+
+Index: a2jmidid-8/sigsegv.c
+===================================================================
+--- a2jmidid-8.orig/sigsegv.c
++++ a2jmidid-8/sigsegv.c
+@@ -91,18 +91,18 @@ static void signal_segv(int signum, sigi
+     a2j_error("info.si_errno = %d", info->si_errno);
+     a2j_error("info.si_code  = %d (%s)", info->si_code, si_codes[info->si_code]);
+     a2j_error("info.si_addr  = %p", info->si_addr);
+-#if !defined(__alpha__) && !defined(__ia64__) && !defined(__FreeBSD_kernel__) && !defined(__arm__) && !defined(__hppa__) && !defined(__sh__)
++#if !defined(__alpha__) && !defined(__ia64__) && !defined(__FreeBSD_kernel__) && !defined(__arm__) && !defined(__hppa__) && !defined(__sh__) && !defined(__aarch64__)
+     for(i = 0; i < NGREG; i++)
+         a2j_error("reg[%02d]       = 0x" REGFORMAT, i,
+ #if defined(__powerpc__)
+                 ucontext->uc_mcontext.uc_regs[i]
+-#elif defined(__sparc__) && defined(__arch64__)
++#elif defined(__sparc__) || defined(__arch64__)
+                 ucontext->uc_mcontext.mc_gregs[i]
+ #else
+                 ucontext->uc_mcontext.gregs[i]
+ #endif
+                 );
+-#endif /* alpha, ia64, kFreeBSD, arm, hppa */
++#endif /* alpha, ia64, kFreeBSD, arm, hppa aarch64 */
+ 
+ #if defined(SIGSEGV_STACK_X86) || defined(SIGSEGV_STACK_IA64)
+ # if defined(SIGSEGV_STACK_IA64)
diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb b/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
index 0204fb904..a520f98e1 100644
--- a/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
+++ b/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
@@ -11,6 +11,7 @@ DEPENDS = "alsa-lib jack dbus"
 SRC_URI = " \
     http://download.gna.org/${BPN}/${BPN}-${PV}.tar.bz2 \
     file://0001-wscript-add-pthread-library-dependency-to-fix-linkin.patch \
+    file://0002-aarch64.patch \
 "
 SRC_URI[md5sum] = "9cf4edbc3ad2ddeeaf6c8c1791ff3ddd"
 SRC_URI[sha256sum] = "2a9635f62aabc59edb54ada07048dd47e896b90caff94bcee710d3582606f55f"
-- 
2.12.0


