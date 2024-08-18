Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB73C5321D
	for <webhook@archiver.kernel.org>; Sun, 18 Aug 2024 22:56:32 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.198698.1724021787892513863
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Aug 2024 15:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cDs6112e;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-70968db52d0so4150101a34.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Aug 2024 15:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724021787; x=1724626587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHQMYYNHW48IFjIXlh3uQP5vgI7fGq3xz6LqeF3CwwQ=;
        b=cDs6112eU4Dkf8kI0qZPGMeKJ7HcVuoryn/TsZkZqZ0G1U6Bwx7/+MihzFMbRIj2Iq
         Lmzo3yZ5Z78Xqcir1DsamkUu+/BMY1gsMWWuQzq5KnSC4h2o0d1bw/2yBDbSiPgiBYxt
         ZdOC1Ck7i9gcdXAUjP+gxV15kvZ5NOTnlrdctskdNElDtj7aO6Ubgv7wA9ulZpHIoJCm
         7r+zlR0z87ak6gDFNWtqTX8R3960H0wrzwVP3LSf07S9sA7Hbxkvip+vcK8/hFPY8Ff9
         V2WpZK9ia9myf66lcomN+1o6H8I430yXPBmztApBGmHKYEKsu8CXRavd3AzbDMmd408t
         vDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724021787; x=1724626587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHQMYYNHW48IFjIXlh3uQP5vgI7fGq3xz6LqeF3CwwQ=;
        b=DKJEwSh9Wli+izzJJh16OV9HpncvlzKHJyeY7Za+NiWqRB6hpxktEvOMNYaFc2dSYy
         /wlaCl095OefALKyBbhacJhQCALa7HTtc1mn8zgus6RGtX+VVW/VOlX/oNjWGCDRIGZq
         PcOaQgoXSNw3nbtk1mf4/tzWOLFukhBVzqLjp9/vR50zL35/7dVm4kJaN7LYDRC9uG9h
         RzkRyy0Px2z9tJwkE65nK19mJ/Z48QnwfGSjtTdrI4aDYAR6gUk0/TSbqOzJ+QDxyyfT
         7RbLZZnHNdPDvgn90D0+/OD6w15pqKRPd7qfVM6ASYGhVUxI5PzDx/ewJAuLJSJH7TWg
         KFSg==
X-Gm-Message-State: AOJu0Yy5E0XaDXDkbLhcYb2m98hNtf5veC9XHAtgE1jfzQmmYy3muJ7y
	YPfg0E9NLsx27Qz8RxCUUzFaxrPUKYYjDqr/HwvTs/PzGwUh1Uc12kModg==
X-Google-Smtp-Source: AGHT+IGs2pOhPBlBSE45UUIPmAs2c3hEYMovM6kuEsD2ZrwXSDigHptZtallNvOp2Zc4pl+aGmeCnA==
X-Received: by 2002:a05:6830:3490:b0:709:4c0d:9e7a with SMTP id 46e09a7af769-70cac832aa7mr11921250a34.2.1724021786910;
        Sun, 18 Aug 2024 15:56:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9149])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b61c6730sm6564146a12.26.2024.08.18.15.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 15:56:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/5] libyui: Upgrade to 4.6.2
Date: Sun, 18 Aug 2024 15:56:20 -0700
Message-ID: <20240818225620.2226473-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240818225620.2226473-1-raj.khem@gmail.com>
References: <20240818225620.2226473-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Aug 2024 22:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111843

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...eplace-off64_t-with-off_t-and-stat64.patch | 176 ------------------
 ...urses_4.2.3.bb => libyui-ncurses_4.6.2.bb} |   8 +-
 .../{libyui_4.2.3.bb => libyui_4.6.2.bb}      |   3 +-
 3 files changed, 7 insertions(+), 180 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-libyui-ncurses-Replace-off64_t-with-off_t-and-stat64.patch
 rename meta-oe/recipes-graphics/libyui/{libyui-ncurses_4.2.3.bb => libyui-ncurses_4.6.2.bb} (91%)
 rename meta-oe/recipes-graphics/libyui/{libyui_4.2.3.bb => libyui_4.6.2.bb} (93%)

diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-libyui-ncurses-Replace-off64_t-with-off_t-and-stat64.patch b/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-libyui-ncurses-Replace-off64_t-with-off_t-and-stat64.patch
deleted file mode 100644
index b29e5dc7b2..0000000000
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-libyui-ncurses-Replace-off64_t-with-off_t-and-stat64.patch
+++ /dev/null
@@ -1,176 +0,0 @@
-From b81fb7942ab77b0bf6791e5fd98411dd68f133d9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 18 Dec 2022 15:13:00 -0800
-Subject: [PATCH] libyui-ncurses: Replace off64_t with off_t and stat64 with stat
-
-stat is same as stat64 when 64bit off_t is used.
-
-Upstream-Status: Submitted [https://github.com/libyui/libyui/pull/88]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt         |  2 +-
- src/NCAskForFile.cc    |  6 +++---
- src/NCFileSelection.cc | 24 ++++++++++++------------
- src/NCFileSelection.h  |  6 +++---
- 4 files changed, 19 insertions(+), 19 deletions(-)
-
-diff --git a/CMakeLists.txt b/libyui-ncurses/CMakeLists.txt
-index b10eab8e..2000bb58 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -58,7 +58,7 @@ set( CMAKE_INSTALL_MESSAGE LAZY ) # Suppress "up-to-date" messages during "make
- # Initialize compiler flags for all targets in all subdirectories
- add_compile_options( "-Wall" )
- add_compile_options( "-Os" )    # Optimize for size (overrides CMake's -O3 in RELEASE builds)
--
-+add_compile_options( "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" ) # Enable largefile support
- if ( WERROR )
-   add_compile_options( "-Werror" )
- endif()
-diff --git a/src/NCAskForFile.cc b/libyui-ncurses/src/NCAskForFile.cc
-index aba6e0a6..44bb81bc 100644
---- a/src/NCAskForFile.cc
-+++ b/src/NCAskForFile.cc
-@@ -73,8 +73,8 @@ std::string NCAskForFile::checkIniDir( std::string iniDir )
- {
-     std::string dname = "";
- 
--    struct stat64 statInfo;
--    stat64( iniDir.c_str(), &statInfo );
-+    struct stat statInfo;
-+    stat( iniDir.c_str(), &statInfo );
- 
-     if ( S_ISDIR( statInfo.st_mode ) )
-     {
-@@ -90,7 +90,7 @@ std::string NCAskForFile::checkIniDir( std::string iniDir )
- 	     && pos != 0 )
- 	{
- 	    std::string dir = iniDir.substr( 0, pos );
--	    stat64( dir.c_str(), &statInfo );
-+	    stat( dir.c_str(), &statInfo );
- 
- 	    if ( S_ISDIR( statInfo.st_mode ) )
- 	    {
-diff --git a/src/NCFileSelection.cc b/libyui-ncurses/src/NCFileSelection.cc
-index 3eb9c908..8894dc72 100644
---- a/src/NCFileSelection.cc
-+++ b/src/NCFileSelection.cc
-@@ -46,7 +46,7 @@ using std::list;
- 
- 
- NCFileInfo::NCFileInfo( string	        fileName,
--			struct stat64 *	statInfo,
-+			struct stat *	statInfo,
- 			bool	        link )
- {
-     _name   = fileName;
-@@ -146,7 +146,7 @@ NCFileInfo::NCFileInfo()
-     _mode     = ( mode_t )0;
-     _device   = ( dev_t )0;
-     _links    = ( nlink_t )0;
--    _size     = ( off64_t )0;
-+    _size     = ( off_t )0;
-     _mtime    = ( time_t )0;
- }
- 
-@@ -177,11 +177,11 @@ NCFileSelection::NCFileSelection( YWidget *           parent,
- {
-     SetSepChar( ' ' );
- 
--    struct stat64 statInfo;
-+    struct stat statInfo;
- 
-     if ( !iniDir.empty() )
-     {
--	stat64( iniDir.c_str(), &statInfo );
-+	stat( iniDir.c_str(), &statInfo );
-     }
- 
-     if ( iniDir.empty()
-@@ -559,8 +559,8 @@ NCursesEvent NCFileTable::wHandleInput( wint_t key )
- bool NCFileTable::fillList()
- {
- 
--    struct stat64	statInfo;
--    struct stat64	linkInfo;
-+    struct stat	statInfo;
-+    struct stat	linkInfo;
-     struct dirent *	entry;
-     list<string>	tmpList;
-     list<string>::iterator   it;
-@@ -592,7 +592,7 @@ bool NCFileTable::fillList()
- 	{
- 	    string fullName = currentDir + "/" + ( *it );
- 
--	    if ( lstat64( fullName.c_str(), &statInfo ) == 0 )
-+	    if ( lstat( fullName.c_str(), &statInfo ) == 0 )
- 	    {
- 		if ( S_ISREG( statInfo.st_mode ) || S_ISBLK( statInfo.st_mode ) )
- 		{
-@@ -604,7 +604,7 @@ bool NCFileTable::fillList()
- 		}
- 		else if ( S_ISLNK( statInfo.st_mode ) )
- 		{
--		    if ( stat64( fullName.c_str(), &linkInfo ) == 0 )
-+		    if ( stat( fullName.c_str(), &linkInfo ) == 0 )
- 		    {
- 			if ( S_ISREG( linkInfo.st_mode ) || S_ISBLK( linkInfo.st_mode ) )
- 			{
-@@ -701,8 +701,8 @@ void NCDirectoryTable::fillHeader()
- 
- bool NCDirectoryTable::fillList()
- {
--    struct stat64	statInfo;
--    struct stat64	linkInfo;
-+    struct stat	statInfo;
-+    struct stat	linkInfo;
-     struct dirent *	entry;
-     list<string>	tmpList;
-     list<string>::iterator   it;
-@@ -734,7 +734,7 @@ bool NCDirectoryTable::fillList()
- 	{
- 	    string fullName = currentDir + "/" + ( *it );
- 
--	    if ( lstat64( fullName.c_str(), &statInfo ) == 0 )
-+	    if ( lstat( fullName.c_str(), &statInfo ) == 0 )
- 	    {
- 		if ( S_ISDIR( statInfo.st_mode ) )
- 		{
-@@ -746,7 +746,7 @@ bool NCDirectoryTable::fillList()
- 		}
- 		else if ( S_ISLNK( statInfo.st_mode ) )
- 		{
--		    if ( stat64( fullName.c_str(), &linkInfo ) == 0 )
-+		    if ( stat( fullName.c_str(), &linkInfo ) == 0 )
- 		    {
- 			if ( S_ISDIR( linkInfo.st_mode ) )
- 			{
-diff --git a/src/NCFileSelection.h b/libyui-ncurses/src/NCFileSelection.h
-index 0569215d..5c459d62 100644
---- a/src/NCFileSelection.h
-+++ b/src/NCFileSelection.h
-@@ -44,10 +44,10 @@
- struct NCFileInfo
- {
-     /**
--     * Constructor from a stat buffer (i.e. based on an lstat64() call).
-+     * Constructor from a stat buffer (i.e. based on an lstat() call).
-      **/
-     NCFileInfo( std::string	fileName,
--		struct stat64	* statInfo,
-+		struct stat	* statInfo,
- 		bool link	= false );
- 
-     NCFileInfo();
-@@ -65,7 +65,7 @@ struct NCFileInfo
-     dev_t		_device;	// device this object resides on
-     mode_t		_mode;		// file permissions + object type
-     nlink_t		_links;		// number of links
--    off64_t		_size;		// size in bytes
-+    off_t		_size;		// size in bytes
-     time_t		_mtime;		// modification time
- 
-     bool isDir()  { return (( S_ISDIR( _mode ) ) ? true : false ); }
--- 
-2.39.0
-
diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.2.3.bb b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb
similarity index 91%
rename from meta-oe/recipes-graphics/libyui/libyui-ncurses_4.2.3.bb
rename to meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb
index bcc5ef33e2..34286f5013 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.2.3.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb
@@ -5,12 +5,11 @@ LIC_FILES_CHKSUM = "file://../COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad0
 "
 
 SRC_URI = "git://github.com/libyui/libyui.git;branch=master;protocol=https \
-           file://0001-libyui-ncurses-Replace-off64_t-with-off_t-and-stat64.patch \
           "
 
 SRC_URI:append:class-target = " file://0001-Fix-the-error-of-can-t-find-header-file.patch"
 
-SRCREV = "dabdcd9cc6a0058fd6966d7d2e19d508debcc0ac"
+SRCREV = "e691b563262306a40a61bbf228839fa06e4f0516"
 
 S = "${WORKDIR}/git/libyui-ncurses"
 
@@ -20,9 +19,10 @@ DEPENDS += "boost libyui ncurses"
 
 BBCLASSEXTEND = "nativesdk"
 
-EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RELWITHDEBINFO -DWERROR=OFF"
+EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RELWITHDEBINFO -DWERROR=OFF -DCMAKE_SKIP_RPATH=1"
 
 CXXFLAGS += "-DNCURSES_WIDECHAR"
+LDFLAGS += "-L${B}/src"
 
 do_configure:prepend () {
     cd ${S}
@@ -48,3 +48,5 @@ do_install:append:class-nativesdk () {
 FILES:${PN} += "${datadir}/*"
 
 FILES:${PN}-dev += "${libdir}/*"
+
+CMAKE_VERBOSE = "VERBOSE=1" 
diff --git a/meta-oe/recipes-graphics/libyui/libyui_4.2.3.bb b/meta-oe/recipes-graphics/libyui/libyui_4.6.2.bb
similarity index 93%
rename from meta-oe/recipes-graphics/libyui/libyui_4.2.3.bb
rename to meta-oe/recipes-graphics/libyui/libyui_4.6.2.bb
index 939f3f36e5..419a9522a4 100644
--- a/meta-oe/recipes-graphics/libyui/libyui_4.2.3.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui_4.6.2.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/libyui/libyui.git;branch=master;protocol=https \
            file://0001-Use-relative-install-paths-for-CMake.patch \
            "
 
-SRCREV = "dabdcd9cc6a0058fd6966d7d2e19d508debcc0ac"
+SRCREV = "e691b563262306a40a61bbf228839fa06e4f0516"
 
 S = "${WORKDIR}/git/libyui"
 
@@ -20,6 +20,7 @@ DEPENDS += "boost"
 
 EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RELWITHDEBINFO -DWERROR=OFF"
 
+LDFLAGS += "-L${B}/src"
 BBCLASSEXTEND = "native nativesdk"
 
 do_install:append () {

