Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 310F360670
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 12:38:18 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3AMm//5RyGHqY0BBvXCy+O+j09IxM/srCxBDY+r6Qd?=
	=?us-ascii?q?0uoUI/ad9pjvdHbS+e9qxAeQG96Kt7Qf0aGK6+jJYi8p2d65qncMcZhBBVcuqP?=
	=?us-ascii?q?49uEgeOvODElDxN/XwbiY3T4xoXV5h+GynYwAOQJ6tL1LdrWev4jEMBx7xKRR6?=
	=?us-ascii?q?JvjvGo7Vks+7y/2+94fdbghMizexe71/IAu5oQjeqsUdnJdvJLs2xhbVuHVDZv?=
	=?us-ascii?q?5YxXlvJVKdnhb84tm/8Zt++ClOuPwv6tBNX7zic6s3UbJXAjImM3so5MLwrhnM?=
	=?us-ascii?q?URGP5noHXWoIlBdDHhXI4wv7Xpf1tSv6q/Z91SyHNsD4Ubw4RTKv5LptRRT1ii?=
	=?us-ascii?q?kIKiQ5/XnXhMJukaxVrhGvqRtwzIHIb4+YL+Z+c6DHcN8GX2dNQsRcWipcCY28?=
	=?us-ascii?q?dYsPCO8BMP5coYbnu1QOqgCxBQ6xD+7z0D9HnHD23bA80+s8Dw7NwRYuGMgUsH?=
	=?us-ascii?q?vKrdT+KaAfUeKvw6nS1zrDYO5W2THg54fWaR0hoP6MUqh0ccrQ00YjDR/KjlKV?=
	=?us-ascii?q?qYH8OT6ey+oDs2+e7+V6VOKvjXYqqxp2ojiy3McjlpfGh4wPxVDe6yp12oE1Jc?=
	=?us-ascii?q?e3SEJjbt6kEYdQtyGHN4RtWM8tX2ZouCM8x7YbupC7ZDAHxZA6yxLFdvCLboqF?=
	=?us-ascii?q?7gjnWeuVOzt0mXJodbK5ih2v60av0Pf8WdOx0FtSqypFlcTDuW4V2hzI78iHVu?=
	=?us-ascii?q?N9/kC82TaTzwzT6v9LIUQzlafDJZ4u2Lgwl5sSsUTFACD6gkT2jKCMeUUg++in?=
	=?us-ascii?q?8f7rbanhpp+ZL4N0iwf+PboymsGnBek0LxICU3WG9em+zrHu+Un0TK9XgvA2kq?=
	=?us-ascii?q?TVqJXaKt4apq69DQ9VyIEj6xOnAjekytsYh2MILF1YeBKBkofmJUrDIPH3Dfil?=
	=?us-ascii?q?h1SskS1ky+raMb3mB5XBNmLDn6v5fbZh905czxI+zddH551KDLEOPvfzVVTvu9?=
	=?us-ascii?q?PFExA2LRG7z//6B9pjyIMRR2aPD7SdMKPTql+I+vkvL/OLZI8Npjn9LeYq5/v1?=
	=?us-ascii?q?gnAnhFASYLem0oYNZHC/BPRmLF2TYWDwjdcZDWcKog0+QfT0h12YUD5ce22/UL?=
	=?us-ascii?q?wh5jE4EoKpE53MSpqxj7yG2SexBodWaXxeClCQDXfocJ2JVOoSZyKUI89hiScJ?=
	=?us-ascii?q?Wqa8S48izxGhqhX1x6B7IerT/y0SrYjj28Rt5+3PiREy8iR5D8OB026XUWF0n2?=
	=?us-ascii?q?QISiQx3KBkukx8ykyD0bRmjPxdDtxf/e9GUgA/NZLG1ON6EYO6ZgWUec+ETluj?=
	=?us-ascii?q?SNiqDTw9C9483dIKS0J8AMm5yBfb0iynBrUYm7CGCNoz6K2P8WL2IpNfwn3B3q?=
	=?us-ascii?q?5ppkMvTdZJOWDuvi9l+hqbU4zAiUyWiqCmeIwd0yfJ9W7Fxm2L6hILGDVsWLnI?=
	=?us-ascii?q?CChMLnDdqs70sxvP?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CzFwDiyHhY/5tjdVtdHAEBBAEBCgEBF?=
	=?us-ascii?q?wEBBAEBCgEBgxQBAQEBAR9fgQmDUYp5kE+KeIJQhiaCD4INGhCCQoM2AoIQQRI?=
	=?us-ascii?q?BAQEBAQEBAQEBAWIogjMZgh0BKQQLAUYsAwECAwImAlEhHohpAQmwP4FrOooOA?=
	=?us-ascii?q?QEIAQEBASSBC4U6h2qECTqCXgWIeJI6hlyKfQKBdVGOJYgUhj6EEyYCL4FET4Q?=
	=?us-ascii?q?2G4FgPTUBAYhkAQEB?=
