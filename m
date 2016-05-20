Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id B926C601A5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2016 14:40:37 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id 90so9691642qgz.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2016 07:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=NHW3Q6yNw34wTC1YJ7VzWUZC0ajucTT8/ybB7alsNas=;
	b=w3vnujWQLN39xsCVACMHcZvUu5MJe2zJGsweCV6EehWzS2W/7ZjFOJTkpHRP+kQsb0
	FFXt0FmrzAny783jbUc3LJKtnBgycUHDms1QBCfVi9i3Qojm3Ar8K77McrB9+4km/jK3
	G7LOZwH4MUAmyJeIAXRYxcYLYL6Bz4UUJozIO1XZEa686YEovgKbwN2zMsKSP1dlByzM
	tatVwyQ/lt+nB/et6fal6JeFDZrQDdlmuwroy6m/TjR2e3qqzfmfkIXo+/40+GE6sJUF
	aANUQsainfi27T8Sen40YDq5xHMnBT27GWK2O9y0fcXk7MzUOHsNVpA6B2nsxyXDjj24
	tCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=NHW3Q6yNw34wTC1YJ7VzWUZC0ajucTT8/ybB7alsNas=;
	b=BZW8t8pPjQbTuZ7FmQQnqG05rtWWAcBhLsU3qUexTt5TQxMP3FM8gVgGpn/YH6bjVv
	s1z9/7BOGFfmJrql1YHAi2AATb8gMpWTVLR3gnBCJKWiBXzRAi2z8J/Nm7TqhkYbfdf1
	edj/Yz+ZkJkblblj+pdwaAiHXQ8ztuJrcUtAaqp69hyv9sjh07WW4MQIJbjjvY33mSpj
	Is0y1tu333OUX5+ctAyr2PMAshuQApmQTRzbhgVYdGlwMzD5vkiR7t1FY4e4NP5OW589
	gNsJZzryaIm4GLYBvdmC3nDiVcrL5zfNVLW6QxKZFqbNVJWhjySaiTb0EBDmPL28V4Pq
	o5qg==
X-Gm-Message-State: AOPr4FXFpz/XbUJEl/qgwg2OmbGkI7CZZfbN6Lr7dsxYn4KNbMRr+xSfY0mh6I0qUrIotWpJGw5oEqof7B8EdQ==
X-Received: by 10.140.176.205 with SMTP id w196mr3781495qhw.76.1463755237337; 
	Fri, 20 May 2016 07:40:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Fri, 20 May 2016 07:40:07 -0700 (PDT)
In-Reply-To: <1463744507-14745-1-git-send-email-dv@pseudoterminal.org>
References: <20160518150415.GD2579@jama>
	<1463744507-14745-1-git-send-email-dv@pseudoterminal.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 May 2016 07:40:07 -0700
