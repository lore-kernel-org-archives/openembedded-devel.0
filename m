Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f177.google.com (mail-wj0-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 389BE73219
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 22:49:56 +0000 (UTC)
Received: by mail-wj0-f177.google.com with SMTP id tg4so51030048wjb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 14:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=DM1Fq/Sv7Du2bX7kbfsTRA/apqmta9XIqVuM7OANZnQ=;
	b=fEl7zy5XKVv6D9zbyI1y4bumO+vGq+4txOIdQz6h2BwDRVQ+FUachQsWMoNV25ZMDb
	ErMtTM9XEU0STFpAbRvPvlvDpwZx+QG2yiqWalvptP9WX0Ec607grPeMrNb9RHQsCSt9
	ELgjrtt36dsKFZFdBbAgKAaAKguNfUT9pRvEoAe/pyM3egJQOAsHBOND0q8h0b4Xzqkf
	Q5rSBq03QVaQJobFZ+J9s0+UvaDsL5X65fhkdxqr7RVr7/2KQxYKKVnbaZvtyuxsn3C3
	MwR16zyC2NFUOinl8RZpSex0/nsM5lUzEW/dxwM4Y2triBlp8YwOtv91fBPGVObvD9Wx
	Bb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DM1Fq/Sv7Du2bX7kbfsTRA/apqmta9XIqVuM7OANZnQ=;
	b=BEivtcw+Gp+rnl/7baP40Bcz+jdtHd0cUcdmzhXIQj71oxbhQeCVyhLgr119Dfu6NC
	FDKt9FwtopgtCLtklClYZNhTlj7+YPWiCrR9nSHNvqXHSk8tPN17RYF9E1f7UB8zbtgb
	tlkNGFSNs2xFt1Ncax/j4kRexFenCd1XIDD+ZIYeI6agiRHRbnWhmAxDzLQJUCJBB/Hj
	2hOu0Ju8w/gRzAgf0D/Vyp7zbrA1OwVA7QMoHFIm5TpRTmhnUTKSSapp4NaRFUMSe+E7
	wZ5bJGusk92I8i+LfqIqxW2LfYhevgWDmffzAk7sipNXxaeL4GrMYbLh6Jf6vUU35qyr
	+fHA==
X-Gm-Message-State: AKaTC02gg9gNp2jueHoXNT1VKW0LRcru/2iP2UDWlW9xi9kTJTMoCkX4V0xHm4BTU5RgXg==
X-Received: by 10.194.72.100 with SMTP id c4mr89112769wjv.188.1481755797792;
	Wed, 14 Dec 2016 14:49:57 -0800 (PST)
Received: from localhost.localdomain (p579CE070.dip0.t-ipconnect.de.
	[87.156.224.112]) by smtp.googlemail.com with ESMTPSA id
	d64sm9625699wmh.3.2016.12.14.14.49.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Dec 2016 14:49:57 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2016 23:49:38 +0100
Message-Id: <1481755778-16443-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1481755778-16443-1-git-send-email-schnitzeltony@googlemail.com>
References: <1481755778-16443-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-browser][PATCH 2/2] firefox: use pkg-config to find nspr
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
X-List-Received-Date: Wed, 14 Dec 2016 22:49:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nspr-config adds path /usr/include

which causes lots of

| cc1plus: warning: include location "/usr/include" is unsafe for cross-compilation [-Wpoison-system-directories]

and finally fails with

| In file included from /usr/include/sys/syscall.h:31:0,
|                  from <workdir>/cortexa7hf-neon-vfpv4-angstrom-linux-gnueabi/firefox/45.5.1esr-r0/firefox-45.5.1esr/firefox-build-dir/dist/system_wrappers/sys/syscall.h:4,
|                  from <workdir>/cortexa7hf-neon-vfpv4-angstrom-linux-gnueabi/firefox/45.5.1esr-r0/firefox-45.5.1esr/memory/mozjemalloc/jemalloc.c:397:
| <workdir>/cortexa7hf-neon-vfpv4-angstrom-linux-gnueabi/firefox/45.5.1esr-r0/firefox-45.5.1esr/memory/mozjemalloc/jemalloc.c: In function '_mmap':
| <workdir>/cortexa7hf-neon-vfpv4-angstrom-linux-gnueabi/firefox/45.5.1esr-r0/firefox-45.5.1esr/memory/mozjemalloc/jemalloc.c:417:26: error: '__NR_mmap2' undeclared (first use in this function)
|   return (void *) syscall(SYS_mmap2, addr, length, prot, flags,

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../firefox/0002-use-pkg-config-to-find-nspr.patch | 37 ++++++++++++++++++++++
 recipes-mozilla/firefox/firefox_45.5.1esr.bb       |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 recipes-mozilla/firefox/firefox/0002-use-pkg-config-to-find-nspr.patch

diff --git a/recipes-mozilla/firefox/firefox/0002-use-pkg-config-to-find-nspr.patch b/recipes-mozilla/firefox/firefox/0002-use-pkg-config-to-find-nspr.patch
new file mode 100644
index 0000000..d97570b
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/0002-use-pkg-config-to-find-nspr.patch
@@ -0,0 +1,37 @@
+From cdb21594b814af82c4128ccd1179267de2e0e780 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 14 Dec 2016 22:57:55 +0100
+Subject: [PATCH] use pkg-config to find nspr
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 16133bf..806896a 100755
+--- a/configure
++++ b/configure
+@@ -15153,10 +15153,13 @@ fi
+ echo "configure:15154: checking for NSPR - version >= $min_nspr_version" >&5
+ 
+ 	no_nspr=""
++    NSPR_CONFIG="pkg-config nspr"
++    nspr_config_args=
+ 	if test "$NSPR_CONFIG" != "no"; then
+ 		NSPR_CFLAGS=`$NSPR_CONFIG $nspr_config_args --cflags`
+ 		NSPR_LIBS=`$NSPR_CONFIG $nspr_config_args --libs`
+-		NSPR_VERSION_STRING=`$NSPR_CONFIG $nspr_config_args --version`	
++		NSPR_VERSION_STRING=`$NSPR_CONFIG $nspr_config_args --modversion`	
++		echo -n "$NSPR_VERSION_STRING... "
+ 	elif test -n "${NO_NSPR_CONFIG_SYSTEM_VERSION}"; then
+ 	    NSPR_CFLAGS="${NO_NSPR_CONFIG_SYSTEM_CFLAGS}"
+ 		NSPR_LIBS="${NO_NSPR_CONFIG_SYSTEM_LDFLAGS}"
+-- 
+2.5.5
+
diff --git a/recipes-mozilla/firefox/firefox_45.5.1esr.bb b/recipes-mozilla/firefox/firefox_45.5.1esr.bb
index d384786..1f865eb 100644
--- a/recipes-mozilla/firefox/firefox_45.5.1esr.bb
+++ b/recipes-mozilla/firefox/firefox_45.5.1esr.bb
@@ -40,6 +40,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox
            file://Fix-firefox-install-dir.patch \
            file://fixes/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch \
            file://0001-use-pkg-config-to-find-nss.patch \
+           file://0002-use-pkg-config-to-find-nspr.patch \
            "
 
 SRC_URI[archive.md5sum] = "ec943bcff82e868d2f5e95dde7edb83f"
-- 
2.5.5


