Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f173.google.com (mail-wj0-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id C59E6719E7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 07:44:45 +0000 (UTC)
Received: by mail-wj0-f173.google.com with SMTP id kq3so6339916wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 23:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=dC/szj3GfWj+5GJNhG13z2qmxah6ZCtCT5XatWDGpZY=;
	b=jsK7dgszB/aaB5Xh5GHkS/6lsNaUVswkks6ntIchoMu2Eh8J1FvEoH+nKogzinJaJo
	TBSnD/JYBT8mU3LAcRHD77QzVcmdqt54PI/4BocnFyZOF++zc3WBB6qUpWA8gEQchdXY
	XSHeD0QlmkJRsCIgLoF1mVIPNoL/y+Wy1maVjrGWQItb6uOH8su8MJs34Hs02Ojvefsv
	70Za3ey29BR/D9tFbyRBwUVXuvMj16D3ABNqMQwDpV3gv94dnHNZiPQ5EfWM60nOTuSL
	IbHXJhZgn/dI/khjNnygm31ilxH3cbYBos3P5WTNfCg1VI1n0W1xmA5Ulmid8Ss8TIYz
	PjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dC/szj3GfWj+5GJNhG13z2qmxah6ZCtCT5XatWDGpZY=;
	b=S3n2zUygcHRS6Qn1Y3BjqDSbQRIhX4Dzi2ALmNSf4oKJTxNyQH1H5RDNbBD2yG3rxi
	Nnq4he8ALjupvrlJfROOJwckTvo2SraIZX2q4UX0TC7xFuaoQLFQmisu2nIeTgXkLkHf
	6FCliaeL6tLszbuziIEsjSYESSEbVM2yoKVYLy1XQq4Z2ieZAqeck8DCYUV9Iwth7jC/
	CcD9erbWMDLf6CCtZDWJ45ap+adSI530bR3HiIfaXPms1PLY8WP6vuguVarzDSWfMQuL
	rW0FAKYALIrVgeIjmEmYlaXl4Tqn5fgx4knZt7b25vKAE0ZVsXXKkKCD6hyBr4dgldb0
	BsyA==
X-Gm-Message-State: AIkVDXKXQa5rNZbMVFJID8AGAzh8Qpt9kpBGKIaXwsUaaNSP8N7LtAigj+qYgr53ZeuzBQ==
X-Received: by 10.194.76.193 with SMTP id m1mr8480513wjw.70.1484207085180;
	Wed, 11 Jan 2017 23:44:45 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-91-251-48.hsi12.unitymediagroup.de. [109.91.251.48])
	by smtp.googlemail.com with ESMTPSA id
	wp2sm12186778wjc.35.2017.01.11.23.44.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Jan 2017 23:44:44 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jan 2017 08:44:27 +0100
Message-Id: <1484207068-21151-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484207068-21151-1-git-send-email-schnitzeltony@googlemail.com>
References: <1484207068-21151-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-browser][PATCH V3 2/3] firefox: use pkg-config to find nspr
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
X-List-Received-Date: Thu, 12 Jan 2017 07:44:46 -0000
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
index 0000000..d02b904
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
+ configure | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 9b68803..312c8a3 100755
+--- a/configure
++++ b/configure
+@@ -15153,10 +15153,13 @@ fi
+ echo "configure:15154: checking for NSPR - version >= $min_nspr_version" >&5
+ 
+ 	no_nspr=""
++	NSPR_CONFIG="pkg-config nspr"
++	nspr_config_args=
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
+2.7.4
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
2.7.4


