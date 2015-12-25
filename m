Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6F41573182
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Dec 2015 07:56:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBP7uRW1028305
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 23:56:27 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 24 Dec 2015 23:56:27 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Dec 2015 15:56:23 +0800
Message-ID: <d3167274a2b06f563dad802436981d3b68a66a73.1451029460.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1451029460.git.jackie.huang@windriver.com>
References: <cover.1451029460.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 03/15] openjdk: autools not to override B var
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
X-List-Received-Date: Fri, 25 Dec 2015 07:56:26 -0000
Content-Type: text/plain

From: Amy Fong <amy.fong@windriver.com>

${B} is set before autotools and thus is overrided
by autotools.  Some of the patches within icedtea are
expected to be patched against ${S}/build (during
do_configure() phase).  As autotools to change B
= "${WORKDIR}/build", so this causes some patches failed
to apply and hence breaks do_configure() with the following
errors:

| patching file openjdk/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData.java
| can't find file to patch at input line 13
| Perhaps you used the wrong -p or --strip option?
| The text leading up to this was:
| --------------------------
| |---
| | build/openjdk/corba/make/common/shared/Defs-utils.gmk       |    6 +++---
| | build/openjdk/jdk/make/common/Demo.gmk                      |    2 +-
| | build/openjdk/jdk/make/common/Release.gmk                   |    2 +-
| | build/openjdk/jdk/make/common/internal/ImportComponents.gmk |    4 ++--
| | build/openjdk/jdk/make/common/shared/Defs-utils.gmk         |    6 +++---
| | build/openjdk/jdk/make/common/shared/Sanity.gmk             |    2 +-
| | build/openjdk/jdk/make/java/redist/Makefile                 |    4 ++--
| | 7 files changed, 13 insertions(+), 13 deletions(-)
| |
| |--- a/build/openjdk/corba/make/common/shared/Defs-utils.gmk
| |+++ b/build/openjdk/corba/make/common/shared/Defs-utils.gmk
| --------------------------
| File to patch:
| Skip this patch? [y]
| File to patch:
| Skip this patch? [y]
| Skipping patch.

Signed-off-by: Vu Tran <vu.tran@windriver.com>
Signed-off-by: Amy Fong <amy.fong@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/openjdk/openjdk-common.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-common.inc b/recipes-core/openjdk/openjdk-common.inc
index dc26522..6a72572 100644
--- a/recipes-core/openjdk/openjdk-common.inc
+++ b/recipes-core/openjdk/openjdk-common.inc
@@ -7,7 +7,6 @@ SECTION  = "libs"
 ICEDTEA_VERSION = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),d)[1].split("-")[1] or '1.0'}"
 
 S = "${WORKDIR}/${ICEDTEA}"
-B = "${S}/build"
 
 DEPENDS_append_libc-uclibc = " virtual/libiconv "
 
@@ -19,6 +18,8 @@ DEPENDS_append = " qemu-native "
 
 inherit java autotools gettext qemu pkgconfig
 
+B = "${S}/build"
+
 # OpenJDK uses slightly different names for certain arches. We need to know
 #	this to create some files which are expected by the build.
 def get_jdk_arch(d):
-- 
1.9.1