X-IPAS-Result: =?us-ascii?q?A2CzFwDiyHhY/5tjdVtdHAEBBAEBCgEBFwEBBAEBCgEBgxQ?=
	=?us-ascii?q?BAQEBAR9fgQmDUYp5kE+KeIJQhiaCD4INGhCCQoM2AoIQQRIBAQEBAQEBAQEBA?=
	=?us-ascii?q?WIogjMZgh0BKQQLAUYsAwECAwImAlEhHohpAQmwP4FrOooOAQEIAQEBASSBC4U?=
	=?us-ascii?q?6h2qECTqCXgWIeJI6hlyKfQKBdVGOJYgUhj6EEyYCL4FET4Q2G4FgPTUBAYhkA?=
	=?us-ascii?q?QEB?=
X-IronPort-AV: E=Sophos;i="5.33,221,1477954800"; d="scan'208";a="228676214"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 13 Jan 2017 13:38:17 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cS17Z-0005P9-4A; Fri, 13 Jan 2017 13:38:17 +0100
Received: from ip162.dynamic.igalia.com ([192.168.10.162]
	helo=goomba.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1cS17V-0005Pf-VA; Fri, 13 Jan 2017 13:38:14 +0100
From: =?UTF-8?q?Jacobo=20Aragunde=20P=C3=A9rez?= <jaragunde@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jan 2017 13:37:54 +0100
Message-Id: <1484311074-14030-1-git-send-email-jaragunde@igalia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: denis@eukrea.com, otavio@ossystems.com.br, eric@eukrea.com
Subject: [meta-browser][PATCH] chromium-wayland: update to 53.0.2785.14
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
X-List-Received-Date: Fri, 13 Jan 2017 12:38:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

That is the latest version of Chromium that has been made work with
the Ozone-Wayland project.

Patches have been rebased and configure flags were changed because
existing ones were causing conflicts in the new version. An extra
patch was added to prevent the build from failing when building
without X11 libs present due to an unnecessary inclusion.

Signed-off-by: Jacobo Aragunde Pérez <jaragunde@igalia.com>
---
 .../chromium/chromium-wayland_48.0.2548.0.bb       | 36 ---------
 .../chromium/chromium-wayland_53.0.2785.143.bb     | 37 +++++++++
 .../0011-Replace-readdir_r-with-readdir.patch      | 88 +++++-----------------
 .../add_missing_stat_h_include.patch               |  2 +-
 .../guard-x11_desktop_handler-inclusion.patch      | 13 ++++
 .../chromium/chromium-wayland/remove-Werror.patch  | 86 ++++++++++++---------
 ...3-Remove-hard-coded-values-for-CC-and-CXX.patch | 11 ++-
 7 files changed, 125 insertions(+), 148 deletions(-)
 delete mode 100644 recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
 create mode 100644 recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
 create mode 100644 recipes-browser/chromium/chromium/chromium-wayland/guard-x11_desktop_handler-inclusion.patch

diff --git a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
deleted file mode 100644
index 0db8f7d..0000000
--- a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-CHROMIUM_ENABLE_WAYLAND = "1"
-
-include chromium-browser.inc
-
-DEPENDS += "wayland libxkbcommon"
-
-SRC_URI += "\
-        file://chromium-wayland/add_missing_stat_h_include.patch \
-        file://0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
-        file://0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch \
-        file://0005-Override-root-filesystem-access-restriction.patch \
-	file://chromium-wayland/0007-Workaround-for-glib-related-build-error-with-ozone-w.patch \
-        file://chromium-wayland/0011-Replace-readdir_r-with-readdir.patch \
-        file://chromium-wayland/remove-Werror.patch \
-        ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
-        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
-"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
-SRC_URI[md5sum] = "0534981cc21efcd11e64b67b85854420"
-SRC_URI[sha256sum] = "4ca4e2adb340b3fb4d502266ad7d6bda45fa3519906dbf63cce11a63f680dbc8"
-
-OZONE_WAYLAND_GIT_BRANCH = "Milestone-SouthSister"
-OZONE_WAYLAND_GIT_SRCREV = "c605505044af3345a276abbd7c29fd53db1dea40"
-
-SRC_URI += "git://github.com/01org/ozone-wayland.git;destsuffix=${OZONE_WAYLAND_GIT_DESTSUFFIX};branch=${OZONE_WAYLAND_GIT_BRANCH};rev=${OZONE_WAYLAND_GIT_SRCREV} file://chromium-wayland/0006-Remove-GBM-support-from-wayland.gyp.patch"
-
-# Component build is unsupported in ozone-wayland for Chromium 48
-python() {
-    if not bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d):
-        raise bb.parse.SkipPackage("Wayland is not available")
-    if bb.utils.contains('PACKAGECONFIG', 'component-build', True, False, d):
-        bb.fatal("Chromium 48 Wayland version cannot be built in component-mode")
-}
-
-CHROMIUM_WAYLAND_GYP_DEFINES = "use_ash=1 use_aura=1 chromeos=0 use_ozone=1 use_xkbcommon=1"
diff --git a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
new file mode 100644
index 0000000..c927e67
--- /dev/null
+++ b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
@@ -0,0 +1,37 @@
+CHROMIUM_ENABLE_WAYLAND = "1"
+
+include chromium-browser.inc
+
+DEPENDS += "wayland libxkbcommon"
+
+SRC_URI += "\
+        file://chromium-wayland/add_missing_stat_h_include.patch \
+        file://0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
+        file://0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch \
+        file://0005-Override-root-filesystem-access-restriction.patch \
+	file://chromium-wayland/0007-Workaround-for-glib-related-build-error-with-ozone-w.patch \
+        file://chromium-wayland/0011-Replace-readdir_r-with-readdir.patch \
+        file://chromium-wayland/remove-Werror.patch \
+        file://chromium-wayland/guard-x11_desktop_handler-inclusion.patch \
+        ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
+        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
+"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
+SRC_URI[md5sum] = "fdc737af242421b2a9a0bb84f6b17040"
+SRC_URI[sha256sum] = "c52a58b79bfb27bb87e4a0a6ff213001485fbc747657b290f75d39ddce07dcc3"
+
+OZONE_WAYLAND_GIT_BRANCH = "rebase_m53"
+OZONE_WAYLAND_GIT_SRCREV = "1a5e7982bf7b8743c20a20e5aa33d9d6a42d48d6"
+
+SRC_URI += "git://github.com/01org/ozone-wayland.git;destsuffix=${OZONE_WAYLAND_GIT_DESTSUFFIX};branch=${OZONE_WAYLAND_GIT_BRANCH};rev=${OZONE_WAYLAND_GIT_SRCREV} file://chromium-wayland/0006-Remove-GBM-support-from-wayland.gyp.patch"
+
+# Component build is unsupported in ozone-wayland for Chromium 48
+python() {
+    if not bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d):
+        raise bb.parse.SkipPackage("Wayland is not available")
+    if bb.utils.contains('PACKAGECONFIG', 'component-build', True, False, d):
+        bb.fatal("Chromium 48 Wayland version cannot be built in component-mode")
+}
+
+CHROMIUM_WAYLAND_GYP_DEFINES = "use_ash=0 use_aura=1 chromeos=0 use_ozone=1 use_xkbcommon=1 ozone_auto_platforms=0 ozone_platform_wayland=1"
diff --git a/recipes-browser/chromium/chromium/chromium-wayland/0011-Replace-readdir_r-with-readdir.patch b/recipes-browser/chromium/chromium/chromium-wayland/0011-Replace-readdir_r-with-readdir.patch
index 36c7ec2..52dae8c 100644
--- a/recipes-browser/chromium/chromium/chromium-wayland/0011-Replace-readdir_r-with-readdir.patch
+++ b/recipes-browser/chromium/chromium/chromium-wayland/0011-Replace-readdir_r-with-readdir.patch
@@ -1,4 +1,4 @@
-From feb645ae0259582e2075691047e27b5e064ec160 Mon Sep 17 00:00:00 2001
+From 3781812308b7aea64b3be037202c940e1a7ebf03 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <dv@pseudoterminal.org>
 Date: Thu, 19 May 2016 21:12:05 +0200
 Subject: [PATCH] Replace readdir_r with readdir
