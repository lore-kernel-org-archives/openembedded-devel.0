Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 653167199B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 13:09:52 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3AMI4J/Bfwni8qxf267bhKEagrlGMj4u6mDksu8pMi?=
	=?us-ascii?q?zoh2WeGdxcW5Zx7h7PlgxGXEQZ/co6odzbGH7+a8Aidcut6oizMrSNR0TRgLiM?=
	=?us-ascii?q?EbzUQLIfWuLgnFFsPsdDEwB89YVVVorDmROElRH9viNRWJ+iXhpTEdFQ/iOgVr?=
	=?us-ascii?q?O+/7BpDdj9it1+C15pbffxhEiCCzbL52Ixi6twrcu8cZjYZtJKs61wfErGZPd+?=
	=?us-ascii?q?lK321jOEidnwz75se+/Z5j9zpftvc8/MNeUqv0Yro1Q6VAADspL2466svrtQLe?=
	=?us-ascii?q?TQSU/XsTTn8WkhtTDAfb6hzxQ4r8vTH7tup53ymaINH2QLUpUjms86tnVBnlgz?=
	=?us-ascii?q?oBOjUk8m/Yl9ZwgbpGrhy/qRxxw43abo+bO/VxfKzSYdwUSHFdXstSTSFNHp+w?=
	=?us-ascii?q?YoUNAucHIO1Wr5P9p1wLrRamAQejHv/gyjhTiX/xxaI3z/4hHhvJ3Aw9GdIBrW?=
	=?us-ascii?q?rbo83vOqAIS+C60qjJxijEYvNUwzj98pLHch88ofGKQL1/b9HcyUggFwzfilWQ?=
	=?us-ascii?q?qJbqMymJ2eQKtmiW9uxtXv+hhW4grgF+uDmvxsE0h4nHnIIa1E3L+jtjwIY0Od?=
	=?us-ascii?q?K0UUB6bsSiEJtfrS2aOZF2TtsjQ2Fnoik6zrwGtoShcCcWz5QnwgbTa+eAc4iV?=
	=?us-ascii?q?+BLsSPieIDlii3J/Zr2znRGy8VKvyuHkWcm00UpKripYktbXrHwCyxvT6s2BR/?=
	=?us-ascii?q?Bg/UmhwS6C2gTO5u1ePEw4iKjWJ4Qlz7M0jJYfrETOEy/wlU7rlqGZbF8k9fKt?=
	=?us-ascii?q?6+n/Z7XmoYKTOJFshwHlN6QuhtS/AeMlMggSR2Sb+fqz1Lnk/UDhTrVFlPs2k6?=
	=?us-ascii?q?jYsJDcO8sXvK+5AwBP3YYn6hawFS2q38gfnXkCNF5FeRSHgJb1O1zWJP30EO2z?=
	=?us-ascii?q?j0mxnDpp3fzLOrnsDo/QInXDkLrtZbN95FRdyAo3w9Bf/ZVUCrQZLfLxQEDxrs?=
	=?us-ascii?q?bXDhAkMwyy3unoFs5w1oIRWW2VBq+ZMbndvUWU6eIoJumAfJUVtyrlK/g5+/7u?=
	=?us-ascii?q?imc0mVgFfaa325sYdnW4Ee94LEqEfHXjnMoOHX4XsQUgUuzlllmCXCVXZ3azRK?=
	=?us-ascii?q?I8+io7BJihDYfbWI+thqKO3CKgEZJIe29JF06DHmrye4WDQfcMZ3HaHsg0lSQJ?=
	=?us-ascii?q?U7WkQYIt2Ryi8QP31bdjBu7V4TED85X72d544ufemR0/+XpzFcvO/XuKSjRWl2?=
	=?us-ascii?q?gPTTgB9bp2rlF7xlq06Sliju4QQd5a/fpGTwE2OLbdwOV+Ctm0UQXEKITaAG26?=
	=?us-ascii?q?S8mrVGliBuk6xMUDNh5w?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CDZABTC4JY/5tjdVteGwEXAQYBCwEXA?=
	=?us-ascii?q?QYBgwcBAQEBAR9gKl+DU4p6kD5TiimCUIYmgjcZgUssgkCDNgKCDkIRAQEBAQE?=
	=?us-ascii?q?BAQEBAQFiKEISAYFeGYIdAQEBAQIBGgkECwFLCwsRAQIBAgECAiYCAkkGCBMGA?=
	=?us-ascii?q?gEBFgSIXgwBCa8UgWs6ikUBCgEBAQEjgQuFQIIFgmuCWjKBPYJMOoJeBYkAkki?=
	=?us-ascii?q?GYosFgXdSiAqGG4gehkGEFTUigUVPhDkBG4FhPTUBAYENiAUBAQE?=
