Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f181.google.com (mail-wj0-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id A321B7199A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2017 18:49:01 +0000 (UTC)
Received: by mail-wj0-f181.google.com with SMTP id tn15so88056602wjb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2017 10:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=YcGxYKG7LRLfkZVV6759C51Foh+MVxfiVT7Au4vVZ8Q=;
	b=PtOlpJiJ0cZmiWN0+HzndJU5vRt9VANweqJA5QHpnHyPwqHj6Ki0rdBdVpiuUw6kOI
	2EmEWgQf52CWcXEYjaE7Iguz16oyt+qDbZjdylYqqNpckIOFRkeViF+ruyC78RfwCnCk
	zoWyScQ/bS3ciu6kBclOtSyQCk1uBkkGDF9jUEMo3HC8egWyfcShX5s50qi0Zs5l8M9h
	khEwl6K5xA7uq4D5/oFg9Dj+xWcnri09QLYrSjYXKQm0I4QSiIAut1fgNKkUQzPatxXH
	0CPyaJsLbGThlPOTn362d7tLtQ+KyQ4YzWE1ebuhuCOWIWxMzMCMzJy0V35ohoVFBclI
	WVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YcGxYKG7LRLfkZVV6759C51Foh+MVxfiVT7Au4vVZ8Q=;
	b=YftY+JMOhZuW6TOOS9ByH0i6Us25phF3o4JzsnaD0v9pkNdIkFWfVr3Ji+k9MTCz96
	sD/96MnBVd0XOyACiLnwPaK4kX5D5A+EuiOFC4DL/HMusKnXkQItMxy+bZSBZsHkQKKR
	JtWpFCUs3cD4CT1aScPLPJyFUVbFWv+3YZHOVTZ9cKAN3X3UjsqJVnzJ/qRCa5N0gRyQ
	J1StdKUci4HtczoeqGE5HxEsP66IjvJHUVJTpZxgnatAshebc1jcGpn6vS0DH5BkeNKH
	oexxVCbli5tsnqmAfWGfRbO4E+URJ+ItGxZoHFwrEYJQcYwQz5pTsIfYlIWDxyyryVDR
	jwoA==
X-Gm-Message-State: AIkVDXK4FVHaXwTOdPAD9bbVEmwniw998WPGnWygV6LMCEh8BUa/q879xQbiTVRdNgxwZQ==
X-Received: by 10.194.234.193 with SMTP id ug1mr2641987wjc.68.1484074141210;
	Tue, 10 Jan 2017 10:49:01 -0800 (PST)
Received: from localhost.localdomain (p579F7DD6.dip0.t-ipconnect.de.
	[87.159.125.214]) by smtp.googlemail.com with ESMTPSA id
	r5sm9007071wme.23.2017.01.10.10.48.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jan 2017 10:48:59 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jan 2017 19:48:46 +0100
Message-Id: <1484074127-21458-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1484074127-21458-1-git-send-email-schnitzeltony@googlemail.com>
References: <1484074127-21458-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-browser][PATCH V2 2/3] firefox: use pkg-config to find nspr
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
X-List-Received-Date: Tue, 10 Jan 2017 18:49:01 -0000
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
 recipes-mozilla/firefox/firefox_45.6.0esr.bb       |  1 +
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
diff --git a/recipes-mozilla/firefox/firefox_45.6.0esr.bb b/recipes-mozilla/firefox/firefox_45.6.0esr.bb
index 6ca6633..a4ae32f 100644
--- a/recipes-mozilla/firefox/firefox_45.6.0esr.bb
+++ b/recipes-mozilla/firefox/firefox_45.6.0esr.bb
@@ -40,6 +40,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox
            file://Fix-firefox-install-dir.patch \
            file://fixes/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch \
            file://0001-use-pkg-config-to-find-nss.patch \
+           file://0002-use-pkg-config-to-find-nspr.patch \
            "
 
 SRC_URI[archive.md5sum] = "ee3cf2401a5716cebacaae5fb70d133f"
-- 
2.5.5