@@ -8,27 +8,26 @@ https://sourceware.org/bugzilla/show_bug.cgi?id=19056
 
 Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
 ---
- base/files/file_enumerator_posix.cc                | 15 ++++++++++---
+ base/files/file_enumerator_posix.cc                | 15 +++++++++++---
  net/disk_cache/simple/simple_index_file_posix.cc   | 10 ++++++---
- sandbox/linux/services/proc_util.cc                | 24 +++++++++++++--------
- third_party/boringssl/src/crypto/directory_posix.c | 25 +++-------------------
- .../crashpad/crashpad/util/posix/close_multiple.cc |  8 +++++--
- third_party/leveldatabase/env_chromium.cc          | 13 ++++++++---
- 6 files changed, 53 insertions(+), 42 deletions(-)
+ sandbox/linux/services/proc_util.cc                | 24 ++++++++++++++--------
+ .../crashpad/crashpad/util/posix/close_multiple.cc |  8 ++++++--
+ third_party/leveldatabase/env_chromium.cc          | 13 +++++++++---
+ 5 files changed, 50 insertions(+), 20 deletions(-)
 
 diff --git a/base/files/file_enumerator_posix.cc b/base/files/file_enumerator_posix.cc
-index 7533a24..637b8cd 100644
+index fb4010a..cf2fd40 100644
 --- a/base/files/file_enumerator_posix.cc
 +++ b/base/files/file_enumerator_posix.cc