X-IPAS-Result: =?us-ascii?q?A2CDZABTC4JY/5tjdVteGwEXAQYBCwEXAQYBgwcBAQEBAR9?=
	=?us-ascii?q?gKl+DU4p6kD5TiimCUIYmgjcZgUssgkCDNgKCDkIRAQEBAQEBAQEBAQFiKEISA?=
	=?us-ascii?q?YFeGYIdAQEBAQIBGgkECwFLCwsRAQIBAgECAiYCAkkGCBMGAgEBFgSIXgwBCa8?=
	=?us-ascii?q?UgWs6ikUBCgEBAQEjgQuFQIIFgmuCWjKBPYJMOoJeBYkAkkiGYosFgXdSiAqGG?=
	=?us-ascii?q?4gehkGEFTUigUVPhDkBG4FhPTUBAYENiAUBAQE?=
X-IronPort-AV: E=Sophos;i="5.33,258,1477954800"; d="scan'208";a="100913579"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 20 Jan 2017 14:09:51 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cUYwx-0007o9-Cy for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 14:09:51 +0100
Received: from ip162.dynamic.igalia.com ([192.168.10.162])
	by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cUYwu-0004oc-72; Fri, 20 Jan 2017 14:09:48 +0100
To: openembedded-devel@lists.openembedded.org
References: <1484311074-14030-1-git-send-email-jaragunde@igalia.com>
	<3c7713c0-10cd-fe2b-3a99-c93841471753@pseudoterminal.org>
From: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Message-ID: <8235429f-650e-0fcc-37a3-de221451184b@igalia.com>
Date: Fri, 20 Jan 2017 14:09:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <3c7713c0-10cd-fe2b-3a99-c93841471753@pseudoterminal.org>
Subject: Re: [meta-browser][PATCH] chromium-wayland: update to 53.0.2785.14
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
X-List-Received-Date: Fri, 20 Jan 2017 13:09:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 20/01/17 12:37, Carlos Rafael Giani wrote:
> Looks okay overall. A few details need to be addressed:
> ...

Thanks for your feedback, Carlos. I will submit a modified patch soon.

> Besides that, how is the performance of Chromium 53 with Ozone-Wayland? 
> Any improvements over 48? What platforms did you test this with?
> 

Between 48 and 53, memory efficiency has been improved in Chromium.
There is also a 5-release amount of security fixes, which is always a
very good reason to upgrade :)

Memory efficiency has improved further in newer releases, but 53 is the
latest version Ozone-Wayland developers have worked on; it's unlikely
they rebase to newer ones, the change of build system from GYP to GN
implies an extra burden to move to newer versions of Chromium.  Besides,
the upstream work on a Wayland backend is progressing in parallel (read
below).

> And, any news on the ongoing Ozone-Wayland upstreaming into core Chrome? 
> A finished integration would make these receipes *much* easier.
> 

Indeed, that's very interesting. My colleagues Antonio and Fred have
been working on that [1][2]; to sum up, there are architecture
differences that prevent Ozone-Wayland from being upstreamed directly
[3]. Hopefully, a basic upstream implementation for a Wayland backend
will be achieved soon and code from Ozone-Wayland would be included
piece by piece whenever possible.

[1]
https://blogs.igalia.com/tonikitoo/2016/11/14/chromium-ozone-wayland-and-beyond/
[2] http://frederic-wang.fr/chromium-on-r-car-m3.html
[3] http://frederic-wang.fr/analysis-of-ozone-wayland.html

Best,
-- 
Jacobo Aragunde
Software Engineer at Igalia

