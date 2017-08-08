Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0CD9F77BB1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 21:48:15 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id c65so4256803pfl.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 14:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aT/uSBhX9d8/o8FUe/irObOE0g+h31a2a0mIFO64F4w=;
	b=m8DEMaAKV90PFu5Sh6z12GY05QWR4D4TeAzQK+0zL+20GCF0iBqxB4yd/dzahxyNXI
	eODq15vDyttYv7kR/35GfuHux2ye7ooz9/78fFFvWVudlEWo5+G3s6jb6vAhAF8QSY2f
	hDIXqPPtmymrOhh25RU8wOolT4VaPY+YxvRktpbC7b/fE9f17/Gz+nF4ni4v+N6TJf7S
	T38A8AHb4Fb/FhEx/31/4l9pdwOEzjXxVTm6nJlUmmV4dXojICDvjtUxnwDCUt75gUXC
	EetXscZUw4FnwCbmBQMcOXt4GR35VjF/hZXmail/fpYrdfhrtuMKrKjVs6lYNtqLeLnX
	uGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aT/uSBhX9d8/o8FUe/irObOE0g+h31a2a0mIFO64F4w=;
	b=hst5USDteMElc9GnRgHS1djYaO7WmkHWvkIMzIp3IK1bMbGBrvHQhlPIOlBD3xoy52
	uhjfkQfITFUkBHcmbXBEJdZMgCdeCh1JOfRFgaWTLSCgQu97pLB9eZiKWdcIbwruUo04
	6QyTYsH086zC2OBK9dvmtUubIwYav2F9BNh88JAFt1wePwT165wr1vKoDg+PgibghiXU
	7nUtWZYIpZyUennqMoe1GK+EGM5dN4Gxc1NhZCxnqjs4aO3MChlFaqyc5LBq/Po5E4Z6
	hStBpphunWEghpcRntT6otM5Taj5g2LUjgGu3NtD5X3KyTZ4jU5WakW5N7oL1Hx8A5sB
	2bqA==
X-Gm-Message-State: AHYfb5izNCxWMH+xrnL/UAOyuWd2/vsRcZKxQYj4nYGr/T5P1J+3Gckp
	Awjkm+R+Rh0GBWub
X-Received: by 10.98.209.10 with SMTP id z10mr5893921pfg.93.1502228897056;
	Tue, 08 Aug 2017 14:48:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::f213])
	by smtp.gmail.com with ESMTPSA id
	d135sm2768713pga.6.2017.08.08.14.48.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 14:48:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 14:47:55 -0700
Message-Id: <20170808214800.39621-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170808214800.39621-1-raj.khem@gmail.com>
References: <20170808214800.39621-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 4/9] kodi: Use std namespace for string objects
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
X-List-Received-Date: Tue, 08 Aug 2017 21:48:16 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ilesystems-string-is-in-the-std-namespace.patch | 88 ++++++++++++++++++++++
 .../recipes-mediacenter/kodi/kodi_17.bb            |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0013-filesystems-string-is-in-the-std-namespace.patch

diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0013-filesystems-string-is-in-the-std-namespace.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0013-filesystems-string-is-in-the-std-namespace.patch
new file mode 100644
index 000000000..7f8926df3
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0013-filesystems-string-is-in-the-std-namespace.patch
@@ -0,0 +1,88 @@
+From 4f2448129128f12fcf3a232c6801eb687c742947 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 1 Aug 2017 20:04:33 -0700
+Subject: [PATCH] filesystems: string is in the std namespace
+
+Use std::string instead of string
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
+2.13.3
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
index 5a9fa9801..790a12e78 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
@@ -79,6 +79,7 @@ SRC_URI = "git://github.com/xbmc/xbmc.git;branch=Krypton \
            file://0011-Let-configure-pass-on-unknown-architectures-setting-.patch \
            file://0012-Revert-droid-fix-builds-with-AML-disabled.patch \
            file://0001-change-order-of-detecting-libegl-and-libgles2.patch \
+           file://0013-filesystems-string-is-in-the-std-namespace.patch \
 "
 
 SRC_URI_append_libc-musl = " \
-- 
2.14.0