Message-ID: <CAMKF1srNhz-wzjtTa+TuCgmStwU5yLbyhJDkab2bBzLc-7Wb0w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] chromium: Add workarounds for compiler errors
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
X-List-Received-Date: Fri, 20 May 2016 14:40:38 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 20, 2016 at 4:41 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  .../0011-Replace-readdir_r-with-readdir.patch      | 237 +++++++++++++++++++++
>  ...for-unused-variable-error-in-ui-gfx-color.patch |  86 ++++++++
>  recipes-browser/chromium/chromium_48.0.2548.0.bb   |   2 +
>  3 files changed, 325 insertions(+)
>  create mode 100644 recipes-browser/chromium/chromium/chromium-48/0011-Replace-readdir_r-with-readdir.patch
>  create mode 100644 recipes-browser/chromium/chromium/chromium-48/0012-Workaround-for-unused-variable-error-in-ui-gfx-color.patch
>
> diff --git a/recipes-browser/chromium/chromium/chromium-48/0011-Replace-readdir_r-with-readdir.patch b/recipes-browser/chromium/chromium/chromium-48/0011-Replace-readdir_r-with-readdir.patch
> new file mode 100644
> index 0000000..36c7ec2
> --- /dev/null
> +++ b/recipes-browser/chromium/chromium/chromium-48/0011-Replace-readdir_r-with-readdir.patch
> @@ -0,0 +1,237 @@
> +From feb645ae0259582e2075691047e27b5e064ec160 Mon Sep 17 00:00:00 2001
> +From: Carlos Rafael Giani <dv@pseudoterminal.org>
> +Date: Thu, 19 May 2016 21:12:05 +0200
> +Subject: [PATCH] Replace readdir_r with readdir
> +
> +readdir_r is deprecated in newer glibc version. Documented at:
> +https://sourceware.org/bugzilla/show_bug.cgi?id=19056
> +
> +Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> +---
> + base/files/file_enumerator_posix.cc                | 15 ++++++++++---
> + net/disk_cache/simple/simple_index_file_posix.cc   | 10 ++++++---
> + sandbox/linux/services/proc_util.cc                | 24 +++++++++++++--------
> + third_party/boringssl/src/crypto/directory_posix.c | 25 +++-------------------
> + .../crashpad/crashpad/util/posix/close_multiple.cc |  8 +++++--
> + third_party/leveldatabase/env_chromium.cc          | 13 ++++++++---
> + 6 files changed, 53 insertions(+), 42 deletions(-)
> +
> +diff --git a/base/files/file_enumerator_posix.cc b/base/files/file_enumerator_posix.cc
> +index 7533a24..637b8cd 100644
> +--- a/base/files/file_enumerator_posix.cc
> ++++ b/base/files/file_enumerator_posix.cc
> +@@ -7,6 +7,7 @@
> + #include <dirent.h>
> + #include <errno.h>
> + #include <fnmatch.h>
> ++#include <string.h>
> +
> + #include "base/logging.h"
> + #include "base/threading/thread_restrictions.h"
> +@@ -129,9 +130,17 @@ bool FileEnumerator::ReadDirectory(std::vector<FileInfo>* entries,
> +          additional space for pathname may be needed
> + #endif
> +
> +-  struct dirent dent_buf;
> +-  struct dirent* dent;
> +-  while (readdir_r(dir, &dent_buf, &dent) == 0 && dent) {
> ++  while (true) {
> ++    struct dirent* dent;
> ++    errno = 0;
> ++    dent = readdir(dir);
> ++    if (errno != 0) {
> ++      DPLOG(ERROR) << "Couldn't read directory entry: " << strerror(errno);
> ++      break;
> ++    }
> ++    if (dent == NULL)
> ++      break;
> ++


Please send these patches to chromium as well. They look fine otherwise.

> +     FileInfo info;
> +     info.filename_ = FilePath(dent->d_name);
> +
> +diff --git a/net/disk_cache/simple/simple_index_file_posix.cc b/net/disk_cache/simple/simple_index_file_posix.cc
> +index 586699d..bbe81fc 100644
> +--- a/net/disk_cache/simple/simple_index_file_posix.cc
> ++++ b/net/disk_cache/simple/simple_index_file_posix.cc
> +@@ -34,8 +34,12 @@ bool SimpleIndexFile::TraverseCacheDirectory(
> +     PLOG(ERROR) << "opendir " << cache_path.value();
> +     return false;
> +   }
> +-  dirent entry, *result;
> +-  while (readdir_r(dir.get(), &entry, &result) == 0) {
> ++  dirent *result;
> ++  while (true) {
> ++    errno = 0;
> ++    result = readdir(dir.get());
> ++    if (errno != 0)
> ++      break;
> +     if (!result)
> +       return true;  // The traversal completed successfully.
> +     const std::string file_name(result->d_name);
> +@@ -45,7 +49,7 @@ bool SimpleIndexFile::TraverseCacheDirectory(
> +         base::FilePath(file_name));
> +     entry_file_callback.Run(file_path);
> +   }
> +-  PLOG(ERROR) << "readdir_r " << cache_path.value();
> ++  PLOG(ERROR) << "readdir " << cache_path.value();
> +   return false;
> + }
> +
> +diff --git a/sandbox/linux/services/proc_util.cc b/sandbox/linux/services/proc_util.cc
> +index 8341b4a..1603415 100644
> +--- a/sandbox/linux/services/proc_util.cc
> ++++ b/sandbox/linux/services/proc_util.cc
> +@@ -50,15 +50,18 @@ int ProcUtil::CountOpenFds(int proc_fd) {
> +   CHECK(dir);
> +
> +   int count = 0;
> +-  struct dirent e;
> +   struct dirent* de;
> +-  while (!readdir_r(dir.get(), &e, &de) && de) {
> +-    if (strcmp(e.d_name, ".") == 0 || strcmp(e.d_name, "..") == 0) {
> ++  while (true) {
> ++    errno = 0;
> ++    de = readdir(dir.get());
> ++    if (de == NULL || errno != 0)
> ++      break;
> ++    if (strcmp(de->d_name, ".") == 0 || strcmp(de->d_name, "..") == 0) {
> +       continue;
> +     }
> +
> +     int fd_num;
> +-    CHECK(base::StringToInt(e.d_name, &fd_num));
> ++    CHECK(base::StringToInt(de->d_name, &fd_num));
> +     if (fd_num == proc_fd || fd_num == proc_self_fd) {
> +       continue;
> +     }
> +@@ -80,22 +83,25 @@ bool ProcUtil::HasOpenDirectory(int proc_fd) {
> +   ScopedDIR dir(fdopendir(proc_self_fd));
> +   CHECK(dir);
> +
> +-  struct dirent e;
> +   struct dirent* de;
> +-  while (!readdir_r(dir.get(), &e, &de) && de) {
> +-    if (strcmp(e.d_name, ".") == 0 || strcmp(e.d_name, "..") == 0) {
> ++  while (true) {
> ++    errno = 0;
> ++    de = readdir(dir.get());
> ++    if (de == NULL || errno != 0)
> ++      break;
> ++    if (strcmp(de->d_name, ".") == 0 || strcmp(de->d_name, "..") == 0) {
> +       continue;
> +     }
> +
> +     int fd_num;
> +-    CHECK(base::StringToInt(e.d_name, &fd_num));
> ++    CHECK(base::StringToInt(de->d_name, &fd_num));
> +     if (fd_num == proc_fd || fd_num == proc_self_fd) {
> +       continue;
> +     }
> +
> +     struct stat s;
> +     // It's OK to use proc_self_fd here, fstatat won't modify it.
> +-    CHECK(fstatat(proc_self_fd, e.d_name, &s, 0) == 0);
> ++    CHECK(fstatat(proc_self_fd, de->d_name, &s, 0) == 0);
> +     if (S_ISDIR(s.st_mode)) {
> +       return true;
> +     }
> +diff --git a/third_party/boringssl/src/crypto/directory_posix.c b/third_party/boringssl/src/crypto/directory_posix.c
> +index b944b69..17143a7 100644
> +--- a/third_party/boringssl/src/crypto/directory_posix.c
> ++++ b/third_party/boringssl/src/crypto/directory_posix.c
> +@@ -24,10 +24,6 @@
> +  * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
> +  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. */
> +
> +-#if !defined(_POSIX_C_SOURCE)
> +-#define _POSIX_C_SOURCE 201409  /* for readdir_r */
> +-#endif
> +-
> + #include "directory.h"
> +
> +
> +@@ -38,21 +34,6 @@
> + #include <stdlib.h>
> + #include <string.h>
> +
> +-#if defined(OPENSSL_PNACL)
> +-/* pnacl doesn't include readdir_r! So we do the best we can. */
> +-int readdir_r(DIR *dirp, struct dirent *entry, struct dirent **result) {
> +-  errno = 0;
> +-  *result = readdir(dirp);
> +-  if (*result != NULL) {
> +-    return 0;
> +-  }
> +-  if (errno) {
> +-    return 1;
> +-  }
> +-  return 0;
> +-}
> +-#endif
> +-
> + struct OPENSSL_dir_context_st {
> +   DIR *dir;
> +   struct dirent dirent;
> +@@ -85,10 +66,10 @@ const char *OPENSSL_DIR_read(OPENSSL_DIR_CTX **ctx, const char *directory) {
> +     }
> +   }
> +
> +-  if (readdir_r((*ctx)->dir, &(*ctx)->dirent, &dirent) != 0 ||
> +-      dirent == NULL) {
> ++  errno = 0;
> ++  dirent = readdir((*ctx)->dir);
> ++  if (dirent == NULL || errno != 0)
> +     return 0;
> +-  }
> +
> +   return (*ctx)->dirent.d_name;
> + }
> +diff --git a/third_party/crashpad/crashpad/util/posix/close_multiple.cc b/third_party/crashpad/crashpad/util/posix/close_multiple.cc
> +index d94d575..4c1287a 100644
> +--- a/third_party/crashpad/crashpad/util/posix/close_multiple.cc
> ++++ b/third_party/crashpad/crashpad/util/posix/close_multiple.cc
> +@@ -100,10 +100,14 @@ bool CloseMultipleNowOrOnExecUsingFDDir(int fd, int preserve_fd) {
> +     return false;
> +   }
> +
> +-  dirent entry;
> +   dirent* result;
> +   int rv;
> +-  while ((rv = readdir_r(dir, &entry, &result)) == 0 && result != nullptr) {
> ++  while (true) {
> ++    errno = 0;
> ++    result = readdir(dir);
> ++    if (errno != 0 || result == nullptr)
> ++      break;
> ++
> +     const char* entry_name = &(*result->d_name);
> +     if (strcmp(entry_name, ".") == 0 || strcmp(entry_name, "..") == 0) {
> +       continue;
> +diff --git a/third_party/leveldatabase/env_chromium.cc b/third_party/leveldatabase/env_chromium.cc
> +index 939534c..f23142e 100644
> +--- a/third_party/leveldatabase/env_chromium.cc
> ++++ b/third_party/leveldatabase/env_chromium.cc
> +@@ -79,10 +79,17 @@ static base::File::Error GetDirectoryEntries(const FilePath& dir_param,
> +   DIR* dir = opendir(dir_string.c_str());
> +   if (!dir)
> +     return base::File::OSErrorToFileError(errno);
> +-  struct dirent dent_buf;
> +   struct dirent* dent;
> +-  int readdir_result;
> +-  while ((readdir_result = readdir_r(dir, &dent_buf, &dent)) == 0 && dent) {
> ++  int readdir_result = 0;
> ++  while (true) {
> ++    errno = 0;
> ++    dent = readdir(dir);
> ++    if (errno != 0) {
> ++      readdir_result = 1;
> ++      break;
> ++    }
> ++    if (dent == NULL)
> ++      break;
> +     if (strcmp(dent->d_name, ".") == 0 || strcmp(dent->d_name, "..") == 0)
> +       continue;
> +     result->push_back(FilePath::FromUTF8Unsafe(dent->d_name));
> +--
> +2.7.4
> +
> diff --git a/recipes-browser/chromium/chromium/chromium-48/0012-Workaround-for-unused-variable-error-in-ui-gfx-color.patch b/recipes-browser/chromium/chromium/chromium-48/0012-Workaround-for-unused-variable-error-in-ui-gfx-color.patch
> new file mode 100644
> index 0000000..e3f20ef
> --- /dev/null
> +++ b/recipes-browser/chromium/chromium/chromium-48/0012-Workaround-for-unused-variable-error-in-ui-gfx-color.patch
> @@ -0,0 +1,86 @@
> +From 41cb20a99eb12443f649051a608c7dfe28661d85 Mon Sep 17 00:00:00 2001
> +From: Carlos Rafael Giani <dv@pseudoterminal.org>
> +Date: Thu, 19 May 2016 22:38:32 +0200
> +Subject: [PATCH] Workaround for unused-variable error in
> + ui/gfx/color_palette.h
> +
> +Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> +---
> + ui/gfx/BUILD.gn         |  1 +
> + ui/gfx/color_palette.cc | 12 ++++++++++++
> + ui/gfx/color_palette.h  | 12 ++++++------
> + ui/gfx/gfx.gyp          |  1 +
> + 4 files changed, 20 insertions(+), 6 deletions(-)
> + create mode 100644 ui/gfx/color_palette.cc
> +
> +diff --git a/ui/gfx/BUILD.gn b/ui/gfx/BUILD.gn
> +index dcd15b0..bf1455c 100644
> +--- a/ui/gfx/BUILD.gn
> ++++ b/ui/gfx/BUILD.gn
> +@@ -61,6 +61,7 @@ component("gfx") {
> +     "codec/png_codec.h",
> +     "color_analysis.cc",
> +     "color_analysis.h",
> ++    "color_palette.cc",
> +     "color_palette.h",
> +     "color_profile.cc",
> +     "color_profile.h",
> +diff --git a/ui/gfx/color_palette.cc b/ui/gfx/color_palette.cc
> +new file mode 100644
> +index 0000000..a8e6280
> +--- /dev/null
> ++++ b/ui/gfx/color_palette.cc
> +@@ -0,0 +1,12 @@
> ++#include "color_palette.h"
> ++
> ++namespace gfx {
> ++
> ++const SkColor kChromeIconGrey = SkColorSetRGB(0x5A, 0x5A, 0x5A);
> ++const SkColor kGoogleBlue300 = SkColorSetRGB(0x7B, 0xAA, 0xF7);
> ++const SkColor kGoogleBlue500 = SkColorSetRGB(0x42, 0x85, 0xF4);
> ++const SkColor kGoogleRed700 = SkColorSetRGB(0xC5, 0x39, 0x29);
> ++const SkColor kGoogleGreen700 = SkColorSetRGB(0x0B, 0x80, 0x43);
> ++const SkColor kGoogleYellow700 = SkColorSetRGB(0xF0, 0x93, 0x00);
> ++
> ++}  // namespace gfx
> +diff --git a/ui/gfx/color_palette.h b/ui/gfx/color_palette.h
> +index 372f52c..63fa8af 100644
> +--- a/ui/gfx/color_palette.h
> ++++ b/ui/gfx/color_palette.h
> +@@ -9,15 +9,15 @@
> +
> + namespace gfx {
> +
> +-const SkColor kChromeIconGrey = SkColorSetRGB(0x5A, 0x5A, 0x5A);
> ++extern const SkColor kChromeIconGrey;
> +
> + // The number refers to the shade of darkness. Each color in the MD
> + // palette ranges from 100-900.
> +-const SkColor kGoogleBlue300 = SkColorSetRGB(0x7B, 0xAA, 0xF7);
> +-const SkColor kGoogleBlue500 = SkColorSetRGB(0x42, 0x85, 0xF4);
> +-const SkColor kGoogleRed700 = SkColorSetRGB(0xC5, 0x39, 0x29);
> +-const SkColor kGoogleGreen700 = SkColorSetRGB(0x0B, 0x80, 0x43);
> +-const SkColor kGoogleYellow700 = SkColorSetRGB(0xF0, 0x93, 0x00);
> ++extern const SkColor kGoogleBlue300;
> ++extern const SkColor kGoogleBlue500;
> ++extern const SkColor kGoogleRed700;
> ++extern const SkColor kGoogleGreen700;
> ++extern const SkColor kGoogleYellow700;
> +
> + }  // namespace gfx
> +
> +diff --git a/ui/gfx/gfx.gyp b/ui/gfx/gfx.gyp
> +index 8067bee..98b6312 100644
> +--- a/ui/gfx/gfx.gyp
> ++++ b/ui/gfx/gfx.gyp
> +@@ -142,6 +142,7 @@
> +         'codec/png_codec.h',
> +         'color_analysis.cc',
> +         'color_analysis.h',
> ++        'color_palette.cc',
> +         'color_palette.h',
> +         'color_profile.cc',
> +         'color_profile.h',
> +--
> +2.7.4
> +
> diff --git a/recipes-browser/chromium/chromium_48.0.2548.0.bb b/recipes-browser/chromium/chromium_48.0.2548.0.bb
> index 369d6fa..976ec51 100644
> --- a/recipes-browser/chromium/chromium_48.0.2548.0.bb
> +++ b/recipes-browser/chromium/chromium_48.0.2548.0.bb
> @@ -10,6 +10,8 @@ SRC_URI += "\
>          file://chromium-48/0008-Fix-GCC-uninitialized-warning.patch \
>          file://chromium-48/0009-Fix-build-errors-with-GCC-in-Debug-mode.patch \
>          file://chromium-48/0010-Fix-rv-may-be-used-uninitialized-in-this-function-wa.patch \
> +        file://chromium-48/0011-Replace-readdir_r-with-readdir.patch \
> +        file://chromium-48/0012-Workaround-for-unused-variable-error-in-ui-gfx-color.patch \
>          ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://chromium-48/0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
>          ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar', 'file://chromium-48/0002-Disable-API-keys-info-bar.patch', '', d)} \
>  "
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

