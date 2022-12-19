Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF4EC4708D
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 07:34:14 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.15970.1671435245853989962
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Dec 2022 23:34:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CSqJaZ9e;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id v23so2951868pju.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Dec 2022 23:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7mMskHg1ISA56f0jIqJOvsBCpzGBpNfF2FMvUsM7GI=;
        b=CSqJaZ9e1ExMDk+ZVIFwCbLfM66lcQAiwKDXTLYzsdfu/c9wPEm97tbkWUo5xPMLM5
         iorZzCeYz8qAvDGF4lDNRTkwf9CHMRxpmqeU8qfsM1BBJE+aIZINNXOO7tDo5jozQp3h
         sh2Q8zpm081/P8iSBBHZr8TRYFD2UuPhvAchHVy6MoMc1jKTXxlfPleH9uxy0mJX472M
         BPZQbra8UyKfnQmnEp/1QhmFfUhXRuTzHi7w+bIR3+OIpmqnUDczjPthJSxTKajlwF8e
         f58cbB9ujfj4NsT0KSGJPbuAM1kIrxKr9YmvJjCG3tHg70S1K2JEH6PCojAsXFV8TBmb
         +yyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7mMskHg1ISA56f0jIqJOvsBCpzGBpNfF2FMvUsM7GI=;
        b=k784uwnKi7o4KiAXfIjY5Gz+VioNJXWqEdL7iA7xzQpm++D7BnBIGZxeK+jMvai70s
         Zy6OunyO0t3WFIYD2lyZnXIasCVdvs6cFgZGzaY3f0vG/hEIP64vycaz9cxZ5wIcgUYU
         RR+jkGvzn+Z1xifSZl4sxp9ZLRfzsUJYbOmd8wyhU5lXwUUGpO3N3K+Vvk+RjEjTePoB
         KEamIDMWRC+E5muksS8BbTpmV8mrCl34UoeHkXKUHo+K253TmIdumb5DAWw5ZzouNETw
         TKeHid7h2kpPNiF1AIYBv2ANYB7gQ1piY0qBS+UjmM3H56Kyg9z/X+NtjhC4rwj0EFaH
         en7A==
X-Gm-Message-State: ANoB5pnrw9LhlViCheBjDV5jks2Pzt/TRSuSTTmfd8fU2RRTgIjkpCqJ
	Er1d1L8wA50NOsWveHjKu9Lo1Tz/0UY=
X-Google-Smtp-Source: AA0mqf4U6mO/OLK9d7w22JTntMaNtnYkRZulMGBfPBZ8kd4A7RJ+GgalN2dAqDoUbD23JJi7YVOPPg==
X-Received: by 2002:a05:6a20:d48f:b0:9d:efbe:a0f5 with SMTP id im15-20020a056a20d48f00b0009defbea0f5mr50190967pzb.5.1671435244970;
        Sun, 18 Dec 2022 23:34:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id b17-20020a621b11000000b00576a89978e5sm5830350pfb.63.2022.12.18.23.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 23:34:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] libyui,libyui-ncurses: Upgrade to 4.2.3
Date: Sun, 18 Dec 2022 23:34:00 -0800
Message-Id: <20221219073400.1473072-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221219073400.1473072-1-raj.khem@gmail.com>
References: <20221219073400.1473072-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 07:34:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100092

Add a fix to build with lfs64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...eplace-off64_t-with-off_t-and-stat64.patch | 176 ++++++++++++++++++
 ...urses_4.1.1.bb => libyui-ncurses_4.2.3.bb} |   6 +-
 .../{libyui_4.1.1.bb => libyui_4.2.3.bb}      |   2 +-
 3 files changed, 181 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-libyui-ncurses-Replace-off64_t-with-off_t-and-stat64.patch
 rename meta-oe/recipes-graphics/libyui/{libyui-ncurses_4.1.1.bb => libyui-ncurses_4.2.3.bb} (89%)
 rename meta-oe/recipes-graphics/libyui/{libyui_4.1.1.bb => libyui_4.2.3.bb} (95%)

diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-libyui-ncurses-Replace-off64_t-with-off_t-and-stat64.patch b/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-libyui-ncurses-Replace-off64_t-with-off_t-and-stat64.patch
new file mode 100644
index 0000000000..b29e5dc7b2
--- /dev/null
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-libyui-ncurses-Replace-off64_t-with-off_t-and-stat64.patch
@@ -0,0 +1,176 @@
+From b81fb7942ab77b0bf6791e5fd98411dd68f133d9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 18 Dec 2022 15:13:00 -0800
+Subject: [PATCH] libyui-ncurses: Replace off64_t with off_t and stat64 with stat
+
+stat is same as stat64 when 64bit off_t is used.
+
+Upstream-Status: Submitted [https://github.com/libyui/libyui/pull/88]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt         |  2 +-
+ src/NCAskForFile.cc    |  6 +++---
+ src/NCFileSelection.cc | 24 ++++++++++++------------
+ src/NCFileSelection.h  |  6 +++---
+ 4 files changed, 19 insertions(+), 19 deletions(-)
+
+diff --git a/CMakeLists.txt b/libyui-ncurses/CMakeLists.txt
+index b10eab8e..2000bb58 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -58,7 +58,7 @@ set( CMAKE_INSTALL_MESSAGE LAZY ) # Suppress "up-to-date" messages during "make
+ # Initialize compiler flags for all targets in all subdirectories
+ add_compile_options( "-Wall" )
+ add_compile_options( "-Os" )    # Optimize for size (overrides CMake's -O3 in RELEASE builds)
+-
++add_compile_options( "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" ) # Enable largefile support
+ if ( WERROR )
+   add_compile_options( "-Werror" )
+ endif()
+diff --git a/src/NCAskForFile.cc b/libyui-ncurses/src/NCAskForFile.cc
+index aba6e0a6..44bb81bc 100644
+--- a/src/NCAskForFile.cc
++++ b/src/NCAskForFile.cc
+@@ -73,8 +73,8 @@ std::string NCAskForFile::checkIniDir( std::string iniDir )
+ {
+     std::string dname = "";
+ 
+-    struct stat64 statInfo;
+-    stat64( iniDir.c_str(), &statInfo );
++    struct stat statInfo;
++    stat( iniDir.c_str(), &statInfo );
+ 
+     if ( S_ISDIR( statInfo.st_mode ) )
+     {
+@@ -90,7 +90,7 @@ std::string NCAskForFile::checkIniDir( std::string iniDir )
+ 	     && pos != 0 )
+ 	{
+ 	    std::string dir = iniDir.substr( 0, pos );
+-	    stat64( dir.c_str(), &statInfo );
++	    stat( dir.c_str(), &statInfo );
+ 
+ 	    if ( S_ISDIR( statInfo.st_mode ) )
+ 	    {
+diff --git a/src/NCFileSelection.cc b/libyui-ncurses/src/NCFileSelection.cc
+index 3eb9c908..8894dc72 100644
+--- a/src/NCFileSelection.cc
++++ b/src/NCFileSelection.cc
+@@ -46,7 +46,7 @@ using std::list;
+ 
+ 
+ NCFileInfo::NCFileInfo( string	        fileName,
+-			struct stat64 *	statInfo,
++			struct stat *	statInfo,
+ 			bool	        link )
+ {
+     _name   = fileName;
+@@ -146,7 +146,7 @@ NCFileInfo::NCFileInfo()
+     _mode     = ( mode_t )0;
+     _device   = ( dev_t )0;
+     _links    = ( nlink_t )0;
+-    _size     = ( off64_t )0;
++    _size     = ( off_t )0;
+     _mtime    = ( time_t )0;
+ }
+ 
+@@ -177,11 +177,11 @@ NCFileSelection::NCFileSelection( YWidget *           parent,
+ {
+     SetSepChar( ' ' );
+ 
+-    struct stat64 statInfo;
++    struct stat statInfo;
+ 
+     if ( !iniDir.empty() )
+     {
+-	stat64( iniDir.c_str(), &statInfo );
++	stat( iniDir.c_str(), &statInfo );
+     }
+ 
+     if ( iniDir.empty()
+@@ -559,8 +559,8 @@ NCursesEvent NCFileTable::wHandleInput( wint_t key )
+ bool NCFileTable::fillList()
+ {
+ 
+-    struct stat64	statInfo;
+-    struct stat64	linkInfo;
++    struct stat	statInfo;
++    struct stat	linkInfo;
+     struct dirent *	entry;
+     list<string>	tmpList;
+     list<string>::iterator   it;
+@@ -592,7 +592,7 @@ bool NCFileTable::fillList()
+ 	{
+ 	    string fullName = currentDir + "/" + ( *it );
+ 
+-	    if ( lstat64( fullName.c_str(), &statInfo ) == 0 )
++	    if ( lstat( fullName.c_str(), &statInfo ) == 0 )
+ 	    {
+ 		if ( S_ISREG( statInfo.st_mode ) || S_ISBLK( statInfo.st_mode ) )
+ 		{
+@@ -604,7 +604,7 @@ bool NCFileTable::fillList()
+ 		}
+ 		else if ( S_ISLNK( statInfo.st_mode ) )
+ 		{
+-		    if ( stat64( fullName.c_str(), &linkInfo ) == 0 )
++		    if ( stat( fullName.c_str(), &linkInfo ) == 0 )
+ 		    {
+ 			if ( S_ISREG( linkInfo.st_mode ) || S_ISBLK( linkInfo.st_mode ) )
+ 			{
+@@ -701,8 +701,8 @@ void NCDirectoryTable::fillHeader()
+ 
+ bool NCDirectoryTable::fillList()
+ {
+-    struct stat64	statInfo;
+-    struct stat64	linkInfo;
++    struct stat	statInfo;
++    struct stat	linkInfo;
+     struct dirent *	entry;
+     list<string>	tmpList;
+     list<string>::iterator   it;
+@@ -734,7 +734,7 @@ bool NCDirectoryTable::fillList()
+ 	{
+ 	    string fullName = currentDir + "/" + ( *it );
+ 
+-	    if ( lstat64( fullName.c_str(), &statInfo ) == 0 )
++	    if ( lstat( fullName.c_str(), &statInfo ) == 0 )
+ 	    {
+ 		if ( S_ISDIR( statInfo.st_mode ) )
+ 		{
+@@ -746,7 +746,7 @@ bool NCDirectoryTable::fillList()
+ 		}
+ 		else if ( S_ISLNK( statInfo.st_mode ) )
+ 		{
+-		    if ( stat64( fullName.c_str(), &linkInfo ) == 0 )
++		    if ( stat( fullName.c_str(), &linkInfo ) == 0 )
+ 		    {
+ 			if ( S_ISDIR( linkInfo.st_mode ) )
+ 			{
+diff --git a/src/NCFileSelection.h b/libyui-ncurses/src/NCFileSelection.h
+index 0569215d..5c459d62 100644
+--- a/src/NCFileSelection.h
++++ b/src/NCFileSelection.h
+@@ -44,10 +44,10 @@
+ struct NCFileInfo
+ {
+     /**
+-     * Constructor from a stat buffer (i.e. based on an lstat64() call).
++     * Constructor from a stat buffer (i.e. based on an lstat() call).
+      **/
+     NCFileInfo( std::string	fileName,
+-		struct stat64	* statInfo,
++		struct stat	* statInfo,
+ 		bool link	= false );
+ 
+     NCFileInfo();
+@@ -65,7 +65,7 @@ struct NCFileInfo
+     dev_t		_device;	// device this object resides on
+     mode_t		_mode;		// file permissions + object type
+     nlink_t		_links;		// number of links
+-    off64_t		_size;		// size in bytes
++    off_t		_size;		// size in bytes
+     time_t		_mtime;		// modification time
+ 
+     bool isDir()  { return (( S_ISDIR( _mode ) ) ? true : false ); }
+-- 
+2.39.0
+
diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.1.1.bb b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.2.3.bb
similarity index 89%
rename from meta-oe/recipes-graphics/libyui/libyui-ncurses_4.1.1.bb
rename to meta-oe/recipes-graphics/libyui/libyui-ncurses_4.2.3.bb
index 8eb77291ab..bcc5ef33e2 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.1.1.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.2.3.bb
@@ -4,11 +4,13 @@ LIC_FILES_CHKSUM = "file://../COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad0
     file://../COPYING.lgpl-2.1;md5=4fbd65380cdd255951079008b364516c \
 "
 
-SRC_URI = "git://github.com/libyui/libyui.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/libyui/libyui.git;branch=master;protocol=https \
+           file://0001-libyui-ncurses-Replace-off64_t-with-off_t-and-stat64.patch \
+          "
 
 SRC_URI:append:class-target = " file://0001-Fix-the-error-of-can-t-find-header-file.patch"
 
-SRCREV = "718ac672374a2b0f50cbc7d637d90e6471babc3d"
+SRCREV = "dabdcd9cc6a0058fd6966d7d2e19d508debcc0ac"
 
 S = "${WORKDIR}/git/libyui-ncurses"
 
diff --git a/meta-oe/recipes-graphics/libyui/libyui_4.1.1.bb b/meta-oe/recipes-graphics/libyui/libyui_4.2.3.bb
similarity index 95%
rename from meta-oe/recipes-graphics/libyui/libyui_4.1.1.bb
rename to meta-oe/recipes-graphics/libyui/libyui_4.2.3.bb
index 4778561662..939f3f36e5 100644
--- a/meta-oe/recipes-graphics/libyui/libyui_4.1.1.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui_4.2.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/libyui/libyui.git;branch=master;protocol=https \
            file://0001-Use-relative-install-paths-for-CMake.patch \
            "
 
-SRCREV = "718ac672374a2b0f50cbc7d637d90e6471babc3d"
+SRCREV = "dabdcd9cc6a0058fd6966d7d2e19d508debcc0ac"
 
 S = "${WORKDIR}/git/libyui"
 
-- 
2.39.0


