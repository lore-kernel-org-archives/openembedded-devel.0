Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id ABC0E786B6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2018 06:04:06 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id f8so2720214plk.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jan 2018 22:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JbytsqxGPZle66mAginbr2DGSx4CkLo8/DZDI/RZdjU=;
	b=DqMEK8oCi5hBQG5JV9Gx0MTRgKtBGFsp+mJ5W/DdXa2ZqpDgE5yA+YCCsIeBaBOcr9
	sFZnhSb5yrD2dURvRUrd2OI3fBbzC7wFJfNWKZTGpyffNcLtrfh2uFXugwPj3+24SFjH
	+MGG6WduoasnZCPm9bo8lW52v44cXK7h8hyv/uDZYb6dS3HDB++oZwFLj/HLiG32pJdU
	Ri0WE9uIVMQNIcECjYImbwgWbOS9Q1fDCrn71sGZjiYhPqLDNFwPOlA47BkU7eAhyrDK
	7ssxAOnyMHl9tPRqLOyTL7HLnsN1HIEHCmJBKMPth1BckUwT/Xbs0GIcTOHe5UVZWj/2
	mUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JbytsqxGPZle66mAginbr2DGSx4CkLo8/DZDI/RZdjU=;
	b=mpxvCt2nbixbHzkeiZ+SInREZbUdGNFRLNI3OXMk39ggWH3JfnK5tB2pXkBJfzpQ+I
	WnQAcQj2znD6o+zUITI0wzzlop9169Q8sDVDDxqxDJAQYXzPnn4fScEnuwTanS6/K4A+
	XSEX7EnA7O2rIURmYqQk77nTV8DZ6ZvFn+rqaBuQ6VEcft5+SrJEmk6wYHH5bcxhbxPS
	kboBjwL8tFdOCexhtgux1FQuAGpcZVvtFfz5jhEAYaJq/ZVs9gG6ywi5gwTIXBdKpteA
	G2rGmK5bAPIijMYmRTWRlrKrSKA8BbAGIJaQNS7CkCqwAjwRz9eqMfgc6VoOOLwywrQ2
	I/mw==
X-Gm-Message-State: AKwxytf8Qo+dzoAclPEdrp9PDyES/gSNue+TPmOWPJCki5aBncPw2Czf
	63MJOBcLugBfn6ZafbY63ir0/w==
X-Google-Smtp-Source: AH8x225OgW7N8sePFiee7DltKJhp26MzTNxvJQiToqJ52QW5uzpRG3c4ZTF6LOcRyMZo0wYajL5dlg==
X-Received: by 2002:a17:902:b596:: with SMTP id
	a22-v6mr30408095pls.60.1517465047795; 
	Wed, 31 Jan 2018 22:04:07 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::a8d6])
	by smtp.gmail.com with ESMTPSA id
	k29sm26264452pgn.28.2018.01.31.22.04.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Jan 2018 22:04:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Jan 2018 22:03:53 -0800
Message-Id: <20180201060355.5218-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180201060355.5218-1-raj.khem@gmail.com>
References: <20180201060355.5218-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/4] caps: Replace obsoleted pow10f() with exp10f
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
X-List-Received-Date: Thu, 01 Feb 2018 06:04:06 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Do-not-use-obsolete-pow10f-function.patch | 50 ++++++++++++++++++++++
 .../recipes-multimedia/caps/caps_0.9.24.bb         |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/caps/caps/0001-Do-not-use-obsolete-pow10f-function.patch

diff --git a/meta-multimedia/recipes-multimedia/caps/caps/0001-Do-not-use-obsolete-pow10f-function.patch b/meta-multimedia/recipes-multimedia/caps/caps/0001-Do-not-use-obsolete-pow10f-function.patch
new file mode 100644
index 000000000..bd5e1b603
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/caps/caps/0001-Do-not-use-obsolete-pow10f-function.patch
@@ -0,0 +1,50 @@
+From 0cc7362e171616dcfeb93c6e1576362761bf14e5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 31 Jan 2018 18:37:16 -0800
+Subject: [PATCH] Do not use obsolete pow10f() function
+
+exp10 name is standardized in TS 18661-4 and its
+available in glibc since version 2.1
+it has been now removed from glibc 2.27+
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ dsp/v4f_IIR2.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/dsp/v4f_IIR2.h b/dsp/v4f_IIR2.h
+index a68ecf5..ebd1234 100644
+--- a/dsp/v4f_IIR2.h
++++ b/dsp/v4f_IIR2.h
+@@ -33,7 +33,7 @@
+ namespace DSP {
+ 
+ #ifdef __APPLE__
+-inline float pow10f(float f) {return pow(10,f);}
++inline float exp10f(float f) {return __exp10f(f);}
+ #endif
+ 
+ class RBJv4
+@@ -142,7 +142,7 @@ class IIR2v4
+ 				/* A = pow (10, gain / 40) */
+ 				v4f_t A = (v4f_t) {.025,.025,.025,.025};
+ 				A *= gain;
+-				A = v4f_map<pow10f> (A);
++				A = v4f_map<exp10f> (A);
+ 
+ 				RBJv4 p (f, Q);
+ 
+@@ -429,7 +429,7 @@ class IIR2v4Bank
+ 					/* A = pow (10, gain / 40) */
+ 					v4f_t A = (v4f_t) {.025,.025,.025,.025};
+ 					A *= gain[i];
+-					A = v4f_map<pow10f> (A);
++					A = v4f_map<exp10f> (A);
+ 
+ 					RBJv4 p (f[i], Q[i]);
+ 
+-- 
+2.16.1
+
diff --git a/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb b/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb
index 29167d1aa..fe864c49c 100644
--- a/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb
+++ b/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://quitte.de/dsp/${PN}_${PV}.tar.bz2 \
            file://Avoid-ambiguity-in-div-invocation.patch \
            file://0001-basic.h-Use-c99-supported-stdint-types.patch \
            file://append_ldflags.patch \
+           file://0001-Do-not-use-obsolete-pow10f-function.patch \
            "
 
 SRC_URI[md5sum] = "c1d634038dcb54702306c0e30cb1c626"
-- 
2.16.1


