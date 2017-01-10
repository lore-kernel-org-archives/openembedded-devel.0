Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id CC73660616
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2017 11:55:03 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id c206so69666257wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2017 03:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=8cJ8RmT/sF9/Uccy28rAawXuDyP/lLyx384/S1XM8M0=;
	b=tSuX2dP+e8ggi2d+iJkFrrMvfvEHt6hstYMrEKUiPFUAq3i8XIxAh1hslLHq6FRDEs
	e28tQw51XyaL/CdYO5U8fEMZ7fjK2zYIQ+ZWTRARH75MQDhTiYF7fG8Z2pWWUBHaK2Xv
	iwF9024e+VDjP8ePCcNuptbEiLb/GcJXFUfIx6stCsXRrvkGU1M9W7Fk2pIso5cKXi3Q
	ZBN2Z07p3sk1JcgXk4rkRdYzgIlBs+TL5pHOjsSJs2Skgtv8D6z2IJak6RtOO7t6tZvJ
	3g/gCmqg2H7FyFs0I+e0GF8VRrzTejlLOGM13/xbeRbMCe0LatzX0vkTNxaqM/z88eA5
	aOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8cJ8RmT/sF9/Uccy28rAawXuDyP/lLyx384/S1XM8M0=;
	b=VBmTTbFUImI1kLFkVTh2cZnO8J8jv/G9umAT0v4NT61l0Ly8PqCkqxBuNspJ06xwqE
	iIKdyaLCu4MvqeFPPLPKdokeHXZqQ2fGPkMSxXMHOHgOFOnTvYYVxpeE/9MMrrAN8Nvp
	FANwMqn+OnH9HgMiAi3eb4WxjMxR33myfGlZELKHEKwtRvF//TgX4QC/KNxUDjYVIz3s
	bBJZEoKOyBrkmTVMNVdc3yGNQV7vIjPACxPGZnysA2GVtwJQBB0kj9zNZPc2O4TfIOeD
	OgDNHbn6IhQJhcwEUqseMlurZgQ0w6gr97s6nxQNoksIg0nutgjhbqNQ8VfyZOmsq8mj
	5hSA==
X-Gm-Message-State: AIkVDXIc4BCyk++6yqGQHb+h8HHEOsHuybMaLcrrGUvuJmD5RsIvZgwuf4yrOPT7+0KZQSMz
X-Received: by 10.223.168.87 with SMTP id l81mr1684272wrc.194.1484049303424;
	Tue, 10 Jan 2017 03:55:03 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id o3sm2851462wjx.39.2017.01.10.03.55.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jan 2017 03:55:02 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jan 2017 12:54:56 +0100
Message-Id: <1484049296-1043-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH v2] tcpdump: upgrade to 4.8.1
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
X-List-Received-Date: Tue, 10 Jan 2017 11:55:04 -0000

Upgraded tcpdump to version 4.8.1 and removed deprecated ipv6 configure
flag.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../recipes-support/tcpdump/{tcpdump_4.7.4.bb => tcpdump_4.8.1.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.7.4.bb => tcpdump_4.8.1.bb} (85%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb
similarity index 85%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb
index e18228f..35a5cfe 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb
@@ -12,16 +12,15 @@ SRC_URI = " \
     file://add-ptest.patch \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "58af728de36f499341918fc4b8e827c3"
-SRC_URI[sha256sum] = "6be520269a89036f99c0b2126713a60965953eab921002b07608ccfc0c47d9af"
+SRC_URI[md5sum] = "32f57943649f276e09236ba66622bb0c"
+SRC_URI[sha256sum] = "20e4341ec48fcf72abcae312ea913e6ba6b958617b2f3fb496d51f0ae88d831c"
 export LIBS=" -lpcap"
 
 inherit autotools-brokensep ptest
 CACHED_CONFIGUREVARS = "ac_cv_linux_vers=${ac_cv_linux_vers=2}"
 
-PACKAGECONFIG ??= "openssl ipv6"
+PACKAGECONFIG ??= "openssl"
 PACKAGECONFIG[openssl] = "--with-crypto=yes, --without-openssl --without-crypto, openssl"
-PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
 PACKAGECONFIG[smi] = "--with-smi, --without-smi,libsmi"
 PACKAGECONFIG[libcap-ng] = "--with-cap-ng=yes,--with-cap-ng=no,libcap-ng"
 
-- 
2.7.4


