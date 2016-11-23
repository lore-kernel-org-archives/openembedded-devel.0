Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 93FEE719E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:50 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y68so449289pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f+CrZU5ABxfeJCruUHXykiJLZ+yoTrsWxEpOq2AwlSk=;
	b=wqu788tMMmCump7cWGhsI0OmByjiqg6KrdJL8LIX4CJFgDVrojAQrpYiiH415eTiua
	E8hAjctUGYDoYvbHMraKR85qwJfWhX9+4YTK1cTktiq421A92T5kRAeyA3g+EXD097tz
	SEx/MaGkBTj7LCxAEm4x2hvjrATzmwx8+bifxWMWDVx2wUaNRH8bDwHdUCcPJBVzK+qD
	6/B3DFkl+WAGb0MEF1ZEbkYH56SCKzH1Vzv41XhT9Q+UZx+D7oV7Zkjv52BZk3v8D1LG
	ejV5rbGxn5Vizrfv+9npIWKAP1ouy0xf8k2Ntvip8eOSSFPHR7kRCs3x5el4tB35Vz0y
	VIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=f+CrZU5ABxfeJCruUHXykiJLZ+yoTrsWxEpOq2AwlSk=;
	b=OwLtgZKPI2GXKJ608rJ6ZJiI6YW9svNEfhEbXX8Be9qSM7JnKkoMJ00lnmkRi6IoCz
	GudSbLOuwsPc3fi9dp5W567uo7lLiDPnFJivurELFnxBDj0dy8M6WBpwJk+MwYW84nKK
	8Aswbsuh44lFzTljyE5XWRSXxOfiCP3gK/CoGthgGBOVWU6sgiWSNsNjLa7foJowyxeO
	9MJ0UD7OhMQ8yoio0DHOtuu1OpFVpHOOLxKu56z6QSb+GlXNm2tMJJJRshGb2g9QhApM
	jpBAYU5ZY3et629cK7lpOVeMQ7ZBhMfobPS22E8Fz+VA9OTFsJUlWfT7FGHdKPV7W09j
	eLsA==
X-Gm-Message-State: AKaTC020s+c0hr0JPGQTv2dLht5gEHaEVezC1BGWnaRFC/dpDjqQSxN0snpuvDBJ3yUckw==
X-Received: by 10.84.210.40 with SMTP id z37mr4677454plh.32.1479892971904;
	Wed, 23 Nov 2016 01:22:51 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:22:05 -0800
Message-Id: <20161123092209.23699-45-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 45/49] kodi-17: Update to latest
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:50 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-musl.patch => 0001-Fix-file_Emu-on-musl.patch} |  4 +-
 ...e-FILEWRAP.patch => 0002-Remove-FILEWRAP.patch} | 28 +++++++-------
 ...e-don-t-try-to-run-stuff-to-find-tinyxml.patch} |  8 ++--
 ...dle-SIGTERM.patch => 0004-handle-SIGTERM.patch} | 22 +++++------
 ...to-read-frequency-output-if-using-intel-.patch} |  6 +--
 ...upport.patch => 0006-Disable-DVD-support.patch} | 10 ++---
 ... => 0007-Always-compile-libcpluff-as-PIC.patch} |  6 +--
 ....cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch | 43 ++++++++++++++++++++++
 ...0009-build-Add-support-for-musl-triplets.patch} |  8 ++--
 ...ix-compiler-warning-comparing-pointer-to-.patch | 40 ++++++++++++++++++++
 .../recipes-mediacenter/kodi/kodi-platform_git.bb  |  3 +-
 .../recipes-mediacenter/kodi/kodi_17.bb            | 30 +++++++++------
 12 files changed, 149 insertions(+), 59 deletions(-)
 rename meta-multimedia/recipes-mediacenter/kodi/kodi-17/{0008-Fix-file_Emu-on-musl.patch => 0001-Fix-file_Emu-on-musl.patch} (99%)
 rename meta-multimedia/recipes-mediacenter/kodi/kodi-17/{0007-Remove-FILEWRAP.patch => 0002-Remove-FILEWRAP.patch} (78%)
 rename meta-multimedia/recipes-mediacenter/kodi/kodi-17/{0001-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch => 0003-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch} (75%)
 rename meta-multimedia/recipes-mediacenter/kodi/kodi-17/{0002-handle-SIGTERM.patch => 0004-handle-SIGTERM.patch} (89%)
 rename meta-multimedia/recipes-mediacenter/kodi/kodi-17/{0003-add-support-to-read-frequency-output-if-using-intel-.patch => 0005-add-support-to-read-frequency-output-if-using-intel-.patch} (83%)
 rename meta-multimedia/recipes-mediacenter/kodi/kodi-17/{0004-Disable-DVD-support.patch => 0006-Disable-DVD-support.patch} (78%)
 rename meta-multimedia/recipes-mediacenter/kodi/kodi-17/{0005-Always-compile-libcpluff-as-PIC.patch => 0007-Always-compile-libcpluff-as-PIC.patch} (86%)
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0008-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
 rename meta-multimedia/recipes-mediacenter/kodi/kodi-17/{0006-build-Add-support-for-musl-triplets.patch => 0009-build-Add-support-for-musl-triplets.patch} (97%)
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0010-RssReader-Fix-compiler-warning-comparing-pointer-to-.patch

diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0008-Fix-file_Emu-on-musl.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-Fix-file_Emu-on-musl.patch
similarity index 99%
rename from meta-multimedia/recipes-mediacenter/kodi/kodi-17/0008-Fix-file_Emu-on-musl.patch
rename to meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-Fix-file_Emu-on-musl.patch
index 7598c7a..20b6377 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0008-Fix-file_Emu-on-musl.patch
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-Fix-file_Emu-on-musl.patch
@@ -1,7 +1,7 @@
-From 3a10d9479e7c9a77c478b8b428e4309ff22e8498 Mon Sep 17 00:00:00 2001
+From 7ae4fcf290ffb0b76374efafeaee575456ac9023 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 6 Nov 2016 23:08:27 -0800
-Subject: [PATCH 8/8] Fix file_Emu on musl
+Subject: [PATCH 01/10] Fix file_Emu on musl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0007-Remove-FILEWRAP.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0002-Remove-FILEWRAP.patch
similarity index 78%
rename from meta-multimedia/recipes-mediacenter/kodi/kodi-17/0007-Remove-FILEWRAP.patch
rename to meta-multimedia/recipes-mediacenter/kodi/kodi-17/0002-Remove-FILEWRAP.patch
index c2d3259..7f48e93 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0007-Remove-FILEWRAP.patch
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0002-Remove-FILEWRAP.patch
@@ -1,7 +1,7 @@
-From f4c5710192256e903b253353fb018ebd68d0b651 Mon Sep 17 00:00:00 2001
+From ad1977a358319093b305df6d84be6db676ef1e4a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 6 Nov 2016 22:35:16 -0800
-Subject: [PATCH 7/8] Remove FILEWRAP
+Subject: [PATCH 02/10] Remove FILEWRAP
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 8 deletions(-)
 
 diff --git a/xbmc/utils/posix/PosixInterfaceForCLog.cpp b/xbmc/utils/posix/PosixInterfaceForCLog.cpp
-index 6614487..a91d157 100644
+index a3d4983..8443024 100644
 --- a/xbmc/utils/posix/PosixInterfaceForCLog.cpp
 +++ b/xbmc/utils/posix/PosixInterfaceForCLog.cpp
-@@ -28,10 +28,6 @@
+@@ -29,10 +29,6 @@
  #include "platform/android/activity/XBMCApp.h"
  #endif // TARGET_ANDROID
  
@@ -24,7 +24,7 @@ index 6614487..a91d157 100644
  CPosixInterfaceForCLog::CPosixInterfaceForCLog() :
    m_file(NULL)
  { }
