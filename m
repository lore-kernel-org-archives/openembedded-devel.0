Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 422E7756C5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 03:12:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8O3CWTB028185
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 20:12:32 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 23 Sep 2015 20:12:32 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Sep 2015 23:12:31 -0400
Message-ID: <1443064351-27254-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] squid: disable atomic operations for powerpc/mips
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Sep 2015 03:12:40 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Don't enable GNU atomic operations for all targets, it fails on
powerpc and mips:

  AtomicWord.h: undefined reference to `__sync_fetch_and_add_8'
  collect2: error: ld returned 1 exit status

Refer to https://gcc.gnu.org/bugzilla/show_bug.cgi?id=56300:

  There is no hardware support for 8 bytes atomic operations on
  32-bit MIPS targets.

The 32-bit PowerPC fails as well.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-networking/recipes-daemons/squid/squid_3.5.7.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
index 5d058dc..5b27d46 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
@@ -34,8 +34,11 @@ inherit autotools useradd ptest
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --no-create-home --home-dir /var/run/squid --shell /bin/false --user-group squid"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@base_contains('TARGET_ARCH', 'powerpc', 'noatomics', '', d)} \
+                   ${@base_contains('TARGET_ARCH', 'mips', 'noatomics', '', d)} \
+                  "
 PACKAGECONFIG[libnetfilter-conntrack] = "--with-netfilter-conntrack=${includedir}, --without-netfilter-conntrack, libnetfilter-conntrack"
+PACKAGECONFIG[noatomics] = "squid_cv_gnu_atomics=no,squid_cv_gnu_atomics=yes,,"
 
 BASIC_AUTH = "DB SASL LDAP NIS"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -43,7 +46,6 @@ BASIC_AUTH += "${@base_contains('DISTRO_FEATURES', 'pam', 'PAM', '', d)}"
 
 EXTRA_OECONF += "--with-default-user=squid --enable-auth-basic='${BASIC_AUTH}'"
 export BUILDCXXFLAGS="${BUILD_CXXFLAGS}"
-CACHED_CONFIGUREVARS += "squid_cv_gnu_atomics=yes"
 
 TESTDIR = "test-suite"
 do_compile_ptest() {
-- 
1.9.1


