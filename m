Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD33FC433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 01:30:52 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web09.5842.1639359051105658748
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Dec 2021 17:30:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=RdzXEs0V;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.45, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f45.google.com with SMTP id b1so27999199lfs.13
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Dec 2021 17:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lMEyDqGUk4pZcnIiouLjzfuULFeijabGd2Z0UMYA5H0=;
        b=RdzXEs0VwVAbRaTMIe0gKRX4/EAQPFxB5fFCsmed1B0DKqGJBWbpOIPirIgBYqvptX
         BoK8YbWhRQA7jCszYXni6QS9pneK7BUdiDxBl72bzxZUOrkQPObqD8tWWBmpdBTeso1x
         WhnpT2465UdoybviXKJhG6Bp6NvhTQafGTrO/lKYL70ZOaitNWrq5oEReJqiZv9UcKCr
         znJ/6gNzHee4UlBquX5uzigx4RS9zNyLRnjo+EHZZ3aPO/XkOsBb6GUWnFTeaOWIIpdO
         QAbhrTfDJrbhedkCw6uXnqizvYeKw3QYJgq2EwGVkrdUBZ6tNY24fbUpCR5HcXHBABm1
         i3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lMEyDqGUk4pZcnIiouLjzfuULFeijabGd2Z0UMYA5H0=;
        b=EjDf6h21iawQ+y1g8fju8kwILeXCDcvKQ23ax4PDGjwn5cpI2fIMl2Kq1Z7oPESTBU
         Ee91K+3XbruxKuUcuNC4mgDuJa7jzOPiwzR/w0tmmDioOwB5o1EyglHTwhM1jOc0YT+J
         j30z0RNGhYZBj2bV9eS18Ljzo0oFSL5qRABo3Xje+LDUQ0YegasfF4La/j4VtxCg4efo
         G5bV2B03/nGOUjn/UgZfePSzS7LBECK6IaMTuelXD20hoz0qiHSlPjM6ztuX+2ltvsAc
         XRh1QYZK021LNYR9gO2lxCj6ucv7u4NKwg5UeF7L3UWaTjBjDI5Hz307p/Lg/xVQL+8/
         uDPQ==
X-Gm-Message-State: AOAM5330DiArpdkBFqplq1Z5kbubQLhb9PhR+9WZ0MHYjqiXy3hqLZrO
	uAer+YZaCOHnwjOoVQC3aqgrg7qU+ibpp2gt
X-Google-Smtp-Source: 
 ABdhPJxKymUtL/U3Kh0WYuUorfQeIWkUOEH9lLn9HdW1ofyB0LTR+kDMvAi3pur7b3obtvxPc4Q8pA==
X-Received: by 2002:ac2:5233:: with SMTP id
 i19mr21965131lfl.592.1639359048448;
        Sun, 12 Dec 2021 17:30:48 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 q15sm1229630lfp.32.2021.12.12.17.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 17:30:48 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] dbus-cxx: update to 2.1.0
Date: Mon, 13 Dec 2021 02:30:45 +0100
Message-Id: <20211213013045.627351-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 01:30:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94308

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{dbus-cxx_0.12.bb => dbus-cxx_2.1.0.bb}   | 14 ++++---
 .../0001-Include-typeinfo-for-typeid.patch    | 29 ++++++++++++++
 .../dbus-cxx/files/fix_build_musl.patch       | 38 ++++++-------------
 3 files changed, 49 insertions(+), 32 deletions(-)
 rename meta-oe/recipes-core/dbus-cxx/{dbus-cxx_0.12.bb => dbus-cxx_2.1.0.bb} (58%)
 create mode 100644 meta-oe/recipes-core/dbus-cxx/files/0001-Include-typeinfo-for-typeid.patch

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_0.12.bb b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb
similarity index 58%
rename from meta-oe/recipes-core/dbus-cxx/dbus-cxx_0.12.bb
rename to meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb
index bf393cd87..1524f096f 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_0.12.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb
@@ -1,22 +1,24 @@
 SUMMARY = "D-Bus wrapper in C++ for dbus"
 HOMEPAGE = "https://dbus-cxx.github.io/"
+BUGTRACKER = "https://github.com/libsigcplusplus/libsigcplusplus/issues"
 SECTION = "base"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4cf0188f02184e1e84b9586ac53c3f83"
 
-FILEEXTRAPATHS:prepend = "${THISDIR}/files"
-SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=master;protocol=https"
-SRC_URI += "file://fix_build_musl.patch"
-SRCREV = "ea7f8e361d11dc7d41d9ae2c4128aed2cdadd84e"
+SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=master;protocol=https \
+           file://0001-Include-typeinfo-for-typeid.patch \
+"
+SRC_URI:append:libc-musl = "file://fix_build_musl.patch"
+SRCREV = "73532d6a5faae9c721c2cc9535b8ef32d4d18264"
 
 DEPENDS = "\
 	dbus \
-	libsigc++-2.0 \
+	libsigc++-3 \
 "
 
 RDEPENDS:${PN} = "\
 	dbus \
-	libsigc++-2.0 \
+	libsigc++-3 \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-core/dbus-cxx/files/0001-Include-typeinfo-for-typeid.patch b/meta-oe/recipes-core/dbus-cxx/files/0001-Include-typeinfo-for-typeid.patch
new file mode 100644
index 000000000..911787740
--- /dev/null
+++ b/meta-oe/recipes-core/dbus-cxx/files/0001-Include-typeinfo-for-typeid.patch
@@ -0,0 +1,29 @@
+From e262b6e7cc6271d71405f10c4817b9b3b2b95f05 Mon Sep 17 00:00:00 2001
+From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
+Date: Mon, 13 Dec 2021 02:00:48 +0100
+Subject: [PATCH] Include typeinfo for typeid()
+
+Otherwise fails with:
+    error: must '#include <typeinfo>' before using 'typeid'
+
+Upstream-Status: Submitted
+[https://github.com/dbus-cxx/dbus-cxx/pull/83]
+---
+ dbus-cxx/demangle.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/dbus-cxx/demangle.h b/dbus-cxx/demangle.h
+index b71bcb9..9a4e99b 100644
+--- a/dbus-cxx/demangle.h
++++ b/dbus-cxx/demangle.h
+@@ -21,6 +21,7 @@
+ #define DBUSCXX_DEMANGLE_H
+ 
+ #include <string>
++#include <typeinfo>
+ #include <dbus-cxx/dbus-cxx-config.h>
+ 
+ #if DBUS_CXX_HAS_CXXABI_H
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-core/dbus-cxx/files/fix_build_musl.patch b/meta-oe/recipes-core/dbus-cxx/files/fix_build_musl.patch
index 3d912e0b0..e55d987e4 100644
--- a/meta-oe/recipes-core/dbus-cxx/files/fix_build_musl.patch
+++ b/meta-oe/recipes-core/dbus-cxx/files/fix_build_musl.patch
@@ -1,26 +1,12 @@
-diff --git a/dbus-cxx/timeout.cpp b/dbus-cxx/timeout.cpp
-index 16e9f7e..aa0b99f 100644
---- a/dbus-cxx/timeout.cpp
-+++ b/dbus-cxx/timeout.cpp
-@@ -132,7 +132,7 @@ namespace DBus
-     return m_cobj;
-   }
- 
--  void Timeout::timer_callback_proxy( sigval_t sv ) {
-+  void Timeout::timer_callback_proxy( union sigval sv ) {
-     SIMPLELOGGER_DEBUG( "dbus.Timeout","Timeout::timer_callback_proxy" );
-     Timeout* t;
-     t = ( Timeout* ) sv.sival_ptr;
-diff --git a/dbus-cxx/timeout.h b/dbus-cxx/timeout.h
-index 1e469b5..5b69fbb 100644
---- a/dbus-cxx/timeout.h
-+++ b/dbus-cxx/timeout.h
-@@ -83,7 +83,7 @@ namespace DBus
- 
-       std::mutex m_arming_mutex;
- 
--      static void timer_callback_proxy( sigval_t sv );
-+      static void timer_callback_proxy( union sigval sv );
- 
-   };
- 
+diff --git a/dbus-cxx/sasl.cpp b/dbus-cxx/sasl.cpp
+index e8a6060..7a76af6 100644
+--- a/dbus-cxx/sasl.cpp
++++ b/dbus-cxx/sasl.cpp
+@@ -70,7 +70,7 @@ std::tuple<bool, bool, std::vector<uint8_t>> SASL::authenticate() {
+     bool success = false;
+     bool negotiatedFD = false;
+     std::vector<uint8_t> serverGUID;
+-    __uid_t uid = getuid();
++    uid_t uid = getuid();
+     std::string line;
+     std::smatch regex_match;
-- 
2.25.1