> On 2017-01-13 13:37, Jacobo Aragunde Pérez wrote:
>> That is the latest version of Chromium that has been made work with
>> the Ozone-Wayland project.
>>
>> Patches have been rebased and configure flags were changed because
>> existing ones were causing conflicts in the new version. An extra
>> patch was added to prevent the build from failing when building
>> without X11 libs present due to an unnecessary inclusion.
>>
>> Signed-off-by: Jacobo Aragunde Pérez <jaragunde@igalia.com>
>> ---
>>   .../chromium/chromium-wayland_48.0.2548.0.bb       | 36 ---------
>>   .../chromium/chromium-wayland_53.0.2785.143.bb     | 37 +++++++++
>>   .../0011-Replace-readdir_r-with-readdir.patch      | 88 +++++-----------------
>>   .../add_missing_stat_h_include.patch               |  2 +-
>>   .../guard-x11_desktop_handler-inclusion.patch      | 13 ++++
>>   .../chromium/chromium-wayland/remove-Werror.patch  | 86 ++++++++++++---------
>>   ...3-Remove-hard-coded-values-for-CC-and-CXX.patch | 11 ++-
>>   7 files changed, 125 insertions(+), 148 deletions(-)
>>   delete mode 100644 recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
>>   create mode 100644 recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
>>   create mode 100644 recipes-browser/chromium/chromium/chromium-wayland/guard-x11_desktop_handler-inclusion.patch
>>
>> diff --git a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
>> deleted file mode 100644
>> index 0db8f7d..0000000
>> --- a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
>> +++ /dev/null
>> @@ -1,36 +0,0 @@
>> -CHROMIUM_ENABLE_WAYLAND = "1"
>> -
>> -include chromium-browser.inc
>> -
>> -DEPENDS += "wayland libxkbcommon"
>> -
>> -SRC_URI += "\
>> -        file://chromium-wayland/add_missing_stat_h_include.patch \
>> -        file://0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
>> -        file://0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch \
>> -        file://0005-Override-root-filesystem-access-restriction.patch \
>> -	file://chromium-wayland/0007-Workaround-for-glib-related-build-error-with-ozone-w.patch \
>> -        file://chromium-wayland/0011-Replace-readdir_r-with-readdir.patch \
>> -        file://chromium-wayland/remove-Werror.patch \
>> -        ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
>> -        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
>> -"
>> -
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
>> -SRC_URI[md5sum] = "0534981cc21efcd11e64b67b85854420"
>> -SRC_URI[sha256sum] = "4ca4e2adb340b3fb4d502266ad7d6bda45fa3519906dbf63cce11a63f680dbc8"
>> -
>> -OZONE_WAYLAND_GIT_BRANCH = "Milestone-SouthSister"
>> -OZONE_WAYLAND_GIT_SRCREV = "c605505044af3345a276abbd7c29fd53db1dea40"
>> -
>> -SRC_URI += "git://github.com/01org/ozone-wayland.git;destsuffix=${OZONE_WAYLAND_GIT_DESTSUFFIX};branch=${OZONE_WAYLAND_GIT_BRANCH};rev=${OZONE_WAYLAND_GIT_SRCREV} file://chromium-wayland/0006-Remove-GBM-support-from-wayland.gyp.patch"
>> -
>> -# Component build is unsupported in ozone-wayland for Chromium 48
>> -python() {
>> -    if not bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d):
>> -        raise bb.parse.SkipPackage("Wayland is not available")
>> -    if bb.utils.contains('PACKAGECONFIG', 'component-build', True, False, d):
>> -        bb.fatal("Chromium 48 Wayland version cannot be built in component-mode")
>> -}
>> -
>> -CHROMIUM_WAYLAND_GYP_DEFINES = "use_ash=1 use_aura=1 chromeos=0 use_ozone=1 use_xkbcommon=1"
>> diff --git a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
>> new file mode 100644
>> index 0000000..c927e67
>> --- /dev/null
>> +++ b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
>> @@ -0,0 +1,37 @@
>> +CHROMIUM_ENABLE_WAYLAND = "1"
>> +
>> +include chromium-browser.inc
>> +
>> +DEPENDS += "wayland libxkbcommon"
>> +
>> +SRC_URI += "\
>> +        file://chromium-wayland/add_missing_stat_h_include.patch \
>> +        file://0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
>> +        file://0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch \
>> +        file://0005-Override-root-filesystem-access-restriction.patch \
>> +	file://chromium-wayland/0007-Workaround-for-glib-related-build-error-with-ozone-w.patch \
>> +        file://chromium-wayland/0011-Replace-readdir_r-with-readdir.patch \
>> +        file://chromium-wayland/remove-Werror.patch \
>> +        file://chromium-wayland/guard-x11_desktop_handler-inclusion.patch \
>> +        ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
>> +        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
>> +"
>> +
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
>> +SRC_URI[md5sum] = "fdc737af242421b2a9a0bb84f6b17040"
>> +SRC_URI[sha256sum] = "c52a58b79bfb27bb87e4a0a6ff213001485fbc747657b290f75d39ddce07dcc3"
>> +
>> +OZONE_WAYLAND_GIT_BRANCH = "rebase_m53"
>> +OZONE_WAYLAND_GIT_SRCREV = "1a5e7982bf7b8743c20a20e5aa33d9d6a42d48d6"
>> +
>> +SRC_URI += "git://github.com/01org/ozone-wayland.git;destsuffix=${OZONE_WAYLAND_GIT_DESTSUFFIX};branch=${OZONE_WAYLAND_GIT_BRANCH};rev=${OZONE_WAYLAND_GIT_SRCREV} file://chromium-wayland/0006-Remove-GBM-support-from-wayland.gyp.patch"
>> +
>> +# Component build is unsupported in ozone-wayland for Chromium 48
>> +python() {
>> +    if not bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d):
>> +        raise bb.parse.SkipPackage("Wayland is not available")
>> +    if bb.utils.contains('PACKAGECONFIG', 'component-build', True, False, d):
>> +        bb.fatal("Chromium 48 Wayland version cannot be built in component-mode")
>> +}
>> +
>> +CHROMIUM_WAYLAND_GYP_DEFINES = "use_ash=0 use_aura=1 chromeos=0 use_ozone=1 use_xkbcommon=1 ozone_auto_platforms=0 ozone_platform_wayland=1"
>> diff --git a/recipes-browser/chromium/chromium/chromium-wayland/0011-Replace-readdir_r-with-readdir.patch b/recipes-browser/chromium/chromium/chromium-wayland/0011-Replace-readdir_r-with-readdir.patch
>> index 36c7ec2..52dae8c 100644
>> --- a/recipes-browser/chromium/chromium/chromium-wayland/0011-Replace-readdir_r-with-readdir.patch
>> +++ b/recipes-browser/chromium/chromium/chromium-wayland/0011-Replace-readdir_r-with-readdir.patch
>> @@ -1,4 +1,4 @@
>> -From feb645ae0259582e2075691047e27b5e064ec160 Mon Sep 17 00:00:00 2001
>> +From 3781812308b7aea64b3be037202c940e1a7ebf03 Mon Sep 17 00:00:00 2001
>>   From: Carlos Rafael Giani <dv@pseudoterminal.org>
>>   Date: Thu, 19 May 2016 21:12:05 +0200
>>   Subject: [PATCH] Replace readdir_r with readdir
>> @@ -8,27 +8,26 @@ https://sourceware.org/bugzilla/show_bug.cgi?id=19056
>>   
>>   Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
>>   ---
>> - base/files/file_enumerator_posix.cc                | 15 ++++++++++---
>> + base/files/file_enumerator_posix.cc                | 15 +++++++++++---
>>    net/disk_cache/simple/simple_index_file_posix.cc   | 10 ++++++---
>> - sandbox/linux/services/proc_util.cc                | 24 +++++++++++++--------
>> - third_party/boringssl/src/crypto/directory_posix.c | 25 +++-------------------
>> - .../crashpad/crashpad/util/posix/close_multiple.cc |  8 +++++--
>> - third_party/leveldatabase/env_chromium.cc          | 13 ++++++++---
>> - 6 files changed, 53 insertions(+), 42 deletions(-)
>> + sandbox/linux/services/proc_util.cc                | 24 ++++++++++++++--------
>> + .../crashpad/crashpad/util/posix/close_multiple.cc |  8 ++++++--
>> + third_party/leveldatabase/env_chromium.cc          | 13 +++++++++---
>> + 5 files changed, 50 insertions(+), 20 deletions(-)
>>   
>>   diff --git a/base/files/file_enumerator_posix.cc b/base/files/file_enumerator_posix.cc
>> -index 7533a24..637b8cd 100644
>> +index fb4010a..cf2fd40 100644
>>   --- a/base/files/file_enumerator_posix.cc
>>   +++ b/base/files/file_enumerator_posix.cc
>> -@@ -7,6 +7,7 @@
>> - #include <dirent.h>
>> +@@ -8,6 +8,7 @@
>>    #include <errno.h>
>>    #include <fnmatch.h>
>> + #include <stdint.h>
>>   +#include <string.h>
>>    
>>    #include "base/logging.h"
>>    #include "base/threading/thread_restrictions.h"
>> -@@ -129,9 +130,17 @@ bool FileEnumerator::ReadDirectory(std::vector<FileInfo>* entries,
>> +@@ -131,9 +132,17 @@ bool FileEnumerator::ReadDirectory(std::vector<FileInfo>* entries,
>>             additional space for pathname may be needed
>>    #endif
>>    
>> @@ -50,7 +49,7 @@ index 7533a24..637b8cd 100644
>>        info.filename_ = FilePath(dent->d_name);
>>    
>>   diff --git a/net/disk_cache/simple/simple_index_file_posix.cc b/net/disk_cache/simple/simple_index_file_posix.cc
>> -index 586699d..bbe81fc 100644
>> +index e0dd3dd..b155d92 100644
>>   --- a/net/disk_cache/simple/simple_index_file_posix.cc
>>   +++ b/net/disk_cache/simple/simple_index_file_posix.cc
>>   @@ -34,8 +34,12 @@ bool SimpleIndexFile::TraverseCacheDirectory(
>> @@ -78,10 +77,10 @@ index 586699d..bbe81fc 100644
>>    }
>>    
>>   diff --git a/sandbox/linux/services/proc_util.cc b/sandbox/linux/services/proc_util.cc
>> -index 8341b4a..1603415 100644
>> +index b6d58de..3c7bb84 100644
>>   --- a/sandbox/linux/services/proc_util.cc
>>   +++ b/sandbox/linux/services/proc_util.cc
>> -@@ -50,15 +50,18 @@ int ProcUtil::CountOpenFds(int proc_fd) {
>> +@@ -51,15 +51,18 @@ int ProcUtil::CountOpenFds(int proc_fd) {
>>      CHECK(dir);
>>    
>>      int count = 0;
>> @@ -104,7 +103,7 @@ index 8341b4a..1603415 100644
>>        if (fd_num == proc_fd || fd_num == proc_self_fd) {
>>          continue;
>>        }
>> -@@ -80,22 +83,25 @@ bool ProcUtil::HasOpenDirectory(int proc_fd) {
>> +@@ -81,22 +84,25 @@ bool ProcUtil::HasOpenDirectory(int proc_fd) {
>>      ScopedDIR dir(fdopendir(proc_self_fd));
>>      CHECK(dir);
>>    
>> @@ -135,59 +134,8 @@ index 8341b4a..1603415 100644
>>        if (S_ISDIR(s.st_mode)) {
>>          return true;
>>        }
>> -diff --git a/third_party/boringssl/src/crypto/directory_posix.c b/third_party/boringssl/src/crypto/directory_posix.c
>> -index b944b69..17143a7 100644
>> ---- a/third_party/boringssl/src/crypto/directory_posix.c
>> -+++ b/third_party/boringssl/src/crypto/directory_posix.c
>> -@@ -24,10 +24,6 @@
>> -  * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
>> -  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. */
>> -
>> --#if !defined(_POSIX_C_SOURCE)
>> --#define _POSIX_C_SOURCE 201409  /* for readdir_r */
>> --#endif
>> --
>> - #include "directory.h"
>> -
>> -
>> -@@ -38,21 +34,6 @@
>> - #include <stdlib.h>
>> - #include <string.h>
>> -
>> --#if defined(OPENSSL_PNACL)
>> --/* pnacl doesn't include readdir_r! So we do the best we can. */
>> --int readdir_r(DIR *dirp, struct dirent *entry, struct dirent **result) {
>> --  errno = 0;
>> --  *result = readdir(dirp);
>> --  if (*result != NULL) {
>> --    return 0;
>> --  }
>> --  if (errno) {
>> --    return 1;
>> --  }
>> --  return 0;
>> --}
>> --#endif
>> --
>> - struct OPENSSL_dir_context_st {
>> -   DIR *dir;
>> -   struct dirent dirent;
>> -@@ -85,10 +66,10 @@ const char *OPENSSL_DIR_read(OPENSSL_DIR_CTX **ctx, const char *directory) {
>> -     }
>> -   }
>> -
>> --  if (readdir_r((*ctx)->dir, &(*ctx)->dirent, &dirent) != 0 ||
>> --      dirent == NULL) {
>> -+  errno = 0;
>> -+  dirent = readdir((*ctx)->dir);
>> -+  if (dirent == NULL || errno != 0)
>> -     return 0;
>> --  }
>> -
>> -   return (*ctx)->dirent.d_name;
>> - }
>>   diff --git a/third_party/crashpad/crashpad/util/posix/close_multiple.cc b/third_party/crashpad/crashpad/util/posix/close_multiple.cc
>> -index d94d575..4c1287a 100644
>> +index fea7ca0..0b23b83 100644
>>   --- a/third_party/crashpad/crashpad/util/posix/close_multiple.cc
>>   +++ b/third_party/crashpad/crashpad/util/posix/close_multiple.cc
>>   @@ -100,10 +100,14 @@ bool CloseMultipleNowOrOnExecUsingFDDir(int fd, int preserve_fd) {
>> @@ -208,10 +156,10 @@ index d94d575..4c1287a 100644
>>        if (strcmp(entry_name, ".") == 0 || strcmp(entry_name, "..") == 0) {
>>          continue;
>>   diff --git a/third_party/leveldatabase/env_chromium.cc b/third_party/leveldatabase/env_chromium.cc
>> -index 939534c..f23142e 100644
>> +index 200a12a..4b5d86c 100644
>>   --- a/third_party/leveldatabase/env_chromium.cc
>>   +++ b/third_party/leveldatabase/env_chromium.cc
>> -@@ -79,10 +79,17 @@ static base::File::Error GetDirectoryEntries(const FilePath& dir_param,
>> +@@ -82,10 +82,17 @@ static base::File::Error GetDirectoryEntries(const FilePath& dir_param,
>>      DIR* dir = opendir(dir_string.c_str());
>>      if (!dir)
>>        return base::File::OSErrorToFileError(errno);
>> @@ -233,5 +181,5 @@ index 939534c..f23142e 100644
>>          continue;
>>        result->push_back(FilePath::FromUTF8Unsafe(dent->d_name));
>>   --
>> -2.7.4
>> +2.1.4
>>   
>> diff --git a/recipes-browser/chromium/chromium/chromium-wayland/add_missing_stat_h_include.patch b/recipes-browser/chromium/chromium/chromium-wayland/add_missing_stat_h_include.patch
>> index 4620db2..5cd0bce 100644
>> --- a/recipes-browser/chromium/chromium/chromium-wayland/add_missing_stat_h_include.patch
>> +++ b/recipes-browser/chromium/chromium/chromium-wayland/add_missing_stat_h_include.patch
>> @@ -34,6 +34,6 @@ Upstream-Status: Pending
>>    #include <mntent.h>
>>    #include <stdio.h>
>>   +#include <sys/stat.h>
>> -
>> + #include <limits>
>>    #include <list>
>>    
>> diff --git a/recipes-browser/chromium/chromium/chromium-wayland/guard-x11_desktop_handler-inclusion.patch b/recipes-browser/chromium/chromium/chromium-wayland/guard-x11_desktop_handler-inclusion.patch
>> new file mode 100644
>> index 0000000..8c1e268
>> --- /dev/null
>> +++ b/recipes-browser/chromium/chromium/chromium-wayland/guard-x11_desktop_handler-inclusion.patch
>> @@ -0,0 +1,13 @@
>> +diff --git a/chrome/browser/ui/startup/startup_browser_creator.cc b/chrome/browser/ui/startup/startup_browser_creator.cc
>> +index e9899b0..f9103d0 100644
>> +--- a/chrome/browser/ui/startup/startup_browser_creator.cc
>> ++++ b/chrome/browser/ui/startup/startup_browser_creator.cc
>> +@@ -101,7 +101,7 @@
>> + #include "chrome/browser/metrics/jumplist_metrics_win.h"
>> + #endif
>> +
>> +-#if defined(OS_LINUX) && !defined(OS_CHROMEOS)
>> ++#if defined(OS_LINUX) && !defined(OS_CHROMEOS) && defined(USE_X11)
>> + #include "ui/views/widget/desktop_aura/x11_desktop_handler.h"
>> + #endif
>> +
>> diff --git a/recipes-browser/chromium/chromium/chromium-wayland/remove-Werror.patch b/recipes-browser/chromium/chromium/chromium-wayland/remove-Werror.patch
>> index 2d1842b..a0c9090 100644
>> --- a/recipes-browser/chromium/chromium/chromium-wayland/remove-Werror.patch
>> +++ b/recipes-browser/chromium/chromium/chromium-wayland/remove-Werror.patch
>> @@ -1,8 +1,19 @@
>> -Index: chromium-48.0.2548.0/build/common.gypi
>> -===================================================================
>> ---- chromium-48.0.2548.0.orig/build/common.gypi
>> -+++ chromium-48.0.2548.0/build/common.gypi
>> -@@ -1421,7 +1421,7 @@
>> +From 5fd704f9bf70acaf63fb5611494c3373709c39e7 Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Jacobo=20Aragunde=20P=C3=A9rez?= <jaragunde@igalia.com>
>> +Date: Wed, 30 Nov 2016 13:49:06 +0100
>> +Subject: [PATCH 1/1] remove -Werror
>> +
>> +---
>> + build/common.gypi              | 14 ++++----------
>> + build/config/compiler/BUILD.gn |  3 ---
>> + build/nocompile.gypi           |  2 +-
>> + 3 files changed, 5 insertions(+), 14 deletions(-)
>> +
>> +diff --git a/build/common.gypi b/build/common.gypi
>> +index 5dc14c7..ac559f6 100644
>> +--- a/build/common.gypi
>> ++++ b/build/common.gypi
>> +@@ -1431,7 +1431,7 @@
>>    
>>        # Disable fatal linker warnings, similarly to how we make it possible
>>        # to disable -Werror (e.g. for different toolchain versions).
>> @@ -11,9 +22,9 @@ Index: chromium-48.0.2548.0/build/common.gypi
>>    
>>        'release_valgrind_build%': 0,
>>    
>> -@@ -3135,12 +3135,6 @@
>> -               '-Wsign-compare',
>> -             ]
>> +@@ -3052,12 +3052,6 @@
>> +             # third-party code either.
>> +             'cflags!': [ '-Wall' ],
>>              }],
>>   -          # TODO: Fix all warnings on chromeos too.
>>   -          [ 'os_posix==1 and OS!="mac" and OS!="ios" and (clang!=1 or chromeos==1)', {
>> @@ -21,10 +32,10 @@ Index: chromium-48.0.2548.0/build/common.gypi
>>   -              '-Werror',
>>   -            ],
>>   -          }],
>> -           [ 'os_posix==1 and os_bsd!=1 and OS!="mac" and OS!="android"', {
>> -             'cflags': [
>> -               # Don't warn about ignoring the return value from e.g. close().
>> -@@ -3692,10 +3686,10 @@
>> +           [ 'OS=="win"', {
>> +             'defines': [
>> +               '_CRT_SECURE_NO_DEPRECATE',
>> +@@ -3593,10 +3587,10 @@
>>        }],
>>        ['os_posix==1 and OS!="mac" and OS!="ios"', {
>>          'target_defaults': {
>> @@ -35,34 +46,36 @@ Index: chromium-48.0.2548.0/build/common.gypi
>>   -          'werror%': '-Werror',
>>   +          'werror%': '',
>>              'libraries_for_target%': '',
>> -         },
>> -         'defines': [
>> -@@ -5045,7 +5039,7 @@
>> +           'conditions' : [
>> +             # Enable -Wextra for chromium_code when we control the compiler.
>> +@@ -5062,7 +5056,7 @@
>>              'GCC_OBJC_CALL_CXX_CDTORS': 'YES',        # -fobjc-call-cxx-cdtors
>>              'GCC_SYMBOLS_PRIVATE_EXTERN': 'YES',      # -fvisibility=hidden
>>              'GCC_THREADSAFE_STATICS': 'NO',           # -fno-threadsafe-statics
>>   -          'GCC_TREAT_WARNINGS_AS_ERRORS': 'YES',    # -Werror
>> -+          'GCC_TREAT_WARNINGS_AS_ERRORS': 'NO',     # -Werror
>> -           'GCC_VERSION': '4.2',
>> -           'GCC_WARN_ABOUT_MISSING_NEWLINE': 'YES',  # -Wnewline-eof
>> ++          'GCC_TREAT_WARNINGS_AS_ERRORS': 'NO',    # -Werror
>> +           'GCC_VERSION': 'com.apple.compilers.llvm.clang.1_0',
>>              'USE_HEADERMAP': 'NO',
>> -Index: chromium-48.0.2548.0/build/config/compiler/BUILD.gn
>> -===================================================================
>> ---- chromium-48.0.2548.0.orig/build/config/compiler/BUILD.gn
>> -+++ chromium-48.0.2548.0/build/config/compiler/BUILD.gn
>> -@@ -687,7 +687,6 @@ config("default_warnings") {
>> -     cflags += [
>> -       # Enables.
>> -       "-Wendif-labels",  # Weird old-style text after an #endif.
>> --      "-Werror",  # Warnings as errors.
>> -
>> -       # Disables.
>> -       "-Wno-missing-field-initializers",  # "struct foo f = {0};"
>> -Index: chromium-48.0.2548.0/build/nocompile.gypi
>> -===================================================================
>> ---- chromium-48.0.2548.0.orig/build/nocompile.gypi
>> -+++ chromium-48.0.2548.0/build/nocompile.gypi
>> -@@ -81,7 +81,7 @@
>> +           'WARNING_CFLAGS': [
>> +diff --git a/build/config/compiler/BUILD.gn b/build/config/compiler/BUILD.gn
>> +index 50ee2a6..a485eb6 100644
>> +--- a/build/config/compiler/BUILD.gn
>> ++++ b/build/config/compiler/BUILD.gn
>> +@@ -1039,9 +1039,6 @@ config("chromium_code") {
>> +     cflags = [ "/W4" ]  # Warning level 4.
>> +   } else {
>> +     cflags = [ "-Wall" ]
>> +-    if (treat_warnings_as_errors) {
>> +-      cflags += [ "-Werror" ]
>> +-    }
>> +     if (is_clang) {
>> +       # Enable -Wextra for chromium_code when we control the compiler.
>> +       cflags += [ "-Wextra" ]
>> +diff --git a/build/nocompile.gypi b/build/nocompile.gypi
>> +index 4f61add..7959fbd 100644
>> +--- a/build/nocompile.gypi
>> ++++ b/build/nocompile.gypi
>> +@@ -82,7 +82,7 @@
>>                '<(nocompile_driver)',
>>                '4', # number of compilers to invoke in parallel.
>>                '<(RULE_INPUT_PATH)',
>> @@ -71,3 +84,6 @@ Index: chromium-48.0.2548.0/build/nocompile.gypi
>>                '<(nc_result_path)',
>>                ],
>>              'message': 'Generating no compile results for <(RULE_INPUT_PATH)',
>> +--
>> +2.1.4
>> +
>> diff --git a/recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-CC-and-CXX.patch b/recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
>> index 7bc8d14..63de68a 100644
>> --- a/recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
>> +++ b/recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
>> @@ -21,7 +21,7 @@ diff --git a/build/common.gypi b/build/common.gypi
>>   index 7ec5ae2..11e8d1d 100644
>>   --- a/build/common.gypi
>>   +++ b/build/common.gypi
>> -@@ -6047,16 +6047,6 @@
>> +@@ -6027,16 +6027,6 @@
>>            ['CXX.host', '<(host_cxx)'],
>>          ],
>>        }],
>> @@ -35,9 +35,8 @@ index 7ec5ae2..11e8d1d 100644
>>   -        ['CXX.host', '<(host_cxx)'],
>>   -      ],
>>   -    }],
>> -     # TODO(yyanagisawa): supports GENERATOR==make
>> -     #  make generator doesn't support CC_wrapper without CC
>> -     #  in make_global_settings yet.
>> +     ['use_goma==1', {
>> +       'make_global_settings': [
>> +        ['CC_wrapper', '<(gomadir)/gomacc'],
>>   --
>> -1.9.1
>> -
>> +2.1.4
> 

