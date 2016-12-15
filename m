Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 93106772E5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 17:52:23 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id g23so175990446wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 09:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=fp+/6rYuAJ76S40SFwo4BOO6e//HWXYufmbt7kUM048=;
	b=Ds8wROGU8upMsVI3D44NzknJO1Yp0myJbb7N+VLNWsPV99qQneNjgKWzpNa8/NSbAN
	f97zr4v5sVzGY2DNCWjkr24MwyWqUd/qX4YzabU+wqbaPgi8FucPvL2WVh0AiuRlJHQh
	deru0cZc05jcFraItgYAw9wwlfCEw1S3ma4r9qiyHvml8EGd69JpYAmPfbUBk52qlY/j
	iypOUqkBMyUpTjysaDtmthzmk0oqezccBZFFPWazsfUgQumGd6VWoNNMQJ+snDOAd6G9
	dr2bx8CypgKr+bS8LUCqVE2KPZOdTvEjGjwRns2Wix6Tg3DOnIf1YQaEEo+N/wx4E6Tw
	ItUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fp+/6rYuAJ76S40SFwo4BOO6e//HWXYufmbt7kUM048=;
	b=hYcBYCHtD9MtIQhNvt7sOmWEtcDEs22wbQ0iRXoF8cuoA2uWh0jZV7Bv1JaaHYbIfG
	DQobf2G26a3z0Efql+fHbvuSjGrmHW7ol2ILvHRcv0XvQv6uEFSYS8WxKGfevMl83qRO
	RVsY1kkDqoSHOYg4RFj6ZWOBx8wqS0Iwbl3aym383nBxDvJAU4QiTOyGEZ0pV0qNMXNU
	fsRITI/jvqyqlhNMSO+YrLNpAwoia0kOrIG03kqMgliKr503cjzepLeCL+EOd5nD/KCS
	F/vI8UBUft5uiXQmyaDg7oiPhRwsr9hCV5L2ULTfNxSocXGwfYj4iR73DaU7PPtYwJvZ
	Xc5A==
X-Gm-Message-State: AIkVDXIxgUwmWY4rNGeNQJaCJmavLH7OLpEng4EaEYWsNID500Ij3DlaQ7AD/JO4MOFe4A==
X-Received: by 10.28.173.131 with SMTP id w125mr2575446wme.0.1481824344103;
	Thu, 15 Dec 2016 09:52:24 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-90-226-171.hsi11.unitymediagroup.de. [109.90.226.171])
	by smtp.googlemail.com with ESMTPSA id
	e5sm13482891wma.12.2016.12.15.09.52.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Dec 2016 09:52:23 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2016 18:52:10 +0100
Message-Id: <1481824331-347-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481824331-347-1-git-send-email-schnitzeltony@googlemail.com>
References: <1481824331-347-1-git-send-email-schnitzeltony@googlemail.com>
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
X-List-Received-Date: Thu, 15 Dec 2016 17:52:25 -0000
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
2.7.4


