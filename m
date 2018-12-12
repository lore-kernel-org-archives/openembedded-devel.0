Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id C89ED6079E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 15:29:50 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q26so6367210wmf.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 07:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=boUYHavzSxnwSSiyumepsJ625If9SJpDOZhmEDvNztQ=;
	b=sqeHVf7dK2FpEoQmlCPfFv5rqY3qsJgTgAMNZm/jQOelznWIuUD1WRkiSJMpVe83EU
	Bhpk+2/9u4MDZ5Y826ImA1c62I0mEAasZW2Te5/MnQFj4Q7bWxGOnZD0QPExXBIoQNaS
	jzmQgLOUphm7qJbwdTLPlqG4VDgDxXfZqhzal4WwS9+lnCtNhTFle2xqB1zzLclssSnr
	pG2ZMTbSrnCoyMHXTq1YvCKF96IpWPxvewcPCWRhjcPRUoaBABGkKQxvox1ziFB7EE9Y
	P3oJHpTGUMdRLlOXbQLlYyybfPIgIfM4+MkkEqBIGJUpZSdhphmtmn3cVkyibsytjgB6
	Nndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=boUYHavzSxnwSSiyumepsJ625If9SJpDOZhmEDvNztQ=;
	b=C/8AEEOFHg8OLIUjM8qW9OB7arfyKGxWlbWgg9q76ewWPcGTRyTl4N/U28EWPH3DRW
	aNBk8gnPKvCNP2Q78n6WB60LCL6jhH2ddx5im+1kReWQoo9qDQV1f7bwMJ1DyKEbxbGB
	XLFKvbzKpd0jxAtByu/6vFGMw798dnpV+BULCLNmogC59qk6Gssi415YEw8eEmBF5ZAQ
	wex7yRI88s5ghCkfvqc0Cy1ed7mdRRKLqWEmqy2mYSJu13ZH6lzzSXv3gNMzcNLGq0xw
	OGzPLhio2p7+fGmweQnmfnvKYSVeblMnMagIXHqKA/hXSBPXBoOrQhoqC28bA9/0GLwx
	qBzA==
X-Gm-Message-State: AA+aEWY/VzH10YY2t10ccqdn4EOrVxOFhqM2IE7qvFWSWFZK/DJE79iq
	yotkvscE4DsLA/30Gqo/7t/+0BDo
X-Google-Smtp-Source: AFSGD/XC5AeLh1bQirTceOa/suGZroS5yap7Qha/58y9wf6P8vqw0wdMXKNUdiFg0Nk/CWQbGyXH0A==
X-Received: by 2002:a1c:7a16:: with SMTP id v22mr6256899wmc.131.1544628590792; 
	Wed, 12 Dec 2018 07:29:50 -0800 (PST)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host184-22-dynamic.15-87-r.retail.telecomitalia.it. [87.15.22.184])
	by smtp.gmail.com with ESMTPSA id
	n8sm23904948wrw.59.2018.12.12.07.29.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Dec 2018 07:29:49 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Dec 2018 16:29:38 +0100
Message-Id: <20181212152938.9030-1-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] samba: fix build on qemumips64 with musl
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
X-List-Received-Date: Wed, 12 Dec 2018 15:29:51 -0000

There is the same issue as for libldb, the header has conflicting defs
for unitptr_t. Fix it as done for the other recipe.

Fix
 /cmocka/cmocka.h:126:28: error: conflicting types for 'uintptr_t'
    typedef unsigned int uintptr_t;
                             ^~~~~~~~~

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../samba/samba/cmocka-uintptr_t.patch        | 51 +++++++++++++++++++
 .../recipes-connectivity/samba/samba_4.8.4.bb |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/cmocka-uintptr_t.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/cmocka-uintptr_t.patch b/meta-networking/recipes-connectivity/samba/samba/cmocka-uintptr_t.patch
new file mode 100644
index 000000000..5c299d617
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/cmocka-uintptr_t.patch
@@ -0,0 +1,51 @@
+From 5bd7b5d04435bd593349825973ce32290f5f604d Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 25 Jul 2018 09:55:25 +0800
+Subject: [PATCH] samba: cmocka.h: fix musl libc conflicting types error
+
+Fix build on qemumips64(el)
+
+taken from:
+[PATCH] libldb: fix musl libc conflicting types error
+
+/third_party/cmocka/cmocka.h:126:28: error: conflicting types for 'uintptr_t'
+            typedef unsigned int uintptr_t;
+                                 ^~~~~~~~~
+use __DEFINED_uintptr_t in alltypes.h to check if uintptr already defined
+
+Upstream-Status: Pending
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ third_party/cmocka/cmocka.h | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/third_party/cmocka/cmocka.h b/third_party/cmocka/cmocka.h
+index 4fd82a9..5443a08 100644
+--- a/third_party/cmocka/cmocka.h
++++ b/third_party/cmocka/cmocka.h
+@@ -110,7 +110,7 @@ typedef uintmax_t LargestIntegralType;
+     ((LargestIntegralType)(value))
+ 
+ /* Smallest integral type capable of holding a pointer. */
+-#if !defined(_UINTPTR_T) && !defined(_UINTPTR_T_DEFINED)
++#if !defined(__DEFINED_uintptr_t)
+ # if defined(_WIN32)
+     /* WIN32 is an ILP32 platform */
+     typedef unsigned int uintptr_t;
+@@ -134,9 +134,8 @@ typedef uintmax_t LargestIntegralType;
+ #  endif /* __WORDSIZE */
+ # endif /* _WIN32 */
+ 
+-# define _UINTPTR_T
+-# define _UINTPTR_T_DEFINED
+-#endif /* !defined(_UINTPTR_T) || !defined(_UINTPTR_T_DEFINED) */
++# define __DEFINED_uintptr_t
++#endif /* !defined(__DEFINED_uintptr_t) */
+ 
+ /* Perform an unsigned cast to uintptr_t. */
+ #define cast_to_pointer_integral_type(value) \
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb b/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb
index da0ac322a..f1aaeb83d 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb
@@ -28,6 +28,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
 SRC_URI_append_libc-musl = " \
            file://samba-pam.patch \
            file://samba-4.3.9-remove-getpwent_r.patch \
+           file://cmocka-uintptr_t.patch \
           "
 
 SRC_URI[md5sum] = "ca5bfbebd8d9eb95506e16594b2bbee2"
-- 
2.17.1


