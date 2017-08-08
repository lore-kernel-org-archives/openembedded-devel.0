Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4F99177B14
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 21:38:40 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id t201so17264035wmt.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 14:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=/XEEdqkIbnwmi+7FuguysMDeXl3vV8QMcct9YCSH6uI=;
	b=EWfFRYVVc7HBfwDxAkww2n9tMXeOtUuICEKvI1sVeg4qU2Cw3yFvdTL/eazgfNon3g
	PAwLJNYO3SrN5ZbQmk12GsVpO3qzLzieaGIzPj8mjKPGZkVyJ6ovWgU0F7w1F9p3Di1+
	Nqr1VZSOWYNTQqAXJUEuTUv3clOBgU7bkt50moq9lw4PCQJ0egQUZGgQ72bOsENROGm3
	AilJImtI1hbhJNxB8ivxASz0Wumbn1Q5M1zpt8DsJy88fzGI2dw+mhIWwdn8XHREBBm6
	V7FGz66iKtYjN5OBhEl8Hc2/9mAW+7M0n4hxFVsDiRoMyLRor7bpuUGxbm+XQ5CzB3rJ
	H71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/XEEdqkIbnwmi+7FuguysMDeXl3vV8QMcct9YCSH6uI=;
	b=BjETad69vtd5yFTilYd9BDb+0vEnDqmTTVndwTfqSvoUYRUa0+xO2A6EInOpWo2/QX
	ZxPh4Nkd7X9ytfx8n1TH9+3nfxbcTvD8pV+kAjw2ATFf5AuzLVd3ez+U4lP48ZN+XBDj
	ROSotHn4qS/RrHsAsA54Tl2MFB/NepQaur8LbcodVkWL51YMC4XmLxPKp9hXeniErVfU
	hban3yFgCPEuCG3tO6ZpSF6RvSGvSYVWF3SA38mMtiEYeA6I0ZoDos2G6Zd3Hd3ruCTV
	viU1mBWKqh2USPAeLFM5qopDPNyddYjlyXXZ2dXLqkH9CqIAmv6vrY4LqZ0Xqza1Kf2a
	gIRw==
X-Gm-Message-State: AHYfb5j5sOgnEbOjD6a/mcn8WFmlBONd27SgbnAa/qfjQL1R8TZMVwhU
	krJil9DQlgT0zdQc
X-Received: by 10.28.113.221 with SMTP id d90mr4331643wmi.49.1502228320800;
	Tue, 08 Aug 2017 14:38:40 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E90C29881E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e90c:2988:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	p68sm14587855wmf.0.2017.08.08.14.38.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 14:38:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 23:38:20 +0200
Message-Id: <20170808213821.17561-8-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170808213821.17561-1-schnitzeltony@googlemail.com>
References: <20170808213821.17561-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] kodi: fix build with latest gcc
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
X-List-Received-Date: Tue, 08 Aug 2017 21:38:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../kodi-17/0013-FTPParse.cpp-use-std-string.patch | 96 ++++++++++++++++++++++
 .../recipes-mediacenter/kodi/kodi_17.bb            |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0013-FTPParse.cpp-use-std-string.patch

diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0013-FTPParse.cpp-use-std-string.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0013-FTPParse.cpp-use-std-string.patch
new file mode 100644
index 0000000..c9c9066
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0013-FTPParse.cpp-use-std-string.patch
@@ -0,0 +1,96 @@
+From 5fa10ff6b1b60abee172296d9c1dec8dfc10615c Mon Sep 17 00:00:00 2001
+From: Stefan Saraev <stefan@saraev.ca>
+Date: Sun, 7 May 2017 17:30:47 +0300
+Subject: [PATCH] FTPParse.cpp: use std::string
+
+Fixes build with newer gcc versions.
+
+Taken from [1]
+
+Upstream-Status: Backport [2]
+
+[1] https://git.busybox.net/buildroot/plain/package/kodi/0003-FTPParse.cpp-use-std-string.patch?id=e2f03a6bde19766a1ac047c5ccfb049b5c4f61ca
+[2] https://github.com/xbmc/xbmc/commit/5fa10ff6b1b60abee172296d9c1dec8dfc10615c
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ xbmc/filesystem/FTPParse.cpp | 44 ++++++++++++++++++++++----------------------
+ 1 file changed, 22 insertions(+), 22 deletions(-)
+
+diff --git a/xbmc/filesystem/FTPParse.cpp b/xbmc/filesystem/FTPParse.cpp
+index cfcc7c64ed..b0f676ae1a 100644
+--- a/xbmc/filesystem/FTPParse.cpp
++++ b/xbmc/filesystem/FTPParse.cpp
+@@ -34,7 +34,7 @@ CFTPParse::CFTPParse()
+   m_time = 0;
+ }
+ 
+-string CFTPParse::getName()
++std::string CFTPParse::getName()
+ {
+   return m_name;
+ }
+@@ -59,16 +59,16 @@ time_t CFTPParse::getTime()
+   return m_time;
+ }
+ 
+-void CFTPParse::setTime(string str)
++void CFTPParse::setTime(std::string str)
+ {
+   /* Variables used to capture patterns via the regexes */
+-  string month;
+-  string day;
+-  string year;
+-  string hour;
+-  string minute;
+-  string second;
+-  string am_or_pm;
++  std::string month;
++  std::string day;
++  std::string year;
++  std::string hour;
++  std::string minute;
++  std::string second;
++  std::string am_or_pm;
+ 
+   /* time struct used to set the time_t variable */
+   struct tm time_struct = {};
+@@ -338,21 +338,21 @@ int CFTPParse::getDayOfWeek(int month, int date, int year)
+   return day_of_week;
+ }
+ 
+-int CFTPParse::FTPParse(string str)
++int CFTPParse::FTPParse(std::string str)
+ {
+   /* Various variable to capture patterns via the regexes */
+-  string permissions;
+-  string link_count;
+-  string owner;
+-  string group;
+-  string size;
+-  string date;
+-  string name;
+-  string type;
+-  string stuff;
+-  string facts;
+-  string version;
+-  string file_id;
++  std::string permissions;
++  std::string link_count;
++  std::string owner;
++  std::string group;
++  std::string size;
++  std::string date;
++  std::string name;
++  std::string type;
++  std::string stuff;
++  std::string facts;
++  std::string version;
++  std::string file_id;
+ 
+   /* Regex for standard Unix listing formats */
+   pcrecpp::RE unix_re("^([-bcdlps])" // type
+-- 
+2.11.0
+
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
index 5a9fa98..5158f05 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
@@ -79,6 +79,7 @@ SRC_URI = "git://github.com/xbmc/xbmc.git;branch=Krypton \
            file://0011-Let-configure-pass-on-unknown-architectures-setting-.patch \
            file://0012-Revert-droid-fix-builds-with-AML-disabled.patch \
            file://0001-change-order-of-detecting-libegl-and-libgles2.patch \
+           file://0013-FTPParse.cpp-use-std-string.patch \
 "
 
 SRC_URI_append_libc-musl = " \
-- 
2.9.4