-@@ -7,6 +7,7 @@
- #include <dirent.h>
+@@ -8,6 +8,7 @@
  #include <errno.h>
  #include <fnmatch.h>
+ #include <stdint.h>
 +#include <string.h>
  
  #include "base/logging.h"
  #include "base/threading/thread_restrictions.h"
-@@ -129,9 +130,17 @@ bool FileEnumerator::ReadDirectory(std::vector<FileInfo>* entries,
+@@ -131,9 +132,17 @@ bool FileEnumerator::ReadDirectory(std::vector<FileInfo>* entries,
           additional space for pathname may be needed
  #endif
  
@@ -50,7 +49,7 @@ index 7533a24..637b8cd 100644
      info.filename_ = FilePath(dent->d_name);
  
 diff --git a/net/disk_cache/simple/simple_index_file_posix.cc b/net/disk_cache/simple/simple_index_file_posix.cc
-index 586699d..bbe81fc 100644
+index e0dd3dd..b155d92 100644
 --- a/net/disk_cache/simple/simple_index_file_posix.cc
 +++ b/net/disk_cache/simple/simple_index_file_posix.cc
 @@ -34,8 +34,12 @@ bool SimpleIndexFile::TraverseCacheDirectory(
@@ -78,10 +77,10 @@ index 586699d..bbe81fc 100644
  }
  
 diff --git a/sandbox/linux/services/proc_util.cc b/sandbox/linux/services/proc_util.cc
-index 8341b4a..1603415 100644
+index b6d58de..3c7bb84 100644
 --- a/sandbox/linux/services/proc_util.cc
 +++ b/sandbox/linux/services/proc_util.cc
-@@ -50,15 +50,18 @@ int ProcUtil::CountOpenFds(int proc_fd) {
+@@ -51,15 +51,18 @@ int ProcUtil::CountOpenFds(int proc_fd) {
    CHECK(dir);
  
    int count = 0;
@@ -104,7 +103,7 @@ index 8341b4a..1603415 100644
      if (fd_num == proc_fd || fd_num == proc_self_fd) {
        continue;
      }
-@@ -80,22 +83,25 @@ bool ProcUtil::HasOpenDirectory(int proc_fd) {
+@@ -81,22 +84,25 @@ bool ProcUtil::HasOpenDirectory(int proc_fd) {
    ScopedDIR dir(fdopendir(proc_self_fd));
    CHECK(dir);
  
@@ -135,59 +134,8 @@ index 8341b4a..1603415 100644
      if (S_ISDIR(s.st_mode)) {
        return true;
      }
-diff --git a/third_party/boringssl/src/crypto/directory_posix.c b/third_party/boringssl/src/crypto/directory_posix.c
-index b944b69..17143a7 100644
---- a/third_party/boringssl/src/crypto/directory_posix.c
-+++ b/third_party/boringssl/src/crypto/directory_posix.c
-@@ -24,10 +24,6 @@
-  * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
-  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. */
- 
--#if !defined(_POSIX_C_SOURCE)
--#define _POSIX_C_SOURCE 201409  /* for readdir_r */
--#endif
--
- #include "directory.h"
- 
- 
-@@ -38,21 +34,6 @@
- #include <stdlib.h>
- #include <string.h>
- 
--#if defined(OPENSSL_PNACL)
--/* pnacl doesn't include readdir_r! So we do the best we can. */
--int readdir_r(DIR *dirp, struct dirent *entry, struct dirent **result) {
--  errno = 0;
--  *result = readdir(dirp);
--  if (*result != NULL) {
--    return 0;
--  }
--  if (errno) {
--    return 1;
--  }
--  return 0;
--}
--#endif
--
- struct OPENSSL_dir_context_st {
-   DIR *dir;
-   struct dirent dirent;
-@@ -85,10 +66,10 @@ const char *OPENSSL_DIR_read(OPENSSL_DIR_CTX **ctx, const char *directory) {
-     }
-   }
- 
--  if (readdir_r((*ctx)->dir, &(*ctx)->dirent, &dirent) != 0 ||
--      dirent == NULL) {
-+  errno = 0;
-+  dirent = readdir((*ctx)->dir);
-+  if (dirent == NULL || errno != 0)
-     return 0;
--  }
- 
-   return (*ctx)->dirent.d_name;
- }
 diff --git a/third_party/crashpad/crashpad/util/posix/close_multiple.cc b/third_party/crashpad/crashpad/util/posix/close_multiple.cc
-index d94d575..4c1287a 100644
+index fea7ca0..0b23b83 100644
 --- a/third_party/crashpad/crashpad/util/posix/close_multiple.cc
 +++ b/third_party/crashpad/crashpad/util/posix/close_multiple.cc
 @@ -100,10 +100,14 @@ bool CloseMultipleNowOrOnExecUsingFDDir(int fd, int preserve_fd) {
@@ -208,10 +156,10 @@ index d94d575..4c1287a 100644
      if (strcmp(entry_name, ".") == 0 || strcmp(entry_name, "..") == 0) {
        continue;
 diff --git a/third_party/leveldatabase/env_chromium.cc b/third_party/leveldatabase/env_chromium.cc
-index 939534c..f23142e 100644
+index 200a12a..4b5d86c 100644
 --- a/third_party/leveldatabase/env_chromium.cc
 +++ b/third_party/leveldatabase/env_chromium.cc
-@@ -79,10 +79,17 @@ static base::File::Error GetDirectoryEntries(const FilePath& dir_param,
+@@ -82,10 +82,17 @@ static base::File::Error GetDirectoryEntries(const FilePath& dir_param,
    DIR* dir = opendir(dir_string.c_str());
    if (!dir)
      return base::File::OSErrorToFileError(errno);
@@ -233,5 +181,5 @@ index 939534c..f23142e 100644
        continue;
      result->push_back(FilePath::FromUTF8Unsafe(dent->d_name));
 -- 
-2.7.4
+2.1.4
 
diff --git a/recipes-browser/chromium/chromium/chromium-wayland/add_missing_stat_h_include.patch b/recipes-browser/chromium/chromium/chromium-wayland/add_missing_stat_h_include.patch
index 4620db2..5cd0bce 100644
--- a/recipes-browser/chromium/chromium/chromium-wayland/add_missing_stat_h_include.patch
+++ b/recipes-browser/chromium/chromium/chromium-wayland/add_missing_stat_h_include.patch
@@ -34,6 +34,6 @@ Upstream-Status: Pending
  #include <mntent.h>
  #include <stdio.h>
 +#include <sys/stat.h>
- 
+ #include <limits>
  #include <list>
  
diff --git a/recipes-browser/chromium/chromium/chromium-wayland/guard-x11_desktop_handler-inclusion.patch b/recipes-browser/chromium/chromium/chromium-wayland/guard-x11_desktop_handler-inclusion.patch
new file mode 100644
index 0000000..8c1e268
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-wayland/guard-x11_desktop_handler-inclusion.patch
@@ -0,0 +1,13 @@
+diff --git a/chrome/browser/ui/startup/startup_browser_creator.cc b/chrome/browser/ui/startup/startup_browser_creator.cc
+index e9899b0..f9103d0 100644
+--- a/chrome/browser/ui/startup/startup_browser_creator.cc
++++ b/chrome/browser/ui/startup/startup_browser_creator.cc
+@@ -101,7 +101,7 @@
+ #include "chrome/browser/metrics/jumplist_metrics_win.h"
+ #endif
+ 
+-#if defined(OS_LINUX) && !defined(OS_CHROMEOS)
++#if defined(OS_LINUX) && !defined(OS_CHROMEOS) && defined(USE_X11)
+ #include "ui/views/widget/desktop_aura/x11_desktop_handler.h"
+ #endif
+ 
diff --git a/recipes-browser/chromium/chromium/chromium-wayland/remove-Werror.patch b/recipes-browser/chromium/chromium/chromium-wayland/remove-Werror.patch
index 2d1842b..a0c9090 100644
--- a/recipes-browser/chromium/chromium/chromium-wayland/remove-Werror.patch
+++ b/recipes-browser/chromium/chromium/chromium-wayland/remove-Werror.patch
@@ -1,8 +1,19 @@
-Index: chromium-48.0.2548.0/build/common.gypi
-===================================================================
---- chromium-48.0.2548.0.orig/build/common.gypi
-+++ chromium-48.0.2548.0/build/common.gypi
-@@ -1421,7 +1421,7 @@
+From 5fd704f9bf70acaf63fb5611494c3373709c39e7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jacobo=20Aragunde=20P=C3=A9rez?= <jaragunde@igalia.com>
+Date: Wed, 30 Nov 2016 13:49:06 +0100
+Subject: [PATCH 1/1] remove -Werror
+
+---
+ build/common.gypi              | 14 ++++----------
+ build/config/compiler/BUILD.gn |  3 ---
+ build/nocompile.gypi           |  2 +-
+ 3 files changed, 5 insertions(+), 14 deletions(-)
+
+diff --git a/build/common.gypi b/build/common.gypi
+index 5dc14c7..ac559f6 100644
+--- a/build/common.gypi
++++ b/build/common.gypi
+@@ -1431,7 +1431,7 @@
  
      # Disable fatal linker warnings, similarly to how we make it possible
      # to disable -Werror (e.g. for different toolchain versions).
@@ -11,9 +22,9 @@ Index: chromium-48.0.2548.0/build/common.gypi
  
      'release_valgrind_build%': 0,
  
-@@ -3135,12 +3135,6 @@
-               '-Wsign-compare',
-             ]
+@@ -3052,12 +3052,6 @@
+             # third-party code either.
+             'cflags!': [ '-Wall' ],
            }],
 -          # TODO: Fix all warnings on chromeos too.
 -          [ 'os_posix==1 and OS!="mac" and OS!="ios" and (clang!=1 or chromeos==1)', {
@@ -21,10 +32,10 @@ Index: chromium-48.0.2548.0/build/common.gypi
 -              '-Werror',
 -            ],
 -          }],
-           [ 'os_posix==1 and os_bsd!=1 and OS!="mac" and OS!="android"', {
-             'cflags': [
-               # Don't warn about ignoring the return value from e.g. close().
-@@ -3692,10 +3686,10 @@
+           [ 'OS=="win"', {
+             'defines': [
+               '_CRT_SECURE_NO_DEPRECATE',
+@@ -3593,10 +3587,10 @@
      }],
      ['os_posix==1 and OS!="mac" and OS!="ios"', {
        'target_defaults': {
@@ -35,34 +46,36 @@ Index: chromium-48.0.2548.0/build/common.gypi
 -          'werror%': '-Werror',
 +          'werror%': '',
            'libraries_for_target%': '',
-         },
-         'defines': [
-@@ -5045,7 +5039,7 @@
+           'conditions' : [
+             # Enable -Wextra for chromium_code when we control the compiler.
+@@ -5062,7 +5056,7 @@
            'GCC_OBJC_CALL_CXX_CDTORS': 'YES',        # -fobjc-call-cxx-cdtors
            'GCC_SYMBOLS_PRIVATE_EXTERN': 'YES',      # -fvisibility=hidden
            'GCC_THREADSAFE_STATICS': 'NO',           # -fno-threadsafe-statics
 -          'GCC_TREAT_WARNINGS_AS_ERRORS': 'YES',    # -Werror
-+          'GCC_TREAT_WARNINGS_AS_ERRORS': 'NO',     # -Werror
-           'GCC_VERSION': '4.2',
-           'GCC_WARN_ABOUT_MISSING_NEWLINE': 'YES',  # -Wnewline-eof
++          'GCC_TREAT_WARNINGS_AS_ERRORS': 'NO',    # -Werror
+           'GCC_VERSION': 'com.apple.compilers.llvm.clang.1_0',
            'USE_HEADERMAP': 'NO',
-Index: chromium-48.0.2548.0/build/config/compiler/BUILD.gn
-===================================================================
---- chromium-48.0.2548.0.orig/build/config/compiler/BUILD.gn
-+++ chromium-48.0.2548.0/build/config/compiler/BUILD.gn
-@@ -687,7 +687,6 @@ config("default_warnings") {
-     cflags += [
-       # Enables.
-       "-Wendif-labels",  # Weird old-style text after an #endif.
--      "-Werror",  # Warnings as errors.
- 
-       # Disables.
-       "-Wno-missing-field-initializers",  # "struct foo f = {0};"
-Index: chromium-48.0.2548.0/build/nocompile.gypi
-===================================================================
---- chromium-48.0.2548.0.orig/build/nocompile.gypi
-+++ chromium-48.0.2548.0/build/nocompile.gypi
-@@ -81,7 +81,7 @@
+           'WARNING_CFLAGS': [
+diff --git a/build/config/compiler/BUILD.gn b/build/config/compiler/BUILD.gn
+index 50ee2a6..a485eb6 100644
+--- a/build/config/compiler/BUILD.gn
++++ b/build/config/compiler/BUILD.gn
+@@ -1039,9 +1039,6 @@ config("chromium_code") {
+     cflags = [ "/W4" ]  # Warning level 4.
+   } else {
+     cflags = [ "-Wall" ]
+-    if (treat_warnings_as_errors) {
+-      cflags += [ "-Werror" ]
+-    }
+     if (is_clang) {
+       # Enable -Wextra for chromium_code when we control the compiler.
+       cflags += [ "-Wextra" ]
+diff --git a/build/nocompile.gypi b/build/nocompile.gypi
+index 4f61add..7959fbd 100644
+--- a/build/nocompile.gypi
++++ b/build/nocompile.gypi
+@@ -82,7 +82,7 @@
              '<(nocompile_driver)',
              '4', # number of compilers to invoke in parallel.
              '<(RULE_INPUT_PATH)',
@@ -71,3 +84,6 @@ Index: chromium-48.0.2548.0/build/nocompile.gypi
              '<(nc_result_path)',
              ],
            'message': 'Generating no compile results for <(RULE_INPUT_PATH)',
+-- 
+2.1.4
+
diff --git a/recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-CC-and-CXX.patch b/recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
index 7bc8d14..63de68a 100644
--- a/recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
+++ b/recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
@@ -21,7 +21,7 @@ diff --git a/build/common.gypi b/build/common.gypi
 index 7ec5ae2..11e8d1d 100644
 --- a/build/common.gypi
 +++ b/build/common.gypi
-@@ -6047,16 +6047,6 @@
+@@ -6027,16 +6027,6 @@
          ['CXX.host', '<(host_cxx)'],
        ],
      }],
@@ -35,9 +35,8 @@ index 7ec5ae2..11e8d1d 100644
 -        ['CXX.host', '<(host_cxx)'],
 -      ],
 -    }],
-     # TODO(yyanagisawa): supports GENERATOR==make
-     #  make generator doesn't support CC_wrapper without CC
-     #  in make_global_settings yet.
+     ['use_goma==1', {
+       'make_global_settings': [
+        ['CC_wrapper', '<(gomadir)/gomacc'],
 -- 
-1.9.1
-
+2.1.4
-- 
2.7.4


