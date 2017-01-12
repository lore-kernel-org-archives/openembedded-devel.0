Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 69314719E7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 07:44:46 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id c85so8746025wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 23:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=w/D9R/CzrsUz61IgTr9Q2PvN3/9shA5akR410Ok3K+Q=;
	b=EALVVVxfi+uw/oqW/b0NZtFv1l1LGC5PsRdl2r+rF2tplzpdKMZChlrKi9Mp5E1R9k
	iSYPM9HIs/wxQs+8ElBnp0vUlUTJGhNuqyS3aswN3Kg6MFg/VYfxnNfzCbUd2MXyxxcR
	m/TtlowBZTePxMJ8w4JV5fOo1iUOnxj8VssrXYP9aJQUtfqk/dUjJykh5/h/6qWwyeBk
	TDUBGy/CbEk3DmRNp4q3wmv6Ro0+x3BrVkuYY5PdHK+yWKk9nNdTIISmyVvDH12sTmGC
	vRb0Duus4ywpbrhsfQkeVhvBKA6MevT7VaDvWfsB3enl2BHe9yco7xQuz7vKDYcxYwd6
	8qkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=w/D9R/CzrsUz61IgTr9Q2PvN3/9shA5akR410Ok3K+Q=;
	b=Vl9n/e62G6lUWuY5qtKZH9bYkTdqju3a55+vESTm/2Kb4jonY0JhRpFLEBgmIDh9rY
	mcFTjuVLtLWATVdHscUAn8rK3liiKoDwKppXrnl8UdQxPGHXMidhGfK8dHfoJNglpbdc
	3OlLF8zOaWhrwH9NHUcubmbL/Yzz+/LJj5bZ33S5QqqjJNQleHX+3zXJ9cax8IrlVyj5
	43/6ZkXptuuWehGAGvHd/z8xJdBNDV8mQY0EPauFyuGwpKtw93i71xV7yP0Y0v6s1q42
	Qx1YP21gIQPYUjWC6UUAvud/O0uvJaPa2Nwr/geRfue/ERR1xQ+ZpLJPUo+0rj33cFjk
	sBGA==
X-Gm-Message-State: AIkVDXJgZkWq3cSJ6qiObU6vwyM/5+3v0fCR2gjylE+7F2wvnLWXXIkQi1tzpqDfSvVFdw==
X-Received: by 10.223.177.195 with SMTP id r3mr6084464wra.68.1484207086025;
	Wed, 11 Jan 2017 23:44:46 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-91-251-48.hsi12.unitymediagroup.de. [109.91.251.48])
	by smtp.googlemail.com with ESMTPSA id
	wp2sm12186778wjc.35.2017.01.11.23.44.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Jan 2017 23:44:45 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jan 2017 08:44:28 +0100
Message-Id: <1484207068-21151-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484207068-21151-1-git-send-email-schnitzeltony@googlemail.com>
References: <1484207068-21151-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-browser][PATCH V3 3/3] firefox: do not link against crmf library it is not there
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

and build succeeds without it

fixes:

| <...>/arm-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/6.2.0/ld: error: cannot find -lcrmf

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...link-against-crmf-library-it-is-not-there.patch | 48 ++++++++++++++++++++++
 recipes-mozilla/firefox/firefox_45.6.0esr.bb       |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 recipes-mozilla/firefox/firefox/0003-do-not-link-against-crmf-library-it-is-not-there.patch

diff --git a/recipes-mozilla/firefox/firefox/0003-do-not-link-against-crmf-library-it-is-not-there.patch b/recipes-mozilla/firefox/firefox/0003-do-not-link-against-crmf-library-it-is-not-there.patch
new file mode 100644
index 0000000..7444be0
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/0003-do-not-link-against-crmf-library-it-is-not-there.patch
@@ -0,0 +1,48 @@
+From 82862c9be8e1c87d32b639403f1f5715c8f4be59 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 15 Dec 2016 00:23:41 +0100
+Subject: [PATCH] do not link against crmf library - it is not there
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ config/external/nss/crmf/moz.build | 1 -
+ configure                          | 6 +-----
+ 2 files changed, 1 insertion(+), 6 deletions(-)
+
+diff --git a/config/external/nss/crmf/moz.build b/config/external/nss/crmf/moz.build
+index 9b8005f..4bfcc81 100644
+--- a/config/external/nss/crmf/moz.build
++++ b/config/external/nss/crmf/moz.build
+@@ -8,7 +8,6 @@ Library('crmf')
+ 
+ if CONFIG['MOZ_NATIVE_NSS']:
+     OS_LIBS += [l for l in CONFIG['NSS_LIBS'] if l.startswith('-L')]
+-    OS_LIBS += ['-lcrmf']
+ else:
+     USE_LIBS += [
+         # The dependency on nss is not real, but is required to force the
+diff --git a/configure b/configure
+index 312c8a3..2f77843 100755
+--- a/configure
++++ b/configure
+@@ -15689,11 +15689,7 @@ echo "configure:15633: checking for NSS - version >= $min_nss_version" >&5
+ 
+ fi
+ 
+-if test -n "$MOZ_NATIVE_NSS"; then
+-   NSS_LIBS="$NSS_LIBS -lcrmf"
+-else
+-   NSS_CFLAGS="-I${DIST}/include/nss"
+-fi
++
+ 
+ 
+ echo $ac_n "checking for YASM assembler""... $ac_c" 1>&6
+-- 
+2.7.4
+
diff --git a/recipes-mozilla/firefox/firefox_45.6.0esr.bb b/recipes-mozilla/firefox/firefox_45.6.0esr.bb
index a4ae32f..bed50dd 100644
--- a/recipes-mozilla/firefox/firefox_45.6.0esr.bb
+++ b/recipes-mozilla/firefox/firefox_45.6.0esr.bb
@@ -41,6 +41,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox
            file://fixes/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch \
            file://0001-use-pkg-config-to-find-nss.patch \
            file://0002-use-pkg-config-to-find-nspr.patch \
+           file://0003-do-not-link-against-crmf-library-it-is-not-there.patch \
            "
 
 SRC_URI[archive.md5sum] = "ee3cf2401a5716cebacaae5fb70d133f"
-- 
2.7.4


