Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F0D2B736B6
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 May 2016 07:01:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4771UPg027085
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sat, 7 May 2016 00:01:30 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 7 May 2016 00:01:29 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 7 May 2016 03:01:24 -0400
Message-ID: <1462604487-112658-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: koen.kooi@linaro.org
Subject: [PATCH V4 0/3] efivar: update to 0.23
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
X-List-Received-Date: Sat, 07 May 2016 07:01:35 -0000
Content-Type: text/plain

Changed in V4:

- Fix one failed with:
| install -d -m 755 efivar/0.23-r0/image/usr/lib/pkgconfig/
| install -m 644 efivar.pc efivar/0.23-r0/image/usr/lib/pkgconfig/
;  install -m 644 efiboot.pc efivar/0.23-r0/image/usr/lib/pkgconfig/
;
| install: cannot stat 'efivar.pc': No such file or directory
| install: cannot stat 'efiboot.pc': No such file or directory
| make[1]: *** [install] Error 1
| make[1]: Leaving directory `efivar/0.23-r0/git/src'
| make: *** [install] Error 2
| ERROR: oe_runmake failed

- Sync with latest upsteam
Hi Martin,

About your original build failed with:
| i586-oe-linux-gcc  -m32 -march=i586
--sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86
-O2 -pipe -g -feliminate-unused-debug-types
-fdebug-prefix-map=/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/efivar/0.23-r0/git=/usr/src/efivar
-fdebug-prefix-map=/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/efivar/0.23-r0/git=/usr/src/efivar
-fdebug-prefix-map=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux=
-fdebug-prefix-map=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86=
-I/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/efivar/0.23-r0/git/src/include/efivar/
-specs=/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/efivar/0.23-r0/git/gcc.specs
-L.  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed     -shared \
| 	  -Wl,-soname,libefivar.so.0 \
| 	  -o libefivar.so dp.o dp-acpi.o dp-hw.o dp-media.o dp-message.o
efivarfs.o export.o guid.o guids.o guid-symbols.o lib.o vars.o -ldl
|
/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/i586-oe-linux/gcc/i586-oe-linux/5.3.0/ld:
--default-symver: unknown option
|
/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/i586-oe-linux/gcc/i586-oe-linux/5.3.0/ld:
use the --help option for usage information
| collect2: error: ld returned 1 exit status
| make[1]: *** [libefivar.so] Error 1
| make[1]: *** Waiting for unfinished jobs....

I could not reproduce it, but from the log,
--default-symver is unknown option. And upstream
has fixed it in the following commit by removing option
'--default-symver' from gcc.specs
....
commit 975356c9486ff7fa0ec5534ef56cc6f519ad11b4
Author: Peter Jones <pjones@redhat.com>
Date:   Wed Mar 2 14:46:15 2016 -0500

    libefivar: get rid of our variadic mess in efi_set_variable()
....

//Hongxu


The following changes since commit a6c172e2713f0018c5ebac0f957cff28b7ac2630:

  poppler: add --std=c++11 to fix build with Qt 5.7 (2016-05-06 12:40:28 +0200)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-efivar
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-efivar

Hongxu Jia (1):
  efivar: fix do_install failed

Koen Kooi (2):
  efivar: update to 0.23
  efibootmgr: update and unblacklist

 .../recipes-extended/efibootmgr/efibootmgr_0.12.bb | 14 ++---
 .../efibootmgr/files/ldflags.patch                 | 17 ------
 .../efivar/0001-efivar-fix-for-cross-compile.patch | 28 +++++----
 .../efivar/efivar/0002-disable-static-build.patch  | 33 ++++++++++
 .../efivar/0003-efivar-fix-for-cross-compile.patch | 44 ++++++++++++++
 ...ptions-not-supported-by-lower-version-gcc.patch | 71 ----------------------
 .../efivar/{efivar_0.21.bb => efivar_0.23.bb}      | 28 ++++-----
 7 files changed, 114 insertions(+), 121 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/efibootmgr/files/ldflags.patch
 create mode 100644 meta-oe/recipes-extended/efivar/efivar/0002-disable-static-build.patch
 create mode 100644 meta-oe/recipes-extended/efivar/efivar/0003-efivar-fix-for-cross-compile.patch
 delete mode 100644 meta-oe/recipes-extended/efivar/efivar/efivar-drop-options-not-supported-by-lower-version-gcc.patch
 rename meta-oe/recipes-extended/efivar/{efivar_0.21.bb => efivar_0.23.bb} (46%)

-- 
2.8.1