-@@ -51,7 +47,7 @@ bool CPosixInterfaceForCLog::OpenLogFile(const std::string &logFilename, const s
+@@ -52,7 +48,7 @@ bool CPosixInterfaceForCLog::OpenLogFile(const std::string &logFilename, const s
    (void)remove(backupOldLogToFilename.c_str()); // if it's failed, try to continue
    (void)rename(logFilename.c_str(), backupOldLogToFilename.c_str()); // if it's failed, try to continue
  
@@ -34,24 +34,24 @@ index 6614487..a91d157 100644
      return false; // error, can't open log file
  
 diff --git a/xbmc/utils/posix/PosixInterfaceForCLog.h b/xbmc/utils/posix/PosixInterfaceForCLog.h
-index bb53442..2983e73 100644
+index c1e8ffe..75836b7 100644
 --- a/xbmc/utils/posix/PosixInterfaceForCLog.h
 +++ b/xbmc/utils/posix/PosixInterfaceForCLog.h
-@@ -21,8 +21,6 @@
+@@ -19,8 +19,6 @@
+  *
+  */
  
- #include <string>
- 
--struct FILEWRAP; // forward declaration, wrapper for FILE
+-#include <string>
 -
+ struct FILEWRAP; // forward declaration, wrapper for FILE
+ 
  class CPosixInterfaceForCLog
- {
- public:
 @@ -34,5 +32,5 @@ public:
    void PrintDebugString(const std::string& debugString);
-   static void GetCurrentLocalTime(int& hour, int& minute, int& second);
+   static void GetCurrentLocalTime(int& hour, int& minute, int& second, double& millisecond);
  private:
 -  FILEWRAP* m_file;
-+  FILE * m_file;
++  FILE* m_file;
  };
 -- 
 2.10.2
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0003-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch
similarity index 75%
rename from meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch
rename to meta-multimedia/recipes-mediacenter/kodi/kodi-17/0003-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch
index b3780db..49217a4 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0003-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch
@@ -1,14 +1,14 @@
-From 53c7b1667a41b25775d1dc009d8ced61f383da0b Mon Sep 17 00:00:00 2001
+From a91a3ba229dc5903935f7dd98dd03bbb4fe5ac1f Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sat, 6 Feb 2016 15:43:01 +0100
-Subject: [PATCH 1/3] configure: don't try to run stuff to find tinyxml
+Subject: [PATCH 03/10] configure: don't try to run stuff to find tinyxml
 
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 5a41fb4..243c7e5 100644
+index 34fe643..3132dc1 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1043,7 +1043,7 @@ fi
@@ -21,5 +21,5 @@ index 5a41fb4..243c7e5 100644
  #include <stdlib.h>
  #include <tinyxml.h>
 -- 
-2.10.1
+2.10.2
 
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0002-handle-SIGTERM.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0004-handle-SIGTERM.patch
similarity index 89%
rename from meta-multimedia/recipes-mediacenter/kodi/kodi-17/0002-handle-SIGTERM.patch
rename to meta-multimedia/recipes-mediacenter/kodi/kodi-17/0004-handle-SIGTERM.patch
index b2af5de..dc37439 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0002-handle-SIGTERM.patch
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0004-handle-SIGTERM.patch
@@ -1,7 +1,7 @@
-From 1c1484303a055bfde655ffae3829554aaefc2e07 Mon Sep 17 00:00:00 2001
+From 49046c1685465a5486fe9e1c04b99c585aab6862 Mon Sep 17 00:00:00 2001
 From: Stefan Saraev <stefan@saraev.ca>
 Date: Wed, 2 Nov 2016 11:28:34 -0700
-Subject: [PATCH 2/3] handle SIGTERM
+Subject: [PATCH 04/10] handle SIGTERM
 
 0. CApplication::Stop cant be trusted. (deadlocks crashes and boo)
 
@@ -26,10 +26,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  5 files changed, 30 insertions(+), 5 deletions(-)
 
 diff --git a/xbmc/Application.cpp b/xbmc/Application.cpp
-index 4c118e0..58b151a 100644
+index 100a2f2..fda892d 100644
 --- a/xbmc/Application.cpp
 +++ b/xbmc/Application.cpp
-@@ -2428,12 +2428,12 @@ void CApplication::OnApplicationMessage(ThreadMessage* pMsg)
+@@ -2426,12 +2426,12 @@ void CApplication::OnApplicationMessage(ThreadMessage* pMsg)
    switch (pMsg->dwMessage)
    {
    case TMSG_POWERDOWN:
@@ -44,7 +44,7 @@ index 4c118e0..58b151a 100644
      break;
    
    case TMSG_SHUTDOWN:
-@@ -2454,12 +2454,13 @@ void CApplication::OnApplicationMessage(ThreadMessage* pMsg)
+@@ -2452,12 +2452,13 @@ void CApplication::OnApplicationMessage(ThreadMessage* pMsg)
  
    case TMSG_RESTART:
    case TMSG_RESET:
@@ -59,7 +59,7 @@ index 4c118e0..58b151a 100644
      Stop(EXITCODE_RESTARTAPP);
  #endif
      break;
-@@ -2883,6 +2884,13 @@ bool CApplication::Cleanup()
+@@ -2881,6 +2882,13 @@ bool CApplication::Cleanup()
    }
  }
  
@@ -73,7 +73,7 @@ index 4c118e0..58b151a 100644
  void CApplication::Stop(int exitCode)
  {
    try
-@@ -2890,7 +2898,7 @@ void CApplication::Stop(int exitCode)
+@@ -2888,7 +2896,7 @@ void CApplication::Stop(int exitCode)
      m_frameMoveGuard.unlock();
  
      CVariant vExitCode(CVariant::VariantTypeObject);
@@ -82,7 +82,7 @@ index 4c118e0..58b151a 100644
      CAnnouncementManager::GetInstance().Announce(System, "xbmc", "OnQuit", vExitCode);
  
      // Abort any active screensaver
-@@ -2924,7 +2932,6 @@ void CApplication::Stop(int exitCode)
+@@ -2922,7 +2930,6 @@ void CApplication::Stop(int exitCode)
  
      m_bStop = true;
      m_AppFocused = false;
@@ -91,10 +91,10 @@ index 4c118e0..58b151a 100644
  
      // cancel any jobs from the jobmanager
 diff --git a/xbmc/Application.h b/xbmc/Application.h
-index 22aca81..9992677 100644
+index a9d9bf5..e536deb 100644
 --- a/xbmc/Application.h
 +++ b/xbmc/Application.h
-@@ -160,6 +160,7 @@ public:
+@@ -159,6 +159,7 @@ public:
    void StopPVRManager();
    void ReinitPVRManager();
    bool IsCurrentThread() const;
@@ -159,5 +159,5 @@ index a8b64e5..3d80032 100644
    XBMC::Context context;
  
 -- 
-2.10.1
+2.10.2
 
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0003-add-support-to-read-frequency-output-if-using-intel-.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0005-add-support-to-read-frequency-output-if-using-intel-.patch
similarity index 83%
rename from meta-multimedia/recipes-mediacenter/kodi/kodi-17/0003-add-support-to-read-frequency-output-if-using-intel-.patch
rename to meta-multimedia/recipes-mediacenter/kodi/kodi-17/0005-add-support-to-read-frequency-output-if-using-intel-.patch
index d638550..ee10c40 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0003-add-support-to-read-frequency-output-if-using-intel-.patch
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0005-add-support-to-read-frequency-output-if-using-intel-.patch
@@ -1,7 +1,7 @@
-From 4ef1e9dab9193f1a5305d25c8eda97f8f06ea154 Mon Sep 17 00:00:00 2001
+From 4d1368d20f04216aec9551d9845b305f96a21015 Mon Sep 17 00:00:00 2001
 From: Stephan Raue <stephan@openelec.tv>
 Date: Mon, 1 Sep 2014 03:16:37 +0200
-Subject: [PATCH 3/3] add support to read frequency output if using intel's
+Subject: [PATCH 05/10] add support to read frequency output if using intel's
  pstate driver
 
 ---
@@ -22,5 +22,5 @@ index 5e2ebbd..fd04d5a 100644
    {
      m_cpuInfoForFreq = true;
 -- 
-2.10.1
+2.10.2
 
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0004-Disable-DVD-support.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0006-Disable-DVD-support.patch
similarity index 78%
rename from meta-multimedia/recipes-mediacenter/kodi/kodi-17/0004-Disable-DVD-support.patch
rename to meta-multimedia/recipes-mediacenter/kodi/kodi-17/0006-Disable-DVD-support.patch
index 6f5f9a2..08dfac3 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0004-Disable-DVD-support.patch
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0006-Disable-DVD-support.patch
@@ -1,7 +1,7 @@
-From 191cf3f084b4d34846711034a7fe3078f8243c82 Mon Sep 17 00:00:00 2001
+From 3d3ec391038c6ee73897a7fab753b11b589de1ed Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 2 Nov 2016 12:39:20 -0700
-Subject: [PATCH 4/4] Disable DVD support
+Subject: [PATCH 06/10] Disable DVD support
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
@@ -9,7 +9,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 58b3a17..b7c3fce 100644
+index 0d70e9b..050c7ca 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -10,8 +10,7 @@ EC_DIRS= \
@@ -22,7 +22,7 @@ index 58b3a17..b7c3fce 100644
  
  VideoPlayer_ARCHIVES=xbmc/cores/VideoPlayer/VideoPlayer.a \
                     xbmc/cores/VideoPlayer/DVDCodecs/DVDCodecs.a \
-@@ -343,7 +342,6 @@ libaddon: exports
+@@ -347,7 +346,6 @@ libaddon: exports
  	$(MAKE) -C lib/addons/library.xbmc.pvr
  	$(MAKE) -C lib/addons/library.kodi.inputstream
  dvdpcodecs: dllloader
@@ -31,5 +31,5 @@ index 58b3a17..b7c3fce 100644
  dvdpextcodecs:
  
 -- 
-2.10.1
+2.10.2
 
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0005-Always-compile-libcpluff-as-PIC.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0007-Always-compile-libcpluff-as-PIC.patch
similarity index 86%
rename from meta-multimedia/recipes-mediacenter/kodi/kodi-17/0005-Always-compile-libcpluff-as-PIC.patch
rename to meta-multimedia/recipes-mediacenter/kodi/kodi-17/0007-Always-compile-libcpluff-as-PIC.patch
index f513334..8fd7ece 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0005-Always-compile-libcpluff-as-PIC.patch
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0007-Always-compile-libcpluff-as-PIC.patch
@@ -1,7 +1,7 @@
-From 603e8925a8b1609d483d866346a35fefbc66cfca Mon Sep 17 00:00:00 2001
+From d989cbdb7686c3b95dc749967f89b93e47f955a6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 3 Nov 2016 13:10:00 -0700
-Subject: [PATCH 5/5] Always compile libcpluff as PIC
+Subject: [PATCH 07/10] Always compile libcpluff as PIC
 
 Fixes errors e.g.
 
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index b210b73..52d5f11 100644
+index 3132dc1..ab4eea3 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2385,7 +2385,7 @@ XB_CONFIG_MODULE([lib/cpluff], [
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0008-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0008-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
new file mode 100644
index 0000000..9390144
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0008-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
@@ -0,0 +1,43 @@
+From 51cd8d5f084013360b29fe497193288ebde2f4f9 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 29 Jul 2015 23:13:33 +0200
+Subject: [PATCH 08/10] kodi-config.cmake: use CMAKE_FIND_ROOT_PATH to fix
+ cross-compilation
+
+When cross-compiling, the location at build time of the libraries is
+not the same as the one at run-time. The CMAKE_FIND_ROOT_PATH variable
+is here to handle this difference, so use it in kodi-config.cmake.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ project/cmake/KodiConfig.cmake.in | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/project/cmake/KodiConfig.cmake.in b/project/cmake/KodiConfig.cmake.in
+index c02a680..9d6a566 100644
+--- a/project/cmake/KodiConfig.cmake.in
++++ b/project/cmake/KodiConfig.cmake.in
+@@ -7,10 +7,10 @@ if(NOT @APP_NAME_UC@_PREFIX)
+   set(@APP_NAME_UC@_PREFIX @APP_PREFIX@)
+ endif()
+ if(NOT @APP_NAME_UC@_INCLUDE_DIR)
+-  set(@APP_NAME_UC@_INCLUDE_DIR @APP_INCLUDE_DIR@)
++  set(@APP_NAME_UC@_INCLUDE_DIR ${CMAKE_FIND_ROOT_PATH}/@APP_INCLUDE_DIR@)
+ endif()
+ if(NOT @APP_NAME_UC@_LIB_DIR)
+-  set(@APP_NAME_UC@_LIB_DIR @APP_LIB_DIR@)
++  set(@APP_NAME_UC@_LIB_DIR ${CMAKE_FIND_ROOT_PATH}/@APP_LIB_DIR@)
+ endif()
+ if(NOT @APP_NAME_UC@_DATA_DIR)
+   set(@APP_NAME_UC@_DATA_DIR @APP_DATA_DIR@)
+@@ -19,6 +19,7 @@ if(NOT WIN32)
+   set(CMAKE_CXX_FLAGS "$ENV{CXXFLAGS} @CXX11_SWITCH@")
+ endif()
+ list(APPEND CMAKE_MODULE_PATH @APP_LIB_DIR@ @APP_DATA_DIR@/cmake)
++list(APPEND CMAKE_MODULE_PATH ${CMAKE_FIND_ROOT_PATH}/@APP_LIB_DIR@ ${CMAKE_FIND_ROOT_PATH}/@APP_DATA_DIR@/cmake)
+ 
+ string(REPLACE ";" " " ARCH_DEFINES "@ARCH_DEFINES@")
+ add_definitions(${ARCH_DEFINES} -DBUILD_KODI_ADDON)
+-- 
+2.10.2
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0006-build-Add-support-for-musl-triplets.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0009-build-Add-support-for-musl-triplets.patch
similarity index 97%
rename from meta-multimedia/recipes-mediacenter/kodi/kodi-17/0006-build-Add-support-for-musl-triplets.patch
rename to meta-multimedia/recipes-mediacenter/kodi/kodi-17/0009-build-Add-support-for-musl-triplets.patch
index 71c5c41..f3e739a 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0006-build-Add-support-for-musl-triplets.patch
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0009-build-Add-support-for-musl-triplets.patch
@@ -1,7 +1,7 @@
-From 99769ac5653884e49d1c8c34e65d2e565cd9e314 Mon Sep 17 00:00:00 2001
+From 8b2bad58585af0f829fb06e19c9bd2b6caf30808 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 6 Nov 2016 11:54:41 -0800
-Subject: [PATCH 6/6] build: Add support for musl triplets
+Subject: [PATCH 09/10] build: Add support for musl triplets
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
@@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 23 insertions(+), 23 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 52d5f11..a772973 100644
+index ab4eea3..925466a 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -526,7 +526,7 @@ case $host in
@@ -131,7 +131,7 @@ index d28f263..ff5dc20 100644
       ;;
    *-*linux-android*)
 diff --git a/tools/depends/configure.ac b/tools/depends/configure.ac
-index a0bc386..b96d20e 100644
+index f438e5d..409f4d7 100644
 --- a/tools/depends/configure.ac
 +++ b/tools/depends/configure.ac
 @@ -120,13 +120,13 @@ platform_cc=gcc
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0010-RssReader-Fix-compiler-warning-comparing-pointer-to-.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0010-RssReader-Fix-compiler-warning-comparing-pointer-to-.patch
new file mode 100644
index 0000000..e34a5b7
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0010-RssReader-Fix-compiler-warning-comparing-pointer-to-.patch
@@ -0,0 +1,40 @@
+From 55233024648b5673dbf223586968e71cc4c70711 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 16 Nov 2016 18:49:36 -0800
+Subject: [PATCH 10/10] RssReader: Fix compiler warning comparing pointer to
+ zero
+
+Clang finds this warning
+RssReader.cpp:272:19: error: ordered comparison between pointer and zero ('TiXmlElement *' and 'int')
+  while (itemNode > 0)
+         ~~~~~~~~ ^ ~
+RssReader.cpp:276:22: error: ordered comparison between pointer and zero ('TiXmlNode *' and 'int')
+    while (childNode > 0)
+           ~~~~~~~~~ ^ ~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ xbmc/utils/RssReader.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xbmc/utils/RssReader.cpp b/xbmc/utils/RssReader.cpp
+index 9186f56..2494dc8 100644
+--- a/xbmc/utils/RssReader.cpp
++++ b/xbmc/utils/RssReader.cpp
+@@ -269,11 +269,11 @@ void CRssReader::GetNewsItems(TiXmlElement* channelXmlNode, int iFeed)
+   if (m_tagSet.empty())
+     AddTag("title");
+ 
+-  while (itemNode > 0)
++  while (itemNode != NULL)
+   {
+     TiXmlNode* childNode = itemNode->FirstChild();
+     mTagElements.clear();
+-    while (childNode > 0)
++    while (childNode != NULL)
+     {
+       std::string strName = childNode->ValueStr();
+ 
+-- 
+2.10.2
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb
index 5077454..802259d 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb
@@ -8,9 +8,8 @@ DEPENDS = "libtinyxml kodi"
 
 PV = "16.0.0"
 
-SRCREV = "15edaf78d6307eaa5e1d17028122d8bce9d55aa2"
+SRCREV = "c8188d82678fec6b784597db69a68e74ff4986b5"
 SRC_URI = "git://github.com/xbmc/kodi-platform.git \
-           file://0001-Fix-build-after-platform-rename.patch \
            file://0001-fix-cross-compile-badness.patch \
            file://kodi-platform-02_no-multi-lib.patch \
           "
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
index 13be123..ee8c743 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
@@ -63,20 +63,22 @@ DEPENDS = " \
 
 PROVIDES = "xbmc"
 
-SRCREV = "7f6abd1dd6d1aefcb4303083f34aaa90a8df9fce"
+SRCREV = "59579457e5fa56baae3b3fb2521518ad6fadd14e"
 PV = "17.0+gitr${SRCPV}"
 SRC_URI = "git://github.com/xbmc/xbmc.git;branch=master \
-           file://0001-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch \
-           file://0002-handle-SIGTERM.patch \
-           file://0003-add-support-to-read-frequency-output-if-using-intel-.patch \
-           file://0004-Disable-DVD-support.patch \
-           file://0005-Always-compile-libcpluff-as-PIC.patch \
-           file://0006-build-Add-support-for-musl-triplets.patch \
+           file://0003-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch \
+           file://0004-handle-SIGTERM.patch \
+           file://0005-add-support-to-read-frequency-output-if-using-intel-.patch \
+           file://0006-Disable-DVD-support.patch \
+           file://0007-Always-compile-libcpluff-as-PIC.patch \
+           file://0008-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch \
+           file://0009-build-Add-support-for-musl-triplets.patch \
+           file://0010-RssReader-Fix-compiler-warning-comparing-pointer-to-.patch \
 "
 
 SRC_URI_append_libc-musl = " \
-           file://0007-Remove-FILEWRAP.patch \
-           file://0008-Fix-file_Emu-on-musl.patch \
+           file://0001-Fix-file_Emu-on-musl.patch \
+           file://0002-Remove-FILEWRAP.patch \
 "
 
 inherit autotools-brokensep gettext pythonnative
@@ -103,7 +105,9 @@ PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,libxinerama libxmu libxrandr li
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 PACKAGECONFIG[lcms] = "--enable-lcms2,--disable-lcms2,lcms"
 
+
 EXTRA_OECONF_append_rpi = " --disable-openmax --enable-player=omxplayer --with-platform=raspberry-pi2"
+EXTRA_OECONF_remove_aarch64 = "--with-platform=raspberry-pi2"
 LDFLAGS_append_rpi = " -lvchostif "
 EXTRA_OECONF = " \
     --disable-debug \
@@ -118,10 +122,12 @@ EXTRA_OECONF = " \
     --enable-texturepacker=no \
 "
 
-FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
-FULL_OPTIMIZATION_armv7ve = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
+FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O3 -ffast-math"
+FULL_OPTIMIZATION_armv7ve = "-fexpensive-optimizations -fomit-frame-pointer -O3 -ffast-math"
 BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 
+EXTRA_OECONF_append = " LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
+
 # for python modules
 export HOST_SYS
 export BUILD_SYS
@@ -187,3 +193,5 @@ RRECOMMENDS_${PN}_append_libc-glibc = " glibc-charmap-ibm850 \
 
 RPROVIDES_${PN} += "xbmc"
 
+TOOLCHAIN = "gcc"
+
-- 
2.10.2


