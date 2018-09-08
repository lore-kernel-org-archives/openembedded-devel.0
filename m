Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 949EA797FD
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Sep 2018 07:11:36 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id i190-v6so8036979pgc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Sep 2018 00:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nUbWpmiVlHDYhFg+iAqtCmK0VM7SYJF2s5AJYbNWOY4=;
	b=DpP4LdNuzfQFx5laiQeWrtTFxAZ5ZoXCBTDllpQ4XlwXqGJWpQE/5fF556fxnw7oJa
	dH0Xt0Zf8gfMkcaStaTBfx8Xh+U9jjci9noDxiIJYkrnK5u4KsZCdnPQHb5A0C+vruAq
	vPGPPqER6KDk6PiCevREESE+iu310G6qcalrCNV6AxJu04QpdcMYEjMM8sWw0lDUfTfO
	ggaGZcfY+lnpUQUDlJjLXpbct3bONZo4NIcPZZ1BK2rDBml+T6VM6N/j095WbtZw0zxe
	/HLCvQ7fa/dZ8Uxer07l4Uk045bqYpeq0R0Ymzhil2YVHaBtT939ViCc5aAMPxeuLxGy
	7tJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nUbWpmiVlHDYhFg+iAqtCmK0VM7SYJF2s5AJYbNWOY4=;
	b=s+yIIyxcQzOpwgqQfQwOGMMrpDwRKO3WMwvz8Z4ternaL34eVGuxBUaMmPuJs8pe93
	/Ytixa6F5KQJGPAl/rEgegwRow4oje3s+QUxYdj7nr5mdxbf7KSaBl9JPnGyOyP+Rzoy
	OAvo0xkMoYEd9Nb9PLtiEneBeTClXN5WS7a9Hz3VQ4OYYLzkSLIMU/HE09SeAyzKNG8s
	UYI9z3pwf+IY1HCO+5PRGJnlx1o71xknMbMC1EzX/kyqyQs+QCEQFZyM3DuU1ZlIBAS2
	Nw5bOnh6SxbqpcQ09VUB9flTnQ7ZQBq7dT0OnJ5aOx5DQWb8W5Zc3WqQ70wKFuNxxbze
	0D/A==
X-Gm-Message-State: APzg51Cqk3H4KwqeNX31Ha+nWcz1p6ThgnO33UxNHa+j4qwNsMzEDg/x
	malavJTiRIBhu329TDecrvTwZjFi
X-Google-Smtp-Source: ANB0VdYXhoCReo0lGVLWs60Zef5lT6I4g71BGn5Un5ERCLNIdOYg4pV+a7h9Cebuk0YPCwx/vm4X+A==
X-Received: by 2002:a62:4b14:: with SMTP id
	y20-v6mr12454502pfa.93.1536390697323; 
	Sat, 08 Sep 2018 00:11:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	a15-v6sm18702212pfe.32.2018.09.08.00.11.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Sep 2018 00:11:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Sep 2018 00:11:23 -0700
Message-Id: <20180908071125.28282-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180908071125.28282-1-raj.khem@gmail.com>
References: <20180908071125.28282-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/5] wvstreams: Depend on openssl10 and add patch to build with openssl
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
X-List-Received-Date: Sat, 08 Sep 2018 07:11:36 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../wvdial/wvstreams/05_gcc.diff                 | 13 -------------
 .../wvdial/wvstreams/openssl-buildfix.patch      | 16 ++++++++++++++++
 .../wvdial/wvstreams_4.6.1.bb                    |  3 ++-
 3 files changed, 18 insertions(+), 14 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/openssl-buildfix.patch

diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/05_gcc.diff b/meta-oe/recipes-connectivity/wvdial/wvstreams/05_gcc.diff
index 8e4fd03298..616843d4ae 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams/05_gcc.diff
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/05_gcc.diff
@@ -1,16 +1,3 @@
-Index: wvstreams-4.6.1/crypto/wvx509.cc
-===================================================================
---- wvstreams-4.6.1.orig/crypto/wvx509.cc	2011-05-20 00:02:38.119136584 +0200
-+++ wvstreams-4.6.1/crypto/wvx509.cc	2011-05-20 00:02:26.035136589 +0200
-@@ -1157,7 +1157,7 @@
-         
-         if (ext)
-         {
--            X509V3_EXT_METHOD *method = X509V3_EXT_get(ext);
-+            X509V3_EXT_METHOD *method = (X509V3_EXT_METHOD *)X509V3_EXT_get(ext);
-             if (!method)
-             {
-                 WvDynBuf buf;
 Index: wvstreams-4.6.1/ipstreams/wvunixdgsocket.cc
 ===================================================================
 --- wvstreams-4.6.1.orig/ipstreams/wvunixdgsocket.cc	2011-05-20 00:02:38.391136584 +0200
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/openssl-buildfix.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/openssl-buildfix.patch
new file mode 100644
index 0000000000..1c7005c2fe
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/openssl-buildfix.patch
@@ -0,0 +1,16 @@
+Index: wvstreams-4.6.1/crypto/wvx509.cc
+===================================================================
+--- wvstreams-4.6.1.orig/crypto/wvx509.cc
++++ wvstreams-4.6.1/crypto/wvx509.cc
+@@ -1157,7 +1157,11 @@ WvString WvX509::get_extension(int nid)
+         
+         if (ext)
+         {
++#if OPENSSL_VERSION_NUMBER >= 0x10000000L
++            const X509V3_EXT_METHOD *method = X509V3_EXT_get(ext);
++#else
+             X509V3_EXT_METHOD *method = X509V3_EXT_get(ext);
++#endif
+             if (!method)
+             {
+                 WvDynBuf buf;
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index e3d5e7d20b..7c5e92fe5c 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -4,7 +4,7 @@ SUMMARY = "WvStreams is a network programming library in C++"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-DEPENDS = "zlib openssl (>= 0.9.8) dbus readline"
+DEPENDS = "zlib openssl10 (>= 0.9.8) dbus readline"
 DEPENDS_append_libc-musl = " argp-standalone libexecinfo"
 
 SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz \
@@ -21,6 +21,7 @@ SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz \
            file://0005-check-for-libexecinfo-during-configure.patch \
            file://0001-build-fix-parallel-make.patch \
            file://0002-wvrules.mk-Use-_DEFAULT_SOURCE.patch \
+           file://openssl-buildfix.patch \
            "
 
 SRC_URI[md5sum] = "2760dac31a43d452a19a3147bfde571c"
-- 
2.18.0


