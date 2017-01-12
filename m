Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A142F719E7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 07:44:44 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c85so1831337wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 23:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=W5u0DZrSQ8qC7c3N3vgKhc5CZw9yJZRqLFRBN112jP4=;
	b=a7xzN3eqI8nvOi2PR09CO0i3KPLOj3QEmU8zktWfz/6vuvOlUMnQxng92noztwhj3H
	y1AE034aco2OOdVWgUyYO4oefFoG2CqNZGXmGVENhyAGSN4JJvyv99r3mEl0oXADElko
	RO77ttxgfigr872TmSqwsKLENOME77F9+8GWUZLmgKSuRHujIhqOKHshb5i38XMYM2qQ
	OnarCwUhe/ZOy5e2gmT0NRQiEsFVmH1984PcCajdI/y/qwF1oQKPfFFDu9gBYkuW6VmY
	Ou0j987jBYmAYvzIH04Rq1iPateW2I/MZM0NvJeycTVGAxCKBZQD6Zbv8Cblhp9/IKze
	tuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=W5u0DZrSQ8qC7c3N3vgKhc5CZw9yJZRqLFRBN112jP4=;
	b=EzJkXPK0mdMbKDjZFpmbkP5bywVLJS5Snj/Y2/pZUqn7y3uw9xQjQ0O4eDnylboOZD
	miK/77hW7y5uYrTeO1vQlHr/01gYl3s+1zf0Ia2YoQ4hFMwhs1YiS7u7R+3LKwyOUJBx
	j3F12QWHX0EEkQojyS0iwru+6q2JklDNS0sWtgWuGuOrdmRhADsHE7Qv4+6XNLgbTlAT
	PvlOLovdV8qzElNBXy7EQ8EcQY2gDZLw/FMcB/q41NQPAiCVwREbnIiivb3if4HCQpGI
	HMnYCibJ2/AGqC4S1fy5SsOhtuDF8AgdSwJOwegFK98gPikg/D8AGQadspnSvzK0UEMx
	UqAg==
X-Gm-Message-State: AIkVDXKG/GO076EL7YB5PU5tT3mSuNRfzGkd0nmOhDo9K56/6vkSChogtpb2l9IVNWsGUQ==
X-Received: by 10.223.139.154 with SMTP id o26mr6217051wra.28.1484207084302;
	Wed, 11 Jan 2017 23:44:44 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-91-251-48.hsi12.unitymediagroup.de. [109.91.251.48])
	by smtp.googlemail.com with ESMTPSA id
	wp2sm12186778wjc.35.2017.01.11.23.44.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Jan 2017 23:44:43 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jan 2017 08:44:26 +0100
Message-Id: <1484207068-21151-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484207068-21151-1-git-send-email-schnitzeltony@googlemail.com>
References: <1484207068-21151-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-browser][PATCH V3 1/3] firefox: fix configure with oe-core master - there is no nss-config
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
X-List-Received-Date: Thu, 12 Jan 2017 07:44:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| configure:15633: checking for NSS - version >= 3.21.3
| configure: error: you don't have NSS installed or your version is too old

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../firefox/0001-use-pkg-config-to-find-nss.patch  | 47 ++++++++++++++++++++++
 recipes-mozilla/firefox/firefox_45.6.0esr.bb       |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 recipes-mozilla/firefox/firefox/0001-use-pkg-config-to-find-nss.patch

diff --git a/recipes-mozilla/firefox/firefox/0001-use-pkg-config-to-find-nss.patch b/recipes-mozilla/firefox/firefox/0001-use-pkg-config-to-find-nss.patch
new file mode 100644
index 0000000..eac2783
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/0001-use-pkg-config-to-find-nss.patch
@@ -0,0 +1,47 @@
+From f5533e4f2ac147256f7c41166ae1ef98f41d7f39 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 14 Dec 2016 21:37:03 +0100
+Subject: [PATCH] use pkg-config to find nss
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/configure b/configure
+index c27acdd..9b68803 100755
+--- a/configure
++++ b/configure
+@@ -15630,7 +15630,8 @@ fi
+ 	min_nss_version=3.21.3
+ 	echo $ac_n "checking for NSS - version >= $min_nss_version""... $ac_c" 1>&6
+ echo "configure:15633: checking for NSS - version >= $min_nss_version" >&5
+-
++	NSS_CONFIG="pkg-config nss"
++	nss_config_args=
+ 	no_nss=""
+ 	if test "$NSS_CONFIG" = "no"; then
+ 		no_nss="yes"
+@@ -15638,11 +15639,11 @@ echo "configure:15633: checking for NSS - version >= $min_nss_version" >&5
+ 		NSS_CFLAGS=`$NSS_CONFIG $nss_config_args --cflags`
+ 		NSS_LIBS=`$NSS_CONFIG $nss_config_args --libs`
+ 
+-		nss_config_major_version=`$NSS_CONFIG $nss_config_args --version | \
++		nss_config_major_version=`$NSS_CONFIG $nss_config_args --modversion | \
+ 			sed 's/\([0-9]*\)\.\([0-9]*\)\(\.\([0-9]*\)\)\{0,1\}/\1/'`
+-		nss_config_minor_version=`$NSS_CONFIG $nss_config_args --version | \
++		nss_config_minor_version=`$NSS_CONFIG $nss_config_args --modversion | \
+ 			sed 's/\([0-9]*\)\.\([0-9]*\)\(\.\([0-9]*\)\)\{0,1\}/\2/'`
+-		nss_config_micro_version=`$NSS_CONFIG $nss_config_args --version | \
++		nss_config_micro_version=`$NSS_CONFIG $nss_config_args --modversion | \
+ 			sed 's/\([0-9]*\)\.\([0-9]*\)\(\.\([0-9]*\)\)\{0,1\}/\4/'`
+ 		if test -z "$nss_config_micro_version"; then
+ 			nss_config_micro_version="0"
+-- 
+2.7.4
+
diff --git a/recipes-mozilla/firefox/firefox_45.6.0esr.bb b/recipes-mozilla/firefox/firefox_45.6.0esr.bb
index b3c839c..6ca6633 100644
--- a/recipes-mozilla/firefox/firefox_45.6.0esr.bb
+++ b/recipes-mozilla/firefox/firefox_45.6.0esr.bb
@@ -39,6 +39,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox
            file://debian-hacks/Avoid-wrong-sessionstore-data-to-keep-windows-out-of.patch \
            file://Fix-firefox-install-dir.patch \
            file://fixes/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch \
+           file://0001-use-pkg-config-to-find-nss.patch \
            "
 
 SRC_URI[archive.md5sum] = "ee3cf2401a5716cebacaae5fb70d133f"
-- 
2.7.4


