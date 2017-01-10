Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 58AB47199A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2017 18:48:59 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id c206so84957977wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2017 10:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u04Iv25A56s7AxUYs51BpCv7VKsjVv8aLE6N0BElTHc=;
	b=a0VeYVOzgwIck8lwI+qTU7W0CMNAxRlPVa3XeBvbK8HzqAvGIf8qyLzmt0BDDYhV1h
	ALZHnSH+2ucTZeo5ETwh1eNj3BiYCLguZriLDk4ym82qjK8XdcETyqDWNtk4D34+AR0i
	penHGh49d9Ly0hfwEZJAW+jPqAhmS639JcWjTQ/aBB+peszg8d3u1igA5vI7ECdCfaca
	egngsmlod5pxDgjTxcoSKPrpavYCyqvzwgu0BSpTkYrgTGFKM3oX0q97FsCqmns7utXc
	2szen9KQEAeiBtFW3mEIUg6avzD+YIYwt81ERvqr3JoZSMqC8adcmKHdPk5FQoYkahx9
	aiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u04Iv25A56s7AxUYs51BpCv7VKsjVv8aLE6N0BElTHc=;
	b=XNyk3yjKn/0HyN8S4Vj7zYUfTuYA0KqzfahZ1C/U0GtrxXt7N8+We1lBvaVrtzqcL/
	mQqVvlphloM1uFQ/723qD5aQ27G/zfr1UMSgDFxyhJOvTGppL1grkMX7QCLzpQCsiut7
	PWS8OqRRQnc2qnXAv2th2NJ27qUN3+MqMbaHMLOEwA6N4co4mbztAUCUj6sgtmp4EISA
	qcAYUgk3k4qwjeKYcrRCjR119qzLwx/iW6Gn+EgnyhxzT3Qi9r4ycRdSpvZ2o/QKCBgJ
	v/ZDKeUKnA72VwflR4osv6Q60YUwdkuPgFT7QgnSjms+dkhhtdbUAAZnS51C751L5RrQ
	5zng==
X-Gm-Message-State: AIkVDXKeSzvXbz1emz84GQ4OFw2WQ03yxw4hmrEsBI2gFbdYznx9pN7S7n/pwTQIQkNAbQ==
X-Received: by 10.28.165.82 with SMTP id o79mr2588421wme.129.1484074139105;
	Tue, 10 Jan 2017 10:48:59 -0800 (PST)
Received: from localhost.localdomain (p579F7DD6.dip0.t-ipconnect.de.
	[87.159.125.214]) by smtp.googlemail.com with ESMTPSA id
	r5sm9007071wme.23.2017.01.10.10.48.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jan 2017 10:48:58 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jan 2017 19:48:45 +0100
Message-Id: <1484074127-21458-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [meta-browser][PATCH V2 1/3] firefox: fix configure with oe-core master - there is no nss-config
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
X-List-Received-Date: Tue, 10 Jan 2017 18:49:00 -0000
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
index 0000000..8bb6c55
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
+index c27acdd..16133bf 100755
+--- a/configure
++++ b/configure
+@@ -15630,7 +15630,8 @@ fi
+ 	min_nss_version=3.21.3
+ 	echo $ac_n "checking for NSS - version >= $min_nss_version""... $ac_c" 1>&6
+ echo "configure:15633: checking for NSS - version >= $min_nss_version" >&5
+-
++    NSS_CONFIG="pkg-config nss"
++    nss_config_args=
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
+2.5.5
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
2.5.5


