Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.10])
	by mail.openembedded.org (Postfix) with ESMTP id F1A23601A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 05:50:57 +0000 (UTC)
Received: from nbhjo (36-225-59-210.dynamic-ip.hinet.net [36.225.59.210])
	by msfrf2624.sfr.fr (SMTP Server) with ESMTP id 13FD21C001009;
	Thu, 26 Jan 2017 06:50:55 +0100 (CET)
Received: from nbhjo (36-225-59-210.dynamic-ip.hinet.net
	[36.225.59.210])	(using TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2624.sfr.fr (SMTP Server) with ESMTPSA;
	Thu, 26 Jan 2017 06:50:51 +0100 (CET)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-devel@lists.openembedded.org
References: <1485356812-8436-1-git-send-email-jaragunde@igalia.com>
In-Reply-To: <1485356812-8436-1-git-send-email-jaragunde@igalia.com>
Date: Thu, 26 Jan 2017 06:50:46 +0100
Message-ID: <008601d27798$272e3640$758aa2c0$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQGT1+/H1iT3F95Bd5Lp7HEWhi2uL6HHfDPQ
X-sfr-mailing: LEGIT
Cc: otavio@ossystems.com.br
Subject: Re: [meta-browser][PATCH v2] chromium-wayland: update to	53.0.2785.14
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
X-List-Received-Date: Thu, 26 Jan 2017 05:51:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: fr

Hi Jacob,

I've been able to compile chromium-wayland 53.0.2785.14 on RaspberryPi, =
with Wayland only (no X11), BUT I had to add an additional patch for it =
to work, or else I get an error in =
ui/events/keycodes/keyboard_code_conversion_xkb.cc.
I'm using VC4, which has a DRM/KMS interface (it seems that DRM =
interface is required by ozone-wayland), but this patch seems to not be =
related to RaspberryPi itself.
Basically, it seems that USE_XKBCOMMON is not defined when compiling =
keycodes.

Is it something that you saw as well? Or do you have a different =
setting/experience?

Just for reference, here is the patch I need (right now, I'm triggering =
it from meta-raspberrypi, but I believe it may be needed in =
meta-browser).

--- a/ui/events/keycodes/events_keycodes.gyp	2017-01-23 =
19:12:01.767271256 +0800
+++ b/ui/events/keycodes/events_keycodes.gyp	2017-01-23 =
19:12:11.503048216 +0800
@@ -21,6 +21,9 @@
         'scoped_xkb.h',
         'xkb_keysym.h',
       ],
