Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C8EC777F76
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 09:46:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v4M9kcpF014196
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 02:46:38 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 22 May 2017 02:46:38 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 22 May 2017 17:42:08 +0800
Message-ID: <1495446128-16379-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] opensaf: Add -latomic to LDFLAGS
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
X-List-Received-Date: Mon, 22 May 2017 09:46:42 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add "-Wl,--as-needed -latomic -Wl,--no-as-needed"
  to LDFLAGS to let the libatomic handled automatically
  if required to fix below build error as atomic
  operations on some arch such as x86 are supplied by
  the compiler. For other arch which lacks the instructions,
  a standardized external call provided by external library
  libatomic will be made to perform the operation.

  | src/amf/amfd/bin_osafamfd-main.o: In function `std::__atomic_base<unsigned long long>::load(std::memory_order) const':
  | $Prj/build/tmp/work/ppc7400-wrs-linux/opensaf/5.2.0-r0/recipe-sysroot/usr/include/c++/6.3.0/bits/atomic_base.h:396: undefined reference to `__atomic_load_8'
  | $Prj/build/tmp/work/ppc7400-wrs-linux/opensaf/5.2.0-r0/recipe-sysroot/usr/include/c++/6.3.0/bits/atomic_base.h:396: undefined reference to `__atomic_load_8'
  | collect2: error: ld returned 1 exit status
  | make[2]: *** [Makefile:8200: bin/osafamfd] Error 1
  | make[2]: *** Waiting for unfinished jobs....
  | make[2]: Leaving directory '$Prj/build/tmp/work/ppc7400-wrs-linux/opensaf/5.2.0-r0/build'
  | make[1]: *** [Makefile:19749: all-recursive] Error 1
  | make[1]: Leaving directory '$Prj/build/tmp/work/ppc7400-wrs-linux/opensaf/5.2.0-r0/build'
  | make: *** [Makefile:6175: all] Error 2

 Reference: https://gcc.gnu.org/wiki/Atomic/GCCMM/LIbrary#line-23

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-networking/recipes-daemons/opensaf/opensaf_5.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.2.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.2.0.bb
index babf03e..be79ba8 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.2.0.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.2.0.bb
@@ -43,6 +43,8 @@ PACKAGECONFIG_append = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' sys
 
 PKGLIBDIR="${libdir}"
 
+LDFLAGS += "-Wl,--as-needed -latomic -Wl,--no-as-needed"
+
 do_install_append() {
     cp -av --no-preserve=ownership ${B}/lib/.libs/*.so* ${D}${libdir}
     rm -fr "${D}${localstatedir}/lock"
-- 
2.8.1