+      'defines': [
+        'USE_XKBCOMMON',
+      ],
     },
   ],
   'conditions': [

Cheers,
Herve

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of =
Jacobo Aragunde P=C3=A9rez
Sent: mercredi 25 janvier 2017 16:07
To: openembedded-devel@lists.openembedded.org
Cc: otavio@ossystems.com.br
Subject: [oe] [meta-browser][PATCH v2] chromium-wayland: update to =
53.0.2785.14

That is the latest version of Chromium that has been made work with the =
Ozone-Wayland project.

Patches have been rebased and configure flags were changed because =
existing ones were causing conflicts in the new version. An extra patch =
was added to prevent the build from failing when building without X11 =
libs present due to an unnecessary inclusion.

Signed-off-by: Jacobo Aragunde P=C3=A9rez <jaragunde@igalia.com>
---
 .../chromium/chromium-wayland_48.0.2548.0.bb       | 36 ---------
 .../chromium/chromium-wayland_53.0.2785.143.bb     | 37 +++++++++
 .../0011-Replace-readdir_r-with-readdir.patch      | 88 =
+++++-----------------
 .../add_missing_stat_h_include.patch               |  2 +-
 .../guard-x11_desktop_handler-inclusion.patch      | 13 ++++
 .../chromium/chromium-wayland/remove-Werror.patch  | 66 =
++++++++--------  ...3-Remove-hard-coded-values-for-CC-and-CXX.patch | =
11 ++-
 7 files changed, 108 insertions(+), 145 deletions(-)  delete mode =
100644 recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
 create mode 100644 =
recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
 create mode 100644 =
recipes-browser/chromium/chromium/chromium-wayland/guard-x11_desktop_hand=
ler-inclusion.patch

diff --git a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb =
b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
deleted file mode 100644
index 0db8f7d..0000000
--- a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-CHROMIUM_ENABLE_WAYLAND =3D "1"
-
-include chromium-browser.inc
-
-DEPENDS +=3D "wayland libxkbcommon"
-
-SRC_URI +=3D "\
-        file://chromium-wayland/add_missing_stat_h_include.patch \
-        file://0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
-        =
file://0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch \
-        file://0005-Override-root-filesystem-access-restriction.patch \
-	=
file://chromium-wayland/0007-Workaround-for-glib-related-build-error-with=
-ozone-w.patch \
-        =
file://chromium-wayland/0011-Replace-readdir_r-with-readdir.patch \
-        file://chromium-wayland/remove-Werror.patch \
-        ${@bb.utils.contains('PACKAGECONFIG', 'component-build', =
'file://component-build.gypi', '', d)} \
-        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', =
'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', =
'', d)} \
-"
-
-LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D0fca02217a5d49a14dfe2d11837bb34d"
-SRC_URI[md5sum] =3D "0534981cc21efcd11e64b67b85854420"
-SRC_URI[sha256sum] =3D =
"4ca4e2adb340b3fb4d502266ad7d6bda45fa3519906dbf63cce11a63f680dbc8"
-
-OZONE_WAYLAND_GIT_BRANCH =3D "Milestone-SouthSister"
-OZONE_WAYLAND_GIT_SRCREV =3D "c605505044af3345a276abbd7c29fd53db1dea40"
-
-SRC_URI +=3D =
"git://github.com/01org/ozone-wayland.git;destsuffix=3D${OZONE_WAYLAND_GI=
T_DESTSUFFIX};branch=3D${OZONE_WAYLAND_GIT_BRANCH};rev=3D${OZONE_WAYLAND_=
GIT_SRCREV} =
file://chromium-wayland/0006-Remove-GBM-support-from-wayland.gyp.patch"
-
-# Component build is unsupported in ozone-wayland for Chromium 48
-python() {
-    if not bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, =
d):
-        raise bb.parse.SkipPackage("Wayland is not available")
-    if bb.utils.contains('PACKAGECONFIG', 'component-build', True, =
False, d):
-        bb.fatal("Chromium 48 Wayland version cannot be built in =
component-mode")
-}
-
-CHROMIUM_WAYLAND_GYP_DEFINES =3D "use_ash=3D1 use_aura=3D1 chromeos=3D0 =
use_ozone=3D1 use_xkbcommon=3D1"
diff --git a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb =
b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
new file mode 100644
index 0000000..c8aea27
--- /dev/null
+++ b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
@@ -0,0 +1,37 @@
+CHROMIUM_ENABLE_WAYLAND =3D "1"
+
+include chromium-browser.inc
+
+DEPENDS +=3D "wayland libxkbcommon"
+
+SRC_URI +=3D "\
+        file://chromium-wayland/add_missing_stat_h_include.patch \
+        file://0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
+        =
file://0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch \
+        file://0005-Override-root-filesystem-access-restriction.patch \
+	=
file://chromium-wayland/0007-Workaround-for-glib-related-build-error-with=
-ozone-w.patch \
+        =
file://chromium-wayland/0011-Replace-readdir_r-with-readdir.patch \
+        file://chromium-wayland/remove-Werror.patch \
+        =
file://chromium-wayland/guard-x11_desktop_handler-inclusion.patch \
+        ${@bb.utils.contains('PACKAGECONFIG', 'component-build', =
'file://component-build.gypi', '', d)} \
+        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context',=20
+'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', =
'', d)} \ "
+
+LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D0fca02217a5d49a14dfe2d11837bb34d"
+SRC_URI[md5sum] =3D "fdc737af242421b2a9a0bb84f6b17040"
+SRC_URI[sha256sum] =3D =
"c52a58b79bfb27bb87e4a0a6ff213001485fbc747657b290f75d39ddce07dcc3"
+
+OZONE_WAYLAND_GIT_BRANCH =3D "rebase_m53"
+OZONE_WAYLAND_GIT_SRCREV =3D "1a5e7982bf7b8743c20a20e5aa33d9d6a42d48d6"
+
+SRC_URI +=3D =
"git://github.com/01org/ozone-wayland.git;destsuffix=3D${OZONE_WAYLAND_GI=
T_DESTSUFFIX};branch=3D${OZONE_WAYLAND_GIT_BRANCH};rev=3D${OZONE_WAYLAND_=
GIT_SRCREV} =
file://chromium-wayland/0006-Remove-GBM-support-from-wayland.gyp.patch"
+
+# Component build is unsupported in ozone-wayland for Chromium 53
+python() {
+    if not bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, =
d):
+        raise bb.parse.SkipPackage("Wayland is not available")
+    if bb.utils.contains('PACKAGECONFIG', 'component-build', True, =
False, d):
+        bb.fatal("Chromium 53 Wayland version cannot be built in=20
+component-mode") }
+
+CHROMIUM_WAYLAND_GYP_DEFINES =3D "use_ash=3D0 use_aura=3D1 chromeos=3D0 =
use_ozone=3D1 use_xkbcommon=3D1 ozone_auto_platforms=3D0 =
ozone_platform_wayland=3D1"
diff --git =
a/recipes-browser/chromium/chromium/chromium-wayland/0011-Replace-readdir=
_r-with-readdir.patch =
b/recipes-browser/chromium/chromium/chromium-wayland/0011-Replace-readdir=
_r-with-readdir.patch
index 36c7ec2..52dae8c 100644
--- =
a/recipes-browser/chromium/chromium/chromium-wayland/0011-Replace-readdir=
_r-with-readdir.patch
+++ b/recipes-browser/chromium/chromium/chromium-wayland/0011-Replace-re
+++ addir_r-with-readdir.patch
@@ -1,4 +1,4 @@
-From feb645ae0259582e2075691047e27b5e064ec160 Mon Sep 17 00:00:00 2001
+From 3781812308b7aea64b3be037202c940e1a7ebf03 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <dv@pseudoterminal.org>
 Date: Thu, 19 May 2016 21:12:05 +0200
 Subject: [PATCH] Replace readdir_r with readdir @@ -8,27 +8,26 @@ =
https://sourceware.org/bugzilla/show_bug.cgi?id=3D19056
=20
 Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
 ---
- base/files/file_enumerator_posix.cc                | 15 ++++++++++---
+ base/files/file_enumerator_posix.cc                | 15 +++++++++++---
  net/disk_cache/simple/simple_index_file_posix.cc   | 10 ++++++---
- sandbox/linux/services/proc_util.cc                | 24 =
+++++++++++++--------
- third_party/boringssl/src/crypto/directory_posix.c | 25 =
+++-------------------
- .../crashpad/crashpad/util/posix/close_multiple.cc |  8 +++++--
- third_party/leveldatabase/env_chromium.cc          | 13 ++++++++---
- 6 files changed, 53 insertions(+), 42 deletions(-)
+ sandbox/linux/services/proc_util.cc                | 24 =
++++++++++++++--------
+ .../crashpad/crashpad/util/posix/close_multiple.cc |  8 ++++++--
+ third_party/leveldatabase/env_chromium.cc          | 13 +++++++++---
+ 5 files changed, 50 insertions(+), 20 deletions(-)
=20
 diff --git a/base/files/file_enumerator_posix.cc =
b/base/files/file_enumerator_posix.cc
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
 =20
  #include "base/logging.h"
  #include "base/threading/thread_restrictions.h"
-@@ -129,9 +130,17 @@ bool =
FileEnumerator::ReadDirectory(std::vector<FileInfo>* entries,
+@@ -131,9 +132,17 @@ bool=20
+FileEnumerator::ReadDirectory(std::vector<FileInfo>* entries,
           additional space for pathname may be needed
  #endif
 =20
@@ -50,7 +49,7 @@ index 7533a24..637b8cd 100644
      info.filename_ =3D FilePath(dent->d_name);
 =20
 diff --git a/net/disk_cache/simple/simple_index_file_posix.cc =
b/net/disk_cache/simple/simple_index_file_posix.cc
-index 586699d..bbe81fc 100644
+index e0dd3dd..b155d92 100644
 --- a/net/disk_cache/simple/simple_index_file_posix.cc
 +++ b/net/disk_cache/simple/simple_index_file_posix.cc
 @@ -34,8 +34,12 @@ bool SimpleIndexFile::TraverseCacheDirectory(
@@ -78,10 +77,10 @@ index 586699d..bbe81fc 100644
  }
 =20
 diff --git a/sandbox/linux/services/proc_util.cc =
b/sandbox/linux/services/proc_util.cc
-index 8341b4a..1603415 100644
+index b6d58de..3c7bb84 100644
 --- a/sandbox/linux/services/proc_util.cc
 +++ b/sandbox/linux/services/proc_util.cc
-@@ -50,15 +50,18 @@ int ProcUtil::CountOpenFds(int proc_fd) {
+@@ -51,15 +51,18 @@ int ProcUtil::CountOpenFds(int proc_fd) {
    CHECK(dir);
 =20
    int count =3D 0;
@@ -104,7 +103,7 @@ index 8341b4a..1603415 100644
      if (fd_num =3D=3D proc_fd || fd_num =3D=3D proc_self_fd) {
        continue;
      }
-@@ -80,22 +83,25 @@ bool ProcUtil::HasOpenDirectory(int proc_fd) {
+@@ -81,22 +84,25 @@ bool ProcUtil::HasOpenDirectory(int proc_fd) {
    ScopedDIR dir(fdopendir(proc_self_fd));
    CHECK(dir);
 =20
@@ -135,59 +134,8 @@ index 8341b4a..1603415 100644
      if (S_ISDIR(s.st_mode)) {
        return true;
      }
-diff --git a/third_party/boringssl/src/crypto/directory_posix.c =
b/third_party/boringssl/src/crypto/directory_posix.c
-index b944b69..17143a7 100644
---- a/third_party/boringssl/src/crypto/directory_posix.c
-+++ b/third_party/boringssl/src/crypto/directory_posix.c
-@@ -24,10 +24,6 @@
-  * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE =
USE
-  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH =
DAMAGE. */
-
--#if !defined(_POSIX_C_SOURCE)
--#define _POSIX_C_SOURCE 201409  /* for readdir_r */ --#endif
--
- #include "directory.h"
-
-
-@@ -38,21 +34,6 @@
- #include <stdlib.h>
- #include <string.h>
-
--#if defined(OPENSSL_PNACL)
--/* pnacl doesn't include readdir_r! So we do the best we can. */ --int =
readdir_r(DIR *dirp, struct dirent *entry, struct dirent **result) {
--  errno =3D 0;
--  *result =3D readdir(dirp);
--  if (*result !=3D NULL) {
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
-@@ -85,10 +66,10 @@ const char *OPENSSL_DIR_read(OPENSSL_DIR_CTX **ctx, =
const char *directory) {
-     }
-   }
-
--  if (readdir_r((*ctx)->dir, &(*ctx)->dirent, &dirent) !=3D 0 ||
--      dirent =3D=3D NULL) {
-+  errno =3D 0;
-+  dirent =3D readdir((*ctx)->dir);
-+  if (dirent =3D=3D NULL || errno !=3D 0)
-     return 0;
--  }
-=20
-   return (*ctx)->dirent.d_name;
- }
 diff --git a/third_party/crashpad/crashpad/util/posix/close_multiple.cc =
b/third_party/crashpad/crashpad/util/posix/close_multiple.cc
-index d94d575..4c1287a 100644
+index fea7ca0..0b23b83 100644
 --- a/third_party/crashpad/crashpad/util/posix/close_multiple.cc
 +++ b/third_party/crashpad/crashpad/util/posix/close_multiple.cc
 @@ -100,10 +100,14 @@ bool CloseMultipleNowOrOnExecUsingFDDir(int fd, =
int preserve_fd) { @@ -208,10 +156,10 @@ index d94d575..4c1287a 100644
      if (strcmp(entry_name, ".") =3D=3D 0 || strcmp(entry_name, "..") =
=3D=3D 0) {
        continue;
 diff --git a/third_party/leveldatabase/env_chromium.cc =
b/third_party/leveldatabase/env_chromium.cc
-index 939534c..f23142e 100644
+index 200a12a..4b5d86c 100644
 --- a/third_party/leveldatabase/env_chromium.cc
 +++ b/third_party/leveldatabase/env_chromium.cc
-@@ -79,10 +79,17 @@ static base::File::Error GetDirectoryEntries(const =
FilePath& dir_param,
+@@ -82,10 +82,17 @@ static base::File::Error GetDirectoryEntries(const=20
+FilePath& dir_param,
    DIR* dir =3D opendir(dir_string.c_str());
    if (!dir)
      return base::File::OSErrorToFileError(errno);
@@ -233,5 +181,5 @@ index 939534c..f23142e 100644
        continue;
      result->push_back(FilePath::FromUTF8Unsafe(dent->d_name));
 --
-2.7.4
+2.1.4
=20
diff --git =
a/recipes-browser/chromium/chromium/chromium-wayland/add_missing_stat_h_i=
nclude.patch =
b/recipes-browser/chromium/chromium/chromium-wayland/add_missing_stat_h_i=
nclude.patch
index 4620db2..5cd0bce 100644
--- =
a/recipes-browser/chromium/chromium/chromium-wayland/add_missing_stat_h_i=
nclude.patch
+++ b/recipes-browser/chromium/chromium/chromium-wayland/add_missing_sta
+++ t_h_include.patch
@@ -34,6 +34,6 @@ Upstream-Status: Pending
  #include <mntent.h>
  #include <stdio.h>
 +#include <sys/stat.h>
-=20
+ #include <limits>
  #include <list>
 =20
diff --git =
a/recipes-browser/chromium/chromium/chromium-wayland/guard-x11_desktop_ha=
ndler-inclusion.patch =
b/recipes-browser/chromium/chromium/chromium-wayland/guard-x11_desktop_ha=
ndler-inclusion.patch
new file mode 100644
index 0000000..8c1e268
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-wayland/guard-x11_deskt
+++ op_handler-inclusion.patch
@@ -0,0 +1,13 @@
+diff --git a/chrome/browser/ui/startup/startup_browser_creator.cc=20
+b/chrome/browser/ui/startup/startup_browser_creator.cc
+index e9899b0..f9103d0 100644
+--- a/chrome/browser/ui/startup/startup_browser_creator.cc
++++ b/chrome/browser/ui/startup/startup_browser_creator.cc
+@@ -101,7 +101,7 @@
+ #include "chrome/browser/metrics/jumplist_metrics_win.h"
+ #endif
+=20
+-#if defined(OS_LINUX) && !defined(OS_CHROMEOS)
++#if defined(OS_LINUX) && !defined(OS_CHROMEOS) && defined(USE_X11)
+ #include "ui/views/widget/desktop_aura/x11_desktop_handler.h"
+ #endif
+=20
diff --git =
a/recipes-browser/chromium/chromium/chromium-wayland/remove-Werror.patch =
b/recipes-browser/chromium/chromium/chromium-wayland/remove-Werror.patch
index 2d1842b..872215d 100644
--- =
a/recipes-browser/chromium/chromium/chromium-wayland/remove-Werror.patch
+++ b/recipes-browser/chromium/chromium/chromium-wayland/remove-Werror.p
+++ atch
@@ -1,8 +1,8 @@
-Index: chromium-48.0.2548.0/build/common.gypi
+Index: chromium-53.0.2785.143/build/common.gypi
 =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- chromium-48.0.2548.0.orig/build/common.gypi
-+++ chromium-48.0.2548.0/build/common.gypi
-@@ -1421,7 +1421,7 @@
+--- chromium-53.0.2785.143.orig/build/common.gypi
++++ chromium-53.0.2785.143/build/common.gypi
+@@ -1431,7 +1431,7 @@
 =20
      # Disable fatal linker warnings, similarly to how we make it =
possible
      # to disable -Werror (e.g. for different toolchain versions).
@@ -11,9 +11,9 @@ Index: chromium-48.0.2548.0/build/common.gypi
 =20
      'release_valgrind_build%': 0,
 =20
-@@ -3135,12 +3135,6 @@
-               '-Wsign-compare',
-             ]
+@@ -3052,12 +3052,6 @@
+             # third-party code either.
+             'cflags!': [ '-Wall' ],
            }],
 -          # TODO: Fix all warnings on chromeos too.
 -          [ 'os_posix=3D=3D1 and OS!=3D"mac" and OS!=3D"ios" and =
(clang!=3D1 or chromeos=3D=3D1)', {
@@ -21,10 +21,10 @@ Index: chromium-48.0.2548.0/build/common.gypi
 -              '-Werror',
 -            ],
 -          }],
-           [ 'os_posix=3D=3D1 and os_bsd!=3D1 and OS!=3D"mac" and =
OS!=3D"android"', {
-             'cflags': [
-               # Don't warn about ignoring the return value from e.g. =
close().
-@@ -3692,10 +3686,10 @@
+           [ 'OS=3D=3D"win"', {
+             'defines': [
+               '_CRT_SECURE_NO_DEPRECATE', @@ -3593,10 +3587,10 @@
      }],
      ['os_posix=3D=3D1 and OS!=3D"mac" and OS!=3D"ios"', {
        'target_defaults': {
@@ -35,34 +35,36 @@ Index: chromium-48.0.2548.0/build/common.gypi
 -          'werror%': '-Werror',
 +          'werror%': '',
            'libraries_for_target%': '',
-         },
-         'defines': [
-@@ -5045,7 +5039,7 @@
+           'conditions' : [
+             # Enable -Wextra for chromium_code when we control the =
compiler.
+@@ -5062,7 +5056,7 @@
            'GCC_OBJC_CALL_CXX_CDTORS': 'YES',        # =
-fobjc-call-cxx-cdtors
            'GCC_SYMBOLS_PRIVATE_EXTERN': 'YES',      # =
-fvisibility=3Dhidden
            'GCC_THREADSAFE_STATICS': 'NO',           # =
-fno-threadsafe-statics
 -          'GCC_TREAT_WARNINGS_AS_ERRORS': 'YES',    # -Werror
-+          'GCC_TREAT_WARNINGS_AS_ERRORS': 'NO',     # -Werror
-           'GCC_VERSION': '4.2',
-           'GCC_WARN_ABOUT_MISSING_NEWLINE': 'YES',  # -Wnewline-eof
++          'GCC_TREAT_WARNINGS_AS_ERRORS': 'NO',    # -Werror
+           'GCC_VERSION': 'com.apple.compilers.llvm.clang.1_0',
            'USE_HEADERMAP': 'NO',
-Index: chromium-48.0.2548.0/build/config/compiler/BUILD.gn
+           'WARNING_CFLAGS': [
+Index: chromium-53.0.2785.143/build/config/compiler/BUILD.gn
 =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- chromium-48.0.2548.0.orig/build/config/compiler/BUILD.gn
-+++ chromium-48.0.2548.0/build/config/compiler/BUILD.gn
-@@ -687,7 +687,6 @@ config("default_warnings") {
-     cflags +=3D [
-       # Enables.
-       "-Wendif-labels",  # Weird old-style text after an #endif.
--      "-Werror",  # Warnings as errors.
-=20
-       # Disables.
-       "-Wno-missing-field-initializers",  # "struct foo f =3D {0};"
-Index: chromium-48.0.2548.0/build/nocompile.gypi
+--- chromium-53.0.2785.143.orig/build/config/compiler/BUILD.gn
++++ chromium-53.0.2785.143/build/config/compiler/BUILD.gn
+@@ -1039,9 +1039,6 @@ config("chromium_code") {
+     cflags =3D [ "/W4" ]  # Warning level 4.
+   } else {
+     cflags =3D [ "-Wall" ]
+-    if (treat_warnings_as_errors) {
+-      cflags +=3D [ "-Werror" ]
+-    }
+     if (is_clang) {
+       # Enable -Wextra for chromium_code when we control the compiler.
+       cflags +=3D [ "-Wextra" ]
+Index: chromium-53.0.2785.143/build/nocompile.gypi
 =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- chromium-48.0.2548.0.orig/build/nocompile.gypi
-+++ chromium-48.0.2548.0/build/nocompile.gypi
-@@ -81,7 +81,7 @@
+--- chromium-53.0.2785.143.orig/build/nocompile.gypi
++++ chromium-53.0.2785.143/build/nocompile.gypi
+@@ -82,7 +82,7 @@
              '<(nocompile_driver)',
              '4', # number of compilers to invoke in parallel.
              '<(RULE_INPUT_PATH)',
diff --git =
a/recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-CC-and=
-CXX.patch =
b/recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-CC-and=
-CXX.patch
index 7bc8d14..63de68a 100644
--- =
a/recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-CC-and=
-CXX.patch
+++ b/recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-C
+++ C-and-CXX.patch
@@ -21,7 +21,7 @@ diff --git a/build/common.gypi b/build/common.gypi  =
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
-     # TODO(yyanagisawa): supports GENERATOR=3D=3Dmake
-     #  make generator doesn't support CC_wrapper without CC
-     #  in make_global_settings yet.
+     ['use_goma=3D=3D1', {
+       'make_global_settings': [
+        ['CC_wrapper', '<(gomadir)/gomacc'],
 --
-1.9.1
-
+2.1.4
--
2.7.4

--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel


